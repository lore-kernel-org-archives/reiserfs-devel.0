From: "Lamont R. Peterson" <lamont@gurulabs.com>
Subject: Re: can't find a reiserfs file ssytem! 3.b
Date: Wed, 17 Mar 2004 10:38:39 -0700
Message-ID: <1079545118.2579.17.camel@wraith.lrp.advansoft.us>
References: <20040317145013.B6D3B3982E7@ws5-1.us4.outblaze.com>
Reply-To: lamont@gurulabs.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ouSSBvfG79Q2TkGAvaDG"
Return-path: <reiserfs-list-return-17279-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040317145013.B6D3B3982E7@ws5-1.us4.outblaze.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-ouSSBvfG79Q2TkGAvaDG
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-03-17 at 07:50, mite pascoff wrote:
> > do you want to recover only first 2G of your data?
>=20
> NO thats because dd could copy only 2GB af data and stops ... I want to r=
ecover the whole 15GB partition

This is not because of dd; from other messages, I think you are
indicating that you have mounted the destination space via NFS.  With
NFS v3 you can only write files across the network up to 2^32-1 bytes in
length (IIRC).  To get around this, you could do something like this:

dd if=3D/dev/bad_part of=3D/nfs/mount/point/partition_1 bs=3D1024
count=3D2097152

dd if=3D/dev/bad_part of=3D/nfs/mount/point/partition_2 bs=3D1024
count=3D2097152 seek=3D2097153

...and so on, until you have the files for all.  You should also check
my math (I just threw this up from memory to illustrate the concept) and
be sure that you can get these files built right.  If nfs causes too
much trouble, you could create these files on the 5GB partition and then
use scp to move them over the network.

You should be able to use cat to append them one onto the other and
fully reconstruct the partition image.
--=20
Lamont Peterson <lamont@gurulabs.com>
Senior Instructor
Guru Labs <http://www.gurulabs.com/>

--=-ouSSBvfG79Q2TkGAvaDG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAWI0cRK8Q4zt1QRURAvEpAJ4sHqx7bJTWvvsQGpV7T1xvH4CHFgCgisGk
yNEbi4qlrrDEtt+Ke1miVYU=
=YTAY
-----END PGP SIGNATURE-----

--=-ouSSBvfG79Q2TkGAvaDG--

