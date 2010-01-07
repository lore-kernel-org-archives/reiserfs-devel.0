From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 1/1] FS: reiserfs, fix unreachable statement
Date: Thu, 7 Jan 2010 12:33:44 +0100
Message-ID: <20100107113341.GA5093@nowhere>
References: <1262815790-5864-1-git-send-email-jslaby@suse.cz>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=LF6RR2/01qEM7nTbj9DTnuXxT7C1W6coubav0t8D134=;
        b=dZ1OimIsq/A3sOyTxLD1V0bS4X6bInYlJHqBeBXHY9ieAlLiA6oQEKMZIZlZqqgN0F
         tgtRkdSOtHIxpsV5+9ODH3xi00tkzypIHXd0Mwio98qhJmgg9K56yA+RReS0UGRISqu9
         Txay3r7Xsr9iu9gkYAqEIbDvATlNnuW2eS4yg=
Content-Disposition: inline
In-Reply-To: <1262815790-5864-1-git-send-email-jslaby@suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jslaby@suse.cz>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, jirislaby@gmail.com, reiserfs-devel@vger.kernel.org

On Wed, Jan 06, 2010 at 11:09:50PM +0100, Jiri Slaby wrote:
> Stanse found an unreachable statement in reiserfs_ioctl. There is
> if followed by assignment and `break'. with no braces. Add the
> braces so that we don't break every time, but only in error case.
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: reiserfs-devel@vger.kernel.org
> ---



Looks good.
I've applied it, thanks!



>  fs/reiserfs/ioctl.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/reiserfs/ioctl.c b/fs/reiserfs/ioctl.c
> index ace7745..f53505d 100644
> --- a/fs/reiserfs/ioctl.c
> +++ b/fs/reiserfs/ioctl.c
> @@ -104,9 +104,10 @@ setflags_out:
>  		err = put_user(inode->i_generation, (int __user *)arg);
>  		break;
>  	case REISERFS_IOC_SETVERSION:
> -		if (!is_owner_or_cap(inode))
> +		if (!is_owner_or_cap(inode)) {
>  			err = -EPERM;
>  			break;
> +		}
>  		err = mnt_want_write(filp->f_path.mnt);
>  		if (err)
>  			break;
> -- 
> 1.6.5.7
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

