From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 23:04:44 +0400
Message-ID: <200308062304.44808.vitaly@namesys.com>
References: <20030806182055.A28562@bitwizard.nl> <20030806201405.A1357@bitwizard.nl> <20030806202252.A1940@bitwizard.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15197-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030806202252.A1940@bitwizard.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

> Should I feel comfortable if it's finding formatting errors all over
> the place?:
>
>   entry [x y] "ZZZ" in directory [a b] is not formatted properly -- fixed.
>
> (usually x == 2, a,b == 1,2 .)

Direntries have different format in reiserfs v3.5 and v3.6. These messages 
are probably due to that reiserfs image of 3.5 format you have  on your fs 
of 3.6 format.

> Tip:
>
> Only list the file/directory that's being worked upon when explicitly
> requested. When not explicitly requested, set an alarm handler to
> print it every second (or so). Lots of time is now spent in writing to
> the screen. (It's consumed over an hour of CPU time by now...)
>
> 		Roger.

I do not understand your "explicitly" term exactly, but during semantic 
traversing the name of the last file in the path is not printed at all, only 
the directory it was reached from. Thank you for the tip again.

-- 
Thanks,
Vitaly Fertman
