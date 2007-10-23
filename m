From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 9/8] carry_ops.h cleanup
Date: Tue, 23 Oct 2007 15:00:24 +0200
Message-ID: <1193144424.6236.58.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- carry_ops.h.orig	2007-10-23 14:56:05.000000000 +0200
+++ carry_ops.h	2007-10-23 14:57:35.000000000 +0200
@@ -1,8 +1,9 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 /* implementation of carry operations. See carry_ops.c for details. */
 
-#if !defined( __CARRY_OPS_H__ )
+#if !defined(__CARRY_OPS_H__)
 #define __CARRY_OPS_H__
 
 #include "forward.h"
@@ -22,7 +23,7 @@ typedef struct carry_op_handler {
    thing. */
 extern carry_op_handler op_dispatch_table[COP_LAST_OP];
 
-unsigned int space_needed(const znode * node, const coord_t * coord,
+unsigned int space_needed(const znode * node, const coord_t *coord,
 			  const reiser4_item_data * data, int inserting);
 extern carry_node *find_left_carry(carry_node * node, carry_level *
level);
 extern carry_node *find_right_carry(carry_node * node, carry_level *
level);

