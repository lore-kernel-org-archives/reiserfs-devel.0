From: Alex Malinovich <demonbane@the-love-shack.net>
Subject: reiserfsck "block is in the tree already" error
Date: 21 Mar 2003 11:05:15 -0600
Message-ID: <1048266314.8146.18.camel@Thief>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-+NBJTtLz2H5q3tnDLAsB"
Return-path: <reiserfs-list-return-13322-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-+NBJTtLz2H5q3tnDLAsB
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I've been trying to rebuild the tree on a reiserfs partition that seems
to have gotten corrupted during a resize operation. Unfortunately, I've
gone from having one or two directories not accessible to having the
whole partition not accessible now. Everything seems to go ok until pass
2. At this point I start getting this error:

"do_pass_2: The block (4901823) is in the tree already. Should not
happen."

This keeps coming up as fast as the terminal will display it. It seems
to be an endless loop as leaving it on for 4 hours resulted in an
essentially infinite number of error messages with no corresponding disk
activity. I'm running reiserfsck with the following command line:

reiserfsck -z -S --rebuild-sb --rebuild-tree /dev/hda3

I'm pretty sure that -z and --rebuild-sb are more or less unnecessary,
but I'm trying to be thorough. Running just

reiserfsck --rebuild-tree /dev/hda3

results in a similar error message. I don't remember the exact wording
of it, but it is along the lines of, "marked as a leaf but is not a
leaf".

Any suggestions are very welcome. I'd certainly hate to lose all of this
data.

p.s. My system is Debian GNU/Linux Unstable, running a 2.4.20 kernel.

--=20
Alex Malinovich
Support Free Software, delete your Windows partition TODAY!
Encrypted mail preferred. You can get my public key from any of the
pgp.net keyservers. Key ID: A6D24837

--=-+NBJTtLz2H5q3tnDLAsB
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+e0ZKBPYwh6bSSDcRAurOAJ9SCKP7jEa8pAJyS5PL6+Nwv6pBAACeMIXn
gQMe2phZl6Wlc6ZI3FNfrHY=
=vexF
-----END PGP SIGNATURE-----

--=-+NBJTtLz2H5q3tnDLAsB--

