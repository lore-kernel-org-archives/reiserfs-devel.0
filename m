From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] [RESEND] ReiserFS _get_block_create_0 wrong behavior
 when	I/O fails
Date: Wed, 22 Jun 2005 23:19:03 -0700
Message-ID: <42BA5457.1090001@namesys.com>
References: <1119471578.22827.3.camel@CoolQ>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24483-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1119471578.22827.3.camel@CoolQ>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fs <fs@ercist.iscas.ac.cn>, Edward Shishkin <edward@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>, Vladimir Saveliev <vs@namesys.com>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

Thanks fs, Edward, can you or vs look at this?

Hans

fs wrote:

>Seems my domain is filtered , so I resend the modified version.
>
>Related FS:
>    ReiserFS
>
>Related Files:
>    fs/reiserfs/inode.c
>
>Bug description:
>    Make a ReiserFS partition in USB storage HDD, create a test file
>with
>enough size.
>    Write a program, do: open(O_RDONLY) - read - close. After each
>operation, pause for a while, such as 3s. Between open and read, unlug
>the
>USB wire. open returns zero-filled buffer, no error returns.
>
>Bug analysis:
>    do_mpage_readpage will call FS-specific get_block to get buffer
>mapped
>from disk. reiserfs_get_block doesn't return non-zero when I/O failure
>occurs.
>    reiserfs_get_block -> _get_block_create_0 ->
>search_by_position_by_key
>search_by_position_by_key returns IO_ERROR, but the original code just
>simply
>returns 0
>
>research:
>    if (search_for_position_by_key (inode->i_sb, &key, &path) !=
>POSITION_FOUND) {
>        pathrelse (&path);
>        if (p)
>            kunmap(bh_result->b_page) ;
>        // We do not return -ENOENT if there is a hole but page is
>uptodate, because it means
>        // That there is some MMAPED data associated with it that is yet
>to be written to disk.
>        if ((args & GET_BLOCK_NO_HOLE) &&
>!PageUptodate(bh_result->b_page) ) {
>            return -ENOENT ;
>        }
>        return 0 ; <- 0 retuns for IO_ERROR
>    }
>
>Way around:
>    test result of search_for_position_by_key
>
>Signed-off-by: Qu Fuping<fs@ercist.iscas.ac.cn>
>
>Patch:
>diff -uNp /tmp/linux-2.6.12-rc6/fs/reiserfs/inode.c
>/tmp/linux-2.6.12-rc6.new/fs/reiserfs/inode.c
>
>
>  
>
>------------------------------------------------------------------------
>
>--- linux-2.6.12-rc6.old/fs/reiserfs/inode.c	2005-06-06 11:22:29.000000000 -0400
>+++ linux-2.6.12-rc6.new/fs/reiserfs/inode.c	2005-06-17 16:12:18.000000000 -0400
>@@ -254,6 +254,7 @@ static int _get_block_create_0 (struct i
>     char * p = NULL;
>     int chars;
>     int ret ;
>+    int	result ;
>     int done = 0 ;
>     unsigned long offset ;
> 
>@@ -262,7 +263,8 @@ static int _get_block_create_0 (struct i
> 		  (loff_t)block * inode->i_sb->s_blocksize + 1, TYPE_ANY, 3);
> 
> research:
>-    if (search_for_position_by_key (inode->i_sb, &key, &path) != POSITION_FOUND) {
>+    result = search_for_position_by_key (inode->i_sb, &key, &path) ;
>+    if (result != POSITION_FOUND) {
> 	pathrelse (&path);
>         if (p)
>             kunmap(bh_result->b_page) ;
>@@ -270,7 +272,8 @@ research:
> 	// That there is some MMAPED data associated with it that is yet to be written to disk.
> 	if ((args & GET_BLOCK_NO_HOLE) && !PageUptodate(bh_result->b_page) ) {
> 	    return -ENOENT ;
>-	}
>+	}else if(result == IO_ERROR)
>+		return -EIO;
>         return 0 ;
>     }
>     
>@@ -382,7 +385,8 @@ research:
> 
> 	// update key to look for the next piece
> 	set_cpu_key_k_offset (&key, cpu_key_k_offset (&key) + chars);
>-	if (search_for_position_by_key (inode->i_sb, &key, &path) != POSITION_FOUND)
>+	result = search_for_position_by_key (inode->i_sb, &key, &path);
>+	if (result != POSITION_FOUND)
> 	    // we read something from tail, even if now we got IO_ERROR
> 	    break;
> 	bh = get_last_bh (&path);
>@@ -394,6 +398,10 @@ research:
> 
> finished:
>     pathrelse (&path);
>+
>+    if(result == IO_ERROR)
>+	    return -EIO;
>+    
>     /* this buffer has valid data, but isn't valid for io.  mapping it to
>      * block #0 tells the rest of reiserfs it just has a tail in it
>      */
>  
>

