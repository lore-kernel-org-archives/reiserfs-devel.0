From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 1/8]reiserfs:stree.c Fix variable set but not used.
Date: Mon, 14 Jun 2010 13:26:41 -0700
Message-ID: <1276547208-26569-2-git-send-email-justinmattock@gmail.com>
References: <1276547208-26569-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=HMXLuamrXI1adG4GDeXP6bT7bzi6SQGbNYxpRKoH8eY=;
        b=N6C/XRw6sMFDPVk8dNqR6IjW8JFHUTgszOLTaW7N+EVVR1+Zwo9HcUhQz+cPeHT9Nt
         2m152lATnIs/h7JYXgfTFxl2nbt9pYCV7Ppuguwek22tUbCELKpPW/jcKUL74FfMiA+V
         w6d7c1r1/zPCAKPeH5iiczoi54BMmm9ryDcP0=
In-Reply-To: <1276547208-26569-1-git-send-email-justinmattock@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org, linux-bluetooth@vger.kernel.org, clemens@ladisch.de, debora@linux.vnet.ibm.com, dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-media@vger.kernel.org, "Justin P. Mattock" <justinmattock@gmail.com>

Not sure if this is correct or not.
the below patch gets rid of this warning message
produced by gcc 4.6.0

fs/reiserfs/stree.c: In function 'search_by_key':
fs/reiserfs/stree.c:602:6: warning: variable 'right_neighbor_of_leaf_node' set but not used

 Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>

---
 fs/reiserfs/stree.c |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 313d39d..73086ad 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -599,7 +599,6 @@ int search_by_key(struct super_block *sb, const struct cpu_key *key,	/* Key to s
 	struct buffer_head *bh;
 	struct path_element *last_element;
 	int node_level, retval;
-	int right_neighbor_of_leaf_node;
 	int fs_gen;
 	struct buffer_head *reada_bh[SEARCH_BY_KEY_READA];
 	b_blocknr_t reada_blocks[SEARCH_BY_KEY_READA];
@@ -617,8 +616,7 @@ int search_by_key(struct super_block *sb, const struct cpu_key *key,	/* Key to s
 
 	pathrelse(search_path);
 
-	right_neighbor_of_leaf_node = 0;
-
+	
 	/* With each iteration of this loop we search through the items in the
 	   current node, and calculate the next current node(next path element)
 	   for the next iteration of this loop.. */
@@ -695,8 +693,7 @@ int search_by_key(struct super_block *sb, const struct cpu_key *key,	/* Key to s
 			   starting from the root. */
 			block_number = SB_ROOT_BLOCK(sb);
 			expected_level = -1;
-			right_neighbor_of_leaf_node = 0;
-
+			
 			/* repeat search from the root */
 			continue;
 		}
-- 
1.7.1.rc1.21.gf3bd6
