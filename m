From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: implement basic reiserfs 3.7
Date: Sat, 20 Nov 2010 11:06:51 -0500
Message-ID: <4CE7F21B.4050605@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

 This patch contains the basic implementation for reiserfs 3.7.

 Specifically, it extends reiserfs 3.6 to allow feature compatibility bits.
 Since it extends v3.6, it assumes allowing a nonstandard journal, so some
 paths have been adjusted to test for a nonstandard journal instead of
 just having the JR superblock magic.

 I don't have any large plans to extend beyond some very basic features,
 although extended attributes would be much more efficiently implemented
 if they were first class items instead of hidden files.

 The next patch in the series adds support to allow v2 stat data items
 to describe the number of blocks in fs-blocksize blocks instead of
 512 byte blocks.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/journal.c          |    2 
 fs/reiserfs/prints.c           |    6 +
 fs/reiserfs/procfs.c           |    4 -
 fs/reiserfs/super.c            |  140 ++++++++++++++++++++++++++++++++++++++++-
 include/linux/magic.h          |    1 
 include/linux/reiserfs_fs.h    |   11 ++-
 include/linux/reiserfs_fs_sb.h |   39 +++++++++++
 7 files changed, 196 insertions(+), 7 deletions(-)

--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2850,7 +2850,7 @@ int journal_init(struct super_block *sb,
 	jh = (struct reiserfs_journal_header *)(bhjh->b_data);
 
 	/* make sure that journal matches to the super block */
-	if (is_reiserfs_jr(rs)
+	if (has_nonstandard_journal(rs)
 	    && (le32_to_cpu(jh->jh_journal.jp_journal_magic) !=
 		sb_jp_journal_magic(rs))) {
 		reiserfs_warning(sb, "sh-460",
--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -532,6 +532,8 @@ static int print_super_block(struct buff
 	} else if (is_reiserfs_jr(rs)) {
 		version = ((sb_version(rs) == REISERFS_VERSION_2) ?
 			   "3.6" : "3.5");
+	} else if (is_reiserfs_3_7(rs)) {
+		version = "3.7";
 	} else {
 		return 1;
 	}
@@ -547,12 +549,12 @@ static int print_super_block(struct buff
 //    skipped = (bh->b_blocknr * bh->b_size) / sb_blocksize(rs);
 	skipped = bh->b_blocknr;
 	data_blocks = sb_block_count(rs) - skipped - 1 - sb_bmap_nr(rs) -
-	    (!is_reiserfs_jr(rs) ? sb_jp_journal_size(rs) +
+	    (!has_nonstandard_journal(rs) ? sb_jp_journal_size(rs) +
 	     1 : sb_reserved_for_journal(rs)) - sb_free_blocks(rs);
 	printk
 	    ("Busy blocks (skipped %d, bitmaps - %d, journal (or reserved) blocks - %d\n"
 	     "1 super block, %d data blocks\n", skipped, sb_bmap_nr(rs),
-	     (!is_reiserfs_jr(rs) ? (sb_jp_journal_size(rs) + 1) :
+	     (!has_nonstandard_journal(rs) ? (sb_jp_journal_size(rs) + 1) :
 	      sb_reserved_for_journal(rs)), data_blocks);
 	printk("Root block %u\n", sb_root_block(rs));
 	printk("Journal block (first) %d\n", sb_jp_journal_1st_block(rs));
--- a/fs/reiserfs/procfs.c
+++ b/fs/reiserfs/procfs.c
@@ -28,7 +28,9 @@ static int show_version(struct seq_file
 {
 	char *format;
 
-	if (REISERFS_SB(sb)->s_properties & (1 << REISERFS_3_6)) {
+	if (REISERFS_SB(sb)->s_properties & (1 << REISERFS_3_7)) {
+		format = "3.7";
+	} else if (REISERFS_SB(sb)->s_properties & (1 << REISERFS_3_6)) {
 		format = "3.6";
 	} else if (REISERFS_SB(sb)->s_properties & (1 << REISERFS_3_5)) {
 		format = "3.5";
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -35,6 +35,7 @@ struct file_system_type reiserfs_fs_type
 static const char reiserfs_3_5_magic_string[] = REISERFS_SUPER_MAGIC_STRING;
 static const char reiserfs_3_6_magic_string[] = REISER2FS_SUPER_MAGIC_STRING;
 static const char reiserfs_jr_magic_string[] = REISER2FS_JR_SUPER_MAGIC_STRING;
+static const char reiserfs_3_7_magic_string[] = REISERFS_37_SUPER_MAGIC_STRING;
 
 int is_reiserfs_3_5(struct reiserfs_super_block *rs)
 {
@@ -48,6 +49,12 @@ int is_reiserfs_3_6(struct reiserfs_supe
 			strlen(reiserfs_3_6_magic_string));
 }
 
+int is_reiserfs_3_7(struct reiserfs_super_block *rs)
+{
+	return !strncmp(rs->s_v1.s_magic, reiserfs_3_7_magic_string,
+			strlen(reiserfs_3_7_magic_string));
+}
+
 int is_reiserfs_jr(struct reiserfs_super_block *rs)
 {
 	return !strncmp(rs->s_v1.s_magic, reiserfs_jr_magic_string,
@@ -57,7 +64,13 @@ int is_reiserfs_jr(struct reiserfs_super
 static int is_any_reiserfs_magic_string(struct reiserfs_super_block *rs)
 {
 	return (is_reiserfs_3_5(rs) || is_reiserfs_3_6(rs) ||
-		is_reiserfs_jr(rs));
+		is_reiserfs_3_7(rs) || is_reiserfs_jr(rs));
+}
+
+int has_nonstandard_journal(struct reiserfs_super_block *rs)
+{
+	return is_reiserfs_jr(rs) ||
+	       (is_reiserfs_3_7(rs) && rs->s_v1.s_journal.jp_journal_dev);
 }
 
 static int reiserfs_remount(struct super_block *s, int *flags, char *data);
@@ -1397,6 +1410,10 @@ static int read_super_block(struct super
 					 "non-standard magic", sb_version(rs));
 			return 1;
 		}
+	} else if (is_reiserfs_3_7(rs)) {
+		reiserfs_info(s, "found reiserfs format \"3.7\" "
+			      "with %sstandard journal\n",
+			      sb_jp_journal_dev(rs) ? "non-" : "");
 	} else
 		/* s_version of standard format may contain incorrect information,
 		   so we just look at the magic string */
@@ -1404,6 +1421,7 @@ static int read_super_block(struct super
 			      "found reiserfs format \"%s\" with standard journal\n",
 			      is_reiserfs_3_5(rs) ? "3.5" : "3.6");
 
+
 	s->s_op = &reiserfs_sops;
 	s->s_export_op = &reiserfs_export_ops;
 #ifdef CONFIG_QUOTA
@@ -1608,6 +1626,120 @@ static int function2code(hashf_t func)
 	return 0;
 }
 
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
+enum {
+	REISERFS_FEATURE_INCOMPAT,
+	REISERFS_FEATURE_COMPAT,
+	REISERFS_FEATURE_RO_COMPAT,
+};
+
+static const char *feature_to_string(int compat, unsigned int mask)
+{
+	struct feature *f;
+	char prefix;
+	int fnum;
+
+	for (f = feature_list; f->string; f++) {
+		if ((compat == f->compat) &&
+		    (mask == f->mask))
+			return kstrdup(f->string, GFP_KERNEL);
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
+	return kasprintf(GFP_KERNEL, "FEATURE_%c%d", prefix, fnum);
+}
+
+static const char *features_to_string(int compat, unsigned int mask)
+{
+	int i, first = 1;
+	char *ptr = "";
+
+	for (i = 0; i < 32; i++) {
+		if (mask & (1 << i)) {
+			char *new;
+			const char *f = feature_to_string(compat, 1 << i);
+			if (!f)
+				return NULL;
+			if (first) {
+				ptr = (char *)f;
+				first = 0;
+				continue;
+			}
+
+			new = kasprintf(GFP_KERNEL, "%s,%s", ptr, f);
+			kfree(f);
+			kfree(ptr);
+			if (!new) {
+				return NULL;
+			}
+			ptr = new;
+		}
+	}
+
+	return ptr;
+}
+static int
+check_feature_fields(struct super_block *sb)
+{
+	struct reiserfs_super_block *rs = REISERFS_SB(sb)->s_rs;
+	__le32 features;
+	const char *fnames;
+
+	if (!is_reiserfs_3_7(rs) && (rs->s_feature_compat ||
+				     rs->s_feature_incompat ||
+				     rs->s_feature_ro_compat))
+		reiserfs_warning(sb, NULL, "feature flags set on reiserfs "
+				 "version prior to v3.7, running reiserfsck is "
+				 "recommended.");
+	features = REISERFS_HAS_INCOMPAT_FEATURE(sb,
+					~REISERFS_FEATURE_INCOMPAT_SUPP);
+	if (features) {
+		fnames = features_to_string(REISERFS_FEATURE_INCOMPAT,
+					    features);
+		reiserfs_warning(sb, NULL, "couldn't mount because of "
+				 "unsupported optional features: %s\n",
+				 fnames);
+		kfree(fnames);
+		return -EINVAL;
+	}
+
+	features = REISERFS_HAS_RO_COMPAT_FEATURE(sb,
+					~REISERFS_FEATURE_RO_COMPAT_SUPP);
+	if (features && !(sb->s_flags & MS_RDONLY)) {
+		fnames = features_to_string(REISERFS_FEATURE_RO_COMPAT,
+					    features);
+		reiserfs_warning(sb, NULL, "couldn't mount read-write because "
+			         "of unsupported optional features: %s\n",
+				 fnames);
+		kfree(fnames);
+
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 #define SWARN(silent, s, id, ...)			\
 	if (!(silent))				\
 		reiserfs_warning(s, id, __VA_ARGS__)
@@ -1703,6 +1835,10 @@ static int reiserfs_fill_super(struct su
 		goto error;
 	}
 
+	errval = check_feature_fields(s);
+	if (errval)
+		goto error;
+
 	sbi->s_mount_state = SB_REISERFS_STATE(s);
 	sbi->s_mount_state = REISERFS_VALID_FS;
 
@@ -1789,6 +1925,8 @@ static int reiserfs_fill_super(struct su
 		set_bit(REISERFS_3_5, &(sbi->s_properties));
 	else if (old_format)
 		set_bit(REISERFS_OLD_FORMAT, &(sbi->s_properties));
+	else if (is_reiserfs_3_7(rs))
+		set_bit(REISERFS_3_7, &(sbi->s_properties));
 	else
 		set_bit(REISERFS_3_6, &(sbi->s_properties));
 
--- a/include/linux/magic.h
+++ b/include/linux/magic.h
@@ -46,6 +46,7 @@
 #define REISERFS_SUPER_MAGIC_STRING	"ReIsErFs"
 #define REISER2FS_SUPER_MAGIC_STRING	"ReIsEr2Fs"
 #define REISER2FS_JR_SUPER_MAGIC_STRING	"ReIsEr3Fs"
+#define REISERFS_37_SUPER_MAGIC_STRING	"ReIsEr7Fs"
 
 #define SMB_SUPER_MAGIC		0x517B
 #define USBDEVICE_SUPER_MAGIC	0x9fa2
--- a/include/linux/reiserfs_fs.h
+++ b/include/linux/reiserfs_fs.h
@@ -263,7 +263,7 @@ struct reiserfs_super_block_v1 {
 	__le16 s_bmap_nr;	/* amount of bitmap blocks needed to address
 				 * each block of file system */
 	__le16 s_version;	/* this field is only reliable on filesystem
-				 * with non-standard journal */
+				 * with non-standard journal or reiserfs 3.7 */
 	__le16 s_reserved_for_journal;	/* size in blocks of journal area on main
 					 * device, we need to keep after
 					 * making fs with non-standard journal */
@@ -282,7 +282,11 @@ struct reiserfs_super_block {
 	__le16 s_max_mnt_count;		/* Maximum mounts before check */
 	__le32 s_lastcheck;		/* Timestamp of last fsck */
 	__le32 s_check_interval;	/* Interval between checks */
-	char s_unused[76];	/* zero filled by mkreiserfs and
+	/* Only available in superblock v3/reiserfs 3.7 */
+	__le32 s_feature_compat;	/* compatible feature set */
+	__le32 s_feature_incompat;	/* incompatible feature set */
+	__le32 s_feature_ro_compat;	/* readonly-compatible feature set */
+	char s_unused[64];	/* zero filled by mkreiserfs and
 				 * reiserfs_convert_objectid_map_v1()
 				 * so any additions must be updated
 				 * there as well. */
@@ -292,6 +296,7 @@ struct reiserfs_super_block {
 
 #define REISERFS_VERSION_1 0
 #define REISERFS_VERSION_2 2
+#define REISERFS_VERSION_3 3
 
 // on-disk super block fields converted to cpu form
 #define SB_DISK_SUPER_BLOCK(s) (REISERFS_SB(s)->s_rs)
@@ -347,6 +352,8 @@ struct reiserfs_super_block {
 int is_reiserfs_3_5(struct reiserfs_super_block *rs);
 int is_reiserfs_3_6(struct reiserfs_super_block *rs);
 int is_reiserfs_jr(struct reiserfs_super_block *rs);
+int is_reiserfs_3_7(struct reiserfs_super_block *rs);
+int has_nonstandard_journal(struct reiserfs_super_block *rs);
 
 /* ReiserFS leaves the first 64k unused, so that partition labels have
    enough space.  If someone wants to write a fancy bootloader that
--- a/include/linux/reiserfs_fs_sb.h
+++ b/include/linux/reiserfs_fs_sb.h
@@ -83,6 +83,17 @@ typedef enum {
 #define set_sb_reserved_for_journal(sbp,v) \
               ((sbp)->s_v1.s_reserved_for_journal = cpu_to_le16(v))
 
+#define sb_feature_compat(sbp)	   (le32_to_cpu((sbp)->s_feature_compat))
+#define set_sb_feature_compat(sbp) ((sbp)->s_feature_compat = cpu_to_le32(v))
+
+#define sb_feature_incompat(sbp)   (le32_to_cpu((sbp)->s_feature_incompat))
+#define set_sb_feature_incompat(sbp) \
+				((sbp)->s_feature_incompat = cpu_to_le32(v))
+
+#define sb_feature_ro_compat(sbp)   (le32_to_cpu((sbp)->s_feature_ro_compat))
+#define set_sb_feature_ro_compat(sbp) \
+				((sbp)->s_feature_ro_compat = cpu_to_le32(v))
+
 /* LOGGING -- */
 
 /* These all interelate for performance.
@@ -434,6 +445,7 @@ struct reiserfs_sb_info {
 #define REISERFS_3_5 0
 #define REISERFS_3_6 1
 #define REISERFS_OLD_FORMAT 2
+#define REISERFS_3_7 3
 
 enum reiserfs_mount_options {
 /* Mount options */
@@ -519,6 +531,33 @@ enum reiserfs_mount_options {
 #define reiserfs_error_panic(s) (REISERFS_SB(s)->s_mount_opt & (1 << REISERFS_ERROR_PANIC))
 #define reiserfs_error_ro(s) (REISERFS_SB(s)->s_mount_opt & (1 << REISERFS_ERROR_RO))
 
+/* reiserfs 3.7 features */
+#define REISERFS_HAS_COMPAT_FEATURE(sb, mask)		\
+	(REISERFS_SB(sb)->s_rs->s_feature_compat & cpu_to_le32(mask))
+#define REISERFS_HAS_INCOMPAT_FEATURE(sb, mask)	\
+	(REISERFS_SB(sb)->s_rs->s_feature_incompat & cpu_to_le32(mask))
+#define REISERFS_HAS_RO_COMPAT_FEATURE(sb, mask)	\
+	(REISERFS_SB(sb)->s_rs->s_feature_ro_compat & cpu_to_le32(mask))
+
+#define REISERFS_SET_COMPAT_FEATURE(sb, mask)		\
+	(REISERFS_SB(sb)->s_rs->s_feature_compat |= cpu_to_le32(mask))
+#define REISERFS_SET_INCOMPAT_FEATURE(sb, mask)	\
+	(REISERFS_SB(sb)->s_rs->s_feature_incompat |= cpu_to_le32(mask))
+#define REISERFS_SET_RO_COMPAT_FEATURE(sb, mask)	\
+	(REISERFS_SB(sb)->s_rs->s_feature_ro_compat |= cpu_to_le32(mask))
+
+#define REISERFS_CLEAR_COMPAT_FEATURE(sb, mask)	\
+	(REISERFS_SB(sb)->s_rs->s_feature_compat &= ~cpu_to_le32(mask))
+#define REISERFS_CLEAR_INCOMPAT_FEATURE(sb, mask)	\
+	(REISERFS_SB(sb)->s_rs->s_feature_incompat &= ~cpu_to_le32(mask))
+#define REISERFS_CLEAR_RO_COMPAT_FEATURE(sb, mask)	\
+	(REISERFS_SB(sb)->s_rs->s_feature_ro_compat &= ~cpu_to_le32(mask))
+
+/* No features yet */
+#define REISERFS_FEATURE_COMPAT_SUPP	0
+#define REISERFS_FEATURE_INCOMPAT_SUPP	0
+#define REISERFS_FEATURE_RO_COMPAT_SUPP	0
+
 void reiserfs_file_buffer(struct buffer_head *bh, int list);
 extern struct file_system_type reiserfs_fs_type;
 int reiserfs_resize(struct super_block *, unsigned long);
-- 
Jeff Mahoney
SUSE Labs
