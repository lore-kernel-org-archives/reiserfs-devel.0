From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Large Filesystem Support?
Date: Thu, 17 Mar 2005 16:00:45 +0300
Message-ID: <200503171600.45179.vitaly@namesys.com>
References: <20050313091306.GB4160@naveen-osx.lan> <200503161236.24270.vitaly@namesys.com> <20050317003207.GA3246@naveen-osx.lan>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_99XOCEbc4d87C7o"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050317003207.GA3246@naveen-osx.lan>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Naveen Nathan <naveen@cox.net>
Cc: reiserfs-list@namesys.com

--Boundary-00=_99XOCEbc4d87C7o
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 17 March 2005 03:32, Naveen Nathan wrote:
> > the patches change cofigure.in, so you need to run autoconf before 
> > running confgure.
> 
> I ran autoconf after applying the patch, and compiled libaal.
> I'm still receiving for both libaal & reiser4utils:
> 
> checking for _FILE_OFFSET_BITS value needed for large files... no
> checking for _LARGE_FILES value needed for large files... no
> 
> I've included a log for just for libaal.

would you apply this patch instead of the previous one to libaal.

-- 
Thanks,
Vitaly Fertman

--Boundary-00=_99XOCEbc4d87C7o
Content-Type: text/x-diff;
  charset="koi8-r";
  name="libaal_64off.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="libaal_64off.patch"

===== configure.in 1.52 vs edited =====
--- 1.52/configure.in	2005-02-20 13:12:30 +03:00
+++ edited/configure.in	2005-03-14 17:20:41 +03:00
@@ -137,9 +136,12 @@ GENERIC_CFLAGS=""
 GENERIC_CFLAGS="$GENERIC_CFLAGS -D_REENTRANT"
 
 AC_SYS_LARGEFILE
-if test x${ac_cv_sys_file_offset_bits} != x; then
-	GENERIC_CFLAGS="$GENERIC_CFLAGS -D_FILE_OFFSET_BITS=${ac_cv_sys_file_offset_bits}"
+if test -z "${ac_cv_sys_file_offset_bits}"; then
+	AC_MSG_WARN(Can't detect right _FILE_OFFSET_BITS. Will be forced to 64bit.)
+	ac_cv_sys_file_offset_bits=64
 fi
+
+GENERIC_CFLAGS="$GENERIC_CFLAGS -D_FILE_OFFSET_BITS=${ac_cv_sys_file_offset_bits}"
 
 AC_CHECK_SIZEOF(off_t, 64, [
 	#include <stdio.h>
===== src/file.c 1.16 vs edited =====
--- 1.16/src/file.c	2004-09-22 17:46:59 +04:00
+++ edited/src/file.c	2005-03-17 15:44:53 +03:00
@@ -209,18 +209,8 @@ static count_t file_len(
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
@@ -231,8 +221,7 @@ static count_t file_len(
 		
 		if (ioctl(*((int *)device->entity), BLKGETSIZE, &l_size) >= 0) {
 			size = l_size;
-			return (count_t)((size * 512 / 4096) * 4096 / 
-				device->blksize);
+			return size * 512 / device->blksize;
 		}
 	}
     

--Boundary-00=_99XOCEbc4d87C7o--
