From: Ludwig Nussel <ludwig.nussel@suse.de>
Subject: [PATCH] mkreiserfs: set the owner of the root directory to the
	calling user
Date: Fri, 14 Mar 2008 09:39:37 +0100
Message-ID: <20080314083937.GA3634@suse.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hi,

Following patch sets the owner of the root directory to the calling
user.

This is also how mke2fs behaves. It enables users to e.g. create a
file system on removeable storage devices and then be able to
actually use them.

Signed-off-by: Ludwig Nussel <ludwig.nussel@suse.de>
Acked-by: Jeff Mahoney <jeffm@suse.com>

Index: reiserfsprogs-3.6.19/reiserfscore/reiserfslib.c
===================================================================
--- reiserfsprogs-3.6.19.orig/reiserfscore/reiserfslib.c
+++ reiserfsprogs-3.6.19/reiserfscore/reiserfslib.c
@@ -1142,6 +1142,19 @@ int create_dir_sd (reiserfs_filsys_t * f
     memset(&sd, 0, sizeof(sd));
     make_dir_stat_data (fs->fs_blocksize, key_format, get_key_dirid (key),
 			get_key_objectid (key), &ih, &sd);
+    
+    /* if calling user is not root set the owner of the root entry
+     * to the calling user */
+    if(getuid()) {
+	if (key_format == KEY_FORMAT_1) {
+	    struct stat_data_v1 *sd_v1 = (struct stat_data_v1 *)&sd;
+	    set_sd_v1_uid (sd_v1, getuid());
+	    set_sd_v1_gid (sd_v1, getgid());
+	} else {
+	    set_sd_v2_uid (&sd, getuid());
+	    set_sd_v2_gid (&sd, getgid());
+	}
+    }
 
     if (modify_item)
 	modify_item (&ih, &sd);

-- 
 (o_   Ludwig Nussel
 //\   
 V_/_  http://www.suse.de/
SUSE LINUX Products GmbH, GF: Markus Rex, HRB 16746 (AG Nuernberg)
