From: Christophe Saout <christophe@saout.de>
Subject: Re: reproducable deadlock condition (reiser4)
Date: Sat, 25 Sep 2004 14:52:09 +0200
Message-ID: <1096116729.12503.15.camel@leto.cs.pocnet.net>
References: <1096116193.12503.7.camel@leto.cs.pocnet.net>
	 <559718553.20040925144815@tnonline.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-i+ecOG4AmSAMFgwDfZP6"
Return-path: <reiserfs-list-return-21920-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <559718553.20040925144815@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Spam <spam@tnonline.net>
Cc: reiserfs-list@namesys.com

--=-i+ecOG4AmSAMFgwDfZP6
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 25.09.2004, 14:48 +0200 schrieb Spam:

>   I to had problems with rc1. For example the repacker would also
>   freeze my system or corrupt the disk data. But I switched to rc2-mm1
>   and since then I have not had any reiser4 errors at all. It could be
>   worth a try.

Ok. Let the patch-fest begin...

>   Maybe try to have the syslog on another device as a temporary
>   measure?

Yes, when building on another volume the log gets commited, but it only
contains a bunch of the mentioned lines, nothing else.


--=-i+ecOG4AmSAMFgwDfZP6
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBBVWn5ZCYBcts5dM0RAmlZAJ9rZ6o3jwlU2MQztwoa7E2NnD4K1ACgjtmw
zCj9zg79VrYG8A+pq9/NOdU=
=d+y7
-----END PGP SIGNATURE-----

--=-i+ecOG4AmSAMFgwDfZP6--

