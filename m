From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: fix up incorrect recalculation of maximal balance
 overhead
Date: Fri, 6 May 2016 13:04:16 +0200
Message-ID: <6fcfefcb-7886-de2b-e19c-642f7de8587a@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------2F86F4114ABDFF70850819FB"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version;
        bh=SkokJsa8vQp3avUwTR88fejKxWl0AQhacoXj0gALuu8=;
        b=K+B5Oet9n57j2h5U2pEnzeQYxvxPw27oKFOkRRHV83VFFhjTNZDHETCKTC0eCR+xYW
         veFRRMg/VBDvEDAM6MwxPCB+NMn4cvMH+9F51hoGrNXNUw/dPk+cQ+xfak7gzIpvALTc
         WeV2QLwf7oUa+beD8jXYrm3irLfIhXsfeg6wK7Yr+HnULCgGosXiuyT4eRkUXLK+rFKC
         dO6O5kQHqwpH3E9E4y3EgdoJuWuv0nQtBV9TAqeID8sq9mM/h1Vps9EKFCnBAd1rLQ7q
         8p0n65ktbB4vHIOsVk5Vg9+6UY37VrjNYsCDq7X4NxUT8A0JU4VqowRW+ZiffuY/TKJV
         kQhw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------2F86F4114ABDFF70850819FB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------2F86F4114ABDFF70850819FB
Content-Type: text/x-patch;
 name="reiser4-max-balance-overhead-update-fixup.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-max-balance-overhead-update-fixup.patch"

Fix up incorrect recalculation of maximal balance overhead.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/tree_mod.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/fs/reiser4/tree_mod.c
+++ b/fs/reiser4/tree_mod.c
@@ -159,7 +159,7 @@ znode *reiser4_add_tree_root(znode * old
 
 				/* recalculate max balance overhead */
 				tree->estimate_one_insert =
-				    estimate_one_insert_item(tree);
+					calc_estimate_one_insert(tree->height);
 
 				tree->root_block = *znode_get_block(new_root);
 				in_parent = &new_root->in_parent;
@@ -303,7 +303,8 @@ static int reiser4_kill_root(reiser4_tre
 		--tree->height;
 
 		/* recalculate max balance overhead */
-		tree->estimate_one_insert = estimate_one_insert_item(tree);
+		tree->estimate_one_insert =
+			calc_estimate_one_insert(tree->height);
 
 		assert("nikita-1202",
 		       tree->height == znode_get_level(new_root));

--------------2F86F4114ABDFF70850819FB--
