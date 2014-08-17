From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv2 1/7] reiser4: block_alloc: add BA_SOME_SPACE flag for grabbing a fixed amount of space.
Date: Sun, 17 Aug 2014 20:26:29 +0400
Message-ID: <1408292795-1841-2-git-send-email-intelfx100@gmail.com>
References: <1408292795-1841-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bWxj6zzt6njtHZiL4qOCYsIxycM4MUC0ZZeeZu0lTWE=;
        b=KiwA5OQKTJj2kNlW2rA6HapXPawhgT54als6qOltFKmWrxdlea2ygsZMIknuupszaQ
         /QkJzgBW3jXbf4KxVDbuvmmyJCqYLc44fDgppxfMv2C+G92W0o8oNcK5UoZuPe/wAuTR
         EB89CuxSEXFwNa/NxuY1iHskcJdaeXssfGJL1pvBgFLHnAFhOdqG4rztcQ7lTwJhwrjF
         U6TSOnk/tpD7aVjdM/4aOPkAMGQrdUMMGLqujud/78TbHtxDTs9xQOh1G3IlD96iJF81
         /pllL4Zqt7gGS1qCSs8gSN8lC7LEyNqg2/8yUuJvdDrHRgQTrJ3nWpMvhslfHHOOmo4o
         9s6g==
In-Reply-To: <1408292795-1841-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

This is used for FITRIM ioctl which will iteratively grab, allocate and trim disk space
bit by bit to avoid starving the rest of system.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.c | 6 ++++++
 fs/reiser4/block_alloc.h | 5 ++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index d3d730c..8797b43 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -276,6 +276,12 @@ reiser4_grab(reiser4_context * ctx, __u64 count, reiser4_ba_flags_t flags)
 
 	free_blocks = sbinfo->blocks_free;
 
+	if (flags & BA_SOME_SPACE) {
+		/* Reserve 25% of all free space. */
+		count = free_blocks;
+		do_div(count, 4);
+	}
+
 	if ((use_reserved && free_blocks < count) ||
 	    (!use_reserved && free_blocks < count + sbinfo->blocks_reserved)) {
 		ret = RETERR(-ENOSPC);
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
2.0.4

