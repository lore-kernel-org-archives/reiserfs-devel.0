From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] Fix for default ACL handling on ReiserFS
Date: Thu, 16 Sep 2004 13:12:56 -0400
Message-ID: <4149C998.6090306@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030306080809030700030406"
Return-path: <reiserfs-list-return-21821-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@osdl.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

--------------030306080809030700030406
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hello all -

reiserfs_set_xattr() explicitly updates the ctime for the host inode.

This works for direct setfacl/setfattr calls, but for the more common
case of an inherited default ACL, it breaks. The ACL is inherited in the
middle of the new inode creation, before the inode has been hashed.

When mark_inode_dirty is called, one of the checks bails out if the
inode is unhashed -- but AFTER inode->i_state is updated, so the inode
is marked dirty but never placed on any dirty list.

Since the inode is never placed on a dirty list, __sync_single_inode
from the writeback_inodes() path can never be called on it to clear the
dirty flags. Once the inode is hashed and mark_inode_dirty is called for
it again, it's too late -- it will bail early assuming (correctly) that
the inode is already marked dirty. This ultimately results in I/O stalls
that can't be resolved by the fs path, only be the memory allocation
path that uses pages directly.

The attached patch makes the update of the ctime conditional on the
inode being hashed already.

Please apply.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBScmYLPWxlyuTD7IRAopEAJ9uyyIudRaYd01pHvNHEGni+tO+zgCfc1Z0
zVSRILsXsk2xdvRN1/ss+5Y=
=6ndQ
-----END PGP SIGNATURE-----

--------------030306080809030700030406
Content-Type: text/plain;
 name="reiserfs-acl-dirty.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-acl-dirty.diff"

diff -rup linux-2.6.8/fs/reiserfs/xattr.c linux-2.6.8.fix/fs/reiserfs/xattr.c
--- linux-2.6.8/fs/reiserfs/xattr.c	2004-08-14 01:38:08.000000000 -0400
+++ linux-2.6.8.fix/fs/reiserfs/xattr.c	2004-09-16 00:22:19.000000000 -0400
@@ -588,12 +588,18 @@
         if (err || buffer_size == 0 || !buffer)
             break;
     }
 
-    inode->i_ctime = CURRENT_TIME;
-    mark_inode_dirty (inode);
+    /* We can't mark the inode dirty if it's not hashed. This is the case
+     * when we're inheriting the default ACL. If we dirty it, the inode
+     * gets marked dirty, but won't (ever) make it onto the dirty list until
+     * it's synced explicitly to clear I_DIRTY. This is bad. */
+    if (!hlist_unhashed(&inode->i_hash)) {
+        inode->i_ctime = CURRENT_TIME;
+        mark_inode_dirty (inode);
+    }
 
 out_filp:
     up (&xinode->i_sem);
     fput(fp);
 
 out:

--------------030306080809030700030406--
