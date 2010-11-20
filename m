From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfsprogs: Support for reiserfs 3.7
Date: Sat, 20 Nov 2010 11:06:53 -0500
Message-ID: <4CE7F21D.2050206@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

 This patch contains support for handling the new 3.7 feature extension.

 Note that it does not actually implement *any* optional features, it just
 adds support for checking, debugging, and tuning them.

 reiserfstune supports setting and clearing feature bits (with --force,
 since none are supported right now), converting between 3.6 and 3.7, and
 converting back to 3.6 provided none of the optional features are
 enabled.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 debugreiserfs/pack.c        |    4 
 fsck/fsck.h                 |    4 
 fsck/main.c                 |   48 ++++++++++-
 fsck/reiserfsck.8           |   12 ++
 fsck/super.c                |  154 ++++++++++++++++++++++++++++++++++-
 include/reiserfs_fs.h       |   46 ++++++++++
 include/reiserfs_lib.h      |    8 +
 mkreiserfs/mkreiserfs.c     |   38 ++++++--
 reiserfscore/Makefile.am    |    2 
 reiserfscore/feature.c      |  104 ++++++++++++++++++++++++
 reiserfscore/node_formats.c |   25 +++++
 reiserfscore/prints.c       |   44 +++++++++-
 reiserfscore/reiserfslib.c  |    8 +
 tune/reiserfstune.8         |   11 ++
 tune/tune.c                 |  190 ++++++++++++++++++++++++++++++++++++++++----
 15 files changed, 650 insertions(+), 48 deletions(-)

--- a/debugreiserfs/pack.c
+++ b/debugreiserfs/pack.c
@@ -567,8 +567,8 @@ static void pack_frozen_data (reiserfs_f
     __u16 magic16;
     int sent_journal_start_magic = 0;
     unsigned int i;
-    
-    if (is_reiserfs_jr_magic_string(fs->fs_ondisk_sb) &&
+
+    if (has_nonstandard_journal(fs->fs_ondisk_sb) &&
 	get_jp_journal_dev(sb_jp(fs->fs_ondisk_sb)) &&
 	!journal_device_name(fs)) {
 	if (!user_confirmed (stderr,
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -44,9 +44,10 @@ int main (int argc, char * argv []);
 #define FSCK_ROLLBACK_CHANGES   5
 #define FSCK_CLEAN_ATTRIBUTES	7
 #define FSCK_AUTO               8 /* -a || -p specified */
+#define FSCK_FIX_FEATURES	9
 
 /* temporary */
-#define DO_TEST                 9
+#define DO_TEST                 10
 
 /*
  * options
@@ -483,6 +484,7 @@ int replay_journal (reiserfs_filsys_t *)
 
 /*pass1: rebuild super block*/
 void rebuild_sb (reiserfs_filsys_t * fs, char * filename, struct fsck_data * data);
+int check_features(reiserfs_filsys_t * fs);
 
 
 #define fsck_log(fmt, list...) \
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -94,6 +94,7 @@ static char * parse_options (struct fsck
 	    /* modes */
 	    {"check", no_argument, &mode, FSCK_CHECK},
 	    {"fix-fixable", no_argument, &mode, FSCK_FIX_FIXABLE},
+	    {"fix-features", no_argument, &mode, FSCK_FIX_FEATURES},
 	    {"rebuild-sb", no_argument, &mode, FSCK_SB},
 	    {"rebuild-tree", no_argument, &mode, FSCK_REBUILD},
 	    {"rollback-fsck-changes", no_argument, &mode, FSCK_ROLLBACK_CHANGES},
@@ -371,6 +372,10 @@ void warn_what_will_be_done (char * file
 	
 	break;
 
+    case FSCK_FIX_FEATURES:
+	reiserfs_warning (warn_to, "Will check and optionally repair features that are unsupported by this version of reiserfsck.\n");
+	break;
+
     case FSCK_REBUILD:
 	if (data->options & OPT_SAVE_PASSES_DUMP) {
 	    reiserfs_warning (warn_to, "Will run only 1 step of the rebuilding, "
@@ -839,6 +844,16 @@ static void prepare_fs_for_check(reiserf
 	/* filesystem is not mounted, replay journal before checking */
         reiserfsck_replay_journal (fs);
     }
+
+    /* Check feature bits. We shouldn't continue on a file system with
+     * feature bits we don't know about. --fix-features will fix this. */
+    if (fsck_mode(fs) != FSCK_FIX_FEATURES && is_reiserfs_3_7_magic_string(fs->fs_ondisk_sb)) {
+	int ret = check_features(fs);
+	if (ret) {
+	    reiserfs_close (fs);
+	    exit(EXIT_FATAL);
+	}
+    }
 }
 
 static void rebuild_tree (reiserfs_filsys_t * fs) {
@@ -917,7 +932,7 @@ static void clean_attributes (reiserfs_f
         exit(EXIT_USER);
     }
 
-    if (get_reiserfs_format (fs->fs_ondisk_sb) != REISERFS_FORMAT_3_6) {
+    if (get_reiserfs_format (fs->fs_ondisk_sb) < REISERFS_FORMAT_3_6) {
         fsck_progress ("Filesystems of 3_5 format do not support extended "
 	    "attributes.\n");
 	
@@ -1078,6 +1093,30 @@ error:
     exit(EXIT_FATAL);
 }
 
+static int fix_features(reiserfs_filsys_t *fs)
+{
+    int ret = 0;
+    /* Check feature bits. We shouldn't continue on a file system with
+     * feature bits we don't know about. OTOH, we can't really abort
+     * fsck entirely on a particular type of corruption. */
+    if (is_reiserfs_3_7_magic_string(fs->fs_ondisk_sb)) {
+	int ret;
+	init_rollback_file (state_rollback_file(fs), &fs->fs_blocksize,
+	    fsck_data(fs)->log);
+
+	prepare_fs_for_check (fs);
+
+	ret = check_features(fs);
+	reiserfs_close (fs);
+	if (ret)
+	    exit (EXIT_FATAL);
+	exit (EXIT_OK);
+    } else {
+	fsck_progress("Optional features are not supported on reiserfs formats prior to 3.7\n");
+    }
+    return ret;
+}
+
 /* check umounted or read-only mounted filesystems only */
 static void check_fs (reiserfs_filsys_t * fs)
 {
@@ -1357,7 +1396,8 @@ int main (int argc, char * argv [])
 		    exit(EXIT_OPER);
 	        }
 	    }
-	
+
+
 	    if (data->options & BADBLOCKS_FILE) {
 		if (create_badblock_bitmap (fs, badblocks_file) != 0) 
 		    exit(EXIT_OPER);
@@ -1371,6 +1411,10 @@ int main (int argc, char * argv [])
     case FSCK_SB:
 	rebuild_sb (fs, file_name, data);
 	break;
+
+    case FSCK_FIX_FEATURES:
+	fix_features(fs);
+	break;
     
     case FSCK_AUTO:
 	/* perform some light-weight checks. If error, do fixable job. */
--- a/fsck/reiserfsck.8
+++ b/fsck/reiserfsck.8
@@ -1,13 +1,14 @@
 .\" -*- nroff -*-
 .\" Copyright 1996-2004 Hans Reiser.
 .\" 
-.TH REISERFSCK 8 "January 2009" "Reiserfsprogs-3.6.21"
+.TH REISERFSCK 8 "November 2010" "Reiserfsprogs-3.6.21"
 .SH NAME
 reiserfsck \- The checking tool for the ReiserFS filesystem.
 .SH SYNOPSIS
 .B reiserfsck 
 [ \fB-aprVy\fR ]
 [ \fB--rebuild-sb\fR | \fB--check\fR | \fB--fix-fixable\fR
+| \fB--fix-features\fR
 | \fB--rebuild-tree\fR | \fB--clean-attributes\fR ]
 .\" [ \fB-i\fR | \fB--interactive\fR ]
 [ \fB-j\fR | \fB--journal\fR \fIdevice\fR ]
@@ -56,6 +57,15 @@ you only need this option if the \fB--ch
 zeroing invalid data-block pointers, correcting st_size and st_blocks 
 for directories, and deleting invalid directory entries.
 .TP
+.B --fix-features
+This option checks the optional feature fields added in the 3.7 format.
+This is used when reiserfsck refuses to run because there are features
+indicated as used in the superblock that reiserfsck doesn't support.
+This should only be used if you are certain that there is corruption
+in the fields and that the features aren't actually in use. It will
+offer to clear all unknown fields or allow the administrator to
+choose which unknown features to clear specifically.
+.TP
 .B --rebuild-tree
 This option rebuilds the entire filesystem tree using leaf nodes 
 found on the device.  Normally you only need this option if the 
--- a/fsck/super.c
+++ b/fsck/super.c
@@ -24,10 +24,11 @@ int what_fs_version ()
         "\t(2) >=3.5.9 (introduced in the middle of 1999) (if you use linux 2.2, choose this one)\n"
         "\t(3) < 3.5.9 converted to new format (don't choose if unsure)\n"
         "\t(4) < 3.5.9 (this is very old format, don't choose if unsure)\n"
+	"\t(5) 3.7.x\n"
         "\t(X)   exit\n");
     getline (&answer, &n, stdin);
     version = atoi (answer);
-    if (version < 1 || version > 4)
+    if (version < 1 || version > 5)
         die ("rebuild_sb: wrong version");
     return version;
 }
@@ -168,6 +169,129 @@ int check_sb (reiserfs_filsys_t * fs) {
 }
 */
 
+unsigned int supported_features[3] = {
+    /* compat */
+    0,
+    /* incompat */
+    0,
+    /* ro-compat */
+    0,
+};
+
+
+static int
+ask_to_clear_features(reiserfs_filsys_t *fs, int compat, unsigned int *features,
+		      unsigned int mask)
+{
+    char *answer = NULL;
+    size_t n = 0;
+    int i;
+    int dirty = 0;
+
+    for (i = 0; i < 32; i++) {
+	if (mask & (1 << i)) {
+	    const char *f = reiserfs_feature_to_string(compat, 1 << i);
+	    do {
+		if (answer) {
+		    free(answer);
+		    answer = NULL;
+		}
+		printf("Clear %s? [Y/n] ", f);
+		getline (&answer, &n, stdin);
+	    } while (strcasecmp ("y\n", answer) &&
+		     strcasecmp ("n\n", answer) &&
+		     strcasecmp ("\n", answer));
+
+	    if (strcasecmp("n\n", answer)) {
+		*features &= ~cpu_to_le32(1 << i);
+		dirty = 1;
+		fsck_progress("Cleared %s.\n", f);
+	    }
+	    free(answer);
+	    answer = NULL;
+	}
+    }
+
+    return dirty;
+}
+
+int check_features(reiserfs_filsys_t *fs)
+{
+    struct reiserfs_super_block *sb = fs->fs_ondisk_sb;
+    unsigned int un_compat, un_incompat, un_rocompat;
+    unsigned int compat_supp = le32_to_cpu(REISERFS_FEATURE_COMPAT_SUPP);
+    unsigned int incompat_supp = le32_to_cpu(REISERFS_FEATURE_INCOMPAT_SUPP);
+    unsigned int rocompat_supp = le32_to_cpu(REISERFS_FEATURE_RO_COMPAT_SUPP);
+    int dirty = 0;
+    char *answer = NULL;
+    size_t n = 0;
+    const char *desc;
+    int need_comma;
+
+    un_compat = le32_to_cpu(sb->s_feature_compat) & ~compat_supp;
+    un_incompat = le32_to_cpu(sb->s_feature_incompat) & ~incompat_supp;
+    un_rocompat = le32_to_cpu(sb->s_feature_ro_compat) & ~rocompat_supp;
+
+    if ((un_compat|un_incompat|un_rocompat) == 0)
+	return 0;
+
+    fsck_progress ("Filesystem has unsupported features enabled (");
+    desc = reiserfs_features_to_string(REISERFS_FEATURE_INCOMPAT,
+				       un_incompat);
+    fsck_progress ("%s", desc);
+    need_comma = !!*desc;
+
+    desc = reiserfs_features_to_string(REISERFS_FEATURE_RO_COMPAT,
+				       un_rocompat);
+    fsck_progress ("%s%s", (need_comma && *desc) ? "," : "", desc);
+    need_comma = !!*desc;
+
+    desc = reiserfs_features_to_string(REISERFS_FEATURE_COMPAT, un_compat);
+    fsck_progress ("%s%s", (need_comma && *desc) ? "," : "", desc);
+    fsck_progress( ") that this version of fsck does not know about.  "
+		   "If you have already updated fsck to the latest version, "
+		   "this may indicate minor corruption in the superblock that "
+		   " will need to be repaired before fsck can continue.  You "
+		   "can repair this damage with the --fix-features option.  "
+		   "It should only be used if you are certain that the "
+		   "set feature bits are incorrect.\n");
+
+    if (fsck_mode(fs) != FSCK_FIX_FEATURES)
+	    return 1;
+    do {
+	if (answer) {
+	    free(answer);
+	    answer = NULL;
+	}
+	printf ("Clear all unsupported features? [Y/n] ");
+	getline (&answer, &n, stdin);
+    } while (strcasecmp ("y\n", answer) && strcasecmp ("n\n", answer) &&
+	     strcasecmp ("\n", answer));
+
+    if (!strcasecmp(answer, "n\n")) {
+	dirty += ask_to_clear_features(fs, REISERFS_FEATURE_COMPAT,
+				       &sb->s_feature_compat, un_compat);
+	dirty += ask_to_clear_features(fs, REISERFS_FEATURE_INCOMPAT,
+				       &sb->s_feature_incompat, un_incompat);
+	dirty += ask_to_clear_features(fs, REISERFS_FEATURE_RO_COMPAT,
+				       &sb->s_feature_ro_compat, un_rocompat);
+    } else {
+	sb->s_feature_compat &= ~(cpu_to_le32(un_compat));
+	sb->s_feature_incompat &= ~(cpu_to_le32(un_incompat));
+	sb->s_feature_ro_compat &= ~(cpu_to_le32(un_rocompat));
+	fsck_progress("Cleared all unsupported features.\n");
+	dirty = 1;
+    }
+
+    if (dirty) {
+	mark_buffer_dirty(fs->fs_super_bh);
+	fs->fs_dirt = 1;
+	bwrite(fs->fs_super_bh);
+    }
+
+    return 0;
+}
+
 void rebuild_sb (reiserfs_filsys_t * fs, char * filename, struct fsck_data * data)
 {
     int version = 0;
@@ -228,7 +352,16 @@ void rebuild_sb (reiserfs_filsys_t * fs,
         memcpy (sb, fs->fs_ondisk_sb, sizeof (*sb));
         fs->fs_ondisk_sb = sb;
 
-        if (is_reiserfs_3_6_magic_string (sb)) {
+	if (is_reiserfs_3_7_magic_string (sb)) {
+	    /* 3_7 magic */
+            if (fs->fs_super_bh->b_blocknr ==
+		REISERFS_DISK_OFFSET_IN_BYTES / fs->fs_blocksize)
+                version = 7;
+	    else
+		reiserfs_exit (EXIT_USER, "ReiserFS v3.7 was found but in "
+			       "an invalid location.\n");
+            magic_was_found = 7;
+	} else if (is_reiserfs_3_6_magic_string (sb)) {
             /* 3_6 magic */
             if (fsck_data (fs)->journal_dev_name)
                 /* journal dev must not be specified with standard journal */
@@ -295,7 +428,9 @@ void rebuild_sb (reiserfs_filsys_t * fs,
 
         if (magic_was_found == 1 || magic_was_found == 2)
             standard_journal = 1;
-        else
+	else if (magic_was_found == 7) {
+	    standard_journal = !fsck_data (fs)->journal_dev_name;
+	} else
             standard_journal = 0;
 
         if (version == 0)
@@ -327,6 +462,7 @@ void rebuild_sb (reiserfs_filsys_t * fs,
 		    get_sb_block_size (sb), fs->fs_blocksize);
   	    set_sb_block_size (sb, fs->fs_blocksize);
         }
+
     }
 
     /* if no reiserfs_found or bad data found in that SB, what was checked in previous 
@@ -375,6 +511,8 @@ void rebuild_sb (reiserfs_filsys_t * fs,
         case 4:
             fs = reiserfs_create (filename, REISERFS_FORMAT_3_5, block_count, retval, 1, 0);
             break;
+	case 7:
+	    fs = reiserfs_create (filename, REISERFS_FORMAT_3_7, block_count, retval, 1, standard_journal);
         }
 
 	if (fs == NULL)
@@ -435,6 +573,12 @@ void rebuild_sb (reiserfs_filsys_t * fs,
 		    get_reiserfs_format (sb), REISERFS_FORMAT_3_5);
             set_sb_version (sb, REISERFS_FORMAT_3_5);
         }
+    } else if (version == 7 &&
+	       get_reiserfs_format (sb) != REISERFS_FORMAT_3_7) {
+	fsck_log("rebuild-sb: wrong reiserfs version occured (%lu), "
+		 "fixed (%lu)\n", get_reiserfs_format (sb),
+		 REISERFS_FORMAT_3_7);
+	set_sb_version (sb, REISERFS_FORMAT_3_7);
     }
 
     p_oid_maxsize = (fs->fs_blocksize - reiserfs_super_block_size (sb)) / 
@@ -503,7 +647,7 @@ void rebuild_sb (reiserfs_filsys_t * fs,
 	set_sb_hash_code (sb, 0);
     }
 
-    if (version == 1 || version == 3) {
+    if (version == 1 || version == 3 || version == 7) {
 #if defined(HAVE_LIBUUID) && defined(HAVE_UUID_UUID_H)
         if (uuid_is_null(sb->s_uuid)) {
 	    uuid_generate(sb->s_uuid);
@@ -812,7 +956,7 @@ void rebuild_sb (reiserfs_filsys_t * fs,
     /*  whether journal header contains params with the same dev, offset, size will be 
 	checked in open_journal */
 
-    if (version == 1 || version == 3)
+    if (version == 1 || version == 3 || version == 7)
         sb_size = SB_SIZE;
     else
         sb_size = SB_SIZE_V1;
--- a/include/reiserfs_fs.h
+++ b/include/reiserfs_fs.h
@@ -185,8 +185,8 @@ struct reiserfs_super_block_v1
    only reliable on filesystem with non-standard journal */
 #define REISERFS_FORMAT_3_5 0
 #define REISERFS_FORMAT_3_6 2
+#define REISERFS_FORMAT_3_7 3
 #define REISERFS_FORMAT_UNKNOWN -1
-                                   
 
 /* values for sb_mount_state field */
 #define FS_CLEANLY_UMOUNTED    1 /* this was REISERFS_VALID_FS */
@@ -206,7 +206,11 @@ struct reiserfs_super_block
 /*118 */    __u16 s_max_mnt_count;
 /*120 */    __u32 s_lastcheck;
 /*124 */    __u32 s_check_interval;
-/*128 */    char s_unused[76] ;            /* zero filled by mkreiserfs and reiserfs_convert_objectid_map_v1()
+	    /* Only available in superblock v3/reiserfs 3.7 */
+/*128 */    __u32 s_feature_compat;
+/*132 */    __u32 s_feature_incompat;
+/*136 */    __u32 s_feature_ro_compat;
+/*140 */    char s_unused[64] ;            /* zero filled by mkreiserfs and reiserfs_convert_objectid_map_v1()
                                             * so any additions must be updated there as well. */ 
 /*204*/
 } __attribute__ ((__packed__));;
@@ -293,6 +297,10 @@ typedef enum {
 #define set_sb_v2_flag(sb, flag)	set_le32 (sb, s_flags, get_le32 (sb, s_flags) | flag)
 #define clear_sb_v2_flag(sb, flag)	set_le32 (sb, s_flags, get_le32 (sb, s_flags) & ~(flag))
 
+#define get_sb_v2_feature_incompat(sb)	get_le32 (sb, s_feature_incompat)
+#define get_sb_v2_feature_compat(sb)	get_le32 (sb, s_feature_compat)
+#define get_sb_v2_feature_ro_compat(sb)	get_le32 (sb, s_feature_ro_compat)
+
 /*
 #define journal_is_relocated(sb)        get_jp_journal_dev(sb_jp (sb))
 */
@@ -393,6 +401,7 @@ typedef enum {
 #define REISERFS_3_6_SUPER_MAGIC_STRING "ReIsEr2Fs"
 #define REISERFS_JR_SUPER_MAGIC_STRING "ReIsEr3Fs" /* JR stands for Journal
 						      Relocation */
+#define REISERFS_3_7_SUPER_MAGIC_STRING "ReIsEr7Fs"
 
 #define get_reiserfs_ondisk_offset(block_of_super_block, block_size) \
     (block_of_super_block * block_size)
@@ -406,6 +415,39 @@ typedef enum {
     ((get_reiserfs_ondisk_offset(block_of_super_block, 4096) == REISERFS_OLD_DISK_OFFSET_IN_BYTES) \
 	? 1 : 0)
 
+/* Features */
+/* reiserfs 3.7 features */
+
+#define REISERFS_FEATURE_COMPAT 0
+#define REISERFS_FEATURE_INCOMPAT 1
+#define REISERFS_FEATURE_RO_COMPAT 2
+
+#define REISERFS_HAS_COMPAT_FEATURE(sb, mask)           \
+	((sb)->s_feature_compat & cpu_to_le32(mask))
+#define REISERFS_HAS_INCOMPAT_FEATURE(sb, mask) \
+	((sb)->s_feature_incompat & cpu_to_le32(mask))
+#define REISERFS_HAS_RO_COMPAT_FEATURE(sb, mask)        \
+	((sb)->s_feature_ro_compat & cpu_to_le32(mask))
+
+#define REISERFS_SET_COMPAT_FEATURE(sb, mask)           \
+	((sb)->s_feature_compat |= cpu_to_le32(mask))
+#define REISERFS_SET_INCOMPAT_FEATURE(sb, mask) \
+	((sb)->s_feature_incompat |= cpu_to_le32(mask))
+#define REISERFS_SET_RO_COMPAT_FEATURE(sb, mask)        \
+	((sb)->s_feature_ro_compat |= cpu_to_le32(mask))
+
+#define REISERFS_CLEAR_COMPAT_FEATURE(sb, mask) \
+	((sb)->s_feature_compat &= ~cpu_to_le32(mask))
+#define REISERFS_CLEAR_INCOMPAT_FEATURE(sb, mask)       \
+	((sb)->s_feature_incompat &= ~cpu_to_le32(mask))
+#define REISERFS_CLEAR_RO_COMPAT_FEATURE(sb, mask)      \
+	((sb)->s_feature_ro_compat &= ~cpu_to_le32(mask))
+
+#define REISERFS_FEATURE_COMPAT_SUPP    0
+#define REISERFS_FEATURE_INCOMPAT_SUPP  0
+#define REISERFS_FEATURE_RO_COMPAT_SUPP 0
+
+
 /***************************************************************************/
 /*                             JOURNAL                                     */
 /***************************************************************************/
--- a/include/reiserfs_lib.h
+++ b/include/reiserfs_lib.h
@@ -223,8 +223,10 @@ int is_blocksize_correct (unsigned int b
 int is_reiserfs_3_5_magic_string (struct reiserfs_super_block * rs);
 int is_reiserfs_3_6_magic_string (struct reiserfs_super_block * rs);
 int is_reiserfs_jr_magic_string (struct reiserfs_super_block * rs);
+int is_reiserfs_3_7_magic_string (struct reiserfs_super_block * rs);
 int does_look_like_super_block (struct reiserfs_super_block * rs);
 int is_any_reiserfs_magic_string (struct reiserfs_super_block * rs);
+int has_nonstandard_journal (struct reiserfs_super_block * rs);
 int get_reiserfs_format (struct reiserfs_super_block * sb);
 int reiserfs_super_block_size (struct reiserfs_super_block * rs);
 /*int magic_2_version (struct reiserfs_super_block * rs);*/
@@ -409,4 +411,10 @@ int can_we_format_it (char * device_name
 	}\
 
 
+/* features.c */
+int reiserfs_string_to_feature(char *string, int *compat_type,
+			       unsigned int *mask);
+const char *reiserfs_feature_to_string(int compat, unsigned int mask);
+const char *reiserfs_features_to_string(int compat, unsigned int mask);
+
 #endif /* REISERFSPROGS_LIB_H */
--- a/mkreiserfs/mkreiserfs.c
+++ b/mkreiserfs/mkreiserfs.c
@@ -71,7 +71,7 @@ static void print_usage_and_exit(void)
 	"  -h | --hash rupasov|tea|r5       hash function to use by default\n"
 	"  -u | --uuid UUID                 store UUID in the superblock\n"
 	"  -l | --label LABEL               store LABEL in the superblock\n"
-	"  --format 3.5|3.6                 old 3.5 format or newer 3.6\n"
+	"  --format 3.5|3.6|3.7             old 3.5, common 3.6, or newer 3.7 format\n"
 	"  -f | --force                     specified once, make mkreiserfs the whole\n"
 	"                                   disk, not block device or mounted partition;\n"
 	"                                   specified twice, do not ask for confirmation\n"
@@ -112,7 +112,8 @@ static void make_super_block (reiserfs_f
     set_sb_umount_state (fs->fs_ondisk_sb, FS_CLEANLY_UMOUNTED);
     set_sb_tree_height (fs->fs_ondisk_sb, 2);
     set_sb_hash_code (fs->fs_ondisk_sb, Hash);
-    if (fs->fs_format == REISERFS_FORMAT_3_6) {
+    if (fs->fs_format == REISERFS_FORMAT_3_6 ||
+	fs->fs_format == REISERFS_FORMAT_3_7) {
 #if defined(HAVE_LIBUUID) && defined(HAVE_UUID_UUID_H)
         if (uuid_is_null(UUID))
 	    uuid_generate(UUID);
@@ -308,6 +309,7 @@ static void make_root_block (reiserfs_fi
 static void report (reiserfs_filsys_t * fs, char * j_filename)
 {
 //    print_block (stdout, fs, fs->fs_super_bh);
+    const char *journal_prefix = NULL;
     struct reiserfs_super_block * sb = 
 	(struct reiserfs_super_block *)(fs->fs_super_bh->b_data);
 
@@ -334,10 +336,21 @@ static void report (reiserfs_filsys_t *
     case REISERFS_FORMAT_3_6:
 	    reiserfs_warning (stdout, "Format 3.6 with ");
 	    break;
+    case REISERFS_FORMAT_3_7:
+	    reiserfs_warning (stdout, "Format 3.7 with ");
+	    if (get_jp_journal_dev (sb_jp (sb)))
+		journal_prefix = "non-";
+	    else
+		journal_prefix = "";
+	    break;
+    }
+    if (!journal_prefix) {
+	if (is_reiserfs_jr_magic_string (sb))
+		journal_prefix = "non-";
+	else
+		journal_prefix = "";
     }
-    if (is_reiserfs_jr_magic_string (sb))
-	    reiserfs_warning (stdout, "non-");
-    reiserfs_warning (stdout, "standard journal\n");
+    reiserfs_warning (stdout, "%sstandard journal\n", journal_prefix);
     reiserfs_warning (stdout, "Count of blocks on the device: %u\n", 
 		      get_sb_block_count (sb));
     reiserfs_warning (stdout, "Number of blocks consumed by mkreiserfs "
@@ -384,7 +397,8 @@ static void report (reiserfs_filsys_t *
 			  get_sb_version (sb));
     }
 
-    if (get_reiserfs_format (sb) == REISERFS_FORMAT_3_6) {
+    if (get_reiserfs_format (sb) == REISERFS_FORMAT_3_6 ||
+	get_reiserfs_format (sb) == REISERFS_FORMAT_3_7) {
         reiserfs_warning (stdout, "inode generation number: %u\n", 
 			  get_sb_v2_inode_generation (sb));
         reiserfs_warning (stdout, "UUID: %U\n", sb->s_uuid);
@@ -415,7 +429,9 @@ static void set_reiserfs_version (char *
 {
     if (!strcmp (str, "3.5"))
 	    Format = "3.5";
-    else  {
+    else if (!strcmp (str, "3.7"))
+	    Format = "3.7";
+    else {
 	    Format = "3.6";
 	    if (strcmp (str, "3.6"))
 		    message("wrong reiserfs version specified. "
@@ -520,6 +536,9 @@ static int select_format (void)
 		if (!strcmp (Format, "3.5"))
 			return REISERFS_FORMAT_3_5;
 
+		if (!strcmp (Format, "3.7"))
+			return REISERFS_FORMAT_3_7;
+
 		if (strcmp (Format, "3.6")) {
 			message ("Unknown fromat %s specified\n", Format);
 			exit (1);
@@ -754,8 +773,9 @@ int main (int argc, char **argv)
     /* these fill buffers (super block, first bitmap, root block) with
        reiserfs structures */
 #if defined(HAVE_LIBUUID) && defined(HAVE_UUID_UUID_H)
-    if (!uuid_is_null(UUID) && fs->fs_format != REISERFS_FORMAT_3_6) {
-	reiserfs_warning(stderr, "UUID can be specified only with 3.6 format\n");
+    if (!uuid_is_null(UUID) && (fs->fs_format != REISERFS_FORMAT_3_6 ||
+				fs->fs_format != REISERFS_FORMAT_3_7)) {
+	reiserfs_warning(stderr, "UUID can be specified only with 3.6 or 3.7 format\n");
 	return 1;
     }
 #endif
--- a/reiserfscore/Makefile.am
+++ b/reiserfscore/Makefile.am
@@ -1,5 +1,5 @@
 noinst_LIBRARIES = libcore.a
 
 libcore_a_SOURCES = do_balan.c fix_node.c hashes.c ibalance.c lbalance.c prints.c \
-stree.c node_formats.c reiserfslib.c bitmap.c journal.c includes.h
+stree.c node_formats.c reiserfslib.c bitmap.c journal.c includes.h feature.c
 
--- /dev/null
+++ b/reiserfscore/feature.c
@@ -0,0 +1,104 @@
+#include <string.h>
+#include "misc.h"
+#include "swab.h"
+#include "reiserfs_lib.h"
+
+struct feature {
+	int compat;
+	unsigned int mask;
+	const char *string;
+};
+
+struct feature feature_list[] = {
+	{},
+};
+
+int reiserfs_string_to_feature(char *string, int *compat_type,
+			       unsigned int *mask)
+{
+	struct feature *f;
+	int num;
+	char *eptr;
+
+	for (f = feature_list; f->string; f++) {
+		if (!strcasecmp(f->string, string)) {
+			*compat_type = f->compat;
+			*mask = f->mask;
+			return 0;
+		}
+	}
+
+	/* Unnamed features */
+	if (strncasecmp(string, "FEATURE_", 8))
+		return 1;
+
+	switch (string[8]) {
+	case 'C': *compat_type = REISERFS_FEATURE_COMPAT; break;
+	case 'I': *compat_type = REISERFS_FEATURE_INCOMPAT; break;
+	case 'R': *compat_type = REISERFS_FEATURE_RO_COMPAT; break;
+	default:
+		return 1;
+	};
+	num = strtol(string+9, &eptr, 10);
+	if (num > 32 || num < 0)
+		return 1;
+	if (*eptr)
+		return 1;
+	*mask = 1 << num;
+	return 0;
+}
+
+const char *reiserfs_feature_to_string(int compat, unsigned int mask)
+{
+	static char buf[256];
+	struct feature *f;
+	char prefix;
+	int fnum;
+
+	for (f = feature_list; f->string; f++) {
+		if ((compat == f->compat) &&
+		    (mask == f->mask))
+			return f->string;
+	}
+
+	/* Unnamed features */
+	switch (compat) {
+	case REISERFS_FEATURE_COMPAT:
+		prefix = 'C'; break;
+	case REISERFS_FEATURE_INCOMPAT:
+		prefix = 'I'; break;
+	case REISERFS_FEATURE_RO_COMPAT:
+		prefix = 'R'; break;
+	default:
+		prefix = '?';
+		break;
+	};
+	for (fnum = 0; mask >>= 1; fnum++);
+	sprintf(buf, "FEATURE_%c%d", prefix, fnum);
+	return buf;
+}
+
+const char *reiserfs_features_to_string(int compat, unsigned int mask)
+{
+	int i;
+	static char buf[4096];
+	const char *max = buf + sizeof(buf);
+	char *ptr = buf;
+	int first = 1;
+	const char *f;
+
+	*ptr = '\0';
+
+	for (i = 0; i < 32; i++) {
+		if (mask & (1 << i)) {
+			f = reiserfs_feature_to_string(compat, 1 << i);
+			if (!first)
+				ptr += snprintf(ptr, max - ptr, ",%s", f);
+			else
+				ptr += snprintf(ptr, max - ptr, "%s", f);
+			first = 0;
+		}
+	}
+
+	return buf;
+}
--- a/reiserfscore/node_formats.c
+++ b/reiserfscore/node_formats.c
@@ -223,6 +223,12 @@ int is_reiserfs_3_6_magic_string (struct
 		      strlen ( REISERFS_3_6_SUPER_MAGIC_STRING)));
 }
 
+int is_reiserfs_3_7_magic_string (struct reiserfs_super_block * rs)
+{
+    return (!strncmp (rs->s_v1.s_magic, REISERFS_3_7_SUPER_MAGIC_STRING,
+		      strlen ( REISERFS_3_7_SUPER_MAGIC_STRING)));
+}
+
 
 int is_reiserfs_jr_magic_string (struct reiserfs_super_block * rs)
 {
@@ -235,11 +241,22 @@ int is_any_reiserfs_magic_string (struct
 {
     if (is_reiserfs_3_5_magic_string (rs) ||
 	is_reiserfs_3_6_magic_string (rs) ||
+	is_reiserfs_3_7_magic_string (rs) ||
 	is_reiserfs_jr_magic_string (rs))
 	return 1;
     return 0;
 }
 
+int has_nonstandard_journal (struct reiserfs_super_block * rs)
+{
+    if (is_reiserfs_jr_magic_string (rs))
+	return 1;
+    if (is_reiserfs_3_7_magic_string (rs) &&
+	get_jp_journal_dev(&rs->s_v1.sb_journal) != 0)
+	return 1;
+    return 0;
+}
+
 
 int get_reiserfs_format (struct reiserfs_super_block * sb)
 {
@@ -257,6 +274,9 @@ int get_reiserfs_format (struct reiserfs
 	 get_sb_version (sb) == REISERFS_FORMAT_3_6))
 	return REISERFS_FORMAT_3_6;
 
+    if (is_reiserfs_3_7_magic_string (sb))
+	return REISERFS_FORMAT_3_7;
+
     return REISERFS_FORMAT_UNKNOWN;
 }
 
@@ -268,6 +288,7 @@ int reiserfs_super_block_size (struct re
     case REISERFS_FORMAT_3_5:
 	return SB_SIZE_V1;
     case REISERFS_FORMAT_3_6:
+    case REISERFS_FORMAT_3_7:
 	return SB_SIZE;
     }
     reiserfs_panic ("Unknown format found");
@@ -345,14 +366,14 @@ char * which_block (int code)
 
 /** */
 int block_of_journal (reiserfs_filsys_t * fs, unsigned long block) {
-    if (!is_reiserfs_jr_magic_string (fs->fs_ondisk_sb)) {
+    if (!has_nonstandard_journal (fs->fs_ondisk_sb)) {
 	/* standard journal */
 	if (block >= get_journal_start_must (fs) &&
 	    block <= get_journal_start_must (fs) + get_jp_journal_size (sb_jp (fs->fs_ondisk_sb)))
 	    return 1;
 	return 0;
     }
-    
+
     if (get_sb_reserved_for_journal (fs->fs_ondisk_sb))
 	/* there is space reserved for the journal on the host device */
 	if (block >= get_journal_start_must (fs) && 
--- a/reiserfscore/prints.c
+++ b/reiserfscore/prints.c
@@ -616,6 +616,7 @@ int print_super_block (FILE * fp, reiser
     __u16 state;
     time_t last_check = get_sb_v2_lastcheck(sb);
     char last_check_buf[26];
+    const char *journal_prefix = NULL;
 
     if (!does_look_like_super_block (sb))
 	return 1;
@@ -633,13 +634,25 @@ int print_super_block (FILE * fp, reiser
 	reiserfs_warning (fp, "format 3.6 with ");
         format = 2;
 	break;
+    case REISERFS_FORMAT_3_7:
+	reiserfs_warning (fp, "format 3.7 with ");
+        format = 2;
+	if (get_jp_journal_dev(&sb->s_v1.sb_journal))
+		journal_prefix = "non-";
+	else
+		journal_prefix = "";
+	break;
     default:
 	reiserfs_warning (fp, "unknown format with ");
 	break;
     }
-    if (is_reiserfs_jr_magic_string (sb))
-	reiserfs_warning (fp, "non-");
-    reiserfs_warning (fp, "standard journal\n");
+    if (!journal_prefix) {
+	    if (is_reiserfs_jr_magic_string (sb))
+		    journal_prefix = "non-";
+	    else
+		    journal_prefix = "";
+    }
+    reiserfs_warning (fp, "%sstandard journal\n", journal_prefix);
     if (short_print) {
 	reiserfs_warning (fp, "Blocks (total/free): %u/%u by %d bytes\n",
 		get_sb_block_count (sb), get_sb_free_blocks (sb), get_sb_block_size (sb));
@@ -677,7 +690,7 @@ int print_super_block (FILE * fp, reiser
 	reiserfs_warning (fp, "\tI/O corruptions exist.\n");
 
     reiserfs_warning (fp, "sb_version: %u\n", get_sb_version (sb));
-    if (format == 2) {
+    if (get_reiserfs_format(sb) >= REISERFS_FORMAT_3_6) {
         reiserfs_warning (fp, "inode generation number: %u\n", get_sb_v2_inode_generation (sb));
         reiserfs_warning (fp, "UUID: %U\n", sb->s_uuid);
         reiserfs_warning (fp, "LABEL: %.16s\n", sb->s_label);
@@ -710,6 +723,26 @@ int print_super_block (FILE * fp, reiser
 	else
 		reiserfs_warning(fp, "Disabled. Run fsck.reiserfs(8) or use tunefs.reiserfs(8) to enable.\n");
     }
+    if (get_reiserfs_format(sb) == REISERFS_FORMAT_3_7) {
+	    const char *features;
+	    features = reiserfs_features_to_string(REISERFS_FEATURE_INCOMPAT,
+					    get_sb_v2_feature_incompat(sb));
+	    if (!features[0])
+		features = "(none)";
+	    reiserfs_warning (fp, "Incompatible features: %s\n", features);
+
+	    features = reiserfs_features_to_string( REISERFS_FEATURE_RO_COMPAT,
+					    get_sb_v2_feature_ro_compat(sb));
+	    if (!features[0])
+		features = "(none)";
+	    reiserfs_warning (fp, "RO-compatible features: %s\n", features);
+
+	    features = reiserfs_features_to_string( REISERFS_FEATURE_COMPAT,
+					    get_sb_v2_feature_compat(sb));
+	    if (!features[0])
+		features = "(none)";
+	    reiserfs_warning (fp, "Compatible features: %s\n", features);
+    }
 
     return 0;
 }
@@ -983,7 +1016,8 @@ void print_objectid_map (FILE * fp, reis
 
 
     sb = fs->fs_ondisk_sb;
-    if (fs->fs_format == REISERFS_FORMAT_3_6)
+    if (fs->fs_format == REISERFS_FORMAT_3_6 ||
+	fs->fs_format == REISERFS_FORMAT_3_7)
 	omap = (__u32 *)(sb + 1);
     else if (fs->fs_format == REISERFS_FORMAT_3_5)
 	omap = (__u32 *)((struct reiserfs_super_block_v1 *)sb + 1);
--- a/reiserfscore/reiserfslib.c
+++ b/reiserfscore/reiserfslib.c
@@ -274,6 +274,14 @@ reiserfs_filsys_t * reiserfs_create (cha
         memcpy (fs->fs_ondisk_sb->s_v1.s_magic, REISERFS_3_6_SUPER_MAGIC_STRING,
                 strlen (REISERFS_3_6_SUPER_MAGIC_STRING));
 	break;
+    case REISERFS_FORMAT_3_7:
+	set_sb_oid_maxsize (fs->fs_ondisk_sb,
+	    (block_size - SB_SIZE) / sizeof(__u32) / 2 * 2);
+	/* sb_oid_cursize */
+	/* sb_state */
+        memcpy (fs->fs_ondisk_sb->s_v1.s_magic, REISERFS_3_7_SUPER_MAGIC_STRING,
+                strlen (REISERFS_3_7_SUPER_MAGIC_STRING));
+	break;
     }
     if (!default_journal)
         memcpy (fs->fs_ondisk_sb->s_v1.s_magic, REISERFS_JR_SUPER_MAGIC_STRING,
--- a/tune/reiserfstune.8
+++ b/tune/reiserfstune.8
@@ -1,7 +1,7 @@
 .\" -*- nroff -*-
 .\" Copyright 1996-2004 Hans Reiser.
 .\" 
-.TH REISERFSTUNE 8 "January 2009" "Reiserfsprogs-3.6.21"
+.TH REISERFSTUNE 8 "November 2010" "Reiserfsprogs-3.6.21"
 .SH NAME
 reiserfstune \- The tunning tool for the ReiserFS filesystem.
 .SH SYNOPSIS
@@ -22,6 +22,7 @@ reiserfstune \- The tunning tool for the
 [ \fB-C\fR | \fB--time-last-checked \fItimestamp\fR ]
 [ \fB-m\fR | \fB--max-mnt-count \fIcount\fR ]
 [ \fB-M\fR | \fB--mnt-count \fIcount\fR ]
+[ \fB-O\fR | \fB--feature \fIfeature\fR ]
 .I device
 .SH DESCRIPTION
 \fBreiserfstune\fR is used for tuning the ReiserFS. It can change two journal 
@@ -191,6 +192,14 @@ option,
 .BR fsck.reiserfs(8)
 will check the filesystem at the next
 reboot.
+.TP
+\fB-O\fR | \fB--feature \fIfeature\fR
+Enable, or disable by prefixing
+.B \-
+to \fIfeature\fR, an optional filesystem feature.
+Optional filesystem features may not be supported on all systems but allow
+extended functionality beyond that offered by the standard format.
+NOTE: This option is only available for v3.7 format filesystems.
 .SH POSSIBLE SCENARIOS OF USING REISERFSTUNE:
 1. You have ReiserFS on /dev/hda1, and you wish to have
 it working with its journal on the device /dev/journal
--- a/tune/tune.c
+++ b/tune/tune.c
@@ -67,6 +67,7 @@ static void print_usage_and_exit(void)
 	     "  -M | --mnt-count\t\tset the number of times the filesystem\n"
 	     "                  \t\thas been mounted\n"
 	     "  -h | --help\t\t\tprint help and exit\n"
+	     "  -O | --feature\t\t\tenable or disable (with -feature) feature\n"
 	     "  -V\t\t\t\tprint version and exit\n", program_name);
     exit (1);
 }
@@ -88,7 +89,8 @@ char * badblocks_file;
 /* If specified paramenters defines the standard journal, make it standard. */
 static int should_make_journal_standard (reiserfs_filsys_t * fs, char * j_new_dev_name)
 {
-    if (!is_reiserfs_jr_magic_string (fs->fs_ondisk_sb))
+    if (!is_reiserfs_jr_magic_string (fs->fs_ondisk_sb) &&
+	!is_reiserfs_3_7_magic_string (fs->fs_ondisk_sb))
 	return 0;
 /*    
     if (!user_confirmed (stderr, "ATTENTION! Filesystem with non-standard journal "
@@ -131,12 +133,15 @@ static int set_standard_journal_params (
 
     /* ondisk superblock update */
 
-    if (get_sb_version(fs->fs_ondisk_sb) == 0)
+    if (get_sb_version(fs->fs_ondisk_sb) == REISERFS_FORMAT_3_5)
 	memcpy (fs->fs_ondisk_sb->s_v1.s_magic, REISERFS_3_5_SUPER_MAGIC_STRING,
 		strlen (REISERFS_3_5_SUPER_MAGIC_STRING));
-    else if (get_sb_version(fs->fs_ondisk_sb) == 2)
+    else if (get_sb_version(fs->fs_ondisk_sb) == REISERFS_FORMAT_3_6)
 	memcpy (fs->fs_ondisk_sb->s_v1.s_magic, REISERFS_3_6_SUPER_MAGIC_STRING,
 		strlen (REISERFS_3_6_SUPER_MAGIC_STRING));
+    else if (get_sb_version(fs->fs_ondisk_sb) == REISERFS_FORMAT_3_7)
+	memcpy (fs->fs_ondisk_sb->s_v1.s_magic, REISERFS_3_7_SUPER_MAGIC_STRING,
+		strlen (REISERFS_3_7_SUPER_MAGIC_STRING));
     else {
 	message ("Can not set standard reiserfs magic: unknown format found %u,"
 		 " try reiserfsck first", get_sb_version(fs->fs_ondisk_sb));
@@ -250,6 +255,73 @@ static void set_mnt_count(char *str)
 	Mnt_count = str2int(str);
 }
 
+char features[3][32];
+unsigned int features_ok_to_set[3] = {
+	[REISERFS_FEATURE_INCOMPAT] = REISERFS_FEATURE_INCOMPAT_SUPP,
+	[REISERFS_FEATURE_RO_COMPAT] = REISERFS_FEATURE_RO_COMPAT_SUPP,
+	[REISERFS_FEATURE_COMPAT] = REISERFS_FEATURE_COMPAT_SUPP,
+};
+
+unsigned int features_ok_to_clear[3] = {
+	[REISERFS_FEATURE_INCOMPAT] = 0,
+	[REISERFS_FEATURE_RO_COMPAT] = 0,
+	[REISERFS_FEATURE_COMPAT] = 0,
+};
+
+static void set_features(char *str)
+{
+	char *feature;
+	while ((feature = strsep(&str, ","))) {
+		int compat;
+		unsigned int mask;
+		int fnum;
+		int ret;
+		int neg = 0;
+		if (feature[0] == '-') {
+			neg = 1;
+			feature++;
+		}
+
+		ret = reiserfs_string_to_feature(feature, &compat, &mask);
+		if (ret) {
+			printf("Invalid feature name %s\n", feature);
+			continue;
+		}
+		for (fnum = 0; mask >>= 1; fnum++);
+
+		features[compat][fnum] = neg ? 2 : 1;
+
+		if (Force)
+			continue;
+		if (neg && !(features_ok_to_clear[compat] & mask)) {
+			message("Feature %s is not allowed to be cleared\n",
+				feature);
+			exit(1);
+		} else if (!neg && !(features_ok_to_set[compat] & mask)) {
+			message("Feature %s is not allowed to be set\n",
+				feature);
+			exit(1);
+		}
+	}
+}
+
+int Convert;
+int Convert_format;
+static void set_convert(char *str)
+{
+    Convert = 1;
+    if (!strcmp(str, "3.7"))
+	Convert_format = REISERFS_FORMAT_3_7;
+    else if (!strcmp(str, "3.6"))
+	Convert_format = REISERFS_FORMAT_3_6;
+    else if (!strcmp(str, "3.5"))
+	Convert_format = REISERFS_FORMAT_3_5;
+    else {
+	message("Invalid format \"%s\" specified. Exiting.\n", str);
+	exit(1);
+    }
+}
+
 static void set_check_interval(char *str)
 {
 	if (!strcmp(str, "disable"))
@@ -380,6 +452,7 @@ int main (int argc, char **argv)
     struct reiserfs_journal_header * j_head;
     reiserfs_trans_t old, new;
     int Is_journal_or_maxtrans_size_specified = 0;
+    int need_dirty = 0;
 
     program_name = strrchr( argv[ 0 ], '/' );
 
@@ -417,11 +490,13 @@ int main (int argc, char **argv)
 	    {"time-last-checked", required_argument, 0, 'C'},
 	    {"max-mount-count", required_argument, 0, 'm'},
 	    {"mount-count", required_argument, 0, 'M'},
+	    {"feature", required_argument, 0, 'O'},
+	    {"convert", required_argument, 0, 'Z'},
 	    {0, 0, 0, 0}
 	};
 	int option_index;
       
-	c = getopt_long (argc, argv, "hj:s:t:o:fu:l:b:B:Vc:C:m:M:",
+	c = getopt_long (argc, argv, "hj:s:t:o:fu:l:b:B:Vc:C:m:M:O:",
 			 options, &option_index);
 	if (c == -1)
 	    break;
@@ -511,6 +586,14 @@ int main (int argc, char **argv)
 	case 'M':
 	    set_mnt_count(optarg);
 	    break;
+	case 'O':
+	    set_features(optarg);
+	    break;
+
+	case 'Z':
+	    set_convert(optarg);
+	    break;
+
 
 #if 0
 	case 'J': /* --journal-new-device */
@@ -633,8 +716,8 @@ int main (int argc, char **argv)
     }
 
     /* set UUID and LABEL if specified */
-    if (fs->fs_format == REISERFS_FORMAT_3_6) {
-	int need_dirty = 0;
+    if (fs->fs_format == REISERFS_FORMAT_3_6 ||
+	fs->fs_format == REISERFS_FORMAT_3_7) {
 #if defined(HAVE_LIBUUID) && defined(HAVE_UUID_UUID_H)
         if (!uuid_is_null(UUID)) {
 	    memcpy (fs->fs_ondisk_sb->s_uuid, UUID, 16);
@@ -677,10 +760,6 @@ int main (int argc, char **argv)
 		need_dirty = 1;
 	}
 
-	if (need_dirty) {
-	    mark_buffer_dirty (fs->fs_super_bh);
-	    fs->fs_dirt = 1;
-	}
     } else {
 #if defined(HAVE_LIBUUID) && defined(HAVE_UUID_UUID_H)
         if (!uuid_is_null(UUID))
@@ -695,6 +774,83 @@ int main (int argc, char **argv)
 	    reiserfs_exit (1, "check-interval cannot be specified for 3.5 format\n");
     }
 
+    if (Convert) {
+	    struct reiserfs_super_block *sb = fs->fs_ondisk_sb;
+	    if (fs->fs_format == REISERFS_FORMAT_3_6 &&
+		Convert_format == REISERFS_FORMAT_3_7) {
+		    set_sb_version (sb, REISERFS_FORMAT_3_7);
+		    memcpy (sb->s_v1.s_magic, REISERFS_3_7_SUPER_MAGIC_STRING,
+			    strlen (REISERFS_3_7_SUPER_MAGIC_STRING));
+		    sb->s_feature_incompat = 0;
+		    sb->s_feature_compat = 0;
+		    sb->s_feature_ro_compat = 0;
+		    fs->fs_format = REISERFS_FORMAT_3_7;
+		    need_dirty = 1;
+	    } else if (fs->fs_format == REISERFS_FORMAT_3_7 &&
+		       Convert_format == REISERFS_FORMAT_3_6) {
+		    if (sb->s_feature_incompat || sb->s_feature_compat ||
+			sb->s_feature_ro_compat) {
+			reiserfs_exit (1, "cannot convert v3.7 filesystem to v3.6 with optional features in use.\n");
+		    }
+
+		    if (get_jp_journal_dev(&sb->s_v1.sb_journal) != 0) {
+			memcpy (sb->s_v1.s_magic,
+				REISERFS_JR_SUPER_MAGIC_STRING,
+				strlen (REISERFS_JR_SUPER_MAGIC_STRING));
+		    } else {
+			memcpy (sb->s_v1.s_magic,
+				REISERFS_3_6_SUPER_MAGIC_STRING,
+				strlen (REISERFS_3_6_SUPER_MAGIC_STRING));
+		    }
+
+		    set_sb_version (sb, REISERFS_FORMAT_3_6);
+		    fs->fs_format = REISERFS_FORMAT_3_6;
+	    }
+    }
+
+    if (fs->fs_format == REISERFS_FORMAT_3_7) {
+	int i;
+	for (i = 0; i < 32; i++) {
+	    if (features[REISERFS_FEATURE_INCOMPAT][i] == 1) {
+		REISERFS_SET_INCOMPAT_FEATURE(fs->fs_ondisk_sb, 1 << i);
+		need_dirty = 1;
+	    }
+	    if (features[REISERFS_FEATURE_INCOMPAT][i] == 2) {
+		REISERFS_CLEAR_INCOMPAT_FEATURE(fs->fs_ondisk_sb, 1 << i);
+		need_dirty = 1;
+	    }
+	    if (features[REISERFS_FEATURE_COMPAT][i] == 1) {
+		REISERFS_SET_COMPAT_FEATURE(fs->fs_ondisk_sb, 1 << i);
+		need_dirty = 1;
+	    }
+	    if (features[REISERFS_FEATURE_COMPAT][i] == 2) {
+		REISERFS_CLEAR_COMPAT_FEATURE(fs->fs_ondisk_sb, 1 << i);
+		need_dirty = 1;
+	    }
+	    if (features[REISERFS_FEATURE_RO_COMPAT][i] == 1) {
+		REISERFS_SET_RO_COMPAT_FEATURE(fs->fs_ondisk_sb, 1 << i);
+		need_dirty = 1;
+	    }
+	    if (features[REISERFS_FEATURE_RO_COMPAT][i] == 2) {
+		REISERFS_CLEAR_RO_COMPAT_FEATURE(fs->fs_ondisk_sb, 1 << i);
+		need_dirty = 1;
+	    }
+	}
+    } else {
+	int i;
+	for (i = 0; i < 32; i++) {
+	    if (features[REISERFS_FEATURE_INCOMPAT][i] ||
+		features[REISERFS_FEATURE_COMPAT][i] ||
+		features[REISERFS_FEATURE_RO_COMPAT][i])
+		reiserfs_exit(1, "optional features are only available on v3.7 format filesystems\n");
+
+	}
+    }
+
+    if (need_dirty) {
+	mark_buffer_dirty (fs->fs_super_bh);
+	fs->fs_dirt = 1;
+    }
 
     if (!j_new_device_name) {
 	
@@ -759,15 +915,13 @@ int main (int argc, char **argv)
 	/* we have to put journal on main device. It is only possible if there
 	   is enough space reserved by mkreiserfs */
 
-	if (!is_reiserfs_jr_magic_string (fs->fs_ondisk_sb))
-	    /* standard journal */
+	if (!has_nonstandard_journal (fs->fs_ondisk_sb))
 	    reserved = get_jp_journal_size(sb_jp(fs->fs_ondisk_sb)) + 1;
 	else
-	    /* non-standard journal */
 	    reserved = get_sb_reserved_for_journal (fs->fs_ondisk_sb);
-		
+
 	journal_size = Journal_size;
-	
+
 	if (!journal_size) {
 	    journal_size = journal_default_size(fs->fs_super_bh->b_blocknr, fs->fs_blocksize) + 1;
 	    message("Journal size has not been specified. Assuming it is the default size (%lu)", 
@@ -791,7 +945,7 @@ int main (int argc, char **argv)
     message ("Current journal parameters:");
     print_journal_params (stdout, sb_jp (fs->fs_ondisk_sb));
 
-    if (!is_reiserfs_jr_magic_string (fs->fs_ondisk_sb)) {
+    if (!has_nonstandard_journal (fs->fs_ondisk_sb)) {
 	/* we have standard journal, so check if we can convert it
 	   to non-standard one */
 	
@@ -802,7 +956,9 @@ int main (int argc, char **argv)
 	}
 	*/
 	
-        if (is_reiserfs_3_6_magic_string (fs->fs_ondisk_sb))
+        if (is_reiserfs_3_7_magic_string (fs->fs_ondisk_sb))
+	    set_sb_version (fs->fs_ondisk_sb, REISERFS_FORMAT_3_7);
+        else if (is_reiserfs_3_6_magic_string (fs->fs_ondisk_sb))
 	    set_sb_version (fs->fs_ondisk_sb, REISERFS_FORMAT_3_6);
         else if (is_reiserfs_3_5_magic_string (fs->fs_ondisk_sb))
 	    set_sb_version (fs->fs_ondisk_sb, REISERFS_FORMAT_3_5);
-- 
Jeff Mahoney
SUSE Labs
