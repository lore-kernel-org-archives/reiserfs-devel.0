From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 1/3] kill-the-BKL/reiserfs: provide a tool to lock only once the write lock
Date: Tue, 14 Apr 2009 05:34:23 +0200
Message-ID: <1239680065-25013-2-git-send-email-fweisbec@gmail.com>
References: <1239680065-25013-1-git-send-email-fweisbec@gmail.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753904AbZDNDe4@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=sjDO7TP4xr2gvlKDui/F9KKKTVpiHaLhSOcxwJ/u3JU=;
        b=TRm2N8IN4XWQu25ppmPwDm20SfbSEL4O4zV2BpLt7TdsN4K0elq0bEtzkgn+ZneSyY
         uPv31QbGJfJbL/79/uZzw7+2dOdrSW/yNHg6o5eQec+1dQNXBV6xulGjLce/U5qN5Srv
         qstuogyjz4MFhH9YdO1tmI2PBvYacoFOueJGw=
In-Reply-To: <1239680065-25013-1-git-send-email-fweisbec@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>, Chris Mason <chris.mason@oracle.com>

Sometimes we don't want to recursively hold the per superblock write
lock because we want to be sure it is actually released when we come
to sleep.

This patch introduces the necessary tools for that.

reiserfs_write_lock_once() does the same job than reiserfs_write_lock()
except that it won't try to acquire recursively the lock if the current
task already owns it. Also the lock_depth before the call of this function
is returned.

reiserfs_write_unlock_once() unlock only if reiserfs_write_lock_once()
returned a depth equal to -1, ie: only if it actually locked.

Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
---
 fs/reiserfs/lock.c          |   26 ++++++++++++++++++++++++++
 include/linux/reiserfs_fs.h |    2 ++
 2 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/fs/reiserfs/lock.c b/fs/reiserfs/lock.c
index cdd8d9e..cb1bba3 100644
--- a/fs/reiserfs/lock.c
+++ b/fs/reiserfs/lock.c
@@ -50,6 +50,32 @@ void reiserfs_write_unlock(struct super_block *s)
 }
 
 /*
+ * If we already own the lock, just exit and don't increase the depth.
+ * Useful when we don't want to lock more than once.
+ *
+ * We always return the lock_depth we had before calling
+ * this function.
+ */
+int reiserfs_write_lock_once(struct super_block *s)
+{
+	struct reiserfs_sb_info *sb_i = REISERFS_SB(s);
+
+	if (sb_i->lock_owner != current) {
+		mutex_lock(&sb_i->lock);
+		sb_i->lock_owner = current;
+		return sb_i->lock_depth++;
+	}
+
+	return sb_i->lock_depth;
+}
+
+void reiserfs_write_unlock_once(struct super_block *s, int lock_depth)
+{
+	if (lock_depth == -1)
+		reiserfs_write_unlock(s);
+}
+
+/*
  * Utility function to force a BUG if it is called without the superblock
  * write lock held.  caller is the string printed just before calling BUG()
  */
diff --git a/include/linux/reiserfs_fs.h b/include/linux/reiserfs_fs.h
index f6b7b7b..6587b4e 100644
--- a/include/linux/reiserfs_fs.h
+++ b/include/linux/reiserfs_fs.h
@@ -59,6 +59,8 @@
  */
 void reiserfs_write_lock(struct super_block *s);
 void reiserfs_write_unlock(struct super_block *s);
+int reiserfs_write_lock_once(struct super_block *s);
+void reiserfs_write_unlock_once(struct super_block *s, int lock_depth);
 
 struct fid;
 
-- 
1.6.1
