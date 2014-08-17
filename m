From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv3 1/9] reiser4: block_alloc: add BA_SOME_SPACE flag for grabbing a fixed amount of space.
Date: Mon, 18 Aug 2014 01:52:51 +0400
Message-ID: <1408312379-1990-2-git-send-email-intelfx100@gmail.com>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yp8wtB0+Us8dzF/m6VRNAfEtn2GhwjJLEC7ar+iy8YY=;
        b=x8Wr/1i3Z24OXkARz6ZU4C6xrNxiKsjscv9Jz1WVNXTlb4zLE7+rP56EgGvsoqvoYd
         emh4wic74fwEAARDrE1liYV3A2M8dJaVtNTdLZBcd6Htkyz9Nwfc8ET2OyseM9f1b2Mn
         wZtB8TkuxuaDHQjRWvOmWrnvJys5pJtGLLkSywvgKHtNxY1hPL1rLDXrB0nGSJwoD5Dq
         Ojlx4zxJn3TT2yUu3ACgqtdtLMsXldWmN+FSBzK8w8LZGoc+W2XpRhfN9dLeUCFt+51p
         iQsTja5Pp6Z7rv4UyZWb1O9PJ9JXLTZNcxlCkvPZg8b9xreWITaNRMKi5zuIv39Ygpqo
         Sokg==
In-Reply-To: <1408312379-1990-1-git-send-email-intelfx100@gmail.com>
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
 fs/reiser4/block_alloc.c | 5 +++++
 fs/reiser4/block_alloc.h | 5 ++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index d3d730c..9eed7fc 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -276,6 +276,11 @@ reiser4_grab(reiser4_context * ctx, __u64 count, reiser4_ba_flags_t flags)
 
 	free_blocks = sbinfo->blocks_free;
 
+	if (flags & BA_SOME_SPACE) {
+		/* Reserve 25% of all free space. */
+		count = free_blocks >> 2;
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

