From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv3 9/9] reiser4: batch discard support: honor minimal extent length passed from the userspace.
Date: Mon, 18 Aug 2014 01:52:59 +0400
Message-ID: <1408312379-1990-10-git-send-email-intelfx100@gmail.com>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hRq3u502SUKKcOg8iMokS3OiEGdysWBPGyh7f2e8Yuc=;
        b=ICN9aCJHQOHIb2zB0vOHE85+Au55rGSlPVxFd8YKPWUnoMGeCjdLNZfPB/oxEL3A9D
         /BEZ9wBbIgmH03xJphuek8Wv0ZbxiX5hZJgvgSaqW/bfBqU8cmxbeYC+pWTmctecRcOT
         6N2RsFJ9M7OXd3e7AYiECODmSXDZ12CqpETuwwa0NNdqGEJlU2LMk0BJNeiVHYKhjbmW
         MLbA+dawoUlFyE9N/ars7VZ6FG5XM8x8uU9p5L+c4h2c+pZ7iWOWWTk1MJp3n6lpoXRN
         qPhRXxPZa+1qiaRgvhNcrAfmRZgHqIjAvYOSCCT/Y4Sutg7+NHT502cdnG3QnC+HtFqK
         Bysg==
In-Reply-To: <1408312379-1990-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

---
 fs/reiser4/super_ops.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
index d232f30..f4cf0ff 100644
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -481,7 +481,7 @@ static int reiser4_show_options(struct seq_file *m, struct dentry *dentry)
 int reiser4_trim_fs(struct super_block *super, struct fstrim_range* range)
 {
 	reiser4_blocknr_hint hint;
-	reiser4_block_nr start, end, len, minlen, discarded_count = 0;
+	reiser4_block_nr start, end, len, discarded_count = 0;
 	reiser4_context *ctx;
 	txn_atom *atom;
 	int ret, finished = 0;
@@ -495,11 +495,11 @@ int reiser4_trim_fs(struct super_block *super, struct fstrim_range* range)
 	 */
 	hint.blk = range->start >> super->s_blocksize_bits;
 	hint.max_dist = range->len >> super->s_blocksize_bits;
+	hint.min_len = range->minlen >> super->s_blocksize_bits;
 	hint.block_stage = BLOCK_GRABBED;
 	hint.forward = 1;
 
 	end = hint.blk + hint.max_dist;
-	minlen = range->minlen >> super->s_blocksize_bits;
 
 	/*
 	 * We will perform the process in iterations in order not to starve
@@ -532,7 +532,6 @@ int reiser4_trim_fs(struct super_block *super, struct fstrim_range* range)
 		while (ctx->grabbed_blocks != 0) {
 			/*
 			 * Allocate no more than is grabbed.
-			 * FIXME: use minlen.
 			 */
 			len = ctx->grabbed_blocks;
 			ret = reiser4_alloc_blocks(&hint, &start, &len, 0 /* flags */);
-- 
2.0.4

