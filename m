From: Dieter =?iso-8859-2?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Horrible ftruncate performance
Date: Sat, 12 Jul 2003 15:51:06 +0200
Message-ID: <200307121551.06288.Dieter.Nuetzel@hamburg.de>
References: <Pine.LNX.4.30.0307120546340.30730-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14912-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.30.0307120546340.30730-100000@divine.city.tvnet.hu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Szakacsits Szabolcs <szaka@sienet.hu>, Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: reiserfs-list@namesys.com

Am Samstag, 12. Juli 2003 05:49 schrieb Szakacsits Szabolcs:
> On Sat, 12 Jul 2003, Carl-Daniel Hailfinger wrote:
> > Szakacsits Szabolcs wrote:
> > > On Fri, 11 Jul 2003, Dieter [iso-8859-1] N=FCtzel wrote:
> > >>More than 506 times...
> > >>=3D> 506.34 seconds (8:26.34) / 0.01 seconds =3D 50.634 times ;-)))
> > >
> > > I guess you mean 50,634 or 50634 times faster? But I'm afraid you
> > > didn't test what you should have.

Why?
Read again.
Time decrease from 8 minutes, 26 seconds down to 0,01 seconds (sometimes 0,=
00=20
seconds).

> > > Interestingly, the above speedup, 50 times,

Do the math.

> > > is just what I got with Oleg's patch. So now it's only about
> > > 2000 times slower than XFS, JFS and ext3.

Do you think?
Compare your 0.00 seconds (0,00 seconds) for XFS, JFS and ext3 with my 0.01=
=20
seconds (0,01 seconds with tcsh 'time').

> > This is an i18n issue. In Germany, the meaning of "." and "," in numbers
> > is just the reverse of U.S. usage. Of course, we Germans argue the U.S.
> > do it backwards.
> > Pi=3D3,14159265....
> > fifty thousand six hundred thirty four=3D50.634
>
> I know very well, but we are communicating in English, not German.

Even that ;-)

I mean what I've wrote.
In English (US): 50.634 (fifty thousand six hundred thirty four)

My only error was:
Apart from my disks specification (I post as much as I can when we talk abo=
ut=20
'benchmarks') I copy & paste some wrong lines. But the final 'sync' is fast=
er=20
with faster disk;-)

I did three (or more) sparse file generations. One after each other.
See, again:


INSTALL/SOURCE> l
insgesamt 19286
drwxrwxr-x    2 root     root          168 Jul 11 23:33 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
=2Drw-r--r--    1 nuetzel  users     1696205 Jul  3 01:32 atlas3.5.6.tar.bz2
=2Drw-r--r--    1 nuetzel  users     2945814 Jul  2 02:53 k3b-0.9pre2.tar.gz
=2Drw-r--r--    1 nuetzel  users    15078557 Jul  2 03:04 movix-0.8.0rc2.ta=
r.gz

INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G count=
=3D1 ; time=20
sync
1+0 Records ein
1+0 Records aus
0.010u 0.000s 0:00.00 0.0%      0+0k 0+0io 153pf+0w
0.010u 0.020s 0:00.02 150.0%    0+0k 0+0io 122pf+0w

INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse1 bs=3D1 seek=3D200G coun=
t=3D1 ; time=20
sync
1+0 Records ein
1+0 Records aus
0.010u 0.000s 0:00.00 0.0%      0+0k 0+0io 153pf+0w
0.000u 0.010s 0:00.02 50.0%     0+0k 0+0io 122pf+0w
INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse2 bs=3D1 seek=3D200G coun=
t=3D1 ; time=20
sync
1+0 Records ein
1+0 Records aus
0.000u 0.010s 0:00.00 0.0%      0+0k 0+0io 153pf+0w
0.000u 0.000s 0:00.01 0.0%      0+0k 0+0io 122pf+0w

INSTALL/SOURCE> l
insgesamt 19310
drwxrwxr-x    2 root     root          240 Jul 12 15:01 .
drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
=2Drw-r--r--    1 nuetzel  users     1696205 Jul  3 01:32 atlas3.5.6.tar.bz2
=2Drw-r--r--    1 nuetzel  users     2945814 Jul  2 02:53 k3b-0.9pre2.tar.gz
=2Drw-r--r--    1 nuetzel  users    15078557 Jul  2 03:04 movix-0.8.0rc2.ta=
r.gz
=2Drw-r--r--    1 nuetzel  users    214748364801 Jul 12 15:01 sparse
=2Drw-r--r--    1 nuetzel  users    214748364801 Jul 12 15:01 sparse1
=2Drw-r--r--    1 nuetzel  users    214748364801 Jul 12 15:01 sparse2

Regards,
	Dieter

