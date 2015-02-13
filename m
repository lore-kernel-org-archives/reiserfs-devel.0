From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv5 10/10] reiser4: batch discard support: honor minimal extent length passed from the userspace.
Date: Fri, 13 Feb 2015 03:48:19 +0300
Message-ID: <1423788499-30430-11-git-send-email-intelfx100@gmail.com>
References: <1423788499-30430-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HhHREwSmm4Fp79H4564RmPVV1IZtvGoYC5LWt9/J3D8=;
        b=lA+7hWK+a711PBZu2g5C7jzZ9Gt7jUdPEjMZyIXaU1kFYG0/rRTI2CCg6RGdkskRsE
         QPfw2Ly2edPJMVXrCFmSFcKS8kXJuQB0w2H9NHwTkjREQn7Kc187TgsUDnRQzI3TlBRt
         NUIR2x45Bx7H8s6N3I0Rm+4YUjyFi6DCoIADTiEXA0BhMdPtwM9+SihETUVC1m8VzDY2
         mvrTqnXsLlpbLf3UwYQ74+jFDyKZJ6NQDQdJV/PR7aHXrQQm1U4q5K30lzjpwTcdb5M6
         D3VFmR3XBOFY6G4DQTpchsfsJGTi1t45DxnpF4MCv/77UXYTo+V2kO6F8DBqX4r+nsXt
         VVaA==
In-Reply-To: <1423788499-30430-1-git-send-email-intelfx100@gmail.com>
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
2.3.0

