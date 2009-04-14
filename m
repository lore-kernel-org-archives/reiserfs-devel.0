From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 2/3] kill-the-BKL/reiserfs: lock only once in reiserfs_truncate_file
Date: Tue, 14 Apr 2009 05:34:24 +0200
Message-ID: <1239680065-25013-3-git-send-email-fweisbec@gmail.com>
References: <1239680065-25013-1-git-send-email-fweisbec@gmail.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754964AbZDNDfX@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=OwUUdR7eMLGd5qw5dgH2Ps4vyfVYJCsel6NMpyXhPiQ=;
        b=nVCCZ4OexDVBCcjGw/WQeKbislKcCF8GodrxClLfTHvaNcOrStXE4rqqovWHZaeau5
         72dRGKn6JsmpSKE5fNkSyEWzI9iGhNOvmEDG76Y6BlhhWS9J1cOW9S4SN0M4O7/3s/q5
         Gb6DZfPFxg2g8ru/KEdIP7r1LbbK5L1lDkCl8=
In-Reply-To: <1239680065-25013-1-git-send-email-fweisbec@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>, Chris Mason <chris.mason@oracle.com>

Impact: fix a deadlock

reiserfs_truncate_file() can be called from multiple context where
the write lock can be already hold or not.

This function also acquire (possibly recursively) the write
lock. Subsequent releases before sleeping will not actually release
the lock because we may be in more than one lock depth degree.

A typical case is:

reiserfs_file_release {
	acquire_the_lock()
	reiserfs_truncate_file()
		reacquire_the_lock()
		journal_begin() {
			do_journal_begin_r() {
				reiserfs_wait_on_write_block() {
					/*
					 * Not released because still one
					 * depth owned
					 */
					release_lock()
					wait_for_event()

At this stage the event never happen because the one which provides
it needs the write lock.

We use reiserfs_write_lock_once() here to ensure that we don't acquire the
write lock recursively.

Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
---
 fs/reiserfs/inode.c |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 88ef0b7..153668e 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -2083,8 +2083,9 @@ int reiserfs_truncate_file(struct inode *inode, int update_timestamps)
 	int error;
 	struct buffer_head *bh = NULL;
 	int err2;
+	int lock_depth;
 
-	reiserfs_write_lock(inode->i_sb);
+	lock_depth = reiserfs_write_lock_once(inode->i_sb);
 
 	if (inode->i_size > 0) {
 		error = grab_tail_page(inode, &page, &bh);
@@ -2153,14 +2154,17 @@ int reiserfs_truncate_file(struct inode *inode, int update_timestamps)
 		page_cache_release(page);
 	}
 
-	reiserfs_write_unlock(inode->i_sb);
+	reiserfs_write_unlock_once(inode->i_sb, lock_depth);
+
 	return 0;
       out:
 	if (page) {
 		unlock_page(page);
 		page_cache_release(page);
 	}
-	reiserfs_write_unlock(inode->i_sb);
+
+	reiserfs_write_unlock_once(inode->i_sb, lock_depth);
+
 	return error;
 }
 
-- 
1.6.1
