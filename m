From: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH 1/1 linux-next] fs/reiserfs/inode.c: replace 0 by NULL for pointers
Date: Thu, 25 Dec 2014 13:17:58 +0100
Message-ID: <CAFLxGvyhuQcXpaKZpJQ4B-zNpDOV3L3mZ87iFgeGcZkXZO9Keg@mail.gmail.com>
References: <1419500596-12760-1-git-send-email-fabf@skynet.be>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=XNRJldFFH/BU9d8RFZHsSMT68nlhSXhBRDXO46O3Y9c=;
        b=UrokY2mNsRU6NnhLdPiKYlqmmo6bTCXeHOdHA+SrNBnUYEgHKQFz33zvBCmKSzT+Ny
         glKbFhLZvEPAcItuM96nfekZsdnVxKMb//d0E4fdwosWDM4INjznNn6mldnOOFtlIxOf
         wqQeNVoeTxjVUmqSReM6X3NGDFlfgnkPZYsg7nRCy/9LVEQuySIPBd2CGWjLqzmR1BBU
         LxHnZV6rjD2OuqCojxyJ6azlkCKZv6Bk4c9WuMEJurlcvC/oA5dBUl9PFLm0N+4HMBZc
         +uJx5QHiqnxp5/ZeUwkbfnYl+IJq1rzeu9cTXPriz75KH5PJGTalbvRK0KzbhEFfQqJJ
         58yA==
In-Reply-To: <1419500596-12760-1-git-send-email-fabf@skynet.be>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabian Frederick <fabf@skynet.be>
Cc: LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>, Andrew Morton <akpm@linux-foundation.org>

On Thu, Dec 25, 2014 at 10:43 AM, Fabian Frederick <fabf@skynet.be> wrote:
> Fix sparse warning:
> fs/reiserfs/inode.c:2769:19: warning: Using plain integer as NULL pointer

I see such fixes often and I always wonder whether this is still an
issue with modern compilers/computers.
Can you point out a problem which will be fixed by your patch?

> Cc: reiserfs-devel@vger.kernel.org
> Cc: Jeff Mahoney <jeffm@suse.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Fabian Frederick <fabf@skynet.be>
> ---
>  fs/reiserfs/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
> index a7eec98..e72401e 100644
> --- a/fs/reiserfs/inode.c
> +++ b/fs/reiserfs/inode.c
> @@ -2766,7 +2766,7 @@ static int reiserfs_write_begin(struct file *file,
>         int old_ref = 0;
>
>         inode = mapping->host;
> -       *fsdata = 0;
> +       *fsdata = NULL;
>         if (flags & AOP_FLAG_CONT_EXPAND &&
>             (pos & (inode->i_sb->s_blocksize - 1)) == 0) {
>                 pos ++;
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/



-- 
Thanks,
//richard
