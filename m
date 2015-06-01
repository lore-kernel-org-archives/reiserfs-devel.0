From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch] reiser4: adjust to backing_dev_info cleanups
Date: Mon, 01 Jun 2015 17:39:29 +0200
Message-ID: <556C7CB1.8060804@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060201050906070909010809"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=S/5NNTUwamgnpSM08vmWdeAL3Qs9gMAkMZLa/cKI+ig=;
        b=AoqM/sV29OX/3BGwyDLsJ1wKTExuSIomlHDQeGcHs6m3xS8vlRG1ON1r7E2r2uVLbv
         8CPdPdwbGIfVM0TUTpoIZc1gLKkkTsuiDSqE1w+AB1XM0QUzoZx8PR2fZDDR08oC3naW
         h/8iz5KBir2UR/H8N5nZAWG1jgFh/6aST5pkUnoCeptZdhAIuwGTee24oyZqo7FJGwyM
         Tde1kfvfqRKZSQjA6TMg1GrqQNFvUh5O5ariqVFBlmG0nxJ5lpg5gcAUAfhgaUqO8Nrp
         O+Qs6/BwFoYDmSzr/MPI36sodIfJDeQHumNmvibxqoRsqZ5kcEAjzHNss2ztMV7llTXD
         dRwg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------060201050906070909010809
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

This patch adjust reiser4 to the following cleanups (which went to 4.0):
http://comments.gmane.org/gmane.linux.kernel.mm/126636

Thanks,
Edward.

--------------060201050906070909010809
Content-Type: text/x-patch;
 name="reiser4-adjust-to-backing_dev_info-cleanups.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-adjust-to-backing_dev_info-cleanups.patch"

diff -u -r linux-3.19.8/fs/reiser4/entd.c linux-4.0.4/fs/reiser4/entd.c
--- linux-3.19.8/fs/reiser4/entd.c	2015-06-01 17:28:24.040010884 +0200
+++ linux-4.0.4/fs/reiser4/entd.c	2015-06-01 14:06:01.099574357 +0200
@@ -258,7 +258,7 @@
 		 * (via igrab), so that shutdown_super() will wait
 		 * (on reiser4_put_super) for entd completion.
 		 */
-		wb = &rq->mapping->backing_dev_info->wb;
+		wb = &inode_to_bdi(rq->mapping->host)->wb;
 
 		spin_lock(&wb->list_lock);
 		result = generic_writeback_sb_inodes(super,
diff -u -r linux-3.19.8/fs/reiser4/flush.c linux-4.0.4/fs/reiser4/flush.c
--- linux-3.19.8/fs/reiser4/flush.c	2015-06-01 17:28:24.043010909 +0200
+++ linux-4.0.4/fs/reiser4/flush.c	2015-06-01 13:59:18.362360470 +0200
@@ -474,7 +474,7 @@
 	struct backing_dev_info *bdi;
 
 	sb = reiser4_get_current_sb();
-	bdi = reiser4_get_super_fake(sb)->i_mapping->backing_dev_info;
+	bdi = inode_to_bdi(reiser4_get_super_fake(sb));
 	return bdi_write_congested(bdi);
 }
 
diff -u -r linux-3.19.8/fs/reiser4/plugin/file/file_conversion.c linux-4.0.4/fs/reiser4/plugin/file/file_conversion.c
--- linux-3.19.8/fs/reiser4/plugin/file/file_conversion.c	2015-06-01 17:28:24.055011009 +0200
+++ linux-4.0.4/fs/reiser4/plugin/file/file_conversion.c	2015-06-01 14:00:49.807093605 +0200
@@ -529,7 +529,7 @@
 	ctx = reiser4_init_context(inode->i_sb);
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
-	current->backing_dev_info = inode->i_mapping->backing_dev_info;
+	current->backing_dev_info = inode_to_bdi(inode);
 	init_dispatch_context(&cont);
 	mutex_lock(&inode->i_mutex);
 	/**
diff -u -r linux-3.19.8/fs/reiser4/super_ops.c linux-4.0.4/fs/reiser4/super_ops.c
--- linux-3.19.8/fs/reiser4/super_ops.c	2015-06-01 17:28:24.071011142 +0200
+++ linux-4.0.4/fs/reiser4/super_ops.c	2015-06-01 14:05:21.852267844 +0200
@@ -430,7 +430,7 @@
 			"reiser4_capture_super_block failed in write_super: %d",
 			ret);
 
-	wb = &reiser4_get_super_fake(super)->i_mapping->backing_dev_info->wb;
+	wb = &inode_to_bdi(reiser4_get_super_fake(super))->wb;
 	spin_lock(&wb->list_lock);
 	generic_writeback_sb_inodes(super, wb, &wbc, &work, true);
 	spin_unlock(&wb->list_lock);
diff -u -r linux-3.19.8/fs/reiser4/vfs_ops.c linux-4.0.4/fs/reiser4/vfs_ops.c
--- linux-3.19.8/fs/reiser4/vfs_ops.c	2015-06-01 17:28:24.075011176 +0200
+++ linux-4.0.4/fs/reiser4/vfs_ops.c	2015-06-01 14:04:33.372885989 +0200
@@ -144,7 +144,6 @@
 	long written = 0;
 	int repeats = 0;
 	int result;
-	struct address_space *mapping;
 
 	/*
 	 * Performs early flushing, trying to free some memory. If there
@@ -159,13 +158,12 @@
 	}
 
 	BUG_ON(reiser4_get_super_fake(sb) == NULL);
-	mapping = reiser4_get_super_fake(sb)->i_mapping;
 	do {
 		long nr_submitted = 0;
 		jnode *node = NULL;
 
 		/* do not put more requests to overload write queue */
-		if (bdi_write_congested(mapping->backing_dev_info)) {
+		if (bdi_write_congested(inode_to_bdi(reiser4_get_super_fake(sb)))) {
 			//blk_flush_plug(current);
 			break;
 		}

--------------060201050906070909010809--
