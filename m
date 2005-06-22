From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: reiser4 plugins
Date: Wed, 22 Jun 2005 18:28:43 +0400
Message-ID: <17081.30107.751071.983835@gargle.gargle.HOWL>
References: <20050620235458.5b437274.akpm@osdl.org>
	<42B831B4.9020603@pobox.com>
	<42B87318.80607@namesys.com>
	<20050621202448.GB30182@infradead.org>
	<42B8B9EE.7020002@namesys.com>
	<42B8BB5E.8090008@pobox.com>
	<42B8E834.5030809@slaphack.com>
	<42B8F4BC.5060100@pobox.com>
	<42B92AA1.3010107@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24458-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42B92AA1.3010107@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

David Masover writes:

[...]

 > 
 > Maintainability is like optimization.  The maintainability of a
 > non-working program is irrelevant.  You'd be right if we already had
 > plugins-in-the-VFS.  We don't.  The most maintainable solution for
 > plugins-in-the-FS that actually exists is Reiser4, exactly as it is now
 > - -- because it is the _only_ one that actually exists right now.

But it is not so. There _are_ plugins-in-the-VFS. VFS operates on opaque
objects (inodes, dentries, file system types) through interfaces:
{inode,address_space,dentry,sb,etc.}_operations. Every file system
back-end if free to implement whatever number of these interfaces. And
the do this already: check the sources; even ext2 does this: e.g.,
ext2_fast_symlink_inode_operations and ext2_symlink_inode_operations.

This is exactly what upper level reiser4 plugins are for.

I guess that one of Christoph Hellwig's complaints is that reiser4
introduces another layer of abstraction to implement something that
already exists.

Nikita.
