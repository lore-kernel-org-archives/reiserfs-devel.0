From: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 3/8] reiserfs: Convert direct2indirect() to call
 folio_zero_range()
Date: Sat, 17 Dec 2022 13:08:49 -0800
Message-ID: <Y54v4TYAT/nGd8WA@iweiny-mobl>
References: <20221216205348.3781217-1-willy@infradead.org>
 <20221216205348.3781217-4-willy@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671311341; x=1702847341;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=dgtx/CX3T7J7wIOTm1h0hsUaAGsN9FOjFPXuQGLgHgQ=;
  b=WvVKeBo+HUwuOtwnQ1u9oBECbki5ogu5JRQgnnXtXjfpgqMkw+9BrEmr
   0phG1Bru4OCwwZl0pbDCy6GlEm9RxPQHAoM9SoSSKJuYf4VNKVamcGhJ0
   mode+0XIndC4HVmex0hTG/MP1b0q/TZEl+eJ4B49+QglFNxBUY6K3nIgZ
   3kXFTF8SW66aYzIY669OtE1cvbF82kYXhm7KW/Fwq5X9FYSqws8tTF4vB
   szPdEy8OzP1h86+B9gIOiko9o8ok3o/+b46nupvjRVSkXSIWnlXuH+ztv
   BX/XrD/zDgyyHCyG13Pkk1d+cWzHECOos7iM9x7nFnHjiE/CgAkS+nbg7
   g==;
Content-Disposition: inline
In-Reply-To: <20221216205348.3781217-4-willy@infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>

On Fri, Dec 16, 2022 at 08:53:42PM +0000, Matthew Wilcox (Oracle) wrote:
> Remove this open-coded call to kmap()/memset()/kunmap() with the
> higher-level abstraction folio_zero_range().
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

LGTM

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  fs/reiserfs/tail_conversion.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/reiserfs/tail_conversion.c b/fs/reiserfs/tail_conversion.c
> index a61bca73c45f..ca36bb88b8b0 100644
> --- a/fs/reiserfs/tail_conversion.c
> +++ b/fs/reiserfs/tail_conversion.c
> @@ -151,11 +151,11 @@ int direct2indirect(struct reiserfs_transaction_handle *th, struct inode *inode,
>  	 * out the unused part of the block (it was not up to date before)
>  	 */
>  	if (up_to_date_bh) {
> -		unsigned pgoff =
> -		    (tail_offset + total_tail - 1) & (PAGE_SIZE - 1);
> -		char *kaddr = kmap_atomic(up_to_date_bh->b_page);
> -		memset(kaddr + pgoff, 0, blk_size - total_tail);
> -		kunmap_atomic(kaddr);
> +		size_t start = offset_in_folio(up_to_date_bh->b_folio,
> +					(tail_offset + total_tail - 1));
> +
> +		folio_zero_range(up_to_date_bh->b_folio, start,
> +				blk_size - total_tail);
>  	}
>  
>  	REISERFS_I(inode)->i_first_direct_byte = U32_MAX;
> -- 
> 2.35.1
> 
