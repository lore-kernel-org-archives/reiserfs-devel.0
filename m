From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH] reiserfs: avoid uninitialized variable use
Date: Wed, 15 Jun 2016 11:06:06 +0200
Message-ID: <1465981566.9515.21.camel@tiscali.nl>
References: <1464380569-3493380-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1464380569-3493380-1-git-send-email-arnd@arndb.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On vr, 2016-05-27 at 22:22 +0200, Arnd Bergmann wrote:
> I got this warning on an ARM64 allmodconfig build with gcc-5.3:
> 
> fs/reiserfs/ibalance.c: In function 'balance_internal':
> fs/reiserfs/ibalance.c:1158:3: error: 'new_insert_key' may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>    memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);
> 
> The warning is correct, in fact both new_insert_key and new_insert_ptr
> are only updated inside of an if() block, but used at the end of
> the function.
> 
> Looking at how the balance_internal() function gets called, it
> is clear that this is harmless because the caller never uses the
> updated arrays, they are initialized from balance_leaf_new_nodes()
> and then passed into balance_internal().
> 
> This has not changed at all since the start of the git history,
> but apparently the warning has only recently appeared.

My build logs (for both 32 and 64 bits x86) tell me the warning appeared
when I upgraded to Fedora 22. That suggests the warning popped up as a
result of the GCC 4 to GCC 5 upgrade that was part of that upgrade.

> This modifies the function to only update the two argument variables
> when the new_insert_key and new_insert_ptr have been updated, to
> get rid of the warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I thought I had send this on May 12 when I first became aware of
> the warning, but I can't find a reference to that now on any
> mailing list archives, and I'm not sure who is picking up
> reiserfs patches these days.
> 
> The warning is now one of the few 'allmodconfig' warnings for
> arm64 and possibly some other architectures.

x86 and x86_64 are two of those architectures. This patch silences the
warning on those architectures too.

(I wouldn't dare to say whether the patch is correct. I've looked at
this warning quite a few times in the last year and found the code hard
to grok. It's impressive that you managed to come up with an actual
fix.)

>  fs/reiserfs/ibalance.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/reiserfs/ibalance.c b/fs/reiserfs/ibalance.c
> index b751eea32e20..6dcc38f132f5 100644
> --- a/fs/reiserfs/ibalance.c
> +++ b/fs/reiserfs/ibalance.c
> @@ -1138,6 +1138,9 @@ int balance_internal(struct tree_balance *tb,
>  		       S_new);
>  
>  		/* S_new is released in unfix_nodes */
> +
> +		memcpy(new_insert_key_addr, &new_insert_key,
KEY_SIZE);
> +		insert_ptr[0] = new_insert_ptr;
>  	}
>  
>  	n = B_NR_ITEMS(tbSh);	/*number of items in S[h] */
> @@ -1153,8 +1156,5 @@ int balance_internal(struct tree_balance *tb,
>  				       insert_ptr);
>  	}
>  
> -	memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);
> -	insert_ptr[0] = new_insert_ptr;
> -
>  	return order;
>  }


Paul Bolle
