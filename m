From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Grub segfaults when trying to access reiser4
Date: Thu, 29 Jul 2004 00:39:46 +0400
Message-ID: <200407290039.46500.vitaly@namesys.com>
References: <e7963922040726145045bdb0cd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_S8ACBmbFZuVBJDo"
Return-path: <reiserfs-list-return-19844-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e7963922040726145045bdb0cd@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Stefan Schweizer <sschweizer@gmail.com>, reiserfs-list@namesys.com

--Boundary-00=_S8ACBmbFZuVBJDo
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 27 July 2004 01:50, Stefan Schweizer wrote:
> Hi,
>
> I managed to patch grub with your reiser4 patches, but it does not
> work. I can see the partition but I cannot access any files on it. If
> I try it segfaults. What am I doing wrong or is this a known issue?
>
> grub> kernel (hd0,
>  Possible partitions are:
>    Partition num: 0,  Filesystem type is reiser4, partition type 0x83
>    Partition num: 1,  Filesystem type unknown, partition type 0x82
>    Partition num: 2,  Filesystem type unknown, partition type 0x83
>    Partition num: 3,  Filesystem type is ext2fs, partition type 0x83
>
> grub> kernel (hd0,0)/Segmentation Fault
> /home #
>
> (I only pressed [tab] and had to add the / manually before)
>
> Grub versions tested: 0.94, 0.95
> Kernel Version: 2.6.8-rc2
> Reiser4progs Version: 0.5.6
> libaal Version: 0.5.3

would you try this patch please.

-- 
Thanks,
Vitaly Fertman

--Boundary-00=_S8ACBmbFZuVBJDo
Content-Type: text/x-diff;
  charset="koi8-r";
  name="reiser4progs_alone_node_unload.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiser4progs_alone_node_unload.patch"

 --------------------------------------------
# 04/07/29	vitaly@digger.namesys.com	1.2336
# a bug in stand alone mode was fixed:
# - do not unload all nodes on tree_adjust -- there are locked ones.
# --------------------------------------------
#
diff -Nru a/libreiser4/tree.c b/libreiser4/tree.c
--- a/libreiser4/tree.c	Thu Jul 29 00:31:10 2004
+++ b/libreiser4/tree.c	Thu Jul 29 00:31:10 2004
@@ -1280,13 +1280,17 @@
 	/* Allocating unallocated extent item at @place. */
 	return reiser4_tree_alloc_extent(tree, place);
 }
+#endif
 
 static errno_t cb_node_unload(reiser4_tree_t *tree, reiser4_node_t *node) {
+#ifndef ENABLE_STAND_ALONE
 	count_t free_blocks;
 
-	/* Updating free space counter in format. */
+	/* Updating free space counter in format for the case some blocks were 
+	   allocated. */
 	free_blocks = reiser4_alloc_free(tree->fs->alloc);
 	reiser4_format_set_free(tree->fs->format, free_blocks);
+#endif
 
 	/* If node is locked, that is not a leaf or it is used by someone, it
 	   cannot be released, and thus, it does not make the sense to save it
@@ -1294,16 +1298,17 @@
 	if (reiser4_node_locked(node))
 		return 0;
 	
+#ifndef ENABLE_STAND_ALONE
 	/* Okay, node is fully allocated now and ready to be saved to device if
 	   it is dirty. */
 	if (reiser4_node_isdirty(node) && reiser4_node_sync(node)) {
 		aal_error("Can't write node %llu.", node->block->nr);
 		return -EIO;
 	}
+#endif
 	/* Unloading node from tree cache. */
 	return reiser4_tree_unload_node(tree, node);
 }
-#endif
 
 
 /* Entry point for adjsuting tree routines. */
@@ -1325,7 +1330,7 @@
 						     cb_node_unload);
 #else
 			res = reiser4_tree_walk_node(tree, tree->root, 
-						     reiser4_tree_unload_node);
+						     cb_node_unload);
 #endif
 		
 		tree->adjusting = 0;


--Boundary-00=_S8ACBmbFZuVBJDo--

