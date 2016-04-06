From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: [PATCH] reiser4: port for Linux-4.5
Date: Wed, 06 Apr 2016 04:22:18 +0300
Message-ID: <1459905738.31752.7.camel@intelfx.name>
References: <56FB9A57.3040906@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-AHleX6UZ5fm32i07W7j6"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=+vrFSqOpWntwwimexNwmuzY11c9MRG6vxJlwcal3PyU=;
        b=Yti53N/z384et97FJMhpX5cAm3QwvMdoIowz5TYIw6LH89PAXRkJm1T+fCVShglRMv
         Vu8ZeYR8uqo0Pvcn7G0zaJiCmebP6aEKKhD+Qq3EOUv0fuJuvbJ8uI86KqvePVXkMkKG
         R0iRukPkVtdcRqj2qr0OZuD0IoItoYlchh3Uo=
In-Reply-To: <56FB9A57.3040906@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>


--=-AHleX6UZ5fm32i07W7j6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-03-30 at 11:20 +0200, Edward Shishkin wrote:
> . Adjust for the new ->get_link() of vfs's inode_operations: we don't
> =C2=A0=C2=A0=C2=A0support RCU mode;
> . check returned value of __copy_from_user() to make gcc happy
> =C2=A0=C2=A0=C2=A0(the path is never invoked) in create_item_node40().
>=20
> Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

By the way: I've noticed many times that the resulting squashed patch
which you put on sourceforge is _different_ from what can be composed
using incremental patches you send on the ML.

Maybe you could finally consider having a git repo somewhere (e. g. on
github)? It would be much easier to work with the code (and, for me in
particular, to learn how it works) this way.

Thanks.
--=20
Ivan Shapovalov / intelfx /
--=-AHleX6UZ5fm32i07W7j6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXBGTKAAoJEHveF8jk4w6dOK4P/iu9atVUvya7gBn1d1NrO5OB
us/Z+di8EmU6PQIZrCoxxZal65lksTGNiA95K8ZZwUc2cPepzn5t7uqAdCOGurYs
I8uydMqtgNdca98XQXVF73V+lnfnH70e5nc3IRwiZBjV/nUStJNEsAVSNuhD86o1
5lmzlPfuStwKew5nm0grHcsqTi9+9UIU/Fxsh9NpG2jOEuWlWXdvhE8XhyoJRA7B
bpa6P908yav4WHiEExRnorCwJpWQJ7oFNwTZwwBU/f8g3YH3dQJHiO0ydpn2oGV9
2TugpcxrL/oCV+ntBQGNktWjEwm/6+rhNlRr324tEJ66W0w6yu5FVxb6Gx2/1FXF
qMcEOZXekUteY5oXxRNBXXMaHxlVRSKm5hPJmVqVlG1O04sAcOMkg9hi2wvpPi0p
AzWuJjAkRoqlDbiM16O0fMH/EhuWwF+1+emi/TydFIa/mp39G9DUcK3N3h4C7doA
NOH+XylODIPf1Sf8zn26i8LrrLV1s194y4s7Wb9hmes2iIix5D33IDQxpv1yHK6x
tzsKFkpp9EuEyUtqp3WM8QmVw7ptaTjeeb8YZ04ErDaszBxfxea7oGCY5FIzaV45
myNImizRwmHPFUzZPQgjNctRHmDzV93d2QnyvKw00uyEXWx1XVeFpUB76mhZ4DUj
OOOf/nMe9PfMyG1BmvEA
=OONN
-----END PGP SIGNATURE-----

--=-AHleX6UZ5fm32i07W7j6--

