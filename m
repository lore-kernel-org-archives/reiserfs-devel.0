From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Reiser4 panic at fs/reiser4/lock.c:434
Date: Thu, 25 Mar 2004 14:32:38 +0300
Message-ID: <16482.50006.976095.680498@laputa.namesys.com>
References: <1080175834.13000.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17463-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080175834.13000.10.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Jonathan Briggs writes:
 > The system is running Linux kernel 2.6.5-rc2.  It's tainted by Nvidia
 > drivers.
 > 
 > The system was compiling the kernel, and Reiser4 panicked.

Was compilation multi-threaded (make -j)?

 > The Reiser4 panic starts at line 443 of the attached dmesg log.
 > 
 > The Reiser4 filesystem is on a MD RAID 0 device made of two SCSI disks.
 > 
 > I had some Reiser4 debugging options turned on.  I was trying to catch
 > it creating blocks of zeros, which is something I noticed it doing to
 > frequently appended files like .xsession-errors and my Evolution mbox
 > file.
 > 
 > After I rebooted the system, I copied the kernel source to another
 > filesystem and finished the compile, which does not include debugging
 > options (It was way too slow!), so I am not running with debugging now. 
 > But if you want more information, let me know and I will try to provide
 > it.

Please try following patch:
----------------------------------------------------------------------
# This is a BitKeeper generated patch for the following project:
# Project Name: ReiserFS-4
# This patch format is intended for GNU patch command version 2.5 or higher.
# This patch includes the following deltas:
#	           ChangeSet	1.1542  -> 1.1543 
#	plugin/item/extent_item_ops.c	1.48    -> 1.49   
#
# The following is the BitKeeper ChangeSet Log
# --------------------------------------------
# 04/03/25	god@laputa.namesys.com	1.1543
# fix locking in kill_hook_extent(): relinking extent neighbors and update of their 
# delimiting keys should be atomic
# --------------------------------------------
#
diff -Nru a/plugin/item/extent_item_ops.c b/plugin/item/extent_item_ops.c
--- a/plugin/item/extent_item_ops.c	Thu Mar 25 14:30:47 2004
+++ b/plugin/item/extent_item_ops.c	Thu Mar 25 14:30:47 2004
@@ -420,25 +420,38 @@
 			left = kdata->left->node;
 			right = kdata->right->node;
 				
-			/* if neighbors of item being removed are znodes - link them */
 			tree = current_tree;
-			UNDER_RW_VOID(tree, tree, write, link_left_and_right(left, right));
+			/* we have to do two things:
+			 *
+			 *     1. link left and right formatted neighbors of
+			 *        extent being removed, and
+			 *
+			 *     2. update their delimiting keys.
+			 *
+			 * atomicity of these operations is protected by
+			 * taking dk-lock and tree-lock.
+			 */
+			WLOCK_DK(tree);
+			/* if neighbors of item being removed are znodes -
+			 * link them */
+			UNDER_RW_VOID(tree, tree,
+				      write, link_left_and_right(left, right));
 
 			if (left) {
-				/* update right delimiting key of left neighbor of extent item */
+				/* update right delimiting key of left
+				 * neighbor of extent item */
 				coord_t next;
 				reiser4_key key;
 
 				coord_dup(&next, coord);
-				
-				WLOCK_DK(tree);
+
 				if (coord_next_item(&next))
 					key = *znode_get_rd_key(coord->node);
 				else
 					item_key_by_coord(&next, &key);
 				znode_set_rd_key(left, &key);
-				WUNLOCK_DK(tree);
 			}
+			WUNLOCK_DK(tree);
 
 			from_off = get_key_offset(&min_item_key) >> PAGE_CACHE_SHIFT;
 			to_off = (get_key_offset(&max_item_key) + 1) >> PAGE_CACHE_SHIFT;
----------------------------------------------------------------------
 > -- 
 > Jonathan Briggs
 > jbriggs@esoft.com

Nikita.
