From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: On disk and correct bitmaps differ
Date: Fri, 3 Oct 2003 00:14:46 +0400
Message-ID: <200310030014.46900.vitaly@namesys.com>
References: <200310022128.51416.Siegfried.Loeschmann@loe-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15776-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200310022128.51416.Siegfried.Loeschmann@loe-online.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Siegfried =?utf-8?q?L=C3=B6schmann?= <Siegfried.Loeschmann@t-online.de>
Cc: reiserfs-list@namesys.com

On Thursday 02 October 2003 23:28, Siegfried L=C3=B6schmann wrote:
> Hi,

hi,

> I have been using a reiserfs on a logical volume of two 80G disks for qui=
te
> a while without any problems now. Recently I bought a new 250G disk in
> addition, added it to the lv, created a new fs and started to put data on
> it. After a week or so the fs crashed unrepairable. I fear the reason was=
 a
> loosly connect disk.
>
> So I started all over again (new fs, putting data on it). Situation now is
> as follows: I create the filesystem, reiserfsck says it is ok. I put some
> data on it say 10G and reiserfs say "on disk and correct bitmaps differ".
> After this I have to do reiserfsck --fix-fixable. Answer is no corruptions
> found. But again --check says the above mentioned. I can reproduce this as
> often as I like.

which version of reiserfsprogs do you use? would you obtain the latest=20
progs from our ftp site -- 3.6.11 -- if you use smth older and run it all a=
gain?

if it reports the same, would you run
    debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2
and provide it for downloading. this will extract reiserfs matadata and it =
will allow=20
me to debug the problem locally.

> I already checked all harddisks, no errors. Well, can anyone tell me, if I
> should worry about this. Reiserfs version is 3.6.4, Kernel is SuSE 2.4.20.
>
> Thanks in advance

=2D-=20
Thanks,
Vitaly Fertman
