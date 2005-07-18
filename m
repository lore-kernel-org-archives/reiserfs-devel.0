From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 4/5] reiserfs: introduce reiserfs_error() TESTING ONLY
Date: Mon, 18 Jul 2005 13:43:10 -0400
Message-ID: <20050718174310.GA23893@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25184-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>


 Although reiserfs can currently handle severe errors such as journal failure,
 it cannot handle less severe errors like metadata i/o failure. The following
 patch adds a reiserfs_error() function akin to the one in ext3.

 Subsequent patches will use this new error handler to handle errors more
 gracefully in general.

 FOR TESTING ONLY

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX dontdiff linux-2.6.13-rc3/fs/reiserfs/prints.c linux-2.6.13-rc3.errors/fs/reiserfs/prints.c
--- linux-2.6.13-rc3/fs/reiserfs/prints.c	2005-07-13 13:57:32.000000000 -0400
+++ linux-2.6.13-rc3.errors/fs/reiserfs/prints.c	2005-07-14 16:36:47.000000000 -0400
@@ -366,6 +366,39 @@ void reiserfs_panic(struct super_block *
 	      reiserfs_bdevname(sb), error_buf);
 }
 
+void reiserfs_handle_error(struct super_block *sb, int errno)
+{
+
+	if (sb->s_flags & MS_RDONLY)
+		return;
+
+	if (reiserfs_error_ro(sb)) {
+		reiserfs_info(sb, "Remounting filesystem read-only\n");
+		sb->s_flags |= MS_RDONLY;
+	} else {
+		reiserfs_journal_abort(sb, errno);
+	}
+
+	if (reiserfs_error_panic(sb)) {
+		reiserfs_panic (sb, "panic forced after error");
+	}
+}
+
+void reiserfs_error_internal(struct super_block *sb, const char *id,
+                      const char *function, const char *fmt, ...)
+{
+	do_reiserfs_warning(fmt);
+
+	if (id && id[0])
+		printk(KERN_CRIT "REISERFS error (device %s): %s %s: %s\n",
+	               sb->s_id, id, function, error_buf);
+	else
+		printk(KERN_CRIT "REISERFS error (device %s): %s: %s\n",
+	               sb->s_id, function, error_buf);
+	
+	reiserfs_handle_error(sb, -EIO);
+}
+
 void reiserfs_abort(struct super_block *sb, int errno, const char *fmt, ...)
 {
 	do_reiserfs_warning(fmt);
diff -ruNpX dontdiff linux-2.6.13-rc3/include/linux/reiserfs_fs.h linux-2.6.13-rc3.errors/include/linux/reiserfs_fs.h
--- linux-2.6.13-rc3/include/linux/reiserfs_fs.h	2005-07-13 13:57:33.000000000 -0400
+++ linux-2.6.13-rc3.errors/include/linux/reiserfs_fs.h	2005-07-14 15:53:13.000000000 -0400
@@ -1995,6 +1995,9 @@ void unfix_nodes(struct tree_balance *);
 /* prints.c */
 void reiserfs_panic(struct super_block *s, const char *fmt, ...)
     __attribute__ ((noreturn));
+void reiserfs_error_internal(struct super_block *s, const char *id, const char *function, const char *fmt, ...);
+#define reiserfs_error(s, id, fmt, args...) \
+        reiserfs_error_internal(s, id, __FUNCTION__, fmt, ##args)
 void reiserfs_info(struct super_block *s, const char *fmt, ...);
 void reiserfs_debug(struct super_block *s, int level, const char *fmt, ...);
 void print_indirect_item(struct buffer_head *bh, int item_num);
-- 
Jeff Mahoney
SuSE Labs
