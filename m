From: Changli Gao <xiaosuo@gmail.com>
Subject: [PATCH, resend] reiserfs: remove unused variable wait
Date: Tue, 13 Jul 2010 15:26:30 +0800
Message-ID: <1279005990-11185-1-git-send-email-xiaosuo@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=kI9AkVYUusMc9RmLDoRJTDOJm4SZgLie4HP2j2g+yXo=;
        b=U6xkMsOwO4oCK65FhJk01jD6YHwdeGkOV528L0npLSb6Ivo0oqt8vRxjMYt3rVatIm
         OorFIDP3PVx8lDu5H9h38TFx7AwzMqYy4UbHoxOSvHMIudAQZ1a13p/UJte9igtCvyrW
         QbHUHh8sE7G7BE96LgtVpyuQ4h1Yh43Ulvf4A=
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
