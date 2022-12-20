From: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 5/8] reiserfs: Convert do_journal_end() to use
 kmap_local_folio()
Date: Tue, 20 Dec 2022 15:59:39 -0800
Message-ID: <Y6JMazsjbPRJ7oMM@iweiny-desk3>
References: <20221216205348.3781217-1-willy@infradead.org>
 <20221216205348.3781217-6-willy@infradead.org>
 <Y55WUrzblTsw6FfQ@iweiny-mobl>
 <Y6GB75HMEKfcGcsO@casper.infradead.org>
 <20221220111801.jhukawk3lbuonxs3@quack3>
 <Y6HpzAFNA33jQ3bl@iweiny-desk3>
 <Y6IAUetp7nihz9Qu@casper.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671580792; x=1703116792;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ec4f5IFKTUREx8aRfG8i8QDuiFk7WX5XgaBTdN8GbD4=;
  b=iKlD1kunp7STr0mVCIgSJGkdplwaliQn27HbPQESh6sModtie22Dgaah
   B2+zUEePuAFdbI1e5IGAiG+R1sNS3kOsdjJn2F5A3p9+yZl5f5WgKxsad
   mbxGawKMKzGbVwh9kPXT47090AyujUT+tj3mkGgKu9QtlDqglrDefhZwd
   Xn2TvZ4xP3Qp8C0cYVjkGewlxt+apoQAP1hBSm3jNmVDFX817ORg0VU4+
   jIUskNy2cyqzn0zk1TYbMdYD+xFHVENdAEzxxx32rFilbvTt6LJ8/s+5R
   YC0+GE3fuaOARcZX1BZ0SyyryTE9LJhgGDyxSsj3gd3bfgmJ4PlJ24f82
   A==;
Content-Disposition: inline
In-Reply-To: <Y6IAUetp7nihz9Qu@casper.infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>
Cc: Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>

On Tue, Dec 20, 2022 at 06:34:57PM +0000, Matthew Wilcox wrote:
> On Tue, Dec 20, 2022 at 08:58:52AM -0800, Ira Weiny wrote:
> > On Tue, Dec 20, 2022 at 12:18:01PM +0100, Jan Kara wrote:
> > > On Tue 20-12-22 09:35:43, Matthew Wilcox wrote:
> > > > But that doesn't solve the "What about fs block size > PAGE_SIZE"
> > > > problem that we also want to solve.  Here's a concrete example:
> > > > 
> > > >  static __u32 jbd2_checksum_data(__u32 crc32_sum, struct buffer_head *bh)
> > > >  {
> > > > -       struct page *page = bh->b_page;
> > > > +       struct folio *folio = bh->b_folio;
> > > >         char *addr;
> > > >         __u32 checksum;
> > > >  
> > > > -       addr = kmap_atomic(page);
> > > > -       checksum = crc32_be(crc32_sum,
> > > > -               (void *)(addr + offset_in_page(bh->b_data)), bh->b_size);
> > > > -       kunmap_atomic(addr);
> > > > +       BUG_ON(IS_ENABLED(CONFIG_HIGHMEM) && bh->b_size > PAGE_SIZE);
> > > > +
> > > > +       addr = kmap_local_folio(folio, offset_in_folio(folio, bh->b_data));
> > > > +       checksum = crc32_be(crc32_sum, addr, bh->b_size);
> > > > +       kunmap_local(addr);
> > > >  
> > > >         return checksum;
> > > >  }
> > > > 
> > > > I don't want to add a lot of complexity to handle the case of b_size >
> > > > PAGE_SIZE on a HIGHMEM machine since that's not going to benefit terribly
> > > > many people.  I'd rather have the assertion that we don't support it.
> > > > But if there's a good higher-level abstraction I'm missing here ...
> > > 
> > > Just out of curiosity: So far I was thinking folio is physically contiguous
> > > chunk of memory. And if it is, then it does not seem as a huge overkill if
> > > kmap_local_folio() just maps the whole folio?
> > 
> > Willy proposed that previously but we could not come to a consensus on how to
> > do it.
> > 
> > https://lore.kernel.org/all/Yv2VouJb2pNbP59m@iweiny-desk3/
> > 
> > FWIW I still think increasing the entries to cover any foreseeable need would
> > be sufficient because HIGHMEM does not need to be optimized.  Couldn't we hide
> > the entry count into some config option which is only set if a FS needs a
> > larger block size on a HIGHMEM system?
> 
> "any foreseeable need"?  I mean ... I'd like to support 2MB folios,
> even on HIGHMEM machines, and that's 512 entries.  If we're doing
> memcpy_to_folio(), we know that's only one mapping, but still, 512
> entries is _a lot_ of address space to be reserving on a 32-bit machine.

I'm confused.  A memcpy_to_folio() could loop to map the pages as needed
depending on the amount of data to copy.  Or just map/unmap in a loop.

This seems like an argument to have a memcpy_to_folio() to hide such nastiness
on HIGHMEM from the user.

> I don't know exactly what the address space layout is on x86-PAE or
> ARM-PAE these days, but as I recall, the low 3GB is user and the high
> 1GB is divided between LOWMEM and VMAP space; something like 800MB of
> LOWMEM and 200MB of vmap/kmap/PCI iomem/...
> 
> Where I think we can absolutely get away with this reasoning is having
> a kmap_local_buffer().  It's perfectly reasonable to restrict fs block
> size to 64kB (after all, we've been limiting it to 4kB on x86 for thirty
> years), and having a __kmap_local_pfns(pfn, n, prot) doesn't seem like
> a terribly bad idea to me.
> 
> So ... is this our path forward:
> 
>  - Introduce a complex memcpy_to/from_folio() in highmem.c that mirrors
>    zero_user_segments()
>  - Have a simple memcpy_to/from_folio() in highmem.h that mirrors
>    zero_user_segments()

I'm confused again.  What is the difference between the complex/simple other
than inline vs not?

>  - Convert __kmap_local_pfn_prot() to __kmap_local_pfns()

I'm not sure I follow this need but I think you are speaking of having the
mapping of multiple pages in a tight loop in the preemption disabled region?

Frankly, I think this is an over optimization for HIGHMEM.  Just loop calling
kmap_local_page() (either with or without an unmap depending on the details.)

>  - Add kmap_local_buffer() that can handle buffer_heads up to, say, 16x
>    PAGE_SIZE

I really just don't know the details of the various file systems.[*]  Is this
something which could be hidden in Kconfig magic and just call this
kmap_local_folio()?

My gut says that HIGHMEM systems don't need large block size FS's.  So could
large block size FS's be limited to !HIGHMEM configs?

Ira

[*] I only play a file system developer on TV.  ;-)
