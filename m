From: Valdis.Kletnieks@vt.edu
Subject: Re: The situation at hand and in the future
Date: Thu, 27 May 2004 17:05:21 -0400
Message-ID: <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu>
References: <20040527200127.GS4990@nysv.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1798637798P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18879-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 27 May 2004 23:01:27 +0300."
             <20040527200127.GS4990@nysv.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Markus =?UNKNOWN?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

--==_Exmh_-1798637798P
Content-Type: text/plain; charset=us-ascii

On Thu, 27 May 2004 23:01:27 +0300, mjt@nysv.org (Markus =?UNKNOWN?Q?T=F6rnqvist?=)  said:

> So, the Reiser4 API is good for providing passphrases for encrypted files
> and directories, right? Because using echo to unlock them from the file
> system is hazardous?
> 
> Why not add user-space programs which basically do what echo does, but
> with the terminal echo turned off? They would probably size at around
> 0k and would use the pseudo file API.
> 
> Maybe this would be a use case:
> 1. Joe wants to encrypt the files he l33ch3d from kazaa at work.
> 2. Joe chdirs to the pseudo directory under ~/Work/Warez/
> 3. Joe says echo 3DES\0 > plugin/crypto
> 4. Now the directory knows it must be 3DES-encrypted, but it needs
>    a passphrase.
> 5. Joe says echo TOPSECRETPASSWORD\0 > plugin/cryptokey

Remember that English has an entropy of only 2.5 bits/byte or so - as a result,
you *REALLY*, *REALLY* want to use a program that reads a much longer
passphrase and computes a hash to use as the actual key.

See Jari Russu's patch to util-linux 2.12 in the loop-AES package
(http://loop-aes.sourceforge.net) for an example if what I mean - it includes
patches to "mount" and "losetup" to do all the passphrase/key handling.

--==_Exmh_-1798637798P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAtlgRcC3lWbTT17ARAnKxAJ9yDXrJmRU/IKN9vA2TQB2JE76towCfRKyT
wZmpDgn/tfVdMt0NVqz5kJ0=
=EqeS
-----END PGP SIGNATURE-----

--==_Exmh_-1798637798P--
