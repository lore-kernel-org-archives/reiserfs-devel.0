From: Eugene Teo <eugene.teo@eugeneteo.net>
Subject: Re: Reiser4 patch for 2.6.11 kernel
Date: Tue, 22 Mar 2005 08:34:44 +0800
Message-ID: <20050322003444.GA14048@eugeneteo.net>
References: <1111440138.7924.4.camel@gentoo> <NDBBKABJBJCIJNAELLKEIEMPJEAA.jimm@simutronics.com>
Reply-To: Eugene Teo <eugene.teo@eugeneteo.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <NDBBKABJBJCIJNAELLKEIEMPJEAA.jimm@simutronics.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jim Miller <jimm@simutronics.com>
Cc: reiserfs-list@namesys.com

--Fba/0zbH8Xs+Fj9o
Content-Type: multipart/mixed; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<quote sender=3D"Jim Miller">
> > 2.6.11-mm2 has been stable for me, whereas my "-mm patches on vanilla"
> > hack jobs seem to lock up every few days on AMD64. -mm has its
> > annoyances, however, so an updated vanilla patch would be greatly
> > appreciated.
> >
> > On Mon, 2005-03-07 at 12:58 +0300, Vladimir Saveliev wrote:
> > > Hello
> > >
> > > On Mon, 2005-03-07 at 11:40, Lars Tobias B?rsting wrote:
> > > > Hi,
> > > >
> > > > The 2.6.11 kernel has been out for some days now, but no Reiser4 pa=
tch
> > > > has yet been released for it at
> > > > http://ftp.namesys.com/pub/reiser4-for-2.6/. I need to update
> > to 2.6.11
> > > > but I need Reiser4 support.
> > > >
> > > > Has anybody got any idea of if it will be long until a
> > release? Thanks!
> > >
> > > reiser4 patch for 2.6.11 should get out this week
>=20
> Could someone please let me know the list of Reiser4 patches to apply from
> 2.6.11.4-mm4-broken-out to the 2.6.11.4 kernel source.  When I apply the
> entire patch I can't compile -- it breaks on SERIO -- some other unrelated
> patch.

I made a random serio patch that comments the offending lines of code,
so that you can continue to compile the kernel.

Eugene
--=20
1024D/A6D12F80 print D51D 2633 8DAC 04DB 7265  9BB8 5883 6DAA A6D1 2F80
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="01-random-serio-fix-2.6.11.3-A1"
Content-Transfer-Encoding: quoted-printable

diff -Naurb -X /home/kinfect/w/dontdiff 2.6.11.3-BAK/drivers/input/serio/i8=
042-x86ia64io.h 2.6.11.3-COPY/drivers/input/serio/i8042-x86ia64io.h
--- 2.6.11.3-BAK/drivers/input/serio/i8042-x86ia64io.h	2005-03-15 13:21:16.=
000000000 +0800
+++ 2.6.11.3-COPY/drivers/input/serio/i8042-x86ia64io.h	2005-03-15 13:39:44=
=2E000000000 +0800
@@ -294,8 +294,8 @@
 	if (dmi_check_system(i8042_dmi_noloop_table))
 		i8042_noloop =3D 1;
=20
-	if (dmi_check_system(i8042_dmi_nomux_table))
-		i8042_nomux =3D 1;
+/*	if (dmi_check_system(i8042_dmi_nomux_table))*/
+/*		i8042_nomux =3D 1;*/
 #endif
=20
 	return 0;

--wac7ysb48OaltWcw--

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCP2gjWINtqqbRL4ARAl/ZAJ4tBPopBeh+sCY/E+5Y+vgcvbxhPgCeI/Ef
OIJfuDE5zCxCFVm+Vb9o4+c=
=OoDY
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
