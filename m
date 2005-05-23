From: Valdis.Kletnieks@vt.edu
Subject: Re: Reiser4 O_DIRECT
Date: Sun, 22 May 2005 21:04:15 -0400
Message-ID: <200505230104.j4N14GRH025653@turing-police.cc.vt.edu>
References: <1116525192.29446.5.camel@zion> <1116578526.3532.463.camel@tribesman.namesys.com> <1695540869.20050521234900@wp.pl> <200505222247.j4MMlr85008867@turing-police.cc.vt.edu>
            <4291225B.5090503@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1116810255_3542P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24113-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sun, 22 May 2005 19:22:51 CDT."
             <4291225B.5090503@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Pysiak Satriani <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

--==_Exmh_1116810255_3542P
Content-Type: text/plain; charset=us-ascii

On Sun, 22 May 2005 19:22:51 CDT, David Masover said:

> This is exactly why it should be in the kernel once the developers can't
> find any more bugs.  Marked as experimental, mainly, but in the kernel
> where real users can throw cobol/Java/sql bastardizations at it and
> break it.

Oh, I agree there - it's at a point where it *should* be in a -mm kernel,
or a -linus wrapped with a Kconfig 'depends on EXPERIMENTAL'. (I'll let
Andrew and Linus make *THAT* decision ;)

I'm just worried about PHB managers lurking on the list and reading "so stable
even the *developers* can't break it" as "it's *really* good and solid" rather
than "we need *other* people to break all the stuff we forgot to break" ;)


--==_Exmh_1116810255_3542P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCkSwPcC3lWbTT17ARAq3RAJ4msvN9UgK9pZdOyou68bxdGzLsgQCgjGDg
zCczZUxKzdQLL/I9mO9M+Kg=
=Q5ld
-----END PGP SIGNATURE-----

--==_Exmh_1116810255_3542P--
