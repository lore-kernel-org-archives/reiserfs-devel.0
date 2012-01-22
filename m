From: Masanari Iida <standby24x7@gmail.com>
Subject: [PATCH] [trivial] reiserfs : Fix typo in lbalance.c
Date: Sun, 22 Jan 2012 23:27:00 +0900
Message-ID: <1327242420-3178-1-git-send-email-standby24x7@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: standby24x7@gmail.com, linux-kernel@vger.kernel.org, trivial@kernel.org

Correct spelling "entry_cout" to "entry_count" in
fs/reiserfs/lbalance.c

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
---
 fs/reiserfs/lbalance.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/reiserfs/lbalance.c b/fs/reiserfs/lbalance.c
index 03d85cb..b43d015 100644
--- a/fs/reiserfs/lbalance.c
+++ b/fs/reiserfs/lbalance.c
@@ -975,7 +975,7 @@ static int leaf_cut_entries(struct buffer_head *bh,
 	   remove */
 	RFALSE(!is_direntry_le_ih(ih), "10180: item is not directory item");
 	RFALSE(I_ENTRY_COUNT(ih) < from + del_count,
-	       "10185: item contains not enough entries: entry_cout = %d, from = %d, to delete = %d",
+	       "10185: item contains not enough entries: entry_count = %d, from = %d, to delete = %d",
 	       I_ENTRY_COUNT(ih), from, del_count);
 
 	if (del_count == 0)
-- 
1.7.6.5

