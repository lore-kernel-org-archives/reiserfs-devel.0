From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv5 01/10] reiser4: block_alloc: add BA_SOME_SPACE flag for grabbing a fixed amount of space.
Date: Fri, 13 Feb 2015 03:48:10 +0300
Message-ID: <1423788499-30430-2-git-send-email-intelfx100@gmail.com>
References: <1423788499-30430-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hb53do+4dmzpb8EcS3bfkWvB7DenIQiJnXKhP/gu7TY=;
        b=Xw7BgZ6A8ivD+xDh6MAmDNNDdjqlUNVjqeHSRVlcU4k6wxPqsHCSZPvIaf1lKzHE/Q
         5C9oernXmWVdekFKcglOozLNKjzQMtOTQrUh3drlRjXYKOmbYD+yLLpMD6zl+mLbjQXV
         JUq+ec8v47bN2tJqswnwcJZy6UgZNmEffnbBNRvZQzsXeO2h/2S6Vhf/4rnuus2kxLkB
         5uQH7s8kl5W8DS/kYvn4F2ENzqKxZs+Ke7zXtlnmru8Kb9t4bZApQRz9lnfbR2z4vUop
         ZkKgvsVHEslC3F3k/vMI9zauF6gIlvOsSaaYq6pZCJH8Q2qmoOmorKnCOQQwvf+j4rMa
         QOIw==
In-Reply-To: <1423788499-30430-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

This is used for FITRIM ioctl which will iteratively grab, allocate and trim disk space
bit by bit to avoid starving the rest of system.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.c | 22 ++++++++++++++++++----
 fs/reiser4/block_alloc.h |  5 ++++-
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 324b11c..14dd378 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -264,7 +264,7 @@ int reiser4_check_block_counters(const struct super_block *super)
 static int
 reiser4_grab(reiser4_context * ctx, __u64 count, reiser4_ba_flags_t flags)
 {
-	__u64 free_blocks;
+	__s64 allowed_blocks;
 	int ret = 0, use_reserved = flags & BA_RESERVED;
 	reiser4_super_info_data *sbinfo;
 
@@ -280,10 +280,24 @@ reiser4_grab(reiser4_context * ctx, __u64 count, reiser4_ba_flags_t flags)
 
 	spin_lock_reiser4_super(sbinfo);
 
-	free_blocks = sbinfo->blocks_free;
+	allowed_blocks = use_reserved ? sbinfo->blocks_free
+	                              : sbinfo->blocks_free - sbinfo->blocks_reserved;
 
-	if ((use_reserved && free_blocks < count) ||
-	    (!use_reserved && free_blocks < count + sbinfo->blocks_reserved)) {
+	if (flags & BA_SOME_SPACE) {
+		/* Reserve 25% of all free space */
+		if (allowed_blocks <= 0) {
+			/* No space at all */
+			ret = RETERR(-ENOSPC);
+			goto unlock_and_ret;
+		}
+
+		count = allowed_blocks >> 2;
+		if (count == 0) {
+			/* Less than 4 free blocks */
+			count = allowed_blocks;
+		}
+	} else if (count > allowed_blocks) {
+		/* Not enough space */
 		ret = RETERR(-ENOSPC);
 		goto unlock_and_ret;
 	}
diff --git a/fs/reiser4/block_alloc.h b/fs/reiser4/block_alloc.h
index a4e98af..bfc6be9 100644
--- a/fs/reiser4/block_alloc.h
+++ b/fs/reiser4/block_alloc.h
@@ -79,7 +79,10 @@ enum reiser4_ba_flags {
 	BA_FORCE = (1 << 5),
 
 	/* use default start value for free blocks search. */
-	BA_USE_DEFAULT_SEARCH_START = (1 << 6)
+	BA_USE_DEFAULT_SEARCH_START = (1 << 6),
+
+	/* reserve some fixed amount of space */
+	BA_SOME_SPACE = (1 << 7),
 };
 
 typedef enum reiser4_ba_flags reiser4_ba_flags_t;
-- 
2.3.0

