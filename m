From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: [patch] Re: assertion failed: can_hit_entd(ctx, s)
Date: Wed, 30 Aug 2006 10:45:39 +0400
Message-ID: <200608301045.39978.zam@namesys.com>
References: <200608211759.04151.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608252242.36985.zam@namesys.com> <200608291710.06096.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29751-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608291710.06096.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: andrew.j.wade@gmail.com
Cc: reiserfs-list@namesys.com

Hello,

On 30 August 2006 01:10, Andrew James Wade wrote:
> Hello Alexander,
>
> In addition to your patch, I've also applied the patch below. With
> these two patches the fs is much more stable for me.

That code was removed from reiser4 recently, the patch will be in the 
next -mm kernel.

I knew there was a bug somewhere :) 

>
> However, something is holding a d_ref across the calls to
> reiser4_writepage. It's not clear to me that this is allowed so my
> patch may not be a full fix.
>
> Andrew Wade
>
> signed-off-by: <andrew.j.wade@gmail.com>
>
> diff -rupN a/fs/reiser4/plugin/item/extent_file_ops.c
> b/fs/reiser4/plugin/item/extent_file_ops.c ---
> a/fs/reiser4/plugin/item/extent_file_ops.c	2006-08-28
> 11:30:33.000000000 -0400 +++
> b/fs/reiser4/plugin/item/extent_file_ops.c	2006-08-29
> 13:06:20.000000000 -0400 @@ -1320,20 +1320,22 @@ static int
> extent_readpage_filler(void * TWIG_LEVEL, CBK_UNIQUE, NULL);
>  		if (result != CBK_COORD_FOUND) {
>  			reiser4_unset_hint(hint);
> -			return result;
> +			goto out;
>  		}
>  		ext_coord->valid = 0;
>  	}
>
>  	if (zload(ext_coord->coord.node)) {
>  		reiser4_unset_hint(hint);
> -		return RETERR(-EIO);
> +		result = RETERR(-EIO);
> +		goto out;
>  	}
>  	if (!item_is_extent(&ext_coord->coord)) {
>  		/* tail conversion is running in parallel */
>  		zrelse(ext_coord->coord.node);
>  		reiser4_unset_hint(hint);
> -		return RETERR(-EIO);
> +		result = RETERR(-EIO);
> +		goto out;
>  	}
>
>  	if (ext_coord->valid == 0)
> @@ -1358,6 +1360,10 @@ static int extent_readpage_filler(void *
>  	} else
>  		reiser4_unset_hint(hint);
>  	zrelse(ext_coord->coord.node);
> +
> +out:
> +	/* Calls to this function may be intermingled with VM writeback. */
> +	reiser4_txn_restart_current();
>  	return result;
>  }
>
>
> !DSPAM:44f4ad37293861987214747!

Thanks,
Alex.

