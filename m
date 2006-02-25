From: "James (Alec) Burney" <madbull@gmail.com>
Subject: Re: possible reiser4 bug
Date: Sat, 25 Feb 2006 01:17:05 -1000
Message-ID: <44003CB1.5050309@gmail.com>
References: <2bbb1c940602232135jff393fbm2175052026237ce9@mail.gmail.com> <200602260009.36905.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28132-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200602260009.36905.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

thanks for the patch, Alex, but yesterday i converted all of my
harddisks to reiserFS in an act of frustration. Sorry that i can't help
you test your patch.

Alexander Zarochentsev wrote:
> hello,
> 
> On Friday 24 February 2006 08:35, Alec Burney wrote:
> 
> [...]
> 
> 
> would you please try the attached patch.
> 
> 
> 
> ------------------------------------------------------------------------
> 
>  fs/reiser4/plugin/file/file.c |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
> 
> Index: linux-2.6.16-rc3-mm1/fs/reiser4/plugin/file/file.c
> ===================================================================
> --- linux-2.6.16-rc3-mm1.orig/fs/reiser4/plugin/file/file.c
> +++ linux-2.6.16-rc3-mm1/fs/reiser4/plugin/file/file.c
> @@ -2454,6 +2454,7 @@ ssize_t write_unix_file(struct file *fil
>  
>  	if (inode_get_flag(inode, REISER4_PART_CONV)) {
>  		/* we can not currently write to a file which is partially converted */
> +		txn_restart(ctx);
>  		get_exclusive_access(uf_info);
>  		result = finish_conversion(inode);
>  		drop_exclusive_access(uf_info);
> @@ -2481,6 +2482,7 @@ ssize_t write_unix_file(struct file *fil
>  
>  		   3) convert file to extents to not enter here on each write
>  		   to mmaped file */
> +		txn_restart(ctx);
>  		get_exclusive_access(uf_info);
>  		result = check_pages_unix_file(file, inode);
>  		drop_exclusive_access(uf_info);
> @@ -2535,14 +2537,13 @@ ssize_t write_unix_file(struct file *fil
>  	while (left > 0) {
>  		int excl = 0;
>  
> -		/* getting exclusive or not exclusive access requires no
> -		   transaction open */
> -		txn_restart_current();
> -
>  		/* faultin user page */
>  		fault_in_pages_readable(buf,
>  					left > PAGE_CACHE_SIZE ? PAGE_CACHE_SIZE : left);
>  
> +		/* getting exclusive or not exclusive access requires no
> +		   transaction open */
> +		txn_restart(ctx);
>  		if (inode->i_size == 0) {
>  			get_exclusive_access(uf_info);
>  			excl = 1;

-- 
cell: 808.332.5131
