From: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 2/8] reiserfs: use kmap_local_folio() in
 _get_block_create_0()
Date: Sat, 17 Dec 2022 09:14:05 -0800
Message-ID: <Y5343RPkHRdIkR9a@iweiny-mobl>
References: <20221216205348.3781217-1-willy@infradead.org>
 <20221216205348.3781217-3-willy@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671297251; x=1702833251;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=T742U631P5R/7Sstc2JOA7hhkZJl2kAlvUpHW6NAwsM=;
  b=GeCfhQftAjOa0Xxn8dU6iWkzs0XfGKCLNslL5VTkqnSqAGKH8ESAEAW7
   FCDze/uYt5vNaR6oC0q7evjmjh1AnWYPEqJ380ccyU8FX4OLVQYdhLRiH
   t/2qr2LBgM4Ug1nH9Zy3ywz/M4tVqVIXxfmorKxBD1+HL/DeUaDGAe5Pk
   xz/M+JZAE1UMa5I4vNi8HY8nRuwn6ViNM8FXLmbUP2FxFhx5WkWruSbsG
   M9hVY0+z8xA87C1vX3ih3reIQbk5RNeZogeMDojpxTW5Uwpd01euMxPag
   p8+mi2H7ky/NGuGzHuBMT1CNf3uJndkNI12A7Dx96O2KH0HQDZgpolG9J
   w==;
Content-Disposition: inline
In-Reply-To: <20221216205348.3781217-3-willy@infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>

On Fri, Dec 16, 2022 at 08:53:41PM +0000, Matthew Wilcox (Oracle) wrote:
> Switch from the deprecated kmap() to kmap_local_folio().  For the
> kunmap_local(), I subtract off 'chars' to prevent the possibility that
> p has wrapped into the next page.

Thanks for tackling this one.  I think the conversion is mostly safe because I
don't see any reason the mapping is passed to another thread.

But comments like this make me leary:

         "But, this means the item might move if kmap schedules"

What does that mean?  That seems to imply there is something wrong with the
base code separate from the kmapping.

To the patch, I think subtracting chars might be an issue.  If chars > offset
and the loop takes the first 'if (done) break;' path then p will end up
pointing at the previous page wouldn't it?

Perhaps it is just safer to store the base pointer in this case?

Ira

> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/reiserfs/inode.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
> index 41c0a785e9ab..0ca2d439510a 100644
> --- a/fs/reiserfs/inode.c
> +++ b/fs/reiserfs/inode.c
> @@ -390,8 +390,7 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
>  	 * sure we need to.  But, this means the item might move if
>  	 * kmap schedules
>  	 */
> -	p = (char *)kmap(bh_result->b_page);
> -	p += offset;
> +	p = kmap_local_folio(bh_result->b_folio, offset);
>  	memset(p, 0, inode->i_sb->s_blocksize);
>  	do {
>  		if (!is_direct_le_ih(ih)) {
> @@ -439,8 +438,8 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
>  		ih = tp_item_head(&path);
>  	} while (1);
>  
> -	flush_dcache_page(bh_result->b_page);
> -	kunmap(bh_result->b_page);
> +	flush_dcache_folio(bh_result->b_folio);
> +	kunmap_local(p - chars);
>  
>  finished:
>  	pathrelse(&path);
> -- 
> 2.35.1
> 
