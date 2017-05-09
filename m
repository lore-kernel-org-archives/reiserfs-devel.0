From: jeffm@suse.com
Subject: [PATCH 3/4] reiserfs: protect message formatting and printing with mutex
Date: Tue,  9 May 2017 16:50:12 -0400
Message-ID: <20170509205013.568-4-jeffm@suse.com>
References: <20170509205013.568-1-jeffm@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20170509205013.568-1-jeffm@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Jeff Mahoney <jeffm@suse.com>

From: Jeff Mahoney <jeffm@suse.com>

Reiserfs uses a static buffer for formatting and printing messages.
It's possible for one thread to overwrite the buffer while another is
printing it.  Depending on timing, it's possible to get the printer to
crash if a pointer argument lands at the right time.  We use a spinlock
to protect against concurrent formatting, but it doesn't cover printk.
This patch converts the spinlock to a mutex and covers the printk as
well.  There are currently no callers of these routines that do so with
a spinlock held.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/prints.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/fs/reiserfs/prints.c b/fs/reiserfs/prints.c
index 1af3febb0419..db7b02b06fcc 100644
--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -218,7 +218,7 @@ static char *is_there_reiserfs_struct(char *fmt, int *what)
  * printk ("bad key %lu %lu %lu %lu", key->k_dir_id, key->k_objectid,
  *         key->k_offset, key->k_uniqueness);
  */
-static DEFINE_SPINLOCK(error_lock);
+static DEFINE_MUTEX(error_lock);
 static void prepare_error_buf(const char *fmt, va_list args)
 {
 	char *fmt1 = fmt_buf;
@@ -228,7 +228,7 @@ static void prepare_error_buf(const char *fmt, va_list args)
 	int left = sizeof(error_buf);
 	int bytes = 0;
 
-	spin_lock(&error_lock);
+	WARN_ON(!mutex_is_locked(&error_lock));
 
 	strcpy(fmt1, fmt);
 
@@ -301,8 +301,6 @@ static void prepare_error_buf(const char *fmt, va_list args)
 	}
 out:
 	vsnprintf(p, left, fmt1, args);
-	spin_unlock(&error_lock);
-
 }
 
 /*
@@ -327,6 +325,7 @@ static void prepare_error_buf(const char *fmt, va_list args)
 void __reiserfs_warning(const struct super_block *sb, const char *id,
 			 const char *function, const char *fmt, ...)
 {
+	mutex_lock(&error_lock);
 	do_reiserfs_warning(fmt);
 	if (sb)
 		printk(KERN_WARNING "REISERFS warning (device %s): %s%s%s: "
@@ -335,35 +334,42 @@ void __reiserfs_warning(const struct super_block *sb, const char *id,
 	else
 		printk(KERN_WARNING "REISERFS warning: %s%s%s: %s\n",
 		       id ? id : "", id ? " " : "", function, error_buf);
+	mutex_unlock(&error_lock);
 }
 
 /* No newline.. reiserfs_info calls can be followed by printk's */
 void reiserfs_info(struct super_block *sb, const char *fmt, ...)
 {
+	mutex_lock(&error_lock);
 	do_reiserfs_warning(fmt);
 	if (sb)
 		printk(KERN_NOTICE "REISERFS (device %s): %s",
 		       sb->s_id, error_buf);
 	else
 		printk(KERN_NOTICE "REISERFS %s:", error_buf);
+	mutex_unlock(&error_lock);
 }
 
 /* No newline.. reiserfs_printk calls can be followed by printk's */
 static void reiserfs_printk(const char *fmt, ...)
 {
+	mutex_lock(&error_lock);
 	do_reiserfs_warning(fmt);
 	printk(error_buf);
+	mutex_unlock(&error_lock);
 }
 
 void reiserfs_debug(struct super_block *s, int level, const char *fmt, ...)
 {
 #ifdef CONFIG_REISERFS_CHECK
+	mutex_lock(&error_lock);
 	do_reiserfs_warning(fmt);
 	if (s)
 		printk(KERN_DEBUG "REISERFS debug (device %s): %s\n",
 		       s->s_id, error_buf);
 	else
 		printk(KERN_DEBUG "REISERFS debug: %s\n", error_buf);
+	mutex_unlock(&error_lock);
 #endif
 }
 
@@ -417,6 +423,7 @@ void reiserfs_debug(struct super_block *s, int level, const char *fmt, ...)
 void __reiserfs_panic(struct super_block *sb, const char *id,
 		      const char *function, const char *fmt, ...)
 {
+	mutex_lock(&error_lock);
 	do_reiserfs_warning(fmt);
 
 #ifdef CONFIG_REISERFS_CHECK
@@ -429,16 +436,16 @@ void __reiserfs_panic(struct super_block *sb, const char *id,
 	else
 		printk(KERN_WARNING "REISERFS panic: %s%s%s: %s\n",
 		      id ? id : "", id ? " " : "", function, error_buf);
+	mutex_unlock(&error_lock);
 	BUG();
 }
 
 void __reiserfs_error(struct super_block *sb, const char *id,
 		      const char *function, const char *fmt, ...)
 {
+	mutex_lock(&error_lock);
 	do_reiserfs_warning(fmt);
 
-	BUG_ON(sb == NULL);
-
 	if (reiserfs_error_panic(sb))
 		__reiserfs_panic(sb, id, function, error_buf);
 
@@ -448,6 +455,7 @@ void __reiserfs_error(struct super_block *sb, const char *id,
 	else
 		printk(KERN_CRIT "REISERFS error (device %s): %s: %s\n",
 		       sb->s_id, function, error_buf);
+	mutex_unlock(&error_lock);
 
 	if (sb->s_flags & MS_RDONLY)
 		return;
@@ -459,6 +467,7 @@ void __reiserfs_error(struct super_block *sb, const char *id,
 
 void reiserfs_abort(struct super_block *sb, int errno, const char *fmt, ...)
 {
+	mutex_lock(&error_lock);
 	do_reiserfs_warning(fmt);
 
 	if (reiserfs_error_panic(sb)) {
@@ -466,11 +475,14 @@ void reiserfs_abort(struct super_block *sb, int errno, const char *fmt, ...)
 		      error_buf);
 	}
 
-	if (reiserfs_is_journal_aborted(SB_JOURNAL(sb)))
+	if (reiserfs_is_journal_aborted(SB_JOURNAL(sb))) {
+		mutex_unlock(&error_lock);
 		return;
+	}
 
 	printk(KERN_CRIT "REISERFS abort (device %s): %s\n", sb->s_id,
 	       error_buf);
+	mutex_unlock(&error_lock);
 
 	sb->s_flags |= MS_RDONLY;
 	reiserfs_abort_journal(sb, errno);
-- 
2.11.0

