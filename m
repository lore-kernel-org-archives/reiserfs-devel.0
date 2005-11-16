From: Craig Shelley <craig@microtron.org.uk>
Subject: Re: More Slowdown
Date: Wed, 16 Nov 2005 09:33:04 +0000
Message-ID: <1132133584.7652.21.camel@teratron.lan.etheus.net>
References: <200511111359.39715.jgilmore@glycou.com>
	 <200511120906.39109.jgilmore@glycou.com>
	 <1131997263.10816.56.camel@teratron.lan.etheus.net>
	 <200511142147.07787.chrivers@iversen-net.dk>
	 <1132064829.8002.9.camel@teratron.lan.etheus.net>
	 <437A2310.7080508@free.fr>
	 <1132080143.8002.22.camel@teratron.lan.etheus.net>
	 <437AF653.9040001@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-TVQZsmFLdI8C1noG7GLn"
Return-path: <reiserfs-list-return-26958-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437AF653.9040001@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

--=-TVQZsmFLdI8C1noG7GLn
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-11-16 at 01:05 -0800, Hans Reiser wrote:
> Craig Shelley wrote:
>=20
> >On Tue, 2005-11-15 at 19:04 +0100, Laurent Riffard wrote:
> > =20
> >
> >>Please, could you do it again with the -T option for strace? It will
> >>show the time spent in system  calls.
> >>
> >>   =20
> >>
> >craig@teratron.lan.etheus.net:~$ strace -T -p 8002 2>&1 | grep fsync
> >fsync(26)                               =3D 0 <0.566159>
> >fsync(26)                               =3D 0 <0.159852>
> >fsync(26)                               =3D 0 <0.179659>
> >fsync(26)                               =3D 0 <0.153406>
> >fsync(26)                               =3D 0 <0.136685>
> >fsync(26)                               =3D 0 <0.171057>
> >fsync(26)                               =3D 0 <0.165733>
> >fsync(26)                               =3D 0 <0.178846>
> >fsync(26)                               =3D 0 <0.186595>
> >fsync(26)                               =3D 0 <0.184368>
> >fsync(26)                               =3D 0 <0.177273>
> >fsync(26)                               =3D 0 <0.178634>
> >fsync(26)                               =3D 0 <0.181036>
> >fsync(26)                               =3D 0 <0.178750>
> >fsync(26)                               =3D 0 <0.324480>
> >fsync(26)                               =3D 0 <0.177226>
> >fsync(26)                               =3D 0 <0.184625>
> >fsync(26)                               =3D 0 <0.186224>
> >fsync(26)                               =3D 0 <0.177282>
> >fsync(26)                               =3D 0 <0.177146>
> >fsync(26)                               =3D 0 <0.176000>
> >fsync(26)                               =3D 0 <0.192434>
> >fsync(26)                               =3D 0 <0.177482>
> >fsync(26)                               =3D 0 <0.183357>
> >fsync(26)                               =3D 0 <0.176528>
> >fsync(26)                               =3D 0 <0.184334>
> >fsync(26)                               =3D 0 <0.176622>
> >fsync(26)                               =3D 0 <0.177977>
> >fsync(26)                               =3D 0 <0.178636>
> >fsync(26)                               =3D 0 <0.259863>
> >fsync(26)                               =3D 0 <0.172789>
> >fsync(26)                               =3D 0 <0.171739>
> >fsync(26)                               =3D 0 <0.179641>
> >fsync(26)                               =3D 0 <0.178157>
> >fsync(26)                               =3D 0 <0.180272>
> >fsync(26)                               =3D 0 <0.170426>
> >fsync(26)                               =3D 0 <0.187630>
> >fsync(26)                               =3D 0 <0.171589>
> >fsync(26)                               =3D 0 <0.178135>
> >
> >
> >I seem to be finding that the performance of the system degrades with
> >time and file system usage.
> >Openoffice really starts to run slow after a while. Just as an
> >experiment, I did=20
> >ls -R /usr
> >The directory listing appeared very quickly with hardly any hard disk
> >access. Then shortly later when switching back to Openoffice, the
> >process froze for about 3 minutes with continuous hard disk access.
> >
> >One thing which may be relevant is that my kernel is patched with
> >Suspend2 and FBsplash, although I can't remember having any problems
> >like this before.
> >
> >Many Thanks,
> >
> > =20
> >
> could you define what the numbers mean (what units, what is measured)?

I believe the value inside < > is the time spent in the system call in
seconds. In the above list, evolution seemed to be calling fsync() as
fast as it could. Although the fd remains at 26 in this case, it closes
and re-opens the file between calls to fsync().
I seem to notice that the length of time spent in the fsync() calls
depends to some degree on how much hard disk activity there has been
since the last call. The strange thing is this seems to apply to reading
also, so performing an ls -R /, and stopping it after a few seconds.
Shortly later, some process will block for tens of seconds when it next
calls fsync().

--=20
Craig Shelley
EMail: craig@microtron.org.uk
Jabber: shell@jabber.earth.li

--=-TVQZsmFLdI8C1noG7GLn
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDevzQ5OI9vmOoVqERAqXrAKDB1q8LFyV0mKiMgEmxxwMN4CnppQCg6lsR
97p7LMIXnJVtkr5ywtSl4KA=
=kBO0
-----END PGP SIGNATURE-----

--=-TVQZsmFLdI8C1noG7GLn--

