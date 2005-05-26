From: Flavien Bridault <f.bridault@fra.net>
Subject: [PATCH] reiser4progs compiling with GCC4.0
Date: Thu, 26 May 2005 21:36:10 +0200
Message-ID: <1117136170.9409.1.camel@Gargamel.ravioli>
Reply-To: disk@sourcemage.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-klUvHp+pIuwXIQntq4L6"
Return-path: <reiserfs-list-return-24164-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-klUvHp+pIuwXIQntq4L6
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi people,

I searched a bit on the mail archive and I didn't find anything about
that except about the devel gcc4.0 tree.

With stable gcc4.0 reiser4progs fails to compile because of three
"static declarations that follows a non-static declarations". I so made
the following patch to get it compiling, but I would like to know if it
seems correct to you (and if it has not already be done ;-) ) before I
integrate it in the Source Mage grimoire.

diff -uNr reiser4progs-1.0.4/plugin/key/key_large/key_large.h
reiser4progs-1.0.4.new/plugin/key/key_large/key_large.h
--- reiser4progs-1.0.4/plugin/key/key_large/key_large.h 2005-02-01
20:08:05.000000000 +0100
+++ reiser4progs-1.0.4.new/plugin/key/key_large/key_large.h
2005-05-26 16:57:20.000000000 +0200
@@ -43,7 +43,7 @@

typedef union key_large key_large_t;

-extern reiser4_plug_t key_large_plug;
+static reiser4_plug_t key_large_plug;

typedef enum {
        /* Major locality occupies higher 60 bits of the first element
*/
diff -uNr reiser4progs-1.0.4/plugin/key/key_short/key_short.h
reiser4progs-1.0.4.new/plugin/key/key_short/key_short.h
--- reiser4progs-1.0.4/plugin/key/key_short/key_short.h 2005-02-01
16:22:18.000000000 +0100
+++ reiser4progs-1.0.4.new/plugin/key/key_short/key_short.h
2005-05-26 16:57:20.000000000 +0200
@@ -42,7 +42,7 @@

typedef union key_short key_short_t;

-extern reiser4_plug_t key_short_plug;
+static reiser4_plug_t key_short_plug;

typedef enum {
        /* Major locality occupies higher 60 bits of the first element
*/
diff -uNr reiser4progs-1.0.4/plugin/oid/oid40/oid40.h
reiser4progs-1.0.4.new/plugin/oid/oid40/oid40.h
--- reiser4progs-1.0.4/plugin/oid/oid40/oid40.h 2005-01-17
14:13:49.000000000 +0100
+++ reiser4progs-1.0.4.new/plugin/oid/oid40/oid40.h     2005-05-26
16:57:20.000000000 +0200
@@ -30,7 +30,7 @@

typedef struct oid40 oid40_t;

-extern reiser4_plug_t oid40_plug;
+static reiser4_plug_t oid40_plug;

#define oid40_get_next(area)            LE64_TO_CPU(*((d64_t *)area))
#define oid40_set_next(area, val)       (*((d64_t *)area) =3D
CPU_TO_LE64(val))

Thanks in advance. :-)
--=20
-- -- -- -- -- -- --
Flavien Bridault
Source Mage GNU/Linux - Disk Section Guru

irc: vlaaad
jabber: vlaaad@amessage.be


--=-klUvHp+pIuwXIQntq4L6
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCliUp2em/EE6e1kQRAidYAKDLGHyj/3uQiZDTnT0JPDNOjUGeUQCdE0bl
2eZJd/udAMh4U9NX0i5F/wU=
=iIRd
-----END PGP SIGNATURE-----

--=-klUvHp+pIuwXIQntq4L6--

