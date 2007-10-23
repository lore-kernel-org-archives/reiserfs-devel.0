From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 6/8] carry.h cleanup
Date: Tue, 23 Oct 2007 14:14:39 +0200
Message-ID: <1193141679.6236.44.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-RBbEAZVVVW6Fml0K+CLa"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-RBbEAZVVVW6Fml0K+CLa
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- carry.h.orig	2007-10-23 12:39:07.000000000 +0200
+++ carry.h	2007-10-23 12:54:25.000000000 +0200
@@ -1,9 +1,10 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 /* Functions and data types to "carry" tree modification(s) upward.
    See fs/reiser4/carry.c for details. */
 
-#if !defined( __FS_REISER4_CARRY_H__ )
+#if !defined(__FS_REISER4_CARRY_H__)
 #define __FS_REISER4_CARRY_H__
 
 #include "forward.h"
@@ -138,12 +139,13 @@ typedef struct carry_insert_data {
 	/* position where new item is to be inserted */
 	coord_t *coord;
 	/* new item description */
-	reiser4_item_data *data;
+	reiser4_item_data * data;
 	/* key of new item */
-	const reiser4_key *key;
+	const reiser4_key * key;
 } carry_insert_data;
 
-/* cut and kill are similar, so carry_cut_data and carry_kill_data
share the below structure of parameters */
+/* cut and kill are similar, so carry_cut_data and carry_kill_data
share the
+   below structure of parameters */
 struct cut_kill_params {
 	/* coord where cut starts (inclusive) */
 	coord_t *from;
@@ -153,9 +155,9 @@ struct cut_kill_params {
 	/* starting key. This is necessary when item and unit pos don't
 	 * uniquely identify what portion or tree to remove. For example, this
 	 * indicates what portion of extent unit will be affected. */
-	const reiser4_key *from_key;
+	const reiser4_key * from_key;
 	/* exclusive stop key */
-	const reiser4_key *to_key;
+	const reiser4_key * to_key;
 	/* if this is not NULL, smallest actually removed key is stored
 	 * here. */
 	reiser4_key *smallest_removed;
@@ -186,7 +188,8 @@ struct carry_kill_data {
 	 * 2. said neighbors have to be locked. */
 	lock_handle *left;
 	lock_handle *right;
-	/* flags modifying behavior of kill. Currently, it may have
DELETE_RETAIN_EMPTY set. */
+	/* flags modifying behavior of kill. Currently, it may have
+	   DELETE_RETAIN_EMPTY set. */
 	unsigned flags;
 	char *buf;
 };
@@ -358,74 +361,74 @@ extern znode *reiser4_carry_real(const c
 
 /* helper macros to iterate over carry queues */
 
-#define carry_node_next( node )					\
+#define carry_node_next(node)					\
 	list_entry((node)->header.level_linkage.next, carry_node,	\
 		   header.level_linkage)
 
-#define carry_node_prev( node )					\
+#define carry_node_prev(node)					\
 	list_entry((node)->header.level_linkage.prev, carry_node,	\
 		   header.level_linkage)
 
-#define carry_node_front( level )						\
+#define carry_node_front(level)					\
 	list_entry((level)->nodes.next, carry_node, header.level_linkage)
 
-#define carry_node_back( level )						\
+#define carry_node_back(level)					\
 	list_entry((level)->nodes.prev, carry_node, header.level_linkage)
 
-#define carry_node_end( level, node )				\
+#define carry_node_end(level, node)				\
 	(&(level)->nodes == &(node)->header.level_linkage)
 
 /* macro to iterate over all operations in a @level */
-#define for_all_ops( level /* carry level (of type carry_level *) */,
\
-		     op    /* pointer to carry operation, modified by loop (of 		\
-			    * type carry_op *) */,					\
-		     tmp   /* pointer to carry operation (of type carry_op *), 		\
-			    * used to make iterator stable in the face of 		\
-			    * deletions from the level */ )				\
-for (op = list_entry(level->ops.next, carry_op, header.level_linkage),
\
+#define for_all_ops(level /* carry level (of type carry_level *) */,
\
+		    op    /* pointer to carry operation, modified by loop (of  \
+			   * type carry_op *) */,			       \
+		    tmp   /* pointer to carry operation (of type carry_op *),  \
+			   * used to make iterator stable in the face of       \
+			   * deletions from the level */ )		       \
+for (op = list_entry(level->ops.next, carry_op, header.level_linkage),
\
      tmp = list_entry(op->header.level_linkage.next, carry_op,
header.level_linkage); 	\
-     &op->header.level_linkage != &level->ops;						\
-     op = tmp,										\
+     &op->header.level_linkage != &level->ops;				       \
+     op = tmp,								       \
      tmp = list_entry(op->header.level_linkage.next, carry_op,
header.level_linkage))
 
 #if 0
-for( op = ( carry_op * ) pool_level_list_front( &level -> ops ),		\
-     tmp = ( carry_op * ) pool_level_list_next( &op -> header ) ;		\
-     ! pool_level_list_end( &level -> ops, &op -> header ) ;			\
-     op = tmp, tmp = ( carry_op * ) pool_level_list_next( &op ->
header ) )
+for (op = (carry_op *) pool_level_list_front(&level->ops),	       \
+     tmp = (carry_op *) pool_level_list_next(&op->header) ;	       \
+     !pool_level_list_end(&level->ops, &op->header) ;		       \
+     op = tmp, tmp = (carry_op *) pool_level_list_next(&op->header))
 #endif
 
-/* macro to iterate over all nodes in a @level */						\
-#define for_all_nodes( level /* carry level (of type carry_level *) */,
\
-		       node  /* pointer to carry node, modified by loop (of 			\
-			      * type carry_node *) */,						\
-		       tmp   /* pointer to carry node (of type carry_node *), 			\
-			      * used to make iterator stable in the face of * 			\
-			      * deletions from the level */ )					\
-for (node = list_entry(level->nodes.next, carry_node,
header.level_linkage),			\
-     tmp = list_entry(node->header.level_linkage.next, carry_node,
header.level_linkage); 	\
-     &node->header.level_linkage != &level->nodes;						\
-     node = tmp, 										\
+/* macro to iterate over all nodes in a @level */			       \
+#define for_all_nodes(level /* carry level (of type carry_level *) */,
\
+		      node  /* pointer to carry node, modified by loop (of     \
+			      * type carry_node *) */,			       \
+		      tmp   /* pointer to carry node (of type carry_node *),   \
+			      * used to make iterator stable in the face of *  \
+			      * deletions from the level */ )		       \
+for (node = list_entry(level->nodes.next, carry_node,
header.level_linkage),   \
+     tmp = list_entry(node->header.level_linkage.next, carry_node,
header.level_linkage); \
+     &node->header.level_linkage != &level->nodes;			       \
+     node = tmp, 							       \
      tmp = list_entry(node->header.level_linkage.next, carry_node,
header.level_linkage))
 
 #if 0
-for( node = carry_node_front( level ),						\
-     tmp = carry_node_next( node ) ; ! carry_node_end( level, node ) ;
\
-     node = tmp, tmp = carry_node_next( node ) )
+for (node = carry_node_front(level),					\
+     tmp = carry_node_next(node) ; !carry_node_end(level, node) ;	\
+     node = tmp, tmp = carry_node_next(node))
 #endif
 
 /* macro to iterate over all nodes in a @level in reverse order
 
    This is used, because nodes are unlocked in reversed order of
locking */
-#define for_all_nodes_back( level /* carry level (of type carry_level
*) */,	\
-		            node  /* pointer to carry node, modified by loop	\
-				   * (of type carry_node *) */,			\
-		            tmp   /* pointer to carry node (of type carry_node	\
-				   * *), used to make iterator stable in the	\
-				   * face of deletions from the level */ )	\
-for( node = carry_node_back( level ),		\
-     tmp = carry_node_prev( node ) ; ! carry_node_end( level, node ) ;
\
-     node = tmp, tmp = carry_node_prev( node ) )
+#define for_all_nodes_back(level /* carry level (of type carry_level *)
*/,    \
+			   node  /* pointer to carry node, modified by loop    \
+				   * (of type carry_node *) */,		       \
+			   tmp   /* pointer to carry node (of type carry_node  \
+				   * *), used to make iterator stable in the   \
+				   * face of deletions from the level */ )     \
+for (node = carry_node_back(level),		\
+     tmp = carry_node_prev(node) ; !carry_node_end(level, node) ;	\
+     node = tmp, tmp = carry_node_prev(node))
 
 /* __FS_REISER4_CARRY_H__ */
 #endif

--=-RBbEAZVVVW6Fml0K+CLa
Content-Disposition: attachment; filename=carry.h.patch
Content-Type: text/x-patch; name=carry.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- carry.h.orig	2007-10-23 12:39:07.000000000 +0200
+++ carry.h	2007-10-23 12:54:25.000000000 +0200
@@ -1,9 +1,10 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 /* Functions and data types to "carry" tree modification(s) upward.
    See fs/reiser4/carry.c for details. */
 
-#if !defined( __FS_REISER4_CARRY_H__ )
+#if !defined(__FS_REISER4_CARRY_H__)
 #define __FS_REISER4_CARRY_H__
 
 #include "forward.h"
@@ -138,12 +139,13 @@ typedef struct carry_insert_data {
 	/* position where new item is to be inserted */
 	coord_t *coord;
 	/* new item description */
-	reiser4_item_data *data;
+	reiser4_item_data * data;
 	/* key of new item */
-	const reiser4_key *key;
+	const reiser4_key * key;
 } carry_insert_data;
 
-/* cut and kill are similar, so carry_cut_data and carry_kill_data share the below structure of parameters */
+/* cut and kill are similar, so carry_cut_data and carry_kill_data share the
+   below structure of parameters */
 struct cut_kill_params {
 	/* coord where cut starts (inclusive) */
 	coord_t *from;
@@ -153,9 +155,9 @@ struct cut_kill_params {
 	/* starting key. This is necessary when item and unit pos don't
 	 * uniquely identify what portion or tree to remove. For example, this
 	 * indicates what portion of extent unit will be affected. */
-	const reiser4_key *from_key;
+	const reiser4_key * from_key;
 	/* exclusive stop key */
-	const reiser4_key *to_key;
+	const reiser4_key * to_key;
 	/* if this is not NULL, smallest actually removed key is stored
 	 * here. */
 	reiser4_key *smallest_removed;
@@ -186,7 +188,8 @@ struct carry_kill_data {
 	 * 2. said neighbors have to be locked. */
 	lock_handle *left;
 	lock_handle *right;
-	/* flags modifying behavior of kill. Currently, it may have DELETE_RETAIN_EMPTY set. */
+	/* flags modifying behavior of kill. Currently, it may have
+	   DELETE_RETAIN_EMPTY set. */
 	unsigned flags;
 	char *buf;
 };
@@ -358,74 +361,74 @@ extern znode *reiser4_carry_real(const c
 
 /* helper macros to iterate over carry queues */
 
-#define carry_node_next( node )					\
+#define carry_node_next(node)					\
 	list_entry((node)->header.level_linkage.next, carry_node,	\
 		   header.level_linkage)
 
-#define carry_node_prev( node )					\
+#define carry_node_prev(node)					\
 	list_entry((node)->header.level_linkage.prev, carry_node,	\
 		   header.level_linkage)
 
-#define carry_node_front( level )						\
+#define carry_node_front(level)					\
 	list_entry((level)->nodes.next, carry_node, header.level_linkage)
 
-#define carry_node_back( level )						\
+#define carry_node_back(level)					\
 	list_entry((level)->nodes.prev, carry_node, header.level_linkage)
 
-#define carry_node_end( level, node )				\
+#define carry_node_end(level, node)				\
 	(&(level)->nodes == &(node)->header.level_linkage)
 
 /* macro to iterate over all operations in a @level */
-#define for_all_ops( level /* carry level (of type carry_level *) */,			\
-		     op    /* pointer to carry operation, modified by loop (of 		\
-			    * type carry_op *) */,					\
-		     tmp   /* pointer to carry operation (of type carry_op *), 		\
-			    * used to make iterator stable in the face of 		\
-			    * deletions from the level */ )				\
-for (op = list_entry(level->ops.next, carry_op, header.level_linkage),			\
+#define for_all_ops(level /* carry level (of type carry_level *) */,	       \
+		    op    /* pointer to carry operation, modified by loop (of  \
+			   * type carry_op *) */,			       \
+		    tmp   /* pointer to carry operation (of type carry_op *),  \
+			   * used to make iterator stable in the face of       \
+			   * deletions from the level */ )		       \
+for (op = list_entry(level->ops.next, carry_op, header.level_linkage),	       \
      tmp = list_entry(op->header.level_linkage.next, carry_op, header.level_linkage); 	\
-     &op->header.level_linkage != &level->ops;						\
-     op = tmp,										\
+     &op->header.level_linkage != &level->ops;				       \
+     op = tmp,								       \
      tmp = list_entry(op->header.level_linkage.next, carry_op, header.level_linkage))
 
 #if 0
-for( op = ( carry_op * ) pool_level_list_front( &level -> ops ),		\
-     tmp = ( carry_op * ) pool_level_list_next( &op -> header ) ;		\
-     ! pool_level_list_end( &level -> ops, &op -> header ) ;			\
-     op = tmp, tmp = ( carry_op * ) pool_level_list_next( &op -> header ) )
+for (op = (carry_op *) pool_level_list_front(&level->ops),	       \
+     tmp = (carry_op *) pool_level_list_next(&op->header) ;	       \
+     !pool_level_list_end(&level->ops, &op->header) ;		       \
+     op = tmp, tmp = (carry_op *) pool_level_list_next(&op->header))
 #endif
 
-/* macro to iterate over all nodes in a @level */						\
-#define for_all_nodes( level /* carry level (of type carry_level *) */,				\
-		       node  /* pointer to carry node, modified by loop (of 			\
-			      * type carry_node *) */,						\
-		       tmp   /* pointer to carry node (of type carry_node *), 			\
-			      * used to make iterator stable in the face of * 			\
-			      * deletions from the level */ )					\
-for (node = list_entry(level->nodes.next, carry_node, header.level_linkage),			\
-     tmp = list_entry(node->header.level_linkage.next, carry_node, header.level_linkage); 	\
-     &node->header.level_linkage != &level->nodes;						\
-     node = tmp, 										\
+/* macro to iterate over all nodes in a @level */			       \
+#define for_all_nodes(level /* carry level (of type carry_level *) */,	       \
+		      node  /* pointer to carry node, modified by loop (of     \
+			      * type carry_node *) */,			       \
+		      tmp   /* pointer to carry node (of type carry_node *),   \
+			      * used to make iterator stable in the face of *  \
+			      * deletions from the level */ )		       \
+for (node = list_entry(level->nodes.next, carry_node, header.level_linkage),   \
+     tmp = list_entry(node->header.level_linkage.next, carry_node, header.level_linkage); \
+     &node->header.level_linkage != &level->nodes;			       \
+     node = tmp, 							       \
      tmp = list_entry(node->header.level_linkage.next, carry_node, header.level_linkage))
 
 #if 0
-for( node = carry_node_front( level ),						\
-     tmp = carry_node_next( node ) ; ! carry_node_end( level, node ) ;		\
-     node = tmp, tmp = carry_node_next( node ) )
+for (node = carry_node_front(level),					\
+     tmp = carry_node_next(node) ; !carry_node_end(level, node) ;	\
+     node = tmp, tmp = carry_node_next(node))
 #endif
 
 /* macro to iterate over all nodes in a @level in reverse order
 
    This is used, because nodes are unlocked in reversed order of locking */
-#define for_all_nodes_back( level /* carry level (of type carry_level *) */,	\
-		            node  /* pointer to carry node, modified by loop	\
-				   * (of type carry_node *) */,			\
-		            tmp   /* pointer to carry node (of type carry_node	\
-				   * *), used to make iterator stable in the	\
-				   * face of deletions from the level */ )	\
-for( node = carry_node_back( level ),		\
-     tmp = carry_node_prev( node ) ; ! carry_node_end( level, node ) ;		\
-     node = tmp, tmp = carry_node_prev( node ) )
+#define for_all_nodes_back(level /* carry level (of type carry_level *) */,    \
+			   node  /* pointer to carry node, modified by loop    \
+				   * (of type carry_node *) */,		       \
+			   tmp   /* pointer to carry node (of type carry_node  \
+				   * *), used to make iterator stable in the   \
+				   * face of deletions from the level */ )     \
+for (node = carry_node_back(level),		\
+     tmp = carry_node_prev(node) ; !carry_node_end(level, node) ;	\
+     node = tmp, tmp = carry_node_prev(node))
 
 /* __FS_REISER4_CARRY_H__ */
 #endif

--=-RBbEAZVVVW6Fml0K+CLa--

