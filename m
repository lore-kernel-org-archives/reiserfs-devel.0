From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Strange problems/bugs with reiserfs and reiserfschk
Date: Wed, 24 Aug 2005 14:47:11 +0400
Message-ID: <200508241447.11546.vitaly@namesys.com>
References: <42F684EE.7010201@muenning.com> <200508151720.09411.vitaly@namesys.com> <430B957E.4020004@muenning.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25635-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <430B957E.4020004@muenning.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Konstantin =?iso-8859-1?q?M=FCnning?= <konstantin@muenning.com>
Cc: reiserfs-list@namesys.com

On Wednesday 24 August 2005 01:30, Konstantin M=FCnning wrote:
> Hi Vitaly!
>=20
> Thank you for the reiserfsck 3.9.20. It in fact had different results on
>  that drive. I had it run in gdb (as I did with 3.6.19 to see what/where
> the trouble may be) and the result is:
>=20
> (***snip***)
> vpf-10680: The file [641222 641239] has the wrong block count in the
> StatData (1528) - corrected to (1520)
> vpf-10680: The file [641222 641241] has the wrong block count in the
> StatData (47192) - corrected to (47168)
> vpf-10680: The file [641222 641242] has the wrong block count in the
> StatData (16624) - corrected to (16528)
>=20
> are_file_items_correct: All bytes we look for must be first items byte
> (position 0).
>=20
> Program received signal SIGABRT, Aborted.
> 0xffffe410 in __kernel_vsyscall ()
> (***snip***)
>=20
> Hmm... Ugly ;-).
>=20
> Vitaly Fertman wrote:
>=20
> > if some file item offsets are corrupted, fsck can work for too long on =

> > pass2. or it also can be a bug. I will send you a version of reiserfspr=
ogs=20
> > that has an optimization fix for former. if it fails email me and provi=
de=20
> > the metadata please:
> > 	debugreiserfs -p <device> | bzip2 -c > <device>.bz2
>=20
> Do you need the metadata or the full logfile or should I send you
> something more/else for that?

yes, metadata would be enough.

--=20
Thanks,
Vitaly Fertman
