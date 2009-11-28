From: Johannes Buchner <buchner.johannes@gmx.at>
Subject: [PATCH 4/4] reiser4: fixed null pointer dereference
Date: Sat, 28 Nov 2009 19:28:04 +1300
Message-ID: <1259389684-18625-5-git-send-email-buchner.johannes@gmx.at>
References: <1259389179-3772-2-git-send-email-buchner.johannes@gmx.at>
 <1259389684-18625-1-git-send-email-buchner.johannes@gmx.at>
 <1259389684-18625-2-git-send-email-buchner.johannes@gmx.at>
 <1259389684-18625-3-git-send-email-buchner.johannes@gmx.at>
 <1259389684-18625-4-git-send-email-buchner.johannes@gmx.at>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1259389684-18625-4-git-send-email-buchner.johannes@gmx.at>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org
Cc: Johannes Buchner <buchner.johannes@gmx.at>

The parameter wbc=NULL caused a NULL pointer dereference in
reiser4_sync_inodes.
This issue was introduced in patch reiser4-vfs-add-super_operationssync_inodes
---
 fs/reiser4/super_ops.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
index 0c09e3e..f72d42a 100644
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -395,7 +395,7 @@ static void reiser4_sync_inodes(struct super_block *super,
 	reiser4_context *ctx;
 	long to_write;
 
-	if (wbc->for_kupdate)
+	if (wbc == NULL || wbc->for_kupdate)
 		/* reiser4 has its own means of periodical write-out */
 		return;
 
-- 
1.6.4.4

