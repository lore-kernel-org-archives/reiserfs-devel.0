From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: core dump on reiserfsck --rebuildtree
Date: Sat, 20 Sep 2003 00:17:08 +0400
Message-ID: <200309200017.08396.vitaly@namesys.com>
References: <65047.80.5.156.133.1064000151.squirrel@blanark.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15712-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <65047.80.5.156.133.1064000151.squirrel@blanark.dyndns.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: alistair@inrevo.com, reiserfs-list@namesys.com


Hi, 

On Friday 19 September 2003 23:35, Alistair McDonald wrote:
> Howdy.
>
> My Reiser filesystem became corrupt (probably after a power interuption -
> I could find no other reason why the machine had restarted.
>
> reiserfsck reported that I had to use the rebuild-tree option, I tried
> that it ran for some time (~24 hours) and seg faulted. I tried again for
> good measure, and got the same results. After reading this list, I
> upgraded my reisertools from 3.6.8 to 3.6.11, the latest available in
> gentoo, the linux distro I am running. I tried a third time and got a
> similar seg fault.
>
> Other sytem details:
> uname -a reports: Linux altair 2.4.20-gentoo-r2 #1 Sun Apr 13 21:43:43 BST
> 2003 i686 AMD Duron(tm) Processor AuthenticAMD GNU/Linux
> RAM: 512 MB
> The filesystem is on a 240 Gb lvm partition, across two 120 GB drives.
> SMART status for both drives is good.
>
> ####### Pass 1 #######
> Looking for allocable blocks .. finished
> 0%pass1.c 408 pass1_correct_leaf                           left 68900, 205
> /sec
> pass1_correct_leaf: block 31831, item 0, pointer 389: The wrong pointer
> (3225092104) in the file [133625 133627]. Must b
> e fixed on pass0.
> Aborted (core dumped)

This is unexpected case when the corruption that is supposed to be fixed 
at pass0 still exists on pass1. It is interesting if that 'wrong pointer' number 
and the file key are the same all the time, could you run it again and compair
these numbers.

Actually last few times similar corruptions occured due to bad memory or due 
to some buggy pathes from distributors. So 1 -- would you test you memory 
and 2 -- would you use reiserfsprogs from our ftp site 
(ftp.namesys.com/pub/reiserfsprogs/). Version -- 3.6.11.

-- 
Thanks,
Vitaly Fertman
