From: Valdis.Kletnieks@vt.edu
Subject: Re: The situation at hand and in the future
Date: Fri, 28 May 2004 15:53:43 -0400
Message-ID: <200405281953.i4SJrhbG017334@turing-police.cc.vt.edu>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com>
            <20040528063324.GT4990@nysv.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-2014131533P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18895-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 28 May 2004 09:33:24 +0300."
             <20040528063324.GT4990@nysv.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Markus =?UNKNOWN?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: David Masover <ninja@slaphack.com>, reiserfs-list@namesys.com

--==_Exmh_-2014131533P
Content-Type: text/plain; charset=us-ascii

On Fri, 28 May 2004 09:33:24 +0300, Markus =?UNKNOWN?Q?T=F6rnqvist?= said:

> Persistent over boots? I'd like the passphrase and key to survive
> a boot...

No you don't.

If the passphrase and key are persistent, then an attacker can get your data.

Think about it - the only reason an attacker doesn't have access to your
data is because they don't have the passphrase/key.  If you leave them around,
you've given away the keys to the kingdom.

--==_Exmh_-2014131533P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAt5jHcC3lWbTT17ARAp+5AJ4oMEGPmBcE2gsI0s7amuqA7qyfVQCfWAxL
8dkKEPhrDePQCQ6uMYuugts=
=IWhe
-----END PGP SIGNATURE-----

--==_Exmh_-2014131533P--
