From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: status of grub reiser4 support ?
Date: Tue, 16 Mar 2004 12:40:02 +0300
Message-ID: <200403161237.44869.vitaly@namesys.com>
References: <405597B6.1000906@free.fr> <40561487.5070503@free.fr> <40561583.8050705@free.fr>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_ytsVAuiullcbaTF"
Return-path: <reiserfs-list-return-17239-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40561583.8050705@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vince <fuzzy77@free.fr>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

--Boundary-00=_ytsVAuiullcbaTF
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 15 March 2004 23:43, Vince wrote:
> BTW, I've checked and the problem here is:
>
> (gdb) print place->plug
> $1 = (reiser4_plug_t *) 0x0
>
> Vince wrote:
> > Debugging symbols in libreiser4 (0.5.1) gave me:
> >
> > Program received signal SIGSEGV, Segmentation fault.
> > 0x0806204a in reiser4_item_units (place=0x400801ac) at item.c:14
> > 14              if (place->plug->o.item_ops->balance->units) {

yes, thank you, I have found a few other bugs also, so attached are 
the fixed grub patch and fixes for the reiser4progs. You probably
do not have fibration plugins yet, so just through away the last diff
in the reiser4progs patch.

-- 
Thanks,
Vitaly Fertman





--Boundary-00=_ytsVAuiullcbaTF
Content-Type: text/x-diff;
  charset="koi8-r";
  name="reiser4_alone.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="reiser4_alone.patch"

diff -Nru a/libreiser4/tree.c b/libreiser4/tree.c
--- a/libreiser4/tree.c	Tue Mar 16 12:33:26 2004
+++ b/libreiser4/tree.c	Tue Mar 16 12:33:26 2004
@@ -271,6 +271,9 @@
 	return -EINVAL;
 
 out_correct_place:
+#else
+	if (reiser4_place_fetch(place))
+		return -EINVAL;
 #endif
 	if (reiser4_item_units(place) == 1)
 		place->pos.unit = MAX_UINT32;
diff -Nru a/plugin/key/key_large/key_large.c b/plugin/key/key_large/key_large.c
--- a/plugin/key/key_large/key_large.c	Tue Mar 16 12:33:26 2004
+++ b/plugin/key/key_large/key_large.c	Tue Mar 16 12:33:26 2004
@@ -186,7 +186,6 @@
 	aal_memset(key->body, 0, sizeof(key->body));
 }
 
-#ifndef ENABLE_STAND_ALONE
 /* Figures out if items are of one file or not. */
 static int key_large_compshort(reiser4_key_t *key1, 
 			       reiser4_key_t *key2) 
@@ -219,7 +218,6 @@
 	return kl_comp_el((key_large_t *)key1->body,
 			  (key_large_t *)key2->body, 2);
 }
-#endif
 
 static int key_large_compraw(void *key1, void *key2) {
 	int res;
@@ -386,11 +384,8 @@
 	.bodysize	= key_lage_bodysize,
 	.compraw	= key_large_compraw,
 	.compfull	= key_large_compfull,
-
-#ifndef ENABLE_STAND_ALONE
 	.compshort	= key_large_compshort,
-#endif
-		
+
 	.build_hashed   = key_large_build_hashed,
 	.build_generic  = key_large_build_generic,
 	
diff -Nru a/plugin/key/key_short/key_short.c b/plugin/key/key_short/key_short.c
--- a/plugin/key/key_short/key_short.c	Tue Mar 16 12:33:26 2004
+++ b/plugin/key/key_short/key_short.c	Tue Mar 16 12:33:26 2004
@@ -179,7 +179,6 @@
 	aal_memset(key->body, 0, sizeof(key->body));
 }
 
-#ifndef ENABLE_STAND_ALONE
 /* Compares two first components of the pased keys (locality and objectid) */
 static int key_short_compshort(reiser4_key_t *key1, 
 			       reiser4_key_t *key2) 
@@ -206,7 +205,6 @@
 	/* Checking object id */
 	return aal_memcmp(&oid1, &oid2, sizeof(oid1));
 }
-#endif
 
 /* Compares two passed key bodies. */
 static int key_short_compraw(void *key1, void *key2) {
@@ -368,10 +366,7 @@
 	.bodysize	= key_short_bodysize,
 	.compfull	= key_short_compfull,
 	.compraw	= key_short_compraw,
-
-#ifndef ENABLE_STAND_ALONE
 	.compshort	= key_short_compshort,
-#endif
 		
 	.build_hashed   = key_short_build_hashed,
 	.build_generic  = key_short_build_generic,
diff -Nru a/plugin/object/obj40/obj40.c b/plugin/object/obj40/obj40.c
--- a/plugin/object/obj40/obj40.c	Tue Mar 16 12:33:26 2004
+++ b/plugin/object/obj40/obj40.c	Tue Mar 16 12:33:26 2004
@@ -598,6 +598,9 @@
 #else
 		if (type == HASH_PLUG_TYPE)
 			pid = HASH_R5_ID;
+		
+		if (type == FIBRE_PLUG_TYPE)
+			pid = FIBRE_DOT_O_ID;
 #endif
 	}
 	

--Boundary-00=_ytsVAuiullcbaTF
Content-Type: text/x-diff;
  charset="koi8-r";
  name="grub-0.94-reiser4-20040127.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="grub-0.94-reiser4-20040127.diff"

diff -urN --exclude=Makefile.in --exclude=configure --exclude='*.info' --exclude='*.*~' --exclude='*.m4' ./grub-0.94.orig/config.h.in ./grub-0.94/config.h.in
--- ./grub-0.94.orig/config.h.in	2003-10-19 21:27:16.000000000 +0400
+++ ./grub-0.94/config.h.in	2004-01-27 11:32:07.000000000 +0300
@@ -50,6 +50,12 @@
 /* Define to 1 if you have the <inttypes.h> header file. */
 #undef HAVE_INTTYPES_H
 
+/* Define to 1 if you have the `aal-alone' library (-laal-alone). */
+#undef HAVE_LIBAAL_ALONE
+
+/* Define to 1 if you have the `reiser4-alone' library (-lreiser4-alone). */
+#undef HAVE_LIBREISER4_ALONE
+
 /* Define to 1 if you have the <memory.h> header file. */
 #undef HAVE_MEMORY_H
 
diff -urN --exclude=Makefile.in --exclude=configure --exclude='*.info' --exclude='*.*~' --exclude='*.m4' ./grub-0.94.orig/configure.ac ./grub-0.94/configure.ac
--- ./grub-0.94.orig/configure.ac	2003-10-19 21:25:30.000000000 +0400
+++ ./grub-0.94/configure.ac	2004-01-27 14:22:54.000000000 +0300
@@ -241,6 +241,77 @@
   FSYS_CFLAGS="$FSYS_CFLAGS -DFSYS_REISERFS=1"
 fi
 
+dnl Checking for reiser4
+REISER4_LIBS=""
+REISER4_CFLAGS=""
+
+OLD_LIBS=$LIBS
+OLD_CFLAGS=$CFLAGS
+LIBS=""
+CFLAGS=""
+
+AC_ARG_ENABLE(reiser4,
+  [  --disable-reiser4       disable Reiser4 support in Stage 2])
+
+enable_reiser4_support=yes
+ 
+AC_CHECK_LIB(aal-alone, aal_mem_init, , 
+  AC_MSG_WARN(
+Reiser4 support is disabled due to inability find libaal-alone with 
+memory manager support turned on.)
+  enable_reiser4_support=no
+)
+
+if test x"$enable_reiser4_support" != xno; then
+  AC_CHECK_HEADER(aal/libaal.h, ,
+  AC_MSG_WARN(
+Libaal header files are not found. Reiser4 support is disabled
+  )
+  enable_reiser4_support=no)
+fi
+  
+if test x"$enable_reiser4_support" != xno; then
+  AC_CHECK_LIB(reiser4-alone, reiser4_fs_open, , 
+  AC_MSG_WARN(
+Reiser4 support is disabled due to inability find valid libreiser4-alone.)
+    enable_reiser4_support=no, 
+    -laal-alone
+  )
+fi
+
+if test x"$enable_reiser4_support" != xno; then
+  AC_CHECK_HEADER(reiser4/libreiser4.h, ,
+  AC_MSG_WARN(
+Reiser4 header files are not found. Reiser4 support is disabled.
+  )
+  enable_reiser4_support=no)
+fi
+
+if test x"$enable_reiser4_support" != xno; then
+  REISER4_CFLAGS="$REISER4_CFLAGS -DFSYS_REISER4=1"
+  REISER4_LIBS=$LIBS
+fi
+
+if test x"$enable_reiser4_support" != xno; then
+  AC_CHECK_LIB(reiser4-alone, __sym40_plug_init, 
+    REISER4_CFLAGS="$REISER4_CFLAGS -DENABLE_SYMLINKS=1",
+AC_MSG_WARN(Reiser4 symlinks support is disabled.), 
+    -laal-alone
+  )
+fi
+
+LIBS=$OLD_LIBS
+CFLAGS=$OLD_CFLAGS
+
+if test x"$enable_reiser4" != xno; then
+  (test x"$enable_reiser4_support" != xno) &&
+    FSYS_CFLAGS="$FSYS_CFLAGS $REISER4_CFLAGS"
+fi
+
+AC_SUBST(REISER4_LIBS)
+AC_SUBST(REISER4_CFLAGS)
+AM_CONDITIONAL(ENABLE_REISER4_SUPPORT, test x"$enable_reiser4_support" != xno)
+
 AC_ARG_ENABLE(vstafs,
   [  --disable-vstafs        disable VSTa FS support in Stage 2])
 
diff -urN --exclude=Makefile.in --exclude=configure --exclude='*.info' --exclude='*.*~' --exclude='*.m4' ./grub-0.94.orig/docs/grub.texi ./grub-0.94/docs/grub.texi
--- ./grub-0.94.orig/docs/grub.texi	2004-01-25 18:39:14.000000000 +0300
+++ ./grub-0.94/docs/grub.texi	2004-01-27 11:29:54.000000000 +0300
@@ -277,7 +277,7 @@
 Support multiple filesystem types transparently, plus a useful explicit
 blocklist notation. The currently supported filesystem types are
 @dfn{BSD FFS}, @dfn{DOS FAT16 and FAT32}, @dfn{Minix fs}, @dfn{Linux
-ext2fs}, @dfn{ReiserFS}, @dfn{JFS}, @dfn{XFS}, and @dfn{VSTa
+ext2fs}, @dfn{ReiserFS}, @dfn{Reiser4}, @dfn{JFS}, @dfn{XFS}, and @dfn{VSTa
 fs}. @xref{Filesystem}, for more information.
 
 @item Support automatic decompression
@@ -1528,6 +1528,7 @@
 @itemx jfs_stage1_5
 @itemx minix_stage1_5
 @itemx reiserfs_stage1_5
+@itemx reiser4_stage1_5
 @itemx vstafs_stage1_5
 @itemx xfs_stage1_5
 
diff -urN --exclude=Makefile.in --exclude=configure --exclude='*.info' --exclude='*.*~' --exclude='*.m4' ./grub-0.94.orig/grub/Makefile.am ./grub-0.94/grub/Makefile.am
--- ./grub-0.94.orig/grub/Makefile.am	2004-01-18 22:34:24.000000000 +0300
+++ ./grub-0.94/grub/Makefile.am	2004-01-27 16:15:50.314761912 +0300
@@ -14,4 +14,4 @@
 AM_CFLAGS = $(GRUB_CFLAGS) -fwritable-strings
 
 grub_SOURCES = main.c asmstub.c
-grub_LDADD = ../stage2/libgrub.a  ../lib/libcommon.a $(GRUB_LIBS)
+grub_LDADD = ../stage2/libgrub.a ../lib/libcommon.a $(GRUB_LIBS) $(REISER4_LIBS) 
diff -urN --exclude=Makefile.in --exclude=configure --exclude='*.info' --exclude='*.*~' --exclude='*.m4' ./grub-0.94.orig/INSTALL ./grub-0.94/INSTALL
--- ./grub-0.94.orig/INSTALL	2003-10-19 21:15:45.000000000 +0400
+++ ./grub-0.94/INSTALL	2004-01-27 11:25:00.000000000 +0300
@@ -207,6 +207,9 @@
 `--disable-reiserfs'
      Omit the ReiserFS support in Stage 2.
 
+`--disable-reiser4'
+     Omit the Reiser4 support in Stage 2.
+
 `--disable-vstafs'
      Omit the VSTa filesystem support in Stage 2.
 
diff -urN --exclude=Makefile.in --exclude=configure --exclude='*.info' --exclude='*.*~' --exclude='*.m4' ./grub-0.94.orig/stage2/builtins.c ./grub-0.94/stage2/builtins.c
--- ./grub-0.94.orig/stage2/builtins.c	2004-01-11 12:39:22.000000000 +0300
+++ ./grub-0.94/stage2/builtins.c	2004-01-27 11:27:38.000000000 +0300
@@ -3751,6 +3751,7 @@
     {"jfs",      "/jfs_stage1_5"},
     {"minix",    "/minix_stage1_5"},
     {"reiserfs", "/reiserfs_stage1_5"},
+    {"reiser4",  "/reiser4_stage1_5"},
     {"vstafs",   "/vstafs_stage1_5"},
     {"xfs",      "/xfs_stage1_5"}
   };
diff -urN --exclude=Makefile.in --exclude=configure --exclude='*.info' --exclude='*.*~' --exclude='*.m4' ./grub-0.94.orig/stage2/disk_io.c ./grub-0.94/stage2/disk_io.c
--- ./grub-0.94.orig/stage2/disk_io.c	2003-10-19 19:58:03.000000000 +0400
+++ ./grub-0.94/stage2/disk_io.c	2004-01-27 12:33:21.000000000 +0300
@@ -63,6 +63,9 @@
 # ifdef FSYS_REISERFS
   {"reiserfs", reiserfs_mount, reiserfs_read, reiserfs_dir, 0, reiserfs_embed},
 # endif
+# ifdef FSYS_REISER4
+  {"reiser4", reiser4_mount, reiser4_read, reiser4_dir, 0, reiser4_embed},
+# endif
 # ifdef FSYS_VSTAFS
   {"vstafs", vstafs_mount, vstafs_read, vstafs_dir, 0, 0},
 # endif
diff -urN --exclude=Makefile.in --exclude=configure --exclude='*.info' --exclude='*.*~' --exclude='*.m4' ./grub-0.94.orig/stage2/filesys.h ./grub-0.94/stage2/filesys.h
--- ./grub-0.94.orig/stage2/filesys.h	2003-07-09 15:45:52.000000000 +0400
+++ ./grub-0.94/stage2/filesys.h	2004-01-27 12:29:44.000000000 +0300
@@ -67,6 +67,16 @@
 #define FSYS_REISERFS_NUM 0
 #endif
 
+#ifdef FSYS_REISER4
+#define FSYS_REISER4_NUM 1
+int reiser4_mount (void);
+int reiser4_read (char *buf, int len);
+int reiser4_dir (char *dirname);
+int reiser4_embed (int *start_sector, int needed_sectors);
+#else
+#define FSYS_REISER4_NUM 0
+#endif
+
 #ifdef FSYS_VSTAFS
 #define FSYS_VSTAFS_NUM 1
 int vstafs_mount (void);
@@ -108,8 +118,8 @@
 #ifndef NUM_FSYS
 #define NUM_FSYS	\
   (FSYS_FFS_NUM + FSYS_FAT_NUM + FSYS_EXT2FS_NUM + FSYS_MINIX_NUM	\
-   + FSYS_REISERFS_NUM + FSYS_VSTAFS_NUM + FSYS_JFS_NUM + FSYS_XFS_NUM	\
-   + FSYS_TFTP_NUM)
+   + FSYS_REISERFS_NUM + FSYS_REISER4_NUM + FSYS_VSTAFS_NUM + FSYS_JFS_NUM \
+   + FSYS_XFS_NUM + FSYS_TFTP_NUM)
 #endif
 
 /* defines for the block filesystem info area */
diff -urN --exclude=Makefile.in --exclude=configure --exclude='*.info' --exclude='*.*~' --exclude='*.m4' ./grub-0.94.orig/stage2/fsys_reiser4.c ./grub-0.94/stage2/fsys_reiser4.c
--- ./grub-0.94.orig/stage2/fsys_reiser4.c	1970-01-01 03:00:00.000000000 +0300
+++ ./grub-0.94/stage2/fsys_reiser4.c	2004-01-27 12:36:33.000000000 +0300
@@ -0,0 +1,245 @@
+/* 
+ *  fsys_reiser4.c -- reiser4 filesystem support.
+ *  Copyright (C) 2001, 2002, 2003 Hans Reiser.
+ *  
+ *  GRUB  --  GRand Unified Bootloader
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+*/
+
+#ifdef FSYS_REISER4
+#include "shared.h"
+#include "filesys.h"
+
+#define ENABLE_STAND_ALONE
+#include <reiser4/libreiser4.h>
+
+static reiser4_fs_t *fs = NULL;
+static aal_device_t *dev = NULL;
+static reiser4_object_t *object = NULL;
+
+/* Read callback of grub specific device. It uses devread() for reading passed
+   @count of device blocks starting from @blk to passed @buff. */
+static errno_t grub_dev_read(aal_device_t *device,
+			     void *buff, blk_t blk,
+			     count_t count)
+{
+	unsigned int size;
+	unsigned int factor;
+	unsigned int sector;
+
+	/* Calculating actual sector and size in bytes to be read from
+	   device. */
+	factor = device->blksize / SECTOR_SIZE;
+	sector = (unsigned int)blk << aal_log2(factor);
+	size = (unsigned int)count * (SECTOR_SIZE * factor);
+	
+	/* Reading from the current device */
+        if (!devread(sector, 0, size, buff))
+    	        return -EIO;
+		
+	return 0;
+}
+
+/* Length callback of grub device */
+static count_t grub_dev_len(aal_device_t *device) {
+	unsigned int factor;
+
+	/* Getting partition length in device blocks */
+	factor = device->blksize / SECTOR_SIZE;
+	return (part_length >> aal_log2(factor));
+}
+
+/*
+  Initializing grub device abstraction instance. It will use devread and friends
+  for providing needed functionality.
+*/
+struct aal_device_ops grub_dev_ops = {
+	.read   = grub_dev_read,
+	.len    = grub_dev_len
+};
+
+/* Initializes reiser4 */
+static int reiser4_init(void) {
+	extern aal_hash_table_t *plugins;
+	
+	plugins = NULL;
+
+	/* Initializing memory manager */
+	aal_mem_init((void *)FSYS_BUF, FSYS_BUFLEN);
+
+	/* Initializing device abstraction on current device GRUB uses. */
+	if (!(dev = aal_device_open(&grub_dev_ops, NULL,
+				    SECTOR_SIZE, 0)))
+	{
+		return 0;
+	}
+
+	/* Initializing libreiser4 (plugins, etc) */
+	return !libreiser4_init();
+}
+
+#define MEMORY_WATERMARK 8192
+
+/* Memory pressure detect function. */
+static int mpressure_detect(reiser4_tree_t *tree) {
+	return (aal_mem_free() <= MEMORY_WATERMARK);
+}
+
+/* Reiser4 mount() routine */
+int reiser4_mount(void) {
+	
+	/* Initialize all reiser4 related stuff first */
+	if (!reiser4_init())
+		return 0;
+	
+	/* Open filesystem on @dev. */
+	if (!(fs = reiser4_fs_open(dev, 0)))
+		return 0;
+
+	fs->tree->mpc_func = mpressure_detect;
+	
+	object = NULL;
+	return 1;
+}
+
+/* Reiser4 read() handler */
+int reiser4_read(char *buf, int len) {
+	int64_t read;
+
+	if (object == NULL)
+		return 0;
+
+	/* Seet at current position denoted by @filepos */
+	reiser4_object_seek(object, filepos);
+	
+	/* Reading current file data starting from @filepos */
+        disk_read_func = disk_read_hook;
+	read = reiser4_object_read(object, buf, len);
+        disk_read_func = NULL;
+
+	if (read < 0) {
+		errnum = ERR_FSYS_CORRUPT;
+		return 0;
+	}
+
+    	filepos += read;
+	return read;
+}
+
+/* Reiser4 file open() routine */
+int reiser4_dir(char *dirname) {
+	char *ch;
+	
+	if (fs == NULL)
+		return 0;
+
+	if (object != NULL) {
+		reiser4_object_close(object);
+		object = NULL;
+	}
+
+	/* Cutting out string after first space character */
+    	if ((ch = aal_strchr(dirname, ' ')))
+		*ch = '\0';
+		
+	/* This function is also called for getting directory list for
+	   maintaining the bash-like completion. */
+#ifndef STAGE1_5
+	if (print_possibilities) {
+		char entry[256];
+		entry_hint_t entry_hint;
+		
+		/* Getting last part of name (jsut after last '/') */
+		if (*(dirname + aal_strlen(dirname) - 1) != '/') {
+		
+			if (!(ch = aal_strrchr(dirname, '/'))) {
+				errnum = ERR_BAD_FILETYPE;
+				return 0;
+			}
+
+			aal_strncpy(entry, ch + 1, sizeof(entry));
+			*(ch + 1) = '\0';
+		} else {
+			aal_memset(entry, 0, sizeof(entry));
+		}
+
+		/* Open obejct by @dirname */
+		if (!(object = reiser4_object_open(fs->tree, dirname, 1))) {
+			errnum = ERR_FILE_NOT_FOUND;
+			return 0;
+		}
+
+		/* Checking if it is a directory object */
+		if (object->entity->plug->id.group != DIR_OBJECT) {
+
+			/* If not, cutting out last '/' character */
+    			if ((ch = aal_strrchr(dirname, '/')))
+				*ch = '\0';
+
+			/* Close current object */
+			reiser4_object_close(object);
+			
+			/* Getting out */
+			return 0;
+		}
+		
+		/* Reading opened directory in order to build completion
+		   list. */
+		while (reiser4_object_readdir(object, &entry_hint) > 0) {
+			if (substring(entry, entry_hint.name) <= 0) {
+
+				if (print_possibilities > 0)
+					print_possibilities = -print_possibilities;
+				
+				print_a_completion(entry_hint.name);
+			}
+		}
+	} else {
+#endif
+		/* This is the case when resier4_dir() is called for open the
+		   file @dirname, not for building completion list. */
+		if (!(object = reiser4_object_open(fs->tree, dirname, 1))) {
+			errnum = ERR_FILE_NOT_FOUND;
+			return 0;
+		}
+		
+		if (object->entity->plug->id.group != REG_OBJECT) {
+			errnum = ERR_BAD_FILETYPE;
+			return 0;
+		}
+		
+		/* Initializing GRUB global variables @filepos and @filemax. */
+		filepos = 0;
+		filemax = reiser4_object_size(object);
+	
+		return 1;
+#ifndef STAGE1_5
+	}
+
+	return 1;
+#endif
+
+	errnum = ERR_FILE_NOT_FOUND;
+	return 0;
+}
+
+/* Returns how many sectors may be used for embeding reiser4_stage1_5 in teh
+   case of installing GRUB to partition instead of MBR. */
+int reiser4_embed (int *start_sector, int needed_sectors) {
+	*start_sector = 1;
+	return needed_sectors <= ((REISER4_MASTER_OFFSET >> SECTOR_BITS) - 1);
+}
+#endif /* FSYS_REISER4 */
diff -urN --exclude=Makefile.in --exclude=configure --exclude='*.info' --exclude='*.*~' --exclude='*.m4' ./grub-0.94.orig/stage2/Makefile.am ./grub-0.94/stage2/Makefile.am
--- ./grub-0.94.orig/stage2/Makefile.am	2003-10-19 20:45:18.000000000 +0400
+++ ./grub-0.94/stage2/Makefile.am	2004-01-27 16:10:53.033955464 +0300
@@ -13,16 +13,24 @@
 # For <stage1.h>.
 INCLUDES = -I$(top_srcdir)/stage1
 
+if ENABLE_REISER4_SUPPORT
+REISER4_STAGE1_5 = reiser4_stage1_5
+REISER4_STAGE1_5_EXEC = reiser4_stage1_5.exec
+else
+REISER4_STAGE1_5 =
+REISER4_STAGE1_5_EXEC =
+endif
+
 # The library for /sbin/grub.
 noinst_LIBRARIES = libgrub.a
 libgrub_a_SOURCES = boot.c builtins.c char_io.c cmdline.c common.c \
 	disk_io.c fsys_ext2fs.c fsys_fat.c fsys_ffs.c fsys_jfs.c \
-	fsys_minix.c fsys_reiserfs.c fsys_vstafs.c fsys_xfs.c gunzip.c \
-	md5.c serial.c stage2.c terminfo.c tparm.c
+	fsys_minix.c fsys_reiserfs.c fsys_reiser4.c fsys_vstafs.c \
+	fsys_xfs.c gunzip.c md5.c serial.c stage2.c terminfo.c tparm.c
 libgrub_a_CFLAGS = $(GRUB_CFLAGS) -I$(top_srcdir)/lib \
 	-DGRUB_UTIL=1 -DFSYS_EXT2FS=1 -DFSYS_FAT=1 -DFSYS_FFS=1 \
-	-DFSYS_JFS=1 -DFSYS_MINIX=1 -DFSYS_REISERFS=1 -DFSYS_VSTAFS=1 \
-	-DFSYS_XFS=1 -DUSE_MD5_PASSWORDS=1 \
+	-DFSYS_JFS=1 -DFSYS_MINIX=1 -DFSYS_REISERFS=1 $(REISER4_CFLAGS) \
+	-DFSYS_VSTAFS=1 -DFSYS_XFS=1 -DUSE_MD5_PASSWORDS=1 \
 	-DSUPPORT_SERIAL=1 -DSUPPORT_HERCULES=1 -fwritable-strings
 
 # Stage 2 and Stage 1.5's.
@@ -32,22 +40,22 @@
 
 if DISKLESS_SUPPORT
 pkgdata_DATA = stage2 e2fs_stage1_5 fat_stage1_5 ffs_stage1_5 \
-	jfs_stage1_5 minix_stage1_5 reiserfs_stage1_5 vstafs_stage1_5 \
-	xfs_stage1_5 nbgrub pxegrub
+	jfs_stage1_5 minix_stage1_5 reiserfs_stage1_5 $(REISER4_STAGE1_5) \
+	vstafs_stage1_5 xfs_stage1_5 nbgrub pxegrub
 noinst_DATA = pre_stage2 start nbloader pxeloader diskless
 noinst_PROGRAMS = pre_stage2.exec start.exec e2fs_stage1_5.exec \
 	fat_stage1_5.exec ffs_stage1_5.exec jfs_stage1_5.exec \
-	minix_stage1_5.exec reiserfs_stage1_5.exec \
+	minix_stage1_5.exec reiserfs_stage1_5.exec $(REISER4_STAGE1_5_EXEC) \
 	vstafs_stage1_5.exec xfs_stage1_5.exec nbloader.exec \
 	pxeloader.exec diskless.exec
 else
 pkgdata_DATA = stage2 e2fs_stage1_5 fat_stage1_5 ffs_stage1_5 \
-	jfs_stage1_5 minix_stage1_5 reiserfs_stage1_5 vstafs_stage1_5 \
-	xfs_stage1_5
+	jfs_stage1_5 minix_stage1_5 reiserfs_stage1_5 $(REISER4_STAGE1_5) \
+	vstafs_stage1_5 xfs_stage1_5
 noinst_DATA = pre_stage2 start
 noinst_PROGRAMS = pre_stage2.exec start.exec e2fs_stage1_5.exec \
 	fat_stage1_5.exec ffs_stage1_5.exec jfs_stage1_5.exec \
-	minix_stage1_5.exec reiserfs_stage1_5.exec \
+	minix_stage1_5.exec reiserfs_stage1_5.exec $(REISER4_STAGE1_5_EXEC) \
 	vstafs_stage1_5.exec xfs_stage1_5.exec
 endif
 MOSTLYCLEANFILES = $(noinst_PROGRAMS)
@@ -75,7 +83,7 @@
 HERCULES_FLAGS =
 endif
 
-STAGE2_COMPILE = $(STAGE2_CFLAGS) -fno-builtin -nostdinc \
+STAGE2_COMPILE = $(STAGE2_CFLAGS) -fno-builtin \
 	$(NETBOOT_FLAGS) $(SERIAL_FLAGS) $(HERCULES_FLAGS)
 
 STAGE1_5_LINK = -nostdlib -Wl,-N -Wl,-Ttext -Wl,2000
@@ -85,14 +93,16 @@
 pre_stage2_exec_SOURCES = asm.S bios.c boot.c builtins.c char_io.c \
 	cmdline.c common.c console.c disk_io.c fsys_ext2fs.c \
 	fsys_fat.c fsys_ffs.c fsys_jfs.c fsys_minix.c fsys_reiserfs.c \
-	fsys_vstafs.c fsys_xfs.c gunzip.c hercules.c md5.c serial.c \
-	smp-imps.c stage2.c terminfo.c tparm.c
+	fsys_reiser4.c fsys_vstafs.c fsys_xfs.c gunzip.c hercules.c \
+	md5.c serial.c smp-imps.c stage2.c terminfo.c tparm.c
 pre_stage2_exec_CFLAGS = $(STAGE2_COMPILE) $(FSYS_CFLAGS)
 pre_stage2_exec_CCASFLAGS = $(STAGE2_COMPILE) $(FSYS_CFLAGS)
 pre_stage2_exec_LDFLAGS = $(PRE_STAGE2_LINK)
 
 if NETBOOT_SUPPORT
-pre_stage2_exec_LDADD = ../netboot/libdrivers.a
+pre_stage2_exec_LDADD = ../netboot/libdrivers.a $(REISER4_LIBS)
+else
+pre_stage2_exec_LDADD = $(REISER4_LIBS)
 endif
 
 if DISKLESS_SUPPORT
@@ -167,6 +177,16 @@
 	-DNO_BLOCK_FILES=1
 reiserfs_stage1_5_exec_LDFLAGS = $(STAGE1_5_LINK)
 
+# For reiser4_stage1_5 target.
+reiser4_stage1_5_exec_SOURCES = start.S asm.S common.c char_io.c \
+	disk_io.c stage1_5.c fsys_reiser4.c bios.c
+reiser4_stage1_5_exec_CFLAGS = $(STAGE1_5_COMPILE) $(REISER4_CFLAGS) \
+	-DNO_BLOCK_FILES=1
+reiser4_stage1_5_exec_CCASFLAGS = $(STAGE1_5_COMPILE) $(REISER4_CFLAGS) \
+	-DNO_BLOCK_FILES=1
+reiser4_stage1_5_exec_LDFLAGS = $(STAGE1_5_LINK)
+reiser4_stage1_5_exec_LDADD = $(REISER4_LIBS)
+
 # For vstafs_stage1_5 target.
 vstafs_stage1_5_exec_SOURCES = start.S asm.S common.c char_io.c \
 	disk_io.c stage1_5.c fsys_vstafs.c bios.c
diff -urN --exclude=Makefile.in --exclude=configure --exclude='*.info' --exclude='*.*~' --exclude='*.m4' ./grub-0.94.orig/stage2/shared.h ./grub-0.94/stage2/shared.h
--- ./grub-0.94.orig/stage2/shared.h	2004-01-11 12:39:22.000000000 +0300
+++ ./grub-0.94/stage2/shared.h	2004-01-27 11:41:39.000000000 +0300
@@ -202,9 +202,10 @@
 #define STAGE2_ID_FAT_STAGE1_5		3
 #define STAGE2_ID_MINIX_STAGE1_5	4
 #define STAGE2_ID_REISERFS_STAGE1_5	5
-#define STAGE2_ID_VSTAFS_STAGE1_5	6
-#define STAGE2_ID_JFS_STAGE1_5		7
-#define STAGE2_ID_XFS_STAGE1_5		8
+#define STAGE2_ID_REISER4_STAGE1_5	6
+#define STAGE2_ID_VSTAFS_STAGE1_5	7
+#define STAGE2_ID_JFS_STAGE1_5		8
+#define STAGE2_ID_XFS_STAGE1_5		9
 
 #ifndef STAGE1_5
 # define STAGE2_ID	STAGE2_ID_STAGE2
@@ -219,6 +220,8 @@
 #  define STAGE2_ID	STAGE2_ID_MINIX_STAGE1_5
 # elif defined(FSYS_REISERFS)
 #  define STAGE2_ID	STAGE2_ID_REISERFS_STAGE1_5
+# elif defined(FSYS_REISER4)
+#  define STAGE2_ID	STAGE2_ID_REISER4_STAGE1_5
 # elif defined(FSYS_VSTAFS)
 #  define STAGE2_ID	STAGE2_ID_VSTAFS_STAGE1_5
 # elif defined(FSYS_JFS)

--Boundary-00=_ytsVAuiullcbaTF--

