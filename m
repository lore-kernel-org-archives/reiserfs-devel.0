From: Valdis.Kletnieks@vt.edu
Subject: Re: Proposal for keying encrypted filesystem
Date: Mon, 07 Apr 2003 00:52:46 -0400
Message-ID: <200304070452.h374qlYJ002875@turing-police.cc.vt.edu>
References: <200303282026.23543.phma@webjockey.net> <200304041901.52770.phma@webjockey.net> <200304070044.h370i41S019868@turing-police.cc.vt.edu>
            <200304062114.50082.phma@webjockey.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1790336984P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13603-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sun, 06 Apr 2003 21:14:36 EDT."
             <200304062114.50082.phma@webjockey.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

--==_Exmh_1790336984P
Content-Type: text/plain; charset=us-ascii

On Sun, 06 Apr 2003 21:14:36 EDT, Pierre Abbat <phma@webjockey.net>  said:

> The tape monkey might could overwrite an encrypted file on disk with random 
> gibberish.

The problem we started discussing was that a backup system needs *read*
access to something isomorphic(*) to your data in order to back it up, but
you may not trust your tape monkey, backup software, or a myriad other things.

(*) The trick here is that we don't *actually* have to back up the data,
we need to back up something that will be a copy of the data once restored.
Properly done, the ciphertext of the data fulfills this requirement.

If your tape monkey has *write* access to the files, you're in trouble whether
or not it's encrypted.  Even in this case, encryption helps - if the tape
monkey manages to re-write a block with random gibberish, it will almost
certainly be noticed fairly quickly (Oracle complaining about corrupted
databases, a sudden 4K block of noise in the middle of a document, etc).
The tape monkey will almost certainly be blocked from doing something
subtle (like changing one block on an Oracle database so his salary goes
up 30%).


--==_Exmh_1790336984P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+kQQecC3lWbTT17ARAh2xAJ9jEBE+p6++Lrf7vueSVP2m0TVPzACfWErG
2Nfe7RIBfaabn48i0QksqLE=
=LoSq
-----END PGP SIGNATURE-----

--==_Exmh_1790336984P--
