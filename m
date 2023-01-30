From: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH 00/12] acl: remove remaining posix acl handlers
Date: Mon, 30 Jan 2023 11:23:22 +0100
Message-ID: <20230130102322.kkq5u72skrmykilh@wittgenstein>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v1-0-6cf155b492b6@kernel.org>
 <20230130091052.72zglqecqvom7hin@wittgenstein>
 <20230130091615.GB5178@lst.de>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675074209;
        bh=JNTyAwdnYzLmCEymJc/ZUWnk+Q8qvEe4IQT1QMUZUUk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JN3lXwEWVDPGXUGplDwCOYjrW8++AmiuyWsKytBrUAmwH5pYzbdpE0vlm5QMheggM
         NBh8TxCmRl0oiVPGeH0p588WtzUGa4Dhxdj47urWqRw5C3YGCL7sEtEpljLyqeU2qK
         hZMY3SfpZs4a7G1hzx2PjWG4oBFdjJLdjf/CAOLVLdkBRxoWDtbAN1LxJYt5Pv5/uW
         JiIhf6J6BcQzCzFwiWHxFBJvn0+sgbTbzFveW5be89tbifEA4YoFlo/yhqSIZATMj0
         cya32Nkc883EMLF+aa2JEWlyaIljfcXui3HQsRaEUKig3vqEj5vhHo9pWtvCv6EINs
         lzNgfo6NIXgGw==
Content-Disposition: inline
In-Reply-To: <20230130091615.GB5178@lst.de>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Seth Forshee <sforshee@kernel.org>, linux-erofs@lists.ozlabs.org, Jan Kara <jack@suse.com>, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org

On Mon, Jan 30, 2023 at 10:16:15AM +0100, Christoph Hellwig wrote:
> On Mon, Jan 30, 2023 at 10:10:52AM +0100, Christian Brauner wrote:
> > However, a few filesystems still rely on the ->list() method of the
> > generix POSIX ACL xattr handlers in their ->listxattr() inode operation.
> > This is a very limited set of filesystems. For most of them there is no
> > dependence on the generic POSIX ACL xattr handler in any way.
> > 
> > In addition, during inode initalization in inode_init_always() the
> > registered xattr handlers in sb->s_xattr are used to raise IOP_XATTR in
> > inode->i_opflags.
> > 
> > With the incoming removal of the legacy POSIX ACL handlers it is at
> > least possible for a filesystem to only implement POSIX ACLs but no
> > other xattrs. If that were to happen we would miss to raise IOP_XATTR
> > because sb->s_xattr would be NULL. While there currently is no such
> > filesystem we should still make sure that this just works should it ever
> > happen in the future.
> 
> Now the real questions is: do we care?  Once Posix ACLs use an
> entirely separate path, nothing should rely on IOP_XATTR for them.
> So instead I think we're better off auditing all users of IOP_XATTR
> and making sure that nothing relies on them for ACLs, as we've very
> much split the VFS concept of ACLs from that from xattrs otherwise.

I had a patch like that but some filesystems create inodes that
explicitly remove IOP_XATTR to prevent any xattrs from being set on
specific inodes. I remember this for at least reiserfs and btrfs.

So we would probably need IOP_NOACL that can be raised by a filesystem
to explicitly opt out of them for specific inodes. That's probably fine
and avoids having to introduce something like SB_I_XATTR.
