From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: problemas in make reiser4progs-0.4.20
Date: Mon, 5 Jan 2004 13:14:46 +0300
Message-ID: <200401051314.46539.vitaly@namesys.com>
References: <200401040019.57067.ventas@dos20.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16422-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200401040019.57067.ventas@dos20.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ventas@dos20.com, reiserfs-list@namesys.com

Hello, 

On Sunday 04 January 2004 06:19, dos20 wrote:
> Hello, run "make" (reiser4progs-0.4.20 in debian woody witch kernel 2.6.0)
> and:
> -----------------------------------------
> libreiser4_la-libreiser4.lo(.text+0x59c):/root/tar/reiserfs/LATEST/reiser4p
>rogs-0.4.20/libreiser4/libreiser4.c: first defined here
> collect2: ld returned 1 exit status
> make[2]: *** [libreiser4.la] Error 1
> make[2]: Leaving directory
> `/root/tar/reiserfs/LATEST/reiser4progs-0.4.20/libreiser4'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/root/tar/reiserfs/LATEST/reiser4progs-0.4.20'
> make: *** [all] Error 2
> atlanta:~/tar/reiserfs/LATEST/reiser4progs-0.4.20#
> -----------------------------------------
>
> where is the problem ?.
> thanks.

what configure options did you use? Some make options?
Are you sure that you have the correct libaal installed?
It seems there were some error messages you missed before 
the given paragraph. Would you show me them too?

-- 
Thanks,
Vitaly Fertman


