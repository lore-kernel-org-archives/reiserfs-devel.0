From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: patch [1/4] reiser4progs: ccreg40_check_cluster fixup
Date: Fri, 09 Jan 2009 03:16:06 +0300
Message-ID: <49669746.1020306@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070007060608050806000904"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------070007060608050806000904
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit




--------------070007060608050806000904
Content-Type: text/x-patch;
 name="reiser4progs-ccreg_check_cluster_fixup.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="reiser4progs-ccreg_check_cluster_fixup.patch"

Fixed bugs in fsck:
. incorrect handling of corrupted compressed
  bodies, reported by Mathieu B������langer<b747xx@gmail.com>
. use LE32_TO_CPU when reading adler32 checksum of logical
  clusters of ccreg40 objects.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 reiser4progs-1.0.6-orig/plugin/object/ccreg40/ccreg40_repair.c |  161 ++++------
 1 file changed, 77 insertions(+), 84 deletions(-)

--- reiser4progs-1.0.6-orig/plugin/object/ccreg40/ccreg40_repair.c.orig
+++ reiser4progs-1.0.6-orig/plugin/object/ccreg40/ccreg40_repair.c
@@ -21,9 +21,10 @@ typedef struct ccreg40_hint {
 	obj40_stat_hint_t stat;
 
 	/* Item seek, found and next item offsets. */
-	uint64_t seek;
-	uint64_t found;
-	uint64_t maxreal;
+	uint64_t prev_found; /* (key) offset found in the previous iteration */
+	uint64_t seek;       /* expected offset for lookup */
+	uint64_t found;      /* what has been really found */
+	uint64_t maxreal;    /* maximal (key) offset in the found item */
 
 	/* Bytes all clusters takes on disk. */
 	uint32_t bytes;
@@ -120,91 +121,64 @@ static int64_t ccreg40_read_item(reiser4
 }
 
 static errno_t ccreg40_check_crc(ccreg40_hint_t *hint) {
-	uint32_t adler, disk;
-	uint64_t offset;
-	
-	offset = (hint->seek % hint->clsize) - sizeof(uint32_t);
-	
+	uint32_t adler, disk, offset;
+
+	aal_assert("edward-2", hint->bytes > sizeof(uint32_t));
+
+	offset = hint->bytes - sizeof(uint32_t);
+
 	adler = aux_adler32(0, (char *)hint->data, offset);
-	disk = *(uint32_t *)(hint->data + offset);
-	
-	return adler == disk ? 0 : RE_FATAL;
-}
+	disk = LE32_TO_CPU(*(uint32_t *)(hint->data + offset));
 
-static errno_t cc_write_item(reiser4_place_t *place, void *data) {
-	return ccreg40_set_cluster_size(place, *(uint32_t *)data);
+	return adler == disk ? 0 : RE_FATAL;
 }
 
 static errno_t ccreg40_check_cluster(reiser4_object_t *cc, 
 				     ccreg40_hint_t *hint,
 				     uint8_t mode) 
 {
-	trans_hint_t trans;
-	uint64_t offset;
 	errno_t result;
 	errno_t res;
 	int start;
-	int last;
-	
+	uint32_t lcl_size;
+
 	result = 0;
-	start = (ccreg40_clstart(hint->seek, hint->clsize) == hint->seek);
-	last = (hint->sdsize == hint->seek);
-	
-	if ((cc->body.plug == NULL) || (hint->seek && start) || 
-	    !ccreg40_clsame(hint->seek, hint->found, hint->clsize))
-	{
-		/* Cluster is over. */
-		if (start || (last && !cc->body.plug)) {
-			/* The previous cluster is not compressed:
-			   1) there were @hint->clsize bytes in it;
-			   2) file size is reached and no more items found. */
-			uint64_t clstart, clsize;
+	/* true, if the found item is the
+	   first one in the disk cluster */
+	start = (ccreg40_clstart(hint->found, hint->clsize) == hint->found);
+
+	if ((cc->body.plug == NULL) ||
+	    (hint->seek && start) ||
+	    !ccreg40_clsame(hint->prev_found, hint->found, hint->clsize)) {
+		/* Cluster is over */
 
-			clstart = ccreg40_clstart(hint->seek, hint->clsize);
-			clstart -= (start ? hint->clsize : 0);
-			
-			clsize = (start ? hint->clsize : hint->sdsize - clstart);
-			
-			/* If there is a hole in the previous cluster, 
-			   overwrite it. */
-			if (hint->hole) {
-				fsck_mess("The file [%s] (%s): the not-compressed "
-					  "cluster at [%llu] offset has some items "
-					  "missed.%s", 
-					  print_inode(obj40_core, &cc->info.object),
-					  reiser4_psobj(cc)->p.label, hint->clstart,
-					  hint->mode != RM_CHECK ? " Filled with "
-					  "zeroes." : "");
-			
-				if (hint->mode == RM_BUILD) {
-					res = obj40_write(cc, &trans, 
-							  hint->data,
-							  clstart, clsize, 
-							  reiser4_psctail(cc), 
-							  cc_write_item, 
-							  &hint->clsize);
-					if (res < 0) return res;
-					
-					hint->bytes += trans.bytes;
-				} else if (hint->hole) {
-					result = RE_FATAL;
-				}
-			}
-		} else if (hint->hole || ccreg40_check_crc(hint)) {
-			/* 1. There is a hole at the end of the cluster &&
-			   2. Not the last cluster or sdsize is not equal to 
-			      the real amount of bytes. 
-			 
-			   There are holes in the middle of the cluster or 
-			   checksum does not match. Delete the whole cluster. */
-			
+		if (hint->prev_found > hint->sdsize) {
+			/* cluster is orphan */
 			hint->bytes = 0;
 			result = RE_FATAL;
-			
-			/* Start offset of the cluster to be deleted. */
-			hint->clstart = ccreg40_clstart(hint->seek, 
+
+			/* set offset of the cluster to be deleted. */
+			hint->clstart = ccreg40_clstart(hint->prev_found,
+							hint->clsize);
+			fsck_mess("The file [%s] (%s): the cluster at [%llu] "
+				  "offset %u bytes long is orphan.%s",
+				  print_inode(obj40_core, &cc->info.object),
+				  reiser4_psobj(cc)->p.label, hint->clstart,
+				  hint->clsize, hint->mode != RM_CHECK ?
+				  " Removed." : "");
+		}
+		/**
+		 * If there still is a hole in the logical cluster,
+		 * then check a checksum (no hole means no checksum)
+		 */
+		else if (hint->hole && ccreg40_check_crc(hint)) {
+			/* wrong checksum */
+			hint->bytes = 0;
+			result = RE_FATAL;
+
+			/* set offset of the cluster to be deleted. */
+			hint->clstart = ccreg40_clstart(hint->prev_found,
 							hint->clsize);
-			
 			fsck_mess("The file [%s] (%s): the cluster at [%llu] "
 				  "offset %u bytes long is corrupted.%s",
 				  print_inode(obj40_core, &cc->info.object),
@@ -212,32 +186,40 @@ static errno_t ccreg40_check_cluster(rei
 				  hint->clsize, hint->mode != RM_CHECK ? 
 				  " Removed." : "");
 		}
-		
 		/* Fini all the data related to the previous cluster. */
 		hint->stat.bytes += hint->bytes;
 		hint->bytes = 0;
 		hint->adler = 0;
-		hint->hole = 0;
-		
+
 		if (!cc->body.plug)
 			return result;
-		
+
 		/* Update the cluster data. */
 		aal_memset(hint->data, 0, hint->clsize);
 	}
 	
 	/* An item found. */
-	offset = ccreg40_clstart(hint->found, hint->clsize);
-	offset = offset >= hint->seek ? offset : hint->seek;
-	
-	/* A hole b/w items or in the beginning found. */
-	if (hint->found - offset)
-		hint->hole = 1;
-	
+	aal_assert("edward-1",
+		   ccreg40_clstart(hint->found, hint->clsize) ==
+		   ccreg40_clstart(hint->maxreal, hint->clsize));
+
 	if ((res = ccreg40_read_item(&cc->body, hint)))
 		return res;
-	
+
+	hint->prev_found = hint->found;
 	hint->bytes += objcall(&cc->body, object->bytes);
+	/**
+	 * Calculate a size of logical cluster
+	 * and figure out, if there is a hole
+	 * for the found items in the logical cluster.
+	 */
+	lcl_size = 0;
+	if (ccreg40_clsame(hint->found, hint->sdsize - 1, hint->clsize))
+		lcl_size = hint->sdsize % hint->clsize;
+	if (lcl_size == 0)
+		lcl_size = hint->clsize;
+	hint->hole = (hint->bytes != lcl_size);
+
 	return result;
 }
 
@@ -331,3 +313,14 @@ errno_t ccreg40_check_struct(reiser4_obj
 }
 
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

--------------070007060608050806000904--
