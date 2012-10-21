From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 2/4] reiser4: lock wb-list when calling writeback_sb_inodes
Date: Sun, 21 Oct 2012 19:59:15 +0200
Message-ID: <508437F3.2070100@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040307080602070307070807"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=aAArqBTao1ibAFMCM95kiRJWtouoslmd8sZ29mEbTaw=;
        b=AVPvpcBZ5DMmy+w9hFY9/nH7OlhpYXvmmH452UY5KHumDMvTKuO7GsuYb7Mp5ceJwa
         5JU4bz0V7x9tVyZm04ae8Mg6Xqp762yvUpmgXgLpmo8RScVoA2ZLPMMBu2TXcLH6gIDM
         WCmIwog4ek5Z4K7de4k0rPlnwJIhioqgrHYaSFZERUEkBYCu712QbQ9kcn9OKTsFk57r
         UO/dDFhIpCU6emWbRe5Mqe2FgznAdcyuh9vF330onWsHn4IyLrMboX8/SV+mMWaPfgep
         W6wAz8QcM0f5m8zK7XwMhE7us4qG0GICKoAQ/lFYEfqIIbBIMdAEVt7PMXz1CL5oyl+G
         ajgA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------040307080602070307070807
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------040307080602070307070807
Content-Type: text/x-patch;
 name="reiser4-lock-wb-list.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-lock-wb-list.patch"

Lock the wb-list, when calling writeback_sb_inodes()

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/entd.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

--- linux-3.5.3.orig/fs/reiser4/entd.c
+++ linux-3.5.3/fs/reiser4/entd.c
@@ -240,6 +240,7 @@ static void entd_flush(struct super_bloc
 
 	if (rq->wbc->nr_to_write > 0) {
 		long result;
+		struct bdi_writeback *wb;
 		struct wb_writeback_work work = {
 			.sb		= super,
 			.sync_mode	= WB_SYNC_NONE,
@@ -257,11 +258,15 @@ static void entd_flush(struct super_bloc
 		 * (via igrab), so that shutdown_super() will wait
 		 * (on reiser4_put_super) for entd completion.
 		 */
+		wb = &rq->mapping->backing_dev_info->wb;
+
+		spin_lock(&wb->list_lock);
 		result = generic_writeback_sb_inodes(super,
-				             &rq->mapping->backing_dev_info->wb,
+				             wb,
 					     rq->wbc,
 					     &work,
 					     true);
+		spin_unlock(&wb->list_lock);
 	}
 	rq->wbc->nr_to_write = ENTD_CAPTURE_APAGE_BURST;
 

--------------040307080602070307070807--
