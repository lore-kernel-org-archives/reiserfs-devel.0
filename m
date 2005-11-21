From: "Hesse, Christian" <mail@earthworm.de>
Subject: Re: More Slowdown or reiser4 update for 2.6.14-mm2
Date: Mon, 21 Nov 2005 21:50:39 +0100
Message-ID: <200511212150.46418.mail@earthworm.de>
References: <200511171447.41362.mail@earthworm.de> <43820CAD.3090605@namesys.com> <200511211944.17942.mail@earthworm.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2662372.dTYFvWdidJ";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27056-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511211944.17942.mail@earthworm.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: "E.Gryaznova" <grev@namesys.com>, "Vladimir V. Saveliev" <vs@namesys.com>

--nextPart2662372.dTYFvWdidJ
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 21 November 2005 19:44, Hesse, Christian wrote:
> On Monday 21 November 2005 19:06, E.Gryaznova wrote:
> > Unfortunately we are not able to reproduce this slowdown. Would you
> > please provide more info?:
> > Is this 2.6.14-mm2 bad sync/fsync performance reproducible on fresh
> > created reiser4 too?
>
> Yes, it is. However, I created the fs with reiser4progs v1.0.4, does that
> matter in any way? fsck.reiser4 v1.0.5 reports the fs to be consistent.
>
> > Are these values stable reproducible? If you run this test several time
> > -- do you have the same results?
>
> Yes, it's reproducible. I think the values have a tolerance of maybe 10%,
> but not more. I've never ever seen a sync that used less than 1.5 seconds
> on my running system with 2.6.14.
>
> > Would you please send df -T output and 2.6.14-mm2 config file?
>
> Attached.
>
> > Did you try this test on ext2? If no -- would you please try it on ext2
> > for the same kernels and send us the results?
>
> Will do.

$ for I in `seq 1 5`; do strace -T -e sync,fsync /tmp/reiser4fsync; sleep 1=
;=20
done
sync()                                  =3D 0 <0.960870>
fsync(3)                                =3D 0 <0.165802>
sync()                                  =3D 0 <0.387177>
fsync(3)                                =3D 0 <0.143638>
sync()                                  =3D 0 <0.412164>
fsync(3)                                =3D 0 <0.154767>
sync()                                  =3D 0 <0.395851>
fsync(3)                                =3D 0 <0.176921>
sync()                                  =3D 0 <0.392347>
fsync(3)                                =3D 0 <0.143705>
$ cd /boot # boot is my only non-reiser4-partition
$for I in `seq 1 5`; do strace -T -e sync,fsync /tmp/reiser4fsync; sleep 1;=
=20
done
sync()                                  =3D 0 <0.400663>
fsync(3)                                =3D 0 <0.000288>
sync()                                  =3D 0 <0.306554>
fsync(3)                                =3D 0 <0.000303>
sync()                                  =3D 0 <0.428365>
fsync(3)                                =3D 0 <0.000298>
sync()                                  =3D 0 <0.386107>
fsync(3)                                =3D 0 <0.000304>
sync()                                  =3D 0 <0.405386>
fsync(3)                                =3D 0 <0.000303>

Time for sync() is still the same (as there are mounted reiser4 partitions)=
,=20
fsync() on /boot/ (my only ext2 partition) is as expected.
=2D-=20
Christian

--nextPart2662372.dTYFvWdidJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.19 (GNU/Linux)

iD8DBQBDgjMmlZfG2c8gdSURAiBIAKCLdAWN2eZvjGhCaBGgXXFlgOmybgCgr6Hp
S9ZlwqpGznYixhLWYmtXOUE=
=RJQt
-----END PGP SIGNATURE-----

--nextPart2662372.dTYFvWdidJ--
