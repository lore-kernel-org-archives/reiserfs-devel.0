From: Chris Mason <mason@suse.com>
Subject: Re: [RFC] [PATCH] Label support in mount
Date: 29 Aug 2002 08:14:29 -0400
Message-ID: <1030623269.17778.332.camel@tiny>
References: <20020829052041.GDJC14185.rwcrmhc51.attbi.com@rwcrwbc58>
	<20020829052400.GD19435@clusterfs.com>  <3D6DC28C.70007@attbi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11342-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D6DC28C.70007@attbi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jordan Breeding <jordan.breeding@attbi.com>
Cc: Andreas Dilger <adilger@clusterfs.com>, reiserfs-list@namesys.com

On Thu, 2002-08-29 at 02:43, Jordan Breeding wrote:
> Andreas Dilger wrote:
> > On Aug 29, 2002  05:20 +0000, jordan.breeding@attbi.com wrote:
> > 
> >>  This patch was originally intended to try and add
> >>support for reiserfs labels to mount from
> >>util-linux-2.11u found on ftp.kernel.org.  It is not
> >>quite working (if I try to mount something by label the
> >>mount program seg. faults), and I won't have time to
> >>debug and look at it until at least tomorrow night.  I am
> >>sure there is something trivial or stupid that I have
> >>done wrong.  At least it is a starting point, if someone
> >>knows what is wrong and knows how to fix it quickly then
> >>feel free to fix the patch and send it back to me or send
> >>it to the util-linux maintainer.
> > 

Hi Jordan,

Here's my current patch, the only bug is that can detect 3.5.x
filesystems with a relocated journal as 3.6.x (with a label/uuid).

Once I get that fixed I'll send along to the mount maintainer:

diff -ur util-linux-2.11u/mount/linux_fs.h util-linux-2.11u.mason/mount/linux_fs.h
--- util-linux-2.11u/mount/linux_fs.h	Sat Aug  3 17:09:43 2002
+++ util-linux-2.11u.mason/mount/linux_fs.h	Mon Aug 19 14:36:30 2002
@@ -83,9 +83,15 @@
 	u_char		s_oid_cursize[2];
 	u_char		s_state[2];
 	u_char		s_magic[12];
+
+	/* only valid in 3.6.x format --mason@suse.com */
+	u_char          s_dummy[20];
+	u_char          s_uuid[16];
+	u_char          s_label[16];
 };
 #define REISERFS_SUPER_MAGIC_STRING "ReIsErFs"
 #define REISER2FS_SUPER_MAGIC_STRING "ReIsEr2Fs"
+#define REISER2FS_JR_SUPER_MAGIC_STRING "ReIsEr3Fs"
 #define REISERFS_DISK_OFFSET_IN_BYTES (64 * 1024)
 /* the spot for the super in versions 3.5 - 3.5.10 (inclusive) */
 #define REISERFS_OLD_DISK_OFFSET_IN_BYTES (8 * 1024)
diff -ur util-linux-2.11u/mount/mount_by_label.c util-linux-2.11u.mason/mount/mount_by_label.c
--- util-linux-2.11u/mount/mount_by_label.c	Sat Aug  3 20:07:10 2002
+++ util-linux-2.11u.mason/mount/mount_by_label.c	Mon Aug 19 14:37:39 2002
@@ -17,6 +17,8 @@
  * - Added JFS v2 format support
  * 2002-07-26 Luciano Chavez <lnx1138@us.ibm.com>
  * - Added EVMS support
+ * 2002-08-19 Chris Mason <mason@suse.com>
+ * - Added ReiserFS support
  */
 
 #include <stdio.h>
@@ -69,6 +71,24 @@
 	return (mdsbmagic(mdsb) == MD_SB_MAGIC);
 }
 
+static int valid_reiserfs_v2_super(struct reiserfs_super_block *s) {
+
+	/* only 3.6.x format supers have labels or uuids */
+	if (!strncmp(s->s_magic, REISER2FS_SUPER_MAGIC_STRING,
+	            strlen(REISER2FS_SUPER_MAGIC_STRING)) ||
+	    !strncmp(s->s_magic, REISER2FS_JR_SUPER_MAGIC_STRING,
+	            strlen(REISER2FS_JR_SUPER_MAGIC_STRING))) {
+		return 1;
+	}
+
+	/* old format disks won't have a 3.6.x super in their log
+	 * area.  They might have a 3.5.x super in there, but not
+	 * a new format one.  So, we don't need to do any special
+	 * checks to make sure we aren't inside the log
+	 */
+        return 0;
+}
+
 /* for now, only ext2, ext3 and xfs are supported */
 static int
 get_label_uuid(const char *device, char **label, char *uuid) {
@@ -81,6 +101,7 @@
 	struct ext2_super_block e2sb;
 	struct xfs_super_block xfsb;
 	struct jfs_super_block jfssb;
+	struct reiserfs_super_block reisersb;
 
 	fd = open(device, O_RDONLY);
 	if (fd < 0)
@@ -127,6 +148,18 @@
 			    memcpy(*label, jfssb.s_label, namesize);
 		    }
 		    rv = 0;
+        }
+        else if (lseek(fd, REISERFS_DISK_OFFSET_IN_BYTES, SEEK_SET) ==
+                       REISERFS_DISK_OFFSET_IN_BYTES &&
+                 read(fd, (char *) &reisersb, sizeof(reisersb)) ==
+                      sizeof(reisersb)
+                && valid_reiserfs_v2_super(&reisersb)) {
+ 
+                memcpy(uuid, reisersb.s_uuid, sizeof(reisersb.s_uuid));
+                namesize = sizeof(reisersb.s_label);
+                if ((*label = calloc(namesize + 1, 1)) != NULL)
+                        memcpy(*label, reisersb.s_label, namesize);
+                rv = 0;
 	}
 
 	close(fd);
diff -ur util-linux-2.11u/mount/mount_guess_fstype.c util-linux-2.11u.mason/mount/mount_guess_fstype.c
--- util-linux-2.11u/mount/mount_guess_fstype.c	Sat Aug  3 18:22:07 2002
+++ util-linux-2.11u.mason/mount/mount_guess_fstype.c	Mon Aug 19 14:36:30 2002
@@ -221,7 +221,9 @@
     return (!strncmp (rs->s_magic, REISERFS_SUPER_MAGIC_STRING, 
 		      strlen ( REISERFS_SUPER_MAGIC_STRING)) ||
 	    !strncmp (rs->s_magic, REISER2FS_SUPER_MAGIC_STRING, 
-		      strlen ( REISER2FS_SUPER_MAGIC_STRING)));
+		      strlen ( REISER2FS_SUPER_MAGIC_STRING))||
+	    !strncmp (rs->s_magic, REISER2FS_JR_SUPER_MAGIC_STRING, 
+		      strlen ( REISER2FS_JR_SUPER_MAGIC_STRING)));
 }
 
 char *

