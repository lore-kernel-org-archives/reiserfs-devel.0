From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH 051/141] reiserfs: Fix fall-through warnings for Clang
Date: Tue, 20 Apr 2021 15:23:19 -0500
Message-ID: <7229aa6e-9943-9568-faf2-7c8cd81e6890@embeddedor.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <6859fecccd96f79612f9650fdba7a66bbff70560.1605896059.git.gustavoars@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DZ090SxDoGdMYGqbAjNFB8PVCnl3MoSQpnbnHmBu+Ag=; b=f7HrEhWpFsSYH4zMbxWzVvLy6n
        Oi1yHPIZXYhiWETl64O7ddxoYLW4bd8kuylCOee9yyUx64foK2/qGLKRGXh9aFyznlVidxsPtaq4j
        qVnpLRh+0zpKXJzLvXMNTwzLU1OGmwJYEj6c3NfkXfhClU0Pd+yH5UgwV1pbkxfS0gUdglhCGcc2d
        3+3oOYsqC57M+HdUtyuO/Yema7KtHZGitQrogy1rnTVP0MF6YFVHz6b1er7sSHYXPXozY7wAcVwJP
        k/9LDMB0MNkBfjaqpJXXTrHJApQQajX/XHiqe3ucTlm0ckhkIyhZsntHChoOuE2lNSYg469X+ZRAP
        KP05 
In-Reply-To: <6859fecccd96f79612f9650fdba7a66bbff70560.1605896059.git.gustavoars@kernel.org>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Hi all,

Friendly ping: who can take this, please?

Thanks
--
Gustavo

On 11/20/20 12:32, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of letting the code fall
> through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  fs/reiserfs/namei.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
> index 1594687582f0..90bb49bfdba0 100644
> --- a/fs/reiserfs/namei.c
> +++ b/fs/reiserfs/namei.c
> @@ -132,6 +132,7 @@ int search_by_entry_key(struct super_block *sb, const struct cpu_key *key,
>  			return IO_ERROR;
>  		}
>  		PATH_LAST_POSITION(path)--;
> +		break;
>  
>  	case ITEM_FOUND:
>  		break;
> 
