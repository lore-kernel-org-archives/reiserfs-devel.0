From: Peter Klotz <peter.klotz@aon.at>
Subject: Patch to fix typos in reiser4progs 1.0.3
Date: Wed, 09 Feb 2005 22:19:58 +0100
Message-ID: <420A7E7E.3050709@aon.at>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060805060807030706030702"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------060805060807030706030702
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I attached a patch that fixes a few typos in reiser4progs 1.0.3.

Best regards, Peter.

--------------060805060807030706030702
Content-Type: text/plain;
 name="reiser4progs-1.0.3-typos.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4progs-1.0.3-typos.patch"

diff -burN reiser4progs-1.0.3/INSTALL_README reiser4progs-1.0.3.patch/INSTALL_README
--- reiser4progs-1.0.3/INSTALL_README	2003-12-29 23:16:42.000000000 +0100
+++ reiser4progs-1.0.3.patch/INSTALL_README	2005-02-09 21:55:26.000000000 +0100
@@ -3,7 +3,7 @@
 ./one_touch_install
 
 This will check if configure script is in place and then runs it. 
-After configuring if finished, package will built and installed.
+After configuring is finished, package will be built and installed.
 
-Or if you want to have a full control on build process and/or specify
+Or if you want to have full control on build process and/or specify
 some options, read CUSTOM_INSTALL_README please.
diff -burN reiser4progs-1.0.3/libmisc/misc.c reiser4progs-1.0.3.patch/libmisc/misc.c
--- reiser4progs-1.0.3/libmisc/misc.c	2004-10-21 15:04:36.000000000 +0200
+++ reiser4progs-1.0.3.patch/libmisc/misc.c	2005-02-09 21:40:15.000000000 +0100
@@ -248,7 +248,7 @@
 #endif /* defined(MOUNTED) || defined(_PATH_MOUNTED) */
 	
 	/* If has not been checked in neither /proc/mounts nor /etc/mtab (or 
-	   errors have occured), return INVAL_PTR, NULL otherwise. */
+	   errors have occurred), return INVAL_PTR, NULL otherwise. */
 	return (!proc && !path) ? INVAL_PTR : NULL;
 }
 
diff -burN reiser4progs-1.0.3/libreiser4/tree.c reiser4progs-1.0.3.patch/libreiser4/tree.c
--- reiser4progs-1.0.3/libreiser4/tree.c	2004-12-08 10:38:12.000000000 +0100
+++ reiser4progs-1.0.3.patch/libreiser4/tree.c	2005-02-09 21:40:41.000000000 +0100
@@ -1799,7 +1799,7 @@
 					  cbias, &place->pos);
 
 		/* Check if we should finish lookup because we reach stop level
-		   or some error occured during last node lookup. */
+		   or some error occurred during last node lookup. */
 		if (clevel <= hint->level || res < 0) {
 			if (res == PRESENT) {
 #ifndef ENABLE_MINIMAL
diff -burN reiser4progs-1.0.3/progs/fsck/fsck.c reiser4progs-1.0.3.patch/progs/fsck/fsck.c
--- reiser4progs-1.0.3/progs/fsck/fsck.c	2004-12-06 22:46:41.000000000 +0100
+++ reiser4progs-1.0.3.patch/progs/fsck/fsck.c	2005-02-09 21:37:52.000000000 +0100
@@ -58,7 +58,7 @@
 		break;
 	case RM_FIX:
 		aal_mess("Will fix minor corruptions of "
-			 "the Reiser4 SuperBblock.");
+			 "the Reiser4 SuperBlock.");
 		break;
 	case RM_BUILD:
 		aal_mess("Will build the Reiser4 SuperBlock.");
@@ -140,7 +140,7 @@
 		{"no-log", no_argument, NULL, 'n'},
 		{"auto", no_argument, NULL, 'a'},
 		{"force", no_argument, NULL, 'f'},
-		{"cashe", required_argument, 0, 'c'},
+		{"cache", required_argument, 0, 'c'},
 		{"override", required_argument, NULL, 'o'},
 		/* Fsck hidden options. */
 		{"passes-dump", required_argument, 0, 'U'},
@@ -570,7 +570,7 @@
 	/* Report about the results. */
 	if (res < 0 || ex == OPER_ERROR) {
 		ex = OPER_ERROR;
-		fprintf(stderr, "Operational error occured while fscking.\n");
+		fprintf(stderr, "Operational error occurred while fscking.\n");
 		goto free_fsck;
 	} 
 	
diff -burN reiser4progs-1.0.3/progs/measurefs/measurefs.c reiser4progs-1.0.3.patch/progs/measurefs/measurefs.c
--- reiser4progs-1.0.3/progs/measurefs/measurefs.c	2004-12-06 19:24:59.000000000 +0100
+++ reiser4progs-1.0.3.patch/progs/measurefs/measurefs.c	2005-02-09 21:46:59.000000000 +0100
@@ -102,7 +102,7 @@
 }
 
 /* Handler for region callback for an item. Its objective is to check if region
-   start is not next to current value. If so -- counting bad occurence. */
+   start is not next to current value. If so -- counting bad occurrence. */
 static errno_t tree_frag_process_item(uint64_t start, 
 				      uint64_t count, 
 				      void *data) 
@@ -119,11 +119,11 @@
 	/* Calculating delta with current value region end. */
 	delta = hint->curr - start;
 
-	/* Check if delat is more than one. If so -- bad occurence. */
+	/* Check if delta is more than one. If so -- bad occurrence. */
 	if (labs(delta) > 1)
 		hint->bad++;
 
-	/* Counting total regions and updating current blk, whci hwill be used
+	/* Counting total regions and updating current blk, which will be used
 	   for calculating next delta. */
 	hint->total += count;
 	hint->curr = start + count - 1;
@@ -133,7 +133,7 @@
 
 /* Traverse passed @node and calculate tree fragmentation for it. The results
    are stored in @frag_hint structure. This function is called from the tree
-   traversal routine for each internal node. See bellow for details. */
+   traversal routine for each internal node. See below for details. */
 static errno_t tree_frag_process_node(reiser4_node_t *node, void *data) {
 	pos_t pos;
 	static int bogus = 0;
@@ -153,7 +153,7 @@
 			return -EINVAL;
 		}
 
-		/* FIXME: touch eaery time. show once per second. */
+		/* FIXME: touch every time. show once per second. */
 		if (frag_hint->gauge && pos.item == 0 && bogus++ % 128 == 0)
 			aal_gauge_touch(frag_hint->gauge);
 		
@@ -177,7 +177,7 @@
 }
 
 /* Entry point for calculating tree fragmentation. It zeroes out all counters in
-   structure which wiil be passed to actual routines and calls tree_traverse
+   structure which will be passed to actual routines and calls tree_traverse
    function with couple of callbacks for handling all traverse cases (open node,
    traverse node, etc). Actual statistics collecting is performed in the passed
    callbacks and subcallbacks (for item traversing). */
@@ -341,7 +341,7 @@
 		stat_hint->branches_used /= (stat_hint->branches + 1);
 	}
 
-	/* Loop though all node items and calling item->layout() method in odrer
+	/* Loop through all node items and calling item->layout() method in order
 	   to calculate all blocks item references.*/
 	for (pos.item = 0; pos.item < reiser4_node_items(node);
 	     pos.item++)
@@ -357,7 +357,7 @@
 		}
 
 		/* Calculating item count. This probably should be done in more
-		   item type independant manner. */
+		   item type independent manner. */
 		stat_hint->items++;
 
 		switch (place.plug->id.group) {
@@ -471,7 +471,7 @@
 	printf("Item statistics:\n");
 	printf("  Total items:%*llu\n", 15, stat_hint.items);
 	printf("  Nodeptr items:%*llu\n", 13, stat_hint.nodeptrs);
-	printf("  Statadata items:%*llu\n", 11, stat_hint.statdatas);
+	printf("  Statdata items:%*llu\n", 11, stat_hint.statdatas);
 	printf("  Direntry items:%*llu\n", 12, stat_hint.direntries);
 	printf("  Tail items:%*llu\n", 16, stat_hint.tails);
 	printf("  Extent items:%*llu\n", 14, stat_hint.extents);
@@ -568,7 +568,7 @@
 	if (frag_hint->level > LEAF_LEVEL)
 		return 0;
 	
-	/* The loop though the all items in current node */
+	/* The loop through all the items in current node */
 	for (pos.item = 0; pos.item < reiser4_node_items(node);
 	     pos.item++)
 	{
@@ -586,7 +586,7 @@
 		if (!reiser4_item_statdata(&place))
 			continue;
 
-		/* Opening object by its stat data item denoded by @place */
+		/* Opening object by its stat data item denoted by @place */
 		if (!(object = reiser4_object_open(tree, NULL, &place)))
 			continue;
 
@@ -598,8 +598,8 @@
 		if (frag_hint->gauge && pos.item == 0)
 			aal_gauge_touch(frag_hint->gauge);
 
-		/* Calling calculating the file fragmentation by emans of using
-		   the function we have seen abowe. */
+		/* Calling calculating the file fragmentation by means of using
+		   the function we have seen above. */
 		if (reiser4_object_layout(object, file_frag_process_blk, data)) {
 			aal_error("Can't enumerate data blocks occupied by %s", 
 				  reiser4_print_inode(&object->ent->object));
diff -burN reiser4progs-1.0.3/TODO reiser4progs-1.0.3.patch/TODO
--- reiser4progs-1.0.3/TODO	2004-03-03 10:10:34.000000000 +0100
+++ reiser4progs-1.0.3.patch/TODO	2005-02-09 21:53:59.000000000 +0100
@@ -13,7 +13,7 @@
   directory in librepair. Move all repair code from libreiser4/plugin/*
   to librepair/plugin/*.
 
-* fix unalligned access on Itanium2.
+* fix unaligned access on Itanium2.
 
 * dumpfs utility.
 

--------------060805060807030706030702--
