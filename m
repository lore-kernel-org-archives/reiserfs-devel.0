From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 1/2] reiser4: node41 layout support
Date: Tue, 10 Feb 2015 18:58:30 +0100
Message-ID: <54DA46C6.5080603@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010805000801030801030905"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=TjmYssarNj1fDmKelJPKP8elhU/T5yCbbcMkWLjW6kI=;
        b=C1qd6iPIC+GPWvdhZoXy1qniVwfXPTFtioCAaAbf07db40NsUiyGRkba9tcdp1Uwap
         A8/VwAv9X0CCgfiY9bawcKQXB0AyS2yK2GLoIlglAzGOEZgkhtNgMf0W46x4yeavsv0O
         367Bh25gy2S+X6RTarIZGLl8fmZeQS8wZ+a9FFbrg8GNT2wjka1MThvIWsggRnc0emWo
         JoiL7TvYVAMi7FIE1xC0SVBqXqDRvrPoz5enyOJQKL9QrBjPus1QGh123bSUGYG4tspr
         KWVn0N1TMCBQh5Nz7lzBBTYvdLcx2E4nYULmJHrI7SLmgYiD4pMaUSVpvmZvWKCN3OLn
         lF/g==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------010805000801030801030905
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------010805000801030801030905
Content-Type: text/x-patch;
 name="3.18.6-reiser4-add-node41-support.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="3.18.6-reiser4-add-node41-support.patch"

Support of node41 layout (the same as node40, but
with 32-bit field for checksum).

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

---
 fs/reiser4/Makefile                           |    1 
 fs/reiser4/jnode.c                            |   11 --
 fs/reiser4/plugin/disk_format/disk_format40.c |    7 +
 fs/reiser4/plugin/disk_format/disk_format40.h |    4 
 fs/reiser4/plugin/node/Makefile               |    3 
 fs/reiser4/plugin/node/node.c                 |   38 ++++++
 fs/reiser4/plugin/node/node.h                 |    6 -
 fs/reiser4/plugin/node/node40.c               |  142 +++++++++++++++++---------
 fs/reiser4/plugin/node/node40.h               |   23 ++--
 fs/reiser4/plugin/node/node41.c               |  111 ++++++++++++++++++++
 fs/reiser4/plugin/node/node41.h               |   48 ++++++++
 fs/reiser4/plugin/plugin.h                    |    2 
 fs/reiser4/reiser4.h                          |    1 
 13 files changed, 329 insertions(+), 68 deletions(-)

--- a/fs/reiser4/Makefile
+++ b/fs/reiser4/Makefile
@@ -69,6 +69,7 @@ reiser4-y := \
 		   plugin/dir/hashed_dir.o \
 		   plugin/dir/seekable_dir.o \
 		   plugin/node/node40.o \
+		   plugin/node/node41.o \
            \
 		   plugin/crypto/cipher.o \
 		   plugin/crypto/digest.o \
--- a/fs/reiser4/plugin/node/Makefile
+++ b/fs/reiser4/plugin/node/Makefile
@@ -2,4 +2,5 @@ obj-$(CONFIG_REISER4_FS) += node_plugins
 
 node_plugins-objs :=	\
 	node.o		\
-	node40.o
+	node40.o	\
+	node41.o
--- a/fs/reiser4/plugin/node/node.c
+++ b/fs/reiser4/plugin/node/node.c
@@ -116,6 +116,44 @@ node_plugin node_plugins[LAST_NODE_ID] =
 		.max_item_size = max_item_size_node40,
 		.prepare_removal = prepare_removal_node40,
 		.set_item_plugin = set_item_plugin_node40
+	},
+	[NODE41_ID] = {
+		.h = {
+			.type_id = REISER4_NODE_PLUGIN_TYPE,
+			.id = NODE41_ID,
+			.pops = NULL,
+			.label = "node41",
+			.desc = "node41 layout",
+			.linkage = {NULL, NULL}
+		},
+		.item_overhead = item_overhead_node40,
+		.free_space = free_space_node40,
+		.lookup = lookup_node40,
+		.num_of_items = num_of_items_node40,
+		.item_by_coord = item_by_coord_node40,
+		.length_by_coord = length_by_coord_node40,
+		.plugin_by_coord = plugin_by_coord_node40,
+		.key_at = key_at_node40,
+		.estimate = estimate_node40,
+		.check = NULL,
+		.parse = parse_node41,
+		.init = init_node41,
+#ifdef GUESS_EXISTS
+		.guess = guess_node41,
+#endif
+		.change_item_size = change_item_size_node40,
+		.create_item = create_item_node40,
+		.update_item_key = update_item_key_node40,
+		.cut_and_kill = kill_node40,
+		.cut = cut_node40,
+		.shift = shift_node41,
+		.shrink_item = shrink_item_node40,
+		.fast_insert = fast_insert_node40,
+		.fast_paste = fast_paste_node40,
+		.fast_cut = fast_cut_node40,
+		.max_item_size = max_item_size_node41,
+		.prepare_removal = prepare_removal_node40,
+		.set_item_plugin = set_item_plugin_node40
 	}
 };
 
--- a/fs/reiser4/plugin/node/node.h
+++ b/fs/reiser4/plugin/node/node.h
@@ -236,9 +236,9 @@ typedef struct node_plugin {
 } node_plugin;
 
 typedef enum {
-	/* standard unified node layout used for both leaf and internal
-	   nodes */
-	NODE40_ID,
+	NODE40_ID, /* standard unified node layout used for both,
+		      leaf and internal nodes */
+	NODE41_ID, /* unified node layout with a reference counter */
 	LAST_NODE_ID
 } reiser4_node_id;
 
--- a/fs/reiser4/plugin/node/node40.c
+++ b/fs/reiser4/plugin/node/node40.c
@@ -34,7 +34,7 @@
 */
 /* NIKITA-FIXME-HANS: I told you guys not less than 10 times to not call it r4fs.  Change to "ReIs". */
 /* magic number that is stored in ->magic field of node header */
-static const __u32 REISER4_NODE_MAGIC = 0x52344653;	/* (*(__u32 *)"R4FS"); */
+static const __u32 REISER4_NODE40_MAGIC = 0x52344653;	/* (*(__u32 *)"R4FS"); */
 
 static int prepare_for_update(znode * left, znode * right,
 			      carry_plugin_info * info);
@@ -656,9 +656,7 @@ int check_node40(const znode * node /* n
 	return 0;
 }
 
-/* plugin->u.node.parse
-   look for description of this method in plugin/node/node.h */
-int parse_node40(znode * node /* node to parse */ )
+int parse_node40_common(znode *node, const __u32 magic)
 {
 	node40_header *header;
 	int result;
@@ -670,10 +668,10 @@ int parse_node40(znode * node /* node to
 	if (unlikely(((__u8) znode_get_level(node)) != level))
 		warning("nikita-494", "Wrong level found in node: %i != %i",
 			znode_get_level(node), level);
-	else if (unlikely(nh40_get_magic(header) != REISER4_NODE_MAGIC))
+	else if (unlikely(nh40_get_magic(header) != magic))
 		warning("nikita-495",
 			"Wrong magic in tree node: want %x, got %x",
-			REISER4_NODE_MAGIC, nh40_get_magic(header));
+			magic, nh40_get_magic(header));
 	else {
 		node->nr_items = node40_num_of_items_internal(node);
 		result = 0;
@@ -681,45 +679,74 @@ int parse_node40(znode * node /* node to
 	return RETERR(result);
 }
 
-/* plugin->u.node.init
-   look for description of this method in plugin/node/node.h */
-int init_node40(znode * node /* node to initialise */ )
+/*
+ * plugin->u.node.parse
+ * look for description of this method in plugin/node/node.h
+ */
+int parse_node40(znode *node /* node to parse */)
 {
-	node40_header *header;
+	return parse_node40_common(node, REISER4_NODE40_MAGIC);
+}
+
+/*
+ * common part of ->init_node() for all nodes,
+ * which contain node40_header at the beginning
+ */
+int init_node40_common(znode *node, node_plugin *nplug,
+		       size_t node_header_size, const __u32 magic)
+{
+	node40_header *header40;
 
 	assert("nikita-570", node != NULL);
 	assert("nikita-572", zdata(node) != NULL);
 
-	header = node40_node_header(node);
-	memset(header, 0, sizeof(node40_header));
-	nh40_set_free_space(header, znode_size(node) - sizeof(node40_header));
-	nh40_set_free_space_start(header, sizeof(node40_header));
-	/* sane hypothesis: 0 in CPU format is 0 in disk format */
-	/* items: 0 */
-	save_plugin_id(node_plugin_to_plugin(node->nplug),
-		       &header->common_header.plugin_id);
-	nh40_set_level(header, znode_get_level(node));
-	nh40_set_magic(header, REISER4_NODE_MAGIC);
-	node->nr_items = 0;
-	nh40_set_mkfs_id(header, reiser4_mkfs_id(reiser4_get_current_sb()));
+	header40 = node40_node_header(node);
+	memset(header40, 0, sizeof(node40_header));
 
-	/* flags: 0 */
+	nh40_set_free_space(header40, znode_size(node) - node_header_size);
+	nh40_set_free_space_start(header40, node_header_size);
+	/*
+	 * sane hypothesis: 0 in CPU format is 0 in disk format
+	 */
+	save_plugin_id(node_plugin_to_plugin(nplug),
+		       &header40->common_header.plugin_id);
+	nh40_set_level(header40, znode_get_level(node));
+	nh40_set_magic(header40, magic);
+	nh40_set_mkfs_id(header40, reiser4_mkfs_id(reiser4_get_current_sb()));
+	/*
+	 * nr_items: 0
+	 * flags: 0
+	 */
 	return 0;
 }
 
+/*
+ * plugin->u.node.init
+ * look for description of this method in plugin/node/node.h
+ */
+int init_node40(znode *node /* node to initialise */)
+{
+	return init_node40_common(node, node_plugin_by_id(NODE40_ID),
+				  sizeof(node40_header), REISER4_NODE40_MAGIC);
+}
+
 #ifdef GUESS_EXISTS
-int guess_node40(const znode * node /* node to guess plugin of */ )
+int guess_node40_common(const znode *node, reiser4_node_id id,
+			const __u32 magic)
 {
-	node40_header *nethack;
+	node40_header *header;
 
 	assert("nikita-1058", node != NULL);
-	nethack = node40_node_header(node);
-	return
-	    (nh40_get_magic(nethack) == REISER4_NODE_MAGIC) &&
-	    (plugin_by_disk_id(znode_get_tree(node),
-			       REISER4_NODE_PLUGIN_TYPE,
-			       &nethack->common_header.plugin_id)->h.id ==
-	     NODE40_ID);
+	header = node40_node_header(node);
+	return (nh40_get_magic(header) == magic) &&
+		(id == plugin_by_disk_id(znode_get_tree(node),
+				       REISER4_NODE_PLUGIN_TYPE,
+				       &header->common_header.plugin_id)->h.id);
+}
+
+int guess_node40(const znode *node /* node to guess plugin of */)
+{
+	return guess_node40_common(node, NODE40_ID, REISER4_NODE40_MAGIC);
 }
 #endif
 
@@ -1867,7 +1894,7 @@ copy_units(coord_t * target, coord_t * s
 /* copy part of @shift->real_stop.node starting either from its beginning or
    from its end and ending at @shift->real_stop to either the end or the
    beginning of @shift->target */
-static void copy(struct shift_params *shift)
+static void copy(struct shift_params *shift, size_t node_header_size)
 {
 	node40_header *nh;
 	coord_t from;
@@ -1994,10 +2021,10 @@ static void copy(struct shift_params *sh
 		coord_set_item_pos(&to, 0);
 
 		/* prepare space for new items */
-		memmove(zdata(to.node) + sizeof(node40_header) +
+		memmove(zdata(to.node) + node_header_size +
 			shift->shift_bytes,
-			zdata(to.node) + sizeof(node40_header),
-			free_space_start - sizeof(node40_header));
+			zdata(to.node) + node_header_size,
+			free_space_start - node_header_size);
 		/* update item headers of moved items */
 		to_ih = node40_ih_at(to.node, 0);
 		/* first item gets @merging_bytes longer. free space appears
@@ -2061,11 +2088,11 @@ static void copy(struct shift_params *sh
 				ih40_set_offset(to_ih,
 						ih40_get_offset(from_ih) -
 						old_offset +
-						sizeof(node40_header) +
+						node_header_size +
 						shift->part_bytes);
 			/* copy item bodies */
 			coord_add_item_pos(&from, -(int)(shift->entire - 1));
-			memcpy(zdata(to.node) + sizeof(node40_header) +
+			memcpy(zdata(to.node) + node_header_size +
 			       shift->part_bytes, item_by_coord_node40(&from),
 			       shift->entire_bytes);
 			coord_dec_item_pos(&from);
@@ -2080,7 +2107,7 @@ static void copy(struct shift_params *sh
 
 			/* copy item header of partially copied item */
 			memcpy(to_ih, from_ih, sizeof(item_header40));
-			ih40_set_offset(to_ih, sizeof(node40_header));
+			ih40_set_offset(to_ih, node_header_size);
 			if (item_plugin_by_coord(&to)->b.init)
 				item_plugin_by_coord(&to)->b.init(&to, &from,
 								  NULL);
@@ -2846,11 +2873,19 @@ void shift_check(void *vp, const znode *
 
 #endif
 
-/* plugin->u.node.shift
-   look for description of this method in plugin/node/node.h */
-int shift_node40(coord_t * from, znode * to, shift_direction pend, int delete_child,	/* if @from->node becomes empty - it will be
-											   deleted from the tree if this is set to 1 */
-		 int including_stop_coord, carry_plugin_info * info)
+/*
+ * common part of ->shift() for all nodes,
+ * which contain node40_header at the beginning and
+ * the table of item headers at the end
+ */
+int shift_node40_common(coord_t *from, znode *to,
+			shift_direction pend,
+			int delete_child, /* if @from->node becomes empty,
+					   * it will be deleted from the
+					   * tree if this is set to 1 */
+			int including_stop_coord,
+			carry_plugin_info *info,
+			size_t node_header_size)
 {
 	struct shift_params shift;
 	int result;
@@ -2919,7 +2954,7 @@ int shift_node40(coord_t * from, znode *
 		return 0;
 	}
 
-	copy(&shift);
+	copy(&shift, node_header_size);
 
 	/* result value of this is important. It is used by adjust_coord below */
 	result = delete_copied(&shift);
@@ -2967,6 +3002,23 @@ int shift_node40(coord_t * from, znode *
 	return result ? result : (int)shift.shift_bytes;
 }
 
+/*
+ * plugin->u.node.shift
+ * look for description of this method in plugin/node/node.h
+ */
+int shift_node40(coord_t *from, znode *to,
+		 shift_direction pend,
+		 int delete_child, /* if @from->node becomes empty,
+				    * it will be deleted from the
+				    * tree if this is set to 1 */
+		 int including_stop_coord,
+		 carry_plugin_info *info)
+{
+	return shift_node40_common(from, to, pend, delete_child,
+				   including_stop_coord, info,
+				   sizeof(node40_header));
+}
+
 /* plugin->u.node.fast_insert()
    look for description of this method in plugin/node/node.h */
 int fast_insert_node40(const coord_t * coord UNUSED_ARG /* node to query */ )
--- a/fs/reiser4/plugin/node/node40.h
+++ b/fs/reiser4/plugin/node/node40.h
@@ -78,11 +78,18 @@ item_plugin *plugin_by_coord_node40(cons
 reiser4_key *key_at_node40(const coord_t * coord, reiser4_key * key);
 size_t estimate_node40(znode * node);
 int check_node40(const znode * node, __u32 flags, const char **error);
+int parse_node40_common(znode *node, const __u32 magic);
 int parse_node40(znode * node);
-int init_node40(znode * node);
+int init_node40_common(znode *node, node_plugin *nplug,
+		       size_t node_header_size, const __u32 magic);
+int init_node40(znode *node);
+
 #ifdef GUESS_EXISTS
-int guess_node40(const znode * node);
+int guess_node40_common(const znode *node, reiser4_node_id id,
+			const __u32 magic);
+int guess_node40(const znode *node);
 #endif
+
 void change_item_size_node40(coord_t * coord, int by);
 int create_item_node40(coord_t * target, const reiser4_key * key,
 		       reiser4_item_data * data, carry_plugin_info * info);
@@ -90,14 +97,12 @@ void update_item_key_node40(coord_t * ta
 			    carry_plugin_info * info);
 int kill_node40(struct carry_kill_data *, carry_plugin_info *);
 int cut_node40(struct carry_cut_data *, carry_plugin_info *);
-int shift_node40(coord_t * from, znode * to, shift_direction pend,
-		 /* if @from->node becomes
-		    empty - it will be deleted from
-		    the tree if this is set to 1
-		  */
+int shift_node40_common(coord_t *from, znode *to, shift_direction pend,
+			int delete_child, int including_stop_coord,
+			carry_plugin_info *info, size_t nh_size);
+int shift_node40(coord_t *from, znode *to, shift_direction pend,
 		 int delete_child, int including_stop_coord,
-		 carry_plugin_info * info);
-
+		 carry_plugin_info *info);
 int fast_insert_node40(const coord_t * coord);
 int fast_paste_node40(const coord_t * coord);
 int fast_cut_node40(const coord_t * coord);
--- /dev/null
+++ b/fs/reiser4/plugin/node/node41.c
@@ -0,0 +1,111 @@
+/*
+ * Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README
+ */
+
+#include "../../debug.h"
+#include "../../key.h"
+#include "../../coord.h"
+#include "../plugin_header.h"
+#include "../item/item.h"
+#include "node.h"
+#include "node41.h"
+#include "../plugin.h"
+#include "../../jnode.h"
+#include "../../znode.h"
+#include "../../pool.h"
+#include "../../carry.h"
+#include "../../tap.h"
+#include "../../tree.h"
+#include "../../super.h"
+#include "../../reiser4.h"
+
+#include <asm/uaccess.h>
+#include <linux/types.h>
+#include <linux/prefetch.h>
+
+/*
+ * node41 layout it almost the same as node40:
+ * node41_header is at the beginning and a table of item headers
+ * is at the end. Ther difference is that node41_header contains
+ * a 32-bit reference counter (see node41.h)
+ */
+
+static const __u32 REISER4_NODE41_MAGIC = 0x19051966;
+
+static inline node41_header *node41_node_header(const znode *node)
+{
+	assert("edward-1634", node != NULL);
+	assert("edward-1635", znode_page(node) != NULL);
+	assert("edward-1636", zdata(node) != NULL);
+
+	return (node41_header *)zdata(node);
+}
+
+/*
+ * plugin->u.node.parse
+ * look for description of this method in plugin/node/node.h
+ */
+int parse_node41(znode *node /* node to parse */)
+{
+	return parse_node40_common(node, REISER4_NODE41_MAGIC);
+}
+
+/*
+ * plugin->u.node.init
+ * look for description of this method in plugin/node/node.h
+ */
+int init_node41(znode *node /* node to initialise */)
+{
+	node41_header *header41;
+
+	init_node40_common(node, node_plugin_by_id(NODE41_ID),
+			   sizeof(node41_header), REISER4_NODE41_MAGIC);
+
+	header41 = node41_node_header(node);
+	nh41_set_csum(header41, 0);
+	return 0;
+}
+
+/*
+ * plugin->u.node.shift
+ * look for description of this method in plugin/node/node.h
+ */
+int shift_node41(coord_t *from, znode *to,
+		 shift_direction pend,
+		 int delete_child, /* if @from->node becomes empty,
+				    * it will be deleted from the
+				    * tree if this is set to 1 */
+		 int including_stop_coord,
+		 carry_plugin_info *info)
+{
+	return shift_node40_common(from, to, pend, delete_child,
+				   including_stop_coord, info,
+				   sizeof(node41_header));
+}
+
+#ifdef GUESS_EXISTS
+int guess_node41(const znode *node /* node to guess plugin of */)
+{
+	return guess_node40_common(node, NODE41_ID, REISER4_NODE41_MAGIC);
+}
+#endif
+
+/*
+ * plugin->u.node.max_item_size
+ */
+int max_item_size_node41(void)
+{
+	return reiser4_get_current_sb()->s_blocksize - sizeof(node41_header) -
+		sizeof(item_header40);
+}
+
+/*
+   Local variables:
+   c-indentation-style: "K&R"
+   mode-name: "LC"
+   c-basic-offset: 8
+   tab-width: 8
+   fill-column: 80
+   scroll-step: 1
+   End:
+*/
--- /dev/null
+++ b/fs/reiser4/plugin/node/node41.h
@@ -0,0 +1,48 @@
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+
+#if !defined( __REISER4_NODE41_H__ )
+#define __REISER4_NODE41_H__
+
+#include "../../forward.h"
+#include "../../dformat.h"
+#include "node40.h"
+#include <linux/types.h>
+
+/*
+ * node41 layout: the same as node40, but with 32-bit checksum
+ */
+
+typedef struct node41_header {
+	node40_header head;
+	d32 csum;
+} PACKED node41_header;
+
+/*
+ * functions to get/set fields of node41_header
+ */
+#define nh41_get_csum(nh) le32_to_cpu(get_unaligned(&(nh)->csum))
+#define nh41_set_csum(nh, value) put_unaligned(cpu_to_le32(value), &(nh)->csum)
+
+int init_node41(znode * node);
+int parse_node41(znode *node);
+int max_item_size_node41(void);
+int shift_node41(coord_t *from, znode *to, shift_direction pend,
+		 int delete_child, int including_stop_coord,
+		 carry_plugin_info *info);
+
+#ifdef GUESS_EXISTS
+int guess_node41(const znode * node);
+#endif
+
+/* __REISER4_NODE41_H__ */
+#endif
+/*
+   Local variables:
+   c-indentation-style: "K&R"
+   mode-name: "LC"
+   c-basic-offset: 8
+   tab-width: 8
+   fill-column: 80
+   scroll-step: 1
+   End:
+*/
--- a/fs/reiser4/plugin/plugin.h
+++ b/fs/reiser4/plugin/plugin.h
@@ -20,7 +20,7 @@
 #include "item/cde.h"
 #include "item/item.h"
 #include "node/node.h"
-#include "node/node40.h"
+#include "node/node41.h"
 #include "security/perm.h"
 #include "fibration.h"
 
--- a/fs/reiser4/reiser4.h
+++ b/fs/reiser4/reiser4.h
@@ -1,6 +1,7 @@
 /* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
  * reiser4/README */
 
+
 /* definitions of common constants used by reiser4 */
 
 #if !defined( __REISER4_H__ )
--- a/fs/reiser4/plugin/disk_format/disk_format40.c
+++ b/fs/reiser4/plugin/disk_format/disk_format40.c
@@ -70,6 +70,11 @@ static __u32 get_format40_mkfs_id(const
 	return le32_to_cpu(get_unaligned(&sb->mkfs_id));
 }
 
+static __u32 get_format40_node_plugin_id(const format40_disk_super_block * sb)
+{
+	return le32_to_cpu(get_unaligned(&sb->node_pid));
+}
+
 static __u64 get_format40_flags(const format40_disk_super_block * sb)
 {
 	return le64_to_cpu(get_unaligned(&sb->flags));
@@ -342,7 +347,7 @@ static int try_init_format40(struct supe
 	/* get things necessary to init reiser4_tree */
 	root_block = get_format40_root_block(sb_copy);
 	height = get_format40_tree_height(sb_copy);
-	nplug = node_plugin_by_id(NODE40_ID);
+	nplug = node_plugin_by_id(get_format40_node_plugin_id(sb_copy));
 
 	/* initialize reiser4_super_info_data */
 	sbinfo = get_super_private(super);
--- a/fs/reiser4/jnode.c
+++ b/fs/reiser4/jnode.c
@@ -839,16 +839,12 @@ static int jnode_start_read(jnode * node
 static void check_jload(jnode * node, struct page *page)
 {
 	if (jnode_is_znode(node)) {
-		node40_header *nh;
-		znode *z;
+		znode *z = JZNODE(node);
 
-		z = JZNODE(node);
 		if (znode_is_any_locked(z)) {
-			nh = (node40_header *) kmap(page);
-			/* this only works for node40-only file systems. For
-			 * debugging. */
 			assert("nikita-3253",
-			       z->nr_items == le16_to_cpu(get_unaligned(&nh->nr_items)));
+			       z->nr_items ==
+			       node_plugin_by_node(z)->num_of_items(z));
 			kunmap(page);
 		}
 		assert("nikita-3565", znode_invariant(z));
@@ -1331,6 +1327,7 @@ static int init_znode(jnode * node)
 
 	z = JZNODE(node);
 	/* call node plugin to do actual initialization */
+	z->nr_items = 0;
 	return z->nplug->init(z);
 }
 
--- a/fs/reiser4/plugin/disk_format/disk_format40.h
+++ b/fs/reiser4/plugin/disk_format/disk_format40.h
@@ -57,7 +57,9 @@ typedef struct format40_disk_super_block
 	   version number supported by kernel.
 	   Is used by fsck to catch possible corruption and
 	   for various compatibility issues */
-	/*  84 */ char not_used[428];
+	/*  84 */ d32 node_pid;
+	/* node plugin id */
+	/*  88 */ char not_used[424];
 } format40_disk_super_block;
 
 /* format 40 specific part of reiser4_super_info_data */

--------------010805000801030801030905--
