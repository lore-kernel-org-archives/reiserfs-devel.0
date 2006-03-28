From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Reiser4 crash 2.6.16-mm1
Date: Tue, 28 Mar 2006 12:18:06 -0700
Message-ID: <1143573487.2380.1.camel@localhost>
References: <20060327214132.4074.qmail@pv105234.reshsg.uci.edu>
	 <C68877DC-ED4F-4827-B6ED-2F5CFEFC8037@smartgames.ca>
	 <20060327223214.5291.qmail@pv105234.reshsg.uci.edu>
	 <200603280439.k2S4dAql011014@turing-police.cc.vt.edu>
	 <F01E6B3F-3EBE-4982-9978-C79554F01FDA@smartgames.ca>
	 <4429577C.7020105@ics.uci.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-BkQU9MuixUvqbhV7Qwv7"
Return-path: <reiserfs-list-return-28383-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4429577C.7020105@ics.uci.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: jfeise@ics.uci.edu
Cc: Toby Thain <toby@smartgames.ca>, reiserfs-list@namesys.com

--=-BkQU9MuixUvqbhV7Qwv7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2006-03-28 at 07:34 -0800, Joachim Feise wrote:
[...]
> This is a production machine that I can't take offline for too long.
> But yes, I have compiled the kernel on another reiser4 partition over nig=
ht,
> without problems.
> If this was a memory problem, it would indeed manifest itself in other ar=
eas
> with more or less random errors. The fact that it does not indicates to m=
e that
> this is a fs problem. So, at this point I am ruling out a memory issue.

And if it's a production machine, it is using ECC RAM, I would hope.  If
it is, memory problems (unreported ones, anyway) are very, very
unlikely.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-BkQU9MuixUvqbhV7Qwv7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEKYvtG8fHaOLTWwgRAvMfAJ0bztRN0PYzWT+VxDcQypAwMErx5ACeIzVu
Eo+/1Eg7G9VU2ZJEXmS/uqc=
=x8/s
-----END PGP SIGNATURE-----

--=-BkQU9MuixUvqbhV7Qwv7--

