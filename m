From: fs <fs@ercist.iscas.ac.cn>
Subject: [PATCH] ReiserFS file.c several bug-fix
Date: Thu, 23 Jun 2005 15:27:11 -0400
Message-ID: <1119554831.3026.99.camel@CoolQ>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-65WTcPxQC0qgOeCsw3Yy"
Return-path: <reiserfs-list-return-24490-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list <reiserfs-list@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, Vladimir Saveliev <vs@namesys.com>, iscas-linaccident <iscas-linaccident@intellilink.co.jp>

--=-65WTcPxQC0qgOeCsw3Yy
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Related FS:
    ReiserFS

Related Files:
    fs/reiserfs/file.c

Bug description:
    Make a ReiserFS partition in USB storage HDD, create a test file
with enough size.
    Write a program, do: open(O_SYNC/O_DSYNC) - read - close. After each
operation, pause for a while, such as 3s. Between open and read, unlug
the USB wire. open returns zero-filled buffer, no error returns.

Bug analysis:
    reiserfs_file_write will claim some blocks, commit the I/O request,
if O_SYNC and O_DSYNC is used, it will
    if ((file->f_flags & O_SYNC) || IS_SYNC(inode))
	res = generic_osync_inode(inode, file->f_mapping,
                                  OSYNC_METADATA|OSYNC_DATA);
The question is, if I/O error occurs, 	    
        res = reiserfs_allocate_blocks_for_region fails with -EIO, so
it will exit the loop, no I/O request, no page marked as dirty.
If run generic_osync_inode, it returns 0(no dirty page), res will be
overwritten from -EIO to 0, thus no error report.

Also,  reiserfs_file_write contains a serious bug, see here
	blocks_to_allocate = reiserfs_prepare_file_region_for_write
		(inode, pos, num_pages, write_bytes, prepared_pages);
Here blocks_to_allocate is defined as size_t, i.e. unsigned int, but
reiserfs_prepare_file_region_for_write is declared as int, so sometimes
it will return -EIO, -ENOENT, etc, take a look at this line
	if ( blocks_to_allocate < 0 ) { <- This will never happen
	    res = blocks_to_allocate;
	    reiserfs_release_claimed_blocks(inode->i_sb, 
		num_pages << (PAGE_CACHE_SHIFT - inode->i_blkbits));
	    break;
	}

Way around:
1) if already_written is zero, don't do generic_osync_inode
2) tell the result of reiserfs_prepare_file_region_for_write with IS_ERR
   macro or cast it to size_t

Signed-off-by: Qu Fuping<fs@ercist.iscas.ac.cn>

Patch:
diff -uNp linux-2.6.12/fs/reiserfs/file.c
linux-2.6.12-new/fs/reiserfs/file.c



--=-65WTcPxQC0qgOeCsw3Yy
Content-Disposition: attachment; filename=reiserfs_write.diff
Content-Type: text/x-patch; name=reiserfs_write.diff; charset=gb2312
Content-Transfer-Encoding: 7bit

--- linux-2.6.12/fs/reiserfs/file.c	2005-06-23 14:59:27.000000000 -0400
+++ linux-2.6.12-new/fs/reiserfs/file.c	2005-06-23 15:18:09.000000000 -0400
@@ -225,12 +225,6 @@ static int reiserfs_allocate_blocks_for_
     hint.preallocate = will_prealloc;
 
     /* Call block allocator to allocate blocks */
-    res = reiserfs_allocate_blocknrs(&hint, allocated_blocks, blocks_to_allocate, blocks_to_allocate);
-    if ( res != CARRY_ON ) {
-	if ( res == NO_DISK_SPACE ) {
-	    /* We flush the transaction in case of no space. This way some
-	       blocks might become free */
-	    SB_JOURNAL(inode->i_sb)->j_must_wait = 1;
 	    res = restart_transaction(th, inode, &path);
             if (res)
                 goto error_exit;
@@ -1306,7 +1300,7 @@ static ssize_t reiserfs_file_write( stru
 	   so that nobody else can access these until we are done.
 	   We get number of actual blocks needed as a result.*/
 	blocks_to_allocate = reiserfs_prepare_file_region_for_write(inode, pos, num_pages, write_bytes, prepared_pages);
-	if ( blocks_to_allocate < 0 ) {
+	if ( IS_ERROR((const void *)blocks_to_allocate) ) {
 	    res = blocks_to_allocate;
 	    reiserfs_release_claimed_blocks(inode->i_sb, num_pages << (PAGE_CACHE_SHIFT - inode->i_blkbits));
 	    break;
@@ -1363,6 +1357,10 @@ static ssize_t reiserfs_file_write( stru
         }
     }
 
+    /* If nothing is written, no need(actually, mustn't) to sync pages, just return res */
+    if( already_written == 0 )
+	    goto out;
+    
     if ((file->f_flags & O_SYNC) || IS_SYNC(inode))
 	res = generic_osync_inode(inode, file->f_mapping, OSYNC_METADATA|OSYNC_DATA);
 

--=-65WTcPxQC0qgOeCsw3Yy--


