From: Jordan Breeding <jordan.breeding@attbi.com>
Subject: Re: [RFC] [PATCH] Label support in mount
Date: Thu, 29 Aug 2002 01:43:24 -0500
Message-ID: <3D6DC28C.70007@attbi.com>
References: <20020829052041.GDJC14185.rwcrmhc51.attbi.com@rwcrwbc58> <20020829052400.GD19435@clusterfs.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070000020301010600010907"
Return-path: <reiserfs-list-return-11338-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andreas Dilger <adilger@clusterfs.com>
Cc: reiserfs-list@namesys.com

--------------070000020301010600010907
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Andreas Dilger wrote:
> On Aug 29, 2002  05:20 +0000, jordan.breeding@attbi.com wrote:
> 
>>  This patch was originally intended to try and add
>>support for reiserfs labels to mount from
>>util-linux-2.11u found on ftp.kernel.org.  It is not
>>quite working (if I try to mount something by label the
>>mount program seg. faults), and I won't have time to
>>debug and look at it until at least tomorrow night.  I am
>>sure there is something trivial or stupid that I have
>>done wrong.  At least it is a starting point, if someone
>>knows what is wrong and knows how to fix it quickly then
>>feel free to fix the patch and send it back to me or send
>>it to the util-linux maintainer.
> 
> 
> No patch.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> http://sourceforge.net/projects/ext2resize/
> 
> 

Sorry about that.  The patch is attached this time.

Jordan Breeding

--------------070000020301010600010907
Content-Type: text/plain;
 name="util-linux-2.11u-patch-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="util-linux-2.11u-patch-1"

diff -urN util-linux-2.11u/mount/linux_fs.h util-linux-2.11u-patched/mount/linux_fs.h
--- util-linux-2.11u/mount/linux_fs.h	2002-08-03 16:09:43.000000000 -0500
+++ util-linux-2.11u-patched/mount/linux_fs.h	2002-08-29 00:54:27.000000000 -0500
@@ -83,12 +83,24 @@
 	u_char		s_oid_cursize[2];
 	u_char		s_state[2];
 	u_char		s_magic[12];
+	u_char		s_hash_function_code[4];
+	u_char		s_tree_height[2];
+	u_char		s_bmap_nr[2];
+	u_char		s_version[2];
+	u_char		s_reserved[2];
+	u_char		s_inode_generation[4];
+	u_char		s_flags[4];
+	u_char		s_uuid[16];
+	u_char		s_label[16];
+	u_char		s_unused[88];
 };
 #define REISERFS_SUPER_MAGIC_STRING "ReIsErFs"
 #define REISER2FS_SUPER_MAGIC_STRING "ReIsEr2Fs"
 #define REISERFS_DISK_OFFSET_IN_BYTES (64 * 1024)
 /* the spot for the super in versions 3.5 - 3.5.10 (inclusive) */
 #define REISERFS_OLD_DISK_OFFSET_IN_BYTES (8 * 1024)
+#define reiserfsmagic(s)	assemble2le(s.s_magic)
+
 
 #define _XIAFS_SUPER_MAGIC 0x012FD16D
 struct xiafs_super_block {
diff -urN util-linux-2.11u/mount/mount_by_label.c util-linux-2.11u-patched/mount/mount_by_label.c
--- util-linux-2.11u/mount/mount_by_label.c	2002-08-03 19:07:10.000000000 -0500
+++ util-linux-2.11u-patched/mount/mount_by_label.c	2002-08-29 00:55:46.000000000 -0500
@@ -81,6 +81,7 @@
 	struct ext2_super_block e2sb;
 	struct xfs_super_block xfsb;
 	struct jfs_super_block jfssb;
+	struct reiserfs_super_block rfssb;
 
 	fd = open(device, O_RDONLY);
 	if (fd < 0)
@@ -128,6 +129,15 @@
 		    }
 		    rv = 0;
 	}
+	else if (lseek(fd, REISERFS_DISK_OFFSET_IN_BYTES, SEEK_SET) == REISERFS_DISK_OFFSET_IN_BYTES
+			&& read(fd, (char *) &rfssb, sizeof(rfssb)) == sizeof(rfssb)
+		&& (reiserfsmagic(rfssb) == REISER2FS_SUPER_MAGIC_STRING)) {
+			memcpy(uuid, rfssb.s_uuid, sizeof(rfssb.s_uuid));
+			namesize = sizeof(rfssb.s_label);
+			if ((*label = calloc(namesize + 1, 1)) != NULL)
+				memcpy(*label, rfssb.s_label, namesize);
+			rv = 0;
+	}
 
 	close(fd);
 	return rv;

--------------070000020301010600010907--

