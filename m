From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: once a Week the FS crashes
Date: Mon, 7 Jun 2004 13:40:33 +0400
Message-ID: <200406071340.33905.vitaly@namesys.com>
References: <200406070820.10391.aotto1968@onlinehome.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19061-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406070820.10391.aotto1968@onlinehome.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: aotto1968@t-online.de, Andreas Otto <aotto1968@onlinehome.de>, reiserfs-list@namesys.com

On Monday 07 June 2004 10:20, Andreas Otto wrote:
> Hi,
>
>  1. after 5 times booting my Linux-Box with Reiser-Fs crashes:
>        => unabel to read BITMAP at ######
>      and the kernel PANIC
>
>   to solve the problem I boot from the rescue disc of my SuSe Linux 9.0
>  and do: fsck.reiserfs --rebuild-tree /dev/hda2
>
>  after that everything is OK:
>
>  Question:
>    a) is this a HW or a SW problem
>    b) if HW: is this a DISK or a CHIPSET problem
>    c) if SW: is this a REISER or a DRIVER problem

> linux02:~ # fsck.reiserfs -V
> reiserfsck 3.6.9 (2003 www.namesys.com)

you can run /sbin/badblocks & memtest86 to check the hardware
then update your reiserfsprogs to the latest available on our ftp site 
(ftp://ftp.namesys.com/pub/reiserfsprogs/), 3.6.9 is very old one,
and run reiserfsck --check.

-- 
Thanks,
Vitaly Fertman

