From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv2 3/3] reiser4: block_alloc: get rid of discard-related hack in reiser4_dealloc_blocks().
Date: Mon,  8 Sep 2014 22:43:51 +0400
Message-ID: <1410201831-11722-4-git-send-email-intelfx100@gmail.com>
References: <1410201831-11722-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3peAPL4mM/76xIwgs+pzK+4rlLlqB+dQTKtemgcs9OM=;
        b=j/M/ue24f/5e8L6Fr6s/Btl5bISDsMOgI+ZGUuv46gmzTc3YfVTTi4r0MSDqqQf0sa
         JPm6eVIJaGFgSDKKbeuxUEOk/M2vPjvv4+bEifWoqQndJb7hvVW5ZHsYZAMUflEO+nM5
         4Z4toBAKLOiDJ0vyKtZW25DNNzn9UGXNXxjkwo1wi5ObfLZMJawx5opKjNn4s8C2yGOu
         F2STdE+cd1ETS9ytt/e8MhG5WRc14dsjE8lOW5S0LhBGvnMp3NPeRElQBNMh17mH04l9
         IL86kbblZ6B1d3Xy1VNPjg3GMRnhdVTmah2ZmyQzt4ogtE2r9W2kG66jf2myepuuuVnJ
         gOOQ==
In-Reply-To: <1410201831-11722-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

When discard was enabled, immediate deallocations were made deferred in order
to record these extents in the atom's delete set and, consequently, allow
their discarding.

However, this is wrong in the following way. Immediate deallocations make use
of target allocation stage and ancillary flags like BA_PERMANENT and BA_FORMATTED.
By converting immediate deallocations to deferred, these flags are essentially
dropped, and application of deferred deallocations in reiser4_post_write_back_hook()
uses an equivalent of BLOCK_NOT_COUNTED stage and BA_FORMATTED flag.

Dropping this hack does not hinder efficiency of the discard procedure, because
immediate deallocations are now used only to deallocate "just allocated" and not
yet written blocks, which actually do not need to be discarded.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 6e7030a..fee1c18 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -1008,8 +1008,7 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
 		spin_unlock_reiser4_super(sbinfo);
 	}
 
-	if ((flags & BA_DEFER) ||
-	    reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+	if (flags & BA_DEFER) {
 		/*
 		 * These blocks will be later deallocated by apply_dset().
 		 * It is equivalent to a non-deferred deallocation with target
-- 
2.1.0

