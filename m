From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 1/3] reiser4: block_alloc: improve error handling in reiser4_grab_reserved().
Date: Mon, 18 Aug 2014 18:14:41 +0400
Message-ID: <1408371283-1319-2-git-send-email-intelfx100@gmail.com>
References: <1408371283-1319-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pG6XSD2lsZMNmLFZYiTMNQA9Q7gWHrttRx4kjeTUD/k=;
        b=o9A2XhMp1opFBEfgIQ9H9eWcgcxjfCAMyFWT1GkTZv5g+oP5Uewr9tLK+Kw+L6RV9e
         hNepxrJfCe9Xp2k79S8WbmeboDT6Sp1Hf39t5uR3W2k99cTNxaGekEl/Co0z9xCV3oFo
         SBWQkXLAVNhPx3IaWj9bFic1meqfmI1buDQxt39FRxm1N4bswbH0Zw/aMv+kyomM9SFp
         7rWlvD4kTguoGOSJFmbakwXblTA2dkfLDeM9ii/uQLOA7m6ZYr28lW6Hw1UJFXksupqP
         XCloGNPrOHGRgaQlbMW8IuuXydASV/Yq5PETMk0zwAvfd0yKasPcZKHh/K3hBNURt2oe
         nlOA==
In-Reply-To: <1408371283-1319-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

In case of error in reiser4_grab_space(), return the original error code,
not -ENOSPC unconditionally.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 324b11c..7f9f910 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -360,37 +360,40 @@ int reiser4_grab_reserved(struct super_block *super,
 			  __u64 count, reiser4_ba_flags_t flags)
 {
 	reiser4_super_info_data *sbinfo = get_super_private(super);
+	int ret;
 
 	assert("nikita-3175", flags & BA_CAN_COMMIT);
 
 	/* Check the delete mutex already taken by us, we assume that
 	 * reading of machine word is atomic. */
 	if (sbinfo->delete_mutex_owner == current) {
-		if (reiser4_grab_space
-		    (count, (flags | BA_RESERVED) & ~BA_CAN_COMMIT)) {
+		ret = reiser4_grab_space (count, (flags | BA_RESERVED) & ~BA_CAN_COMMIT);
+
+		if (ret != 0) {
 			warning("zam-1003",
 				"nested call of grab_reserved fails count=(%llu)",
 				(unsigned long long)count);
 			reiser4_release_reserved(super);
-			return RETERR(-ENOSPC);
 		}
-		return 0;
-	}
+	} else {
+		ret = reiser4_grab_space(count, flags);
 
-	if (reiser4_grab_space(count, flags)) {
-		mutex_lock(&sbinfo->delete_mutex);
-		assert("nikita-2929", sbinfo->delete_mutex_owner == NULL);
-		sbinfo->delete_mutex_owner = current;
+		if (ret != 0) {
+			mutex_lock(&sbinfo->delete_mutex);
+			assert("nikita-2929", sbinfo->delete_mutex_owner == NULL);
+			sbinfo->delete_mutex_owner = current;
+			ret = reiser4_grab_space(count, flags | BA_RESERVED);
 
-		if (reiser4_grab_space(count, flags | BA_RESERVED)) {
-			warning("zam-833",
-				"reserved space is not enough (%llu)",
-				(unsigned long long)count);
-			reiser4_release_reserved(super);
-			return RETERR(-ENOSPC);
+			if (ret != 0) {
+				warning("zam-833",
+					"reserved space is not enough (%llu)",
+					(unsigned long long)count);
+				reiser4_release_reserved(super);
+			}
 		}
 	}
-	return 0;
+
+	return ret;
 }
 
 void reiser4_release_reserved(struct super_block *super)
-- 
2.0.4

