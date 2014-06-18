From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4: fix reiser4_post_{commit,write_back}_hook()
 and their invocations.
Date: Wed, 18 Jun 2014 03:41:58 +0200
Message-ID: <53A0EE66.7040600@gmail.com>
References: <1403044996-17273-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=cWIeLmLs/BbMikTit64Mh3mMIWm/cyMWdusaaDjpbBw=;
        b=ll9bPeRTrYg6tatIiccUW8D0QeE3Ag9XlAh9tiudH6B2PAyde4sFM7kQDVL+aZwknG
         VzkFRtArM2gkoN6jwDwUbaK+4Kr3Z73vh++i9e3kyo0J1thx9ht/s93iAHlGiLqJZAnV
         DopMz534M9QKVgukY6mu6aIboSKxWOqQRULK64MP/6TR6fnkAbQP+3hGMJKBV92MqfIQ
         2ZSU6hoZsnBcKQxv0Hap+NTk6o41RMw6XHp3eDtBXwYc9mJZnZSrDkr2mlKC0JuzULnV
         Z9Fx5DTbJE+A8PyCVVhUHZD37v8iWHj0RSArOFegJVc9aCzFdLRm8x4hjFj/Mg2SiJDP
         /LKA==
In-Reply-To: <1403044996-17273-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


OK.

On 06/18/2014 12:43 AM, Ivan Shapovalov wrote:
> - let all hooks be called from one place (reiser4_write_logs())
> - don't call reiser4_post_write_back_hook() twice
> - fix reiser4_post_write_back_hook(): call the correct method of space allocator
> ---
>   fs/reiser4/block_alloc.c | 2 +-
>   fs/reiser4/wander.c      | 3 +--
>   2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
> index 81ed96f..3a4b667 100644
> --- a/fs/reiser4/block_alloc.c
> +++ b/fs/reiser4/block_alloc.c
> @@ -1150,7 +1150,7 @@ void reiser4_post_write_back_hook(void)
>   {
>   	assert("zam-504", get_current_super_private() != NULL);
>   
> -	sa_post_commit_hook();
> +	sa_post_write_back_hook();
>   }
>   
>   /*
> diff --git a/fs/reiser4/wander.c b/fs/reiser4/wander.c
> index 0b518c3..4e29de8 100644
> --- a/fs/reiser4/wander.c
> +++ b/fs/reiser4/wander.c
> @@ -1140,7 +1140,6 @@ static int write_tx_back(struct commit_handle * ch)
>   	int ret;
>   	int barrier;
>   
> -	reiser4_post_commit_hook();
>   	fq = get_fq_for_current_atom();
>   	if (IS_ERR(fq))
>   		return  PTR_ERR(fq);
> @@ -1165,7 +1164,6 @@ static int write_tx_back(struct commit_handle * ch)
>   		if (ret)
>   			return ret;
>   	}
> -	reiser4_post_write_back_hook();
>   	return 0;
>   }
>   
> @@ -1251,6 +1249,7 @@ int reiser4_write_logs(long *nr_submitted)
>   	spin_lock_atom(atom);
>   	reiser4_atom_set_stage(atom, ASTAGE_POST_COMMIT);
>   	spin_unlock_atom(atom);
> +	reiser4_post_commit_hook();
>   
>   	ret = write_tx_back(&ch);
>   	reiser4_post_write_back_hook();

