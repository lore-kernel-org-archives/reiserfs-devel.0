From: "Dale Farnsworth" <Dale.Farnsworth@mvista.com>
Subject: mips requires alignment for ext2_*_bit functions
Date: Thu, 28 Mar 2002 16:43:54 -0700
Message-ID: <20020328234354.GJ5732@cuzco.az.mvista.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

We see immediate alignment failures using reiserfs on mips systems.

The problems go away with the following patch.

-Dale Farnsworth



Index: linux/include/linux/reiserfs_fs.h
===================================================================
RCS file: /cvsdev/hhl-2.4.17/linux/include/linux/reiserfs_fs.h,v
retrieving revision 1.3
diff -u -r1.3 reiserfs_fs.h
--- linux/include/linux/reiserfs_fs.h	2002/01/10 19:46:23	1.3
+++ linux/include/linux/reiserfs_fs.h	2002/03/27 21:59:07
@@ -847,7 +847,7 @@
 #define DEH_Visible 2
 
 /* 64 bit systems (and the S/390) need to be aligned explicitly -jdm */
-#if BITS_PER_LONG == 64 || defined(__s390__) || defined(__hppa__)
+#if BITS_PER_LONG == 64 || defined(__s390__) || defined(__hppa__) || defined(__mips__)
 #   define ADDR_UNALIGNED_BITS  (3)
 #endif
 
