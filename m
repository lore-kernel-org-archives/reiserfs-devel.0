From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv3 1/9] reiser4: block_alloc: add BA_SOME_SPACE flag
 for grabbing a fixed amount of space.
Date: Mon, 20 Oct 2014 00:04:39 +0200
Message-ID: <54443577.3050700@gmail.com>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <1408312379-1990-2-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=XhFWu+ny1eOPORw8tQtq080EMR32YxahK2BjZ1d1sTg=;
        b=t1RINy6jLFIHondyvcFnrCfd1Y4+dJ3JXOxcG/83NqwZHuxCVCQn14CdApGy8hWtAi
         ruGGERPpzRnImxL2XbsRHYVbTuA8hqcySTJW0RBQtNVjl9NCmfDK0b7znEe6CI+cjdKX
         +N0p2nTltDZCbXiCoCg152vtiJUSJChCQ0izFplaLRdnMxnwAbztyy/06NW9DWiOY64u
         rl52zKLaYRxk97xjDlVnjAtrIHWAAi/AWE4L+Fpe2JmseBuX5dbSvHzJne2IsP5Orl2u
         N3YQDWxeKSt6cC3QTGezGrttgtqsRBRV9QEtKkxhTo1svj0lMSVtXVNWTGCniVEkBAcw
         NiJA==
In-Reply-To: <1408312379-1990-2-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 08/17/2014 11:52 PM, Ivan Shapovalov wrote:
> This is used for FITRIM ioctl which will iteratively grab, allocate and trim disk space
> bit by bit to avoid starving the rest of system.
>
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>   fs/reiser4/block_alloc.c | 5 +++++
>   fs/reiser4/block_alloc.h | 5 ++++-
>   2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
> index d3d730c..9eed7fc 100644
> --- a/fs/reiser4/block_alloc.c
> +++ b/fs/reiser4/block_alloc.c
> @@ -276,6 +276,11 @@ reiser4_grab(reiser4_context * ctx, __u64 count, reiser4_ba_flags_t flags)
>   
>   	free_blocks = sbinfo->blocks_free;
>   
> +	if (flags & BA_SOME_SPACE) {
> +		/* Reserve 25% of all free space. */

if (free_blocks == 0) {
         /* nothing to trim */
         ret= RETERR(-ENOSPC);
         goto unlock_and_ret;
}

> +		count = free_blocks >> 2;

if (count == 0)
         /* there are 1, 2, or 3 free blocks  */
         count = free_blocks;

> +	}
> +
>   	if ((use_reserved && free_blocks < count) ||
>   	    (!use_reserved && free_blocks < count + sbinfo->blocks_reserved)) {
>   		ret = RETERR(-ENOSPC);
> diff --git a/fs/reiser4/block_alloc.h b/fs/reiser4/block_alloc.h
> index a4e98af..bfc6be9 100644
> --- a/fs/reiser4/block_alloc.h
> +++ b/fs/reiser4/block_alloc.h
> @@ -79,7 +79,10 @@ enum reiser4_ba_flags {
>   	BA_FORCE = (1 << 5),
>   
>   	/* use default start value for free blocks search. */
> -	BA_USE_DEFAULT_SEARCH_START = (1 << 6)
> +	BA_USE_DEFAULT_SEARCH_START = (1 << 6),
> +
> +	/* reserve some fixed amount of space */
> +	BA_SOME_SPACE = (1 << 7),
>   };
>   
>   typedef enum reiser4_ba_flags reiser4_ba_flags_t;

