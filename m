From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Remount bug (?) in 2.6.21-rc4-mm1
Date: Mon, 26 Mar 2007 13:13:57 -0600
Message-ID: <1174936437.379050.5.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ZUL3BbelTENL61tLSpPK"
Return-path: <reiserfs-list-return-30617-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mail-list <Reiserfs-List@namesys.com>

--=-ZUL3BbelTENL61tLSpPK
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This is a very odd problem:

First, I did fsck the Reiser4 partition, there were no errors found.

The machine:
A Compaq R3000 laptop running 64-bit Gentoo.

Here's the problem:
I boot 2.6.21-rc4-mm1 into Gentoo single user mode.
I cat /etc/ld.so.preload.
It should contain /usr/local/lib64/libnosync.so
Instead it contains an equal number of zeros.
Weird, I say.

I copy a backup file into place, or mv one, it does not matter.
Reboot.
Boot single user, /etc/ld.so.preload is empty AGAIN.

So I add custom debugging to my init scripts.  The file is safe all
through shutdown and remount read-only seems OK.

On boot, the file seems OK, UNTIL the initscripts remount the file
system.

This does NOT happen on 2.6.20.

I could try to learn how to git bisect I guess.  Or maybe someone here
knows the problem already?

Thanks.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-ZUL3BbelTENL61tLSpPK
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.3 (GNU/Linux)

iD8DBQBGCBt1G8fHaOLTWwgRAmp2AJkBQib7m8ydPh6IiAvS5N3vzHJErwCfUvlg
CgYg+Y7CyfXnv8712EJB7BE=
=t6Ew
-----END PGP SIGNATURE-----

--=-ZUL3BbelTENL61tLSpPK--

