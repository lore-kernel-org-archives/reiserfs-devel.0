From: Bernd Schubert <bernd-schubert@gmx.de>
Subject: Re: 2.6.15 Bug? New security model?
Date: Mon, 13 Feb 2006 00:03:15 +0100
Message-ID: <200602130003.15698.bernd-schubert@gmx.de>
References: <200602080212.27896.bernd-schubert@gmx.de> <20060212175740.GB8805@locomotive.unixthugs.org> <20060212192115.GB8544@procyon.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751058AbWBLXDV@vger.kernel.org>
In-Reply-To: <20060212192115.GB8544@procyon.home>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sergey Vlasov <vsu@altlinux.ru>
Cc: Jeff Mahoney <jeffm@suse.com>, Chris Wright <chrisw@sous-sol.org>, John M Flinchbaugh <john@hjsoft.com>, reiserfs-list@namesys.com, Sam Vilain <sam@vilain.net>, linux-kernel@vger.kernel.org

> diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> index ef5e541..acafe32 100644
> --- a/fs/reiserfs/super.c
> +++ b/fs/reiserfs/super.c
> @@ -1124,7 +1124,9 @@ static void handle_attrs(struct super_bl
>  					 "reiserfs: cannot support attributes until flag is set in
> super-block"); REISERFS_SB(s)->s_mount_opt &= ~(1 << REISERFS_ATTRS);
>  		}
> -	} else if (le32_to_cpu(rs->s_flags) & reiserfs_attrs_cleared) {
> +	} else if ((le32_to_cpu(rs->s_flags) & reiserfs_attrs_cleared) &&
> +		(get_inode_sd_version(s->s_root->d_inode) == STAT_DATA_V2)) {
> +		/* Enable attrs by default on v3.6-native file systems */
>  		REISERFS_SB(s)->s_mount_opt |= (1 << REISERFS_ATTRS);
>  	}
>  }

I'm afraid that still doesn't solve the problem for me, I added two printk to 
be sure whats going on - get_inode_sd_version(s->s_root->d_inode) returns 
STAT_DATA_V2 for all of my partitions.
