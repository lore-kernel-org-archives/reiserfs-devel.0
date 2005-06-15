From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: [PATCH] ReiserFS _get_block_create_0 wrong behavior when I/O
	fails
Date: Wed, 15 Jun 2005 19:41:41 +0400
Message-ID: <1118850101.17622.579.camel@tribesman.namesys.com>
References: <1118865954.4231.4.camel@CoolQ>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24383-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1118865954.4231.4.camel@CoolQ>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fs <fs@ercist.iscas.ac.cn>
Cc: reiserfs-list@namesys.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Hans Reiser <reiser@namesys.com>

Hello

On Thu, 2005-06-16 at 00:09, fs wrote:
> From: fs <fs@ercist.iscas.ac.cn>
> To: reiserfs-list@namesys.com
> Cc: reiser@namesys.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, iscas-linaccident@intellilink.co.jp
> Subject: [iscas-linaccident 50] [PATCH] ReiserFS _get_block_create_0 wrong behavior when I/O fails
> Date: Wed, 15 Jun 2005 15:10:05 -0400
> 
> Related FS:
>     ReiserFS
> 
> Related Files:
>     fs/reiserfs/inode.c
> 
> Bug description:
>     Make a ReiserFS partition in USB storage HDD, create a test file with
> enough size.
>     Write a program, do: open(O_RDONLY) - read - close. After each
> operation, pause for a while, such as 3s. Between open and read, unlug the
> USB wire. open returns zero-filled buffer, no error returns.
> 
> Bug analysis:
>     do_mpage_readpage will call FS-specific get_block to get buffer mapped
> from disk. reiserfs_get_block doesn't return non-zero when I/O failure occurs.
>     reiserfs_get_block -> _get_block_create_0 -> search_by_position_by_key
> search_by_position_by_key returns IO_ERROR, but the original code just simply
> returns 0
> 
> research:
>     if (search_for_position_by_key (inode->i_sb, &key, &path) != POSITION_FOUND) {
> 	pathrelse (&path);
>         if (p)
>             kunmap(bh_result->b_page) ;
> 	// We do not return -ENOENT if there is a hole but page is uptodate, because it means
> 	// That there is some MMAPED data associated with it that is yet to be written to disk.
> 	if ((args & GET_BLOCK_NO_HOLE) && !PageUptodate(bh_result->b_page) ) {
> 	    return -ENOENT ;
> 	}
>         return 0 ; <- 0 retuns for IO_ERROR
>     }
> 
> Way around:
>     test result of search_for_position_by_key
> 
> Signed-off-by: Qu Fuping<fs@ercist.iscas.ac.cn>
> 
> Patch:
> diff -uNp /tmp/linux-2.6.12-rc6/fs/reiserfs/inode.c /tmp/linux-2.6.12-rc6.new/fs/reiserfs/inode.c
> --- /tmp/linux-2.6.12-rc6/fs/reiserfs/inode.c	2005-06-06 11:22:29.000000000 -0400
> +++ /tmp/linux-2.6.12-rc6.new/fs/reiserfs/inode.c	2005-06-15 13:56:45.552564512 -0400
> @@ -254,6 +254,7 @@ static int _get_block_create_0 (struct i
>      char * p = NULL;
>      int chars;
>      int ret ;
> +    int result ;
>      int done = 0 ;
>      unsigned long offset ;
>  
> @@ -262,7 +263,8 @@ static int _get_block_create_0 (struct i
>  		  (loff_t)block * inode->i_sb->s_blocksize + 1, TYPE_ANY, 3);
>  
>  research:
> -    if (search_for_position_by_key (inode->i_sb, &key, &path) != POSITION_FOUND) {
> +    result = search_for_position_by_key (inode->i_sb, &key, &path) ;
> +    if (result != POSITION_FOUND) {
>  	pathrelse (&path);
>          if (p)
>              kunmap(bh_result->b_page) ;
> @@ -270,7 +272,8 @@ research:
>  	// That there is some MMAPED data associated with it that is yet to be written to disk.
>  	if ((args & GET_BLOCK_NO_HOLE) && !PageUptodate(bh_result->b_page) ) {
>  	    return -ENOENT ;
> -	}
> +	}else if (result == IO_ERROR)
> +		return -EIO ;
>          return 0 ;
>      }
>      

Your patch is incomplete. There is one more search_for_position_by_key
at the end of this function. You probably want to check its return value
also.

> 
> 

