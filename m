From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: The situation at hand and in the future
Date: Sun, 30 May 2004 17:07:17 -0700 (PDT)
Message-ID: <200405310007.i4V07HJc015097@sirius.cs.pdx.edu>
References: <87aczplu4b.fsf@uhoreg.ca>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18921-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87aczplu4b.fsf@uhoreg.ca> from "Hubert Chan" at May 30, 2004 01:09:24 PM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

> From: Hubert Chan <hubert@uhoreg.ca>
> >>>>> "Markus" =3D=3D Markus T=F6rnqvist <mjt@nysv.org> writes:
> Markus> I can't remember how MD5 works. It's a 32-byte 7-bit hash of
> Markus> data?  It has also something to do with the length of the data,
> Markus> if you know how long the data is, it's easier to do a successful
> Markus> birthday attack.
>=20
> Huh?  A birthday attack isn't related to retrieving the original text
> from the hash.  A birthday attack just shows how you can find two
> strings that hash to the same value.
>=20
> If you know how long the data is, it (greatly) reduces the space that
> you need to search.  I don't know of any other vulnerabilities related
> to known length.
>=20
> BTW, MD5 has some known vulnerabilities related to hash collisions.  I
> don't know the details -- I've only heard it mentioned briefly -- but
> extremely paranoid people will probably want to use SHA1 instead.

MD5 is 128-bits, so 16 bytes not 32 bytes. Length is irrelevant. You're
just as likely to find a 16 byte string that matches a particular MD5
hash value, as a 2GB string that matches a particular MD5 hash value. MD5
is strictly based on the value of the data, not its length. At 128-bits
though finding a match is very difficult without breaking MD5. There was
some research that produced collisions that reached pretty deep into MD5,
but no complete break has ever been published. The researcher who did the
work was absorbed into a German intellegence agency though...

SHA1 aka SHA160 isn't broken, nor are there any serious attacks on it.
SHA1 though has insufficient length to truely protect against the
birthday attack. You need around 2^81th strings to perform an attack on
SHA1, too large for currently known installations, but if you want to
defend for 20 years (the standard length of time used) then such an
installation will likely be feasible. Thankfully SHA256/384/512 are out.
SHA512 is currently overkill, but for the truely paranoid nothing less
will do.

> From: Hubert Chan <hubert@uhoreg.ca>
> >>>>> "Markus" =3D=3D Markus T=F6rnqvist <mjt@nysv.org> writes:
> Markus> Maybe there is some way of doing the compression after and
> Markus> before encryption and decryption, yes.
>=20
> Note that if you want to do encryption and compression, you must do
> compression first, and then encryption.  When you encrypt, you end up
> with what looks like random data, which typically has very bad
> compression characteristics (i.e. your file size is more likely to grow
> than to shrink).

Yup, there are additional reasons as well. Compression greatly increases
the Unicity distance (in fact ideal compression will make the Unicity
distance infinite), making it much harder to distinguish an incorrect key
from the correct key. Further, by compressing first you reduce the amount
of data you need to encrypt, resulting in a large speed increase.


--=20
(\___(\___(\______          --=3D> 8-) EHM <=3D--          ______/)___/)___=
/)
 \   (    |         EHeM@cs.pdx.edu      PGP 8881EF59         |    )   /
  \_  \   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
    \___\_|_/82 04 A1 3C C7 B1 37 2A*E3 6E 84 DA 97 4C 40 E6\_|_/___/


