From: Jan Kara <jack@suse.cz>
Subject: [PATCH] Expose sync_fs()
Date: Thu, 18 Nov 2004 13:00:31 +0100
Message-ID: <20041118120031.GE2767@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="tMbDGjvJuJijemkf"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org


--tMbDGjvJuJijemkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hello!

  Attached patch makes reiserfs provide sync_fs() function. It is
necessary for a new quota code to work correctly and expose quota data
to the user space after quotaoff. Currently the functionality is hidden
behind the write_super() call which also seems a bit non-intuitive to me.
Do you think the patch is acceptable?

					Thanks for any comments
								Honza
-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs

--tMbDGjvJuJijemkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="quota-new-2.6.10-rc2-mm1-5-reisersync.diff"

Make reiserfs provide the sync_fs() function so that the quota code
has a way to reliably force a transaction to disk.

Signed-off-by: Jan Kara <jack@suse.cz>

diff -rupNX /home/jack/.kerndiffexclude linux-2.6.10-rc2-mm1-4-reisersmall/fs/reiserfs/super.c linux-2.6.10-rc2-mm1-5-reisersync/fs/reiserfs/super.c
--- linux-2.6.10-rc2-mm1-4-reisersmall/fs/reiserfs/super.c	2004-11-16 16:40:53.000000000 +0100
+++ linux-2.6.10-rc2-mm1-5-reisersync/fs/reiserfs/super.c	2004-11-16 17:07:32.000000000 +0100
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

--tMbDGjvJuJijemkf--
