From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 04/05] reiserfs: introduce reiserfs_error()
Date: Fri, 16 Jun 2006 00:19:00 -0400
Message-ID: <20060616041900.GA5409@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28792-reiserfs=m.gmane.org@namesys.com>
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


Signed-off-by: Jeff Mahoney <jeffm@suse.com>

--
 fs/reiserfs/prints.c        |   33 +++++++++++++++++++++++++++++++++
 include/linux/reiserfs_fs.h |    3 +++
 2 files changed, 36 insertions(+)

diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/fs/reiserfs/prints.c linux-2.6.17-rc6-staging2/fs/reiserfs/prints.c
--- linux-2.6.17-rc6-staging1/fs/reiserfs/prints.c	2006-06-15 20:59:45.000000000 -0400
+++ linux-2.6.17-rc6-staging2/fs/reiserfs/prints.c	2006-06-15 20:59:45.000000000 -0400
@@ -369,6 +369,39 @@ void reiserfs_panic(struct super_block *
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
+void __reiserfs_error(struct super_block *sb, const char *id,
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
diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/include/linux/reiserfs_fs.h linux-2.6.17-rc6-staging2/include/linux/reiserfs_fs.h
--- linux-2.6.17-rc6-staging1/include/linux/reiserfs_fs.h	2006-06-15 20:58:52.000000000 -0400
+++ linux-2.6.17-rc6-staging2/include/linux/reiserfs_fs.h	2006-06-15 20:59:45.000000000 -0400
@@ -1984,6 +1984,9 @@ void unfix_nodes(struct tree_balance *);
 /* prints.c */
 void reiserfs_panic(struct super_block *s, const char *fmt, ...)
     __attribute__ ((noreturn));
+void __reiserfs_error(struct super_block *s, const char *id, const char *function, const char *fmt, ...);
+#define reiserfs_error(s, id, fmt, args...) \
+        __reiserfs_error(s, id, __FUNCTION__, fmt, ##args)
 void reiserfs_info(struct super_block *s, const char *fmt, ...);
 void reiserfs_debug(struct super_block *s, int level, const char *fmt, ...);
 void print_indirect_item(struct buffer_head *bh, int item_num);
