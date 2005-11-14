From: Craig Shelley <craig@microtron.org.uk>
Subject: Re: More Slowdown
Date: Mon, 14 Nov 2005 19:41:03 +0000
Message-ID: <1131997263.10816.56.camel@teratron.lan.etheus.net>
References: <200511111359.39715.jgilmore@glycou.com>
	 <b14e81f00511111907l3c159ff7rd2e0de5f9e6a0aa7@mail.gmail.com>
	 <43758E00.4000601@namesys.com>  <200511120906.39109.jgilmore@glycou.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-HTc83DY8XwPdOcfBFH4F"
Return-path: <reiserfs-list-return-26932-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511120906.39109.jgilmore@glycou.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-HTc83DY8XwPdOcfBFH4F
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2005-11-12 at 09:06 +0000, John Gilmore wrote:
> Oh, BTW. "The slowdown" as I called it is still there. I guess I spoke to=
=20
> soon. The specific symptom is that the effected process locks for a time,=
=20
> usually just a second or two, but sometimes a minute or two and and at le=
ast=20
> once for many many minutes. I think that the crash (soft lockup) that I=20
> reported earlier is related as well. And it sounds like the comment that=20
> rvalles had about lockups with mmaped files, except that it doesn't lock =
up=20
> permanently. Just for a second or three usually.
>=20

Hi,

I am sorry to say that I am having the same slowdown issue with Reiser4
and kernel 2.6.14.2. It seems that my problem is not related to the I/O
scheduler algorithm as I have tried both cfq and anticipatory.

The I/O activity seems to come in long bursts lasting up to 15 seconds,
and is unpredictable. The system almost grinds to a halt while the burst
of I/O is taking place, which can be quite annoying while typing.
There are no warnings in dmesg/syslog and the filesystem is clean.

Sometimes the burst of I/O activity occurs in a different form, with
short bursts every second, lasting about 10 seconds. Approx 30% duty
cycle. When a burst occurs in this form, it tends not to lock processes
as much.

The general sound of the drive when a burst is in progress is that of
heavy head movement, as if the drive is repeatedly seeking between two
or three locations.

Also, a thing which I noticed a while back, and may not be related in
any way to Reiser4.. When I re-size the columns in Evolution Mail, I get
continuous hard disk activity during the re-size. This hard disk
activity stops either when I release the mouse or hold it still with the
button down. Just wondering if anyone else gets the same thing.

Regards,
--=20
Craig Shelley
EMail: craig@microtron.org.uk
Jabber: shell@jabber.earth.li

--=-HTc83DY8XwPdOcfBFH4F
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDeOhP5OI9vmOoVqERAqfbAJ0f13L7OM8ZvoWEsnGVLdukXHYxuwCeK5Gp
jA2lWVg08+ZVEXCTdCVPaZM=
=1rR5
-----END PGP SIGNATURE-----

--=-HTc83DY8XwPdOcfBFH4F--

