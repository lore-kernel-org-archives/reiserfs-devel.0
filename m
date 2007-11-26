From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 1/2] reiserfsprogs: add ext3-style mount count and last check
 expiry for better fsck -a behavior
Date: Mon, 26 Nov 2007 17:41:30 -0500
Message-ID: <474B4B9A.9050604@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward@namesys.com>

 Currently, fsck.reiserfs -a <dev> performs a full --check scan on every
 reiserfs file system during every boot. This is obviously suboptimal, since
 it kills one of the major features of a journaled file system.

 This patch adds mount counting and last check expiration to fsck, mkfs, and
 debugfs so that we can perform fscks on a user defined schedule.

 The defaults are 180 days or 30 mounts before fsck -a results in a full scan.

 On file systems where this feature hasn't yet been enabled, the fsck -a will
 perform a full scan and then mark the superblock with the defaults.

 While the mount count won't work with kernels that don't support it, the
 timeout obviously will. I'll be following this patch up with a kernel
 patch that reserves the fields and updates the mount counts.

 This support is super important with multi-terabyte file systems, since
 the check is causing huge delays during mount.

 Whether or not this patch is immediately accepted into the reiserfsprogs
 repository, I'd at least like confirmation that I can reserve these fields
 in the superblock for this purpose.

 Thanks.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---

 include/reiserfs/super.h |   19 +++++++++++++++
 include/reiserfs/types.h |    6 ++++
 libreiserfs/filesystem.c |    6 ++++
 libreiserfs/super.c      |   21 +++++++++++++++++
 utils/fsck/main.c        |   58 ++++++++++++++++++++++++++++++++++++++++++++++-
 utils/tune/tune.c        |   45 +++++++++++++++++++++++++++++++++++-
 6 files changed, 151 insertions(+), 4 deletions(-)

--- a/include/reiserfs/super.h	2007-11-26 16:36:25.000000000 -0500
+++ b/include/reiserfs/super.h	2007-11-26 16:36:46.000000000 -0500
@@ -82,6 +82,22 @@ typedef enum {
 #define reiserfs_sb_get_gen(sb)		get_le32 (sb, sb_inode_generation)
 #define reiserfs_sb_set_gen(sb,val)	set_le32 (sb, sb_inode_generation, val)
 
+#define reiserfs_sb_get_mnt_count(sb)		get_le16 (sb, s_mnt_count)
+#define reiserfs_sb_set_mnt_count(sb,val)	set_le16 (sb, s_mnt_count, val)
+
+#define reiserfs_sb_get_max_mnt_count(sb)			\
+	get_le16 (sb, s_max_mnt_count)
+#define reiserfs_sb_set_max_mnt_count(sb,val)			\
+	set_le16 (sb, s_max_mnt_count, val)
+
+#define reiserfs_sb_get_lastcheck(sb)		get_le32 (sb, s_lastcheck)
+#define reiserfs_sb_set_lastcheck(sb,val)	set_le32 (sb, s_lastcheck, val)
+
+#define reiserfs_sb_get_check_interval(sb)			\
+	get_le32 (sb, s_check_interval)
+#define reiserfs_sb_set_check_interval(sb,val)			\
+	set_le32 (sb, s_check_interval, val)
+
 #define reiserfs_sb_get_flags(sb)	get_le32 (sb, s_flags)
 #define reiserfs_sb_set_flags(sb, val)	set_le32 (sb, s_flags, val)
 
@@ -114,6 +130,9 @@ typedef enum {
 #define REISERFS_JR_SUPER_MAGIC_STRING "ReIsEr3Fs" /* JR stands for Journal
 						      Relocation */
 
+#define DEFAULT_MAX_MNT_COUNT	30			/* 30 mounts */
+#define DEFAULT_CHECK_INTERVAL	(180 * 60 * 60 * 24)	/* 180 days */
+
 /* these are possible values for sb_fs_state */
 enum reiserfs_state_flags {
 	/* this is set by mkreiserfs and by reiserfsck */
--- a/include/reiserfs/types.h	2007-11-26 16:36:25.000000000 -0500
+++ b/include/reiserfs/types.h	2007-11-26 16:36:46.000000000 -0500
@@ -134,7 +134,11 @@ struct reiserfs_super_block {
 /*100 */    unsigned char s_label[16];
 /* zero filled by mkreiserfs and reiserfs_convert_objectid_map_v1()
  * so any additions must be updated there as well. */ 
-/*116 */    char s_unused[88];
+/*116 */    __u16 s_mnt_count;
+/*118 */    __u16 s_max_mnt_count;
+/*120 */    __u32 s_lastcheck;
+/*124 */    __u32 s_check_interval;
+/*128 */    char s_unused[76];
 /*204*/
 } __attribute__ ((__packed__));;
 
--- a/libreiserfs/filesystem.c	2007-11-26 16:36:25.000000000 -0500
+++ b/libreiserfs/filesystem.c	2007-11-26 16:36:46.000000000 -0500
@@ -283,7 +283,11 @@ reiserfs_filsys_t * reiserfs_fs_create (
     reiserfs_sb_set_version (fs->fs_ondisk_sb, version);
     reiserfs_sb_set_bmaps (fs->fs_ondisk_sb, 
 			   reiserfs_bmap_over(bmap_nr) ? 0 : bmap_nr);
-    
+    reiserfs_sb_set_lastcheck(fs->fs_ondisk_sb, time());
+    reiserfs_sb_set_check_interval(fs->fs_ondisk_sb, DEFAULT_CHECK_INTERVAL);
+    reiserfs_sb_set_mnt_count(fs->fs_ondisk_sb, 1);
+    reiserfs_sb_set_max_mnt_count(fs->fs_ondisk_sb, DEFAULT_MAX_MNT_COUNT);
+
     /* sb_not_used1 */
     reiserfs_buffer_mkdirty (fs->fs_super_bh);
     fs->fs_dirt = 1;
--- a/libreiserfs/super.c	2007-11-26 16:35:39.000000000 -0500
+++ b/libreiserfs/super.c	2007-11-26 17:00:33.000000000 -0500
@@ -104,6 +104,8 @@ int reiserfs_super_print (FILE * fp, 
     reiserfs_sb_t * sb = (reiserfs_sb_t *)(bh->b_data);
     int format = 0;
     __u16 state;
+    time_t last_check = reiserfs_sb_get_lastcheck(sb);
+    char last_check_buf[26];
 
     if (!reiserfs_super_valid(bh))
 	return 1;
@@ -174,6 +176,25 @@ int reiserfs_super_print (FILE * fp, 
         reiserfs_warning (fp, "Set flags in SB:\n");
 	if ((reiserfs_sb_isflag (sb, reiserfs_attrs_cleared)))
 	    reiserfs_warning (fp, "\tATTRIBUTES CLEAN\n");
+	reiserfs_warning(fp, "Mount count: %u\n",
+			 reiserfs_sb_get_mnt_count(sb));
+	reiserfs_warning(fp, "Maximum mount count: ");
+	if (reiserfs_sb_get_max_mnt_count(sb))
+		reiserfs_warning(fp, "%u\n", reiserfs_sb_get_max_mnt_count(sb));
+	else
+		reiserfs_warning(fp, "Disabled. (Use tunefs.reiserfs)\n");
+	if (last_check) {
+		ctime_r(&last_check, last_check_buf);
+		reiserfs_warning(fp, "Last fsck run: %s", last_check_buf);
+	} else
+		reiserfs_warning(fp, "Last fsck run: Never with a version "
+				 "that supports this feature.\n");
+	reiserfs_warning(fp, "Check interval in days: ");
+	if (reiserfs_sb_get_check_interval(sb))
+		reiserfs_warning(fp, "%u\n",
+			 reiserfs_sb_get_check_interval(sb) / (24*60*60));
+	else
+		reiserfs_warning(fp, "Disabled. (Use tunefs.reiserfs)\n");
     }
 
     return 0;
--- a/utils/fsck/main.c	2007-11-26 16:36:25.000000000 -0500
+++ b/utils/fsck/main.c	2007-11-26 17:37:45.000000000 -0500
@@ -691,6 +691,22 @@ static int where_to_start_from (reiserfs
     return START_FROM_THE_BEGINNING;
 }
 
+static void reiserfs_update_interval_fields(reiserfs_filsys_t *fs)
+{
+	/* Not supported on v3.5 */
+	if (reiserfs_sb_get_version (fs->fs_ondisk_sb) == REISERFS_FORMAT_3_5)
+		return;
+
+	reiserfs_sb_set_lastcheck(fs->fs_ondisk_sb, time(NULL));
+	reiserfs_sb_set_mnt_count(fs->fs_ondisk_sb, 1);
+
+	if (reiserfs_sb_get_max_mnt_count(fs->fs_ondisk_sb) == 0)
+		reiserfs_sb_set_max_mnt_count(fs->fs_ondisk_sb,
+					      DEFAULT_MAX_MNT_COUNT);
+	if (reiserfs_sb_get_check_interval(fs->fs_ondisk_sb) == 0)
+		reiserfs_sb_set_check_interval(fs->fs_ondisk_sb,
+					       DEFAULT_CHECK_INTERVAL);
+}
 
 static void mark_filesystem_consistent (reiserfs_filsys_t * fs)
 {
@@ -713,6 +729,7 @@ static void mark_filesystem_consistent (
 
     reiserfs_sb_set_umount (fs->fs_ondisk_sb, FS_CLEANLY_UMOUNTED);
     reiserfs_sb_set_state (fs->fs_ondisk_sb, FS_CONSISTENT);
+    reiserfs_update_interval_fields(fs);
     
     reiserfs_buffer_mkdirty (fs->fs_super_bh);
 }
@@ -953,6 +970,38 @@ static void clean_attributes (reiserfs_f
 
 }
 
+static int reiserfs_check_auto_state(reiserfs_filsys_t *fs)
+{
+	time_t now = time(NULL);
+	time_t lastcheck = reiserfs_sb_get_lastcheck(fs->fs_ondisk_sb);
+	unsigned int mnt_count = reiserfs_sb_get_mnt_count(fs->fs_ondisk_sb);
+	unsigned int max_mnt_count = reiserfs_sb_get_max_mnt_count(fs->fs_ondisk_sb);
+
+	/* v3.5 file systems don't have the superblock fields for this */
+	if (reiserfs_sb_get_version (fs->fs_ondisk_sb) == REISERFS_FORMAT_3_5)
+		return 1;
+
+	if (lastcheck == 0 || mnt_count == 0 || max_mnt_count == 0) {
+		fprintf(stderr, "File system hasn't been enabled for faster "
+		        "boot-time checking. Enabling now.\n");
+		return 1;
+	}
+
+	if (now > lastcheck + reiserfs_sb_get_check_interval(fs->fs_ondisk_sb)) {
+		fprintf(stderr, "File system hasn't been checked in %u days. "
+		        "Checking now.\n", (now - lastcheck) / (60*60*24));
+		return 1;
+	}
+
+	if (mnt_count > max_mnt_count) {
+		fprintf(stderr, "File system has been mounted %u times "
+		        "without being checked. Checking now.\n");
+		return 1;
+	}
+
+	return 0;
+}
+
 static int auto_check (reiserfs_filsys_t *fs) {
     __u16 state;
     int retval = 0;
@@ -976,6 +1025,8 @@ static int auto_check (reiserfs_filsys_t
     if (state != FS_CONSISTENT)
 	fprintf(stderr, "Some strange state was specified in the super block. "
 	    "Do usual check.\n");
+    else if (!reiserfs_check_auto_state(fs))
+	    exit(EXIT_OK);
 
     prepare_fs_for_check(fs);
 
@@ -1016,7 +1067,12 @@ static int auto_check (reiserfs_filsys_t
 	/* run fixable pass. */
 	return 0;
     }
-    
+
+    reiserfs_update_interval_fields(fs);
+    reiserfs_buffer_mkdirty(fs->fs_super_bh);
+    reiserfs_buffer_write(fs->fs_super_bh);
+    fs->fs_dirt = 1;
+
     util_device_dma_fini(fs->fs_dev, &dma_info);
     
     reiserfs_fs_close (fs);
--- a/utils/tune/tune.c	2007-11-26 16:36:25.000000000 -0500
+++ b/utils/tune/tune.c	2007-11-26 16:36:46.000000000 -0500
@@ -67,12 +67,16 @@ static void print_usage_and_exit(void)
 	     "  -u | --uuid UUID|random\tset new UUID\n"
 	     "  -l | --label LABEL\t\tset new label\n"
 	     "  -f | --force\t\t\tforce tuning, less confirmations\n"
+	     "  -c | --check-interval\tset interval in days for fsck -a to check\n"
+	     "  -m | --max-mnt-count\tset maximum number of mounts before fsck -a checks\n"
     	     "  -V\t\t\t\tprint version and exit\n", program_name);
     exit (1);
 }
 
 unsigned long Journal_size = 0;
 int Max_trans_size = JOURNAL_TRANS_MAX;
+unsigned short Max_mnt_count = 0;
+unsigned int Check_interval = 0;
 int Offset = 0;
 __u16 Options = 0;
 int Force = 0;
@@ -231,6 +235,15 @@ static void set_offset_in_journal_device
     Offset = str2int( str );
 }
 
+static void set_max_mnt_count(char *str)
+{
+    Max_mnt_count = str2int(str);
+}
+
+static void set_check_interval(char *str)
+{
+    Check_interval = str2int(str) * 60 * 60 * 24;
+}
 
 static void callback_new_badblocks(reiserfs_filsys_t *fs, 
 				   reiserfs_path_t *badblock_path, 
@@ -373,11 +386,13 @@ int main (int argc, char **argv)
 	    {"badblocks", required_argument, 0, 'B'},
 	    {"force", no_argument, 0, 'f'},
 	    {"make-journal-standard", no_argument, &flag, OPT_STANDARD},
+	    {"check-interval", required_argument, 0, 'c'},
+	    {"max-mount-count", required_argument, 0, 'm'},
 	    {0, 0, 0, 0}
 	};
 	int option_index;
       
-	c = getopt_long (argc, argv, "j:s:t:o:fu:l:b:B:V",
+	c = getopt_long (argc, argv, "j:s:t:o:fu:l:b:B:Vc:m:",
 			 options, &option_index);
 	if (c == -1)
 	    break;
@@ -452,6 +467,14 @@ int main (int argc, char **argv)
 	case 'V':
 	    util_print_banner("reiserfstune");
 	    exit(0);
+	case 'c':
+	    set_check_interval(optarg);
+	    break;
+	case 'm':
+	    set_max_mnt_count(optarg);
+	    break;
+
+
 #if 0
 	case 'J': /* --journal-new-device */
 	    Options |= OPT_NEW_J;
@@ -588,6 +611,20 @@ int main (int argc, char **argv)
 	    reiserfs_buffer_mkdirty (fs->fs_super_bh);
 	    fs->fs_dirt = 1;
 	}
+	if (Max_mnt_count &&
+	    Max_mnt_count != reiserfs_sb_get_max_mnt_count(fs->fs_ondisk_sb)) {
+		if (Max_mnt_count <= 0)
+			reiserfs_exit(1, "max-mnt-count must be > 0\n");
+		reiserfs_sb_set_max_mnt_count(fs->fs_ondisk_sb, Max_mnt_count);
+	}
+
+	if (Check_interval &&
+	    Check_interval != reiserfs_sb_get_check_interval(fs->fs_ondisk_sb)) {
+		if (Check_interval <= 0)
+			reiserfs_exit(1, "check-interval must be > 0\n");
+		reiserfs_sb_set_check_interval(fs->fs_ondisk_sb,
+					       Check_interval);
+	}
     } else {
 #if defined(HAVE_LIBUUID) && defined(HAVE_UUID_UUID_H)
         if (!uuid_is_null(UUID))
@@ -595,8 +632,14 @@ int main (int argc, char **argv)
 #endif
         if (LABEL)
             reiserfs_exit (1, "LABEL cannot be specified for 3.5 format\n");
+
+	if (Max_mnt_count)
+	    reiserfs_exit (1, "max-mnt-count cannot be specified for 3.5 format\n");
+	if (Check_interval)
+	    reiserfs_exit (1, "check-interval cannot be specified for 3.5 format\n");
     }
 
+
     if (!j_new_device_name) {
 	
 	/* new journal device hasn't been specified */

-- 
Jeff Mahoney
SUSE Labs
