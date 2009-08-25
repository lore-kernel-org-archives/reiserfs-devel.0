From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 3/4] kill-the-bkl/reiserfs: fix recursive reiserfs write lock in reiserfs_commit_write()
Date: Tue, 25 Aug 2009 04:32:49 +0200
Message-ID: <1251167570-5233-4-git-send-email-fweisbec@gmail.com>
References: <1251167570-5233-1-git-send-email-fweisbec@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references:to;
        bh=GPLHfR3/CT/+80Sj8TM5GGOrU+ZBjc8JU/SZVqm0oHM=;
        b=MJhcoresXKBWDTmy5YUQGHkFzh4LdJnOB2FkeSvJnDXjPLY5ZHsHKKb2B+Oh448bq0
         d9SkbBmhZvDHPLEYABWqFNUcPceMzDjzGzbkdq7w2+jqdheOHwxQUytDfkv7dc4ogBo5
         9J/Udut23BBLWQuvHsKjI1uXje+vAVIXSE/No=
In-Reply-To: <1251167570-5233-1-git-send-email-fweisbec@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Chris Mason <chris.mason@oracle.com>, Roland Dreier <rdreier@cisco.com>, Ingo Molnar <mingo@elte.hu>, Andi Kleen <andi@firstfloor.org>, Jeff Mahoney <jeffm@suse.com>, Alexander Beregalov <a.beregalov@gmail.com>, Bron Gondwana <brong@fastmail.fm>, Reiserfs <reiserfs-devel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrea Gelmini <andrea.gelmini@gmail.com>, "Trenton D. Adams" <trenton.d.adams@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Alessio Igor Bogani <abogani@texware.it>, Marcel Hilzinger <mhilzinger@linuxnewmedia.de>, Edward Shishkin <edward.shishkin@gmail.com>, Laurent Riffard <laurent.riffard@free.fr>

reiserfs_commit_write() is always called with the write lock held.
Thus the current calls to reiserfs_write_lock() in this function are
acquiring the lock recursively.
We can safely drop them.

This also solves further assumptions for this lock to be really
released while calling reiserfs_write_unlock().

Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Chris Mason <chris.mason@oracle.com>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Alexander Beregalov <a.beregalov@gmail.com>
Cc: Laurent Riffard <laurent.riffard@free.fr>
---
 fs/reiserfs/inode.c |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 853f4f6..965c8ea 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -2795,7 +2795,6 @@ int reiserfs_commit_write(struct file *f, struct page *page,
 	 */
 	if (pos > inode->i_size) {
 		struct reiserfs_transaction_handle myth;
-		reiserfs_write_lock(inode->i_sb);
 		/* If the file have grown beyond the border where it
 		   can have a tail, unmark it as needing a tail
 		   packing */
@@ -2806,10 +2805,9 @@ int reiserfs_commit_write(struct file *f, struct page *page,
 			REISERFS_I(inode)->i_flags &= ~i_pack_on_close_mask;
 
 		ret = journal_begin(&myth, inode->i_sb, 1);
-		if (ret) {
-			reiserfs_write_unlock(inode->i_sb);
+		if (ret)
 			goto journal_error;
-		}
+
 		reiserfs_update_inode_transaction(inode);
 		inode->i_size = pos;
 		/*
@@ -2821,16 +2819,13 @@ int reiserfs_commit_write(struct file *f, struct page *page,
 		reiserfs_update_sd(&myth, inode);
 		update_sd = 1;
 		ret = journal_end(&myth, inode->i_sb, 1);
-		reiserfs_write_unlock(inode->i_sb);
 		if (ret)
 			goto journal_error;
 	}
 	if (th) {
-		reiserfs_write_lock(inode->i_sb);
 		if (!update_sd)
 			mark_inode_dirty(inode);
 		ret = reiserfs_end_persistent_transaction(th);
-		reiserfs_write_unlock(inode->i_sb);
 		if (ret)
 			goto out;
 	}
@@ -2840,11 +2835,9 @@ int reiserfs_commit_write(struct file *f, struct page *page,
 
       journal_error:
 	if (th) {
-		reiserfs_write_lock(inode->i_sb);
 		if (!update_sd)
 			reiserfs_update_sd(th, inode);
 		ret = reiserfs_end_persistent_transaction(th);
-		reiserfs_write_unlock(inode->i_sb);
 	}
 
 	return ret;
-- 
1.6.2.3

