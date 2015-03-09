From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH] reiser4: precise discard - general case
Date: Mon, 09 Mar 2015 04:46:15 +0300
Message-ID: <1425865575.11071.11.camel@gmail.com>
References: <5495DB0D.1080005@gmail.com>
	 <1423600944.24885.9.camel@gmail.com> <54DB1186.60505@gmail.com>
	 <1423649354.10127.16.camel@gmail.com> <54DBE880.4070902@gmail.com>
	 <3C7880EC-12E3-4621-A3BE-353EFA032293@gmail.com>
	 <54FCD090.3000005@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-/TnVG3RI5qwEnI1+mnQs"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=IN1zNVfjTYR9fZhNLH3kbUa6tGcYHGXJtTE5sd+djd8=;
        b=DX3z0oudWXt4/drn/ccvEWog0HajiB0I+X9djvHlwJPYdl1WD7XCCOyDeKiBpUWyY5
         oLKyilP+iZyBMWLwP2nhB9NW30buXaNf504WiIbWyClcSAlUe3GI46Avr2N35YFs5cYE
         7lNT1VmcZuPIgJ7Vbu6pDMMQlivkZxmjrSdWI4mH1zXDI5rRB/6FgehDVaHvVBu//UNO
         3cOPWSOYFRvX8N7D5mXTuKQPL/vvYMdA0PsZNkRLyvhxeS0XSP+urFvfJF5ruhWvMxT+
         ZIPPHyZJyu1e2KtDeS6tMbN4gwSIWsVspVRzX7ohjY6+1BBxUJhJr1T6ju57SnHlHhUt
         teWA==
In-Reply-To: <54FCD090.3000005@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-/TnVG3RI5qwEnI1+mnQs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-03-08 at 23:43 +0100, Edward Shishkin wrote:
> [...]
>=20
> You correctly pointed out the possibility of garbage leak
> in the case of block_size > erase_unit_size. However, the
> current gluing policy prevents such leak.
>=20
> Indeed, let AB be a current extent, and CD - next extent
>=20
>=20
> ----*-----*-----*-----*-----*-----*-----*---> units
> --|-----------|-----------|-----------|-----> blocks
>    A           B           C           D
>=20
>=20
> Note that since extents are sorted and merged, distance
> between any 2 extents are not smaller than block_size.
> In particular, |BC| >=3D block_size.                           (1)
>=20
> Suppose that tail padding of the current extent and head
> padding of the next extent are in the same disk block.
> However, in this case, in accordance with the definitions
> of tail and head paddings, we have that |BC| <=3D block_size.   (2)
>=20
>  From (1) and (2) we have that |BC| =3D=3D block_size, and
> p_end + p_tailp =3D=3D C =3D=3D start-of-next-extent.

This is not correct. p_* variables are byte-granular, so p_end + p_tailp
ends up somewhere between B and C. More precisely, it will point at the
first unit-unit boundary inside (B; C). So the condition referenced
below is not fulfilled.

That is, we only glue extents which overlap in terms of erase units,
not in terms of disk blocks after padding.

One may suggest to relax the condition instead; in other words, to make
it look something like this:

    if (end + tailp >=3D blocknr_list_entry_start(next))

However, it potentially makes us discard already clean units. I don't
remember if there are any other problems with this approach.

Makes sense?

Thanks,
--=20
Ivan Shapovalov / intelfx /

--=-/TnVG3RI5qwEnI1+mnQs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlT8+2cACgkQxUKljSIMAnBabQD9FdG4cQNoNS7lfFIhQfwQmjDM
qgtWzQf6E3IHOnbYzuAA/ioMVNl/aOD/Ap857lID1DEo3F7znlhM5bXtGd/Qt6aa
=FNp6
-----END PGP SIGNATURE-----

--=-/TnVG3RI5qwEnI1+mnQs--

