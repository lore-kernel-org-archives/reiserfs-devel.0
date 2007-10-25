From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 53/8] super.c cleanup
Date: Thu, 25 Oct 2007 17:22:06 +0200
Message-ID: <1193325726.15901.77.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-+klErMl1QNymJHzcMe9h"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-+klErMl1QNymJHzcMe9h
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 9 errors, 14 warnings, 316 lines checked
patched:total: 0 errors, 1 warnings, 314 lines checked
leftover:

WARNING: line over 80 characters
#25: FILE: super.c:25:
+reiser4_super_info_data *get_super_private_nocheck(const struct
super_block *super




--=-+klErMl1QNymJHzcMe9h
Content-Disposition: attachment; filename=super.c.patch
Content-Type: text/x-patch; name=super.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- super.c.orig	2007-10-25 17:10:00.000000000 +0200
+++ super.c	2007-10-25 17:20:10.000000000 +0200
@@ -22,13 +22,14 @@ static __u64 reserved_for_uid(const stru
 static __u64 reserved_for_root(const struct super_block *super);
 
 /* Return reiser4-specific part of super block */
-reiser4_super_info_data *get_super_private_nocheck(const struct super_block *super	/* super block
-											 * queried */ )
+reiser4_super_info_data *get_super_private_nocheck(const struct super_block *super
+							/*super block queried*/)
 {
 	return (reiser4_super_info_data *) super->s_fs_info;
 }
 
-/* Return reiser4 fstype: value that is returned in ->f_type field by statfs() */
+/* Return reiser4 fstype: value that is returned in ->f_type field by statfs()
+ */
 long reiser4_statfs_type(const struct super_block *super UNUSED_ARG)
 {
 	assert("nikita-448", super != NULL);
@@ -132,7 +133,7 @@ __u64 reiser4_free_committed_blocks(cons
 long reiser4_reserved_blocks(const struct super_block *super	/* super block
 								   queried */ ,
 			     uid_t uid /* user id */ ,
-			     gid_t gid /* group id */ )
+			     gid_t gid/* group id */)
 {
 	long reserved;
 
@@ -150,7 +151,7 @@ long reiser4_reserved_blocks(const struc
 }
 
 /* get/set value of/to grabbed blocks counter */
-__u64 reiser4_grabbed_blocks(const struct super_block * super)
+__u64 reiser4_grabbed_blocks(const struct super_block *super)
 {
 	assert("zam-512", super != NULL);
 	assert("zam-513", is_reiser4_super(super));
@@ -158,7 +159,7 @@ __u64 reiser4_grabbed_blocks(const struc
 	return get_super_private(super)->blocks_grabbed;
 }
 
-__u64 reiser4_flush_reserved(const struct super_block * super)
+__u64 reiser4_flush_reserved(const struct super_block *super)
 {
 	assert("vpf-285", super != NULL);
 	assert("vpf-286", is_reiser4_super(super));
@@ -167,7 +168,7 @@ __u64 reiser4_flush_reserved(const struc
 }
 
 /* get/set value of/to counter of fake allocated formatted blocks */
-__u64 reiser4_fake_allocated(const struct super_block * super)
+__u64 reiser4_fake_allocated(const struct super_block *super)
 {
 	assert("zam-516", super != NULL);
 	assert("zam-517", is_reiser4_super(super));
@@ -176,7 +177,7 @@ __u64 reiser4_fake_allocated(const struc
 }
 
 /* get/set value of/to counter of fake allocated unformatted blocks */
-__u64 reiser4_fake_allocated_unformatted(const struct super_block * super)
+__u64 reiser4_fake_allocated_unformatted(const struct super_block *super)
 {
 	assert("zam-516", super != NULL);
 	assert("zam-517", is_reiser4_super(super));
@@ -185,7 +186,7 @@ __u64 reiser4_fake_allocated_unformatted
 }
 
 /* get/set value of/to counter of clustered blocks */
-__u64 reiser4_clustered_blocks(const struct super_block * super)
+__u64 reiser4_clustered_blocks(const struct super_block *super)
 {
 	assert("edward-601", super != NULL);
 	assert("edward-602", is_reiser4_super(super));
@@ -203,16 +204,16 @@ reiser4_space_allocator * reiser4_get_sp
 }
 
 /* return fake inode used to bind formatted nodes in the page cache */
-struct inode *reiser4_get_super_fake(const struct super_block *super	/* super block
-								   queried */ )
+struct inode *reiser4_get_super_fake(const struct super_block *super
+						/* super block queried */)
 {
 	assert("nikita-1757", super != NULL);
 	return get_super_private(super)->fake;
 }
 
 /* return fake inode used to bind copied on capture nodes in the page cache */
-struct inode *reiser4_get_cc_fake(const struct super_block *super	/* super block
-								   queried */ )
+struct inode *reiser4_get_cc_fake(const struct super_block *super/* super block
+								  * queried */)
 {
 	assert("nikita-1757", super != NULL);
 	return get_super_private(super)->cc;
@@ -226,8 +227,8 @@ struct inode *reiser4_get_bitmap_fake(co
 }
 
 /* tree used by this file system */
-reiser4_tree *reiser4_get_tree(const struct super_block * super	/* super block
-							 * queried */ )
+reiser4_tree *reiser4_get_tree(const struct super_block *super/* super block
+							       * queried */)
 {
 	assert("nikita-460", super != NULL);
 	assert("nikita-461", is_reiser4_super(super));
@@ -251,27 +252,24 @@ int reiser4_is_set(const struct super_bl
 }
 
 /* amount of blocks reserved for given group in file system */
-static __u64 reserved_for_gid(const struct super_block *super UNUSED_ARG	/* super
-										 * block
-										 * queried */ ,
-			      gid_t gid UNUSED_ARG /* group id */ )
+static __u64 reserved_for_gid(const struct super_block *super UNUSED_ARG
+						/* super block queried */ ,
+			      gid_t gid UNUSED_ARG/* group id */)
 {
 	return 0;
 }
 
 /* amount of blocks reserved for given user in file system */
-static __u64 reserved_for_uid(const struct super_block *super UNUSED_ARG	/* super
-										   block
-										   queried */ ,
-			      uid_t uid UNUSED_ARG /* user id */ )
+static __u64 reserved_for_uid(const struct super_block *super UNUSED_ARG
+						/* super block queried */ ,
+			      uid_t uid UNUSED_ARG/* user id */)
 {
 	return 0;
 }
 
 /* amount of blocks reserved for super user in file system */
-static __u64 reserved_for_root(const struct super_block *super UNUSED_ARG	/* super
-										   block
-										   queried */ )
+static __u64 reserved_for_root(const struct super_block *super UNUSED_ARG
+							/*super block queried*/)
 {
 	return 0;
 }

--=-+klErMl1QNymJHzcMe9h--

