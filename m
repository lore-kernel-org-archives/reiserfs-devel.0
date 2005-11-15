From: Craig Shelley <craig@microtron.org.uk>
Subject: Re: More Slowdown
Date: Tue, 15 Nov 2005 23:44:29 +0000
Message-ID: <1132098269.7652.6.camel@teratron.lan.etheus.net>
References: <1132093347.6347.7.camel@bauerbob.hirsch.lan>
	 <437A674E.2060407@ursynow.2a.pl>
	 <8e021e1b0511151509k3e77cdd9qaec7698a2fa00e48@mail.gmail.com>
	 <3aa654a40511151513y2285b55aj2d749551a67492a2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-qvqMZeyp56Ol5RQaBPPl"
Return-path: <reiserfs-list-return-26954-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3aa654a40511151513y2285b55aj2d749551a67492a2@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-qvqMZeyp56Ol5RQaBPPl
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2005-11-15 at 15:13 -0800, Avuton Olrich wrote:
> It's funny that you mention vim. vim seems to be what _really_ makes
> my reiser4 do the 'slowdown'. I call it harddrive thrashing cause
> that's what my wife calls it when she hears it from 5 yards away :)
> Right before saving or saving/exiting it really does this thrashing,
> Thank god you said this because I didn't think this 'slowdown' was the
> same thing I was experiencing.

This looks to be a similar thing with fsync(). It took approx 10 sec to
save a file containing the string "Hello World"=20
The results indicate that the time was spent in the fsync() call.

craig@teratron.lan.etheus.net:~$ ps aux | grep vim
craig     9111  0.0  0.5 17268 5936 pts/0    S+   23:35   0:00 vim
temp/testfile

craig@teratron.lan.etheus.net:~$ strace -T -p 9111 2>&1 | grep fsync
fsync(4)                                =3D 0 <9.726565>


--=20
Craig Shelley
EMail: craig@microtron.org.uk
Jabber: shell@jabber.earth.li

--=-qvqMZeyp56Ol5RQaBPPl
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDenLd5OI9vmOoVqERAogKAJ4wZw0L8aRkz+efuKjrUbJksXTasQCg6s8e
CNnJKcPWxECr+3SEmSICR4M=
=BWub
-----END PGP SIGNATURE-----

--=-qvqMZeyp56Ol5RQaBPPl--

