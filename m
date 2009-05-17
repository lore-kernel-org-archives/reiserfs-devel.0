From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Subject: Re: [patch 3/4] reiserfs: fixup perms when xattrs are disabled
Date: Sun, 17 May 2009 13:50:45 +0200
Message-ID: <4A0FFA15.6070101@s5r6.in-berlin.de>
References: <20090517050200.786752018@suse.com> <20090517050332.303142159@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090517050332.303142159@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>

Jeff Mahoney wrote:
>  This patch CONFIG_REISERFS_FS_XATTR protection from reiserfs_permission.
> 
>  This is needed to avoid warnings during file deletions and chowns with
>  xattrs disabled.
> 
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>

Al has a minimally edited version in vfs-2.6.git/for-next:

[...]
> +#ifdef CONFIG_REISERFS_FS_XATTR
> +	/*
> +	 * Stat data v1 doesn't support ACLs.
> +	 */
> +	if (get_inode_sd_version(inode) != STAT_DATA_V1)
> +		return generic_permission(inode, mask, reiserfs_check_acl);
> +	else
> +#endif
> +		return generic_permission(inode, mask, NULL);
> +}
> +

The else is omitted, and hence the second return unindented.

Al, did you mean to let Linus pull from your tree once more?
(I have been using a reiserfs root FS with Jeff's four patches for a 
week and all went smoothly.)
-- 
Stefan Richter
-=====-=-=== -=-= -==-=
http://arcgraph.de/sr/
