From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 3/3] reiser4progs: release format 4.0.1
Date: Sun, 16 Aug 2015 15:24:01 +0200
Message-ID: <55D08EF1.3090900@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080005070904050404060605"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=Bb+rU4pH4TXJYCKHOhBgXEXOqT83YRFUqLFo54asLro=;
        b=XVzuExgbCYFIJ/rGP7kby+y2x47OcuZdn1WZyAhJQk/vPrZqADgDQKgspJESTh77FQ
         z2YAouVSMBkFHuuVuMHnXKHY+KmStcvIIM5j4Bmuwug9ePuI6ODZlMOPUmFHgTC3tV2/
         15gQ1pdKvjRuiW4k+Z93ARXgw/BRaG2tf2fjfhyHyMFyTuINW3Rt66WJ2fNwHvrJJ/59
         l9vhf+gbSAN16aUvGxiL2aNpuYgF9uEGIUZ4inncJw/Nwe+GGYnpx1daut3oxcCFwHZV
         itWFXx2vOr8j8Yz9GZOFjwY7jDY01RPqNgphExkL9MZTizEFw4RHrItMBxpMjMk59qFu
         xTUw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080005070904050404060605
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------080005070904050404060605
Content-Type: text/x-patch;
 name="reiser4progs-release-4.0.1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4progs-release-4.0.1.patch"

. Remove unneeded macro FORMAT40_VERSION
. Print format release number when specifying option -V;
. Cleanups;
. Issue format release 4.0.1 (for node41/checksum support).

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 ChangeLog                                |    6 ++++++
 configure.in                             |    4 ++--
 include/aux/Makefile.am                  |    2 +-
 include/misc/version.h                   |   10 ++++++++++
 include/reiser4/plugin.h                 |   12 +++++++-----
 libmisc/ui.c                             |    3 +++
 plugin/format/format40/format40.c        |    6 +++---
 plugin/format/format40/format40.h        |    3 ---
 plugin/format/format40/format40_repair.c |   18 +++++++++---------
 plugin/node/node40/node40.c              |    2 +-
 plugin/node/node41/node41.c              |    2 +-
 progs/mkfs/mkfs.c                        |   13 -------------
 12 files changed, 43 insertions(+), 38 deletions(-)

--- a/include/misc/version.h
+++ b/include/misc/version.h
@@ -3,6 +3,16 @@
    
    version.h -- version information for reiser4progs. */
 
+static inline int get_release_number_major(void)
+{
+        return FORMAT_LAST_ID - 1;
+}
+
+static inline int get_release_number_minor(void)
+{
+        return PLUGIN_LIBRARY_VERSION;
+}
+
 #define BANNER						     \
     "Copyright (C) 2001-2005 by Hans Reiser, "  \
     "licensing governed by reiser4progs/COPYING."
--- a/include/reiser4/plugin.h
+++ b/include/reiser4/plugin.h
@@ -87,11 +87,13 @@ struct reiser4_plug {
 #endif
 };
 
-/* This should be incremented with each new contributed
-   pair (plugin type, plugin id).
-   NOTE: Make sure there is a reiser4 kernel release
-   with the corresponding version number */
-#define PLUGIN_LIBRARY_VERSION 0
+/*
+ * This should be incremented in every release which adds one
+ * or more new plugins.
+ * NOTE: Make sure that respective marco is also incremented in
+ * the new release of reiser4 kernel module.
+ */
+#define PLUGIN_LIBRARY_VERSION 1
 
 /* Known by library plugin types. */
 typedef enum reiser4_plug_type {
--- a/libmisc/ui.c
+++ b/libmisc/ui.c
@@ -240,6 +240,9 @@ void misc_print_banner(char *name) {
 	char *banner;
    
 	fprintf(stderr, "%s %s\n", name, VERSION);
+	fprintf(stderr, "Format release: 4.%d.%d\n",
+		get_release_number_major(),
+		get_release_number_minor());
     
 	if (!(banner = aal_calloc(255, 0)))
 		return;
--- a/plugin/format/format40/format40.c
+++ b/plugin/format/format40/format40.c
@@ -256,7 +256,7 @@ static reiser4_format_ent_t *format40_cr
 	set_sb_mkfs_id(super, random());
 
 	/* Set version values. */
-	set_sb_version(super, FORMAT40_VERSION);
+	set_sb_version(super, PLUGIN_LIBRARY_VERSION);
 	
 	/* Clobbering format skipped area in order to let mount to detect
 	   reiser4 correctly without specifying exact filesystem type. 
@@ -362,12 +362,12 @@ static errno_t format40_valid(reiser4_fo
 		return -EINVAL;
 	}
 
-	if (get_sb_version(SUPER(format)) > FORMAT40_VERSION) {
+	if (get_sb_version(SUPER(format)) > PLUGIN_LIBRARY_VERSION) {
 		aal_error("The on-disk format version (%u) is greater than "
 			  "the known version (%u). Please update reiser4progs "
 			  "or run fsck.reiser4 --build-sb to fix the fs "
 			  "consistency.", get_sb_version(SUPER(format)),
-			  FORMAT40_VERSION);
+			  PLUGIN_LIBRARY_VERSION);
 
 		return -EINVAL;
 	}
--- a/plugin/format/format40/format40.h
+++ b/plugin/format/format40/format40.h
@@ -18,9 +18,6 @@
 
 #define MAGIC_SIZE 16
 
-/* The greatest supported format40 version number */
-#define FORMAT40_VERSION PLUGIN_LIBRARY_VERSION
-
 /* This flag indicates that backup should be updated
    (the update is performed by fsck) */
 #define FORMAT40_UPDATE_BACKUP  (1 << 31)
--- a/plugin/format/format40/format40_repair.c
+++ b/plugin/format/format40/format40_repair.c
@@ -91,19 +91,19 @@ errno_t format40_check_struct(reiser4_fo
 	
 	if (backup) {
 		/* Check the version if the version was backed up. */
-	        if ((get_sb_version(backup) > FORMAT40_VERSION) ||
-		    ((get_sb_version(super) > FORMAT40_VERSION) &&
+	        if ((get_sb_version(backup) > PLUGIN_LIBRARY_VERSION) ||
+		    ((get_sb_version(super) > PLUGIN_LIBRARY_VERSION) &&
 		     sb_update_backup(super))) {
 			aal_fatal("The on-disk format version (%u) is "
 				  "greater than the known version (%u). "
 				  "Please update reiser4progs and try again.",
-				  get_sb_version(super),FORMAT40_VERSION);
+				  get_sb_version(super), PLUGIN_LIBRARY_VERSION);
 			
 			return RE_FATAL;
 		}
 		
 		if ((get_sb_version(super) > get_sb_version(backup)) &&
-		    (get_sb_version(super) <= FORMAT40_VERSION) && 
+		    (get_sb_version(super) <= PLUGIN_LIBRARY_VERSION) &&
 		    (sb_update_backup(super)))
 		{
 			/* Backup update is needed. */
@@ -136,7 +136,7 @@ errno_t format40_check_struct(reiser4_fo
 			
 		}
 	} else {
-		if (get_sb_version(super) > FORMAT40_VERSION) {
+		if (get_sb_version(super) > PLUGIN_LIBRARY_VERSION) {
 			int opt;
 
 			aal_mess("The on-disk format40 version (%u) is greater "
@@ -144,7 +144,7 @@ errno_t format40_check_struct(reiser4_fo
 				 "means that reiser4progs is out of date. Fix "
 				 "the format40 version, only if you are sure "
 				 "this is a corruption.", get_sb_version(super),
-				 FORMAT40_VERSION);
+				 PLUGIN_LIBRARY_VERSION);
 
 			if (mode != RM_BUILD)
 				return RE_FATAL;
@@ -154,7 +154,7 @@ errno_t format40_check_struct(reiser4_fo
 			if (opt != EXCEPTION_OPT_YES)
 				return -EINVAL;
 
-			set_sb_version(super, FORMAT40_VERSION);
+			set_sb_version(super, PLUGIN_LIBRARY_VERSION);
 			format40_mkdirty(format);
 		}
 	}
@@ -490,12 +490,12 @@ reiser4_format_ent_t *format40_regenerat
 	backup = (format40_backup_t *)
 		(hint->block.data + hint->off[BK_FORMAT]);
 	
-	if (get_sb_version(backup) > FORMAT40_VERSION) {
+	if (get_sb_version(backup) > PLUGIN_LIBRARY_VERSION) {
 		fsck_mess("The reiser4 fs being repaired is formatted with "
 			  "format40 plugin version %u, whereas the used "
 			  "format40 plugin is of version %u. Please update "
 			  "reiser4progs and try again.", 
-			  get_sb_version(backup), FORMAT40_VERSION);
+			  get_sb_version(backup), PLUGIN_LIBRARY_VERSION);
 		return NULL;
 	}
 	
--- a/ChangeLog
+++ b/ChangeLog
@@ -6,6 +6,12 @@ reiser4progs/COPYING.
 This file may be modified and/or distributed without restriction. This is
 not an invitation to misrepresent the history of reiser4progs.
 
+2015-08-14
+	1.1.0 version
+2015-08-14
+	Format release 4.0.1;
+	Support checksum for formatted nodes;
+	NODE41 format with 32-bit field for checksums;
 2014-06-28
 	1.0.9 version
 2014-06-28
--- a/configure.in
+++ b/configure.in
@@ -14,8 +14,8 @@ AH_TEMPLATE([LIBREISER4_MAX_INTERFACE_VE
 AH_TEMPLATE([LIBREISER4_MIN_INTERFACE_VERSION], [Define to the min interface version.])
 
 LIBREISER4_MAJOR_VERSION=1
-LIBREISER4_MINOR_VERSION=0
-LIBREISER4_MICRO_VERSION=9
+LIBREISER4_MINOR_VERSION=1
+LIBREISER4_MICRO_VERSION=0
 
 LIBREISER4_INTERFACE_AGE=0
 LIBREISER4_BINARY_AGE=0
--- a/progs/mkfs/mkfs.c
+++ b/progs/mkfs/mkfs.c
@@ -305,19 +305,6 @@ int main(int argc, char *argv[]) {
 		goto error_free_libreiser4;
 	}
 
-	if (!(flags & BF_FORCE)) {
-		if (aal_strncmp(sysinfo.release, "2.5", 3) &&
-		    aal_strncmp(sysinfo.release, "2.6", 3) &&
-		    (aal_strncmp(sysinfo.release, "3.", 2) ||
-		     (sysinfo.release[2] < '0' && (sysinfo.release[2] > '9')))){
-			aal_warn("%s %s is detected. Reiser4 does not "
-				 "support such a platform. Use -f to "
-				 "force over.", sysinfo.sysname,
-				 sysinfo.release);
-			goto error_free_libreiser4;
-		}
-	}
-
 	if (!(flags & BF_YES)) {
 		aal_mess("%s %s is detected.", sysinfo.sysname,
 			 sysinfo.release);
--- a/include/aux/Makefile.am
+++ b/include/aux/Makefile.am
@@ -1 +1 @@
-noinst_HEADERS		= aux.h gauge.h
+noinst_HEADERS		= aux.h gauge.h crc32c.h
--- a/plugin/node/node40/node40.c
+++ b/plugin/node/node40/node40.c
@@ -1659,7 +1659,7 @@ reiser4_node_plug_t node40_plug = {
 		.id    = {NODE_REISER40_ID, 0, NODE_PLUG_TYPE},
 #ifndef ENABLE_MINIMAL
 		.label = "node40",
-		.desc  = "Node40 layout plugin.",
+		.desc  = "Node layout plugin.",
 #endif
 	},
 	
--- a/plugin/node/node41/node41.c
+++ b/plugin/node/node41/node41.c
@@ -113,7 +113,7 @@ reiser4_node_plug_t node41_plug = {
 		.id    = {NODE_REISER41_ID, 0, NODE_PLUG_TYPE},
 #ifndef ENABLE_MINIMAL
 		.label = "node41",
-		.desc  = "Node41 layout plugin.",
+		.desc  = "Protected node layout plugin.",
 #endif
 	},
 

--------------080005070904050404060605--
