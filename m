From: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 5/8] reiserfs: Convert do_journal_end() to use
 kmap_local_folio()
Date: Tue, 20 Dec 2022 08:58:52 -0800
Message-ID: <Y6HpzAFNA33jQ3bl@iweiny-desk3>
References: <20221216205348.3781217-1-willy@infradead.org>
 <20221216205348.3781217-6-willy@infradead.org>
 <Y55WUrzblTsw6FfQ@iweiny-mobl>
 <Y6GB75HMEKfcGcsO@casper.infradead.org>
 <20221220111801.jhukawk3lbuonxs3@quack3>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671555542; x=1703091542;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=rW9X1oxUj2wffGBugp9bhcRfrdMa3tFdhW91yoE5G+A=;
  b=nhgAGPcxUvHp3rO6ai+X4Fp8yXUo5vplvkx8qaP+31pblf4CJwEvN4uy
   FWPmMO/OzSCfyEVyA/zJVYsl/wsWpX6NNUVr5TuY1DVHFUavVb7j2obFv
   fzFoJdYIfTGJd2xv6aI4DS1N5gmSSqXQBFSH6jY2X8Bt0QAXq740b+rVg
   yoHYbQsgBWUI1NJ9+6jArwtthLaZ3+BLL+S/Bo8caGrJASmMaZmuGt3O7
   09h15brh70Pz/qMK391J9Oe+f/4a+nuhHLAmViff+5QE4lpU5xlfKnIia
   Bl1a4ygagtVJ8c/tZMh+LY1DEgRPUTdkw3v4attDLFoN94oEFOymiCrny
   w==;
Content-Disposition: inline
In-Reply-To: <20221220111801.jhukawk3lbuonxs3@quack3>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>, reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>

On Tue, Dec 20, 2022 at 12:18:01PM +0100, Jan Kara wrote:
> On Tue 20-12-22 09:35:43, Matthew Wilcox wrote:
> > But that doesn't solve the "What about fs block size > PAGE_SIZE"
> > problem that we also want to solve.  Here's a concrete example:
> > 
> >  static __u32 jbd2_checksum_data(__u32 crc32_sum, struct buffer_head *bh)
> >  {
> > -       struct page *page = bh->b_page;
> > +       struct folio *folio = bh->b_folio;
> >         char *addr;
> >         __u32 checksum;
> >  
> > -       addr = kmap_atomic(page);
> > -       checksum = crc32_be(crc32_sum,
> > -               (void *)(addr + offset_in_page(bh->b_data)), bh->b_size);
> > -       kunmap_atomic(addr);
> > +       BUG_ON(IS_ENABLED(CONFIG_HIGHMEM) && bh->b_size > PAGE_SIZE);
> > +
> > +       addr = kmap_local_folio(folio, offset_in_folio(folio, bh->b_data));
> > +       checksum = crc32_be(crc32_sum, addr, bh->b_size);
> > +       kunmap_local(addr);
> >  
> >         return checksum;
> >  }
> > 
> > I don't want to add a lot of complexity to handle the case of b_size >
> > PAGE_SIZE on a HIGHMEM machine since that's not going to benefit terribly
> > many people.  I'd rather have the assertion that we don't support it.
> > But if there's a good higher-level abstraction I'm missing here ...
> 
> Just out of curiosity: So far I was thinking folio is physically contiguous
> chunk of memory. And if it is, then it does not seem as a huge overkill if
> kmap_local_folio() just maps the whole folio?

Willy proposed that previously but we could not come to a consensus on how to
do it.

https://lore.kernel.org/all/Yv2VouJb2pNbP59m@iweiny-desk3/

FWIW I still think increasing the entries to cover any foreseeable need would
be sufficient because HIGHMEM does not need to be optimized.  Couldn't we hide
the entry count into some config option which is only set if a FS needs a
larger block size on a HIGHMEM system?

Ira

> Or are you concerned about
> the overhead of finding big enough hole in the vmap area?
> 
> 								Honza
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
