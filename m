From: Valdis.Kletnieks@vt.edu
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas thread)
Date: Tue, 13 Apr 2004 16:31:52 -0400
Message-ID: <200404132031.i3DKVqRg009355@turing-police.cc.vt.edu>
References: <407AB9AE.3060801@pobox.com> <407ADCBF.8000609@namesys.com> <407AEA05.50004@pobox.com> <407BFBEA.5010006@pobox.com> <407C15D9.1080705@namesys.com> <407C1BE9.8010509@pobox.com> <407C279A.3060303@namesys.com> <407C3004.3070401@pobox.com> <407C316B.80606@namesys.com>
            <407C35B0.3080109@pobox.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_541381248P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17907-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 13 Apr 2004 13:47:12 CDT."
             <407C35B0.3080109@pobox.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: "John D. Heintz" <jheintz@pobox.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

--==_Exmh_541381248P
Content-Type: text/plain; charset=us-ascii

On Tue, 13 Apr 2004 13:47:12 CDT, "John D. Heintz" said:
> foo/nsa:permissions -> foo/nsa.gov/secure-linux/permissions
> 
> This assumes a mapping from "nsa" -> "nsa.gov/security/".
> 
> The characters up to the ':' would be looked up in a namespaces map, and 
> if found the substituion would occur before further name-> object 
> resolution. I don't think this breaks the goals set out in the "Future 
> Vision" white paper, but I guess that is exactly what I am asking you ;-)

This needs to be done *very* carefully, as all sorts of ugliness can result
from a user being able to muck about with the mappings.

Anybody who's ever used a VMS system and fiddled with the values of the
various SYS$WHATEVER values knows what I mean - and yes, there were
security holes caused by software that made the rash assumption that the
SYS$FOO variables weren't altered by the user.....


--==_Exmh_541381248P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAfE44cC3lWbTT17ARAtonAJ9+Z52VZXGWfsTZDh33i/XeWo0OnACffkIl
eRE2yxlEFsdvjB65/P5JpgA=
=lZ5c
-----END PGP SIGNATURE-----

--==_Exmh_541381248P--
