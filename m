From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 10/8] context.c cleanup
Date: Tue, 23 Oct 2007 15:06:30 +0200
Message-ID: <1193144790.6236.61.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- context.c.orig	2007-10-23 15:01:52.000000000 +0200
+++ context.c	2007-10-23 15:03:59.000000000 +0200
@@ -70,7 +70,7 @@ static void _reiser4_init_context(reiser
    This function should be called at the beginning of reiser4 part of
    syscall.
 */
-reiser4_context * reiser4_init_context(struct super_block * super)
+reiser4_context * reiser4_init_context(struct super_block *super)
 {
 	reiser4_context *context;
 
@@ -165,7 +165,8 @@ static void balance_dirty_pages_at(reise
    thread released all locks and closed transcrash etc.
 
 */
-static void reiser4_done_context(reiser4_context * context /* context
being released */ )
+static void reiser4_done_context(reiser4_context * context)
+				/* context being released */
 {
 	assert("nikita-860", context != NULL);
 	assert("nikita-859", context->magic == context_magic);
@@ -266,7 +267,7 @@ void reiser4_ctx_gfp_mask_set(void)
 		ctx->gfp_mask = GFP_NOFS;
 }
 
-void reiser4_ctx_gfp_mask_force (gfp_t mask)
+void reiser4_ctx_gfp_mask_force(gfp_t mask)
 {
 	reiser4_context *ctx;
 	ctx = get_current_context();

