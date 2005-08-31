From: Hifumi Hisashi <hifumi.hisashi@lab.ntt.co.jp>
Subject: [PATCH] fix problems related to journaling in Reiserfs
Date: Wed, 31 Aug 2005 21:39:25 +0900
Message-ID: <6.0.0.20.2.20050831191551.03fdbac0@129.60.53.12>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25746-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiser@namesys.com, reiserfs-dev@namesys.com
Cc: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

   Hello.

   I noticed that the Reiserfs has some problems related to meta-data journaling.
   I suppose that transactions regarding meta-data should be written to a 
disk every
meta-data change (for example, i_size is increased) in ordered-mode while 
synchronous
writing is performed. But, it seems to me the Reiserfs does not do that.

   I did a following test.
1, Mount the Reiserfs in ordered-mode.
2, Run the test program that opens a test file with O_SYNC|O_CREAT flag, 
and continues to
write 4bytes data in busy loop. Every write() is and its file size is 
increasing.
3, While above the program is running, disconnect SCSI cable.
4, Hexdump a disk and see journal on a disk.
5, Reboot a system and again mount the Reiserfs in ordered mode.

   I checked the size of file the test program created. I could not see 
whole content of this file
because file size was shorter than it should be. The cause of this problem 
is that
even though an i_size was changed, meta-data  was not logged to a journal 
area on disk
under synchronous writing.

   I did same test on Ext3, and there was no such a problem. Ext3(jbd) 
logged every change of
an i_size while an O_SYNC writing was being performed.

   Following patch fix this problem.

  Signed-off-by :Hisashi Hifumi<hifumi.hisashi@lab.ntt.co.jp>

diff -Nru linux-2.6.13/fs/reiserfs/file.c linux-2.6.13_fix/fs/reiserfs/file.c
--- linux-2.6.13/fs/reiserfs/file.c	2005-08-29 08:41:01.000000000 +0900
+++ linux-2.6.13_fix/fs/reiserfs/file.c	2005-08-31 16:33:33.000000000 +0900
@@ -819,7 +819,6 @@
  	int i;			// loop counter
  	int offset;		// Writing offset in page.
  	int orig_write_bytes = write_bytes;
-	int sd_update = 0;

  	for (i = 0, offset = (pos & (PAGE_CACHE_SIZE - 1)); i < num_pages;
  	     i++, offset = 0) {
@@ -855,17 +854,17 @@

  		if (th->t_trans_id) {
  			reiserfs_write_lock(inode->i_sb);
-			reiserfs_update_sd(th, inode);	// And update on-disk metadata
+			status = journal_end(th, th->t_super, th->t_blocks_allocated);
+        		if (status)
+            			retval = status;
  			reiserfs_write_unlock(inode->i_sb);
-		} else
-			inode->i_sb->s_op->dirty_inode(inode);
-
-		sd_update = 1;
+		}
+		mark_inode_dirty(inode);
+		th->t_trans_id = 0;
  	}
  	if (th->t_trans_id) {
  		reiserfs_write_lock(inode->i_sb);
-		if (!sd_update)
-			reiserfs_update_sd(th, inode);
+		reiserfs_update_sd(th, inode);
  		status = journal_end(th, th->t_super, th->t_blocks_allocated);
  		if (status)
  			retval = status;
@@ -1526,10 +1525,13 @@
  		}
  	}

-	if ((file->f_flags & O_SYNC) || IS_SYNC(inode))
+	if ((file->f_flags & O_SYNC) || IS_SYNC(inode)) {
  		res =
  		    generic_osync_inode(inode, file->f_mapping,
  					OSYNC_METADATA | OSYNC_DATA);
+		if (res)
+			already_written = 0;
+	}

  	up(&inode->i_sem);
  	reiserfs_async_progress_wait(inode->i_sb);
diff -Nru linux-2.6.13/fs/reiserfs/inode.c linux-2.6.13_fix/fs/reiserfs/inode.c
--- linux-2.6.13/fs/reiserfs/inode.c	2005-08-29 08:41:01.000000000 +0900
+++ linux-2.6.13_fix/fs/reiserfs/inode.c	2005-08-31 16:33:33.000000000 +0900
@@ -1642,6 +1642,7 @@
  {
  	struct reiserfs_transaction_handle th;
  	int jbegin_count = 1;
+	int err = 0;

  	if (inode->i_sb->s_flags & MS_RDONLY)
  		return -EROFS;
@@ -1654,11 +1655,11 @@
  		reiserfs_write_lock(inode->i_sb);
  		if (!journal_begin(&th, inode->i_sb, jbegin_count)) {
  			reiserfs_update_sd(&th, inode);
-			journal_end_sync(&th, inode->i_sb, jbegin_count);
+			err = journal_end_sync(&th, inode->i_sb, jbegin_count);
  		}
  		reiserfs_write_unlock(inode->i_sb);
  	}
-	return 0;
+	return err;
  }

  /* stat data of new object is inserted already, this inserts the item

Thanks, 

