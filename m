From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 54/8] super.h cleanup
Date: Thu, 25 Oct 2007 18:50:35 +0200
Message-ID: <1193331035.15901.82.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-cUscG7pmGeF+yvcdLciB"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-cUscG7pmGeF+yvcdLciB
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 7 errors, 2 warnings, 464 lines checked
patched:total: 0 errors, 1 warnings, 464 lines checked
leftover:

WARNING: do not add new typedefs
#26: FILE: super.h:26:
+typedef enum {




--=-cUscG7pmGeF+yvcdLciB
Content-Disposition: attachment; filename=super.h.patch
Content-Type: text/x-patch; name=super.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- super.h.orig	2007-10-25 17:36:25.000000000 +0200
+++ super.h	2007-10-25 17:40:30.000000000 +0200
@@ -3,7 +3,7 @@
 
 /* Super-block functions. See super.c for details. */
 
-#if !defined( __REISER4_SUPER_H__ )
+#if !defined(__REISER4_SUPER_H__)
 #define __REISER4_SUPER_H__
 
 #include "tree.h"
@@ -297,11 +297,11 @@ struct reiser4_super_info_data {
 };
 
 extern reiser4_super_info_data *get_super_private_nocheck(const struct
-							  super_block *super);
+							  super_block * super);
 
 /* Return reiser4-specific part of super block */
 static inline reiser4_super_info_data *get_super_private(const struct
-							 super_block *super)
+							 super_block * super)
 {
 	assert("nikita-447", super != NULL);
 
@@ -368,7 +368,7 @@ static inline int rofs_jnode(jnode * nod
 
 extern __u64 reiser4_current_block_count(void);
 
-extern void build_object_ops(struct super_block *super, struct object_ops * ops);
+extern void build_object_ops(struct super_block *super, struct object_ops *ops);
 
 #define REISER4_SUPER_MAGIC 0x52345362	/* (*(__u32 *)"R4Sb"); */
 
@@ -431,7 +431,7 @@ extern reiser4_plugin *get_default_plugi
 /* Maximal possible object id. */
 #define  ABSOLUTE_MAX_OID ((oid_t)~0)
 
-#define OIDS_RESERVED  ( 1 << 16 )
+#define OIDS_RESERVED  (1 << 16)
 int oid_init_allocator(struct super_block *, oid_t nr_files, oid_t next);
 oid_t oid_allocate(struct super_block *);
 int oid_release(struct super_block *, oid_t);

--=-cUscG7pmGeF+yvcdLciB--

