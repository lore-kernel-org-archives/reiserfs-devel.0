From: Francisco Javier Cabello <fjcabello@visual-tools.com>
Subject: Re: data corruption with 2.4.25 and datalogging patches
Date: Mon, 17 Jul 2006 12:49:35 +0200
Message-ID: <200607171249.39797.fjcabello@visual-tools.com>
References: <200607120816.11292.fjcabello@visual-tools.com> <200607141420.36656.fjcabello@visual-tools.com> <1152881975.6407.58.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3521496.zVDiMEUNPA";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29026-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1152881975.6407.58.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--nextPart3521496.zVDiMEUNPA
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,
do you think it could be realted with low memory conditions? Perhaps the=20
systems with the problem has a high memory use with a lot of swapping. I am=
=20
just brainstorming...

Regards,

Paco


On Friday, 14 de July de 2006 14:59, Vladimir V. Saveliev wrote:
> Hello
>
> On Fri, 2006-07-14 at 14:20 +0200, Francisco Javier Cabello wrote:
> > Hello Vladimir,
> >
> > # reiserfsck -l /tmp/reiserfsck.log -y --check /dev/hdc1
> >
> > Standard output:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > Will read-only check consistency of the filesystem on /dev/hdc1
> > Will put log info to '/tmp/reiserfsck.log'
> > ###########
> > reiserfsck --check started at Fri Jul 14 14:09:33 2006
> > ###########
> > Replaying journal..
> > Reiserfs journal '/dev/hdc1' in blocks [18..8211]: 0 transactions
> > replayed Checking internal tree..finished
> > Comparing bitmaps..Bad nodes were found, Semantic pass skipped
> > 1 found corruptions can be fixed only when running with --rebuild-tree
> > ###########
> > reiserfsck finished at Fri Jul 14 14:13:29 2006
> > ###########
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >
> > /tmp/reiserfsck.log:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > bad_internal: vpf-10320: block 23868569, items 91 and 92: The wrong ord=
er
> > of items: [410810496 11321 0x16abca00 ??? (15)], [11312 11321 0x22f1c880
> > DIR (3)]
>
> such corruptions used to be considered as hardware bugs. Memory failure,
> for instance. Did you ever run memtest on your systems?
>
> >  the problem in the internal node occured (23868569), whole subtree is
> > skipped vpf-10640: The on-disk and the correct bitmaps differs.
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

=2D-=20
One of my most productive days was throwing away 1000 lines of code (Ken=20
Thompson)
=2D----------------
PGP fingerprint: AF69 62B4 97EB F5BB 2C60  B802 568A E122 BBBE 5820
PGP Key available at http://pgp.mit.edu
=2D----------------


--nextPart3521496.zVDiMEUNPA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBEu2tDVorhIru+WCARAii4AJ9pY9DSMVhxd0vN258jFAiftPte6ACeJ9yX
7ulQ3eTJdRX4312JIhIOlDc=
=hY96
-----END PGP SIGNATURE-----

--nextPart3521496.zVDiMEUNPA--
