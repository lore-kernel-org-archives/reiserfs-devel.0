From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 00/12] acl: remove remaining posix acl handlers
Date: Mon, 30 Jan 2023 10:16:15 +0100
Message-ID: <20230130091615.GB5178@lst.de>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v1-0-6cf155b492b6@kernel.org> <20230130091052.72zglqecqvom7hin@wittgenstein>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20230130091052.72zglqecqvom7hin@wittgenstein>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>, Seth Forshee <sforshee@kernel.org>, linux-erofs@lists.ozlabs.org, Jan Kara <jack@suse.com>, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org

On Mon, Jan 30, 2023 at 10:10:52AM +0100, Christian Brauner wrote:
> However, a few filesystems still rely on the ->list() method of the
> generix POSIX ACL xattr handlers in their ->listxattr() inode operation.
> This is a very limited set of filesystems. For most of them there is no
> dependence on the generic POSIX ACL xattr handler in any way.
> 
> In addition, during inode initalization in inode_init_always() the
> registered xattr handlers in sb->s_xattr are used to raise IOP_XATTR in
> inode->i_opflags.
> 
> With the incoming removal of the legacy POSIX ACL handlers it is at
> least possible for a filesystem to only implement POSIX ACLs but no
> other xattrs. If that were to happen we would miss to raise IOP_XATTR
> because sb->s_xattr would be NULL. While there currently is no such
> filesystem we should still make sure that this just works should it ever
> happen in the future.

Now the real questions is: do we care?  Once Posix ACLs use an
entirely separate path, nothing should rely on IOP_XATTR for them.
So instead I think we're better off auditing all users of IOP_XATTR
and making sure that nothing relies on them for ACLs, as we've very
much split the VFS concept of ACLs from that from xattrs otherwise.
