From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] -oresize on ro filesystem causes panic
Date: Mon, 19 Apr 2004 10:46:05 -0400
Message-ID: <4083E62D.9060909@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070706070109080007090206"
Return-path: <reiserfs-list-return-18060-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Mailing List <reiserfs-list@namesys.com>

--------------070706070109080007090206
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hey all -

While developing my io-error patches (posted previously), I skipped the
resize stuff, opting to come back to it later, since it involved
re-ordering operations so we don't blow ourselves out of the water.
Today, I started digging into that code, and found that if -oresize is
used when the filesystem is read-only, it will attempt to start a
transaction on a read-only filesystem. When CONFIG_REISERFS_CHECK is
enabled, this causes an assertion failure.

mount -r /dev/hda8 /mnt
mount -oremount,resize=123456 /mnt
*panic*

The attached patch fixes the problem. It also moves the reiserfs_resize
call after the filesystem is made read-write on remount. This is so the
following succeeds:

mount -oremount,resize=123456,rw /mnt

- -Jeff

- --
Jeff Mahoney
SuSE Labs
jeffm@suse.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFAg+YtLPWxlyuTD7IRAvBXAJ9ruUhuwvqYcYoLLQxv1+76kC4XTQCfYH3E
rmTlSJjVWIJc5pVqPpv/F/s=
=aDB6
-----END PGP SIGNATURE-----

--------------070706070109080007090206
Content-Type: text/plain;
 name="reiserfs-resize.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-resize.diff"

diff -rup linux-2.6.5.kgdb/fs/reiserfs/resize.c linux-2.6.5.kgdb.afs/fs/reiserfs/resize.c
--- linux-2.6.5.kgdb/fs/reiserfs/resize.c	2004-04-03 22:36:55.000000000 -0500
+++ linux-2.6.5.kgdb.afs/fs/reiserfs/resize.c	2004-04-19 10:28:53.692014416 -0400
@@ -33,6 +33,11 @@ int reiserfs_resize (struct super_block 
 	int i;
 	int copy_size ;
 
+	if (s->s_flags & MS_RDONLY) {
+		reiserfs_warning (s, "Can't resize read-only filesystem.");
+		return -EINVAL;
+	}
+
 	sb = SB_DISK_SUPER_BLOCK(s);
 
 	if (SB_BLOCK_COUNT(s) >= block_count_new) {
diff -rup linux-2.6.5.kgdb/fs/reiserfs/super.c linux-2.6.5.kgdb.afs/fs/reiserfs/super.c
--- linux-2.6.5.kgdb/fs/reiserfs/super.c	2004-04-17 13:32:13.000000000 -0400
+++ linux-2.6.5.kgdb.afs/fs/reiserfs/super.c	2004-04-19 10:30:02.897493584 -0400
@@ -890,12 +890,6 @@ static int reiserfs_remount (struct supe
 	  SB_JOURNAL_MAX_TRANS_AGE(s) = commit_max_age;
   }
 
-  if(blocks) {
-    int rc = reiserfs_resize(s, blocks);
-    if (rc != 0)
-      return rc;
-  }
-
   if (*mount_flags & MS_RDONLY) {
     reiserfs_xattr_init (s, *mount_flags);
     /* remount read-only */
@@ -944,6 +938,12 @@ static int reiserfs_remount (struct supe
     reiserfs_xattr_init (s, *mount_flags);
   }
 
+  if(blocks) {
+    int rc = reiserfs_resize(s, blocks);
+    if (rc != 0)
+      return rc;
+  }
+
   return 0;
 }
 

--------------070706070109080007090206--
