From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Large Filesystem Support?
Date: Mon, 14 Mar 2005 17:41:10 +0300
Message-ID: <200503141741.10954.vitaly@namesys.com>
References: <20050313091306.GB4160@naveen-osx.lan>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_GKaNCBnHw7mtJKQ"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050313091306.GB4160@naveen-osx.lan>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Naveen Nathan <naveen@cox.net>
Cc: reiserfs-list@namesys.com

--Boundary-00=_GKaNCBnHw7mtJKQ
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

what your configure tells about _FILE_OFFSET_BITS &
_LARGE_FILES? if it cannot detect the right value, probably 
the attached patches for configure.in would help. 

-- 
Thanks,
Vitaly Fertman

On Sunday 13 March 2005 12:13, Naveen Nathan wrote:
> Hey Reiser team  & fellow Reiser users.
> 
> iI have a system with 3x 3TB HW RAID5 volumes, using the latest
> 2.6.11.2 kernel & reiser4-utils 1.0.4.
> 
> Using mdadm I've created a raid0 for all 3 volumes which is /dev/md0.
> This makes quite a large 9TB partition. Reading the FAQ on Reiser (3.6),
> I was expecting to be well within the limits of the 17TB partition size
> limit.
> 
> These are the results from trying to create the partition:
> 
> # mkfs.reiser4 /dev/md0
> mkfs.reiser4 1.0.4
> Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by 
> reiser4progs/COPYING. 
> 
> Block size 4096 will be used.                                                 
> Linux 2.6.11.2 is detected.                                                   
> Uuid f15dfd7a-8112-4f0a-96af-5ab781bdd2e4 will be used.                       
> Fatal: The partition size is too big.                                         
> Reiser4 is going to be created on /dev/md0.                                   
> (Yes/No): yes
> Fatal: The partition size is too big.                                         
> Error: Can't initialize block allocator. 
> Error: Can't create filesystem on /dev/md0.
> 
> Unfortunately reiser4 cannot make the large partition. I have yet to use
> reiser3.6 assuming that reiser4 is the successor.
> 
> Could someone please advise how I would get reiserfs on my large partition.
> 
> Thanks,
> Naveen Nathan
> 
> 

--Boundary-00=_GKaNCBnHw7mtJKQ
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

--Boundary-00=_GKaNCBnHw7mtJKQ
Content-Type: text/x-diff;
  charset="koi8-r";
  name="reiser4progs-64off.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiser4progs-64off.patch"

===== configure.in 1.241 vs edited =====
--- 1.241/configure.in	2005-02-20 13:10:00 +03:00
+++ edited/configure.in	2005-03-14 17:19:33 +03:00
@@ -417,9 +413,12 @@ fi
 # Check for large file
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

--Boundary-00=_GKaNCBnHw7mtJKQ--
