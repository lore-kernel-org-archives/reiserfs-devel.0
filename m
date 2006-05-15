From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH] Improve prepare_bnode ENOMEM handling
Date: Mon, 15 May 2006 18:56:09 +0200
Message-ID: <48091.0021499314$1147713923@news.gmane.org>
Return-path: <reiserfs-list-return-28618-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline; filename=reiser4_improve_prepare_bnode_ENOMEM_handling.patch
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: Laurent Riffard <laurent.riffard@free.fr>

If prepare_bnode fails to allocate memory, it should return null pointers
because callers will try to release allocated memory (ie non-null
pointers).

Signed-off-by: Laurent Riffard <laurent.riffard@free.fr>
---
 fs/reiser4/plugin/space/bitmap.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletion(-)

Index: linux-2.6-mm/fs/reiser4/plugin/space/bitmap.c
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/plugin/space/bitmap.c
+++ linux-2.6-mm/fs/reiser4/plugin/space/bitmap.c
@@ -741,9 +741,13 @@ prepare_bnode(struct bitmap_node *bnode,
 
 	super = reiser4_get_current_sb();
 
+	/* Callers have to release allocated memory for cjnode an wjnode even
+	 * if we return an error code. */
 	*wjnode_ret = wjnode = bnew();
-	if (wjnode == NULL)
+	if (wjnode == NULL) {
+		*cjnode_ret = NULL;
 		return RETERR(-ENOMEM);
+	}
 
 	*cjnode_ret = cjnode = bnew();
 	if (cjnode == NULL)

--

