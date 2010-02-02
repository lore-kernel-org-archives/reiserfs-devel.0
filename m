From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 7/7] reiser4: fixup checkin-checkout jnodes for entd
Date: Tue, 2 Feb 2010 02:56:35 +0100
Message-ID: <201002020256.35624.edward.shishkin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:from:to:subject:date
         :user-agent:mime-version:message-id:content-type
         :content-transfer-encoding;
        bh=q2ewVYvn+yvDcP3F0WL1IEImbHivie0xkJmYtGPOl8I=;
        b=wJZbIcMRN/C65+jiPrASO2zEYaMpnk2nJknSBv4HfSlqBicJlz4YagZVJ56qvkkt1f
         bJ+v5tqa/o9lQ1a0x0Agd1C0O/e3qtevuy5O0v9EXv7wZGK2iigB2RAbvKl/H9Fw7Is4
         4QLKJyFz6Xe/4Y3a0ZrK6dZgGkHU4QHoe4vaM=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

The bug: reiser4_writeout() calls jput for jnode
which is already destroyed:

Fix up: take  the reference earler (at the point where the
jnode is attached for entd work).

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/plugin/file/file.c |    6 ++++--
 fs/reiser4/vfs_ops.c          |    4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

Index: linux-2.6.33-rc5-mm1/fs/reiser4/plugin/file/file.c
===================================================================
--- linux-2.6.33-rc5-mm1.orig/fs/reiser4/plugin/file/file.c
+++ linux-2.6.33-rc5-mm1/fs/reiser4/plugin/file/file.c
@@ -824,14 +824,16 @@ int find_or_create_extent(struct page *p
 
 	BUG_ON(node->atom == NULL);
 	JF_CLR(node, JNODE_WRITE_PREPARED);
-	jput(node);
 
 	if (get_current_context()->entd) {
 		entd_context *ent = get_entd_context(node->tree->super);
 
 		if (ent->cur_request->page == page)
-			ent->cur_request->node = node;
+			/* the following reference will be
+			   dropped in reiser4_writeout */
+			ent->cur_request->node = jref(node);
 	}
+	jput(node);
 	return 0;
 }
 
Index: linux-2.6.33-rc5-mm1/fs/reiser4/vfs_ops.c
===================================================================
--- linux-2.6.33-rc5-mm1.orig/fs/reiser4/vfs_ops.c
+++ linux-2.6.33-rc5-mm1/fs/reiser4/vfs_ops.c
@@ -184,7 +184,7 @@ void reiser4_writeout(struct super_block
 				 * requested page itself - start flush from
 				 * that page
 				 */
-				node = jref(ent->cur_request->node);
+				node = ent->cur_request->node;
 		}
 
 		result = flush_some_atom(node, &nr_submitted, wbc,
@@ -192,6 +192,8 @@ void reiser4_writeout(struct super_block
 		if (result != 0)
 			warning("nikita-31001", "Flush failed: %i", result);
 		if (node)
+			/* drop the reference aquired
+			   in find_or_create_extent() */
 			jput(node);
 		if (!nr_submitted)
 			break;
