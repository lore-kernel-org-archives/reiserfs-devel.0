From: Dieter =?iso-8859-2?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Horrible ftruncate performance
Date: Tue, 15 Jul 2003 18:48:58 +0200
Message-ID: <200307151848.59027.Dieter.Nuetzel@hamburg.de>
References: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14942-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>
Cc: Szakacsits Szabolcs <szaka@sienet.hu>, Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, reiserfs-list@namesys.com

Am Dienstag, 15. Juli 2003 14:19 schrieb Szakacsits Szabolcs:
> On Sat, 12 Jul 2003, Dieter N=FCtzel wrote:
> > > > >>More than 506 times...
> > > > >>=3D> 506.34 seconds (8:26.34) / 0.01 seconds =3D 50.634 times ;-)=
))
> > > > >
> > > > > I guess you mean 50,634 or 50634 times faster? But I'm afraid you
> > > > > didn't test what you should have.
> >
> > Why? Read again. Time decrease from 8 minutes, 26 seconds down to 0,01
> > seconds (sometimes 0,00 seconds).
>
> For the same test, with the efficiency patch, Oleg wrote:
>
> 	real    0m19.205s
> 	user    0m0.000s
> 	sys     0m7.130s
>
> That's a difference what doesn't happen magically, usually. The reason is
> one of these,
>
> 	1) Oleg's result is incorrect

Maybe.

> 	2) Your result is incorrect

Maybe.

> 	3) You use different patches.

Maybe.

I used what I've posted:

2.4.21-jam1 (2.4.21pre8aa1 on-top of 2.4.21)

patches/2.4.21-data-logging> l
insgesamt 109
drwxr-xr-x    2 root     root          536 Jul 11 23:37 .
drwxr-xr-x    6 root     root          480 Jul 15 06:49 ..
=2Drw-r--r--    1 root     root        18079 Jun 16 15:32=20
03-relocation-8.diff.bz2
=2Drw-r--r--    1 root     root         4929 Jun 16 15:32=20
04-reiserfs-sync_fs-4.diff.bz2
=2Drw-r--r--    1 root     root        32452 Jun 26 13:57=20
05-data-logging-38.diff.bz2
=2Drw-r--r--    1 root     root         6072 Jun 26 14:27=20
06-reiserfs-jh-2.diff.bz2
=2Drw-r--r--    1 root     root        10605 Jun 26 13:57=20
08-reiserfs-quota-28.diff.bz2
=2Drw-r--r--    1 root     root         1638 Jun 16 15:32 09-kinoded-8.diff=
=2Ebz2
=2Drw-r--r--    1 root     root          370 Jun 16 15:32=20
10-quota_nospace_fix.diff.bz2
=2Drw-r--r--    1 root     root         1097 Jun 17 22:05=20
10-reiserfs-quota-link-fix.diff.bz2
=2Drw-r--r--    1 root     root          674 Jun 16 15:32 README.bz2
=2Drw-r--r--    1 root     root         3933 Jul 11 17:07 ftruncate.patch.b=
z2
=2Drw-r--r--    1 root     root         7253 Jun 26 13:31 io-stalls-7.diff.=
bz2

Maybe I did something wrong (or 'better') during my 'ftruncate.patch' merge.
I can repeat the below numbers.

* But sometimes *.o files would be corrupted when I do heavy parallel C++
  compilations.
* 'rpm --rebuilddb' sigfault

> > INSTALL/SOURCE> l
> > insgesamt 19286
> > drwxrwxr-x    2 root     root          168 Jul 11 23:33 .
> > drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
> > -rw-r--r--    1 nuetzel  users     1696205 Jul  3 01:32
> > atlas3.5.6.tar.bz2 -rw-r--r--    1 nuetzel  users     2945814 Jul  2
> > 02:53 k3b-0.9pre2.tar.gz -rw-r--r--    1 nuetzel  users    15078557 Jul=
=20
> > 2 03:04 movix-0.8.0rc2.tar.gz
> >
> > INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G c=
ount=3D1 ;
> > time sync
> > 1+0 Records ein
> > 1+0 Records aus
> > 0.010u 0.000s 0:00.00 0.0%      0+0k 0+0io 153pf+0w
> > 0.010u 0.020s 0:00.02 150.0%    0+0k 0+0io 122pf+0w
> >
> > INSTALL/SOURCE> l
> > insgesamt 19310
> > drwxrwxr-x    2 root     root          240 Jul 12 15:01 .
> > drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
> > -rw-r--r--    1 nuetzel  users     1696205 Jul  3 01:32
> > atlas3.5.6.tar.bz2 -rw-r--r--    1 nuetzel  users     2945814 Jul  2
> > 02:53 k3b-0.9pre2.tar.gz -rw-r--r--    1 nuetzel  users    15078557 Jul=
=20
> > 2 03:04 movix-0.8.0rc2.tar.gz -rw-r--r--    1 nuetzel  users  =20
> > 214748364801 Jul 12 15:01 sparse
>
> This is ok, however you also claimed 'sparse' used only 8 kB physical disk
> space what Oleg refuted it can't be.

Yes, see above.
That's because I did something wrong (or 'better').

> Conclusion? You used a different filesystem, not reiser3.

No. It isn't at all that 'old' ReiserFS 3.x when we patch it with=20
'data-logging'. But maybe I did something wrong stupid.

With Chris latest stuff

patches/2.4.22-pre5-data-logging> l
insgesamt 89
drwxr-xr-x    2 root     root          552 Jul 15 05:25 .
drwxr-xr-x    6 root     root          480 Jul 15 06:49 ..
=2Drw-r--r--    1 root     root         1251 Jul 13 16:08=20
02-akpm-b_journal_head-1.diff.bz2
=2Drw-r--r--    1 root     root         4929 Jul 13 16:08=20
04-reiserfs-sync_fs-4.diff.bz2
=2Drw-r--r--    1 root     root        32068 Jul 13 16:08=20
05-data-logging-39.diff.bz2
=2Drw-r--r--    1 root     root          503 Jul 13 16:08=20
06-logging-export.diff.bz2
=2Drw-r--r--    1 root     root         5724 Jul 13 16:08=20
06-reiserfs-jh-3.diff.bz2
=2Drw-r--r--    1 root     root          424 Jul 13 16:08=20
06-write_times.diff.bz2
=2Drw-r--r--    1 root     root        10378 Jul 13 16:08=20
07-reiserfs-quota-28.diff.bz2
=2Drw-r--r--    1 root     root         1541 Jul 13 16:08 08-kinoded-9.diff=
=2Ebz2
=2Drw-r--r--    1 root     root         1097 Jul 13 16:08=20
10-reiserfs-quota-link-fix.diff.bz2
=2Drw-r--r--    1 root     root          564 Jul 13 16:08 README.bz2
=2Drw-r--r--    1 root     root         1580 Jul 15 04:15=20
search_reada-5.diff.bz2

I get the 204,804 MB space usage for every 'sparse' file and comparable=20
runtime (ca. 13,7 MB/s).

INSTALL/SOURCE> l
insgesamt 1032
drwxrwxr-x    2 root     root          176 Jul 15 17:48 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
=2Drw-r--r--    1 nuetzel  users      452390 Jul 15 00:29=20
kmplayer-0.7.96.tar.bz2
=2Drw-r--r--    1 nuetzel  users      403358 Jul 14 21:46=20
modutils-2.4.21-18.src.rpm
=2Drw-r--r--    1 nuetzel  users      194505 Jul 14 22:01=20
procps-2.0.13-1.src.rpm

INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G count=
=3D1 ; time=20
sync
1+0 Records ein
1+0 Records aus
0.000u 2.840s 0:14.77 19.2%     0+0k 0+0io 153pf+0w
0.000u 0.020s 0:01.21 1.6%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse1 bs=3D1 seek=3D200G coun=
t=3D1 ; time=20
sync
1+0 Records ein
1+0 Records aus
0.000u 2.910s 0:14.73 19.7%     0+0k 0+0io 153pf+0w
0.000u 0.010s 0:01.42 0.7%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse2 bs=3D1 seek=3D200G coun=
t=3D1 ; time=20
sync
1+0 Records ein
1+0 Records aus
0.010u 2.920s 0:14.66 19.9%     0+0k 0+0io 153pf+0w
0.010u 0.020s 0:01.30 2.3%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> l
insgesamt 615444
drwxrwxr-x    2 root     root          248 Jul 15 17:58 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
=2Drw-r--r--    1 nuetzel  users      452390 Jul 15 00:29=20
kmplayer-0.7.96.tar.bz2
=2Drw-r--r--    1 nuetzel  users      403358 Jul 14 21:46=20
modutils-2.4.21-18.src.rpm
=2Drw-r--r--    1 nuetzel  users      194505 Jul 14 22:01=20
procps-2.0.13-1.src.rpm
=2Drw-r--r--    1 nuetzel  users    214748364801 Jul 15 17:57 sparse
=2Drw-r--r--    1 nuetzel  users    214748364801 Jul 15 17:58 sparse1
=2Drw-r--r--    1 nuetzel  users    214748364801 Jul 15 17:59 sparse2


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!=
!!!!!!!!!!!!!!!

The 'right' questions are:

* Are the 204,804 MB really needed?
* How many space do XFS, JFS and ext3 'use'?
* When the above three can do it a 1000 times faster why can't we?
* Do the three other do it right?

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!=
!!!!!!!!!!!!!!!

Removing of the sparse files can take horrible amount of time.

Even with a pre-emption kernel on a dual SMP system.
=46or nearly 3 seconds no mouse movement.

INSTALL/SOURCE> time rm sparse ; time sync

0.000u 9.010s 1:05.86 13.6%     0+0k 0+0io 130pf+0w
0.000u 0.000s 0:00.05 0.0%      0+0k 0+0io 122pf+0w


 18:00:18  up 58 min,  1 user,  load average: 2,26, 1,11, 0,70
122 processes: 120 sleeping, 1 running, 1 zombie, 0 stopped
CPU0 states:   0,0% user   6,4% system    0,0% nice   0,0% iowait  93,0% id=
le
CPU1 states:   0,3% user  13,3% system    0,0% nice   0,0% iowait  85,3% id=
le
Mem:  1033384k av, 1026084k used,    7300k free,       0k shrd,  728348k bu=
ff
       618772k active,             343816k inactive
Swap: 1028120k av,   13328k used, 1014792k free                   73976k=20
cached

  PID USER     PRI  NI  SIZE  RSS SHARE WCHAN     STAT %CPU   TIME COMMAND
 3862 nuetzel   17   0   532  532   440 wait_on_b D    17,2   0:06 rm


INSTALL/SOURCE> time rm sparse1 sparse2 ; time sync
0.000u 9.830s 0:09.87 99.5%     0+0k 0+0io 130pf+0w
0.000u 0.000s 0:00.05 0.0%      0+0k 0+0io 122pf+0w


INSTALL/SOURCE> l
insgesamt 615444
drwxrwxr-x    2 root     root          248 Jul 15 18:30 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
=2Drw-r--r--    1 nuetzel  users      452390 Jul 15 00:29=20
kmplayer-0.7.96.tar.bz2
=2Drw-r--r--    1 nuetzel  users      403358 Jul 14 21:46=20
modutils-2.4.21-18.src.rpm
=2Drw-r--r--    1 nuetzel  users      194505 Jul 14 22:01=20
procps-2.0.13-1.src.rpm
=2Drw-r--r--    1 nuetzel  users    214748364801 Jul 15 18:30 sparse
=2Drw-r--r--    1 nuetzel  users    214748364801 Jul 15 18:30 sparse1
=2Drw-r--r--    1 nuetzel  users    214748364801 Jul 15 18:31 sparse2
INSTALL/SOURCE> sync

INSTALL/SOURCE> time rm sparse2 ; time sync
0.000u 4.910s 0:04.92 99.7%     0+0k 0+0io 130pf+0w
0.000u 0.000s 0:00.34 0.0%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> time rm sparse1 ; time sync
0.000u 4.840s 0:04.85 99.7%     0+0k 0+0io 130pf+0w
0.000u 0.000s 0:00.07 0.0%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> sync
INSTALL/SOURCE> time rm sparse ; time sync
0.010u 14.600s 1:49.55 13.3%    0+0k 0+0io 130pf+0w
0.000u 0.010s 0:00.06 16.6%     0+0k 0+0io 122pf+0w


Longest run taken over 5 minutes ;-(
Compare with mine (in the range of XFS, JFS and ext3).
Are there any races (on SMP)?

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!=
!!!!!!!!!!!!!!!

If I 'create' a second sparse file with the same name over an existing one=
=20
(overwrite) I get the 1000 times speedup!

INSTALL/SOURCE> l
insgesamt 1032
drwxrwxr-x    2 root     root          176 Jul 15 18:33 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
=2Drw-r--r--    1 nuetzel  users      452390 Jul 15 00:29=20
kmplayer-0.7.96.tar.bz2
=2Drw-r--r--    1 nuetzel  users      403358 Jul 14 21:46=20
modutils-2.4.21-18.src.rpm
=2Drw-r--r--    1 nuetzel  users      194505 Jul 14 22:01=20
procps-2.0.13-1.src.rpm

INSTALL/SOURCE> sync
INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G count=
=3D1 ; time=20
sync
1+0 Records ein
1+0 Records aus
0.000u 2.870s 0:14.89 19.2%     0+0k 0+0io 153pf+0w
0.000u 0.020s 0:01.55 1.2%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> sync
INSTALL/SOURCE> l
insgesamt 205836
drwxrwxr-x    2 root     root          200 Jul 15 18:40 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
=2Drw-r--r--    1 nuetzel  users      452390 Jul 15 00:29=20
kmplayer-0.7.96.tar.bz2
=2Drw-r--r--    1 nuetzel  users      403358 Jul 14 21:46=20
modutils-2.4.21-18.src.rpm
=2Drw-r--r--    1 nuetzel  users      194505 Jul 14 22:01=20
procps-2.0.13-1.src.rpm
=2Drw-r--r--    1 nuetzel  users    214748364801 Jul 15 18:40 sparse

INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G count=
=3D1 ; time=20
sync
1+0 Records ein
1+0 Records aus
0.000u 0.010s 0:00.00 0.0%      0+0k 0+0io 153pf+0w
0.000u 0.000s 0:00.02 0.0%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> l
insgesamt 205836
drwxrwxr-x    2 root     root          200 Jul 15 18:40 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
=2Drw-r--r--    1 nuetzel  users      452390 Jul 15 00:29=20
kmplayer-0.7.96.tar.bz2
=2Drw-r--r--    1 nuetzel  users      403358 Jul 14 21:46=20
modutils-2.4.21-18.src.rpm
=2Drw-r--r--    1 nuetzel  users      194505 Jul 14 22:01=20
procps-2.0.13-1.src.rpm
=2Drw-r--r--    1 nuetzel  users    214748364801 Jul 15 18:41 sparse


Chris and Oleg what do you need?
SYSRQ-P/M?

Regards,
	Dieter

