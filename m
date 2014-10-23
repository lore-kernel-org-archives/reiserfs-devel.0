From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv2 1/3] reiser4: block_alloc: improve error handling in reiser4_grab_reserved().
Date: Thu, 23 Oct 2014 11:18:03 +0400
Message-ID: <1414048685-4224-2-git-send-email-intelfx100@gmail.com>
References: <1414048685-4224-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6u0qhjwyQVcC1kbIdWYwU+c7gw7x9vpPJ7kkSbkTsts=;
        b=ap6pKaKHha4T1pJAqeyjNJPcpYG0Me+M905oT+Xp5jbgkglHka/M6BK05+nGqTyExQ
         x/VVGl4hpZcYKkqu/KCCNu7u/cNcL3Cn0PtryYAjisrYdtdO28KaDlinJ6ID+eMD3zBJ
         9CqUfVyMELNgohZRmj6WVl3fFsjCoXwZ0x4p7SsTLxd7F89cv2SWeTUAJ9WYqUZNTT0j
         6kiYhsH45aasYp51ROLlTz6RwCwMISnAWzh1t2/etcxXNqlMzk9fgLIGsmXbh96o0A6q
         aXfdYVVXx1riJqFRu/LIeeR+TKT0FZkqWnAKVsvI23e1Wj9IKzD719ZgbV0DzG8tvtkS
         vNKQ==
In-Reply-To: <1414048685-4224-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

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
2.1.2

