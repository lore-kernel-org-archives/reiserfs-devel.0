From: Jason Stubbs <jstubbs@gentoo.org>
Subject: Re: GCC 4.0.0
Date: Mon, 18 Jul 2005 10:24:23 +0900
Message-ID: <200507181024.25786.jstubbs@gentoo.org>
References: <42DB0093.5000809@uai.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1281041.jFm7bKduO9";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25169-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42DB0093.5000809@uai.com.br>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com, lvella@gmail.com

--nextPart1281041.jFm7bKduO9
Content-Type: multipart/mixed;
  boundary="Boundary-01=_ITw2CG2EEt43Sxs"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_ITw2CG2EEt43Sxs
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 18 July 2005 10:06, Lucas Clemente Vella wrote:
> I saw that the issue that reiser4progs-1.0.4 is not being compilled
> on Fedora 4 has already been discussed here.
> I would like to know if any progress is being done about this,
> because it's not only a problem with Fedora 4, but a problem with
> GCC 4: I use GCC 4 on Slackware 10 (kernel 2.6.12.3) and I had a
> similar problem.

I've attached the patch that is used on Gentoo.

=2D-=20
Jason Stubbs

--Boundary-01=_ITw2CG2EEt43Sxs
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="reiser4progs-1.0.4-gcc4.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="reiser4progs-1.0.4-gcc4.patch"

diff -ur reiser4progs-1.0.4-orig/plugin/key/key_large/key_large.h reiser4pr=
ogs-1.0.4/plugin/key/key_large/key_large.h
=2D-- reiser4progs-1.0.4-orig/plugin/key/key_large/key_large.h	2005-03-12 1=
4:12:04.000000000 -0500
+++ reiser4progs-1.0.4/plugin/key/key_large/key_large.h	2005-03-12 14:14:16=
=2E000000000 -0500
@@ -43,7 +43,7 @@
=20
 typedef union key_large key_large_t;
=20
=2Dextern reiser4_plug_t key_large_plug;
+static reiser4_plug_t key_large_plug;
=20
 typedef enum {
 	/* Major locality occupies higher 60 bits of the first element */
diff -ur reiser4progs-1.0.4-orig/plugin/key/key_short/key_short.h reiser4pr=
ogs-1.0.4/plugin/key/key_short/key_short.h
=2D-- reiser4progs-1.0.4-orig/plugin/key/key_short/key_short.h	2005-03-12 1=
4:12:04.000000000 -0500
+++ reiser4progs-1.0.4/plugin/key/key_short/key_short.h	2005-03-12 14:14:04=
=2E000000000 -0500
@@ -42,7 +42,7 @@
=20
 typedef union key_short key_short_t;
=20
=2Dextern reiser4_plug_t key_short_plug;
+static reiser4_plug_t key_short_plug;
=20
 typedef enum {
 	/* Major locality occupies higher 60 bits of the first element */
diff -ur reiser4progs-1.0.4-orig/plugin/oid/oid40/oid40.h reiser4progs-1.0.=
4/plugin/oid/oid40/oid40.h
=2D-- reiser4progs-1.0.4-orig/plugin/oid/oid40/oid40.h	2005-03-12 14:13:18.=
000000000 -0500
+++ reiser4progs-1.0.4/plugin/oid/oid40/oid40.h	2005-03-12 14:10:57.0000000=
00 -0500
@@ -30,7 +30,7 @@
=20
 typedef struct oid40 oid40_t;
=20
=2Dextern reiser4_plug_t oid40_plug;
+static reiser4_plug_t oid40_plug;
=20
 #define oid40_get_next(area)            LE64_TO_CPU(*((d64_t *)area))
 #define oid40_set_next(area, val)       (*((d64_t *)area) =3D CPU_TO_LE64(=
val))

--Boundary-01=_ITw2CG2EEt43Sxs--

--nextPart1281041.jFm7bKduO9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBC2wTJxvWNPsk/ZP4RAjr3AJ9lAcScEqrSTXeaF4kuDfJcMiuxyACfZCzK
XFKwnpyX6j+Vb/iTKoDP8SA=
=E3mz
-----END PGP SIGNATURE-----

--nextPart1281041.jFm7bKduO9--
