From: Valdis.Kletnieks@vt.edu
Subject: Re: "minimum 20 character" length
Date: Mon, 23 Aug 2004 22:22:34 -0400
Message-ID: <200408240222.i7O2MYxX021726@turing-police.cc.vt.edu>
References: <200408240207.i7O27kf29812@mail023.syd.optusnet.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1307560000P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20467-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 24 Aug 2004 12:07:46 +1000."
             <200408240207.i7O27kf29812@mail023.syd.optusnet.com.au> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: shakim <shakim@optusnet.com.au>
Cc: reiserfs-list@namesys.com

--==_Exmh_1307560000P
Content-Type: text/plain; charset=us-ascii

On Tue, 24 Aug 2004 12:07:46 +1000, shakim said:
> Is there a method of ignoring or reducing the
> "minimum 20 character" length when encrypting a
> new partition. ? I'm using Suse 9.1 and didn't
> have this problem using 9.0. I bet my house my
> 12character password will never get cracked

Not really a reiserfs issue, but a mount/losetup issue.

If it *really* bothers you, get the source for util-linux, and go poking around
the source for losetup and find the '20' and change it to '12'. ;)

Note that a 12-char password *is* probably fairly trivially brute-forceable, as
there's *lots* of blocks on a filesystem that are fairly predictable in format,
so it's effectively a "known plaintext" attack.  For a 12-char password, you'll
need around 3.5-4 bits of entropy per character to get even the equivalent of
40-bit crypto (which is generally considered laughable).  Standard English has
about 2.1 bits/char of entropy - which is where that 20 came from: trying to
make sure that there's some *minimum* level of security in the passphrase.

Or you could just tack 8 blanks on the end of your password. ;)
  



--==_Exmh_1307560000P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBKqZqcC3lWbTT17ARAoS2AJ43o4xvB1gtavYXmimj1QjHucLIeQCffN71
ySD8RL+stEBxwc0CEBmXwyw=
=cVgV
-----END PGP SIGNATURE-----

--==_Exmh_1307560000P--
