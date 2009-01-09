From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [patch 0/9] reiserfsprogs patch queue
Date: Sat, 10 Jan 2009 01:15:25 +0300
Message-ID: <4967CC7D.7020009@gmail.com>
References: <20080124200226.606635000@suse.com> <4799C193.8010502@gmail.com> <479A03FF.6050702@suse.com> <47E6F5A0.7070308@gmail.com> <47E7112E.1050700@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47E7112E.1050700@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Well, I am about to release reiserfsprogs-3.6.21,
which includes the following changes since 3.6.19:

Jeff Mahoney:
- mkreiserfs-quiet.diff
- reiserfsprogs-large-block-warning.diff
- reiserfsprogs-fsck-mapid.diff
- reiserfsprogs-external-journal-changes.diff
- reiserfsprogs-remove-stupid-fsck_sleep.diff
- reiserfsprogs-mkfs-use-o_excl.diff
- reiserfsprogs-enforce-block-limit.diff
- reiserfsprogs-large-fs.diff
- reiserfsprogs-better-fsck-a-behavior.diff
- reiserfsprogs-remove-dependency-on-asm_unaligned.h.diff

Ludwig Nussel:
- mkreiserfs-set-the-owner-of-the-root-directory-to-the-calling-user.di=
ff

Edward Shishkin:
- mkreiserfs-disable-small-block-sizes.diff

Jeff, do you have something to add here?
Sorry for delay.

Edward.


> Edward Shishkin wrote:
>
> >Jeff Mahoney wrote:
>
> >>Edward Shishkin wrote:
> >>
> >>>Thanks, queued.
> >>>Btw I got compilation errors. Have you missed something?
> >>
> >>
> >>Yeah, I guess I did. It builds fine on my SLES boxes, but not on my
> >>openSUSE machines. I'll them up for that (I need to anyway) and res=
end.
> >>
> >The following makes me think that something is
> >missed (the patch series was applied to 3.6.19):
>
> >main.c: In function `reiserfs_check_auto_state':
> >main.c:971: warning: unsigned int format, long int arg (arg 3)
> >mkreiserfs.c: In function `main':
> >mkreiserfs.c:730: warning: implicit declaration of function=20
> `block_size_ok'
>
>
> This was a missing entry in reiserfs_lib.h. I've attached an updated
> patch that adds it. I've also attached an updated
> reiserfsprogs-better-fsck-a-behavior. The only difference is the
> addition of "#define _XOPEN_SOURCE" for the strptime prototype. There
> was a warning for that too.
>
> >tune.o(.text+0xa86): In function `main':
> >/home/edward/work/reiserfsprogs-3.6.19/tune/tune.c:268: undefined
> >reference to `parse_time'
> >collect2: ld returned 1 exit status
> >make[1]: *** [reiserfstune] Error 1
>
>
> This one looks like you didn't run autoreconf before running
> ./configure. Since I've added files and changed Makefile.am, it needs=
 to
> regenerate the Makefile.in's.
>
> -Jeff
>
> --
> Jeff Mahoney
> SUSE Labs


-------------------------

=46rom: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 1/2] reiserfsprogs: add ext3-style mount count and last=
=20
check expiry for better fsck -a behavior

Currently, fsck.reiserfs -a <dev> performs a full --check scan on every
reiserfs file system during every boot. This is obviously suboptimal, s=
ince
it kills one of the major features of a journaled file system.

This patch adds mount counting and last check expiration to fsck, mkfs,=
 and
debugfs so that we can perform fscks on a user defined schedule.

The defaults are 180 days or 30 mounts before fsck -a results in a full=
=20
scan.

On file systems where this feature hasn't yet been enabled, the fsck -a=
 will
perform a full scan and then mark the superblock with the defaults.

While the mount count won't work with kernels that don't support it, th=
e
timeout obviously will. I'll be following this patch up with a kernel
patch that reserves the fields and updates the mount counts.

This support is super important with multi-terabyte file systems, since
the check is causing huge delays during mount.

Whether or not this patch is immediately accepted into the reiserfsprog=
s
repository, I'd at least like confirmation that I can reserve these fie=
lds
in the superblock for this purpose.

Thanks.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---

configure.in | 2
fsck/fsck.h | 3 -
fsck/main.c | 78 ++++++++++++++++++++++++++++-
fsck/reiserfsck.8 | 10 ++-
include/Makefile.am | 2
include/parse_time.h | 15 +++++
include/reiserfs_fs.h | 25 +++++++++
lib/Makefile.am | 2
lib/parse_time.c | 37 +++++++++++++
reiserfscore/prints.c | 29 ++++++++++
reiserfscore/reiserfslib.c | 7 ++
tune/reiserfstune.8 | 77 ++++++++++++++++++++++++++++
tune/tune.c | 120 +++++++++++++++++++++++++++++++++++++++++++--
13 files changed, 393 insertions(+), 14 deletions(-)

--- a/configure.in 2008-03-23 22:09:31.000000000 -0400
+++ b/configure.in 2008-03-23 22:09:44.000000000 -0400
@@ -105,7 +105,7 @@ AC_FUNC_MEMCMP
AC_FUNC_STRFTIME
AC_FUNC_VPRINTF
AC_CHECK_FUNCS(strerror strstr strtol register_printf_function statfs=20
getmntent\
- hasmntopt memset time uname)
+ hasmntopt memset time uname strptime ctime_r)


dnl Never enable this. It is for debugging only
--- a/fsck/fsck.h 2008-03-23 22:09:31.000000000 -0400
+++ b/fsck/fsck.h 2008-03-23 22:09:44.000000000 -0400
@@ -62,7 +62,8 @@ int main (int argc, char * argv []);
#define OPT_SAVE_PASSES_DUMP 1 << 7
#define OPT_SAVE_ROLLBACK 1 << 8
#define OPT_YES 1 << 9
-#define BADBLOCKS_FILE 1 << 10
+#define BADBLOCKS_FILE 1 << 10
+#define OPT_FORCE 1 << 11


/* pass0.c */
--- a/fsck/main.c 2008-03-23 22:09:31.000000000 -0400
+++ b/fsck/main.c 2008-03-23 22:09:44.000000000 -0400
@@ -8,6 +8,7 @@
#include <sys/resource.h>
#include <sys/mman.h>
#include <signal.h>
+#include <limits.h>

extern int screen_width;
extern int screen_savebuffer_len;
@@ -37,9 +38,10 @@ fsck_progress ("Usage: %s [mode] [option
" -z | --adjust-size\t\tfix file sizes to real size\n" \
" -q | --quiet\t\t\tno speed info\n" \
" -y | --yes\t\t\tno confirmations\n" \
+" -f | --force\t\tforce checking even if the file system is marked=20
clean\n"\
" -V\t\t\t\tprints version and exits\n" \
" -a and -p\t\t\tsome light-weight auto checks for bootup\n" \
-" -f and -r\t\t\tignored\n" \
+" -r\t\t\tignored\n" \
"Expert options:\n" \
" --no-journal-available\tdo not open nor replay journal\n" \
" -S | --scan-whole-partition\tbuild tree of all blocks of the=20
device\n\n", \
@@ -103,6 +105,7 @@ static char * parse_options (struct fsck
{"adjust-size", no_argument, 0, 'z'},
{"quiet", no_argument, 0, 'q'},
{"yes", no_argument, 0, 'y'},
+ {"force", no_argument, 0, 'f'},
{"nolog", no_argument, 0, 'n'},

/* if file exists ad reiserfs can be load of it - only
@@ -233,6 +236,8 @@ static char * parse_options (struct fsck
break;

case 'f':
+ data->options |=3D OPT_FORCE;
+ break;
case 'r': /* ignored */
break;

@@ -665,6 +670,22 @@ static int where_to_start_from (reiserfs
return START_FROM_THE_BEGINNING;
}

+static void reiserfs_update_interval_fields(reiserfs_filsys_t *fs)
+{
+ /* Not supported on v3.5 */
+ if (get_sb_version (fs->fs_ondisk_sb) =3D=3D REISERFS_FORMAT_3_5)
+ return;
+
+ set_sb_v2_lastcheck(fs->fs_ondisk_sb, time(NULL));
+ set_sb_v2_mnt_count(fs->fs_ondisk_sb, 1);
+
+ if (get_sb_v2_max_mnt_count(fs->fs_ondisk_sb) =3D=3D 0)
+ set_sb_v2_max_mnt_count(fs->fs_ondisk_sb,
+ DEFAULT_MAX_MNT_COUNT);
+ if (get_sb_v2_check_interval(fs->fs_ondisk_sb) =3D=3D 0)
+ set_sb_v2_check_interval(fs->fs_ondisk_sb,
+ DEFAULT_CHECK_INTERVAL);
+}

static void mark_filesystem_consistent (reiserfs_filsys_t * fs)
{
@@ -687,6 +708,7 @@ static void mark_filesystem_consistent (

set_sb_umount_state (fs->fs_ondisk_sb, FS_CLEANLY_UMOUNTED);
set_sb_fs_state (fs->fs_ondisk_sb, FS_CONSISTENT);
+ reiserfs_update_interval_fields(fs);

mark_buffer_dirty (fs->fs_super_bh);
}
@@ -924,9 +946,51 @@ static void clean_attributes (reiserfs_f

}

+static int reiserfs_check_auto_state(reiserfs_filsys_t *fs)
+{
+ time_t now =3D time(NULL);
+ time_t lastcheck =3D get_sb_v2_lastcheck(fs->fs_ondisk_sb);
+ unsigned int mnt_count =3D get_sb_v2_mnt_count(fs->fs_ondisk_sb);
+ unsigned int max_mnt_count =3D get_sb_v2_max_mnt_count(fs->fs_ondisk_=
sb);
+ unsigned int interval =3D get_sb_v2_check_interval(fs->fs_ondisk_sb);
+
+ /* v3.5 file systems don't have the superblock fields for this */
+ if (get_sb_version (fs->fs_ondisk_sb) =3D=3D REISERFS_FORMAT_3_5)
+ return 1;
+
+ if (lastcheck =3D=3D 0 || mnt_count =3D=3D 0 || max_mnt_count =3D=3D =
0 ||
+ interval =3D=3D 0) {
+ fprintf(stderr, "File system hasn't been enabled for faster "
+ "boot-time checking. It will be enabled after a "
+ "successful run.\n");
+ return 1;
+ }
+
+ if (interval !=3D UINT_MAX && now > lastcheck + interval) {
+ fprintf(stderr, "File system hasn't been checked in %u days. "
+ "Checking now.\n", (now - lastcheck) / (60*60*24));
+ return 1;
+ }
+
+ if (interval !=3D UINT_MAX && lastcheck > now) {
+ fprintf(stderr, "File system check timestamp is in the future. "
+ "Checking now.\n");
+ return 1;
+ }
+
+ if (mnt_count > max_mnt_count && max_mnt_count !=3D USHRT_MAX) {
+ fprintf(stderr, "File system has been mounted %u times "
+ "without being checked. Checking now.\n", mnt_count);
+ return 1;
+ }
+
+ return 0;
+}
+
static int auto_check (reiserfs_filsys_t *fs) {
__u16 state;
int retval =3D 0;
+ int force =3D fsck_data(fs)->options & OPT_FORCE;

print_super_block (stdout, fs, fs->fs_file_name, fs->fs_super_bh, 1);

@@ -948,7 +1012,12 @@ static int auto_check (reiserfs_filsys_t
fprintf(stderr, "Some strange state was specified in the super block. "
"Do usual check.\n");

+ if (get_sb_umount_state (fs->fs_ondisk_sb) =3D=3D FS_CLEANLY_UMOUNTED=
 &&
+ !force && !reiserfs_check_auto_state(fs))
+ exit(EXIT_OK);
prepare_fs_for_check(fs);
+ if (!force && !reiserfs_check_auto_state(fs))
+ exit(EXIT_OK);

/* Check bitmaps. */
retval =3D reiserfs_open_ondisk_bitmap (fs);
@@ -987,7 +1056,12 @@ static int auto_check (reiserfs_filsys_t
/* run fixable pass. */
return 0;
}
-
+
+ reiserfs_update_interval_fields(fs);
+ mark_buffer_dirty(fs->fs_super_bh);
+ bwrite(fs->fs_super_bh);
+ fs->fs_dirt =3D 1;
+
clean_after_dma_check(fs->fs_dev, &dma_info);

reiserfs_close (fs);
--- a/fsck/reiserfsck.8 2008-03-23 22:09:31.000000000 -0400
+++ b/fsck/reiserfsck.8 2008-03-23 22:09:44.000000000 -0400
@@ -6,7 +6,7 @@
reiserfsck \- The checking tool for the ReiserFS filesystem.
=2ESH SYNOPSIS
=2EB reiserfsck
-[ \fB-afprVy\fR ]
+[ \fB-aprVy\fR ]
[ \fB--rebuild-sb\fR | \fB--check\fR | \fB--fix-fixable\fR
| \fB--rebuild-tree\fR | \fB--clean-attributes\fR ]
=2E\" [ \fB-i\fR | \fB--interactive\fR ]
@@ -17,6 +17,7 @@ reiserfsck \- The checking tool for the
[ \fB-l\fR | \fB--logfile \fIfile\fR ]
[ \fB-q\fR | \fB--quiet\fR ]
[ \fB-y\fR | \fB--yes\fR ]
+[ \fB-f\fR | \fB--force\fR ]
=2E\" [ \fB-b\fR | \fB--scan-marked-in-bitmap \fIbitmap-filename\fR ]
=2E\" [ \fB-h\fR | \fB--hash \fIhash-name\fR ]
=2E\" [ \fB-g\fR | \fB--background\fR ]
@@ -122,11 +123,14 @@ corruption is found set in the superbloc
to the fix-fixable mode. If the flag indicating a fatal corruption is f=
ound
set in the superblock, then \fBreiserfsck\fR finishes with an error.
=2ETP
+.B --force, -f
+Force checking even if the file system seems clean.
+.TP
=2EB -V
This option prints the reiserfsprogs version and then exit.
=2ETP
-\fB-r\fR, \fB-f\fR
-These options are not yet operational and therefore are ignored.
+\fB-r\fR This option does nothing at all; it is provided only for
+backwards compatibility.
=2ESH EXPERT OPTIONS
DO NOT USE THESE OPTIONS UNLESS YOU KNOW WHAT YOU ARE DOING.
WE ARE NOT RESPONSIBLE IF YOU LOSE DATA AS A RESULT OF THESE
--- a/include/Makefile.am 2008-03-23 22:09:31.000000000 -0400
+++ b/include/Makefile.am 2008-03-23 22:09:44.000000000 -0400
@@ -1 +1 @@
-noinst_HEADERS =3D io.h misc.h reiserfs_fs.h reiserfs_lib.h swab.h
+noinst_HEADERS =3D io.h misc.h reiserfs_fs.h reiserfs_lib.h swab.h=20
parse_time.h
--- /dev/null 1970-01-01 00:00:00.000000000 +0000
+++ b/include/parse_time.h 2008-03-23 22:09:44.000000000 -0400
@@ -0,0 +1,15 @@
+/*
+ * Copyright 1996-2004 by Hans Reiser, licensing governed by
+ * reiserfsprogs/README
+ */
+
+/* nothing abount reiserfs here */
+
+#ifndef TIME_H
+#define TIME_H
+
+#include <time.h>
+
+time_t parse_time(char *str);
+
+#endif /* TIME_H */
--- a/include/reiserfs_fs.h 2008-03-23 22:09:31.000000000 -0400
+++ b/include/reiserfs_fs.h 2008-03-23 22:09:44.000000000 -0400
@@ -202,7 +202,11 @@ struct reiserfs_super_block
/* 80 */ __u32 s_flags; /* Right now used only by inode-attributes, if=20
enabled */
/* 84 */ unsigned char s_uuid[16]; /* filesystem unique identifier */
/*100 */ unsigned char s_label[16]; /* filesystem volume label */
-/*116 */ char s_unused[88] ; /* zero filled by mkreiserfs and=20
reiserfs_convert_objectid_map_v1()
+/*116 */ __u16 s_mnt_count;
+/*118 */ __u16 s_max_mnt_count;
+/*120 */ __u32 s_lastcheck;
+/*124 */ __u32 s_check_interval;
+/*128 */ char s_unused[76] ; /* zero filled by mkreiserfs and=20
reiserfs_convert_objectid_map_v1()
* so any additions must be updated there as well. */
/*204*/
} __attribute__ ((__packed__));;
@@ -266,6 +270,22 @@ typedef enum {
#define get_sb_v2_inode_generation(sb) get_le32 (sb, sb_inode_generatio=
n)
#define set_sb_v2_inode_generation(sb,val) set_le32 (sb,=20
sb_inode_generation, val)

+#define get_sb_v2_mnt_count(sb) get_le16 (sb, s_mnt_count)
+#define set_sb_v2_mnt_count(sb,val) set_le16 (sb, s_mnt_count, val)
+
+#define get_sb_v2_max_mnt_count(sb) \
+ get_le16 (sb, s_max_mnt_count)
+#define set_sb_v2_max_mnt_count(sb,val) \
+ set_le16 (sb, s_max_mnt_count, val)
+
+#define get_sb_v2_lastcheck(sb) get_le32 (sb, s_lastcheck)
+#define set_sb_v2_lastcheck(sb,val) set_le32 (sb, s_lastcheck, val)
+
+#define get_sb_v2_check_interval(sb) \
+ get_le32 (sb, s_check_interval)
+#define set_sb_v2_check_interval(sb,val) \
+ set_le32 (sb, s_check_interval, val)
+
#define get_sb_v2_flags(sb) get_le32 (sb, s_flags)
#define set_sb_v2_flags(sb, val) set_le32 (sb, s_flags, val)

@@ -277,6 +297,9 @@ typedef enum {
#define journal_is_relocated(sb) get_jp_journal_dev(sb_jp (sb))
*/

+#define DEFAULT_MAX_MNT_COUNT 30 /* 30 mounts */
+#define DEFAULT_CHECK_INTERVAL (180 * 60 * 60 * 24) /* 180 days */
+
/* these are possible values for sb_fs_state */
#define FS_CONSISTENT 0x0 /* this is set by mkreiserfs and by reiserfsc=
k */
#define FS_ERROR 0x1 /* this is set by the kernel when fsck is wanted. =
*/
--- a/lib/Makefile.am 2008-03-23 22:09:31.000000000 -0400
+++ b/lib/Makefile.am 2008-03-23 22:09:44.000000000 -0400
@@ -1,5 +1,5 @@
noinst_LIBRARIES =3D libmisc.a

-libmisc_a_SOURCES =3D io.c misc.c
+libmisc_a_SOURCES =3D io.c misc.c parse_time.c
##reiserfs.c

--- /dev/null 1970-01-01 00:00:00.000000000 +0000
+++ b/lib/parse_time.c 2008-03-23 22:12:26.000000000 -0400
@@ -0,0 +1,37 @@
+#define _XOPEN_SOURCE
+#ifdef HAVE_CONFIG_H
+#include <config.h>
+#endif
+
+#include "misc.h"
+#include "reiserfs_lib.h"
+
+#include <time.h>
+#include <stdio.h>
+#include <string.h>
+
+time_t parse_time(char *str)
+{
+ struct tm ts;
+
+ if (strcmp(str, "now") =3D=3D 0) {
+ return (time(0));
+ }
+ memset(&ts, 0, sizeof (ts));
+#ifdef HAVE_STRPTIME
+ strptime(str, "%Y%m%d%H%M%S", &ts);
+#else
+ sscanf(str, "%4d%2d%2d%2d%2d%2d", &ts.tm_year, &ts.tm_mon,
+ &ts.tm_mday, &ts.tm_hour, &ts.tm_min, &ts.tm_sec);
+ ts.tm_year -=3D 1900;
+ ts.tm_mon -=3D 1;
+ if (ts.tm_year < 0 || ts.tm_mon < 0 || ts.tm_mon > 11 ||
+ ts.tm_mday < 0 || ts.tm_mday > 31 || ts.tm_hour > 23 ||
+ ts.tm_min > 59 || ts.tm_sec > 61)
+ ts.tm_mday =3D 0;
+#endif
+ if (ts.tm_mday =3D=3D 0)
+ reiserfs_warning(stderr, "Couldn't parse date/time "
+ "specifier: %s", str);
+ return (mktime(&ts));
+}
--- a/reiserfscore/prints.c 2008-03-23 22:09:31.000000000 -0400
+++ b/reiserfscore/prints.c 2008-03-23 22:09:44.000000000 -0400
@@ -9,6 +9,8 @@
#include <stdarg.h>
#include <limits.h>
#include <printf.h>
+#include <limits.h>
+#include <time.h>

#if defined(HAVE_LIBUUID) && defined(HAVE_UUID_UUID_H)
# include <uuid/uuid.h>
@@ -612,6 +614,8 @@ int print_super_block (FILE * fp, reiser
dev_t rdev;
int format =3D 0;
__u16 state;
+ time_t last_check =3D get_sb_v2_lastcheck(sb);
+ char last_check_buf[26];

if (!does_look_like_super_block (sb))
return 1;
@@ -680,6 +684,31 @@ int print_super_block (FILE * fp, reiser
reiserfs_warning (fp, "Set flags in SB:\n");
if ((get_sb_v2_flag (sb, reiserfs_attrs_cleared)))
reiserfs_warning (fp, "\tATTRIBUTES CLEAN\n");
+ reiserfs_warning(fp, "Mount count: %u\n",
+ get_sb_v2_mnt_count(sb));
+ reiserfs_warning(fp, "Maximum mount count: ");
+ if (get_sb_v2_max_mnt_count(sb) &&
+ get_sb_v2_max_mnt_count(sb) !=3D USHRT_MAX)
+ reiserfs_warning(fp, "%u\n", get_sb_v2_max_mnt_count(sb));
+ else if (get_sb_v2_max_mnt_count(sb) =3D=3D USHRT_MAX)
+ reiserfs_warning(fp, "Administratively disabled.\n");
+ else
+ reiserfs_warning(fp, "Disabled. Run fsck.reiserfs(8) or use=20
tunefs.reiserfs(8) to enable.\n");
+ if (last_check) {
+ ctime_r(&last_check, last_check_buf);
+ reiserfs_warning(fp, "Last fsck run: %s", last_check_buf);
+ } else
+ reiserfs_warning(fp, "Last fsck run: Never with a version "
+ "that supports this feature.\n");
+ reiserfs_warning(fp, "Check interval in days: ");
+ if (get_sb_v2_check_interval(sb) &&
+ get_sb_v2_check_interval(sb) !=3D UINT_MAX)
+ reiserfs_warning(fp, "%u\n",
+ get_sb_v2_check_interval(sb) / (24*60*60));
+ else if (get_sb_v2_check_interval(sb) =3D=3D UINT_MAX)
+ reiserfs_warning(fp, "Administratively disabled.\n");
+ else
+ reiserfs_warning(fp, "Disabled. Run fsck.reiserfs(8) or use=20
tunefs.reiserfs(8) to enable.\n");
}

return 0;
--- a/reiserfscore/reiserfslib.c 2008-03-23 22:09:31.000000000 -0400
+++ b/reiserfscore/reiserfslib.c 2008-03-23 22:12:37.000000000 -0400
@@ -7,6 +7,7 @@

#include "includes.h"
#include <linux/kdev_t.h>
+#include <time.h>

struct key root_dir_key =3D {0, 0, {{0, 0},}};
struct key parent_root_dir_key =3D {0, 0, {{0, 0},}};
@@ -183,6 +184,7 @@ reiserfs_filsys_t * reiserfs_create (cha
{
reiserfs_filsys_t * fs;
unsigned int bmap_nr =3D reiserfs_bmap_nr(block_count, block_size);;
+ time_t now;


/* convert root dir key and parent root dir key to little endian format=
 */
@@ -285,6 +287,11 @@ reiserfs_filsys_t * reiserfs_create (cha
reiserfs_bmap_over(bmap_nr) ? 0 : bmap_nr);

set_sb_version (fs->fs_ondisk_sb, version);
+ set_sb_v2_lastcheck(fs->fs_ondisk_sb, time(&now));
+ set_sb_v2_check_interval(fs->fs_ondisk_sb, DEFAULT_CHECK_INTERVAL);
+ set_sb_v2_mnt_count(fs->fs_ondisk_sb, 1);
+ set_sb_v2_max_mnt_count(fs->fs_ondisk_sb, DEFAULT_MAX_MNT_COUNT);
+
/* sb_not_used1 */

mark_buffer_dirty (fs->fs_super_bh);
--- a/tune/reiserfstune.8 2008-03-23 22:09:31.000000000 -0400
+++ b/tune/reiserfstune.8 2008-03-23 22:09:44.000000000 -0400
@@ -7,6 +7,7 @@ reiserfstune \- The tunning tool for the
=2ESH SYNOPSIS
=2EB reiserfstune
[ \fB-f\fR ]
+[ \fB-h\fR | \fB--help\fR ]
[ \fB-j\fR | \fB--journal-device\fR \fIFILE\fR ]
[ \fB--no-journal-available\fR ]
[ \fB--journal-new-device\fR \fIFILE\fR ] [ \fB--make-journal-standard\=
fR ]
@@ -17,6 +18,10 @@ reiserfstune \- The tunning tool for the
[ \fB-B\fR | \fB--badblocks\fR \fIfile\fR ]
[ \fB-u\fR | \fB--uuid \fIUUID\fR ]
[ \fB-l\fR | \fB--label \fILABEL\fR ]
+[ \fB-c\fR | \fB--check-interval \fIinterval-in-days\fR ]
+[ \fB-C\fR | \fB--time-last-checked \fItimestamp\fR ]
+[ \fB-m\fR | \fB--max-mnt-count \fIcount\fR ]
+[ \fB-M\fR | \fB--mnt-count \fIcount\fR ]
=2EI device
=2ESH DESCRIPTION
\fBreiserfstune\fR is used for tuning the ReiserFS. It can change two=20
journal
@@ -40,6 +45,9 @@ is the special file corresponding to the
/dev/hdXX for IDE disk partition or /dev/sdXX for the SCSI disk partiti=
on).
=2ESH OPTIONS
=2ETP
+\fB-h\fR | \fB--help\fR
+Print usage information and exit.
+.TP
\fB-j\fR | \fB--journal-device\fR \fIFILE
\fIFILE\fR is the file name of the block device the file system has
the current journal (the one prior to running reiserfstune) on. This=20
option is required when the journal is
@@ -114,6 +122,75 @@ series of hex digits separated by
\fB-l\fR | \fB--label \fILABEL\fR
Set the volume label of the filesystem. \fILABEL\fR can be at most 16
characters long; if it is longer than 16 characters, reiserfstune will=20
truncate it.
+.TP
+\fB-c\fR | \fB--check-interval \fIinterval-in-days\fR
+Adjust the maximal time between two filesystem checks. A value of "dis=
able"
+will disable the time-dependent checking. A value of "default" will re=
store
+the compile-time default.
+
+It is strongly recommended that either
+.B \-m
+(mount-count dependent) or
+.B \-c
+(time-dependent) checking be enabled to force periodic full
+.BR fsck.reiserfs(8)
+checking of the filesystem. Failure to do so may lead to
+filesystem corruption (due to bad disks, cables, memory, or kernel bug=
s)
+going unnoticed, ultimately resulting in data loss or corruption.
+.TP
+\fB-C\fR | \fB--time-last-checked \fItimestamp\fR
+Set the time the filesystem was last checked using fsck.reiserfs. This
+can be useful in scripts which use a Logical Volume Manager to make a
+consistent snapshot of a filesystem, and then check the filesystem dur=
ing
+off hours to make sure it hasn't been corrupted due to hardware proble=
ms,
+etc. If the filesystem was clean, then this option can be used to set =
the
+last checked time on the original filesystem. The format of=20
time-last-checked
+is the international date format, with an optional time specifier, i.e=
=2E
+YYYYMMDD[HH[MM[SS]]]. The keyword
+.B now
+is also accepted, in which case the
+last checked time will be set to the current time.
+.TP
+\fB-m\fR | \fB--max-mnt-count \fImax-mount-count\fR
+Adjust the number of mounts after which the filesystem will be
+checked by
+.BR fsck.reiserfs(8).
+If max-mount-count is "disable", the number of times the filesystem
+is mounted will be disregarded by
+.BR fsck.reiserfs(8)
+and the kernel. A value of "default" will restore the compile-time def=
ault.
+
+Staggering the mount-counts at which filesystems are forcibly
+checked will avoid all filesystems being checked at one time
+when using journaled filesystems.
+
+You should strongly consider the consequences of disabling
+mount-count-dependent checking entirely. Bad disk drives,
+cables, memory, and kernel bugs could all corrupt a filesystem
+without marking the filesystem dirty or in error. If you are
+using journaling on your filesystem, your filesystem will never
+be marked dirty, so it will not normally be checked. A filesys=E2=80=90
+tem error detected by the kernel will still force an fsck on the
+next reboot, but it may already be too late to prevent data loss
+at that point.
+
+This option requires a kernel which supports incrementing the
+count on each mount. This feature has not been incorporated into
+kernel versions older than 2.6.25.
+
+See also the
+.B \-c
+option for time-dependent checking.
+.TP
+\fB-M\fR | \fB--mnt-count \fIcount\fR
+Set the number of times the filesystem has been mounted. If set
+to a greater value than the max-mount-counts parameter set by
+the
+.B \-m
+option,
+.BR fsck.reiserfs(8)
+will check the filesystem at the next
+reboot.
=2ESH POSSIBLE SCENARIOS OF USING REISERFSTUNE:
1. You have ReiserFS on /dev/hda1, and you wish to have
it working with its journal on the device /dev/journal
--- a/tune/tune.c 2008-03-23 22:09:31.000000000 -0400
+++ b/tune/tune.c 2008-03-23 22:09:44.000000000 -0400
@@ -11,6 +11,8 @@
#include <stdarg.h>
#include <string.h>
#include <errno.h>
+#include <limits.h>
+#include "parse_time.h"

char *program_name;

@@ -54,12 +56,27 @@ static void print_usage_and_exit(void)
" -u | --uuid UUID|random\tset new UUID\n"
" -l | --label LABEL\t\tset new label\n"
" -f | --force\t\t\tforce tuning, less confirmations\n"
- " -V\t\t\t\tprint version and exit\n", program_name);
+ " -c | --check-interval\t\tset interval in days for fsck -a to check,=
\n"
+ " \t\t\"disable\" to disable check,\n"
+ " \t\tor \"default\" to restore default\n"
+ " -C | --time-last-checked\tset the time the filesystem was last=20
checked\n"
+ " \t(now or YYYYMMDD[HH[MM[SS]]])\n"
+ " -m | --max-mnt-count\t\tset maximum number of mounts before fsck -a=
\n"
+ " \t\tchecks, \"disable\" to disable check,\n"
+ " \t\tor \"default\" to restore default\n"
+ " -M | --mnt-count\t\tset the number of times the filesystem\n"
+ " \t\thas been mounted\n"
+ " -h | --help\t\t\tprint help and exit\n"
+ " -V\t\t\t\tprint version and exit\n", program_name);
exit (1);
}

unsigned long Journal_size =3D 0;
int Max_trans_size =3D JOURNAL_TRANS_MAX;
+unsigned short Max_mnt_count =3D 0;
+unsigned short Mnt_count =3D 0;
+unsigned int Check_interval =3D 0;
+time_t Time_last_checked =3D 0;
int Offset =3D 0;
__u16 Options =3D 0;
int Force =3D 0;
@@ -218,6 +235,41 @@ static void set_offset_in_journal_device
Offset =3D str2int( str );
}

+static void set_max_mnt_count(char *str)
+{
+ if (!strcmp(str, "disable"))
+ Max_mnt_count =3D USHRT_MAX;
+ else if (!strcmp(str, "default"))
+ Max_mnt_count =3D DEFAULT_MAX_MNT_COUNT;
+ else
+ Max_mnt_count =3D str2int(str);
+}
+
+static void set_mnt_count(char *str)
+{
+ Mnt_count =3D str2int(str);
+}
+
+static void set_check_interval(char *str)
+{
+ if (!strcmp(str, "disable"))
+ Check_interval =3D UINT_MAX;
+ else if (!strcmp(str, "default"))
+ Check_interval =3D DEFAULT_CHECK_INTERVAL;
+ else
+ Check_interval =3D str2int(str) * 60 * 60 * 24;
+}
+
+static void set_time_last_checked(char *str)
+{
+ if (!strcmp(str, "now"))
+ Time_last_checked =3D time(NULL);
+ else
+ Time_last_checked =3D parse_time(str);
+
+ if (Time_last_checked =3D=3D 0)
+ print_usage_and_exit ();
+}

static void callback_new_badblocks(reiserfs_filsys_t *fs,
struct path *badblock_path,
@@ -347,6 +399,7 @@ int main (int argc, char **argv)

while (1) {
static struct option options[] =3D {
+ {"help", no_argument, 0, 'h'},
{"journal-device", required_argument, 0, 'j'},
{"journal-new-device", required_argument, &flag, OPT_NEW_J},
{"journal-new-size", required_argument, 0, 's'},
@@ -360,11 +413,15 @@ int main (int argc, char **argv)
{"badblocks", required_argument, 0, 'B'},
{"force", no_argument, 0, 'f'},
{"make-journal-standard", no_argument, &flag, OPT_STANDARD},
+ {"check-interval", required_argument, 0, 'c'},
+ {"time-last-checked", required_argument, 0, 'C'},
+ {"max-mount-count", required_argument, 0, 'm'},
+ {"mount-count", required_argument, 0, 'M'},
{0, 0, 0, 0}
};
int option_index;

- c =3D getopt_long (argc, argv, "j:s:t:o:fu:l:b:B:V",
+ c =3D getopt_long (argc, argv, "hj:s:t:o:fu:l:b:B:Vc:C:m:M:",
options, &option_index);
if (c =3D=3D -1)
break;
@@ -439,6 +496,22 @@ int main (int argc, char **argv)
case 'V':
print_banner("reiserfstune");
exit(0);
+ case 'h':
+ print_usage_and_exit();
+ break;
+ case 'c':
+ set_check_interval(optarg);
+ break;
+ case 'C':
+ set_time_last_checked(optarg);
+ break;
+ case 'm':
+ set_max_mnt_count(optarg);
+ break;
+ case 'M':
+ set_mnt_count(optarg);
+ break;
+
#if 0
case 'J': /* --journal-new-device */
Options |=3D OPT_NEW_J;
@@ -561,17 +634,50 @@ int main (int argc, char **argv)

/* set UUID and LABEL if specified */
if (fs->fs_format =3D=3D REISERFS_FORMAT_3_6) {
+ int need_dirty =3D 0;
#if defined(HAVE_LIBUUID) && defined(HAVE_UUID_UUID_H)
if (!uuid_is_null(UUID)) {
memcpy (fs->fs_ondisk_sb->s_uuid, UUID, 16);
- mark_buffer_dirty (fs->fs_super_bh);
- fs->fs_dirt =3D 1;
+ need_dirty =3D 1;
}
#endif
if (LABEL !=3D NULL) {
if (strlen (LABEL) > 16)
message ("Specified LABEL is longer then 16 characters, will be=20
truncated\n");
strncpy (fs->fs_ondisk_sb->s_label, LABEL, 16);
+ need_dirty =3D 1;
+ }
+ if (Max_mnt_count &&
+ Max_mnt_count !=3D get_sb_v2_max_mnt_count(fs->fs_ondisk_sb)) {
+ if (Max_mnt_count <=3D 0)
+ reiserfs_exit(1, "max-mnt-count must be > 0\n");
+ set_sb_v2_max_mnt_count(fs->fs_ondisk_sb, Max_mnt_count);
+ need_dirty =3D 1;
+ }
+
+ if (Mnt_count &&
+ Mnt_count !=3D get_sb_v2_mnt_count(fs->fs_ondisk_sb)) {
+ if (Max_mnt_count <=3D 0)
+ reiserfs_exit(1, "max-mnt-count must be > 0\n");
+ set_sb_v2_mnt_count(fs->fs_ondisk_sb, Mnt_count);
+ need_dirty =3D 1;
+ }
+
+ if (Check_interval &&
+ Check_interval !=3D get_sb_v2_check_interval(fs->fs_ondisk_sb)) {
+ if (Check_interval <=3D 0)
+ reiserfs_exit(1, "check-interval must be > 0\n");
+ set_sb_v2_check_interval(fs->fs_ondisk_sb,
+ Check_interval);
+ need_dirty =3D 1;
+ }
+ if (Time_last_checked &&
+ Time_last_checked !=3D get_sb_v2_lastcheck(fs->fs_ondisk_sb)) {
+ set_sb_v2_lastcheck(fs->fs_ondisk_sb, Time_last_checked);
+ need_dirty =3D 1;
+ }
+
+ if (need_dirty) {
mark_buffer_dirty (fs->fs_super_bh);
fs->fs_dirt =3D 1;
}
@@ -582,8 +688,14 @@ int main (int argc, char **argv)
#endif
if (LABEL)
reiserfs_exit (1, "LABEL cannot be specified for 3.5 format\n");
+
+ if (Max_mnt_count)
+ reiserfs_exit (1, "max-mnt-count cannot be specified for 3.5 format\n=
");
+ if (Check_interval)
+ reiserfs_exit (1, "check-interval cannot be specified for 3.5 format\=
n");
}

+
if (!j_new_device_name) {

/* new journal device hasn't been specified */


-------------------------

Subject: [PATCH] reiserfsprogs: Warn on block sizes > 4k
=46rom: Jeff Mahoney <jeffm@suse.com>

=46ilesystems created with block size > page size will not work until t=
hat
support is added to the kernel. Filesystems with block size > 4k (lowes=
t
page size supported in Linux) will not work on all systems. This patch
adds a check and a warning in those conditions, informing the user of t=
he
caveats of using a larger block size. It can be overridden with -f.

---
include/reiserfs_lib.h | 1 +
mkreiserfs/mkreiserfs.c | 3 +++
reiserfscore/reiserfslib.c | 18 ++++++++++++++++++
3 files changed, 22 insertions(+)

--- a/include/reiserfs_lib.h 2004-10-01 12:19:34.000000000 -0400
+++ b/include/reiserfs_lib.h 2008-03-23 22:07:01.000000000 -0400
@@ -92,6 +92,7 @@ void reiserfs_read_bitmap_blocks (reiser
void reiserfs_free_bitmap_blocks (reiserfs_filsys_t *);
*/
int no_reiserfs_found (reiserfs_filsys_t *);
+int block_size_ok(int blocksize, int force);
int is_block_count_correct (unsigned long block_of_super_block, unsigne=
d=20
int block_size,
unsigned long block_count, unsigned long journal_size);
//unsigned long min_block_amount (int block_size, unsigned long=20
journal_size);
--- a/mkreiserfs/mkreiserfs.c 2008-03-23 22:05:33.000000000 -0400
+++ b/mkreiserfs/mkreiserfs.c 2008-03-23 22:05:34.000000000 -0400
@@ -686,6 +686,9 @@ int main (int argc, char **argv)

if (!(mode & QUIET_MODE) && !can_we_format_it (device_name, force))
return 1;
+
+ if (!(mode & QUIET_MODE) && !block_size_ok (Block_size, force))
+ return 1;

if (jdevice_name)
if (!(mode & QUIET_MODE) && !can_we_format_it (jdevice_name, force))
--- a/reiserfscore/reiserfslib.c 2004-10-04 16:39:35.000000000 -0400
+++ b/reiserfscore/reiserfslib.c 2008-03-23 22:05:34.000000000 -0400
@@ -1175,6 +1175,24 @@ void make_sure_root_dir_exists (reiserfs
&parent_root_dir_key, ih_flags);
}

+int block_size_ok (int blocksize, int force)
+{
+ int pagesize =3D getpagesize();
+ if (blocksize > 4096) {
+ reiserfs_warning (stderr, "Block sizes larger than 4k are not "
+ "supported on all architectures.\n");
+ if (blocksize > pagesize)
+ reiserfs_warning (stderr, "The newly created filesystem will not "
+ "be mountable on this system.\n");
+ else
+ reiserfs_warning (stderr, "The newly created filesystem may not "
+ "be mountable on other systems.\n");
+ check_forcing_ask_confirmation (force);
+ }
+
+ return 1;
+}
+

/* we only can use a file for filesystem or journal if it is either not
mounted block device or regular file and we are forced to use it */


--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
