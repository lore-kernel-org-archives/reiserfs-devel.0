From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 5/8] reiserfs: Convert do_journal_end() to use
 kmap_local_folio()
Date: Tue, 20 Dec 2022 12:18:01 +0100
Message-ID: <20221220111801.jhukawk3lbuonxs3@quack3>
References: <20221216205348.3781217-1-willy@infradead.org>
 <20221216205348.3781217-6-willy@infradead.org>
 <Y55WUrzblTsw6FfQ@iweiny-mobl>
 <Y6GB75HMEKfcGcsO@casper.infradead.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1671535081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lFzpR3ITDH29coyW0R/YQvOd5YVJvu4hwuDQhKVr1dc=;
        b=Vh3OgJ3l3canONyLvqymtEPjSWpPWNY7ld/EuleZo2lQgBk8j2gYPhm92i1LM6pjciB0jq
        4U97lQn50BuxXa/Gewbuxa6VMwmelY7sCQsd81KDvzgvjg4Dry+l8JWZQO5Y6McEzHXS4f
        hKwvUGiHAiFNgyw0r5u+fKUO6VM9uX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1671535081;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lFzpR3ITDH29coyW0R/YQvOd5YVJvu4hwuDQhKVr1dc=;
        b=M0FaHbmOtv8X+d3hOcyF0AmbEX9CgGWXZrGvBpdOIiF2JhOY8WqG7l8AiHUtkapH4cE3TV
        yRS7EuIS5mrzl5Dg==
Content-Disposition: inline
In-Reply-To: <Y6GB75HMEKfcGcsO@casper.infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>, reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>

On Tue 20-12-22 09:35:43, Matthew Wilcox wrote:
> But that doesn't solve the "What about fs block size > PAGE_SIZE"
> problem that we also want to solve.  Here's a concrete example:
> 
>  static __u32 jbd2_checksum_data(__u32 crc32_sum, struct buffer_head *bh)
>  {
> -       struct page *page = bh->b_page;
> +       struct folio *folio = bh->b_folio;
>         char *addr;
>         __u32 checksum;
>  
> -       addr = kmap_atomic(page);
> -       checksum = crc32_be(crc32_sum,
> -               (void *)(addr + offset_in_page(bh->b_data)), bh->b_size);
> -       kunmap_atomic(addr);
> +       BUG_ON(IS_ENABLED(CONFIG_HIGHMEM) && bh->b_size > PAGE_SIZE);
> +
> +       addr = kmap_local_folio(folio, offset_in_folio(folio, bh->b_data));
> +       checksum = crc32_be(crc32_sum, addr, bh->b_size);
> +       kunmap_local(addr);
>  
>         return checksum;
>  }
> 
> I don't want to add a lot of complexity to handle the case of b_size >
> PAGE_SIZE on a HIGHMEM machine since that's not going to benefit terribly
> many people.  I'd rather have the assertion that we don't support it.
> But if there's a good higher-level abstraction I'm missing here ...

Just out of curiosity: So far I was thinking folio is physically contiguous
chunk of memory. And if it is, then it does not seem as a huge overkill if
kmap_local_folio() just maps the whole folio? Or are you concerned about
the overhead of finding big enough hole in the vmap area?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
