From: Jan Kara <jack@suse.cz>
Subject: [PATCH] Expose reiserfs_sync_fs()
Date: Fri, 19 Nov 2004 10:36:15 +0100
Message-ID: <20041119093615.GB15189@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="gBBFr7Ir9EOA20Yy"
Return-path: <reiserfs-list-return-22428-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: akpm@osdl.org
Cc: reiserfs-list@namesys.com

--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hello!

  Attached patch exposes reiserfs_sync_fs(). This call is needed by the
new quota code to write data to disk on quotaoff so that userspace can
see them afterwards. Chris Mason agrees with the patch so I hope you
can merge it.

								Honza

-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs

--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="quota-new-2.6.10-rc2-mm1-4-reisersync.diff"

Make reiserfs provide the sync_fs() function so that the quota code
has a way to reliably force a transaction to disk.

Signed-off-by: Jan Kara <jack@suse.cz>

diff -rupNX /home/jack/.kerndiffexclude linux-2.6.10-rc2-mm1-3-reiserdebug/fs/reiserfs/super.c linux-2.6.10-rc2-mm1-4-reisersync/fs/reiserfs/super.c
--- linux-2.6.10-rc2-mm1-3-reiserdebug/fs/reiserfs/super.c	2004-11-16 16:40:53.000000000 +0100
+++ linux-2.6.10-rc2-mm1-4-reisersync/fs/reiserfs/super.c	2004-11-18 20:27:03.000000000 +0100
@@ -62,7 +62,7 @@ static int is_any_reiserfs_magic_string 
 static int reiserfs_remount (struct super_block * s, int * flags, char * data);
 static int reiserfs_statfs (struct super_block * s, struct kstatfs * buf);
 
-static void reiserfs_sync_fs (struct super_block * s)
+static int reiserfs_sync_fs (struct super_block * s, int wait)
 {
     if (!(s->s_flags & MS_RDONLY)) {
         struct reiserfs_transaction_handle th;
@@ -76,11 +76,12 @@ static void reiserfs_sync_fs (struct sup
     } else {
         s->s_dirt = 0;
     }
+    return 0;
 }
 
 static void reiserfs_write_super(struct super_block *s)
 {
-    reiserfs_sync_fs(s);
+    reiserfs_sync_fs(s, 1);
 }
 
 static void reiserfs_write_super_lockfs (struct super_block * s)
@@ -526,6 +527,7 @@ struct super_operations reiserfs_sops = 
   .clear_inode  = reiserfs_clear_inode,
   .put_super = reiserfs_put_super,
   .write_super = reiserfs_write_super,
+  .sync_fs = reiserfs_sync_fs,
   .write_super_lockfs = reiserfs_write_super_lockfs,
   .unlockfs = reiserfs_unlockfs,
   .statfs = reiserfs_statfs,

--gBBFr7Ir9EOA20Yy--
