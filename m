From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv4 10/10] reiser4: batch discard support: honor minimal extent length passed from the userspace.
Date: Sat, 13 Dec 2014 00:00:46 +0300
Message-ID: <1418418046-10933-11-git-send-email-intelfx100@gmail.com>
References: <1418418046-10933-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fFbBJGva/7eBuo42vC/sELhpaiTPm9ie2/exkSr9l8Y=;
        b=axeQIRgLQo5DJXtEqRaJo11TPFRq4+MRRnLptMg4NsKNat4LUgYOIhRUQgCV1iY4a9
         IpFMmVxMGRXhwo+NGa6EIZHq2oSC4TylI0poKUkh2BnoxHLh8P3Y24qf1EuowB5MbpEA
         7CAxvwaP8JI2AKJHZIHX/ZbLIxQ+fLdnec4ToR3xp2RsUg5M+b/ICvvAcw1spI8FFJoV
         N0BglCTPCfdsqJ6l5LW5QFqj1ciiOhI1zmhtlWqulMVpXqb38iz/Ommh2l8PaToA8BF5
         aYjz0RJ0yUGXNPzqltm1WBGvidGz1FSF5nWpkZbTLLON93v8oDrp5+DrHd62SZrCZYE+
         X7+A==
In-Reply-To: <1418418046-10933-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/super_ops.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
index ab32ce4..2c98959 100644
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -487,7 +487,7 @@ static int reiser4_show_options(struct seq_file *m, struct dentry *dentry)
 int reiser4_trim_fs(struct super_block *super, struct fstrim_range* range)
 {
 	reiser4_blocknr_hint hint;
-	reiser4_block_nr start, end, len, minlen, discarded_count = 0;
+	reiser4_block_nr start, end, len, discarded_count = 0;
 	reiser4_context *ctx;
 	txn_atom *atom;
 	int ret, finished = 0;
@@ -501,11 +501,11 @@ int reiser4_trim_fs(struct super_block *super, struct fstrim_range* range)
 	 */
 	hint.blk = range->start >> super->s_blocksize_bits;
 	hint.max_dist = range->len >> super->s_blocksize_bits;
+	hint.min_len = range->minlen >> super->s_blocksize_bits;
 	hint.block_stage = BLOCK_GRABBED;
 	hint.monotonic_forward = 1;
 
 	end = hint.blk + hint.max_dist;
-	minlen = range->minlen >> super->s_blocksize_bits;
 
 	/*
 	 * We will perform the process in iterations in order not to starve
@@ -538,7 +538,6 @@ int reiser4_trim_fs(struct super_block *super, struct fstrim_range* range)
 		do {
 			/*
 			 * Allocate no more than is grabbed.
-			 * FIXME: use minlen.
 			 *
 			 * NOTE: we do not use BA_PERMANENT in our allocations
 			 * even though we deallocate with BA_DEFER.
-- 
2.1.3

