From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 2/2] reiser4: block_alloc: get rid of discard-related hack in reiser4_dealloc_blocks().
Date: Mon, 18 Aug 2014 15:31:11 +0400
Message-ID: <1408361471-1488-3-git-send-email-intelfx100@gmail.com>
References: <1408361471-1488-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EpKcMuiBlx9KfRmclynuNreEbg0wuZT8R8LNeGGrm58=;
        b=zzsU13E+oVnRLos4N6H+Dlmk62F2Z2oVmkMUr5jpE2Cz5dtQWi4QAM6om0RxIKMuux
         tn+7CwmcgwNZfVe353esDhcoQRvqqF1CmWUCR7w0dSDVHIYPMcjnpfs8HXLfUdho26fI
         FeO+gIyclveoSDODICZ3k5JYKqE+/PiA6mt8rV9iAuFjyk/ZL7Eh5Q3y35NRbxvAsz+Z
         gs+9xnAR74yXZV/2aLTiAPmMPm+24Tud9RUCtjQp4BRY3/W3gsESPzBzBGeKZkrW5us3
         tqt6rIjwigzbsmSFNt73hCcJYLQ1PnY7aSPbDWuvsBvkGY7u0yIK/nQuPYc9N3ey9fGA
         e42w==
In-Reply-To: <1408361471-1488-1-git-send-email-intelfx100@gmail.com>
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
index 324b11c..33ca86c 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -1008,8 +1008,7 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
 		spin_unlock_reiser4_super(sbinfo);
 	}
 
-	if ((flags & BA_DEFER) ||
-	    reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+	if (flags & BA_DEFER) {
 		/* store deleted block numbers in the atom's deferred delete set
 		   for further actual deletion */
 		do {
-- 
2.0.4

