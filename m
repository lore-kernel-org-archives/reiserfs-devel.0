From: Valdis.Kletnieks@vt.edu
Subject: Re: Reiser4 changes meaning of ENOENT/EACCES, breaking gcc?
Date: Fri, 30 Jul 2004 16:57:21 -0400
Message-ID: <200407302057.i6UKvLAu000714@turing-police.cc.vt.edu>
References: <41098E4C.9070007@kundert.ca>
            <410A9A1F.1090406@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1116623000P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19879-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 30 Jul 2004 11:57:35 PDT."
             <410A9A1F.1090406@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Perry Kundert <perry@kundert.ca>, reiserfs-list@namesys.com

--==_Exmh_-1116623000P
Content-Type: text/plain; charset=us-ascii

On Fri, 30 Jul 2004 11:57:35 PDT, Hans Reiser said:

> >    By the way, his suggested workaround was effective...
> 
> Can you talk the glibc guys into adopting it?  That would be best.

Somebody should also check the POSIX spec and see if it requires a
particular semantic there.

Also, pushing it off to the glibc people is quite possibly the wrong
way to go about it.  Do you *really* want to sit there and tell every
other app that turns up with a similar problem that they have to fix
it to run on one particular filesystem, when every OTHER filesystem
doesn't need help?  That doesn't sound like a good plan - if 4 or 5
apps turn up, it will turn people away "because stuff breaks if you
use reiser4"....


--==_Exmh_-1116623000P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBCrYxcC3lWbTT17ARAqWXAKCl4jbaL0Lp5vRu04srlZ0V0tVCzQCfSK65
1GjvFBDaPOTwunxUw41I81Y=
=dnRN
-----END PGP SIGNATURE-----

--==_Exmh_-1116623000P--
