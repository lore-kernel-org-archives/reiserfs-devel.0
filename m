From: Siegfried.Loeschmann@t-online.de (Siegfried =?utf-8?q?L=C3=B6schmann?=)
Subject: Re: On disk and correct bitmaps differ
Date: Thu, 9 Oct 2003 04:49:05 +0200
Message-ID: <200310090449.05105.Siegfried.Loeschmann@loe-online.de>
References: <200310022128.51416.Siegfried.Loeschmann@loe-online.de> <200310030014.46900.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-15825-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200310030014.46900.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Vitaly,

thank you for your quick answer.

in the meantime I did some more research on the problem, had some hardware
problems so it took so long.

I splitet up the logical volume and testet on plain partitions and I found 
that the problem only ocurrs on the big 250G disk. After that I deleted the 
files again until simply one single empty directory was left. Still the same 
effect.

On this filesystem I did the debugreiserfs ... The resulting file is only 83K 
big. Since I don't have way to to provide it for download now is it possible 
I mail it?

Thanks in advance
Siggi
> On Thursday 02 October 2003 23:28, Siegfried Löschmann wrote:
> > Hi,
>
> hi,
>
> > I have been using a reiserfs on a logical volume of two 80G disks for
> > quite a while without any problems now. Recently I bought a new 250G disk
> > in addition, added it to the lv, created a new fs and started to put data
> > on it. After a week or so the fs crashed unrepairable. I fear the reason
> > was a loosly connect disk.
> >
> > So I started all over again (new fs, putting data on it). Situation now
> > is as follows: I create the filesystem, reiserfsck says it is ok. I put
> > some data on it say 10G and reiserfs say "on disk and correct bitmaps
> > differ". After this I have to do reiserfsck --fix-fixable. Answer is no
> > corruptions found. But again --check says the above mentioned. I can
> > reproduce this as often as I like.
>
> which version of reiserfsprogs do you use? would you obtain the latest
> progs from our ftp site -- 3.6.11 -- if you use smth older and run it all
> again?
>
> if it reports the same, would you run
>     debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2
> and provide it for downloading. this will extract reiserfs matadata and it
> will allow me to debug the problem locally.
>
> > I already checked all harddisks, no errors. Well, can anyone tell me, if
> > I should worry about this. Reiserfs version is 3.6.4, Kernel is SuSE
> > 2.4.20.
> >
> > Thanks in advance

-- 
Siegfried Löschmann
Schillerstr. 22
21423 Winsen
fon: +49 4171 72415
mobile: +49 162 10 455 43
email: Siegfried.Loeschmann@loe-online.de
