From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] Adjust reiser4 for 3.15: replace truncate_inode_pages(...,
 0) with truncate_inode_pages_final(...).
Date: Fri, 13 Feb 2015 15:59:47 +0100
Message-ID: <54DE1163.70106@gmail.com>
References: <1423831759-14470-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=+bgtm6wD4X1v04zvHfLyzG/0ri4Gb3CEcPnAbm2PBTE=;
        b=beAjB36uniN5yZrmlAYaeu84Hd9sJovu22E/wrmjV9S4p+anbr68E4tZwGt0aTD5Zn
         HmCZbFJLD7HCQfYOJ3QIrcsnOBcyALp1e5lV4Ob9/ZMhcXNSEqKJ6B5pu5GGTiAtJ+bi
         Sntbwa40QKm6oSncSNpTMfM0nTV8tRplAuc3FKePNz06pv1pU8rUipORchDZ9dxSZd6e
         OI+5ADgIVxaNfkPuHGf9KpnnUeHgD6egJLPFZGpJz8A3/OgDbG+/jsgRaKC8TUURdl2J
         syOHdOdTsVl7vjG6FzePCfrEcy+hVT60JM2mv516x5RS8eVgsEFJTaG+e825NSlE8r/p
         ff5g==
In-Reply-To: <1423831759-14470-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

Thanks!
I'll backward port it...

Edward.

On 02/13/2015 01:49 PM, Ivan Shapovalov wrote:
> Upstream commit 91b0abe36a7b2b3b02d7500925a5f8455334f0e5
> "mm + fs: store shadow entries in page cache".
>
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>
> We have missed this one long ago...
>
>   fs/reiser4/super_ops.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
> index acff93a..7e319bb 100644
> --- a/fs/reiser4/super_ops.c
> +++ b/fs/reiser4/super_ops.c
> @@ -214,7 +214,7 @@ static void reiser4_evict_inode(struct inode *inode)
>   			fplug->delete_object(inode);
>   	}
>   
> -	truncate_inode_pages(&inode->i_data, 0);
> +	truncate_inode_pages_final(&inode->i_data);
>   	inode->i_blocks = 0;
>   	clear_inode(inode);
>   	reiser4_exit_context(ctx);

