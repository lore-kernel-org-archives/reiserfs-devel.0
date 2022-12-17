From: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 4/8] reiserfs: Convert reiserfs_delete_item() to use
 kmap_local_folio()
Date: Sat, 17 Dec 2022 15:44:37 -0800
Message-ID: <Y55UZQsd9xprpdou@iweiny-mobl>
References: <20221216205348.3781217-1-willy@infradead.org>
 <20221216205348.3781217-5-willy@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671320684; x=1702856684;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qFrml31+2ckFppLsI9PGkZ1l9flWL6M2umQjADMpsfc=;
  b=T9XS1NBClIP6bufj8D8qkXEbyY8vYHybebrjkpORYFjh6UgGTMyXSqUx
   8ksPZljhkS1fzzPheg0vhE8Li3doNtZNhlJLsqOaUSYKgQHnC78EfrhR1
   +YlJhxfb3pqB+aPtg7mM2c5097bU824TWU+Xss4OhALo+I7CoWoTjL0fK
   zeN8wuYbZl7CqpIgQLND9dlJzdZHnLQ9We8GAmzAwSJDVqsYr07bivQAx
   4lZuCnLP/X+erMnpFlIbGnc0RlEIJZ2EksmqUbiEuoX6bKf+9XOuP4qnb
   aYABYFoOFXa/GSi0iPOZWfb4UbENr24ymceA3n0levb8qPjh16280oXA1
   A==;
Content-Disposition: inline
In-Reply-To: <20221216205348.3781217-5-willy@infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>

On Fri, Dec 16, 2022 at 08:53:43PM +0000, Matthew Wilcox (Oracle) wrote:
> kmap_atomic() is deprecated, and so is bh->b_page.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  fs/reiserfs/stree.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
> index 84c12a1947b2..309c61bd90e0 100644
> --- a/fs/reiserfs/stree.c
> +++ b/fs/reiserfs/stree.c
> @@ -1359,12 +1359,13 @@ int reiserfs_delete_item(struct reiserfs_transaction_handle *th,
>  		 * -clm
>  		 */
>  
> -		data = kmap_atomic(un_bh->b_page);
> -		off = ((le_ih_k_offset(&s_ih) - 1) & (PAGE_SIZE - 1));
> -		memcpy(data + off,
> +		off = offset_in_folio(un_bh->b_folio,
> +					le_ih_k_offset(&s_ih) - 1);
> +		data = kmap_local_folio(un_bh->b_folio, off);
> +		memcpy(data,
>  		       ih_item_body(PATH_PLAST_BUFFER(path), &s_ih),
>  		       ret_value);
> -		kunmap_atomic(data);
> +		kunmap_local(data);
>  	}
>  
>  	/* Perform balancing after all resources have been collected at once. */
> -- 
> 2.35.1
> 
