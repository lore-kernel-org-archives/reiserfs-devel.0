From: Todd Lyons <todd@mrball.net>
Subject: Re: Still wrong reported file size after --rebuild-tree
Date: Thu, 31 Oct 2002 09:05:19 -0800
Message-ID: <20021031170519.GB17786@mrball.net>
References: <20021030193045.69179289.philippe.gramoulle@mmania.com> <20021031035736.GG14386@mrball.net> <20021031102146.33112432.philippe.gramoulle@mmania.com> <15808.64429.674075.310428@laputa.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Return-path: <reiserfs-list-return-11869-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <15808.64429.674075.310428@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Nikita Danilov wanted us to know:

> >   |  >-r-x--x---    1 19415372 19415373 83388383504122186 Aug 13  1970 =
25s_lb.jpg
> >   |  >-r--rw-rw-    1 19415354 19415355 83388306194710840 Aug 13  1970 =
25slight.jpg
> >   |  >-r---wxrwx    1 19415331 19415332 83388207410463009 Aug 13  1970 =
25slight_ln.jpg
> >   |  We had these too.  Humongous uid and gid numbers.
>They are also -consequent-, and Oleg found that they look conspicuous
>when printed in hex (with file sizes).

Now that you mention it, yes.  Interesting that they all have the same
date and how the perms have a funny pattern too. =20
--=20
Blue skies...		Todd
| Get a bigger hammer!   |   Never mind me.  I'm speaking out of  |
| http://www.mrball.net  |   my /dev/ass anyway.                  |
| http://faq.mrball.net  |                        --Gash Teshome  |
   Linux kernel 2.5.44   2 users,  load average: 0.00, 0.00, 0.00

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9wWLPIBT1264ScBURArkaAKCTKFvigTMAYKSLZSGsb0lynBX8lQCeI1cR
aUD4YpsYX83n+X3tkhxBL8c=
=nqHW
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--
