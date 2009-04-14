From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 3/3] kill-the-BKL/reiserfs: only acquire the write lock once in reiserfs_dirty_inode
Date: Tue, 14 Apr 2009 05:34:25 +0200
Message-ID: <1239680065-25013-4-git-send-email-fweisbec@gmail.com>
References: <1239680065-25013-1-git-send-email-fweisbec@gmail.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754613AbZDNDfn@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=Zf9yd0uSPOrxO1pXkiBtYVXTUd6FNEDlKSLx4AR5EA4=;
        b=Gg1jL1xGQMvkBBcF18HLYt+emCBL6wNZemIc/k9ikQMEbAytBJuqojyUu6NxqWLFyc
         MGYTNZZnSkMjlZ0N8akkFTyKqXDaSzNc93y+zWuvDHaKB3bxO54KeVZc+cjq51Gqna8C
         E5auqr3U2P4LgGzUJf0n/N4JfOlnOq/sf7s2w=
In-Reply-To: <1239680065-25013-1-git-send-email-fweisbec@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>, Chris Mason <chris.mason@oracle.com>

Impact: fix a deadlock

reiserfs_dirty_inode() is the super_operations::dirty_inode() callback
of reiserfs. It can be called from different contexts where the write
lock can be already held.

But this function also grab the write lock (possibly recursively).
Subsequent release of the lock before sleep will actually not release
the lock if the caller of mark_inode_dirty() (which in turn calls
reiserfs_dirty_inode()) already owns the lock.

A typical case:

reiserfs_write_end() {
	acquire_write_lock()
	mark_inode_dirty() {
		reiserfs_dirty_inode() {
			reacquire_write_lock() {
				journal_begin() {
					do_journal_begin_r() {
						/*
						 * fail to release, still
						 * one depth of lock
						 */
						release_write_lock()
						reiserfs_wait_on_write_block() {
							wait_event()

The event is usually provided by something which needs the write lock but
it hasn't been released.

We use reiserfs_write_lock_once() here to ensure we only grab the
write lock in one level.

Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
---
 fs/reiserfs/super.c |   15 +++++++++------
 1 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 1ac4fcb..f6c5606 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -567,25 +567,28 @@ static void reiserfs_dirty_inode(struct inode *inode)
 	struct reiserfs_transaction_handle th;
 
 	int err = 0;
+	int lock_depth;
+
 	if (inode->i_sb->s_flags & MS_RDONLY) {
 		reiserfs_warning(inode->i_sb, "clm-6006",
 				 "writing inode %lu on readonly FS",
 				 inode->i_ino);
 		return;
 	}
-	reiserfs_write_lock(inode->i_sb);
+	lock_depth = reiserfs_write_lock_once(inode->i_sb);
 
 	/* this is really only used for atime updates, so they don't have
 	 ** to be included in O_SYNC or fsync
 	 */
 	err = journal_begin(&th, inode->i_sb, 1);
-	if (err) {
-		reiserfs_write_unlock(inode->i_sb);
-		return;
-	}
+	if (err)
+		goto out;
+
 	reiserfs_update_sd(&th, inode);
 	journal_end(&th, inode->i_sb, 1);
-	reiserfs_write_unlock(inode->i_sb);
+
+out:
+	reiserfs_write_unlock_once(inode->i_sb, lock_depth);
 }
 
 #ifdef CONFIG_REISERFS_FS_POSIX_ACL
-- 
1.6.1
