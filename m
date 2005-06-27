From: Valdis.Kletnieks@vt.edu
Subject: Re: reiser4 plugins
Date: Mon, 27 Jun 2005 01:41:29 -0400
Message-ID: <200506270541.j5R5fULX007282@turing-police.cc.vt.edu>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl> <42BCD93B.7030608@slaphack.com> <200506251420.j5PEKce4006891@turing-police.cc.vt.edu> <42BDA377.6070303@slaphack.com> <200506252031.j5PKVb4Y004482@turing-police.cc.vt.edu> <42BDC422.6020401@namesys.com> <42BE3645.4070806@cisco.com> <e692861c05062522071fe380a5@mail.gmail.com> <42BE563D.4000402@cisco.com> <42BE5DB6.8040103@slaphack.com> <200506261816.j5QIGMdI010142@turing-police.cc.vt.edu> <42BF08CF.2020703@slaphack.com> <200506262105.j5QL5kdR018609@turing-police.cc.vt.edu> <42BF2DC4.8030901@slaphack.com> <200506270040.j5R0eUNA030632@turing-police.cc.vt.edu> <42BF667C.50606@slaphack.com> <200506270423.j5R4Np9n004510@turing-police.cc.vt.edu>
            <42BF8F42.7030308@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1119850889_3633P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24658-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 27 Jun 2005 00:31:46 CDT."
             <42BF8F42.7030308@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

--==_Exmh_1119850889_3633P
Content-Type: text/plain; charset=us-ascii

On Mon, 27 Jun 2005 00:31:46 CDT, David Masover said:

> *If* we decide that this must go both ways, *then* we either turn off
> write support inside the zipfile

Oh, *that* will do wonders for command symmetry.  And you just shot down
the whole 'mv foo bar' being equivalent to 'zip bar foo' concept. ;)

>                                  and do "make" with a symlink farm (cp
> - -as isn't hard), or (better) we can set things up so that only on access
> (most likely a read) of the original zipfile do we re-add all the changes.

Those chuckleheads who have filled up a disk by saying 'tar cvf foo.tar .' just
got a whole new way to fill the disk... ;)

--==_Exmh_1119850889_3633P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCv5GIcC3lWbTT17ARAhMqAKD87+f5vw21YvQ9EFpW2JpWQYdoRQCg9mMm
eRHe1OQqND9xzThpHF0NrWA=
=sllL
-----END PGP SIGNATURE-----

--==_Exmh_1119850889_3633P--
