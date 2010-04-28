From: Changli Gao <xiaosuo@gmail.com>
Subject: [PATCH] reiserfs: remove unused variable wait
Date: Wed, 28 Apr 2010 15:10:57 +0800
Message-ID: <1272438657-28086-1-git-send-email-xiaosuo@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=kI9AkVYUusMc9RmLDoRJTDOJm4SZgLie4HP2j2g+yXo=;
        b=cfgARHlqvM/xRaixgnkTRPLvsPGJVU8bcnY070C1YZ9Nk1/MpId/B++rGi0PwGy4vb
         RbbZg4LVExSTLJgq2U9WQVGvqOQFkrPPYg+IXDkyMvn+DSG54t3MTCfwkwkZvTpk8mA8
         s0zZJ5lLcpLwQevln+wR8YikPfzil9BAegEt4=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <jens.axboe@oracle.com>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Changli Gao <xiaosuo@gmail.com>

remove unused variable wait

remove unused variable wait

Signed-off-by: Changli Gao <xiaosuo@gmail.com>
----
 fs/reiserfs/journal.c |    1 -
 1 file changed, 1 deletion(-)
diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 19fbc81..1ec952b 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -983,7 +983,6 @@ static int flush_older_commits(struct super_block *s,
 
 static int reiserfs_async_progress_wait(struct super_block *s)
 {
-	DEFINE_WAIT(wait);
 	struct reiserfs_journal *j = SB_JOURNAL(s);
 
 	if (atomic_read(&j->j_async_throttle)) {
