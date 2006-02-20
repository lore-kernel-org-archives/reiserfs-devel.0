From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 00/11] reiserfs: xattr rework
Date: Mon, 20 Feb 2006 15:14:57 -0500
Message-ID: <20060220201457.GA23204@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28099-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: "E. Gryaznova" <grev@namesys.com>


Hello all -

Following this message is a series of 11 patches that rework the reiserfs
xattr code. The current implementation open codes a number of functions that
are well tested and stable elsewhere, but will slight modifications. It also
does a number of things suboptimally, such as operations that affect all of
the xattrs associated with an inode, as well as not handling journalling as
well as can be.

I've run them through a weekend of stress testing successfully, but I'd like
some additional testing before considering them safe.

Here's the run down:

* 01 - Make internal xattr operations use vfs ops
  This eliminates the open coding of the read/write loops in favor of using
  vfs_read and vfs_write. Performance-wise, it's very little difference
  from the open coding, and implementation-wise, it's more tested. Yes, this
  violates the no-file-io-in-the-kernel rules, but this rule has been violated
  since the day the original patches were accepted.

* 02 - Simplify xattr internal file lookups/opens
  This patch uses vfs-level operations where possible, using the i_mutex
  to protect directories rather than a special xattr lock.

* 03 - Eliminate per-super xattr lock
  Since we use i_mutex, we can eliminate the xattr lock, removing the locking
  constraints from namei.c

* 04 - Make per-inode xattr locking more fine grained
  The better locking allows us to tighten the critical sections that must
  be protected against concurrent access. Writers protect against concurrency
  using the owning inode's i_mutex, but readers still need protection against
  writers. This patch pushes the xattr_sem down to surround just the operation
  on the xattr itself.

* 05 - Make i_has_xattr_dir flag more sane
  With the simplification of open/lookups, there is now only one place for
  the flag to be set and one for it to be cleared.

* 06 - Use generic xattr handlers
  This patch moves the reiserfs xattr handlers to the generic VFS supplied
  struct xattr_handler. It uses the generic handlers where possible, but
  due to the generic handlers splitting the prefix from the name, that's not
  always possible since ReiserFS requires that the prefix be preserved.

* 07 - Use O_NOATIME for internal files
  This patch adds O_NOATIME for internal files, since it is never exported and
  it saves us adding another transaction for the dirty inode. It also means
  that on read operations, we don't start a transaction with an xattr sem
  held when the inode is dirtied.

* 08 - Add per-file data=ordered mode and use it for xattrs
  Despite being metadata, extended attributes are written with the same
  data logging policy as the rest of the file system. This patch adds a 
  per-file data=ordered mode and uses it when the file system is using
  data=writeback.

* 09 - Journaled xattrs
  This is the big patch. This eliminates the deadlocks that can still occur
  with xattrs on ReiserFS. The basic rule is that before doing a write
  operation on the xattr, a transaction must be started. In order to do this,
  reiserfs_xattr_set is split into two functions; One wraps the other in a
  transaction for the ->setxattr calls, and the other is used directly by
  internal functions like those which implement ACLs. This also alters the
  return value from reiserfs_cache_default_acl to contain the number of blocks
  required to handle the additional blocks required by inheriting the default
  ACL.
  
* 10 - Use generic readdir for operations across all xattrs
  One of the most wasteful operations with the existing code is operations
  that traverse all the extended attributes for a given inode. Since they are
  stored as regular files, it makes sense to use ->readdir to enumerate them.
  However, since the operations may modify the file system, the cached path
  must be dropped before the filldir routine is called. This means that
  the path must be re-read for each iteration. This patch leverages the
  generic readdir function to simply fill and return an array of dentries
  that can be operated on after the path has already been freed. ReiserFS's
  hashed directories really come in handy here, since the directory offset
  doesn't change when entries are deleted. Therefore, the old code which was
  quite involved and full of duplication is reduced to a single for_each_xattr
  routine that calls out to individual delete or chown functions as needed.

* 11 - Associate xattr's packing locality w/ owning inode's
  Since there isn't any linkage between an inode and its xattr directory, it's
  possible for the xattrs to be placed quite far away from the inode on disk.
  This patch leverages the dentry's fsdata pointer to allow reiserfs_new_inode
  to use the owning inode's dir id in determining where to place the new
  objects.

  -Jeff
