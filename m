From: Valdis.Kletnieks@vt.edu
Subject: Re: file as a directory
Date: Tue, 10 May 2005 11:14:42 -0400
Message-ID: <200505101514.j4AFEhGO010837@turing-police.cc.vt.edu>
References: <2c59f00304112205546349e88e@mail.gmail.com> <41A1FFFC.70507@hist.no> <41A21EAA.2090603@dbservice.com> <41A23496.505@namesys.com> <1101287762.1267.41.camel@pear.st-and.ac.uk>
            <1115717961.3711.56.camel@grape.st-and.ac.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1115738064_8169P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24018-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 10 May 2005 10:39:23 BST."
             <1115717961.3711.56.camel@grape.st-and.ac.uk> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Cc: Hans Reiser <reiser@namesys.com>, sean.mcgrath@propylon.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

--==_Exmh_1115738064_8169P
Content-Type: text/plain; charset=us-ascii

On Tue, 10 May 2005 10:39:23 BST, Peter Foldiak said:
> Back in November 2004, I suggested on the linux-kernel and reiserfs
> lists that the Reiser4 architecture could allow us to abolish the
> unnatural naming distinction between directories/files/parts-of-file
> (i.e. to unify naming within-file-system and within-file naming) in an
> efficient way.
> I suggested that one way of doing that would be to extend XPath-like
> selection syntax above the (XML) file level.

I believe the consensus was that this needs to happen at the VFS layer, not
the FS level.  The next step would be designing an API for this - what would
the VFS present to userspace, and in what way, and how would backward
combatability be maintained?

--==_Exmh_1115738064_8169P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCgM/NcC3lWbTT17ARAh13AJ0YB5RGx5tqCgOpucKRQ1Pz3e0P8gCgypAJ
KaJMBdl6h+wiBadvbyZw4tM=
=F4G5
-----END PGP SIGNATURE-----

--==_Exmh_1115738064_8169P--
