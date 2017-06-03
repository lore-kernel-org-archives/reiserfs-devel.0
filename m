From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] Reiser4: Port for Linux-4.11
Date: Sat,  3 Jun 2017 11:32:57 +0300
Message-ID: <1496478777-13797-1-git-send-email-edward.shishkin@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ozSTkihg3GtD3kto77MsTinSbV97O8H2shoIY08/6f8=;
        b=Ixs7INeW3/7IcnvxNutv96xWbULTHvLgN+1lnwjvWoSWq4YH3xKADTronTsxvGQKhI
         JJXj5sdlipsDOpwPohgT/2R29pb2Vc1TKJFlEbR0trCaHRngg+ZwVMcYf3Prs08xo6DU
         IDmjMPQlJfjU/OJGXzGlJkTqT6GBP6R4a6g4JMUBu4hxWC3VG9G+B0V+vcotumsW98Do
         BvX0Q+efAA0cUqQNpNIP4ek++fklsQgg9vciKb3pQkbWG7UzT0mL18ksX7WzuPZ50rZY
         JWmov1GYu1+GTFD/xqOO2v7ftKkLSMGDZ0qaP5svQgPSUJIPMyWGYXouf2s5j3e3jWez
         O9mw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 debug.c            | 1 +
 entd.c             | 2 +-
 plugin/inode_ops.c | 9 ++++-----
 plugin/object.h    | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/debug.c b/debug.c
index b5b56fa..96c9508 100644
--- a/debug.c
+++ b/debug.c
@@ -39,6 +39,7 @@
 #include <linux/ctype.h>
 #include <linux/sysctl.h>
 #include <linux/hardirq.h>
+#include <linux/sched/signal.h>  /* signal_pending() */
 
 #if 0
 #if REISER4_DEBUG
diff --git a/entd.c b/entd.c
index 731ed65..e6b56ae 100644
--- a/entd.c
+++ b/entd.c
@@ -246,7 +246,7 @@ static void entd_flush(struct super_block *super, struct wbq *rq)
 			.sync_mode	= WB_SYNC_NONE,
 			.nr_pages	= LONG_MAX,
 			.range_cyclic	= 0,
-			.reason		= WB_REASON_TRY_TO_FREE_PAGES,
+			.reason		= WB_REASON_VMSCAN,
 		};
 		rq->wbc->sync_mode = work.sync_mode,
 		rq->wbc->range_cyclic = work.range_cyclic,
diff --git a/plugin/inode_ops.c b/plugin/inode_ops.c
index b22dbac..91fe425 100644
--- a/plugin/inode_ops.c
+++ b/plugin/inode_ops.c
@@ -474,16 +474,15 @@ int reiser4_setattr_common(struct dentry *dentry, struct iattr *attr)
 /* this is common implementation of vfs's getattr method of struct
    inode_operations
 */
-int reiser4_getattr_common(struct vfsmount *mnt UNUSED_ARG,
-			   struct dentry *dentry, struct kstat *stat)
+int reiser4_getattr_common(const struct path *path, struct kstat *stat,
+			   u32 request_mask, unsigned int flags)
 {
 	struct inode *obj;
 
-	assert("nikita-2298", dentry != NULL);
+	assert("nikita-2298", path != NULL);
 	assert("nikita-2299", stat != NULL);
-	assert("nikita-2300", dentry->d_inode != NULL);
 
-	obj = dentry->d_inode;
+	obj = d_inode(path->dentry);
 
 	stat->dev = obj->i_sb->s_dev;
 	stat->ino = oid_to_uino(get_inode_oid(obj));
diff --git a/plugin/object.h b/plugin/object.h
index c69c6b0..60ca4b9 100644
--- a/plugin/object.h
+++ b/plugin/object.h
@@ -29,8 +29,8 @@ const char *reiser4_get_link_common(struct dentry *, struct inode *inode,
 				    struct delayed_call *done);
 int reiser4_permission_common(struct inode *, int mask);
 int reiser4_setattr_common(struct dentry *, struct iattr *);
-int reiser4_getattr_common(struct vfsmount *mnt, struct dentry *,
-			   struct kstat *);
+int reiser4_getattr_common(const struct path *path, struct kstat *stat,
+			   u32 request_mask, unsigned int flags);
 
 /* common implementations of file operations */
 loff_t reiser4_llseek_dir_common(struct file *, loff_t off, int origin);
-- 
1.9.3

