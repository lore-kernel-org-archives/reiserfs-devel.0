From: Joachim Wagner <jwagner@computing.dcu.ie>
Subject: fsck option --lost-and-found
Date: Wed, 27 Dec 2006 18:16:54 +0100
Message-ID: <200612271816.54908.jwagner@computing.dcu.ie>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_GqqkFG7THq4sL8n"
Return-path: <reiserfs-list-return-30345-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_GqqkFG7THq4sL8n
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi!

The attached patch extends reiserfsck to read the name of the lost+found 
directory from the command line option --lost-and-found. I regard it as a 
"trivial improvement" for the purpose of licencing as described in the 
reiserfsprogs README.

Motivation: Due to some problems with my external USB drive, I had to run 
reiserfsck --rebuild-tree -S. Unfortunately, I deleted the directory 
"lost+found" a while ago and reiserfsck 3.6.18 aborted in line 348 of 
lost+found.c. Afterwards, it wasn't possible to mount the fs in order to 
create the directory. I downloaded the 3.6.19 source, replaced all 
occurrences of the constant string "lost+found" with an existing directory 
and then could finish the filesystem check (recovering many files).

The patched version passed the attached test script.

I also ran the same test with an additional dd if=/dev/urandom bs=1024k 
count=320 >> /temp.img between the other two dd commands. The immediate mount 
produced an error message, but reiserfsck still worked fine. However, running 
it a second time with a different lost+found directory name (home), I got 
many new errors in pass0 (mostly wrong order of items), all numbered files 
from /etc (lost+found of 1st run) disappeared and many numbered files 
appeared in /home. Running it a 2nd time, there are still some errors. Does 
this mean
 * that there is a fundamental problem with changing the
    lost+found directory name or
 * that a successfull reiserfsck run does not guarantee a
    consistent filesystem or
 * is this just an artifact of the -S option?

Happy New Year!
Joachim

--Boundary-00=_GqqkFG7THq4sL8n
Content-Type: text/x-diff;
  charset="us-ascii";
  name="lostfound.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="lostfound.patch"

diff -U 3 -r reiserfsprogs-3.6.19-orig/fsck/fsck.h reiserfsprogs-3.6.19/fsck/fsck.h
--- reiserfsprogs-3.6.19-orig/fsck/fsck.h	2004-10-01 14:03:43.000000000 +0200
+++ reiserfsprogs-3.6.19/fsck/fsck.h	2006-12-27 12:41:32.000000000 +0100
@@ -406,6 +406,7 @@
     struct check_info check;
 
     char * journal_dev_name; 
+    char * lost_found_name;
     /* log file name and handle */
     char * log_file_name;
     FILE * log;
diff -U 3 -r reiserfsprogs-3.6.19-orig/fsck/lost+found.c reiserfsprogs-3.6.19/fsck/lost+found.c
--- reiserfsprogs-3.6.19-orig/fsck/lost+found.c	2004-09-16 09:17:27.000000000 +0200
+++ reiserfsprogs-3.6.19/fsck/lost+found.c	2006-12-27 12:39:24.000000000 +0100
@@ -341,16 +341,17 @@
 
     /* update /lost+found sd_size and sd_blocks (nlink is correct already) */
 
-    objectid = reiserfs_find_entry (fs, &root_dir_key, "lost+found",
+    objectid = reiserfs_find_entry (fs, &root_dir_key, fsck_data(fs)->lost_found_name,
                                        &gen_counter, &lost_found_dir_key);
 
     if (!objectid) {
-       reiserfs_panic ("look_for_lost: The entry 'lost+found' could not be found in the root directory.");
+       reiserfs_panic ("look_for_lost: The entry '%s' could not be found in the root directory.",
+			fsck_data(fs)->lost_found_name);
     }
 
     if (reiserfs_search_by_key_4 (fs, &lost_found_dir_key, &path) != ITEM_FOUND)
-	reiserfs_panic ("look_for_lost: The StatData of the 'lost+found' directory %K could not be found",
-			&lost_found_dir_key);
+	reiserfs_panic ("look_for_lost: The StatData of the '%s' directory %K could not be found",
+			fsck_data(fs)->lost_found_name, &lost_found_dir_key);
     ih = get_ih (&path);
     sd = get_item (&path);
     get_sd_size (ih, sd, &sd_size);
diff -U 3 -r reiserfsprogs-3.6.19-orig/fsck/main.c reiserfsprogs-3.6.19/fsck/main.c
--- reiserfsprogs-3.6.19-orig/fsck/main.c	2004-10-07 16:04:08.000000000 +0200
+++ reiserfsprogs-3.6.19/fsck/main.c	2006-12-27 13:54:13.000000000 +0100
@@ -16,6 +16,8 @@
 reiserfs_filsys_t * fs;
 char * badblocks_file;
 
+#define LOST_FOUND_DEFAULT "lost+found"
+
 #define print_usage_and_exit() {						\
 fsck_progress ("Usage: %s [mode] [options] "					\
 " device\n"									\
@@ -42,6 +44,7 @@
 "  -f and -r\t\t\tignored\n"							\
 "Expert options:\n"								\
 "  --no-journal-available\tdo not open nor replay journal\n"			\
+"  -L | --lost-and-found directory\tname of the " LOST_FOUND_DEFAULT " directory\n"	\
 "  -S | --scan-whole-partition\tbuild tree of all blocks of the device\n\n",	\
   argv[0]);									\
 										\
@@ -99,6 +102,7 @@
 	    /* options */
 	    {"logfile", required_argument, 0, 'l'},
 	    {"badblocks", required_argument, 0, 'B'},
+	    {"lost-and-found", required_argument, 0, 'L'},
 	    {"interactive", no_argument, 0, 'i'},
 	    {"adjust-size", no_argument, 0, 'z'},
 	    {"quiet", no_argument, 0, 'q'},
@@ -131,7 +135,7 @@
 	};
 	int option_index;
       
-	c = getopt_long (argc, argv, "iql:nb:Szd:R:h:j:gafVrpyt:B:",
+	c = getopt_long (argc, argv, "iql:nb:Szd:R:h:j:gafVrpyt:B:L:",
 			 options, &option_index);
 	if (c == -1)
 	    break;
@@ -167,6 +171,10 @@
 		    optarg, strerror(errno));	    
 	    break;
 
+	case 'L': /* name of lost+found directory */
+	    asprintf (&data->lost_found_name, "%s", optarg);
+	    break;
+
 	case 'n': /* --nolog */
 	    data->options |= OPT_SILENT;
 	    break;
@@ -1217,6 +1225,7 @@
     }
 
     data = getmem (sizeof (struct fsck_data));
+    data->lost_found_name = LOST_FOUND_DEFAULT;
 
     file_name = parse_options (data, argc, argv);
 
diff -U 3 -r reiserfsprogs-3.6.19-orig/fsck/reiserfsck.8 reiserfsprogs-3.6.19/fsck/reiserfsck.8
--- reiserfsprogs-3.6.19-orig/fsck/reiserfsck.8	2004-10-13 14:53:30.000000000 +0200
+++ reiserfsprogs-3.6.19/fsck/reiserfsck.8	2006-12-27 14:10:05.000000000 +0100
@@ -15,6 +15,7 @@
 [ \fB-n\fR | \fB--nolog\fR ]
 [ \fB-B\fR | \fB--badblocks \fIfile\fR ]
 [ \fB-l\fR | \fB--logfile \fIfile\fR ]
+[ \fB-L\fR | \fB--lost-and-found \fIdirectory-name\fR ]
 [ \fB-q\fR | \fB--quiet\fR ]
 [ \fB-y\fR | \fB--yes\fR ]
 .\" [ \fB-b\fR | \fB--scan-marked-in-bitmap \fIbitmap-filename\fR ]
@@ -101,6 +102,14 @@
 This option causes \fBreiserfsck\fR to report any corruption it finds 
 to the specified log file rather than to stderr.
 .TP
+\fB--lost-and-found \fIdirectory-name\fR, \fB-L \fI directory-name\fR
+This option sets the name of the directory to store lost and found
+items (files, directories, etc.). Default is 'lost+found'. 
+Normally, \fBreiserfsck\fR will create the directory if it does not
+exist.
+If it fails, you may have luck with a different (existing) top-level
+directory, for example a login name in case of a /home filesystem.
+.TP
 .B --nolog, -n
 This option prevents \fBreiserfsck\fR from reporting any kinds of corruption.
 .TP
diff -U 3 -r reiserfsprogs-3.6.19-orig/fsck/semantic_rebuild.c reiserfsprogs-3.6.19/fsck/semantic_rebuild.c
--- reiserfsprogs-3.6.19-orig/fsck/semantic_rebuild.c	2004-09-15 15:54:22.000000000 +0200
+++ reiserfsprogs-3.6.19/fsck/semantic_rebuild.c	2006-12-27 12:48:55.000000000 +0100
@@ -1069,13 +1069,13 @@
 
     /* look for "lost+found" in the root directory */
     retval = reiserfs_find_entry (fs, &root_dir_key,
-				  "lost+found", &gen_counter,
+				  fsck_data(fs)->lost_found_name, &gen_counter,
 				  &lost_found_dir_key);
     if (!retval) {
 	objectid = id_map_alloc(proper_id_map(fs));
 	if (!objectid) {
-	    fsck_progress ("Could not allocate an objectid for \"/lost+found\", \
-		lost files will not be linked\n");
+	    fsck_progress ("Could not allocate an objectid for \"/%s\", \
+		lost files will not be linked\n", fsck_data(fs)->lost_found_name);
 	    return;
 	}
 	set_key_dirid (&lost_found_dir_key, REISERFS_ROOT_OBJECTID);
@@ -1096,8 +1096,8 @@
 	fix_obviously_wrong_sd_mode (&path);
 	
 	if (not_a_directory (get_item (&path))) {
-	    fsck_progress ("\"/lost+found\" exists, but it is not a directory, \
-		lost files will not be linked\n");
+	    fsck_progress ("\"/%s\" exists, but it is not a directory, \
+		lost files will not be linked\n", fsck_data(fs)->lost_found_name);
 	    set_key_objectid (&lost_found_dir_key, 0);
 	    pathrelse (&path);
 	    return;
@@ -1114,8 +1114,9 @@
     reiserfs_add_entry (fs, &lost_found_dir_key, "..", name_length ("..", lost_found_dir_format),
     		&root_dir_key, 1 << IH_Unreachable);
 
-    item_len = reiserfs_add_entry (fs, &root_dir_key, "lost+found",
-    		name_length ("lost+found", root_dir_format), &lost_found_dir_key, 1 << IH_Unreachable);
+    item_len = reiserfs_add_entry (fs, &root_dir_key, fsck_data(fs)->lost_found_name,
+    		name_length (fsck_data(fs)->lost_found_name, root_dir_format),
+		&lost_found_dir_key, 1 << IH_Unreachable);
 
     if (item_len) {
 	if (reiserfs_search_by_key_4 (fs, &root_dir_key, &path) == ITEM_NOT_FOUND)

--Boundary-00=_GqqkFG7THq4sL8n
Content-Type: application/x-shellscript;
  name="test.sh"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="test.sh"


# copy first 12 % of my SuSE 10.0 root partition:
dd if=/dev/sda7 bs=1024k count=1280 of=/temp.img
# append (more than) sufficient amount of sparse data
# to fit size of filesystem
dd if=/dev/zero bs=1024k count=0 seek=16384 of=/temp.img
# have a look and delete some files
# In some subdirectories you should get "permission denied"
# and lots of errors in syslog (/var/log/messages).
losetup /dev/loop1 /temp.img
mount /dev/loop1 /mnt || exit 1 # do not continue if mount fails
cd /mnt/usr
find -type f | xargs rm
cd /mnt
ls
# umount actually didn't work; I had to press reset
# and type losetup /dev/loop1 /temp.img again.
umount /mnt
# adjust some meta data (answer Yes, n, y)
/usr/local/sbin/reiserfsck  --rebuild-sb /dev/loop1
# check filesystem
# This should place some (of the deleted) files into the
# etc directory.
/usr/local/sbin/reiserfsck --lost-and-found etc --rebuild-tree -S /dev/loop1
# have a look
mount /dev/loop1 /mnt
ls /mnt/etc
# clean up
umount /mnt
losetup -d /dev/loop1
rm /temp.img


--Boundary-00=_GqqkFG7THq4sL8n--
