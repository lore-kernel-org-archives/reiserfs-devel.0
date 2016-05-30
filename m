From: Jan Kara <jack@suse.cz>
Subject: Re: + reiserfs-avoid-uninitialized-variable-use.patch added to -mm
 tree
Date: Mon, 30 May 2016 09:17:57 +0200
Message-ID: <20160530071757.GA3690@quack2.suse.cz>
References: <5748aeb6.fN9D/KJvuQPxmFHi%akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5748aeb6.fN9D/KJvuQPxmFHi%akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org
Cc: arnd@arndb.de, jack@suse.cz, viro@zeniv.linux.org.uk, jeffm@suse.com, reiserfs-devel@vger.kernel.org

On Fri 27-05-16 13:31:50, Andrew Morton wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> Subject: reiserfs: avoid uninitialized variable use
> 
> I got this warning on an ARM64 allmodconfig build with gcc-5.3:
> 
> fs/reiserfs/ibalance.c: In function 'balance_internal':
> fs/reiserfs/ibalance.c:1158:3: error: 'new_insert_key' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);
> 
> The warning is correct, in fact both new_insert_key and new_insert_ptr are
> only updated inside of an if() block, but used at the end of the function.
> 
> Looking at how the balance_internal() function gets called, it is clear
> that this is harmless because the caller never uses the updated arrays,
> they are initialized from balance_leaf_new_nodes() and then passed into
> balance_internal().
> 
> This has not changed at all since the start of the git history, but
> apparently the warning has only recently appeared.
> 
> This modifies the function to only update the two argument variables when
> the new_insert_key and new_insert_ptr have been updated, to get rid of the
> warning.
> 
> Link: http://lkml.kernel.org/r/1464380569-3493380-1-git-send-email-arnd@arndb.de
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Jan Kara <jack@suse.cz>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
>  fs/reiserfs/ibalance.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff -puN fs/reiserfs/ibalance.c~reiserfs-avoid-uninitialized-variable-use fs/reiserfs/ibalance.c
> --- a/fs/reiserfs/ibalance.c~reiserfs-avoid-uninitialized-variable-use
> +++ a/fs/reiserfs/ibalance.c
> @@ -1138,6 +1138,9 @@ int balance_internal(struct tree_balance
>  		       S_new);
>  
>  		/* S_new is released in unfix_nodes */
> +
> +		memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);
> +		insert_ptr[0] = new_insert_ptr;
>  	}
>  
>  	n = B_NR_ITEMS(tbSh);	/*number of items in S[h] */
> @@ -1153,8 +1156,5 @@ int balance_internal(struct tree_balance
>  				       insert_ptr);
>  	}
>  
> -	memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);
> -	insert_ptr[0] = new_insert_ptr;
> -
>  	return order;
>  }

Looking at the patch now, I think it is buggy. The insert_ptr is used as an
argument to internal_insert_childs() and this patch ends up overwriting the
original value before the last call to that function... Not that I would
really understand what the code is trying to do (CCed Jeff who may have
better idea), this is based purely on syntactical analysis ;).

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
