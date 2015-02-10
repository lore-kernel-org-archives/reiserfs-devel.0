From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 2/2] reiser4progs: node41 layout support
Date: Tue, 10 Feb 2015 18:58:38 +0100
Message-ID: <54DA46CE.5070203@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080803010207000400080604"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=mGI6tVHyE0nUnCgfGY5tRfXRkzDiIYoYdDHEve2WvxI=;
        b=czYtuCzRP4Ko6DO4yQ9n7n0oPSxFdgMnhJazGZf/PBcZ0+NWy3H3sKELgwXgsYOqN4
         ne0p1io0t7I+hUvuVl5OmX9cbtjGB3/MUNkUiixNseiRTXzRESrY05BPOhwM00g1i5/O
         amzOFs00rfGm/aMoj4mEsp4obirejv2aoySSaIijgF+Bogm0d1eYxLOZDX/lx8b3yquI
         Q8UL953A0Ip+8ongl34qsuujObYU/AG6zUUT/1lAIaxED5Hx8T1av+EOp4HTBY+8doi6
         a+TwTPLmYamOKXO8BwFdeuDL8NvpQII/i3f3ihs+aoKEtyEDhKWllJmXwuA51v3fBISZ
         irbw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080803010207000400080604
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------080803010207000400080604
Content-Type: text/x-patch;
 name="reiser4progs-1.0.9-add-node41-support.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4progs-1.0.9-add-node41-support.patch"

Support of node41 layout (the same as node40, but
with 32-bit checksum).

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 configure.in                       |    1 
 include/reiser4/format.h           |    2 
 include/reiser4/plugin.h           |    9 
 libreiser4/factory.c               |    2 
 libreiser4/filesystem.c            |   11 -
 libreiser4/format.c                |   11 +
 libreiser4/profile.c               |    4 
 libreiser4/tree.c                  |   28 ++
 plugin/Makefile.am                 |    2 
 plugin/format/format40/format40.c  |    9 
 plugin/format/format40/format40.h  |   18 +
 plugin/node/Makefile.am            |    2 
 plugin/node/node40/node40.c        |  118 ++++++-----
 plugin/node/node40/node40.h        |   51 ++++-
 plugin/node/node40/node40_repair.c |  372 +++++++++++++++++++++++++------------
 plugin/node/node40/node40_repair.h |   39 +++
 plugin/node/node41/Makefile.am     |   22 ++
 plugin/node/node41/node41.c        |  150 ++++++++++++++
 plugin/node/node41/node41.h        |   47 ++++
 plugin/node/node41/node41_repair.c |  153 +++++++++++++++
 plugin/node/node41/node41_repair.h |   39 +++
 21 files changed, 902 insertions(+), 188 deletions(-)

--- a/configure.in
+++ b/configure.in
@@ -582,6 +582,7 @@ AC_OUTPUT([
     	plugin/oid/oid40/Makefile
     	plugin/node/Makefile
     	plugin/node/node40/Makefile
+	plugin/node/node41/Makefile
    	plugin/key/Makefile
     	plugin/key/key_common/Makefile
     	plugin/key/key_short/Makefile
--- a/include/reiser4/plugin.h
+++ b/include/reiser4/plugin.h
@@ -174,6 +174,7 @@ extern const char *reiser4_slink_name[];
 /* Known node plugin ids. */
 enum reiser4_node_plug_id {
 	NODE_REISER40_ID        = 0x0,
+	NODE_REISER41_ID        = 0x1,
 	NODE_LAST_ID
 };
 
@@ -954,7 +955,8 @@ typedef struct format_hint {
 	uint32_t blksize;
 	rid_t policy;
 	rid_t key;
-	
+	rid_t node;
+
 	/* For repair purposes. Set plugin types that are overridden 
 	   in the profile here, they must be set in the format plugin
 	   check_struct. If bit is not set, plugins given with the above 
@@ -1478,11 +1480,12 @@ struct reiser4_format_plug {
 	void (*set_policy) (reiser4_format_ent_t *, rid_t);
 	void (*set_height) (reiser4_format_ent_t *, uint16_t);
 
-	/* Return plugin ids for journal, block allocator, and oid allocator
-	   components. */
+	/* Return plugin ids for journal, block allocator, oid allocator
+	   and node components. */
 	rid_t (*journal_pid) (reiser4_format_ent_t *);
 	rid_t (*alloc_pid) (reiser4_format_ent_t *);
 	rid_t (*oid_pid) (reiser4_format_ent_t *);
+	rid_t (*node_pid) (reiser4_format_ent_t *);
 
 	/* Format enumerator function. */
 	errno_t (*layout) (reiser4_format_ent_t *, region_func_t, void *);
--- a/plugin/Makefile.am
+++ b/plugin/Makefile.am
@@ -14,6 +14,7 @@ libreiser4_plugin_la_LIBADD       = form
                                     alloc/alloc40/liballoc40-static.la \
                                     oid/oid40/liboid40-static.la \
                                     node/node40/libnode40-static.la \
+                                    node/node41/libnode41-static.la \
                                     key/key_common/libkey_common-static.la \
                                     key/key_short/libkey_short-static.la \
                                     key/key_large/libkey_large-static.la \
@@ -57,6 +58,7 @@ if ENABLE_MINIMAL
 libreiser4_plugin_minimal_la_LIBADD = format/format40/libformat40-minimal.la \
                                     oid/oid40/liboid40-minimal.la \
                                     node/node40/libnode40-minimal.la \
+                                    node/node41/libnode41-minimal.la \
                                     key/key_common/libkey_common-minimal.la \
                                     key/key_short/libkey_short-minimal.la \
                                     key/key_large/libkey_large-minimal.la \
--- a/plugin/node/Makefile.am
+++ b/plugin/node/Makefile.am
@@ -1 +1 @@
-SUBDIRS = node40
+SUBDIRS = node40 node41
--- /dev/null
+++ b/plugin/node/node41/Makefile.am
@@ -0,0 +1,22 @@
+includedir		    = -I$(top_srcdir)/include
+
+node41_sources              = node41.c node41_repair.c node41.h node41_repair.h
+
+STATIC_LIBS		    = libnode41-static.la
+libnode41_static_la_SOURCES = $(node41_sources)
+libnode41_static_la_CFLAGS  = @GENERIC_CFLAGS@
+
+if ENABLE_MINIMAL
+MINIMAL_LIBS                  = libnode41-minimal.la
+else
+MINIMAL_LIBS                  =
+endif
+
+noinst_LTLIBRARIES   	    = $(STATIC_LIBS) $(MINIMAL_LIBS)
+
+if ENABLE_MINIMAL
+libnode41_minimal_la_SOURCES  = $(node41_sources)
+libnode41_minimal_la_CFLAGS   = @MINIMAL_CFLAGS@
+endif
+
+INCLUDES = $(includedir)
--- /dev/null
+++ b/plugin/node/node41/node41.c
@@ -0,0 +1,150 @@
+/* Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
+ * reiser4progs/COPYING.
+ */
+
+#include "../node40/node40.h"
+#include "../node40/node40_repair.h"
+#include "node41.h"
+#include "node41_repair.h"
+
+uint32_t node41_get_csum(reiser4_node_t *entity) {
+	aal_assert("edward-3", entity != NULL);
+	return nh41_get_csum((reiser4_node_t *)entity);
+}
+
+reiser4_node_t *node41_prepare(aal_block_t *block, reiser4_key_plug_t *kplug) {
+	reiser4_node_t *entity;
+
+	aal_assert("edward-4", kplug != NULL);
+	aal_assert("edward-5", block != NULL);
+
+	if (!(entity = aal_calloc(sizeof(*entity), 0)))
+		return NULL;
+
+	entity->kplug = kplug;
+	entity->block = block;
+	entity->plug = &node41_plug;
+	entity->keypol = plugcall(kplug, bodysize);
+
+	return entity;
+}
+
+/* Open the node on the given @block with the given key plugin @kplug. Returns
+   initialized node instance. */
+reiser4_node_t *node41_open(aal_block_t *block, reiser4_key_plug_t *kplug)
+{
+	reiser4_node_t *entity;
+
+	aal_assert("edward-6", kplug != NULL);
+	aal_assert("edward-7", block != NULL);
+
+	if (!(entity = node41_prepare(block, kplug)))
+		return NULL;
+
+	/* Check the magic. */
+	if (nh_get_magic(entity) != NODE41_MAGIC) {
+		aal_free(entity);
+		return NULL;
+	}
+
+	return entity;
+}
+
+#ifndef ENABLE_MINIMAL
+
+/* Returns maximal size of item possible for passed node instance */
+static uint16_t node41_maxspace(reiser4_node_t *entity) {
+	aal_assert("edward-8", entity != NULL);
+	/*
+	 * Maximal space is node size minus node header and minus item
+	 * header
+	 */
+	return (entity->block->size - sizeof(node41_header_t) -
+		ih_size(entity->keypol));
+}
+
+/*
+ * Initializes node of the given @level on the @block with key plugin
+ * @kplug. Returns initialized node instance
+ */
+static reiser4_node_t *node41_init(aal_block_t *block, uint8_t level,
+				   reiser4_key_plug_t *kplug)
+{
+	return node40_init_common(block, level, kplug,
+				  &node41_plug,
+				  NODE41_MAGIC,
+				  sizeof(node41_header_t),
+				  node41_prepare);
+}
+
+#endif
+
+reiser4_node_plug_t node41_plug = {
+	.p = {
+		.id    = {NODE_REISER41_ID, 0, NODE_PLUG_TYPE},
+#ifndef ENABLE_MINIMAL
+		.label = "node41",
+		.desc  = "Node41 layout plugin.",
+#endif
+	},
+
+	.open		= node41_open,
+	.fini		= node40_fini,
+	.lookup		= node40_lookup,
+	.fetch          = node40_fetch,
+	.items		= node40_items,
+
+	.get_key	= node40_get_key,
+	.get_level	= node40_get_level,
+
+#ifndef ENABLE_MINIMAL
+	.init		= node41_init,
+	.sync           = node40_sync,
+	.merge          = node40_merge,
+
+	.pack           = node41_pack,
+	.unpack         = node41_unpack,
+
+	.insert		= node40_insert,
+	.write		= node40_write,
+	.trunc          = node40_trunc,
+	.remove		= node40_remove,
+	.print		= node41_print,
+	.shift		= node40_shift,
+	.shrink		= node40_shrink,
+	.expand		= node40_expand,
+	.insert_raw     = node40_insert_raw,
+	.copy           = node40_copy,
+
+	.overhead	= node40_overhead,
+	.maxspace	= node41_maxspace,
+	.space		= node40_space,
+
+	.set_key	= node40_set_key,
+	.set_level      = node40_set_level,
+
+	.get_mstamp	= node40_get_mstamp,
+	.get_fstamp     = node40_get_fstamp,
+
+	.set_mstamp	= node40_set_mstamp,
+	.set_fstamp     = node40_set_fstamp,
+
+	.set_flags	= node40_set_flags,
+	.get_flags	= node40_get_flags,
+
+	.set_state      = node40_set_state,
+	.get_state      = node40_get_state,
+	.check_struct	= node41_check_struct
+#endif
+};
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
+++ b/plugin/node/node41/node41.h
@@ -0,0 +1,47 @@
+/* Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
+   reiser4progs/COPYING.
+
+   node41.h -- reiser4 node41 layouts.
+   The same as node40, but with 32-bit reference counter
+*/
+
+#ifndef NODE41_H
+#define NODE41_H
+
+#include <aal/libaal.h>
+#include <aux/aux.h>
+#include <reiser4/plugin.h>
+
+#define NODE41_MAGIC 0x19051966
+
+extern reiser4_node_plug_t node41_plug;
+
+typedef struct node41_header {
+	node40_header_t head;
+	d32_t csum;
+}  __attribute__((packed)) node41_header_t;
+
+#define	nh41(block) ((node41_header_t *)block->data)
+
+#define nh41_get_csum(node)			\
+	aal_get_le32(nh41((node)->block), csum)
+
+#define nh41_set_csum(node, val)			\
+	aal_set_le32(nh41((node)->block), csum, val)
+
+
+extern uint32_t node41_get_csum(reiser4_node_t *entity);
+extern reiser4_node_t *node41_prepare(aal_block_t *block,
+				      reiser4_key_plug_t *kplug);
+
+#endif
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
--- a/libreiser4/factory.c
+++ b/libreiser4/factory.c
@@ -239,6 +239,8 @@ errno_t reiser4_factory_init(void) {
 	
 	__load_plug(node40);
 	__init_plug(node40);
+
+	__load_plug(node41);
 	
 	__load_plug(dir40);
 	__load_plug(reg40);
--- a/libreiser4/profile.c
+++ b/libreiser4/profile.c
@@ -123,8 +123,8 @@ reiser4_profile_t defprof = {
 		[PROF_NODE] = {
 #ifndef ENABLE_MINIMAL
 			.name  = "node",
-			.desc  = "",
-			.hidden = 1,
+			.desc  = "Node plugin",
+			.hidden = 0,
 			.max = NODE_LAST_ID,
 #endif
 			.id = {NODE_REISER40_ID, 0, NODE_PLUG_TYPE},
--- /dev/null
+++ b/plugin/node/node41/node41_repair.c
@@ -0,0 +1,153 @@
+/* Copyright 2001-2005 by Hans Reiser, licensing governed by
+   reiser4progs/COPYING.
+
+   node41_repair.c -- reiser4 node with short keys. */
+
+#ifndef ENABLE_MINIMAL
+#include "../node40/node40.h"
+#include "../node40/node40_repair.h"
+#include "node41.h"
+#include <repair/plugin.h>
+
+#define MIN_ITEM_LEN	1
+
+/*
+ * Look through ih array looking for the last valid item location. This will
+ * be the last valid item.
+ */
+uint32_t node41_estimate_count(reiser4_node_t *node)
+{
+	return node40_estimate_count_common(node, sizeof(node41_header_t));
+}
+
+/*
+ * Checks the count of items written in node_header. If it is wrong, it tries
+ * to estimate it on the base of free_space fields and recover if REBUILD mode.
+ * Returns FATAL otherwise.
+ */
+static errno_t node41_count_check(reiser4_node_t *node, uint8_t mode)
+{
+	return node40_count_check_common(node, mode, node41_estimate_count);
+}
+
+/*
+ * Count of items is correct. Free space fields and item locations should be
+ * checked/recovered if broken
+ */
+static errno_t node41_ih_array_check(reiser4_node_t *node, uint8_t mode)
+{
+	return node40_ih_array_check_common(node, mode,
+					    sizeof(node41_header_t));
+}
+
+errno_t node41_check_struct(reiser4_node_t *node, uint8_t mode) {
+	errno_t res;
+
+	aal_assert("edward-17", node != NULL);
+
+	/* Check the content of the node40 header. */
+	if ((res = node41_count_check(node, mode)))
+		return res;
+
+	if (nh_get_num_items(node) == 0) {
+		uint32_t offset = sizeof(node41_header_t);
+		return node40_space_check(node, offset, mode);
+	}
+
+	/* Count looks ok. Recover the item array. */
+	res = node41_ih_array_check(node, mode);
+
+	if (repair_error_fatal(res))
+		return res;
+
+	res |= node40_iplug_check(node, mode);
+
+	return res;
+}
+
+/*
+ * Pack node41 header w/out magic and padding
+ */
+void node41_header_pack(reiser4_node_t *entity, aal_stream_t *stream)
+{
+	node41_header_t *head41;
+
+	node40_header_pack(entity, stream);
+
+	head41 = nh41(entity->block);
+	aal_stream_write(stream, &head41->csum,
+			 sizeof(head41->csum));
+}
+
+errno_t node41_pack(reiser4_node_t *entity, aal_stream_t *stream)
+{
+	return node40_pack_common(entity, stream,
+				  node41_header_pack, node40_items_pack);
+}
+
+static int32_t node41_header_unpack(reiser4_node_t *entity,
+				    aal_stream_t *stream)
+{
+	int32_t ret;
+	uint32_t read;
+	node41_header_t *head41;
+
+	head41 = nh41(entity->block);
+	ret = node40_header_unpack(entity, stream);
+	if (ret)
+		return ret;
+	read = aal_stream_read(stream, &head41->csum,
+			       sizeof(head41->csum));
+	if (read != sizeof(head41->csum))
+		return -1;
+	return 0;
+}
+
+reiser4_node_t *node41_unpack(aal_block_t *block,
+			      reiser4_key_plug_t *kplug,
+			      aal_stream_t *stream)
+{
+	return node40_unpack_common(block, kplug, stream,
+				    &node41_plug, NODE41_MAGIC,
+				    node41_prepare,
+				    node41_header_unpack,
+				    node40_items_unpack);
+}
+
+static void node41_header_print(reiser4_node_t *entity, aal_stream_t *stream)
+{
+	uint8_t level;
+	uint32_t csum;
+
+	level = node40_get_level(entity);
+	csum = node41_get_csum(entity);
+
+	aal_stream_format(stream, "NODE (%llu) CSUM=%u LEVEL=%u ITEMS=%u "
+			  "SPACE=%u MKFS ID=0x%x FLUSH=0x%llx\n",
+			  entity->block->nr, csum, level,
+			  node40_items(entity), node40_space(entity),
+			  nh_get_mkfs_id(entity), nh_get_flush_id(entity));
+}
+
+/*
+ * Prepare text node description and push it into specified @stream
+ */
+void node41_print(reiser4_node_t *entity, aal_stream_t *stream,
+		  uint32_t start, uint32_t count, uint16_t options)
+{
+	return node40_print_common(entity, stream, start, count, options,
+				   node41_header_print);
+}
+
+#endif
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
+++ b/plugin/node/node41/node41_repair.h
@@ -0,0 +1,39 @@
+/* Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
+   reiser4progs/COPYING.
+
+   node41_repair.h -- reiser4 node plugin repair functions. */
+
+#ifndef NODE41_REPAIR_H
+#define NODE41_REPAIR_H
+
+#include <aal/libaal.h>
+#include <reiser4/plugin.h>
+
+extern errno_t node41_insert_raw(reiser4_node_t *entity, pos_t *pos,
+				 trans_hint_t *hint);
+
+extern errno_t node41_check_struct(reiser4_node_t *entity,
+				   uint8_t mode);
+
+extern errno_t node41_pack(reiser4_node_t *entity,
+			   aal_stream_t *stream);
+
+extern reiser4_node_t *node41_unpack(aal_block_t *block,
+				    reiser4_key_plug_t *kplug,
+				    aal_stream_t *stream);
+
+extern void node41_print(reiser4_node_t *entity, aal_stream_t *stream,
+			 uint32_t start, uint32_t count, uint16_t options);
+
+#endif
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
--- a/plugin/node/node40/node40.h
+++ b/plugin/node/node40/node40.h
@@ -55,10 +55,17 @@ typedef int64_t (*modify_func_t) (reiser
 extern void node40_mkdirty(reiser4_node_t *entity);
 extern void node40_mkclean(reiser4_node_t *entity);
 extern int node40_isdirty(reiser4_node_t *entity);
-
+extern int node40_count_valid(reiser4_node_t *entity);
 extern reiser4_node_t *node40_prepare(aal_block_t *block, 
 				      reiser4_key_plug_t *kplug);
-
+extern reiser4_node_t *
+node40_init_common(aal_block_t *block, uint8_t level,
+		   reiser4_key_plug_t *kplug,
+		   reiser4_node_plug_t *nplug,
+		   const uint32_t magic,
+		   uint32_t node_header_size,
+		   reiser4_node_t* (*prepare_fn)(aal_block_t *,
+						 reiser4_key_plug_t *));
 extern uint16_t node40_space(reiser4_node_t *entity);
 extern uint32_t node40_items(reiser4_node_t *entity);
 
@@ -94,6 +101,46 @@ extern void node40_set_flags(reiser4_nod
 
 extern uint16_t node40_get_flag(reiser4_node_t *entity, uint32_t pos);
 
+extern reiser4_node_t *node40_open(aal_block_t *block,
+				   reiser4_key_plug_t *kplug);
+extern errno_t node40_fini(reiser4_node_t *entity);
+
+extern lookup_t node40_lookup(reiser4_node_t *entity,
+			      lookup_hint_t *hint,
+			      lookup_bias_t bias,
+			      pos_t *pos);
+extern errno_t node40_get_key(reiser4_node_t *entity,
+			      pos_t *pos, reiser4_key_t *key);
+extern errno_t node40_sync(reiser4_node_t *entity);
+extern errno_t node40_merge(reiser4_node_t *entity, pos_t *left_pos,
+			    pos_t *right_pos);
+extern errno_t node40_insert(reiser4_node_t *entity, pos_t *pos,
+			     trans_hint_t *hint);
+extern int64_t node40_write(reiser4_node_t *entity, pos_t *pos,
+			    trans_hint_t *hint);
+extern int64_t node40_trunc(reiser4_node_t *entity, pos_t *pos,
+			    trans_hint_t *hint);
+extern errno_t node40_remove(reiser4_node_t *entity, pos_t *pos,
+			     trans_hint_t *hint);
+extern errno_t node40_shift(reiser4_node_t *src_entity,
+			    reiser4_node_t *dst_entity, shift_hint_t *hint);
+extern uint16_t node40_overhead(reiser4_node_t *entity);
+extern errno_t node40_set_key(reiser4_node_t *entity, pos_t *pos,
+			      reiser4_key_t *key);
+extern void node40_set_level(reiser4_node_t *entity, uint8_t level);
+extern uint32_t node40_get_mstamp(reiser4_node_t *entity);
+extern uint64_t node40_get_fstamp(reiser4_node_t *entity);
+extern void node40_set_mstamp(reiser4_node_t *entity, uint32_t stamp);
+extern void node40_set_fstamp(reiser4_node_t *entity, uint64_t stamp);
+extern uint16_t node40_get_flags(reiser4_node_t *entity, uint32_t pos);
+extern void node40_set_state(reiser4_node_t *entity, uint32_t state);
+extern uint32_t node40_get_state(reiser4_node_t *entity);
+extern errno_t node40_region_delete(reiser4_node_t *node,
+				    uint16_t start_pos, uint16_t end_pos);
+extern errno_t node40_space_check(reiser4_node_t *node,
+				  uint32_t offset, uint8_t mode);
+extern errno_t node40_iplug_check(reiser4_node_t *node, uint8_t mode);
+
 #define	nh(block)                         \
         ((node40_header_t *)block->data)
 
--- a/plugin/node/node40/node40.c
+++ b/plugin/node/node40/node40.c
@@ -68,56 +68,72 @@ int node40_isdirty(reiser4_node_t *entit
 	return entity->block->dirty;
 }
 
-static uint32_t node40_get_state(reiser4_node_t *entity) {
+uint32_t node40_get_state(reiser4_node_t *entity) {
 	aal_assert("umka-2091", entity != NULL);
 	return entity->state;
 }
 
-static void node40_set_state(reiser4_node_t *entity,
-			     uint32_t state)
+void node40_set_state(reiser4_node_t *entity, uint32_t state)
 {
 	aal_assert("umka-2092", entity != NULL);
 	entity->state = state;
 }
 
 /* Returns node mkfs stamp. */
-static uint32_t node40_get_mstamp(reiser4_node_t *entity) {
+uint32_t node40_get_mstamp(reiser4_node_t *entity) {
 	aal_assert("umka-1127", entity != NULL);
 	return nh_get_mkfs_id(entity);
 }
 
 /* Returns node flush stamp. */
-static uint64_t node40_get_fstamp(reiser4_node_t *entity) {
+uint64_t node40_get_fstamp(reiser4_node_t *entity) {
 	aal_assert("vpf-645", entity != NULL);
 	return nh_get_flush_id(entity);
 }
 
-/* Initializes node of the given @level on the @block with key plugin
-   @kplug. Returns initialized node instance. */
-static reiser4_node_t *node40_init(aal_block_t *block, uint8_t level,
-				   reiser4_key_plug_t *kplug)
+reiser4_node_t *
+node40_init_common(aal_block_t *block, uint8_t level,
+		   reiser4_key_plug_t *kplug,
+		   reiser4_node_plug_t *nplug,
+		   const uint32_t magic,
+		   uint32_t node_header_size,
+		   reiser4_node_t * (*prepare_fn)(aal_block_t *,
+						  reiser4_key_plug_t *))
 {
 	reiser4_node_t *entity;
 
 	aal_assert("umka-2374", block != NULL);
 	aal_assert("vpf-1417",  kplug != NULL);
-	
-	if (!(entity = node40_prepare(block, kplug)))
+
+	if (!(entity = prepare_fn(block, kplug)))
 		return NULL;
-	
+
 	nh_set_num_items(entity, 0);
 	nh_set_level(entity, level);
-	nh_set_magic(entity, NODE40_MAGIC);
-	nh_set_pid(entity, node40_plug.p.id.id);
-	
-	nh_set_free_space_start(entity, sizeof(node40_header_t));
-	nh_set_free_space(entity, block->size - sizeof(node40_header_t));
+	nh_set_magic(entity, magic);
+	nh_set_pid(entity, nplug->p.id.id);
+	nh_set_free_space_start(entity, node_header_size);
+	nh_set_free_space(entity, block->size - node_header_size);
 
 	return entity;
 }
 
+/*
+ * Initializes node of the given @level on the @block with key plugin
+ * @kplug. Returns initialized node instance
+ */
+static reiser4_node_t *node40_init(aal_block_t *block, uint8_t level,
+				   reiser4_key_plug_t *kplug)
+{
+	return node40_init_common(block, level, kplug,
+				  &node40_plug,
+				  NODE40_MAGIC,
+				  sizeof(node40_header_t),
+				  node40_prepare);
+}
+
 /* Saves node to device */
-static errno_t node40_sync(reiser4_node_t *entity) {
+errno_t node40_sync(reiser4_node_t *entity) {
 	errno_t res;
 	
 	aal_assert("umka-1552", entity != NULL);
@@ -131,7 +147,7 @@ static errno_t node40_sync(reiser4_node_
 #endif
 
 /* Closes node by means of closing its block */
-static errno_t node40_fini(reiser4_node_t *entity) {
+errno_t node40_fini(reiser4_node_t *entity) {
 	aal_assert("umka-825", entity != NULL);
 
 	aal_block_free(entity->block);
@@ -156,8 +172,7 @@ uint16_t node40_space(reiser4_node_t *en
 }
 
 /* Sets node make stamp. */
-static void node40_set_mstamp(reiser4_node_t *entity,
-			      uint32_t stamp)
+void node40_set_mstamp(reiser4_node_t *entity, uint32_t stamp)
 {
 	aal_assert("vpf-644", entity != NULL);
 
@@ -166,8 +181,7 @@ static void node40_set_mstamp(reiser4_no
 }
 
 /* Returns node flush stamp */
-static void node40_set_fstamp(reiser4_node_t *entity,
-			      uint64_t stamp)
+void node40_set_fstamp(reiser4_node_t *entity, uint64_t stamp)
 {
 	aal_assert("vpf-643", entity != NULL);
 	
@@ -176,8 +190,7 @@ static void node40_set_fstamp(reiser4_no
 }
 
 /* Set new node level to @level. */
-static void node40_set_level(reiser4_node_t *entity,
-			     uint8_t level)
+void node40_set_level(reiser4_node_t *entity, uint8_t level)
 {
 	aal_assert("umka-1864", entity != NULL);
 	
@@ -219,8 +232,7 @@ uint16_t node40_len(reiser4_node_t *enti
 
 /* Open the node on the given @block with the given key plugin @kplug. Returns
    initialized node instance. */
-static reiser4_node_t *node40_open(aal_block_t *block,
-				   reiser4_key_plug_t *kplug)
+reiser4_node_t *node40_open(aal_block_t *block, reiser4_key_plug_t *kplug)
 {
 	reiser4_node_t *entity;
 	
@@ -250,8 +262,8 @@ static void node40_get_key_by_ih(reiser4
 }
 
 /* Returns key at passed @pos. */
-static errno_t node40_get_key(reiser4_node_t *entity,
-			      pos_t *pos, reiser4_key_t *key) 
+errno_t node40_get_key(reiser4_node_t *entity,
+		       pos_t *pos, reiser4_key_t *key)
 {
 	void *ih;
     
@@ -322,8 +334,8 @@ errno_t node40_fetch(reiser4_node_t *ent
 #ifndef ENABLE_MINIMAL
 /* Retutns item overhead for this node format. Widely used in modification and
    estimation routines. */
-static uint16_t node40_overhead(reiser4_node_t *entity) {
-	return ih_size(entity->keypol);
+uint16_t node40_overhead(reiser4_node_t *entity) {
+        return ih_size(entity->keypol);
 }
 
 /* Returns maximal size of item possible for passed node instance */
@@ -655,8 +667,8 @@ int64_t node40_modify(reiser4_node_t *en
 	return write;
 }
 
-static errno_t node40_insert(reiser4_node_t *entity,
-			     pos_t *pos, trans_hint_t *hint)
+errno_t node40_insert(reiser4_node_t *entity,
+		      pos_t *pos, trans_hint_t *hint)
 {
 	modify_func_t ins_func;
 	
@@ -668,8 +680,7 @@ static errno_t node40_insert(reiser4_nod
 	return node40_modify(entity, pos, hint, ins_func);
 }
 
-static int64_t node40_write(reiser4_node_t *entity,
-			    pos_t *pos, trans_hint_t *hint)
+int64_t node40_write(reiser4_node_t *entity, pos_t *pos, trans_hint_t *hint)
 {
 	modify_func_t write_func;
 
@@ -682,8 +693,7 @@ static int64_t node40_write(reiser4_node
 }
 
 /* Truncates node at @pos. Needed for tail conversion. */
-static int64_t node40_trunc(reiser4_node_t *entity, pos_t *pos,
-			    trans_hint_t *hint)
+int64_t node40_trunc(reiser4_node_t *entity, pos_t *pos, trans_hint_t *hint)
 {
 	void *ih;
 	uint32_t pol;
@@ -837,8 +847,8 @@ errno_t node40_remove(reiser4_node_t *en
 /* Fuses two mergeable items if they lie in the same node side by side. This is
    needed for fsck if it discovered, that two items are mergeable and lie in the
    same node (due to some corruption or fail) it will merge them. */
-static errno_t node40_merge(reiser4_node_t *entity,  
-			    pos_t *left_pos, pos_t *right_pos)
+errno_t node40_merge(reiser4_node_t *entity,
+		     pos_t *left_pos, pos_t *right_pos)
 {
 	errno_t res;
 	uint32_t pol;
@@ -920,8 +930,7 @@ static errno_t node40_merge(reiser4_node
 }
 
 /* Updates key at @pos by specified @key */
-static errno_t node40_set_key(reiser4_node_t *entity, 
-			      pos_t *pos, reiser4_key_t *key) 
+errno_t node40_set_key(reiser4_node_t *entity, pos_t *pos, reiser4_key_t *key)
 {
 	void *ih;
 	uint32_t key_size;
@@ -976,10 +985,10 @@ static int cb_comp_key4(void *ih0, uint3
 
 /* Makes search inside the specified node @entity for @key and stores the result
    into @pos. This function returns 1 if key is found and 0 otherwise. */
-static lookup_t node40_lookup(reiser4_node_t *entity,
-			      lookup_hint_t *hint,
-			      lookup_bias_t bias,
-			      pos_t *pos)
+lookup_t node40_lookup(reiser4_node_t *entity,
+		       lookup_hint_t *hint,
+		       lookup_bias_t bias,
+		       pos_t *pos)
 {
 	aux_comp_func_t func;
 	void *ih;
@@ -1544,9 +1553,9 @@ static errno_t node40_move(reiser4_node_
    and @dst_entity after some number of whole items was moved to @dst_entity. It
    is needed to use the rest of space remaining after whole items shift in
    second pass. */
-static errno_t node40_shift(reiser4_node_t *src_entity,
-			    reiser4_node_t *dst_entity,
-			    shift_hint_t *hint)
+errno_t node40_shift(reiser4_node_t *src_entity,
+		     reiser4_node_t *dst_entity,
+		     shift_hint_t *hint)
 {
 	errno_t res;
 
@@ -1650,7 +1659,7 @@ reiser4_node_plug_t node40_plug = {
 		.id    = {NODE_REISER40_ID, 0, NODE_PLUG_TYPE},
 #ifndef ENABLE_MINIMAL
 		.label = "node40",
-		.desc  = "Node plugin.",
+		.desc  = "Node40 layout plugin.",
 #endif
 	},
 	
@@ -1703,3 +1712,14 @@ reiser4_node_plug_t node40_plug = {
 	.check_struct	= node40_check_struct
 #endif
 };
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
--- a/plugin/node/node40/node40_repair.c
+++ b/plugin/node/node40/node40_repair.c
@@ -23,9 +23,8 @@ static void node40_set_offset_at(reiser4
 	}
 }
 
-static errno_t node40_region_delete(reiser4_node_t *node,
-				    uint16_t start_pos, 
-				    uint16_t end_pos) 
+errno_t node40_region_delete(reiser4_node_t *node,
+			     uint16_t start_pos, uint16_t end_pos)
 {
 	uint32_t count;
 	uint32_t len;
@@ -59,7 +58,7 @@ static errno_t node40_region_delete(reis
 
 /* Count is valid if:
    free_space_start + free_space == block_size - count * ih size */
-static int node40_count_valid(reiser4_node_t *node) {
+int node40_count_valid(reiser4_node_t *node) {
 	uint32_t count;
 	
 	count = nh_get_num_items(node);
@@ -77,15 +76,15 @@ static int node40_count_valid(reiser4_no
 		count * ih_size(node->keypol) == node->block->size);
 }
 
-/* Look through ih array looking for the last valid item location. This will 
-   be the last valid item. */
-static uint32_t node40_estimate_count(reiser4_node_t *node) {
+uint32_t node40_estimate_count_common(reiser4_node_t *node,
+				      uint32_t node_header_size)
+{
 	uint32_t offset, left, right;
 	uint32_t count, last, i;
-	
+
 	count = nh_get_num_items(node);
-	
-	left = sizeof(node40_header_t);
+
+	left = node_header_size;
 	right = node->block->size - ih_size(node->keypol) - MIN_ITEM_LEN;
 	last = 0;
 
@@ -106,8 +105,14 @@ static uint32_t node40_estimate_count(re
 	return last + 1;
 }
 
-static errno_t node40_space_check(reiser4_node_t *node, 
-				  uint32_t offset, uint8_t mode)
+/* Look through ih array looking for the last valid item location. This will
+   be the last valid item. */
+static uint32_t node40_estimate_count(reiser4_node_t *node)
+{
+	return node40_estimate_count_common(node, sizeof(node40_header_t));
+}
+
+errno_t node40_space_check(reiser4_node_t *node, uint32_t offset, uint8_t mode)
 {
 	errno_t res = 0;
 	uint32_t space;
@@ -153,9 +158,9 @@ static errno_t node40_space_check(reiser
 	return res;
 }
 
-/* Count of items is correct. Free space fields and item locations should be 
- * checked/recovered if broken. */
-static errno_t node40_ih_array_check(reiser4_node_t *node, uint8_t mode) {
+errno_t node40_ih_array_check_common(reiser4_node_t *node, uint8_t mode,
+				     uint32_t node_header_size)
+{
 	uint32_t right, left, offset;
 	uint32_t last_pos, count, i;
 	errno_t res = 0;
@@ -170,8 +175,8 @@ static errno_t node40_ih_array_check(rei
 	offset = 0;
 	last_pos = 0;
 	count = nh_get_num_items(node);
-	
-	left = sizeof(node40_header_t);
+
+	left = node_header_size;
 	right = node->block->size - count * ih_size(node->keypol);
 	
 	for(i = 0; i <= count; i++, left += MIN_ITEM_LEN) {
@@ -253,13 +258,23 @@ static errno_t node40_ih_array_check(rei
 	return res;
 }
 
-/* Checks the count of items written in node_header. If it is wrong, it tries
-   to estimate it on the base of free_space fields and recover if REBUILD mode.
-   Returns FATAL otherwise. */
-static errno_t node40_count_check(reiser4_node_t *node, uint8_t mode) {
+/*
+ * Count of items is correct. Free space fields and item locations should be
+ * checked/recovered if broken
+ */
+errno_t node40_ih_array_check(reiser4_node_t *node, uint8_t mode)
+{
+	return node40_ih_array_check_common(node, mode,
+					    sizeof(node40_header_t));
+}
+
+errno_t node40_count_check_common(reiser4_node_t *node,
+				  uint8_t mode,
+				  uint32_t (*estimate_count)(reiser4_node_t *))
+{
 	uint32_t num, count;
 	blk_t blk;
-	
+
 	aal_assert("vpf-802", node != NULL);
 	aal_assert("vpf-803", node->block != NULL);
 	
@@ -270,7 +285,7 @@ static errno_t node40_count_check(reiser
 		return 0;
 	
 	/* Count is probably is not valid. Estimate the count. */
-	num = node40_estimate_count(node);
+	num = estimate_count(node);
 	count = nh_get_num_items(node);
 	
 	if (num >= count)
@@ -290,7 +305,15 @@ static errno_t node40_count_check(reiser
 	return 0;
 }
 
-static errno_t node40_iplug_check(reiser4_node_t *node, uint8_t mode) {
+/* Checks the count of items written in node_header. If it is wrong, it tries
+   to estimate it on the base of free_space fields and recover if REBUILD mode.
+   Returns FATAL otherwise. */
+static errno_t node40_count_check(reiser4_node_t *node, uint8_t mode)
+{
+	return node40_count_check_common(node, mode, node40_estimate_count);
+}
+
+errno_t node40_iplug_check(reiser4_node_t *node, uint8_t mode) {
 	uint32_t count, len;
 	uint16_t pid;
 	errno_t res;
@@ -377,25 +400,13 @@ int64_t node40_insert_raw(reiser4_node_t
 			     hint->plug->repair->insert_raw);
 }
 
-errno_t node40_pack(reiser4_node_t *entity, aal_stream_t *stream) {
+/*
+ * Pack node40 header w/out magic and padding
+ */
+void node40_header_pack(reiser4_node_t *entity, aal_stream_t *stream)
+{
 	node40_header_t *head;
-	reiser4_place_t place;
-	uint16_t num;
-	pos_t *pos;
-	rid_t pid;
-	
-	aal_assert("umka-2596", entity != NULL);
-	aal_assert("umka-2598", stream != NULL);
-	
-	pid = entity->plug->p.id.id;
-	aal_stream_write(stream, &pid, sizeof(pid));
-	
-	/* Write node block number. */
-	aal_stream_write(stream, &entity->block->nr,
-			 sizeof(entity->block->nr));
 
-	/* Pack the node content. */
-	
 	/* Node header w/out magic and padding. */
 	head = nh(entity->block);
 	
@@ -419,165 +430,278 @@ errno_t node40_pack(reiser4_node_t *enti
 
 	aal_stream_write(stream, &head->level, 
 			 sizeof(head->level));
+}
+
+int32_t node40_items_pack(reiser4_node_t *entity, aal_stream_t *stream)
+{
+	reiser4_place_t place;
+	uint16_t num;
+	pos_t *pos;
 
-	/* All items. */
 	num = nh_get_num_items(entity);
 
 	pos = &place.pos;
 	pos->unit = MAX_UINT32;
-	
-	/* Pack all item headers. */
+	/*
+	 * Pack all item headers
+	 */
 	for (pos->item = 0; pos->item < num; pos->item++) {
 		void *ih = node40_ih_at(entity, pos->item);
 		aal_stream_write(stream, ih, ih_size(entity->keypol));
 	}
-
-	/* Pack all item bodies. */
+	/*
+	 * Pack all item bodies
+	 */
 	for (pos->item = 0; pos->item < num; pos->item++) {
 		if (node40_fetch(entity, pos, &place))
 			return -EINVAL;
-		
+
 		if (place.plug->repair->pack) {
-			/* Pack body. */
+			/*
+			 * Pack body
+			 */
 			if (objcall(&place, repair->pack, stream))
 				return -EINVAL;
 		} else {
-			/* Do not pack body. */
+			/*
+			 * Do not pack body
+			 */
 			aal_stream_write(stream, node40_ib_at(entity, pos->item),
 					 node40_len(entity, &place.pos));
 		}
 	}
-	
 	return 0;
 }
 
-reiser4_node_t *node40_unpack(aal_block_t *block,
-			     reiser4_key_plug_t *kplug,
-			     aal_stream_t *stream)
+errno_t node40_pack_common(reiser4_node_t *entity, aal_stream_t *stream,
+			   void (*pack_header_fn)(reiser4_node_t *,
+					     aal_stream_t *),
+			   int32_t (*pack_items_fn)(reiser4_node_t *,
+						    aal_stream_t *))
 {
-	node40_header_t *head;
-	reiser4_node_t *entity;
-	reiser4_place_t place;
-	uint32_t read;
-	uint16_t num;
-	pos_t *pos;
+	int32_t ret;
+	rid_t pid;
 
-	aal_assert("umka-2597", block != NULL);
-	aal_assert("umka-2632", kplug != NULL);
-	aal_assert("umka-2599", stream != NULL);
+	aal_assert("umka-2596", entity != NULL);
+	aal_assert("umka-2598", stream != NULL);
 
-	if (!(entity = aal_calloc(sizeof(*entity), 0)))
-		return NULL;
+	pid = entity->plug->p.id.id;
+	aal_stream_write(stream, &pid, sizeof(pid));
+	/*
+	 * Write node block number
+	 */
+	aal_stream_write(stream, &entity->block->nr,
+			 sizeof(entity->block->nr));
+	/*
+	 * Pack node header
+	 */
+	pack_header_fn(entity, stream);
+	/*
+	 * Pack items
+	 */
+	ret = pack_items_fn(entity, stream);
+	if (ret)
+		return -EINVAL;
+	return 0;
+}
+
+errno_t node40_pack(reiser4_node_t *entity, aal_stream_t *stream)
+{
+	return node40_pack_common(entity, stream,
+				  node40_header_pack, node40_items_pack);
+}
+
+/*
+ * Unpack node40 header w/out magic and padding
+ */
+int32_t node40_header_unpack(reiser4_node_t *entity, aal_stream_t *stream)
+{
+	uint32_t read;
+	node40_header_t *head;
 
-	if (!(entity = node40_prepare(block, kplug)))
-		return NULL;
-	
-	node40_mkdirty(entity);
-	
-	/* Unpack the node content. */
-	
-	/* Node header w/out magic and padding. */
 	head = nh(entity->block);
 
 	read = aal_stream_read(stream, &head->num_items, 
 			       sizeof(head->num_items));
 	
 	if (read != sizeof(head->num_items))
-		goto error_free_entity;
+		goto error;
 	
 	read = aal_stream_read(stream, &head->free_space, 
 			       sizeof(head->free_space));
 	
 	if (read != sizeof(head->free_space))
-		goto error_free_entity;
+		goto error;
 	
 	read = aal_stream_read(stream, &head->free_space_start, 
 			       sizeof(head->free_space_start));
 	
 	if (read != sizeof(head->free_space_start))
-		goto error_free_entity;
+		goto error;
 	
 	read = aal_stream_read(stream, &head->mkfs_id, 
 			       sizeof(head->mkfs_id));
 	
 	if (read != sizeof(head->mkfs_id))
-		goto error_free_entity;
+		goto error;
 	
 	read = aal_stream_read(stream, &head->flush_id, 
 			       sizeof(head->flush_id));
 	
 	if (read != sizeof(head->flush_id))
-		goto error_free_entity;
+		goto error;
 	
 	read = aal_stream_read(stream, &head->flags, 
 			       sizeof(head->flags));
 	
 	if (read != sizeof(head->flags))
-		goto error_free_entity;
+		goto error;
 	
 	read = aal_stream_read(stream, &head->level, 
 			       sizeof(head->level));
-	
+
 	if (read != sizeof(head->level))
-		goto error_free_entity;
-	
-	/* Set the magic and the pid. */
-	nh_set_magic(entity, NODE40_MAGIC);
-	nh_set_pid(entity, node40_plug.p.id.id);
-	
-	/* All items. */
+		goto error;
+	return 0;
+ error:
+	return -1;
+}
+
+/*
+ * Unpack item headers and item bodies
+ */
+int32_t node40_items_unpack(reiser4_node_t *entity, aal_stream_t *stream)
+{
+	pos_t *pos;
+	uint16_t num;
+	uint32_t read;
+	reiser4_place_t place;
+
 	num = nh_get_num_items(entity);
 	pos = &place.pos;
 	pos->unit = MAX_UINT32;
-	
-	/* Unpack all item headers. */
+	/*
+	 * Unpack all item headers
+	 */
 	for (pos->item = 0; pos->item < num; pos->item++) {
 		void *ih = node40_ih_at(entity, pos->item);
 		read = aal_stream_read(stream, ih, ih_size(entity->keypol));
-		
+
 		if (read != ih_size(entity->keypol))
-			goto error_free_entity;
+			goto error;
 	}
-
-	/* Unpack all item bodies. */
+	/*
+	 * Unpack all item bodies
+	 */
 	for (pos->item = 0; pos->item < num; pos->item++) {
 		if (node40_fetch(entity, pos, &place))
-			goto error_free;
-		
+			goto error;
 		if (place.plug->repair->unpack) {
-			/* Unpack body. */
+			/*
+			 * Unpack body
+			 */
 			if (objcall(&place, repair->unpack, stream))
-				goto error_free_entity;
+				goto error;
 		} else {
 			void *ib = node40_ib_at(entity, pos->item);
 			uint32_t len = node40_len(entity, &place.pos);
-			
-			/* Do not unpack body. */
+			/*
+			 * Do not unpack body
+			 */
 			if (aal_stream_read(stream, ib, len) != (int32_t)len)
-				goto error_free_entity;
+				goto error;
 		}
 	}
-	
+	return 0;
+ error:
+	return -1;
+}
+
+reiser4_node_t *
+node40_unpack_common(aal_block_t *block,
+		     reiser4_key_plug_t *kplug,
+		     aal_stream_t *stream,
+		     reiser4_node_plug_t *nplug,
+		     const uint32_t magic,
+		     reiser4_node_t* (*prepare_fn)(aal_block_t *,
+						  reiser4_key_plug_t *),
+		     int32_t (*unpack_header_fn)(reiser4_node_t *,
+						 aal_stream_t *),
+		     int32_t (*unpack_items_fn)(reiser4_node_t *,
+						aal_stream_t *))
+{
+	int32_t ret;
+	reiser4_node_t *entity;
+
+	aal_assert("umka-2597", block != NULL);
+	aal_assert("umka-2632", kplug != NULL);
+	aal_assert("umka-2599", stream != NULL);
+
+	if (!(entity = aal_calloc(sizeof(*entity), 0)))
+		return NULL;
+
+	if (!(entity = prepare_fn(block, kplug))) {
+		aal_free(entity);
+		return NULL;
+	}
+	node40_mkdirty(entity);
+	/*
+	 * Unpack the node header content
+	 */
+	ret = unpack_header_fn(entity, stream);
+	if (ret)
+		goto error;
+	/*
+	 * Set the magic and the pid
+	 */
+	nh_set_magic(entity, magic);
+	nh_set_pid(entity, nplug->p.id.id);
+	/*
+	 * Unpack item headers and item bodies
+	 */
+	ret = unpack_items_fn(entity, stream);
+	if (ret)
+		goto error;
 	return entity;
-	
- error_free_entity:
+ error:
 	aal_error("Can't unpack the node (%llu). "
 		  "Stream is over?", block->nr);
-
- error_free:
 	aal_free(entity);
 	return NULL;
 }
 
-/* Prepare text node description and push it into specified @stream. */
-void node40_print(reiser4_node_t *entity, aal_stream_t *stream,
-		  uint32_t start, uint32_t count, uint16_t options) 
+reiser4_node_t *node40_unpack(aal_block_t *block,
+			     reiser4_key_plug_t *kplug,
+			     aal_stream_t *stream)
+{
+	return node40_unpack_common(block, kplug, stream,
+				    &node40_plug, NODE40_MAGIC,
+				    node40_prepare,
+				    node40_header_unpack,
+				    node40_items_unpack);
+}
+
+static void node40_header_print(reiser4_node_t *entity, aal_stream_t *stream)
+{
+	uint8_t level;
+	level = node40_get_level(entity);
+
+	aal_stream_format(stream, "NODE (%llu) LEVEL=%u ITEMS=%u "
+			  "SPACE=%u MKFS ID=0x%x FLUSH=0x%llx\n",
+			  entity->block->nr, level, node40_items(entity),
+			  node40_space(entity), nh_get_mkfs_id(entity),
+			  nh_get_flush_id(entity));
+}
+
+void node40_print_common(reiser4_node_t *entity, aal_stream_t *stream,
+			 uint32_t start, uint32_t count, uint16_t options,
+			 void (*print_header_fn)(reiser4_node_t *,
+						 aal_stream_t *))
 {
 	void *ih;
 	char *key;
 	pos_t pos;
 	uint8_t pol;
-	uint8_t level;
 
 	uint32_t last, num;
 	reiser4_place_t place;
@@ -585,15 +709,8 @@ void node40_print(reiser4_node_t *entity
 	aal_assert("vpf-023", entity != NULL);
 	aal_assert("umka-457", stream != NULL);
 
-	level = node40_get_level(entity);
-	
-	/* Print node header. */
-	aal_stream_format(stream, "NODE (%llu) LEVEL=%u ITEMS=%u "
-			  "SPACE=%u MKFS ID=0x%x FLUSH=0x%llx\n",
-			  entity->block->nr, level, node40_items(entity),
-			  node40_space(entity), nh_get_mkfs_id(entity),
-			  nh_get_flush_id(entity));
-	
+	print_header_fn(entity, stream);
+
 	pos.unit = MAX_UINT32;
 	
 	if (start == MAX_UINT32)
@@ -654,4 +771,25 @@ void node40_print(reiser4_node_t *entity
 			  "==============\n");
 }
 
+/*
+ * Prepare text node description and push it into specified @stream
+ */
+void node40_print(reiser4_node_t *entity, aal_stream_t *stream,
+		  uint32_t start, uint32_t count, uint16_t options)
+{
+	return node40_print_common(entity, stream, start, count, options,
+				   node40_header_print);
+}
+
 #endif
+
+/*
+  Local variables:
+  c-indentation-style: "K&R"
+  mode-name: "LC"
+  c-basic-offset: 8
+  tab-width: 8
+  fill-column: 80
+  scroll-step: 1
+  End:
+*/
--- a/plugin/node/node40/node40_repair.h
+++ b/plugin/node/node40/node40_repair.h
@@ -11,18 +11,51 @@
 
 extern errno_t node40_insert_raw(reiser4_node_t *entity, pos_t *pos,
 				 trans_hint_t *hint);
-
 extern errno_t node40_check_struct(reiser4_node_t *entity,
 				   uint8_t mode);
-
+extern void node40_header_pack(reiser4_node_t *entity, aal_stream_t *stream);
+extern int32_t node40_items_pack(reiser4_node_t *entity, aal_stream_t *stream);
+extern errno_t node40_pack_common(reiser4_node_t *entity, aal_stream_t *stream,
+				  void (*pack_header_fn)(reiser4_node_t *,
+							 aal_stream_t *),
+				  int32_t (*pack_items_fn)(reiser4_node_t *,
+							   aal_stream_t *));
 extern errno_t node40_pack(reiser4_node_t *entity,
 			   aal_stream_t *stream);
-
+extern int32_t node40_header_unpack(reiser4_node_t *entity,
+				    aal_stream_t *stream);
+extern int32_t node40_items_unpack(reiser4_node_t *entity,
+				   aal_stream_t *stream);
+extern reiser4_node_t *
+node40_unpack_common(aal_block_t *block,
+		     reiser4_key_plug_t *kplug,
+		     aal_stream_t *stream,
+		     reiser4_node_plug_t *nplug,
+		     const uint32_t magic,
+		     reiser4_node_t* (*prepare_fn)(aal_block_t *,
+						  reiser4_key_plug_t *),
+		     int32_t (*unpack_header_fn)(reiser4_node_t *,
+						 aal_stream_t *),
+		     int32_t (*unpack_items_fn)(reiser4_node_t *,
+						aal_stream_t *));
 extern reiser4_node_t *node40_unpack(aal_block_t *block,
 				    reiser4_key_plug_t *kplug,
 				    aal_stream_t *stream);
 
+extern void node40_print_common(reiser4_node_t *entity, aal_stream_t *stream,
+				uint32_t start, uint32_t count,
+				uint16_t options,
+				void (*print_header_fn)(reiser4_node_t *,
+							aal_stream_t *));
 extern void node40_print(reiser4_node_t *entity, aal_stream_t *stream,
 			 uint32_t start, uint32_t count, uint16_t options);
 
+extern uint32_t node40_estimate_count_common(reiser4_node_t *entity,
+					     uint32_t nh_size);
+extern errno_t node40_count_check_common(reiser4_node_t *node,
+				  uint8_t mode,
+				  uint32_t (*estimate_count)(reiser4_node_t *));
+extern errno_t node40_ih_array_check_common(reiser4_node_t *node,
+					    uint8_t mode,
+					    uint32_t node_header_size);
 #endif
--- a/include/reiser4/format.h
+++ b/include/reiser4/format.h
@@ -20,6 +20,7 @@ extern reiser4_format_t *reiser4_format_
 					       reiser4_format_plug_t *plug,
 					       rid_t policy,
 					       rid_t key,
+					       rid_t node,
 					       count_t blocks);
 
 extern errno_t reiser4_format_backup(reiser4_format_t *format,
@@ -60,6 +61,7 @@ extern errno_t reiser4_format_valid(reis
 extern rid_t reiser4_format_oid_pid(reiser4_format_t *format);
 extern rid_t reiser4_format_alloc_pid(reiser4_format_t *format);
 extern rid_t reiser4_format_journal_pid(reiser4_format_t *format);
+extern rid_t reiser4_format_node_pid(reiser4_format_t *format);
 
 extern blk_t reiser4_format_start(reiser4_format_t *format);
 extern count_t reiser4_format_get_len(reiser4_format_t *format);
--- a/libreiser4/filesystem.c
+++ b/libreiser4/filesystem.c
@@ -250,7 +250,7 @@ reiser4_fs_t *reiser4_fs_create(
 	aal_device_t *device,           /* device filesystem will be lie on */
 	fs_hint_t *hint)                /* filesystem hint */
 {
-	reiser4_plug_t *format, *policy, *key;
+  reiser4_plug_t *format, *policy, *node, *key;
 
 	count_t free;
 	reiser4_fs_t *fs;
@@ -288,15 +288,18 @@ reiser4_fs_t *reiser4_fs_create(
 
 	/* Getting tail policy from default params. */
 	policy = reiser4_profile_plug(PROF_POLICY);
-	
+
+	/* Getting node plugin from default params. */
+	node = reiser4_profile_plug(PROF_NODE);
+
 	/* Taking care about key flags in format super block */
 	key = reiser4_profile_plug(PROF_KEY);
 	
 	/* Creates disk format. */
 	
 	fs->format = reiser4_format_create(fs, (reiser4_format_plug_t *)format,
-					   policy->id.id, key->id.id, 
-					   hint->blocks);
+					   policy->id.id, key->id.id,
+					   node->id.id, hint->blocks);
 	if (!fs->format) 
 		goto error_free_status;
 
--- a/libreiser4/format.c
+++ b/libreiser4/format.c
@@ -87,6 +87,7 @@ reiser4_format_t *reiser4_format_create(
 	reiser4_format_plug_t *plug,	/* format plugin */
 	rid_t policy,			/* policy plug id */
 	rid_t key,			/* key plug id */
+	rid_t node,                     /* node plug id */
 	count_t blocks)			/* block count */
 {
 	reiser4_format_t *format;
@@ -106,6 +107,7 @@ reiser4_format_t *reiser4_format_create(
 	desc.blocks = blocks;
 	desc.policy = policy;
 	desc.key = key;
+	desc.node = node;
 
 	/* Initializing entity of disk-format by means of calling "create"
 	   method from found plugin. Plugin "create" method will be creating 
@@ -261,6 +263,15 @@ uint16_t reiser4_format_get_policy(
 	return reiser4call(format, get_policy);
 }
 
+/* Returns node plugin id from the format-specific super-block */
+rid_t reiser4_format_node_pid(
+	reiser4_format_t *format)	/* format to be inspected */
+{
+	aal_assert("edward-19", format != NULL);
+
+	return reiser4call(format, node_pid);
+}
+
 /* Sets new root block */
 void reiser4_format_set_root(
 	reiser4_format_t *format,	/* format new root blocks will be set in */
--- a/libreiser4/tree.c
+++ b/libreiser4/tree.c
@@ -856,12 +856,13 @@ errno_t reiser4_tree_next_key(reiser4_tr
 reiser4_node_t *reiser4_tree_alloc_node(reiser4_tree_t *tree,
 					uint8_t level)
 {
-	reiser4_node_plug_t *plug;
+	reiser4_plug_t *nplug;
 	reiser4_node_t *node;
 	uint32_t stamp;
 	errno_t res;
 	blk_t blk;
-	
+	rid_t node_pid;
+
 	reiser4_format_t *format;
     
 	aal_assert("umka-756", tree != NULL);
@@ -873,11 +874,17 @@ reiser4_node_t *reiser4_tree_alloc_node(
 	/* Setting up of the free blocks in format. */
 	if ((res = reiser4_format_dec_free(format, 1)))
 		return NULL;
-	
-	plug = (reiser4_node_plug_t *)tree->ent.tset[TSET_NODE];
+
+	/* Grab node plugin */
+	node_pid = reiser4_format_node_pid(format);
+	if (!(nplug = reiser4_factory_ifind(NODE_PLUG_TYPE, node_pid))) {
+		aal_error("Unknown node plugin.");
+		return NULL;
+	}
 	
 	/* Creating new node. */
-	if (!(node = reiser4_node_create(tree, plug, blk, level))) {
+	if (!(node = reiser4_node_create(tree, (reiser4_node_plug_t *)nplug,
+					 blk, level))) {
 		aal_error("Can't initialize new fake node.");
 		return NULL;
 	}
@@ -3317,3 +3324,14 @@ errno_t reiser4_tree_resize(reiser4_tree
 	return -EINVAL;
 }
 #endif
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
--- a/plugin/format/format40/format40.c
+++ b/plugin/format/format40/format40.c
@@ -47,6 +47,11 @@ static rid_t format40_get_policy(reiser4
 	return get_sb_policy(SUPER(entity));
 }
 
+static uint32_t format40_node_pid(reiser4_format_ent_t *entity) {
+	aal_assert("edward-18", entity != NULL);
+	return get_sb_node_pid(SUPER(entity));
+}
+
 static uint64_t format40_start(reiser4_format_ent_t *entity) {
 	format40_t *format = (format40_t *)entity;
 	
@@ -238,6 +243,9 @@ static reiser4_format_ent_t *format40_cr
 	/* Setting up tail policy to passed @desc->policy value. */
 	set_sb_policy(super, desc->policy);
 
+	/* Set node plugin id */
+	set_sb_node_pid(super, desc->node);
+
 	/* Set the flags. */
 	/* FIXME: Hardcoded plugin ids for 2 cases. */
 	flags = (desc->key == KEY_LARGE_ID) ? (1 << FORMAT40_KEY_LARGE) : 0;
@@ -503,6 +511,7 @@ reiser4_format_plug_t format40_plug = {
 	.oid_area       = format40_oid_area,
 	.journal_pid	= format40_journal_pid,
 	.alloc_pid	= format40_alloc_pid,
+	.node_pid       = format40_node_pid,
 	.backup		= format40_backup,
 	.check_backup	= format40_check_backup,
 	.regenerate     = format40_regenerate,
--- a/plugin/format/format40/format40.h
+++ b/plugin/format/format40/format40.h
@@ -43,8 +43,8 @@ typedef struct format40_super {
 	d64_t sb_flags;
 	
 	d32_t sb_version;
-	
-	char sb_unused[428];
+	d32_t node_pid;
+	char sb_unused[424];
 } __attribute__((packed)) format40_super_t;
 
 typedef struct format40 {
@@ -101,6 +101,9 @@ extern reiser4_core_t *format40_core;
 #define get_sb_flags(sb)		aal_get_le64(sb, sb_flags)
 #define set_sb_flags(sb, val)		aal_set_le64(sb, sb_flags, val)
 
+#define get_sb_node_pid(sb)		aal_get_le32(sb, node_pid)
+#define set_sb_node_pid(sb, val)	aal_set_le32(sb, node_pid, val)
+
 #define get_sb_version(sb)	\
 	(aal_get_le32(sb, sb_version) & ~FORMAT40_UPDATE_BACKUP)
 
@@ -123,3 +126,14 @@ extern rid_t format40_get_key(reiser4_fo
 #endif
 
 #endif
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

--------------080803010207000400080604--
