From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Horrible ftruncate performance
Date: Thu, 17 Jul 2003 20:12:58 +0200
Message-ID: <200307172012.58581.Dieter.Nuetzel@hamburg.de>
References: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu> <200307161247.53880.Dieter.Nuetzel@hamburg.de> <20030716105705.GC4955@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14956-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030716105705.GC4955@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Chris Mason <mason@suse.com>, Szakacsits Szabolcs <szaka@sienet.hu>, Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, reiserfs-list@namesys.com

Am Mittwoch, 16. Juli 2003 12:57 schrieb Oleg Drokin:
> Hello!
>
> On Wed, Jul 16, 2003 at 12:47:53PM +0200, Dieter N?tzel wrote:
> > > > Somewhat.
> > > > Mouse movement is OK, now. But...
> > > > 1+0 Records aus
> > > > 0.000u 3.090s 0:16.81 18.3%     0+0k 0+0io 153pf+0w
> > > > 0.000u 0.050s 0:00.27 18.5%     0+0k 0+0io 122pf+0w
> > > > INSTALL/SOURCE> time dd if=/dev/zero of=sparse1 bs=1 seek=200G
> > > > count=1 ; time sync
> > > > 1+0 Records ein
> > > > 1+0 Records aus
> > > > 0.000u 3.010s 0:15.27 19.7%     0+0k 0+0io 153pf+0w
> > > > 0.000u 0.020s 0:01.01 1.9%      0+0k 0+0io 122pf+0w
> > >
> > > So you create a file in 15 seconds
> >
> > Right.
> >
> > > and remove it in 15 seconds.
> >
> > No. "Normaly" ~5 seconds.
>
> Ah, yes. Looking at wrong timeing info ;)
> I see that yesterday without the patch you had 1m, 9s, 5s, 2m times
> for 4 deletes...
>
> > > Kind of nothing changed except mouse now moves,
> > >
> > > > INSTALL/SOURCE> time rm sparse ; time sync
> > > > 0.000u 14.990s 1:31.15 16.4%    0+0k 0+0io 130pf+0w
> > > > 0.000u 0.030s 0:00.22 13.6%     0+0k 0+0io 122pf+0w
> > >
> > > So the stuff fell out of cache and we need to read it again.
> >
> > Shouldn't this take only 15 seconds, then?
>
> Probably there was some seeking due to removal of lots of blocks.
>
> > Worst case was ~5 minutes.
>
> Yeah, this is of course sad.
> BTW is this with search_reada patch?

Yes.

> What if you try without it?

Do _NOT_ really help.

INSTALL/SOURCE> l
insgesamt 1032
drwxrwxr-x    2 root     root          176 Jul 17 20:05 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
-rw-r--r--    1 nuetzel  users      452390 Jul 15 00:29 
kmplayer-0.7.96.tar.bz2
-rw-r--r--    1 nuetzel  users      403358 Jul 14 21:46 
modutils-2.4.21-18.src.rpm
-rw-r--r--    1 nuetzel  users      194505 Jul 14 22:01 
procps-2.0.13-1.src.rpm

INSTALL/SOURCE> time dd if=/dev/zero of=sparse bs=1 seek=200G count=1 ; time 
sync
1+0 Records ein
1+0 Records aus
0.000u 2.770s 0:15.88 17.4%     0+0k 0+0io 153pf+0w
0.000u 0.000s 0:00.79 0.0%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> time dd if=/dev/zero of=sparse1 bs=1 seek=200G count=1 ; time 
sync
1+0 Records ein
1+0 Records aus
0.010u 2.440s 0:15.03 16.3%     0+0k 0+0io 153pf+0w
0.010u 0.020s 0:01.08 2.7%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> time dd if=/dev/zero of=sparse2 bs=1 seek=200G count=1 ; time 
sync
1+0 Records ein
1+0 Records aus
0.010u 2.710s 0:14.94 18.2%     0+0k 0+0io 153pf+0w
0.000u 0.000s 0:01.76 0.0%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> l
insgesamt 615444
drwxrwxr-x    2 root     root          248 Jul 17 20:06 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
-rw-r--r--    1 nuetzel  users      452390 Jul 15 00:29 
kmplayer-0.7.96.tar.bz2
-rw-r--r--    1 nuetzel  users      403358 Jul 14 21:46 
modutils-2.4.21-18.src.rpm
-rw-r--r--    1 nuetzel  users      194505 Jul 14 22:01 
procps-2.0.13-1.src.rpm
-rw-r--r--    1 nuetzel  users    214748364801 Jul 17 20:06 sparse
-rw-r--r--    1 nuetzel  users    214748364801 Jul 17 20:06 sparse1
-rw-r--r--    1 nuetzel  users    214748364801 Jul 17 20:07 sparse2

INSTALL/SOURCE> time sync
0.000u 0.000s 0:00.02 0.0%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> time rm sparse2 ; time sync
0.000u 4.860s 0:04.82 100.8%    0+0k 0+0io 130pf+0w
0.010u 0.000s 0:00.03 33.3%     0+0k 0+0io 122pf+0w

INSTALL/SOURCE> time rm sparse1 ; time sync
0.000u 4.910s 0:04.82 101.8%    0+0k 0+0io 130pf+0w
0.000u 0.020s 0:00.03 66.6%     0+0k 0+0io 122pf+0w

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

INSTALL/SOURCE> time rm sparse ; time sync
0.010u 6.500s 0:48.47 13.4%     0+0k 0+0io 130pf+0w
0.000u 0.000s 0:00.02 0.0%      0+0k 0+0io 122pf+0w

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

INSTALL/SOURCE> l
insgesamt 1032
drwxrwxr-x    2 root     root          176 Jul 17 20:08 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
-rw-r--r--    1 nuetzel  users      452390 Jul 15 00:29 
kmplayer-0.7.96.tar.bz2
-rw-r--r--    1 nuetzel  users      403358 Jul 14 21:46 
modutils-2.4.21-18.src.rpm
-rw-r--r--    1 nuetzel  users      194505 Jul 14 22:01 
procps-2.0.13-1.src.rpm


Overwrite:

INSTALL/SOURCE> time sync
0.000u 0.000s 0:00.02 0.0%      0+0k 0+0io 122pf+0w
INSTALL/SOURCE> time dd if=/dev/zero of=sparse bs=1 seek=200G count=1 ; time 
sync
1+0 Records ein
1+0 Records aus
0.010u 2.890s 0:16.17 17.9%     0+0k 0+0io 153pf+0w
0.000u 0.020s 0:01.27 1.5%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> l
insgesamt 205836
drwxrwxr-x    2 root     root          200 Jul 17 20:09 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
-rw-r--r--    1 nuetzel  users      452390 Jul 15 00:29 
kmplayer-0.7.96.tar.bz2
-rw-r--r--    1 nuetzel  users      403358 Jul 14 21:46 
modutils-2.4.21-18.src.rpm
-rw-r--r--    1 nuetzel  users      194505 Jul 14 22:01 
procps-2.0.13-1.src.rpm
-rw-r--r--    1 nuetzel  users    214748364801 Jul 17 20:09 sparse

INSTALL/SOURCE> time sync
0.000u 0.010s 0:00.09 11.1%     0+0k 0+0io 122pf+0w
INSTALL/SOURCE> time dd if=/dev/zero of=sparse bs=1 seek=200G count=1 ; time 
sync
1+0 Records ein
1+0 Records aus
0.010u 0.000s 0:00.00 0.0%      0+0k 0+0io 153pf+0w
0.000u 0.010s 0:00.07 14.2%     0+0k 0+0io 122pf+0w

-Dieter

