From: Valdis.Kletnieks@vt.edu
Subject: Re: duplicate files and recent changes
Date: Thu, 06 Jun 2002 09:58:15 -0400
Message-ID: <200206061358.g56DwF0H001550@turing-police.cc.vt.edu>
References: <20020606094504.A851@namesys.com> <Pine.WNT.4.43.0206060328570.1296-100000@fanatic>
            <20020606132505.A2647@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-287434562P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10540-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: Your message of "Thu, 06 Jun 2002 13:25:05 +0400."
             <20020606132505.A2647@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: "S. Alexander Jacobson" <alex@shop.com>, reiserfs-list@namesys.com

--==_Exmh_-287434562P
Content-Type: text/plain; charset=us-ascii

On Thu, 06 Jun 2002 13:25:05 +0400, Oleg Drokin said:

> But MD5 may be identical for different files.

Only a 2**128 chance of that.  If you know a way to force a hash collision
more frequently than that, the crypto world wants to hear from you.. ;)

> Also this buys you nothing.
> You write file in chunks, once file is identical to other file,
> one of the files deleted. Looks like just more extra work (but some saved space
> of course).

A much more productive way to save space is file-system compression.  AIX
supports LZ-compressing each 4K block and then only saving as many 512 byte
fragments as actually needed.  It's a big win - /usr (even with all the binaries)
needs about 30% less space, and I've seen over 50% for file systems with
source trees in them...
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_-287434562P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE8/2p3cC3lWbTT17ARAni+AJ4kPg2JSQdhW8gzWP6paNRmKjtCDgCgnky7
NrdtQllUBemNvC3RbnxM3P0=
=rpCr
-----END PGP SIGNATURE-----

--==_Exmh_-287434562P--
