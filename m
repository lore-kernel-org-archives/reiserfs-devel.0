From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 assertion failure
Date: Thu, 25 Dec 2003 14:24:49 +0300
Message-ID: <200312251419.46746.vitaly@namesys.com>
References: <3FEB12DB.30703@i51.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_Bks6/8S0KmpR1vP"
Return-path: <reiserfs-list-return-16399-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FEB12DB.30703@i51.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Dorin Popa <dp@i51.org>, reiserfs-list@namesys.com

--Boundary-00=_Bks6/8S0KmpR1vP
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello, Dorin, 

On Thursday 25 December 2003 19:39, Dorin Popa wrote:
> Hi,
>
> I use reiser4progs 0.4.20 with repair_fs_open.patch (I had the same
> problem as David Masover, but the patch fixed it). It seems that
> fsck.reiser4 encounters some internal error condition. Please see the
> fsck.reiser4 output in the attached file.

yes, I have fixed this bug yesterday. The patch attached includes 
the previous patch with all other important fixes for fsck.reiser4 
against 0.4.20.

Thank you for the report anyway,
Vitaly Fertman







--Boundary-00=_Bks6/8S0KmpR1vP
Content-Type: text/x-diff;
  charset="koi8-r";
  name="reiser4progs-0.4.20-fixes-25.12.03.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="reiser4progs-0.4.20-fixes-25.12.03.patch"

diff -Nru a/librepair/filesystem.c b/librepair/filesystem.c
--- a/librepair/filesystem.c	Thu Dec 25 13:54:48 2003
+++ b/librepair/filesystem.c	Thu Dec 25 13:54:48 2003
@@ -48,11 +48,36 @@
 		goto error_format_close;
 	}
 	
+	len = reiser4_format_get_len(repair->fs->format);
+
+	/* Block and oid allocator plugins are specified by format plugin 
+	 * unambiguously, so there is nothing to be checked here anymore. */
+	if (!(repair->fs->alloc = reiser4_alloc_open(repair->fs, len))) {
+		aal_fatal("Failed to open a block allocator.");
+		res = -EINVAL;
+		goto error_status_close;
+	}
+	
+	if ((error = reiser4_alloc_valid(repair->fs->alloc)) < 0)
+		goto error_alloc_close;
+	
+	if (error && repair->mode != RM_CHECK) {
+		aal_mess("Checksums will be fixed later.\n");
+	} else {
+		res |= error;
+	}
+	
+	if (!(repair->fs->oid = reiser4_oid_open(repair->fs))) {	
+		aal_fatal("Failed to open an object id allocator.");
+		res = -EINVAL;
+		goto error_alloc_close;
+	}
+
 	res |= repair_journal_open(repair->fs, journal_device, repair->mode);
 	
 	if (repair_error_fatal(res)) {
 		aal_fatal("Failed to open the journal.");
-		goto error_status_close;
+		goto error_oid_close;
 	}
 	
 	res |= repair_journal_replay(repair->fs->journal, repair->fs->device);
@@ -69,48 +94,25 @@
 			  "replaying.");
 		goto error_journal_close;
 	}
-
-	len = reiser4_format_get_len(repair->fs->format);
-
-	/* Block and oid allocator plugins are specified by format plugin 
-	 * unambiguously, so there is nothing to be checked here anymore. */
-	if (!(repair->fs->alloc = reiser4_alloc_open(repair->fs, len))) {
-		aal_fatal("Failed to open a block allocator.");
-		res = -EINVAL;
-		goto error_journal_close;
-	}
 	
-	if ((res |= error = reiser4_alloc_valid(repair->fs->alloc)) < 0)
-		goto error_alloc_close;
-	
-	if (error && repair->mode != RM_CHECK)
-		aal_mess("Checksums will be fixed later.\n");
-		
-	if (!(repair->fs->oid = reiser4_oid_open(repair->fs))) {	
-		aal_fatal("Failed to open an object id allocator.");
-		res = -EINVAL;
-		goto error_alloc_close;
-	}
-
 	if (!(repair->fs->tree = reiser4_tree_init(repair->fs))) {
 		res = -ENOMEM;
-		goto error_oid_close;
+		goto error_journal_close;
 	}
 		
-	
 	repair_error_count(repair, res);
 	return 0;
 
+error_journal_close:
+	reiser4_journal_close(repair->fs->journal);
+	repair->fs->journal = NULL;
+
  error_oid_close:
 	reiser4_tree_fini(repair->fs->tree);
 	
  error_alloc_close:
 	reiser4_alloc_close(repair->fs->alloc);
 	repair->fs->alloc = NULL;
-    
- error_journal_close:
-	reiser4_journal_close(repair->fs->journal);
-	repair->fs->journal = NULL;
 
  error_status_close:
 	reiser4_status_close(repair->fs->status);
diff -Nru a/librepair/item.c b/librepair/item.c
--- a/librepair/item.c	Thu Dec 25 13:54:48 2003
+++ b/librepair/item.c	Thu Dec 25 13:54:48 2003
@@ -81,7 +81,6 @@
 	
 	aal_assert("vpf-795", mode != RM_CHECK || 
 			      length == place->len);
-	aal_assert("vpf-796", length == place->len || res);
 	
 	return repair_item_check_fini(place, res, length);
 }
diff -Nru a/plugin/item/extent40/extent40_repair.c b/plugin/item/extent40/extent40_repair.c
--- a/plugin/item/extent40/extent40_repair.c	Thu Dec 25 13:54:48 2003
+++ b/plugin/item/extent40/extent40_repair.c	Thu Dec 25 13:54:48 2003
@@ -21,7 +21,7 @@
 	ET40_TAIL	= 1 << 4
 } merge_flag_t;
 
-static int extent40_merge_units(reiser4_place_t *place) {
+static int extent40_merge_units(reiser4_place_t *place, int fix) {
 	uint32_t i, count, merged;
 	extent40_t *extent;
 
@@ -38,11 +38,14 @@
 			et40_set_width(extent - 1, et40_get_width(extent - 1)
 				       + et40_get_width(extent));
 
-			extent40_shrink(place, i, 1);
-			count--;
 			merged++;
-			extent--;
-			i--;
+			
+			if (fix) {
+				extent40_shrink(place, i, 1);
+				count--;
+				extent--;
+				i--;
+			}
 		}
 	}
 
@@ -93,7 +96,7 @@
 			result = RE_FIXABLE;
 	}
 	
-	units = extent40_merge_units(place);
+	units = extent40_merge_units(place, mode != RM_CHECK);
 	
 	if (units) {
 		aal_error("Node (%llu), item (%u): %u mergable units were "
@@ -168,7 +171,7 @@
 			res |= RE_FIXABLE;
 	}
 	
-	units = extent40_merge_units(place);
+	units = extent40_merge_units(place, mode != RM_CHECK);
 
 	if (units) {
 		aal_error("Node (%llu), item (%u): %u mergable units were "
@@ -441,7 +444,7 @@
 	}
 	
 	/* Join mergable units within the @place. */
-	hint->len = extent40_merge_units(place) * sizeof(extent40_t);
+	hint->len = extent40_merge_units(place, 1) * sizeof(extent40_t);
 	
 	place_mkdirty(place);
 	

--Boundary-00=_Bks6/8S0KmpR1vP--

