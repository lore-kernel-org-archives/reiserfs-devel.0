From: Valdis.Kletnieks@vt.edu
Subject: Re: Will I need to re-format my partition for using the compression plugin?
Date: Thu, 22 Sep 2005 16:49:00 -0400
Message-ID: <200509222049.j8MKn1CH012169@turing-police.cc.vt.edu>
References: <194f625505092006316ad200b5@mail.gmail.com> <2f4958ff05092208244a0496fc@mail.gmail.com> <4332DE9F.8010808@namesys.com> <200509221951.38302.namesys.Sch@ttgen.net> <43330E14.9050209@namesys.com>
            <4333100F.6080307@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1127422140_2709P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26243-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 22 Sep 2005 15:11:59 CDT."
             <4333100F.6080307@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Edward Shishkin <edward@namesys.com>, Fred Schaettgen <namesys.Sch@ttgen.net>, reiserfs-list@namesys.com

--==_Exmh_1127422140_2709P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Sep 2005 15:11:59 CDT, David Masover said:

> > Because sometimes it is useful to compress data before encryption sin=
ce compression
> > destroys vulnerable regular structure of some special files (like *.h=
tml)
>=20
> Although I'd imagine some algorithms are fairly resistant against that =

> (RSA, maybe?), the main reason is simple -- encryption tends to=20
> introduce randomness.  If the crypto is any good at all, you won't be=20
> able to compress very well after you've encrypted.

1) RSA is useless for this - you really need a symmetric block cipher of =
some
sort.  Almost all block ciphers are best used with maximum-entropy input =
- if
the attacker can lop out a large part of the keyspace, a brute force atta=
ck
becomes a lot easier.  This is somewhat related to the concept of =22Hamm=
ing
Distance=22. If the attacker tries a brute force attack, and the first 8 =
bytes of
the output look like valid HTML, or English text, or anything else
recognizable, he's almost certainly found found the correct key.  On the =
other
hand, well-compressed data has very high entropy - as a result, it become=
s
harder to tell if a correct key has been found.  If it's English text, bu=
t
3 of the first 8 bytes have the high bit set, it's probably not a correct=
 key.
If it's compressed, 3 flipped bits in the first 8 bytes will probably sti=
ll
represent a valid compressed stream - just of something else wildly diffe=
rent.

2) Even though most modern block ciphers are designed to be fast, it's st=
ill
faster to apply a reasonably quick compression scheme to whomp 16K of dat=
a
down to 5-6K and encrypt/decrypt 5-6k than it is to encrypt/decrypt 16K.


--==_Exmh_1127422140_2709P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFDMxi8cC3lWbTT17ARAiB3AJ9rG24HP3GdEcrKF8IxhQ3AZcX2ZgCfYaYf
MrNdollJcP5WrPffv0GDT8s=
=ANFq
-----END PGP SIGNATURE-----

--==_Exmh_1127422140_2709P--
