From: Valdis.Kletnieks@vt.edu
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Wed, 21 Aug 2002 13:33:35 -0400
Message-ID: <200208211733.g7LHXZs0016127@turing-police.cc.vt.edu>
References: <m3k7mpreij.fsf@merlin.emma.line.org> <3D5E9D69.1030109@namesys.com> <20020819092023.B1815@namesys.com> <3D60AF63.6040809@namesys.com> <20020819124649.A2585@namesys.com> <3D60B6E2.7050006@namesys.com> <20020819132252.A4346@namesys.com> <3D60C35E.7000903@namesys.com> <20020819142035.A5741@namesys.com> <1029875053.12387.521.camel@tiny> <20020821100452.A10765@namesys.com> <3D636C80.4030605@namesys.com> <3D63BD2D.1070602@web.de>
            <3D63CA89.3050002@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_95562315P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11274-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Wed, 21 Aug 2002 21:14:49 +0400."
             <3D63CA89.3050002@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: degerrit@web.de, reiserfs-list@namesys.com, vitaly@thebsh.namesys.com

--==_Exmh_95562315P
Content-Type: text/plain; charset=us-ascii

On Wed, 21 Aug 2002 21:14:49 +0400, Hans Reiser said:

> > Why not just run 'badblocks' (or the failure mechanism which now 
> > aborts with "bread: Cannot read a block") as an (optional) part of 
> > fsck and use the output in a bad-block-marking phase? 
> 
> This is good UI design.  Vitaly....

Certainly make it optional (or optionally disabled) - having to read 300G of
data blocks when you know that the media is good would be massive overkill,
when you're rebooting after a panic for other reasons. ;)
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_95562315P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9Y87vcC3lWbTT17ARAozVAJ9UMYgCHEEMxVNVP9jbjxF1s2LoiQCgmNcp
jvOQIR84khpv7+GUHUJUvqw=
=6g8w
-----END PGP SIGNATURE-----

--==_Exmh_95562315P--
