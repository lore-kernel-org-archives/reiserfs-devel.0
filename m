From: Joe Perches <joe@perches.com>
Subject: [PATCH 24/29] reiserfs: Avoid comma separated statements
Date: Mon, 24 Aug 2020 21:56:21 -0700
Message-ID: <29b5ea94496d64e7a73af216b01f26d9ff7ac1fe.1598331149.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1598331148.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org

Use semicolons and braces.

Signed-off-by: Joe Perches <joe@perches.com>
---
 fs/reiserfs/fix_node.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/fs/reiserfs/fix_node.c b/fs/reiserfs/fix_node.c
index fefe87e1c099..aea63e67a42b 100644
--- a/fs/reiserfs/fix_node.c
+++ b/fs/reiserfs/fix_node.c
@@ -235,8 +235,10 @@ static void check_left(struct tree_balance *tb, int h, int cur_free)
 	d_size = 0, ih_size = IH_SIZE;
 
 	/* first item may be merge with last item in left neighbor */
-	if (vi->vi_type & VI_TYPE_LEFT_MERGEABLE)
-		d_size = -((int)IH_SIZE), ih_size = 0;
+	if (vi->vi_type & VI_TYPE_LEFT_MERGEABLE) {
+		d_size = -((int)IH_SIZE);
+		ih_size = 0;
+	}
 
 	tb->lnum[0] = 0;
 	for (i = 0; i < vn->vn_nr_item;
@@ -321,8 +323,10 @@ static void check_right(struct tree_balance *tb, int h, int cur_free)
 	d_size = 0, ih_size = IH_SIZE;
 
 	/* last item may be merge with first item in right neighbor */
-	if (vi->vi_type & VI_TYPE_RIGHT_MERGEABLE)
-		d_size = -(int)IH_SIZE, ih_size = 0;
+	if (vi->vi_type & VI_TYPE_RIGHT_MERGEABLE) {
+		d_size = -(int)IH_SIZE;
+		ih_size = 0;
+	}
 
 	tb->rnum[0] = 0;
 	for (i = vn->vn_nr_item - 1; i >= 0;
@@ -1534,8 +1538,10 @@ static int ip_check_balance(struct tree_balance *tb, int h)
 			nver1 = get_num_ver(vn->vn_mode, tb, h,
 					    0, -1, 0, -1,
 					    snum012 + NOTHING_SHIFT_FLOW, FLOW);
-			if (nver > nver1)
-				nset = NOTHING_SHIFT_FLOW, nver = nver1;
+			if (nver > nver1) {
+				nset = NOTHING_SHIFT_FLOW;
+				nver = nver1;
+			}
 		}
 
 		/*
@@ -1559,8 +1565,10 @@ static int ip_check_balance(struct tree_balance *tb, int h)
 					     ((tb->lbytes != -1) ? 1 : 0),
 					     tb->lbytes, 0, -1,
 					     snum012 + LEFT_SHIFT_FLOW, FLOW);
-			if (lnver > lnver1)
-				lset = LEFT_SHIFT_FLOW, lnver = lnver1;
+			if (lnver > lnver1) {
+				lset = LEFT_SHIFT_FLOW;
+				lnver = lnver1;
+			}
 		}
 
 		/*
@@ -1590,8 +1598,10 @@ static int ip_check_balance(struct tree_balance *tb, int h)
 					     tb->rbytes,
 					     snum012 + RIGHT_SHIFT_FLOW, FLOW);
 
-			if (rnver > rnver1)
-				rset = RIGHT_SHIFT_FLOW, rnver = rnver1;
+			if (rnver > rnver1) {
+				rset = RIGHT_SHIFT_FLOW;
+				rnver = rnver1;
+			}
 		}
 
 		/*
@@ -1622,8 +1632,10 @@ static int ip_check_balance(struct tree_balance *tb, int h)
 					       ((tb->rbytes != -1) ? 1 : 0)),
 					      tb->rbytes,
 					      snum012 + LR_SHIFT_FLOW, FLOW);
-			if (lrnver > lrnver1)
-				lrset = LR_SHIFT_FLOW, lrnver = lrnver1;
+			if (lrnver > lrnver1) {
+				lrset = LR_SHIFT_FLOW;
+				lrnver = lrnver1;
+			}
 		}
 
 		/*
-- 
2.26.0

