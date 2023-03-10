From: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH] reiserfs: remove duplicate include header in xattr.c
Date: Fri, 10 Mar 2023 11:58:50 +0100
Message-ID: <20230310105850.gomiydgm22eoxmxw@wittgenstein>
References: <202303071517050653678@zte.com.cn>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678445935;
        bh=nyY232ZY2Q5K4pNyA+3/TkUKEbZ7ZEFY5fxylZaIKmM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QzWjuZYlOZitfbd5zPN6eEJbLRnrEK1rsoZrJNy0xQFPxqOAHgAbZZoHg7mgWkjp8
         1QnG96QPhW1u8FEGaMRpmVNRT/iaf4TNXjvyW85L68ie1bdwIFMv/ZTsyA7tGtR5X0
         /fuHXtGw+Dnw82NpyEFFK/WHCcSCSIsR0K0oI0CskJx2KFv7G7VYgitXKPsryprHZG
         Xsmj+bTcm9T5a9zPpKsFdQ/rfIXz5m2XgSVT5bOfIomyEC1bg1czJP73BWvvtUk0X+
         7Gsl46aEDJY0jNSwlWte5S0W2RmwTL7kqZ//rbMlrjW5cynr1nZe3/gp0PSxV8rhET
         o7r7KoyFuj6Uw==
Content-Disposition: inline
In-Reply-To: <202303071517050653678@zte.com.cn>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ye.xingchen@zte.com.cn
Cc: dchinner@redhat.com, willy@infradead.org, viro@zeniv.linux.org.uk, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, fsdevel@vger.kernel.org

On Tue, Mar 07, 2023 at 03:17:05PM +0800, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> linux/xattr.h is included more than once.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
> ---

I mean, yeah, it's included in the local xattr.h file but honestly
reiserfs is marked deprecated and I just don't think that we should
bother with cleaning up things that are _that_ minor. If it was the
compiler complaining about some unused variable then for sure but this
just seems pointless imho at this terminal stage...

>  fs/reiserfs/xattr.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
> index 651027967159..ed1984775a4f 100644
> --- a/fs/reiserfs/xattr.c
> +++ b/fs/reiserfs/xattr.c
> @@ -43,7 +43,6 @@
>  #include <linux/fs.h>
>  #include <linux/file.h>
>  #include <linux/pagemap.h>
> -#include <linux/xattr.h>
>  #include "xattr.h"
>  #include "acl.h"
>  #include <linux/uaccess.h>
> -- 
> 2.25.1
