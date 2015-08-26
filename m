From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: Change default behavior on IO errors
Date: Wed, 26 Aug 2015 10:59:35 +0200
Message-ID: <55DD7FF7.8010401@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010406040601060501000006"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-type;
        bh=wlVNkjSMz5x5Xyqm/FMANnh4JCbJS90v2WnAx+pOxpU=;
        b=x6BTu/4IebKnH8Gd+2cdnBmZHYKAedR1QwnGTmFouXpkjFLNeDCBPuws+RFREwj95v
         wG7wQ4M2t1EBmymr3WJ8Fmra1kf4sYfThcNjMGJbFXAmua4NXU/mlcv8KRgi00eUf3mC
         6Ti/Bl06YjSQeYUgU/CzcgTes5Gmn7djkucL6xnNWDvCyuhvLKxzjbqximClUcqqpy8x
         QhG7VMa2130dsq4WSJ8TU8RMfjy0kA7xrvu2Cg/T9PwwlK734TFdAbz2Jyy4EgvpIC1y
         2MLfpvuK9YMe7djIAX9a1y2Jq5RwM9jk5FjfD7fZjFVPPTdCLXDEyL8RSk3XcvOnmv6q
         nPnQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------010406040601060501000006
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------010406040601060501000006
Content-Type: text/x-patch;
 name="reiser4-change-default-behavior-on-error.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-change-default-behavior-on-error.patch"

Change default behavior on IO errors to "remount readonly";
Improve compatibility warnings.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/init_super.c                       |    2 -
 fs/reiser4/plugin/disk_format/disk_format40.c |   31 +++++++++++++++-----------
 2 files changed, 19 insertions(+), 14 deletions(-)

--- a/fs/reiser4/init_super.c
+++ b/fs/reiser4/init_super.c
@@ -533,7 +533,7 @@ int reiser4_init_super_data(struct super
 			.oneof = {
 				.result = &sbinfo->onerror,
 				.list = {
-					"panic", "remount-ro", NULL
+					"remount-ro", "panic", NULL
 				},
 			}
 		}
--- a/fs/reiser4/plugin/disk_format/disk_format40.c
+++ b/fs/reiser4/plugin/disk_format/disk_format40.c
@@ -91,12 +91,12 @@ static int update_backup_version(const f
 
 static int update_disk_version_minor(const format40_disk_super_block * sb)
 {
-	return (get_format40_version(sb) < PLUGIN_LIBRARY_VERSION);
+	return (get_format40_version(sb) < get_release_number_minor());
 }
 
 static int incomplete_compatibility(const format40_disk_super_block * sb)
 {
-	return (get_format40_version(sb) > PLUGIN_LIBRARY_VERSION);
+	return (get_format40_version(sb) > get_release_number_minor());
 }
 
 static format40_super_info *get_sb_info(struct super_block *super)
@@ -321,10 +321,14 @@ static int try_init_format40(struct supe
 	       super->s_id,
 	       get_format40_version(sb_copy));
 	if (incomplete_compatibility(sb_copy))
-		printk("reiser4: Warning: The last completely supported "
-		       "version of disk format40 is %u. Some objects of "
-		       "the semantic tree can be unaccessible.\n",
-		       PLUGIN_LIBRARY_VERSION);
+		printk("reiser4 (%s): format version number (4.0.%u) is "
+		       "greater than release number (4.%u.%u) of reiser4 "
+		       "kernel module. Some objects of the volume can be "
+		       "inaccessible.\n",
+		       super->s_id,
+		       get_format40_version(sb_copy),
+		       get_release_number_major(),
+		       get_release_number_minor());
 	/* make sure that key format of kernel and filesystem match */
 	result = check_key_format(sb_copy);
 	if (result) {
@@ -371,9 +375,8 @@ static int try_init_format40(struct supe
 	kfree(sb_copy);
 
 	if (update_backup_version(sb_copy))
-		printk("reiser4: Warning: metadata backup is not updated. "
-		       "Please run 'fsck.reiser4 --fix' on %s.\n",
-		       super->s_id);
+		printk("reiser4 (%s): use 'fsck.reiser4 --fix' "
+		       "to complete disk format upgrade.\n", super->s_id);
 
 	sbinfo->fsuid = 0;
 	sbinfo->fs_flags |= (1 << REISER4_ADG);	/* hard links for directories
@@ -617,12 +620,14 @@ int version_update_format40(struct super
 	if (super->s_flags & MS_RDONLY)
  		return 0;
 
-	if (get_super_private(super)->version >= PLUGIN_LIBRARY_VERSION)
+	if (get_super_private(super)->version >= get_release_number_minor())
 		return 0;
 
-	printk("reiser4: Updating disk format to 4.0.%u. The reiser4 metadata "
-	       "backup is left unchanged. Please run 'fsck.reiser4 --fix' "
-	       "on %s to update it too.\n", PLUGIN_LIBRARY_VERSION, super->s_id);
+	printk("reiser4 (%s): upgrading disk format to 4.0.%u.\n",
+	       super->s_id,
+	       get_release_number_minor());
+	printk("reiser4 (%s): use 'fsck.reiser4 --fix' "
+	       "to complete disk format upgrade.\n", super->s_id);
 
 	/* Mark the uber znode dirty to call log_super on write_logs. */
 	init_lh(&lh);

--------------010406040601060501000006--
