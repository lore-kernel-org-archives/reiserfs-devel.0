From: Christophe Saout <christophe@saout.de>
Subject: Re: No reiser4 config options in 2.6.8.1-mm4 make menuconfig?
Date: Tue, 24 Aug 2004 23:55:06 +0200
Message-ID: <1093384506.15322.0.camel@leto.cs.pocnet.net>
References: <1093383564.16361.7.camel@voyager.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-0WvduTBFpeJ3dyRSjliz"
Return-path: <reiserfs-list-return-20491-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093383564.16361.7.camel@voyager.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Steve Bergman <steve@rueb.com>
Cc: reiserfs <reiserfs-list@namesys.com>

--=-0WvduTBFpeJ3dyRSjliz
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 24.08.2004, 16:39 -0500 schrieb Steve Bergman:

> I just downloaded kernel 2.6.8.1 and applied the mm4 patch.  I do have a
> fs/reiser4 directory.  Unfortunately, I see no reiser4 options in make
> menuconfig or make xconfig.  If I set CONFIG_REISER4_FS=3Dm manually, it
> has no effect; no reiser4 module gets built. What am I doing wrong?

You need to disable 4KSTACKS.


--=-0WvduTBFpeJ3dyRSjliz
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBK7k6ZCYBcts5dM0RAjsdAJwPZ0vqQLoyxMbCg2ukPqPOb1PpRwCdGLEG
+6DcbTEAM0oGphASkN7z9oo=
=6YmW
-----END PGP SIGNATURE-----

--=-0WvduTBFpeJ3dyRSjliz--

