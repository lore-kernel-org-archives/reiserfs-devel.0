From: Ingmar Sittl <pizzaboy@web.de>
Subject: Re: Fw: Re: PROBLEM: ReiserFS: cannot remove file as root with 2.6.0test9-mm3
Date: Tue, 18 Nov 2003 16:00:53 +0000
Message-ID: <200311181600.53888.pizzaboy@web.de>
References: <20031117125223.46d784be.akpm@osdl.org> <200311181403.52350.pizzaboy@web.de> <16314.7583.703758.67777@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16117-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16314.7583.703758.67777@laputa.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>, Andrew Morton <akpm@osdl.org>

On Tuesday 18 November 2003 13:24, Nikita Danilov wrote:
> Ingmar Sittl writes:
>  > > Hello,
>  > >
>  > > Ingmar, to start we need the following info:
>  > >
>  > > 1. any kernel messages (dmesg or /var/log/messages) that appear when
>  > > you try and fail to remove file as root.
>  >
>  > Sorry, there are no kernel messages, rm just does not let me remove this
>  > file. root:/usr/lib/pkgconfig# rm fontconfig.pc
>  > rm: cannot unlink `fontconfig.pc': Permission denied
>  >
>  > > 2. output of
>  > >
>  > > # lsattr /offending-file
>  >
>  > root:/usr/lib/pkgconfig# lsattr fontconfig.pc
>  > s-Si-dAc------ fontconfig.pc
>
> Seems you have immutable attribute set on this file. Can you try
>
> root:/usr/lib/pkgconfig# chattr -i fontconfig.pc && rm fontconfig.pc
>
> ?

did not work.
 
lsattr now says:
s-S--dAc------ /usr/lib/pkgconfig/fontconfig.pc

but rm still complains.

> Confusing thing is that reiserfs requires special mount option "attr" to
> turn inode attributes support on. May be -mm3 has generic support for
> immutable attribute in VFS? Doesn't look so. With what options reiserfs
> is mounted?

from /etc/fstab:
/dev/hda6       /usr               reiserfs        defaults,noatime 1 2

it also looks like every file on that partition has those attributes set, but 
only this file cannot be removed (as far as I can tell after some quick 
tests) 

>  > > Also, can you elaborate what does it mean that you cannot remove file
>  > > in 2.6.0-test9-mm3, but can in 2.6.0-test9? You tried to remove it in
>  > > -mm3, failed, rebooted into -test9 and it removes successfully there,
>  > > or what?
>  >
>  > Almost exactly:
>  > I tried to remove that file in 2.6.0-test9-mm3, failed, rebooted into
>  > 2.6.0-test9, the file was removed successfully, I reinstalled it,
>  > recompiled 2.6.0-test9-mm3 with CONFIG_REISERFS_CHECK,rebooted into
>  > 2.6.0-test9-mm3, rm failed again. I also tried this cycle with a 2.4.21
>  > kernel, same result!
>
> Eh? You mean you can remove file when compiled without
> CONFIG_REISERFS_CHECK and fail when compiled with checks on?
>

No, I wanted to say that I tried it with -mm3 first without and then with 
CONFIG_REISERFS_CHECK and it did not work both times.

Ingmar

