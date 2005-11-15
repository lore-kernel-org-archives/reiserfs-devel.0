From: Craig Shelley <craig@microtron.org.uk>
Subject: Re: More Slowdown
Date: Tue, 15 Nov 2005 14:27:09 +0000
Message-ID: <1132064829.8002.9.camel@teratron.lan.etheus.net>
References: <200511111359.39715.jgilmore@glycou.com>
	 <200511120906.39109.jgilmore@glycou.com>
	 <1131997263.10816.56.camel@teratron.lan.etheus.net>
	 <200511142147.07787.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-JC1pyGE/BAhZVSkrWCaC"
Return-path: <reiserfs-list-return-26943-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511142147.07787.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-JC1pyGE/BAhZVSkrWCaC
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2005-11-14 at 21:47 +0100, Christian Iversen wrote:
> That's _serisouly_ odd. I've seen something like this happen before, when=
 X=20
> programs generated some (non-harmful) X warnings. These were then written=
=20
> into a log file, typically .xsession-errors or similar. Any chance that's=
=20
> what you are seeing?
>=20

This explains the problem with Evolution, it looks a bit trigger happy
with the fsync call while resizing columns.
craig@teratron.lan.etheus.net:~$ strace -p 8002 2>&1 | grep fsync
fsync(37)                               =3D 0
fsync(37)                               =3D 0
fsync(37)                               =3D 0
fsync(37)                               =3D 0
fsync(37)                               =3D 0
fsync(37)                               =3D 0
fsync(37)                               =3D 0
fsync(37)                               =3D 0
fsync(37)                               =3D 0
fsync(37)                               =3D 0
fsync(37)                               =3D 0
fsync(37)                               =3D 0
fsync(37)                               =3D 0
fsync(37)                               =3D 0
fsync(37)                               =3D 0
fsync(37)                               =3D 0
fsync(37)                               =3D 0

while true; do lsof  -p 8002 2>&1 | grep 37w ; done
evolution 8002 craig   37w   REG        3,4     417
1901436 /mnt/storage/craig-home/.evolution/mail/views/.#custom_view-mbox:_h=
ome_craig_.evolution_mail_local#Lists_Reiser4.xmlwhile=20

The file listed above seems to get moved, but is only a few hundred
bytes.

ls -lh /mnt/storage/craig-home/.evolution/mail/views/custom_view-mbox
\:_home_craig_.evolution_mail_local#Lists_Reiser4.xml
-rw-------  1 craig craig 417 2005-11-15
14:19 /mnt/storage/craig-home/.evolution/mail/views/custom_view-mbox:_home_=
craig_.evolution_mail_local#Lists_Reiser4.xml

Why does calling fsync on this one small file cause so much hard disk
activity?


--=20
Craig Shelley
EMail: craig@microtron.org.uk
Jabber: shell@jabber.earth.li

--=-JC1pyGE/BAhZVSkrWCaC
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDefA95OI9vmOoVqERAmw/AJ4m9flKnu5rlnku/N8WjJwtD0qwWwCg9Enc
U6CoxyoIvKCpXKfxqwxwNtU=
=Eb57
-----END PGP SIGNATURE-----

--=-JC1pyGE/BAhZVSkrWCaC--

