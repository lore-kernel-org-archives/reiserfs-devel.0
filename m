From: "christian" <christian.linzatti@gmx.at>
Subject: Re: too many iterations - Reiser 4
Date: Fri, 12 Nov 2004 20:50:55 +0100 (MET)
Message-ID: <18296.1100289055@www69.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22366-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Thanks, its better. 

> would you please try to apply the attached patch?
> You should also reiserfsck your reiser4 filesystem.
> ["reiser4.h.diff" (reiser4.h.diff)]

> ===== reiser4.h 1.220 vs edited =====
> --- 1.220/reiser4.h2004-11-02 16:01:00 +03:00
> +++ edited/reiser4.h2004-11-09 12:54:07 +03:00
> @@ -396,7 +396,7 @@
>    I have witnessed more than 800 iterations (in 30 thread test) before >
cbk
>    finished. --nikita
> */
> -#define REISER4_MAX_CBK_ITERATIONS    ((unsigned)~0)
> +#define REISER4_MAX_CBK_ITERATIONS    500000
 
 /* put a per-inode limit on maximal number of directory entries with
identical
    keys in hashed directory.
