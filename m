From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: Horrible ftruncate performance
Date: Tue, 15 Jul 2003 14:19:57 +0200 (MEST)
Message-ID: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu>
References: <200307121551.06288.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14941-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200307121551.06288.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Dieter =?iso-8859-2?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, reiserfs-list@namesys.com


On Sat, 12 Jul 2003, Dieter N=FCtzel wrote:
> > > >>More than 506 times...
> > > >>=3D> 506.34 seconds (8:26.34) / 0.01 seconds =3D 50.634 times ;-)))
> > > >
> > > > I guess you mean 50,634 or 50634 times faster? But I'm afraid you
> > > > didn't test what you should have.
>
> Why? Read again. Time decrease from 8 minutes, 26 seconds down to 0,01
> seconds (sometimes 0,00 seconds).

For the same test, with the efficiency patch, Oleg wrote:

	real    0m19.205s
	user    0m0.000s
	sys     0m7.130s

That's a difference what doesn't happen magically, usually. The reason is
one of these,

	1) Oleg's result is incorrect
	2) Your result is incorrect
	3) You use different patches.

> INSTALL/SOURCE> l
> insgesamt 19286
> drwxrwxr-x    2 root     root          168 Jul 11 23:33 .
> drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
> -rw-r--r--    1 nuetzel  users     1696205 Jul  3 01:32 atlas3.5.6.tar.bz2
> -rw-r--r--    1 nuetzel  users     2945814 Jul  2 02:53 k3b-0.9pre2.tar.gz
> -rw-r--r--    1 nuetzel  users    15078557 Jul  2 03:04 movix-0.8.0rc2.ta=
r.gz
>
> INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G cou=
nt=3D1 ; time
> sync
> 1+0 Records ein
> 1+0 Records aus
> 0.010u 0.000s 0:00.00 0.0%      0+0k 0+0io 153pf+0w
> 0.010u 0.020s 0:00.02 150.0%    0+0k 0+0io 122pf+0w
>
> INSTALL/SOURCE> l
> insgesamt 19310
> drwxrwxr-x    2 root     root          240 Jul 12 15:01 .
> drwxr-xr-x    3 root     root           72 Jul  3 01:39 ..
> -rw-r--r--    1 nuetzel  users     1696205 Jul  3 01:32 atlas3.5.6.tar.bz2
> -rw-r--r--    1 nuetzel  users     2945814 Jul  2 02:53 k3b-0.9pre2.tar.gz
> -rw-r--r--    1 nuetzel  users    15078557 Jul  2 03:04 movix-0.8.0rc2.ta=
r.gz
> -rw-r--r--    1 nuetzel  users    214748364801 Jul 12 15:01 sparse

This is ok, however you also claimed 'sparse' used only 8 kB physical disk
space what Oleg refuted it can't be. Conclusion? You used a different
filesystem, not reiser3.

	Szaka

