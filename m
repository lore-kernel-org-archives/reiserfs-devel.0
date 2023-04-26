From: patchwork-bot+f2fs@kernel.org
Subject: Re: [f2fs-dev] [PATCH v3 00/10] acl: drop posix acl handlers from xattr
 handlers
Date: Wed, 26 Apr 2023 23:07:20 +0000
Message-ID: <168255044073.16014.8337870090900748986.git-patchwork-notify@kernel.org>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682550440;
        bh=71/XsA8gAmo1yutYZ1cS0twFrW61Rssu2AmOx0Z5eqs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LCsCJGnd35MidYfxnMlF2ceb389n1B9U+KnzrgVKwgz5bAx1JzOufQeZ/SGRGVkkX
         AkwL7o7IUXB84i3Vrp+2dYvTEB2raGyt1bPfIePkPzimyVl0QF0nykjXoFPdK/iGyF
         xmS+0hcVEEqQ/mzOQIEuWBo+aNi0OdLZoD2sU5j7TMMHl0xiWsv3YDVAgdm/lv4bBl
         2hkD0FnZL1h9SA7ETWRkHuT5vigtQxRgpaiySgxZcycuzc9OCObp4SvRjW6CqNYxGL
         A85Yr6YutIEXIGmgBh1OeDzgtzNYHzp8kT1wAHqE0jDNsJNShVauqRfHNLAzt5GYDW
         hhMvyD5bq6lZw==
In-Reply-To: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, hch@lst.de, linux-unionfs@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk, linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org, sforshee@kernel.org

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Christian Brauner (Microsoft) <brauner@kernel.org>:

On Wed, 01 Feb 2023 14:14:51 +0100 you wrote:
> Hey everyone,
> 
> After we finished the introduction of the new posix acl api last cycle
> we still left the generic POSIX ACL xattr handlers around in the
> filesystems xattr handlers for two reasons:
> 
> (1) Because a few filesystems rely on the ->list() method of the generic
>     POSIX ACL xattr handlers in their ->listxattr() inode operation.
> (2) POSIX ACLs are only available if IOP_XATTR is raised. The IOP_XATTR
>     flag is raised in inode_init_always() based on whether the
>     sb->s_xattr pointer is non-NULL. IOW, the registered xattr handlers
>     of the filesystem are used to raise IOP_XATTR.
>     If we were to remove the generic POSIX ACL xattr handlers from all
>     filesystems we would risk regressing filesystems that only implement
>     POSIX ACL support and no other xattrs (nfs3 comes to mind).
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,05/10] fs: simplify ->listxattr() implementation
    https://git.kernel.org/jaegeuk/f2fs/c/a5488f29835c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


