From: rvalles <rvalles@es.gnu.org>
Subject: Re: having problems to recover information
Date: Wed, 28 Sep 2005 01:41:46 +0200
Message-ID: <31682.9463038177$1127864598@news.gmane.org>
References: <BAY104-F308B253009F6EA564D2E98A58A0@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Return-path: <reiserfs-list-return-26291-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <BAY104-F308B253009F6EA564D2E98A58A0@phx.gbl>
Sender: <tux@148.Red-217-126-33.pooles.rima-tde.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: enediel gonzalez <enediel@hotmail.com>
Cc: reiserfs-list@namesys.com

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2005 at 08:26:18PM +0000, enediel gonzalez wrote:
> hello everyone
>=20
> I have two debian 3.1 installed with the following configuration
>=20
> /etc/fstab
> # /etc/fstab: static file system information.
> #
> # <file system> <mount point>   <type>  <options>       <dump>  <pass>
> proc            /proc           proc    defaults        0       0
> /dev/sda6       /               reiserfs defaults        0       1
> /dev/sda1       /boot           reiserfs notail          0       2
> /dev/sda5       none            swap    sw              0       0
> /dev/hdc        /media/cdrom0   iso9660 ro,user,noauto  0       0
>=20
> after I made
> shutdown -h now
>=20
> I could restart my pc again, it looks a bad sector on my hard disk
> error reported on sd6
>=20
> I put the hard disk with problems as slave disk on the second pc, to try =
to=20
> at least recover some information
>=20
> fsck doesn't help me
> reiserfsck neither
>=20
> my question is, which tool could help me to recover at least some=20
> subdirectories
>=20
> thanks in advance for any answer
>=20
> Enediel
>=20
1. boot from a livecd (or a different disk, or the network, or whatever)
2. dd_rescue the desired partition into a file on a safe filesystem (it
can be a network one).
3. fsck the disk image file.
4. mount it.
5. move things out.

That's the usual way to do it.

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDOdi6rD81VR3MDtoRApqxAJ4qADvMH5G4aWKSpRvEVHx11N4mIQCfTPZg
ABaP7v3GS0abUdMu+XCJaRI=
=wk+9
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
