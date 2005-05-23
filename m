From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Reiser4 O_DIRECT
Date: Mon, 23 May 2005 12:52:12 +0300
Message-ID: <20050523095212.GD11013@nysv.org>
References: <1116525192.29446.5.camel@zion> <1116578526.3532.463.camel@tribesman.namesys.com> <1695540869.20050521234900@wp.pl> <200505222247.j4MMlr85008867@turing-police.cc.vt.edu> <4291225B.5090503@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Return-path: <reiserfs-list-return-24116-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4291225B.5090503@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Valdis.Kletnieks@vt.edu, Pysiak Satriani <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 22, 2005 at 07:22:51PM -0500, David Masover wrote:
>
>This is exactly why it should be in the kernel once the developers can't
>find any more bugs.  Marked as experimental, mainly, but in the kernel
>where real users can throw cobol/Java/sql bastardizations at it and
>break it.

Sure.

Don't get me wrong on this, because I've voiced my opinion about
the new development model failing us, with stuff getting a bit
too lively in -mm and merged into stable a bit too fast for comfort.

Still, this new model would allow someone to merge Reiser4 into
vanilla with ease, whereas on the traditional model, kicking
an experimental fs from the dev tree might have been a difficult
political move.

Thus it must be anounced in a way that doesn't scare people away
"oh no this is yet another broken pile from -mm, we don't want it!"
but invite them "kickass, a file system that's stable enough to
be merged, with EXPERIMENTAL just pro forma on it"

>Of course, I've worked on sufficiently few big projects that I'm still
>naive enough to believe that unit tests _can_ catch everything, if
>they're done right.  I'm sure I'll eventually be proven wrong...

My take on testing is that I leave it to the real professionals and
with cases like Reiser4, I just blindly do what I'm told and see if
I break anything.

I'm sure a testing professional will happily prove you wrong ;)

--=20
mjt


--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCkafMIqNMpVm8OhwRAo2bAJ4gdXeW3UfX3GkMI4cQQaITQwQhngCeNO3R
9AhX86dNbuyCIIF8uLi4luU=
=mC1P
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
