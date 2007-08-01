From: Zan Lynx <zlynx@acm.org>
Subject: 2.6.23-rc1-mm2 Invalid argument on some files, depends on file
	contents?
Date: Wed, 01 Aug 2007 15:57:01 -0600
Message-ID: <1186005421.9066.9.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-QYHFUZTKOA+DKdoivn/q"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>


--=-QYHFUZTKOA+DKdoivn/q
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Several of my files have been doing this.  I really noticed it when I
ran a backup last night and there were many of these errors.  It has
also started affecting documents I really care about.

I was wondering if I somehow have compression enabled.  I didn't do it
on purpose! :)

I remember reading some comment about lzo being messed up and the
patches not included in mm yet?  This is rc1-mm2 so I thought it might
be fixed, but I guess not.

Here is a snippet of a shell session showing the problem.  It's a good
thing it didn't affect the OpenOffice format original!

$ cat * >/dev/null
cat: URL Database Design.doc.backup: Invalid argument
$ cp URL\ Database\ Design.doc.backup{,.test}
$ cat * >/dev/null
cat: URL Database Design.doc.backup: Invalid argument
cat: URL Database Design.doc.backup.test: Invalid argument
$ echo blah >> URL\ Database\ Design.doc.backup.test=20
$ cat * >/dev/null
cat: URL Database Design.doc.backup: Invalid argument
$ ls -l
-rw-r--r-- 1 lynx users 286720 2007-07-31 18:16 URL Database Design.doc.bac=
kup
-rw-r--r-- 1 lynx users 286725 2007-08-01 15:48 URL Database Design.doc.bac=
kup.test
-rw-r--r-- 1 lynx users 154915 2007-07-31 16:53 URL Database Design.odt
-rw-r--r-- 1 lynx users 154915 2007-07-31 18:16 URL Database Design.odt.bac=
kup

As you can see, a copy shows the same problem.  But adding "blah\n" to
the end makes the problem go away...
--=20
Zan Lynx <zlynx@acm.org>

--=-QYHFUZTKOA+DKdoivn/q
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.5 (GNU/Linux)

iD8DBQBGsQGtG8fHaOLTWwgRAihUAJ9zxpMnF3oixefHAKcJfF1zpZKERACfU1zS
6oEV8QjTvX35wBw/OT0j+2g=
=cGJF
-----END PGP SIGNATURE-----

--=-QYHFUZTKOA+DKdoivn/q--

