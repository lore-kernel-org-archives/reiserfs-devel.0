From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 27/32] reiserfs: make commit_wq use the default concurrency level
Date: Mon,  3 Jan 2011 14:49:50 +0100
Message-ID: <1294062595-30097-28-git-send-email-tj@kernel.org>
References: <1294062595-30097-1-git-send-email-tj@kernel.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=CJtvRXgXe7JP9oXuRsYBfLEi7+5ZePnO9L+vuHjoalE=;
        b=hyzR1Wlc3W2fOkNvHS/5aebIHTZ/D/NvND0yAYP0IcaNataqtRyRwTdGbKpw8LzcaZ
         I6sKr4YIIT5JKBfiGLY8qQ5CrAUVCennxlmaAOxZx0ZIFH2zTCaePJSmIyDH9rYtnE8/
         XefIK1SjcqPK1CjdWoxMF6uUOXBgG0TYbtjDo=
In-Reply-To: <1294062595-30097-1-git-send-email-tj@kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, reiserfs-devel@vger.kernel.org

The maximum number of concurrent work items queued on commit_wq is
bound by the number of active journals.  Convert to alloc_workqueue()
and use the default concurrency level so that they can be processed in
parallel.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: reiserfs-devel@vger.kernel.org
---
Only compile tested.  Please feel free to take it into the subsystem
tree or simply ack - I'll route it through the wq tree.

Thanks.

 fs/reiserfs/journal.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index d31bce1..ee311c0 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2883,7 +2883,7 @@ int journal_init(struct super_block *sb, const char *j_dev_name,
 	reiserfs_mounted_fs_count++;
 	if (reiserfs_mounted_fs_count <= 1) {
 		reiserfs_write_unlock(sb);
-		commit_wq = create_workqueue("reiserfs");
+		commit_wq = alloc_workqueue("reiserfs", WQ_MEM_RECLAIM, 0);
 		reiserfs_write_lock(sb);
 	}
 
-- 
1.7.1

