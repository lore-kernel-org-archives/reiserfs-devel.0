From: Valdis.Kletnieks@vt.edu
Subject: Re: preexisting 'metas'?
Date: Sun, 13 Jun 2004 20:33:44 -0400
Message-ID: <200406140033.i5E0XiR2002772@turing-police.cc.vt.edu>
References: <40CBB63E.4060001@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_360419072P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19169-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sat, 12 Jun 2004 21:04:46 CDT."
             <40CBB63E.4060001@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_360419072P
Content-Type: text/plain; charset=us-ascii

On Sat, 12 Jun 2004 21:04:46 CDT, David Masover <ninja@slaphack.com>  said:

> Well, the '...' in my brother's home dir had some stuff that he'd like
> to keep secret -- as in, he doesn't want people to know he has them.

Just as an aside, note that calling the directory '...' will only slow down a
clueless person.  Consider that 'du' and 'ls -a' and 'ls -A' will all show them
- as will 'find' and any number of other utilities...

The "first character is a dot so don't list it" convention is there for
usability, not security.  My home directory has 179 .whatever files in it at
the moment - a lot more than non-dot files, in fact.  So the output of 'ls' is
shorter.  It won't work as security unless the people you're trying to hide it
from are so lacking in Unixoid clue that they don't know they have a .profile....

And if he wants to keep it secret, he should be using at *least* enough things
to keep people *that* unclued out.  If they're unclued enough to not be able to
find a . file, how did they get *in*??/

If you want actual *security*, you need to be using something that does actual
crypto.  Jari Ruuso's 'loop-aes' package (on sourceforge) is one example of the
class of software you *want* to be using.



--==_Exmh_360419072P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAzPJocC3lWbTT17ARAro2AKCtHpTS0ryIavgwhn4S6DKaGNrteACfS2dt
U8/JOmIJqN/uF3c+Ln5LcVc=
=Gfh+
-----END PGP SIGNATURE-----

--==_Exmh_360419072P--
