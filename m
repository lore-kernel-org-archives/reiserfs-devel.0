From: fs <fs@ercist.iscas.ac.cn>
Subject: [PATCH][RESEND] ReiserFS file.c several bug-fix
Date: Thu, 14 Jul 2005 13:51:14 -0400
Message-ID: <1121363345.2818.7.camel@CoolQ>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-EDd78B998CgAqYxDqR/I"
Return-path: <reiserfs-list-return-25127-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list <reiserfs-list@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>, Hans Reiser <reiser@namesys.com>

--=-EDd78B998CgAqYxDqR/I
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Dear Hans Reiser,
    This is the third time I send this patch.
    Hope the bug can be handled ASAP 'cause it's really serious.

Related FS:
    ReiserFS

Related Files:
    fs/reiserfs/file.c

Bug description:
    Make a ReiserFS partition in USB storage HDD, create a test file
with enough size(dd if=/dev/zero of=testfile bs=4096 count=1024).
    Write a program, do: 
        int fd;
        char buf[4096];
 
        fd = open("testfile", O_RDWRO | O_CREAT | O_SYNC,
                (S_IRWXU | S_IRWXG | S_IRWXO) );
        or
        open("testfile", O_RDWRO | O_CREAT | O_DSYNC,
                (S_IRWXU | S_IRWXG | S_IRWXO) );

        write(fd, buf, sizeof(buf));
        close(fd); 

After each operation, pause for a while, such as 3s. Between open and
write, unlug the USB wire. write returns no error instead of -EIO .

Bug analysis:
    reiserfs_file_write will claim some blocks, commit the I/O request,
if O_SYNC and O_DSYNC is used, it will
    if ((file->f_flags & O_SYNC) || IS_SYNC(inode))
        res = generic_osync_inode(inode, file->f_mapping,
                                  OSYNC_METADATA|OSYNC_DATA);
The question is, if I/O error occurs,       
        res = reiserfs_allocate_blocks_for_region fails with -EIO, so
it will exit the loop, no I/O request, no page marked as dirty.
If generic_osync_inode runs, it returns 0(no dirty page), res will be
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


--=-EDd78B998CgAqYxDqR/I
Content-Disposition: attachment; filename=reiserfs_write.diff
Content-Type: text/x-patch; name=reiserfs_write.diff; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

--- linux-2.6.12/fs/reiserfs/file.c	2005-06-23 14:59:27.000000000 -0400
+++ linux-2.6.12-new/fs/reiserfs/file.c	2005-06-23 15:34:49.000000000 -0400
@@ -1306,7 +1306,7 @@ static ssize_t reiserfs_file_write( stru
 	   so that nobody else can access these until we are done.
 	   We get number of actual blocks needed as a result.*/
 	blocks_to_allocate = reiserfs_prepare_file_region_for_write(inode, pos, num_pages, write_bytes, prepared_pages);
-	if ( blocks_to_allocate < 0 ) {
+	if ( IS_ERROR((const void *)blocks_to_allocate) ) {
 	    res = blocks_to_allocate;
 	    reiserfs_release_claimed_blocks(inode->i_sb, num_pages << (PAGE_CACHE_SHIFT - inode->i_blkbits));
 	    break;
@@ -1363,6 +1363,10 @@ static ssize_t reiserfs_file_write( stru
         }
     }
 
+    /* If nothing is written, no need(actually, mustn't) to sync pages, just return res */
+    if( already_written == 0 )
+	    goto out;
+    
     if ((file->f_flags & O_SYNC) || IS_SYNC(inode))
 	res = generic_osync_inode(inode, file->f_mapping, OSYNC_METADATA|OSYNC_DATA);
 

--=-EDd78B998CgAqYxDqR/I--


