From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 2/3] reiser4: block_alloc: sanitize grab_enabled modifications.
Date: Sat, 18 Oct 2014 19:47:29 +0200
Message-ID: <5442A7B1.2030407@gmail.com>
References: <1408371283-1319-1-git-send-email-intelfx100@gmail.com> <1408371283-1319-3-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=UI5K6pS8bllMiVqRfYnZvK0lGEJ3nt4Xy0CgKRUV1Lo=;
        b=y+xitAifmn88HV6nFmHnT+iFwLOAXBMCppikZmCbpNEnfHdajul+GwYcIjhXuH+6H6
         lXio8XNF/LT95zJOACZ/uvohH6wAAgI/tPi43orLhigoi6xIw0NiA4m7i2/T9NZvKGGH
         dGI7tHgSyTZF9X1idbHL2nEPHlGAwxY/12dsnD9YuHbZXQjt1tfJ+IVhE7aLF9665pPI
         gmyAnY/hT24xcruBmQo0duZSu3Pgy3FV0uhK4Gk1QX44WtJGGxMVpfwGNM+E836BgM3x
         Nu7X6yIavo/GIV1fNXWeiPegOrZwzjXjnBKmSeS1/04+VtTJM4rdxa/fRMHYTg0bBPeu
         mueA==
In-Reply-To: <1408371283-1319-3-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 08/18/2014 04:14 PM, Ivan Shapovalov wrote:
> - move all grab_enabled checks and modifications into reiser4_grab_space();
> - only disable grab if not BA_FORCE;
> - do not re-enable grab before doing second attempt in BA_CAN_COMMIT sequence
>    (feels hackish and is unneeded after the first change).
>
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>   fs/reiser4/block_alloc.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
> index 7f9f910..a30f7b9 100644
> --- a/fs/reiser4/block_alloc.c
> +++ b/fs/reiser4/block_alloc.c
> @@ -270,12 +270,6 @@ reiser4_grab(reiser4_context * ctx, __u64 count, reiser4_ba_flags_t flags)
>   
>   	assert("vs-1276", ctx == get_current_context());
>   
> -	/* Do not grab anything on ro-mounted fs. */
> -	if (rofs_super(ctx->super)) {
> -		ctx->grab_enabled = 0;
> -		return 0;
> -	}
> -
>   	sbinfo = get_super_private(ctx->super);
>   
>   	spin_lock_reiser4_super(sbinfo);
> @@ -300,9 +294,6 @@ reiser4_grab(reiser4_context * ctx, __u64 count, reiser4_ba_flags_t flags)
>   
>   	assert("nikita-2986", reiser4_check_block_counters(ctx->super));
>   
> -	/* disable grab space in current context */
> -	ctx->grab_enabled = 0;
> -
>   unlock_and_ret:
>   	spin_unlock_reiser4_super(sbinfo);
>   
> @@ -321,6 +312,12 @@ int reiser4_grab_space(__u64 count, reiser4_ba_flags_t flags)
>   	if (!(flags & BA_FORCE) && !is_grab_enabled(ctx))
>   		return 0;
>   
> +	/* Do not grab anything on ro-mounted fs. */
> +	if (rofs_super(ctx->super)) {
> +		ctx->grab_enabled = 0;
> +		return 0;
> +	}
> +
>   	ret = reiser4_grab(ctx, count, flags);
>   	if (ret == -ENOSPC) {
>   
> @@ -328,10 +325,15 @@ int reiser4_grab_space(__u64 count, reiser4_ba_flags_t flags)
>   		   present */
>   		if (flags & BA_CAN_COMMIT) {
>   			txnmgr_force_commit_all(ctx->super, 0);
> -			ctx->grab_enabled = 1;
>   			ret = reiser4_grab(ctx, count, flags);
>   		}
>   	}
> +
> +	if (!(flags & BA_FORCE) && (ret == 0)) {


Hmm, but we disabled it unconditionally in reiser4_grab().
Not sure, if this is equivalent...


> +		/* disable grab space in current context */
> +		ctx->grab_enabled = 0;
> +	}

