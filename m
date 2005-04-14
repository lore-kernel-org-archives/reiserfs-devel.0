From: Jan Kara <jack@suse.cz>
Subject: [PATCH] Fix rewriting on a full reiserfs filesystem
Date: Thu, 14 Apr 2005 14:02:23 +0200
Message-ID: <20050414120223.GG18727@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="/9DWx/yDrRhgMJTb"
Return-path: <reiserfs-list-return-23877-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: akpm@osdl.org
Cc: mason@suse.com, reiserfs-list@namesys.com

--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hello,

  attached patch fixes rewriting of a file on a full reiserfs
filesystem. Previously it was impossible to write to a file even if we
needed no empty block. The patch allows rewriting of a file and also
extension of a file upto the end of the last allocated block. The patch
applies fine also against 2.6.12-rc2 kernel.

								Honza

-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs

--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="reiserrewrite-2.6.5.diff"

Allow rewriting of a file and extending a file upto the end of the allocated
block on a full filesystem.

From: Chris Mason <mason@suse.com>
Signed-off-by: Jan Kara <jack@suse.cz>

diff -rupX /home/jack/.kerndiffexclude linux-2.6.5-SLES9_SP2/fs/reiserfs/file.c linux-2.6.5-SLES9_SP2-reiserrewrite/fs/reiserfs/file.c
--- linux-2.6.5-SLES9_SP2/fs/reiserfs/file.c	2005-04-13 13:56:08.000000000 +0200
+++ linux-2.6.5-SLES9_SP2-reiserrewrite/fs/reiserfs/file.c	2005-04-14 12:50:33.000000000 +0200
@@ -1303,10 +1303,11 @@ ssize_t reiserfs_file_write( struct file
 	reiserfs_claim_blocks_to_be_allocated(inode->i_sb, num_pages << (PAGE_CACHE_SHIFT - inode->i_blkbits));
 	reiserfs_write_unlock(inode->i_sb);
 
-	if ( !num_pages ) { /* If we do not have enough space even for */
-	    res = -ENOSPC;  /* single page, return -ENOSPC */
-	    if ( pos > (inode->i_size & (inode->i_sb->s_blocksize-1)))
-		break; // In case we are writing past the file end, break.
+	if ( !num_pages ) { /* If we do not have enough space even for a single page... */
+	    if ( pos > inode->i_size+inode->i_sb->s_blocksize-(pos & (inode->i_sb->s_blocksize-1))) {
+		res = -ENOSPC;
+		break; // In case we are writing past the end of the last file block, break.
+	    }
 	    // Otherwise we are possibly overwriting the file, so
 	    // let's set write size to be equal or less than blocksize.
 	    // This way we get it correctly for file holes.

--/9DWx/yDrRhgMJTb--
