From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] xattr/acl fixes
Date: Mon, 16 Aug 2004 11:08:37 -0400
Message-ID: <4120CDF5.2050004@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030409000401020104070200"
Return-path: <reiserfs-list-return-20334-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@osdl.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>

--------------030409000401020104070200
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hey all -

Here are a few fixes for bugs noticed on reiserfs-list or our own bugzilla.

Attached is a patch that fixes several problems with xattrs/acls:
[SECURITY] Fixes the inode not getting dirtied when mode is set
~           via setxattr()
[CORRECTNESS] Fixes the inode not getting ctime updated when an xattr is
~              removed
[DATA] Fixes an issue with dcache hash colliding names in the filesystem
~       root caused by the d_compare to hide .reiserfs_priv. The bug
~       can only occur in the filesystem root, which is why we haven't
~       seen many (any, outside of the suse bugzilla, afaik) reports on
~       this. The results are that dcache operations on colliding entries
~       in the fs root will choose the first match rather than the
~       correct entry.

These should be obviously correct. Please apply.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBIM31LPWxlyuTD7IRAtj1AJwNkkIF3uap8IzxO2R+5KPp3TfLYACdHDhI
P1FORUaIT9SM+UKg72dWaJE=
=qvrt
-----END PGP SIGNATURE-----

--------------030409000401020104070200
Content-Type: text/plain;
 name="reiserfs-acl-fixes.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-acl-fixes.diff"

diff -rup -X dontdiff linux-2.6.5/fs/reiserfs/xattr_acl.c linux-2.6.5-acl/fs/reiserfs/xattr_acl.c
--- linux-2.6.5/fs/reiserfs/xattr_acl.c	2004-08-03 14:18:19.000000000 -0400
+++ linux-2.6.5-acl/fs/reiserfs/xattr_acl.c	2004-08-03 14:21:44.000000000 -0400
@@ -289,8 +289,14 @@ reiserfs_set_acl(struct inode *inode, in
             error = reiserfs_xattr_set(inode, name, value, size, 0);
 	} else {
             error = reiserfs_xattr_del (inode, name);
-            if (error == -ENODATA)
+            if (error == -ENODATA) {
+                /* This may seem odd here, but it means that the ACL was set
+                 * with a value representable with mode bits. If there was
+                 * an ACL before, reiserfs_xattr_del already dirtied the inode.
+                 */
+                mark_inode_dirty (inode);
                 error = 0;
+            }
         }
 
 	if (value)
diff -rup -X dontdiff linux-2.6.5/fs/reiserfs/xattr.c linux-2.6.5-acl/fs/reiserfs/xattr.c
--- linux-2.6.5/fs/reiserfs/xattr.c	2004-08-03 14:18:53.000000000 -0400
+++ linux-2.6.5-acl/fs/reiserfs/xattr.c	2004-08-03 14:20:51.000000000 -0400
@@ -761,6 +761,11 @@ reiserfs_xattr_del (struct inode *inode,
     err = __reiserfs_xattr_del (dir, name, strlen (name));
     dput (dir);
 
+    if (!err) {
+        inode->i_ctime = CURRENT_TIME;
+        mark_inode_dirty (inode);
+    }
+
 out:
     return err;
 }
@@ -1241,8 +1246,10 @@ xattr_lookup_poison (struct dentry *dent
         name->hash == priv_root->d_name.hash &&
         !memcmp (name->name, priv_root->d_name.name, name->len)) {
             return -ENOENT;
-    }
-    return 0;
+    } else if (q1->len == name->len &&
+               !memcmp(q1->name, name->name, name->len))
+        return 0;
+    return 1;
 }
 
 static struct dentry_operations xattr_lookup_poison_ops = {

--------------030409000401020104070200--
