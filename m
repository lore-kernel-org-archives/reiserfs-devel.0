From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] reiserfs: fix =?UTF-8?B?Im5ld19pbnNlcnRfa2V54oCZ?= may be used uninitialized ..."
Date: Mon, 06 Jun 2016 20:43:27 +0200
Message-ID: <4475567.3RDrhHqseX@wuerfel>
References: <5748aeb6.fN9D/KJvuQPxmFHi%akpm@linux-foundation.org> <5731468.VTTDqzParZ@wuerfel> <5eca5ffb-2155-8df2-b4a2-f162f105efed@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5eca5ffb-2155-8df2-b4a2-f162f105efed@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jeff Mahoney <jeffm@suse.com>
Cc: Jan Kara <jack@suse.cz>, akpm@linux-foundation.org, viro@zeniv.linux.org.uk, reiserfs-devel@vger.kernel.org

On Monday, June 6, 2016 1:25:47 PM CEST Jeff Mahoney wrote:
> new_insert_key only makes any sense when it's associated with a
> new_insert_ptr, which is initialized to NULL and changed to a
> buffer_head when we also initialize new_insert_key.  We can key off
> of that to avoid the uninitialized warning.
> 
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>

Thanks a lot for looking into it, that addresses the warning nicely.

	Arnd

> ---
>  fs/reiserfs/ibalance.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/reiserfs/ibalance.c b/fs/reiserfs/ibalance.c
> index b751eea..5db6f45 100644
> --- a/fs/reiserfs/ibalance.c
> +++ b/fs/reiserfs/ibalance.c
> @@ -1153,8 +1153,9 @@ int balance_internal(struct tree_balance *tb,
>                                        insert_ptr);
>         }
>  
> -       memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);
>         insert_ptr[0] = new_insert_ptr;
> +       if (new_insert_ptr)
> +               memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);
>  
>         return order;
>  }
> 


