From: Jeff Mahoney <jeffm@suse.com>
Subject: [ANNOUNCE] reiserfsprogs 3.6.23 released
Date: Mon, 01 Jul 2013 15:32:24 -0400
Message-ID: <51D1D948.3070401@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2WVMDXOLPSKOSFDHPUSAI"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2WVMDXOLPSKOSFDHPUSAI
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all -

I'm happy to announce that reiserfsprogs 3.6.23 has been released.

This release was mostly to push out the accumulated fixes and to move
past the problem with the 3.6.22 release not providing the correct
version number.

The changelog is fairly small:
        clean up build environment
        clean up io-failure-emulation logic a bit
        mkreiserfs: stop printing credits
        reiserfscore: add support for register_printf_specifier
        reiserfsck: support `fsck -f -n`
        reiserfscore: fix uninitialized variable warning in print_indirec=
t_item
        reiserfsprogs: fix -Wpointer-sign warnings for blocksize and posi=
tion
        debugreiserfs: fix dereferencing type-punned pointer warning
        reiserfsprogs: fix unsigned char with strlen/strcmp/strncpy warni=
ngs
        reiserfsprogs: fix printf formatting warnings
        reiserfsprogs: fix set-but-not-used gcc warnings
        reiserfsprogs: remove autoconf-generated files

It can be downloaded from any kernel.org mirror:
ftp://ftp.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs/v3.6.23/=



-Jeff

--=20
Jeff Mahoney
SUSE Labs


------enig2WVMDXOLPSKOSFDHPUSAI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJR0dlLAAoJEB57S2MheeWyGi8P/04OCAh++7xkLDfQHDGP5HIB
d8WMNyTUolePO+oWZ7HIH5KKqSGNrWz3m792Rkch4qBbS/OhStzEgtWQZqW5R/Of
Hhs7NQfDlaPFK+AyUCiAfUl6eGJIc78lNQ7E+SWXhHOlfqXSo4o1bdxjN/JhvZkk
hsXfj3qndrDD0y+mSCXretu0sXHisLlYnYg7iE1nkb6RBTydchgy4GbYj4JynWhJ
QBP8F9bV3OlpBJNJLOPClaf10Rc0MaLKx2mi4z5C3bZKCszz0p7wmDg86FodpElj
ZLAGFKESAhWc70fbUcDSVOt+I31XT9WkJV4jj0E01fyM/89RurisP+WmcuzD1Bqm
zoF1OHe/nRjtw3JLSJYCZs/LhPo67HbPhWU4oTZqA/S4zs8NWlYiCKwKbrkqeKkT
FprneOYoTylaFnvLOvd/hAsKQ5cHnAPwVIkvRyFhGVG8R6mwj5s1POJ9X+87x8+j
5mRMQn0dRqSc+gmH169E2fxS5wXq+1tCIhBBa6cnbq5pfY2H8O5X4lAal1Mzixum
Yu9KCjcFNypoAM/57eAvL9TY7ku/wgJt3+8W059yQrbNTA24X9jiIIr0t3EYXh3t
SWkNqfugQTrS4uNMKjUFje9fE4WHN0qqOBR7UbXJ3FdDUp1XpDndU1EB2zzNLCfj
AR8I1FKbwFDwGz8kC/gw
=IsVS
-----END PGP SIGNATURE-----

------enig2WVMDXOLPSKOSFDHPUSAI--
