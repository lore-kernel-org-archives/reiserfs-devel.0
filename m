From: Jeff Mahoney <jeffm@suse.com>
Subject: [ANNOUNCE] reiserfsprogs 3.6.24
Date: Mon, 26 Aug 2013 17:01:55 -0400
Message-ID: <521BC243.2040101@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="mW30opJn3OKwOb4vGmHQcjeLD7mpMcIPL"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mW30opJn3OKwOb4vGmHQcjeLD7mpMcIPL
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all -

I'm happy to announce the release of reiserfsprogs 3.6.24.

This is a minor maintenance release and contains the following changes
since 2.6.23:

- reiserfeprogs: autogenerate the version number in the man pages
- journal: fix division by 0 with one transaction in log (crash)
- CREDITS/CONTACT: remove non-historical references to namesys.com
- resize_reiserfs: fix > 8TB printf formatting
- man: create links to common-prefix command names
- reiserfsprogs: add symlinks for debugreiserfs and reiserfstune

It is available via the kernel.org ftp site at:
http://ftp.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs/v3.6.24=
/

The next release will be larger and include major cleanups as well as
the export of a shared library for other programs to use. I intend on
pushing most of those changes fairly quickly.

-Jeff

--=20
Jeff Mahoney
SUSE Labs


--mW30opJn3OKwOb4vGmHQcjeLD7mpMcIPL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJSG8JGAAoJEB57S2MheeWyU8gP/jVzNhOwprKGk4MEfLUJQJMZ
oGgGFpVZWib5d1FaoIpaX1IncCLw6VTNki1K7gxlGPcz2MCt4O3Iery8BnS9uMd0
MPRiD5AKKWsg8SwvLFiKInxIMty7rLnHa9hja5RsVinKnAgxX7Ru2XCfXTXQZymH
ZH1dFhdn/IKyOYPINgauglDeIGuFmk2AN4Tgird7YbopDMBfAU9FyCkKPY6bKVtE
M37nWjhYMMoZ13/iz9Ew81VUtVHNpJqJoYyip2Wb2Z+u6/fI7oBvoW2a3hDwa8f6
drYY68lW00T8FS+H6aaj7mXvjsSydNRF5RsPXuAOrLfSyPZxtlaZXcwd3otOMSbD
KtqL5kCQhmtKvBwHqf1k9neHaOrsnYOoQ6iWWmBispZ6Ey1s2WBUEt18T8Agidrq
lDRQ8c9tW1rmUnwohT/C9vrzYDFSu3ZFjinys6W1LevY5qOOZ/v1hPAc9ypQ4c3t
X4xAqOQ1LwTRQlq0H2D8SvGtcEXoFYuIB2x61XAUK24UdDS6u7TFZYsB6zvh8Wk2
VtufzBNG40jaLj13pzY2Kc7xI1NAl9B7DsBpiktQLIf1/BjbV1QoUBMS8Y2RiF85
DALQv/4khTmfi/Z8zgF+jc9jituBtrBWkQWsE/q4n6Z7I+dtfdQHULV12WAHFqgM
Us8X1h7IbHXCEikh8rxB
=T6NZ
-----END PGP SIGNATURE-----

--mW30opJn3OKwOb4vGmHQcjeLD7mpMcIPL--
