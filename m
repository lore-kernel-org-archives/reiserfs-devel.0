From: Valdis.Kletnieks@vt.edu
Subject: Re: Plugin for corruption resistance?
Date: Thu, 17 Feb 2005 23:28:09 -0500
Message-ID: <200502180428.j1I4S92I019716@turing-police.cc.vt.edu>
References: <e692861c05021110583585f84e@mail.gmail.com> <loom.20050215T213823-62@post.gmane.org> <42141928.7080608@slaphack.com> <200502171153.43403.chrivers@iversen-net.dk>
            <4215644C.4000602@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1108700888_3974P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 17 Feb 2005 21:43:08 CST."
             <4215644C.4000602@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Christian Iversen <chrivers@iversen-net.dk>, reiserfs-list@namesys.com

--==_Exmh_1108700888_3974P
Content-Type: text/plain; charset=us-ascii

On Thu, 17 Feb 2005 21:43:08 CST, David Masover said:

> This way is easier, though.  But I was thinking about accessing the
> file.  I don't know of any hashes that can be easily updated from part
> of the file, unless you're hashing only pieces of the file in the first
> place, but it'd be nice to not bother hashing at all until the hash is
> needed, especially if we are hashing the whole file.

There's plenty of CRC functions that are quite easily set up for an
incremental update (see RFCs 1141 and 1624 on how to do it for the CRC function
used for Internet IP packets).  You'd of course not want to use that CRC-16,
but the same basic principle applies to other CRC functions.

The problem is that most CRC functions aren't very much good at detecting
multi-bit errors, and when you're talking about hundreds of gigabytes of
disk on a modern RAID, the CRC functions are hardly bulletproof.

On the flip side, hash functions like MD5 or the SHA family are fairly bulletproof,
but are essentially impossible to develop an incremental update for (if there
existed a fast incremental update for the hash function, that would imply a
very low preimage resistance, rendering it useless as a cryptographic hash).

Also, there's another issue - unlike standard ECC codes that can actually *fix*
the problem (for at least small number of bit errors), it's unclear what you should
do if you find a mismatch between the hash of a block and the block contents, as
you don't know whether it's the actual data or the hash that's corrupted....


--==_Exmh_1108700888_3974P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCFW7YcC3lWbTT17ARAiEIAKCQGhYX8aZNcQJU56yKzVeBa6jH1ACfZpw0
DmSwHCqxOyhD9zGGm9xMuAc=
=BXbt
-----END PGP SIGNATURE-----

--==_Exmh_1108700888_3974P--
