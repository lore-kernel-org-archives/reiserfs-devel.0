From: Valdis.Kletnieks@vt.edu
Subject: Re: The situation at hand and in the future
Date: Mon, 31 May 2004 14:27:39 -0400
Message-ID: <200405311827.i4VIRdlS001316@turing-police.cc.vt.edu>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org> <40B89C9C.5050307@slaphack.com> <873c5j0zm3.fsf@uhoreg.ca>
            <40B91A65.2060302@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1303053966P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18935-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sat, 29 May 2004 18:19:01 CDT."
             <40B91A65.2060302@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Hubert Chan <hubert@uhoreg.ca>, reiserfs-list@namesys.com

--==_Exmh_1303053966P
Content-Type: text/plain; charset=us-ascii

On Sat, 29 May 2004 18:19:01 CDT, David Masover said:

> Files are not encrypted by default, so encrypted files should allow a
> passphrase to be checked by default.  In balancing security and
> convenience, make convenience the default.

Note that if 98% of the files on a file system are plaintext, then
somebody can infer quite a bit merely by knowing what 2% are
in fact encrypted.  If they're all encrypted, an attacker can't
leverage that knowledge.



--==_Exmh_1303053966P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAu3kbcC3lWbTT17ARAqUSAKCwOl8FXzr+cAJ56s+WSgJagq69xwCeL/1p
90RNaBBBCsOJ2jrQciUN/Rc=
=ge/p
-----END PGP SIGNATURE-----

--==_Exmh_1303053966P--
