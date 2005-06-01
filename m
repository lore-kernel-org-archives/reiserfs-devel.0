From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4 on large block devices
Date: Wed, 1 Jun 2005 16:42:33 +0400
Message-ID: <200506011642.33434.vitaly@namesys.com>
References: <20050531184241.GJ30437@lbl.gov>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_50anCzMp258ck89"
Return-path: <reiserfs-list-return-24261-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050531184241.GJ30437@lbl.gov>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Aaron Porter <atporter@lbl.gov>

--Boundary-00=_50anCzMp258ck89
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 31 May 2005 22:42, Aaron Porter wrote:
> 
> 	I'm trying to create a reiser4 filesystem on a ~4tb block device,
> but I'm getting the error "Fatal: The partition size is too big." The FAQ
> seems to list a max filesystem size of 16tb. Am I missing something?
> 
> diablo:~# mkreiser4 /dev/sda3
> mkreiser4 1.0.4
> Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by 
> reiser4progs/COPYING. 
> 
> Block size 4096 will be used.                                                 
> Linux 2.6.11.8 is detected.                                                   
> Uuid f22c4f94-4fcd-4655-b4e0-6665048db8ce will be used.                       
> Fatal: The partition size is too big.                                         
> Reiser4 is going to be created on /dev/sda3.                                  
> (Yes/No): no
> diablo:~#

would you try this patch for libaal-1.0.4?

-- 
Thanks,
Vitaly Fertman

--Boundary-00=_50anCzMp258ck89
Content-Type: text/x-diff;
  charset="koi8-r";
  name="libaal-1.172.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="libaal-1.172.patch"

# This is a BitKeeper generated diff -Nru style patch.
#
# ChangeSet
#   2005/03/21 13:15:23+03:00 vitaly@digger.namesys.com 
#   use BLKBLKGETSIZE & BLKGETSIZE6464 defines
#   
#   file.c:
#     do not limit file size by 2^41 bytes
#     
#   configure.in:
#     check for large files correctly
# 
# src/file.c
#   2005/03/21 13:14:02+03:00 vitaly@digger.namesys.com +3 -4
# 
# src/file.c
#   2005/03/21 12:40:49+03:00 vitaly@digger.namesys.com +3 -14
#   do not limit file size by 2^41 bytes
# 
# configure.in
#   2005/03/21 12:40:29+03:00 vitaly@digger.namesys.com +1 -1
#   check for large files correctly
# 
diff -Nru a/configure.in b/configure.in
--- a/configure.in	2005-06-01 15:50:06 +04:00
+++ b/configure.in	2005-06-01 15:50:06 +04:00
@@ -136,7 +136,7 @@
 GENERIC_CFLAGS="$GENERIC_CFLAGS -D_REENTRANT"
 
 AC_SYS_LARGEFILE
-if test -z "${ac_cv_sys_file_offset_bits}"; then
+if test x${ac_cv_sys_file_offset_bits} = xno; then
 	AC_MSG_WARN(Can't detect right _FILE_OFFSET_BITS. Will be forced to 64bit.)
 	ac_cv_sys_file_offset_bits=64
 fi
diff -Nru a/src/file.c b/src/file.c
--- a/src/file.c	2005-06-01 15:50:06 +04:00
+++ b/src/file.c	2005-06-01 15:50:06 +04:00
@@ -18,6 +18,9 @@
 #include <sys/stat.h>
 #include <sys/ioctl.h>
 
+/* BLKGETSIZE & BLKGETSIZE64 defines: */
+#include <sys/mount.h>
+
 #include <aal/libaal.h>
 
 /* Function for saving last error message into device assosiated buffer */
@@ -193,10 +196,6 @@
 	return !aal_strncmp(file1, file2, aal_strlen(file1));
 }
 
-#if defined(__linux__) && defined(_IOR) && !defined(BLKGETSIZE64)
-#   define BLKGETSIZE64 _IOR(0x12, 114, uint64_t)
-#endif
-
 /* Handler for "len" operation for use with file device. See bellow for
    understanding where it is used. */
 static count_t file_len(
@@ -209,18 +208,8 @@
 		return INVAL_BLK;
     
 #ifdef BLKGETSIZE64
-	if ((int)ioctl(*((int *)device->entity), BLKGETSIZE64, &size) >= (int)0) {
-		uint32_t block_count;
-		
-		size = (size / 4096) * 4096 / device->blksize;
-		block_count = size;
-		
-		if ((uint64_t)block_count != size) {
-			aal_fatal("The partition size is too big.");
-			return INVAL_BLK;
-		}
-		
-		return (count_t)block_count;
+	if (ioctl(*((int *)device->entity), BLKGETSIZE64, &size) >= 0) {
+		return size / device->blksize;
 	}
     
 #endif
@@ -231,8 +220,7 @@
 		
 		if (ioctl(*((int *)device->entity), BLKGETSIZE, &l_size) >= 0) {
 			size = l_size;
-			return (count_t)((size * 512 / 4096) * 4096 / 
-				device->blksize);
+			return size * 512 / device->blksize;
 		}
 	}
     

--Boundary-00=_50anCzMp258ck89--
