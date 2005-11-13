From: =?UTF-8?B?UGV0dGVyaSBSw6R0eQ==?= <betelgeuse@gentoo.org>
Subject: Re: need opinions from sysadmins on where reiser4progs should install
Date: Sun, 13 Nov 2005 13:08:26 +0200
Message-ID: <43771EAA.4040208@gentoo.org>
References: <4376E891.6070506@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig73E30072E1EEE37C46738F0C"
Return-path: <reiserfs-list-return-26913-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4376E891.6070506@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

--------------enig73E30072E1EEE37C46738F0C
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hans Reiser wrote:
> currently it installs mkfs.reiser4 and such in /usr/local/sbin
>=20
> This is not found by default paths for most roots, and seems unlikely t=
o
> be where I would want it to go if I was sysadmin....  I would never
> install mkfs.anything unless I wanted it in /sbin.....  but then I am
> not a professional....
>=20
> What do the sysadmins on the list think?

I am not a sysadmin but I think the current scheme is good. After all
the user could have reiser4progs installed by the distribution in /sbin,
which would be overridden. If the user really wants to manually install
the program to /sbin, he should use the appropriate ./configure options.

Regards,
Petteri R=C3=A4ty


--------------enig73E30072E1EEE37C46738F0C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFDdx66cxLzpIGCsLQRAm/DAJ9G5NsdgwD8dxmoX8Dj9pvQT1iVwwCeIujI
pbiS9ZPk2BDEu4XR7Ai9y2I=
=/Sfa
-----END PGP SIGNATURE-----

--------------enig73E30072E1EEE37C46738F0C--
