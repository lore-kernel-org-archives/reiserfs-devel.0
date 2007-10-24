From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 31/8] jnode.h cleanup
Date: Thu, 25 Oct 2007 01:10:28 +0200
Message-ID: <1193267428.24225.52.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-Pb84LccQYzYEzIpPov6p"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-Pb84LccQYzYEzIpPov6p
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 7 errors, 8 warnings, 702 lines checked
patched:total: 0 errors, 2 warnings, 704 lines checked

Leftovers:

WARNING: do not add new typedefs
#186: FILE: jnode.h:186:
+typedef enum {

WARNING: do not add new typedefs
#197: FILE: jnode.h:197:
+typedef enum {


--=-Pb84LccQYzYEzIpPov6p
Content-Disposition: attachment; filename=jnode.h.patch
Content-Type: text/x-patch; name=jnode.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- jnode.h.orig	2007-10-25 01:03:37.000000000 +0200
+++ jnode.h	2007-10-25 01:08:37.000000000 +0200
@@ -165,7 +165,8 @@ struct jnode {
 
 	/* the real blocknr (where io is going to/from) */
 	/*   80 */ reiser4_block_nr blocknr;
-	/* Parent item type, unformatted and CRC need it for offset => key conversion.  */
+	/* Parent item type, unformatted and CRC need it for
+	 * offset => key conversion.  */
 	/* NOTE: this parent_item_id looks like jnode type. */
 	/*   88 */ reiser4_plugin_id parent_item_id;
 	/*   92 */
@@ -355,7 +356,7 @@ extern void jnode_make_dirty(jnode * nod
 extern void jnode_make_clean(jnode * node) NONNULL;
 extern void jnode_make_wander_nolock(jnode * node) NONNULL;
 extern void jnode_make_wander(jnode *) NONNULL;
-extern void znode_make_reloc(znode *, flush_queue_t *) NONNULL;
+extern void znode_make_reloc(znode * , flush_queue_t *) NONNULL;
 extern void unformatted_make_reloc(jnode *, flush_queue_t *) NONNULL;
 extern struct address_space *jnode_get_mapping(const jnode * node) NONNULL;
 
@@ -396,8 +397,8 @@ static inline const reiser4_block_nr *jn
 }
 
 /* Jnode flush interface. */
-extern reiser4_blocknr_hint *reiser4_pos_hint(flush_pos_t * pos);
-extern flush_queue_t *reiser4_pos_fq(flush_pos_t * pos);
+extern reiser4_blocknr_hint *reiser4_pos_hint(flush_pos_t *pos);
+extern flush_queue_t *reiser4_pos_fq(flush_pos_t *pos);
 
 /* FIXME-VS: these are used in plugin/item/extent.c */
 
@@ -411,13 +412,13 @@ extern flush_queue_t *reiser4_pos_fq(flu
 
 /* Macros to convert from jnode to znode, znode to jnode.  These are macros
    because C doesn't allow overloading of const prototypes. */
-#define ZJNODE(x) (& (x) -> zjnode)
+#define ZJNODE(x) (&(x)->zjnode)
 #define JZNODE(x)						\
 ({								\
-	typeof (x) __tmp_x;					\
+	typeof(x) __tmp_x;					\
 								\
 	__tmp_x = (x);						\
-	assert ("jmacd-1300", jnode_is_znode (__tmp_x));	\
+	assert("jmacd-1300", jnode_is_znode(__tmp_x));	\
 	(znode*) __tmp_x;					\
 })
 
@@ -438,7 +439,7 @@ extern void jnode_list_remove(jnode * no
 int znode_is_root(const znode * node) NONNULL;
 
 /* bump reference counter on @node */
-static inline void add_x_ref(jnode * node /* node to increase x_count of */ )
+static inline void add_x_ref(jnode * node/* node to increase x_count of */)
 {
 	assert("nikita-1911", node != NULL);
 
@@ -573,7 +574,8 @@ static inline int jnode_check_flushprepp
 {
 	int result;
 
-	/* It must be clean or relocated or wandered.  New allocations are set to relocate. */
+	/* It must be clean or relocated or wandered.  New allocations are set
+	 * to relocate. */
 	spin_lock_jnode(node);
 	result = jnode_is_flushprepped(node);
 	spin_unlock_jnode(node);
@@ -633,7 +635,7 @@ static inline void jput(jnode * node);
 extern void jput_final(jnode * node);
 
 /* bump data counter on @node */
-static inline void add_d_ref(jnode * node /* node to increase d_count of */ )
+static inline void add_d_ref(jnode * node/* node to increase d_count of */)
 {
 	assert("nikita-1962", node != NULL);
 
@@ -660,9 +662,9 @@ static inline void jput(jnode * node)
 	/*
 	 * we don't need any kind of lock here--jput_final() uses RCU.
 	 */
-	if (unlikely(atomic_dec_and_test(&node->x_count))) {
+	if (unlikely(atomic_dec_and_test(&node->x_count)))
 		jput_final(node);
-	} else
+	else
 		rcu_read_unlock();
 	assert("nikita-3473", reiser4_schedulable());
 }

--=-Pb84LccQYzYEzIpPov6p--

