From: Johannes Buchner <buchner.johannes@gmx.at>
Subject: [PATCH 3/4] reiser4: generic_sync_sb_inodes doesn't exist anymore
Date: Sat, 28 Nov 2009 19:28:03 +1300
Message-ID: <1259389684-18625-4-git-send-email-buchner.johannes@gmx.at>
References: <1259389179-3772-2-git-send-email-buchner.johannes@gmx.at>
 <1259389684-18625-1-git-send-email-buchner.johannes@gmx.at>
 <1259389684-18625-2-git-send-email-buchner.johannes@gmx.at>
 <1259389684-18625-3-git-send-email-buchner.johannes@gmx.at>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752491AbZK1G1z@vger.kernel.org>
In-Reply-To: <1259389684-18625-3-git-send-email-buchner.johannes@gmx.at>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org
Cc: Johannes Buchner <buchner.johannes@gmx.at>

generic_sync_sb_inodes was removed in d8a8559cd7a9cc, writeback_inodes_sb 
and sync_inodes_sb should replace them.
---
 fs/reiser4/entd.c      |    4 +++-
 fs/reiser4/super_ops.c |    4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/reiser4/entd.c b/fs/reiser4/entd.c
index f41f62d..3a26451 100644
--- a/fs/reiser4/entd.c
+++ b/fs/reiser4/entd.c
@@ -241,7 +241,9 @@ static void entd_flush(struct super_block *super, struct wbq *rq)
 	if (rq->wbc->nr_to_write > 0) {
 		rq->wbc->range_start = 0;
 		rq->wbc->range_end = LLONG_MAX;
-		generic_sync_sb_inodes(super, rq->wbc);
+		writeback_inodes_sb(super);
+		if (rq->wbc->sync_mode == WB_SYNC_ALL)
+			sync_inodes_sb(super);
 	}
 	rq->wbc->nr_to_write = ENTD_CAPTURE_APAGE_BURST;
 	reiser4_writeout(super, rq->wbc);
diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
index 85e6841..0c09e3e 100644
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -412,7 +412,9 @@ static void reiser4_sync_inodes(struct super_block *super,
 	 * call reiser4_writepages for each of dirty inodes to turn dirty pages
 	 * into transactions if they were not yet.
 	 */
-	generic_sync_sb_inodes(super, wbc);
+	writeback_inodes_sb(super);
+	if (wbc->sync_mode == WB_SYNC_ALL)
+		sync_inodes_sb(super);
 
 	/* flush goes here */
 	wbc->nr_to_write = to_write;
-- 
1.6.4.4
