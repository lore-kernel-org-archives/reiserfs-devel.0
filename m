From: Jordan Breeding <jbb@cloves.inetint.com>
Subject: [PATCH] support for remount options in linux-2.5.24
Date: Wed, 26 Jun 2002 09:33:55 -0500
Message-ID: <20020626093355.A2283@cloves.inetint.com>
Reply-To: Jordan Breeding <jordan.breeding@inet.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="YZ5djTAD1cGYuMQK"
Return-path: <reiserfs-list-return-10856-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

  This is a patch which simply takes the patch to support more options on remount for linux-2.4.18 and updates it to work with linux-2.5.24.  Could this patch or something similar please be included in reiserfs in linux-2.5.24 so that the field for current mount options in /proc/fs/reiserfs/<filesystem>/super get updated properly when the filesystem is remounted.  Thanks.

Jordan

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch-reiserfs-super-remount-1

diff -urN linux-2.5.24-orig/fs/reiserfs/super.c linux/fs/reiserfs/super.c
--- linux-2.5.24-orig/fs/reiserfs/super.c	Thu Jun 20 17:53:51 2002
+++ linux/fs/reiserfs/super.c	Tue Jun 25 23:54:49 2002
@@ -677,12 +677,24 @@
   struct reiserfs_super_block * rs;
   struct reiserfs_transaction_handle th ;
   unsigned long blocks;
-  unsigned long mount_options;
+  unsigned long mount_options = 0;
 
   rs = SB_DISK_SUPER_BLOCK (s);
 
   if (!reiserfs_parse_options(arg, &mount_options, &blocks, NULL))
     return -EINVAL;
+
+#define SET_OPT(opt, bits, super) \
+  if((bits) & (1 << (opt))) \
+    REISERFS_SB(super)->s_mount_opt |= (1 << (opt))
+
+  /* set options in the super-block bitmask */
+  SET_OPT(NOTAIL, mount_options, s);
+  SET_OPT(REISERFS_NO_BORDER, mount_options, s);
+  SET_OPT(REISERFS_NO_UNHASHED_RELOCATION, mount_options, s);
+  SET_OPT(REISERFS_HASHED_RELOCATION, mount_options, s);
+  SET_OPT(REISERFS_TEST4, mount_options, s);
+#undef SET_OPT
   
   if(blocks) {
     int rc = reiserfs_resize(s, blocks);

--YZ5djTAD1cGYuMQK--
