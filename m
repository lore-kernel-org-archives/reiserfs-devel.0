From: Redeeman <redeeman@metanurb.dk>
Subject: Re: Reiser4 / Reiserfs bonnie++ performance comparison
Date: Sat, 10 Jul 2004 00:06:01 +0200
Message-ID: <1089410761.10745.7.camel@localhost>
References: <20040709165924.27fabe63@philou.gramoulle.local>
	 <1089406483.10745.3.camel@localhost>
	 <200407092352.15303.Dieter.Nuetzel@hamburg.de>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19566-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407092352.15303.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

this was done using the 2.6.5-rc2 stable snapshot, and the stock
reiserfs in the kernel

On Fri, 2004-07-09 at 23:52 +0200, Dieter N=FCtzel wrote:
> Am Freitag, 9. Juli 2004 22:54 schrieb Redeeman:
> > My benchmarks.. (if you can call it that)
> > reiser4
> >
> > root@redeeman: /mnt/fstest# time tar -xjf /miscbinds/work/linux-
> > 2.6.5.tar.bz2
> >
> > real    0m18.834s
> > user    0m14.785s
> > sys     0m2.516s
> >
> > root@redeeman: /mnt/fstest# time cp -a linux-2.6.5 linux
> >
> > real    0m12.936s
> > user    0m0.067s
> > sys     0m2.137s
> >
> > root@redeeman: /mnt/fstest# time rm -fr linux
> >
> > real    0m3.596s
> > user    0m0.012s
> > sys     0m1.237s
> >
> > -------------------------------------
> >
> > reiserfs:
> >
> > root@redeeman: /mnt/fstest# time tar -xjf /miscbinds/work/linux-
> > 2.6.5.tar.bz2
> >
> > real    0m31.078s
> > user    0m15.232s
> > sys     0m2.099s
> >
> > root@redeeman: /mnt/fstest# time cp -a linux-2.6.5 linux
> >
> > real    0m50.763s
> > user    0m0.134s
> > sys     0m2.935s
> >
> > root@redeeman: /mnt/fstest# time rm -fr linux
> >
> > real    0m1.493s
> > user    0m0.013s
> > sys     0m0.722s
>=20
> All ReiserFS 3.6 without data-logging (parallel write optimization, etc.)=
, NEW=20
> block allocation, with tails?
>=20
> 2.6.7-mmX (or Chris patches)?
>=20
> Thanks,
> 	Dieter
>=20
--=20
Redeeman <redeeman@metanurb.dk>

