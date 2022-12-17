From: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 5/8] reiserfs: Convert do_journal_end() to use
 kmap_local_folio()
Date: Sat, 17 Dec 2022 15:52:50 -0800
Message-ID: <Y55WUrzblTsw6FfQ@iweiny-mobl>
References: <20221216205348.3781217-1-willy@infradead.org>
 <20221216205348.3781217-6-willy@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671321176; x=1702857176;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8e4OHvTcjKoq7caHteBf5fXQwMifysA3N5itboT7r/c=;
  b=B0Zg/7/4JOpaeWYgZHnIiwXXhnb5uKnWgQDwoq2ZY7Di+RYwuRBaqITL
   v7Y5S00cgSMJW6GdtRiXNncgQtKhFBPJw0xrSoCmeQhVQcTwxxAS+sovr
   d4a/wa/fjk86b2P7zTAMoh5h+AiCS/BDvgnhpLrBkkMy6v5CiXu9nsY9L
   /fAI/jH4Y+rWKdx21iVujOvAA4/oHu15m7UV0wng6sdSPzJxzdaBchypY
   1glN7IKOem4eCNPnOkZKzJgaKmhnG0WMKqVzqcTKJpBs9qO9YZQtrv6uj
   Dh6lp5Cv5sMJFnYKbCtKtc2GA2EWnrggrY2F8Wzc4Z1tZzOwjX2AmSWwL
   A==;
Content-Disposition: inline
In-Reply-To: <20221216205348.3781217-6-willy@infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>

On Fri, Dec 16, 2022 at 08:53:44PM +0000, Matthew Wilcox (Oracle) wrote:
> Remove uses of kmap() and b_page.  Also move the set_buffer_uptodate()
> call to after the memcpy() so that the memory barrier in
> set_buffer_uptodate() actually ensures that the old data can't be visible.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/reiserfs/journal.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> index 9ce4ec296b74..faf2f09d82e1 100644
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -4200,21 +4200,19 @@ static int do_journal_end(struct reiserfs_transaction_handle *th, int flags)
>  		/* copy all the real blocks into log area.  dirty log blocks */
>  		if (buffer_journaled(cn->bh)) {
>  			struct buffer_head *tmp_bh;
> +			size_t offset = offset_in_folio(cn->bh->b_folio,
> +							cn->bh->b_data);
>  			char *addr;
> -			struct page *page;
>  			tmp_bh =
>  			    journal_getblk(sb,
>  					   SB_ONDISK_JOURNAL_1st_BLOCK(sb) +
>  					   ((cur_write_start +
>  					     jindex) %
>  					    SB_ONDISK_JOURNAL_SIZE(sb)));
> +			addr = kmap_local_folio(cn->bh->b_folio, offset);
> +			memcpy(tmp_bh->b_data, addr, cn->bh->b_size);
> +			kunmap_local(addr);

I think we should have a memcpy_{to|from}_folio() like we do for the pages.

Did I miss this in the earlier patch?

Ira

>  			set_buffer_uptodate(tmp_bh);
> -			page = cn->bh->b_page;
> -			addr = kmap(page);
> -			memcpy(tmp_bh->b_data,
> -			       addr + offset_in_page(cn->bh->b_data),
> -			       cn->bh->b_size);
> -			kunmap(page);
>  			mark_buffer_dirty(tmp_bh);
>  			jindex++;
>  			set_buffer_journal_dirty(cn->bh);
> -- 
> 2.35.1
> 
