From: Zan Lynx <zlynx@acm.org>
Subject: Re: reiser4 mount options
Date: Mon, 24 Dec 2007 17:34:22 +0000
Message-ID: <1198517663.6209.18.camel@localhost>
References: <14476466.post@talk.nabble.com> <476E6CE2.7030004@namesys.com>
	 <14483298.post@talk.nabble.com> <476EFF85.2070002@namesys.com>
	 <14484849.post@talk.nabble.com>  <476FC217.9090408@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Jm3wSM6iqDsy6fVaTfXS"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <476FC217.9090408@namesys.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>
Cc: butdiene <butdiene@yahoo.com>, reiserfs-devel@vger.kernel.org


--=-Jm3wSM6iqDsy6fVaTfXS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


On Mon, 2007-12-24 at 17:28 +0300, Edward Shishkin wrote:

> Sorry, ignore my suggestion about fstab. It is impossible to pass
> reiser4-specific mount options for ''/" via fstab, because all such optio=
ns
> are passed to "/" via remount, but ->remount_fs() super operation is not
> implemented for reiser4.
>=20
> However, it is possible to pass reiser4-specific mount options for "/" vi=
a
> boot loader. I have passed a string "rootflags=3Dtmgr.atom_max_size=3D204=
8"
> to my grub, and it works for me. Note, that prefix "tmgr." is required an=
d
> values should be passed in decimal format.

Last year when I needed rootflags I found out that they only work if
your distro implements them through an initrd or initramfs.  Since most
distros do this it works ok.  But my Gentoo system did not use an
initramfs and I could not get rootflags options to work on the kernel
command line.

So I made my own initramfs with BusyBox and a short script.
--=20
Zan Lynx <zlynx@acm.org>

--=-Jm3wSM6iqDsy6fVaTfXS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.8 (GNU/Linux)

iEYEABECAAYFAkdv7Z4ACgkQG8fHaOLTWwgOpgCgi/OVppTeNf+zbX9KG4lByUnU
HQ0An1Wv/1XgyDRAmCi0yEUou21JoUkU
=3D+6
-----END PGP SIGNATURE-----

--=-Jm3wSM6iqDsy6fVaTfXS--

