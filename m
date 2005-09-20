From: Roman I Khimov <rik@osrc.info>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Wed, 21 Sep 2005 00:20:04 +0400
Message-ID: <200509210020.27455.rik@osrc.info>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl> <200509202328.28501.rik@osrc.info> <200509202015.j8KKFfjd025051@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1728619.U8z5T9UZDr";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26158-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509202015.j8KKFfjd025051@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com, Pavel Machek <pavel@suse.cz>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>

--nextPart1728619.U8z5T9UZDr
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello.

=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 21 =D1=81=D0=B5=D0=BD=D1=82=D1=8F=D0=B1=D1=
=80=D1=8F 2005 00:15 | Valdis.Kletnieks@vt.edu:
> On Tue, 20 Sep 2005 23:28:12 +0400, Roman I Khimov said:
> > fsck lied about its success (result =3D 1)
>=20
> What was the return value and output from the *first* fsck?=20

I have added "echo $RESULT && exit" after "RESULT=3D$?" and... resulting lo=
g=20
is 877635 bytes long %-)

Return value is 1, if you want to see all of it, it's here:

http://www.osrc.info/temp/fsck.ext2-log.bz2

90844 bytes long, bzip2

And fsck.reiser4 is making pass #80...

=2D-=20
                            Roman
 ,---------------------------. ,--------------------------.
/     http://www.3os.ru/      V    http://www.osrc.info/   \         .o.
\    mailto: rik@3os.ru       ^   mailto: rik@osrc.info    /         ..o
 `---------------------------' `--------------------------'          ooo
gpg --recv-keys 0xE5E055C3 --keyserver hkp://subkeys.pgp.net

--nextPart1728619.U8z5T9UZDr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBDMG8KXJ70z+XgVcMRAocyAJ49tKcmrKL5Eu+ScIzmy6iLt2/VaQCfZg12
vltCeLmVs0LjI9oY7z2LUs8=
=jhVs
-----END PGP SIGNATURE-----

--nextPart1728619.U8z5T9UZDr--
