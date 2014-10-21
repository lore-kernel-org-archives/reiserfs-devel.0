From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv3 2/9] reiser4: block_alloc: add a "forward" parameter
 to reiser4_blocknr_hint to allocate blocks only in forward direction.
Date: Tue, 21 Oct 2014 17:50:23 +0200
Message-ID: <544680BF.5040204@gmail.com>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <1408312379-1990-3-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=LNOgxm6LoKogw71zbiqt98OW+B1SsHAek3cbFw4OHlo=;
        b=G8Pv8rjQtDD2prJyiquLtDlfOE7VnP1laIkAUgC+kRaSZYcvxNbl8bvmS62uEjnWUg
         P41eYuuRmkoKrLATABy3nbP0EIRzT2YF1bFIBjMdd2gjAICGv2FWmc21R1HBSuRj8M1/
         sSmCfdzWKx+xPerP1JgJbb3M+bArKi2XC644iTYQviLGXLx4FoLmTNK9Lj8+rh/7SIxN
         7kijN5lQ03jvG0I4+HpctnpmXlw/Mu/p2RABIUkZT5JzVMCux5kryixB9mJeL52AGCvQ
         xKuw3I/rdJy6m6r+9aXIIDox0fXOL7XuzhDCSFyvsT62Ggd1n/SJPYG02AGDC+X+df3Y
         nniA==
In-Reply-To: <1408312379-1990-3-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 08/17/2014 11:52 PM, Ivan Shapovalov wrote:
> Signed-off-by: Ivan Shapovalov<intelfx100@gmail.com>
> ---
>   fs/reiser4/block_alloc.h         | 5 +++--
>   fs/reiser4/plugin/space/bitmap.c | 3 ++-
>   2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/fs/reiser4/block_alloc.h b/fs/reiser4/block_alloc.h
> index bfc6be9..08b3941 100644
> --- a/fs/reiser4/block_alloc.h
> +++ b/fs/reiser4/block_alloc.h
> @@ -51,9 +51,10 @@ struct reiser4_blocknr_hint {
>   	/* block allocator assumes that blocks, which will be mapped to disk,
>   	   are in this specified block_stage */
>   	block_stage_t block_stage;
> -	/* If direction = 1 allocate blocks in backward direction from the end
> -	 * of disk to the beginning of disk.  */
> +	/* Allocate blocks only in backward direction starting from blk. */
>   	unsigned int backward:1;
> +	/* Allocate blocks only in forward direction starting from blk. */
> +	unsigned int forward:1;


I suggest to call this bitfield "monotonic_forward"


>   
>   };
>   
> diff --git a/fs/reiser4/plugin/space/bitmap.c b/fs/reiser4/plugin/space/bitmap.c
> index 3da3f6b..9beaf66 100644
> --- a/fs/reiser4/plugin/space/bitmap.c
> +++ b/fs/reiser4/plugin/space/bitmap.c
> @@ -1127,7 +1127,8 @@ static int alloc_blocks_forward(reiser4_blocknr_hint *hint, int needed,
>   	/* There is only one bitmap search if max_dist was specified or first
>   	   pass was from the beginning of the bitmap. We also do one pass for
>   	   scanning bitmap in backward direction. */
> -	if (!(actual_len != 0 || hint->max_dist != 0 || search_start == 0)) {
> +	if (actual_len == 0 && search_start != 0 &&
> +	    hint->max_dist == 0 && hint->forward == 0) {
>   		/* next step is a scanning from 0 to search_start */
>   		search_end = search_start;
>   		search_start = 0;


OK with this patch,
I'll continue to review this patch series at leisure.

Thanks,
Edward.
