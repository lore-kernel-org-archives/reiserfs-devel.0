From: "Hesse, Christian" <mail@earthworm.de>
Subject: Re: Collect data?
Date: Wed, 23 Nov 2005 12:53:30 +0100
Message-ID: <200511231253.37328.mail@earthworm.de>
References: <200511171447.41362.mail@earthworm.de> <20051123104847.GA22178@favonius> <438450EA.5050409@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1467745.KXTydd0vvH";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27105-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <438450EA.5050409@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: sander@humilis.net, reiserfs-list@namesys.com, "E.Gryaznova" <grev@namesys.com>

--nextPart1467745.KXTydd0vvH
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 23 November 2005 12:22, Vladimir V. Saveliev wrote:
> Hello
>
> Sander wrote:
> > Hesse, Christian wrote (ao):
> >>On Wednesday 23 November 2005 08:09, Sander wrote:
> >>>My 'good' system:
> >>>kernel:		2.6.15-rc1-mm2
> >>>OS:		Debian Sid
> >>>disks:		4x sata on Promise
> >>>raid/lvm/etc:	lmv stripe
> >>>
> >>>My 'bad' system:
> >>>kernel:		2.6.15-rc1-mm1
> >>>OS:		Debian Sid
> >>>disks:		ata on nForce2
> >>>raid/lvm/etc:	none, single disk
> >>
> >>My 'bad' system:
> >>kernel:		everything from 2.6.14-rc3* to 2.6.15-rc1*
> >>Compiler:		GCC 3.4.4-r1 (including Gentoo patches)
> >>OS:			Gentoo ~x86
> >>disk:			ATA on Intel ICH4-M (Centrino Notebook)
> >>raid/lvm/etc:	none, single disk
> >
> > Your Compiler suggestion is a good one.
> >
> > I added your data at http://humilis.net/reiser4slowdown assuming you
> > don't mind (please let me know if you do mind).
> >
> > Reiser-dev team, do you need other info beside what is listed there?
>
> It could be useful if there were a description of a test which was used to
> measure slowdown, result of that test on both "good" and "bad" kernels.
> Information about good kernel is also needed.

=46or Sander's list:

http://www.earthworm.de/tmp/reiser4-fsync.c
strace -T -e sync,fsync reiser4-fsync

Good kernels is everything 2.6.13* and before.
=2D-=20
Christian

--nextPart1467745.KXTydd0vvH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.19 (GNU/Linux)

iD8DBQBDhFhBlZfG2c8gdSURAlg9AKC4mIWu0dbmisCHY88e+Sv9RtMd9QCZATV8
XiAZ3QSQt9kuHg2kwVqCeNE=
=WE0F
-----END PGP SIGNATURE-----

--nextPart1467745.KXTydd0vvH--
