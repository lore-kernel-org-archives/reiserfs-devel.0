From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Proposal for keying encrypted filesystem
Date: Sun, 6 Apr 2003 21:14:36 -0400
Message-ID: <200304062114.50082.phma@webjockey.net>
References: <200303282026.23543.phma@webjockey.net> <200304041901.52770.phma@webjockey.net> <200304070044.h370i41S019868@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_KENk+GntstogRTi";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13601-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304070044.h370i41S019868@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

--Boundary-02=_KENk+GntstogRTi
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Description: signed data
Content-Disposition: inline

On Sunday 06 April 2003 20:44, Valdis Kletnieks wrote:
> On Fri, 04 Apr 2003 19:01:52 EST, Pierre Abbat <phma@webjockey.net>  said:
> > tape monkey could get out his infinite typewriter and trash the backup.
>
> I'm not sure what you mean here - do you mean:
>
> a) Given sufficient ciphertext, an attack on the key and/or plaintext could
> be mounted?  Possibly a known-plaintext attack if you can get the system to
> cough up the crypted version of an inode that you know the contents of..
>
> b) The tape monkey can create a bad backup by injecting corrupted/wrong
> ciphertext which won't decrypt if it's reloaded to a disk.
>
> c) Something else I've not thought of?

The tape monkey might could overwrite an encrypted file on disk with random 
gibberish.

phma
-- 
.i toljundi do .ibabo mi'afra tu'a do
.ibabo damba do .ibabo do jinga
.icu'u la ma'atman.

--Boundary-02=_KENk+GntstogRTi
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+kNEJQswozZJXbWQRAopYAKDlLYmOTYhrAh1609oqhvg4lNDldACZAbxl
eejjdrxgTVJEqa1RZL9u2+U=
=rpFp
-----END PGP SIGNATURE-----

--Boundary-02=_KENk+GntstogRTi--
