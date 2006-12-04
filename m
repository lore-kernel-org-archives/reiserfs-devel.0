From: Joe Feise <jfeise@feise.com>
Subject: [PATCH]Make fsck.reiser4 really quiet
Date: Mon, 04 Dec 2006 00:16:08 -0800
Message-ID: <4573D948.6030302@feise.com>
Reply-To: jfeise@feise.com
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020206010006030702000708"
Return-path: <reiserfs-list-return-30297-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------020206010006030702000708
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Attached is a patch to make the -q switch to fsck.reiser4 *really* quiet.
It also removes the shouting style of all-caps text for the major fsck actions.
Diff'ed against reiser4progs 1.0.6.

Cheers,
-Joe


--------------020206010006030702000708
Content-Type: text/plain;
 name="reiser4progs-1.0.6.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4progs-1.0.6.diff"

Signed-off-by: J. Joe Feise <jfeise@feise.com>

diff -urN reiser4progs-1.0.6.orig/include/repair/repair.h reiser4progs-1.0.6/include/repair/repair.h
--- reiser4progs-1.0.6.orig/include/repair/repair.h	2006-11-01 06:50:34.000000000 -0800
+++ reiser4progs-1.0.6/include/repair/repair.h	2006-11-08 19:18:52.000000000 -0800
@@ -29,6 +29,7 @@
 	char *bitmap_file;
 	
 	uint32_t flags;
+	uint8_t quiet;
 } repair_data_t;
 
 extern errno_t repair_check(repair_data_t *repair);
diff -urN reiser4progs-1.0.6.orig/librepair/add_missing.c reiser4progs-1.0.6/librepair/add_missing.c
--- reiser4progs-1.0.6.orig/librepair/add_missing.c	2006-11-01 06:50:34.000000000 -0800
+++ reiser4progs-1.0.6/librepair/add_missing.c	2006-11-08 19:18:52.000000000 -0800
@@ -297,7 +297,7 @@
 	aal_assert("vpf-848", am->bm_twig != NULL);
 	aal_assert("vpf-849", am->bm_leaf != NULL);
 	
-	aal_mess("INSERTING UNCONNECTED NODES");
+	aal_mess("Inserting unconnected nodes");
 	am->gauge = aal_gauge_create(aux_gauge_handlers[GT_PROGRESS], 
 				     NULL, NULL, 500, NULL);
 	time(&am->stat.time);
@@ -358,7 +358,8 @@
 	}
 	
 	aal_gauge_free(am->gauge);
-	repair_add_missing_update(am);
+	if (!am->repair->quiet)
+		repair_add_missing_update(am);
 	reiser4_fs_sync(am->repair->fs);
 	
 	return 0;
diff -urN reiser4progs-1.0.6.orig/librepair/cleanup.c reiser4progs-1.0.6/librepair/cleanup.c
--- reiser4progs-1.0.6.orig/librepair/cleanup.c	2006-11-01 06:50:34.000000000 -0800
+++ reiser4progs-1.0.6/librepair/cleanup.c	2006-11-08 19:19:37.000000000 -0800
@@ -143,7 +143,7 @@
 		return 0;
 	}
 	
-	aal_mess("CLEANING UP THE STORAGE TREE");
+	aal_mess("Cleaning up the storage tree");
 	cleanup->gauge = aal_gauge_create(aux_gauge_handlers[GT_PROGRESS],
 					  cb_gauge_tree_percent, NULL, 500, NULL);
 	aal_gauge_set_value(cleanup->gauge, 0);
@@ -158,7 +158,8 @@
 
 	aal_gauge_done(cleanup->gauge);
 	aal_gauge_free(cleanup->gauge);
-	repair_cleanup_update(cleanup);
+	if (!cleanup->repair->quiet)
+		repair_cleanup_update(cleanup);
 	reiser4_fs_sync(cleanup->repair->fs);
 	
 	return 0;
diff -urN reiser4progs-1.0.6.orig/librepair/disk_scan.c reiser4progs-1.0.6/librepair/disk_scan.c
--- reiser4progs-1.0.6.orig/librepair/disk_scan.c	2006-11-01 06:50:34.000000000 -0800
+++ reiser4progs-1.0.6/librepair/disk_scan.c	2006-11-08 19:18:53.000000000 -0800
@@ -79,7 +79,7 @@
 	aal_assert("vpf-820", ds->bm_scan != NULL);
 	aal_assert("vpf-820", ds->bm_met != NULL);    
 	
-	aal_mess("LOOKING FOR UNCONNECTED NODES");
+	aal_mess("Looking for unconnected nodes");
 	gauge = aal_gauge_create(aux_gauge_handlers[GT_PROGRESS], 
 				 NULL, NULL, 500, NULL);
 	aal_gauge_touch(gauge);
@@ -161,6 +161,7 @@
  error:
 	aal_gauge_done(gauge);
 	aal_gauge_free(gauge);
-	repair_disk_scan_update(ds);
+	if (!ds->repair->quiet)
+		repair_disk_scan_update(ds);
 	return res;
 }
diff -urN reiser4progs-1.0.6.orig/librepair/filter.c reiser4progs-1.0.6/librepair/filter.c
--- reiser4progs-1.0.6.orig/librepair/filter.c	2006-11-01 06:50:34.000000000 -0800
+++ reiser4progs-1.0.6/librepair/filter.c	2006-11-08 19:20:14.000000000 -0800
@@ -659,7 +659,7 @@
 	aal_assert("vpf-816", fd->repair->fs->tree != NULL);
 	aal_assert("vpf-815", fd->bm_used != NULL);
 
-	aal_mess("CHECKING THE STORAGE TREE");
+	aal_mess("Checking the storage tree");
 	fd->gauge = aal_gauge_create(aux_gauge_handlers[GT_PROGRESS], 
 				     cb_gauge_tree_percent, NULL, 500, NULL);
 	time(&fd->stat.time);
@@ -667,7 +667,8 @@
 	res = repair_filter_traverse(fd);
 	
 	aal_gauge_free(fd->gauge);
-	repair_filter_update(fd);
+	if (!fd->repair->quiet)
+		repair_filter_update(fd);
 	
 	if (!res && fd->repair->mode != RM_CHECK)
 		reiser4_fs_sync(fd->repair->fs);
diff -urN reiser4progs-1.0.6.orig/librepair/repair.c reiser4progs-1.0.6/librepair/repair.c
--- reiser4progs-1.0.6.orig/librepair/repair.c	2006-11-01 06:50:34.000000000 -0800
+++ reiser4progs-1.0.6/librepair/repair.c	2006-11-08 19:18:53.000000000 -0800
@@ -747,7 +747,7 @@
 	/* Scan the storage reiser4 tree. Cut broken parts out. */
 	if ((res = repair_filter_prepare(&control, &filter)))
 		goto error;
-	
+
 	if ((res = repair_filter(&filter)))
 		goto error;
 	
diff -urN reiser4progs-1.0.6.orig/librepair/semantic.c reiser4progs-1.0.6/librepair/semantic.c
--- reiser4progs-1.0.6.orig/librepair/semantic.c	2006-11-01 06:50:34.000000000 -0800
+++ reiser4progs-1.0.6/librepair/semantic.c	2006-11-08 19:20:44.000000000 -0800
@@ -816,7 +816,7 @@
 	if ((res = reiser4_tree_load_root(tree)))
 		goto error;
 
-	aal_mess("CHECKING THE SEMANTIC TREE");
+	aal_mess("Checking the semantic tree");
 	sem->gauge = aal_gauge_create(aux_gauge_handlers[GT_PROGRESS], 
 				      NULL, NULL, 500, NULL);
 	aal_gauge_set_value(sem->gauge, 0);
@@ -870,7 +870,8 @@
  error_update:
 	aal_gauge_done(sem->gauge);
 	aal_gauge_free(sem->gauge);
-	repair_semantic_update(sem);	
+	if (!sem->repair->quiet)
+		repair_semantic_update(sem);	
 	
  error:
 	if ((res >= 0) && sem->repair->mode != RM_CHECK)
diff -urN reiser4progs-1.0.6.orig/librepair/twig_scan.c reiser4progs-1.0.6/librepair/twig_scan.c
--- reiser4progs-1.0.6.orig/librepair/twig_scan.c	2006-11-01 06:50:34.000000000 -0800
+++ reiser4progs-1.0.6/librepair/twig_scan.c	2006-11-08 19:18:53.000000000 -0800
@@ -136,7 +136,7 @@
 	aal_assert("vpf-534", ts->repair != NULL);
 	aal_assert("vpf-845", ts->repair->fs != NULL);
 	
-	aal_mess("CHECKING EXTENT REGIONS.");
+	aal_mess("Checking extent regions");
 	gauge = aal_gauge_create(aux_gauge_handlers[GT_PROGRESS], 
 				 NULL, NULL, 500, NULL);
 	aal_gauge_touch(gauge);
@@ -175,7 +175,8 @@
 	aal_gauge_done(gauge);
 	aal_gauge_free(gauge);
 	
-	repair_twig_scan_update(ts);
+	if (!ts->repair->quiet)
+		repair_twig_scan_update(ts);
 
 	if (ts->repair->mode != RM_CHECK)
 		reiser4_fs_sync(ts->repair->fs);
diff -urN reiser4progs-1.0.6.orig/progs/fsck/fsck.c reiser4progs-1.0.6/progs/fsck/fsck.c
--- reiser4progs-1.0.6.orig/progs/fsck/fsck.c	2006-11-01 06:50:34.000000000 -0800
+++ reiser4progs-1.0.6/progs/fsck/fsck.c	2006-11-08 19:22:04.000000000 -0800
@@ -9,6 +9,8 @@
 
 #include <fsck.h>
 
+static int quiet = 0;
+
 #define fsck_opt(parse, flag) aal_test_bit(&(parse)->options, flag)
 
 static void fsck_print_usage(char *name) {
@@ -48,43 +50,47 @@
 "*******************************************************************\n"
 
 static errno_t fsck_ask_confirmation(fsck_parse_t *data, char *host_name) {
-	fprintf(stderr, WARNING "\n");
+	if (!quiet)
+		fprintf(stderr, WARNING "\n");
 	aal_mess("Fscking the %s block device.", host_name);
 	
-	switch (data->sb_mode) {
-	case RM_CHECK:
-		aal_mess("Will check the consistency of "
-			 "the Reiser4 SuperBlock.");
-		break;
-	case RM_FIX:
-		aal_mess("Will fix minor corruptions of "
-			 "the Reiser4 SuperBlock.");
-		break;
-	case RM_BUILD:
-		aal_mess("Will build the Reiser4 SuperBlock.");
-		break;
-	default:
-		break;
-	}
-	
-	switch (data->fs_mode) {
-	case RM_CHECK:
-		aal_mess("Will check the consistency of "
-			 "the Reiser4 FileSystem.");
-		break;
-	case RM_FIX:
-		aal_mess("Will fix minor corruptions of "
-			 "the Reiser4 FileSystem.");
-		break;
-	case RM_BUILD:
-		aal_mess("Will build the Reiser4 FileSystem.");
-		break;
-	case RM_BACK:
-		aal_mess("Will rollback changes saved in '%s' back "
-			"onto (%s).", data->backup_file, host_name);
-		break;
-	default:
-		break;
+	if (!quiet)
+	{
+		switch (data->sb_mode) {
+		case RM_CHECK:
+			aal_mess("Will check the consistency of "
+			 	"the Reiser4 SuperBlock.");
+			break;
+		case RM_FIX:
+			aal_mess("Will fix minor corruptions of "
+			 	"the Reiser4 SuperBlock.");
+			break;
+		case RM_BUILD:
+			aal_mess("Will build the Reiser4 SuperBlock.");
+			break;
+		default:
+			break;
+		}
+	
+		switch (data->fs_mode) {
+		case RM_CHECK:
+			aal_mess("Will check the consistency of "
+			 	"the Reiser4 FileSystem.");
+			break;
+		case RM_FIX:
+			aal_mess("Will fix minor corruptions of "
+			 	"the Reiser4 FileSystem.");
+			break;
+		case RM_BUILD:
+			aal_mess("Will build the Reiser4 FileSystem.");
+			break;
+		case RM_BACK:
+			aal_mess("Will rollback changes saved in '%s' back "
+				"onto (%s).", data->backup_file, host_name);
+			break;
+		default:
+			break;
+		}
 	}
 	
 	if (!fsck_opt(data, FSCK_OPT_YES)) {
@@ -202,6 +208,7 @@
 			goto user_error;
 		case 'q':
 			aux_gauge_set_handler(NULL, GT_PROGRESS);
+			quiet = 1;
 			break;
 		case 'y':
 			aal_set_bit(&data->options, FSCK_OPT_YES);
@@ -429,20 +436,19 @@
 	
 	repair->fs->tree->mpc_func = misc_mpressure_detect;
 	
-	aal_stream_init(&stream, NULL, &memory_stream);
-	
-	repair_master_print(repair->fs->master, &stream, 
-			    misc_uuid_unparse);
-	
-	aal_stream_format(&stream, "\n");
-	
-	repair_format_print(repair->fs->format, &stream);
-	aal_stream_format(&stream, "\n");
-	
-	aal_mess("Reiser4 fs was detected on %s.\n%s",
-		repair->fs->device->name, (char *)stream.entity);
-	
-	aal_stream_fini(&stream);
+	aal_mess("Reiser4 fs was detected on %s.",
+		repair->fs->device->name);
+	if (!quiet)
+	{
+		aal_stream_init(&stream, NULL, &memory_stream);
+		repair_master_print(repair->fs->master, &stream, 
+			    	misc_uuid_unparse);
+		aal_stream_format(&stream, "\n");
+		repair_format_print(repair->fs->format, &stream);
+		aal_stream_format(&stream, "\n");
+		aal_mess("\n%s", (char *)stream.entity);
+		aal_stream_fini(&stream);
+	}	
 	
 	/* Initialize the backup. */
 	len = reiser4_format_get_len(repair->fs->format);
@@ -553,6 +559,7 @@
 		fsck_opt(&parse_data, FSCK_OPT_YES) << REPAIR_YES;
 		
 	repair.bitmap_file = parse_data.bitmap_file;
+	repair.quiet = quiet;
 	
 	res = fsck_check_init(&repair, device, parse_data.backup, 
 			      parse_data.sb_mode, parse_data.fs_mode);
@@ -570,10 +577,8 @@
 	
 	fsck_time("fsck.reiser4 finished at");
     
-	fprintf(stderr, "Closing fs...");
 	reiser4_fs_close(repair.fs);
 	repair.fs = NULL;
-	fprintf(stderr, "done\n");
     
  free_libreiser4:
 	libreiser4_fini();
@@ -581,15 +586,13 @@
  free_device:
 	if (device) {
 		if (aal_device_sync(device)) {
-			aal_fatal("Cannot synchronize file \"%s\"", 
+			aal_fatal("Cannot synchronize file \"%s\"\n", 
 				  device->name);
 			ex = OPER_ERROR;
 		}
 		aal_device_close(device);
 	}
 	
-	fprintf(stderr, "\n");
-	
 	/* Report about the results. */
 	if (res < 0 || ex == OPER_ERROR) {
 		ex = OPER_ERROR;

--------------020206010006030702000708--

