From: Ryan Underwood <nemesis-lists@icequake.net>
Subject: Re: Problems with reiserfs when start OpenAFS 1.2.11-fc1 Segmentation fault with kernel 2.4.22-1.2174.nptl
Date: Wed, 3 Mar 2004 18:28:04 -0600
Message-ID: <20040304002804.GA5722@dbz.icequake.net>
References: <20040304005117.M99283@soltis.cc> <20040304005913.M1858@soltis.cc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Return-path: <reiserfs-list-return-17063-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040304005913.M1858@soltis.cc>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Wed, Mar 03, 2004 at 07:00:06PM -0600, jds wrote:
> Hi: Iam compile OpenAFS 1.2.11-fc1 with kernel 2.4.22-1.2174.nptl is OK
>=20
> problems with reiserfs 3.6 and Fedora Core 1
> the problems is when start the client AFS recive the messages:
>=20
> [root@angelinux modload]# service afs start
> Found libafs-2.4.22-1.2174.nptl-i686.o from SymTable... Loading...
> Starting AFS services.....
> /etc/init.d/afs: line 305:  3300 Segmentation fault      /usr/vice/etc/af=
sd
> ${AFSD_OPTIONS}

You can't use the OpenAFS client on a ReiserFS filesystem.  It currently
only supports ext2/ext3 filesystems.  If you only have reiser
filesystems, just make a big empty file:
# dd if=3D/dev/zero of=3D/var/afscache
and make an ext2 filesystem on it:
# mke2fs -F /var/afscache
and loop-mount it wherever your afs cache needs to be.
# mount -o loop,rw /var/afscache /usr/vice/cache

You can automate this in your fstab:
/var/afscache /usr/vice/cache ext2 defaults,loop 0 0

--=20
Ryan Underwood, <nemesis@icequake.net>

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFARngUIonHnh+67jkRAmvuAJ0QBtiwLsCDPH0KshGPsUn37Vr45QCgj5QG
ppP63o1GyallM1autV9Hink=
=57T/
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
