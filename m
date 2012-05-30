From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: reiserfs lockdep complaint
Date: Wed, 30 May 2012 16:22:09 +0300
Message-ID: <1338384129.2536.71.camel@sauron.fi.intel.com>
References: <1338380307.2536.70.camel@sauron.fi.intel.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-QA56c1d29xXBLeK5S7Wj"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1338380307.2536.70.camel@sauron.fi.intel.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Linux FS Maling List <linux-fsdevel@vger.kernel.org>


--=-QA56c1d29xXBLeK5S7Wj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-30 at 15:18 +0300, Artem Bityutskiy wrote:
> Hi,
>=20
> I get the following lockdep complaint when test reiserfs in the 3.4
> kernel using xfstests. Ideas?

Reiserfs subsequently deadlocks, but it does not look like this lockdep
warning is related to that deadlock, but I am not sure.

--=20
Best Regards,
Artem Bityutskiy

--=-QA56c1d29xXBLeK5S7Wj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPxh8BAAoJECmIfjd9wqK09lcP/35NZYJt4aM7fRXwi8CM10Ri
+Vpow6tgDM1p2AW0hyabpgEE8BDtLgnAcY6DxOhdOII2hQZBb2BbrzRAUZSI4Wym
Fd/45CTF/vBaJXP5qthyW37NT9+4T4GTi8df2Lwryf6IyylD8RZMTyXRDDdKxbV2
Ztp96seyElOKC9STDJvSrKIkEJ/UdgWgzqQ0FrgGnrMVFca1wPFUiqjjcVQ8cIEq
gx50V3Z7gu+vbgsIypBypfA71Odg8NP6atCDeysmoZ/XHGkRjNpjIDJ7pVp5jcd2
W5NFyx+V42bZfpUWRWrTTE4Jx6s9yfywVykIXMCF7WaFkzSPh1tLraA+/+Fka/+9
EzzWWi2Z/Lj/PlbZIzhKWW+aQldUpeiRZDfp8Y3btGofOUgReTG1ACYxaD3jsYmB
MOUukQF8HHeT0hOLzZSS+Gg5exOAf/rArtS/Yf10y4WokzXl6A5bc9+1loeXNuH2
RjCtybw4OlLuvhztT1yS8DbPYPmy+f42GgrdcrmDxgs4jyip98oNWLNNm3bI7oZL
RDYopPd1JokLN3rYxpQfB/EzcVQBgIbnQc4qTE/l+j21StXTpk3sN2JIP+UQeCa7
GtBONqS2HkszKTh3krl6vwQlNwBGhgPTgqXbj28RMROcy+1dbaFCBlPvKwZgw9wZ
sPmI69zeCI+CHu5hEjvt
=ZrXS
-----END PGP SIGNATURE-----

--=-QA56c1d29xXBLeK5S7Wj--

