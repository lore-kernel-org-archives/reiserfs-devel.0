From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 1/8 v3]reiserfs:stree.c Fix variable set but not used.
Date: Mon, 14 Jun 2010 16:56:17 -0700
Message-ID: <1276559777-3017-1-git-send-email-justinmattock@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=Oyld44lnGjMlgFMD2tfQdpiYFrR+APsXdiCEgOT5TUU=;
        b=Q1IiFb4HJRCdPztzQHp07kHnoP5qy2nXT6dgBkao7hU8o4YUk6E/wHUa+7kPQYVgwM
         UOgoBWQHoRm57zsfhIVZ/4meEcW4nZjKtTdJMjuHSSmaWb1B9bkvAvTJByFwBOkqLUuC
         Z52cW6Uyc/5KoM6ZpYvxv0B20Mt0nHywHfvUc=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, linux-kernel@vger.kernel.org, "Justin P. Mattock" <justinmattock@gmail.com>

Resend of this patch due to previous whitespace issues and a messup
with v2.
The below fixes this warning:
fs/reiserfs/stree.c: In function 'search_by_key':
fs/reiserfs/stree.c:602:6: warning: variable 'right_neighbor_of_leaf_node' set but not used

 Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>
 Acked-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiserfs/stree.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 313d39d..1d901c3 100644
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
@@ -617,8 +616,6 @@ int search_by_key(struct super_block *sb, const struct cpu_key *key,	/* Key to s
 
 	pathrelse(search_path);
 
-	right_neighbor_of_leaf_node = 0;
-
 	/* With each iteration of this loop we search through the items in the
 	   current node, and calculate the next current node(next path element)
 	   for the next iteration of this loop.. */
@@ -695,7 +692,6 @@ int search_by_key(struct super_block *sb, const struct cpu_key *key,	/* Key to s
 			   starting from the root. */
 			block_number = SB_ROOT_BLOCK(sb);
 			expected_level = -1;
-			right_neighbor_of_leaf_node = 0;
 
 			/* repeat search from the root */
 			continue;
-- 
1.7.1.rc1.21.gf3bd6

