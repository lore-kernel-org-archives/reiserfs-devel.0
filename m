From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: [PATCH] ReiserFS file.c several bug-fix
Date: Thu, 23 Jun 2005 13:16:51 +0400
Message-ID: <1119518209.3816.58.camel@tribesman.namesys.com>
References: <1119554831.3026.99.camel@CoolQ>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24491-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1119554831.3026.99.camel@CoolQ>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fs <fs@ercist.iscas.ac.cn>
Cc: reiserfs-list <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>, iscas-linaccident <iscas-linaccident@intellilink.co.jp>

Hello

On Thu, 2005-06-23 at 23:27, fs wrote:
> Related FS:
>     ReiserFS
> 
> Related Files:
>     fs/reiserfs/file.c
> 
> Bug description:
>     Make a ReiserFS partition in USB storage HDD, create a test file
> with enough size.
>     Write a program, do: open(O_SYNC/O_DSYNC) - read - close. After each
> operation, pause for a while, such as 3s. Between open and read, unlug
> the USB wire. open returns zero-filled buffer, no error returns.
> 
Open returns not buffer buf opened file descriptor or -1. Please
describe your test more carefully.


> Bug analysis:
>     reiserfs_file_write will claim some blocks, commit the I/O request,

So, you said: open(O_SYNC/O_DSYNC) - read - close. Where does write come
from?

> if O_SYNC and O_DSYNC is used, it will
>     if ((file->f_flags & O_SYNC) || IS_SYNC(inode))
> 	res = generic_osync_inode(inode, file->f_mapping,
>                                   OSYNC_METADATA|OSYNC_DATA);
> The question is, if I/O error occurs, 	    
>         res = reiserfs_allocate_blocks_for_region fails with -EIO, so
> it will exit the loop, no I/O request, no page marked as dirty.
> If run generic_osync_inode, it returns 0(no dirty page), res will be
> overwritten from -EIO to 0, thus no error report.
> 
> Also,  reiserfs_file_write contains a serious bug, see here
> 	blocks_to_allocate = reiserfs_prepare_file_region_for_write
> 		(inode, pos, num_pages, write_bytes, prepared_pages);
> Here blocks_to_allocate is defined as size_t, i.e. unsigned int, but
> reiserfs_prepare_file_region_for_write is declared as int, so sometimes
> it will return -EIO, -ENOENT, etc, take a look at this line
> 	if ( blocks_to_allocate < 0 ) { <- This will never happen
> 	    res = blocks_to_allocate;
> 	    reiserfs_release_claimed_blocks(inode->i_sb, 
> 		num_pages << (PAGE_CACHE_SHIFT - inode->i_blkbits));
> 	    break;
> 	}
> 
> Way around:
> 1) if already_written is zero, don't do generic_osync_inode
> 2) tell the result of reiserfs_prepare_file_region_for_write with IS_ERR
>    macro or cast it to size_t
> 
> Signed-off-by: Qu Fuping<fs@ercist.iscas.ac.cn>
> 
> Patch:
> diff -uNp linux-2.6.12/fs/reiserfs/file.c
> linux-2.6.12-new/fs/reiserfs/file.c
> 
> 

