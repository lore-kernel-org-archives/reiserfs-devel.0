From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: reiserfsprogs 3.6.16 release
Date: Fri, 14 May 2004 00:54:45 +0200
Message-ID: <20040514005445.4946e2a3@philou.gramoulle.local>
References: <200405132235.15380.vitaly@namesys.com>
	<20040513203526.GA2007@raptus.homelinux.org>
	<200405140045.45433.vitaly@namesys.com>
	<20040513221153.GA11191@raptus.homelinux.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="Multipart=_Fri__14_May_2004_00_54_45_+0200_YbIQ/GfS2XMqpwNG"
Return-path: <reiserfs-list-return-18666-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040513221153.GA11191@raptus.homelinux.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Multipart=_Fri__14_May_2004_00_54_45_+0200_YbIQ/GfS2XMqpwNG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hello,

The attached patch fixes the compilation issue.

Thanks,

Philippe

--Multipart=_Fri__14_May_2004_00_54_45_+0200_YbIQ/GfS2XMqpwNG
Content-Type: text/plain;
 name="misc.h.diff"
Content-Disposition: attachment;
 filename="misc.h.diff"
Content-Transfer-Encoding: 7bit

--- reiserfsprogs-3.6.16.orig/include/misc.h	2004-02-17 13:20:40.000000000 +0100
+++ reiserfsprogs-3.6.16.patched/include/misc.h	2004-05-14 00:49:31.000000000 +0200
@@ -154,14 +154,11 @@
     tmp >>= from;\
     return tmp;
 
-#if 0
 #ifndef major
 #define major(rdev)      ((rdev)>>8)
 #define minor(rdev)      ((rdev) & 0xff)
 #endif /* major */
-#endif
 
-#if 0
 #ifndef SCSI_DISK_MAJOR
 #define SCSI_DISK_MAJOR(maj) ((maj) == SCSI_DISK0_MAJOR || \
 			     ((maj) >= SCSI_DISK1_MAJOR && (maj) <= SCSI_DISK7_MAJOR))
@@ -184,6 +181,5 @@
 			     (maj) == IDE4_MAJOR || (maj) == IDE5_MAJOR)
 #endif /* IDE9_MAJOR */
 #endif /* IDE_DISK_MAJOR */
-#endif
 
 #endif /* REISERFS_MISC_H */

--Multipart=_Fri__14_May_2004_00_54_45_+0200_YbIQ/GfS2XMqpwNG--
