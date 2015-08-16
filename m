From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 1/3] reiser4: add metadata checksums support
Date: Sun, 16 Aug 2015 15:22:28 +0200
Message-ID: <55D08E94.1030003@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080408030702080607030407"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=cO6IKj5bfurnaix9gcCKkewyPqHiBIQmWT5ntrma6hU=;
        b=SPzy97PFycwZcVnbwePa3iSDUE81BEpxhsjcxCQMXy+5pclVHeHhx3+l/14b1fgXVk
         P1aeMFGoBJS2pJYmB4TclmIhrluArOsBRfh/reyGD+n70v/ryxwBRE0Af207uK3fPcqS
         SWAjY5Y34vOXBfLaGdBG/DCeyHgEGSB3tZuWwCLT/NCAEexzMVU9PFrTZHg2pDU3uUJU
         B9aYa5HyOQX7cLURu94+4+jL/OIahJs3hKGNk5CV8wDDZYv1nK4zhOSL9ywRDBRPerg9
         iBrhraHL+k98mGaRIxHMXJtS8bM6GSHKAizJsO0mI+ph0ouXORZ4LBzNtjzsVGwHPw1r
         ekDw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080408030702080607030407
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------080408030702080607030407
Content-Type: text/x-patch;
 name="reiser4-metadata-checksums.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-metadata-checksums.patch"

---
 fs/reiser4/Makefile             |    1 
 fs/reiser4/checksum.c           |   29 +++++++++++++++++++++++++++
 fs/reiser4/checksum.h           |   39 +++++++++++++++++++++++++++++++++++++
 fs/reiser4/plugin/node/node.c   |    3 +-
 fs/reiser4/plugin/node/node.h   |    3 ++
 fs/reiser4/plugin/node/node41.c |   42 +++++++++++++++++++++++++++++++---------
 fs/reiser4/plugin/node/node41.h |    1 
 fs/reiser4/super.h              |    1 
 fs/reiser4/super_ops.c          |    7 ++++++
 fs/reiser4/wander.c             |   13 +++++++++++-
 fs/reiser4/znode.c              |    3 --
 fs/reiser4/znode.h              |    1 
 12 files changed, 130 insertions(+), 13 deletions(-)

--- a/fs/reiser4/plugin/node/node.h
+++ b/fs/reiser4/plugin/node/node.h
@@ -233,6 +233,9 @@ typedef struct node_plugin {
 	/* change plugin id of items which are in a node already. Currently it is Used in tail conversion for regular
 	 * files */
 	int (*set_item_plugin) (coord_t * coord, item_id);
+	/* calculate and check/update znode's checksum
+	   (if @check is true, then check, otherwise update) */
+	int (*csum)(znode *node, int check);
 } node_plugin;
 
 typedef enum {
--- a/fs/reiser4/Makefile
+++ b/fs/reiser4/Makefile
@@ -48,6 +48,7 @@ reiser4-y := \
 		   safe_link.o \
 		   blocknrlist.o \
 		   discard.o \
+		   checksum.o \
            \
 		   plugin/plugin.o \
 		   plugin/plugin_set.o \
--- /dev/null
+++ b/fs/reiser4/checksum.c
@@ -0,0 +1,29 @@
+#include <linux/err.h>
+#include "debug.h"
+#include "checksum.h"
+
+int reiser4_init_csum_tfm(struct crypto_shash **tfm)
+{
+	*tfm = crypto_alloc_shash("crc32c", 0, 0);
+	if (IS_ERR(*tfm)) {
+		*tfm = NULL;
+		return 1;
+	}
+	return 0;
+}
+
+void reiser4_done_csum_tfm(struct crypto_shash *tfm)
+{
+	crypto_free_shash(tfm);
+}
+
+/*
+   Local variables:
+   c-indentation-style: "K&R"
+   mode-name: "LC"
+   c-basic-offset: 8
+   tab-width: 8
+   fill-column: 120
+   scroll-step: 1
+   End:
+*/
--- /dev/null
+++ b/fs/reiser4/checksum.h
@@ -0,0 +1,39 @@
+#ifndef __CHECKSUM__
+#define __CHECKSUM__
+
+#include <crypto/hash.h>
+
+int reiser4_init_csum_tfm(struct crypto_shash **tfm);
+void reiser4_done_csum_tfm(struct crypto_shash *tfm);
+u32 static inline reiser4_crc32c(struct crypto_shash *tfm,
+				 u32 crc, const void *address,
+				 unsigned int length)
+{
+	struct {
+		struct shash_desc shash;
+		char ctx[4];
+	} desc;
+	int err;
+
+	desc.shash.tfm = tfm;
+	desc.shash.flags = 0;
+	*(u32 *)desc.ctx = crc;
+
+	err = crypto_shash_update(&desc.shash, address, length);
+	BUG_ON(err);
+	return *(u32 *)desc.ctx;
+}
+
+#endif /* __CHECKSUM__ */
+
+/*
+   Local variables:
+   c-indentation-style: "K&R"
+   mode-name: "LC"
+   c-basic-offset: 8
+   tab-width: 8
+   fill-column: 120
+   scroll-step: 1
+   End:
+*/
+
--- a/fs/reiser4/plugin/node/node.c
+++ b/fs/reiser4/plugin/node/node.c
@@ -153,7 +153,8 @@ node_plugin node_plugins[LAST_NODE_ID] =
 		.fast_cut = fast_cut_node40,
 		.max_item_size = max_item_size_node41,
 		.prepare_removal = prepare_removal_node40,
-		.set_item_plugin = set_item_plugin_node40
+		.set_item_plugin = set_item_plugin_node40,
+		.csum = csum_node41
 	}
 };
 
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -6,6 +6,7 @@
 #include "ktxnmgrd.h"
 #include "flush.h"
 #include "safe_link.h"
+#include "checksum.h"
 
 #include <linux/vfs.h>
 #include <linux/writeback.h>
@@ -249,6 +250,7 @@ static void reiser4_put_super(struct sup
 		get_super_private(super)->df_plug->release(super);
 
 	reiser4_done_formatted_fake(super);
+	reiser4_done_csum_tfm(sbinfo->csum_tfm);
 
 	/* stop daemons: ktxnmgr and entd */
 	reiser4_done_entd(super);
@@ -514,6 +516,10 @@ static int fill_super(struct super_block
 		goto failed_init_sinfo;
 
 	sbinfo = get_super_private(super);
+
+	if ((result = reiser4_init_csum_tfm(&sbinfo->csum_tfm)) != 0)
+		goto failed_init_csum_tfm;
+
 	/* initialize various reiser4 parameters, parse mount options */
 	if ((result = reiser4_init_super_data(super, data)) != 0)
 		goto failed_init_super_data;
@@ -592,6 +598,7 @@ static int fill_super(struct super_block
  failed_init_super_data:
 	reiser4_done_fs_info(super);
  failed_init_sinfo:
+ failed_init_csum_tfm:
 	reiser4_exit_context(&ctx);
 	return result;
 }
--- a/fs/reiser4/plugin/node/node41.c
+++ b/fs/reiser4/plugin/node/node41.c
@@ -17,6 +17,7 @@
 #include "../../tap.h"
 #include "../../tree.h"
 #include "../../super.h"
+#include "../../checksum.h"
 #include "../../reiser4.h"
 
 #include <asm/uaccess.h>
@@ -27,7 +28,7 @@
  * node41 layout it almost the same as node40:
  * node41_header is at the beginning and a table of item headers
  * is at the end. Ther difference is that node41_header contains
- * a 32-bit reference counter (see node41.h)
+ * a 32-bit checksum (see node41.h)
  */
 
 static const __u32 REISER4_NODE41_MAGIC = 0x19051966;
@@ -41,12 +42,41 @@ static inline node41_header *node41_node
 	return (node41_header *)zdata(node);
 }
 
+int csum_node41(znode *node, int check)
+{
+	__u32 cpu_csum;
+
+	cpu_csum = reiser4_crc32c(get_current_super_private()->csum_tfm,
+				  ~0,
+				  zdata(node),
+				  sizeof(struct node40_header));
+	cpu_csum = reiser4_crc32c(get_current_super_private()->csum_tfm,
+				  cpu_csum,
+				  zdata(node) + sizeof(struct node41_header),
+				  reiser4_get_current_sb()->s_blocksize -
+				  sizeof(node41_header));
+	if (check)
+		return cpu_csum == nh41_get_csum(node41_node_header(node));
+	else {
+		nh41_set_csum(node41_node_header(node), cpu_csum);
+		return 1;
+	}
+}
+
 /*
  * plugin->u.node.parse
  * look for description of this method in plugin/node/node.h
  */
 int parse_node41(znode *node /* node to parse */)
 {
+	int ret;
+
+	ret = csum_node41(node, 1/* check */);
+	if (!ret)
+		warning("edward-1645",
+			"block %llu: bad checksum. FSCK?",
+			*jnode_get_block(ZJNODE(node)));
+
 	return parse_node40_common(node, REISER4_NODE41_MAGIC);
 }
 
@@ -56,14 +86,8 @@ int parse_node41(znode *node /* node to
  */
 int init_node41(znode *node /* node to initialise */)
 {
-	node41_header *header41;
-
-	init_node40_common(node, node_plugin_by_id(NODE41_ID),
-			   sizeof(node41_header), REISER4_NODE41_MAGIC);
-
-	header41 = node41_node_header(node);
-	nh41_set_csum(header41, 0);
-	return 0;
+	return init_node40_common(node, node_plugin_by_id(NODE41_ID),
+				  sizeof(node41_header), REISER4_NODE41_MAGIC);
 }
 
 /*
--- a/fs/reiser4/plugin/node/node41.h
+++ b/fs/reiser4/plugin/node/node41.h
@@ -29,6 +29,7 @@ int max_item_size_node41(void);
 int shift_node41(coord_t *from, znode *to, shift_direction pend,
 		 int delete_child, int including_stop_coord,
 		 carry_plugin_info *info);
+int csum_node41(znode *node, int check);
 
 #ifdef GUESS_EXISTS
 int guess_node41(const znode * node);
--- a/fs/reiser4/znode.c
+++ b/fs/reiser4/znode.c
@@ -635,7 +635,7 @@ int zload_ra(znode * node /* znode to lo
 }
 
 /* load content of node into memory */
-int zload(znode * node)
+int zload(znode *node)
 {
 	return zload_ra(node, NULL);
 }
@@ -651,7 +651,6 @@ int zinit_new(znode * node /* znode to i
 void zrelse(znode * node /* znode to release references to */ )
 {
 	assert("nikita-1381", znode_invariant(node));
-
 	jrelse(ZJNODE(node));
 }
 
--- a/fs/reiser4/super.h
+++ b/fs/reiser4/super.h
@@ -275,6 +275,7 @@ struct reiser4_super_info_data {
 	 * more details
 	 */
 	struct d_cursor_info d_info;
+	struct crypto_shash *csum_tfm;
 
 #ifdef CONFIG_REISER4_BADBLOCKS
 	/* Alternative master superblock offset (in bytes) */
--- a/fs/reiser4/wander.c
+++ b/fs/reiser4/wander.c
@@ -769,8 +769,19 @@ static int write_jnodes_to_disk_extent(
 			JF_SET(cur, JNODE_WRITEBACK);
 			JF_CLR(cur, JNODE_DIRTY);
 			ON_DEBUG(cur->written++);
-			spin_unlock_jnode(cur);
 
+			assert("edward-1647",
+			       ergo(jnode_is_znode(cur), JF_ISSET(cur, JNODE_PARSED)));
+			spin_unlock_jnode(cur);
+			/*
+			 * update checksum
+			 */
+			if (jnode_is_znode(cur)) {
+				zload(JZNODE(cur));
+				if (node_plugin_by_node(JZNODE(cur))->csum)
+					node_plugin_by_node(JZNODE(cur))->csum(JZNODE(cur), 0);
+				zrelse(JZNODE(cur));
+			}
 			ClearPageError(pg);
 			set_page_writeback(pg);
 
--- a/fs/reiser4/znode.h
+++ b/fs/reiser4/znode.h
@@ -172,6 +172,7 @@ extern int zload_ra(znode * node, ra_inf
 extern int zinit_new(znode * node, gfp_t gfp_flags);
 extern void zrelse(znode * node);
 extern void znode_change_parent(znode * new_parent, reiser4_block_nr * block);
+extern void znode_update_csum(znode *node);
 
 /* size of data in znode */
 static inline unsigned

--------------080408030702080607030407--
