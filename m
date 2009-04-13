From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH] kill-the-BKL: fix unsafe j_flush_mutex lock
Date: Tue, 14 Apr 2009 00:10:35 +0200
Message-ID: <1239660635-12940-1-git-send-email-fweisbec@gmail.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753356AbZDMWKv@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=+CpOUX0NCjuYNP9AhJirLLudPd+gdJfpnMVEhH5cD3Y=;
        b=mN87E/1RAidQv4cct4tx/XetbJ4gU/YJjZqMnlfZXdZaiV4OelObLtXU5TcQ/9cjVv
         q2jPY82VZfYzg6JodRU5hJ8EbyWhSakvkxXshJwkQ9NJFzB7QXbkd3ytk3bMNaaW1atF
         WjXeizjto1zK81dVwzDvT7rkVDlQ3Xol6o/Yg=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Impact: fix a deadlock

The j_flush_mutex is acquired safely in journal.c:
if we can't take it, we free the reiserfs per superblock lock
and wait a bit.

But we have a remaining place in kupdate_transactions() where
j_flush_mutex is still acquired traditionnaly. Thus the following
scenario (warned by lockdep) can happen:

A						B

mutex_lock(&write_lock)			mutex_lock(&write_lock)
	mutex_lock(&j_flush_mutex)	mutex_lock(&j_flush_mutex) //block
	mutex_unlock(&write_lock)
	sleep...
	mutex_lock(&write_lock) //deadlock

Fix this by using reiserfs_mutex_lock_safe() in kupdate_transactions().

Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
---
 fs/reiserfs/journal.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 64dcabd..7976d7d 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -1826,7 +1826,7 @@ static int kupdate_transactions(struct super_block *s,
 	struct reiserfs_journal *journal = SB_JOURNAL(s);
 	chunk.nr = 0;
 
-	mutex_lock(&journal->j_flush_mutex);
+	reiserfs_mutex_lock_safe(&journal->j_flush_mutex, s);
 	if (!journal_list_still_alive(s, orig_trans_id)) {
 		goto done;
 	}
-- 
1.6.1
