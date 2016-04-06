From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: [PATCH] reiser4: port for Linux-4.5
Date: Wed, 06 Apr 2016 18:26:23 +0300
Message-ID: <1459956383.5177.0.camel@intelfx.name>
References: <56FB9A57.3040906@gmail.com>
	 <1459903365.31752.2.camel@intelfx.name> <57052985.8000905@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-c58v3IQJRvMqHXs1yfK7"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=ibfbj6EU+dsED8DGytJdyFw4TwTXnvKkAj+a+Ln4J9k=;
        b=PEQQxakZNPiyIVIG1fX1ibjtNeHaXO5spiR950qDi732LVG0aix3MUKAXOtp5gLFIZ
         Nz3gsFK0EchxlNT0DfmyhexfLnIDTJpGPsjfseSkkGBLMWFu4dE2M8h/exevkHDnApyG
         6wnawJUEvsegOj/AGvpc6Ulhbw8FHUUAtvNQw=
In-Reply-To: <57052985.8000905@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>


--=-c58v3IQJRvMqHXs1yfK7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-04-06 at 17:21 +0200, Edward Shishkin wrote:
> Which "adjustments" do you mean?
>=20
>=20
> On 04/06/2016 02:42 AM, Ivan Shapovalov wrote:
> >=20
> > On 2016-03-30 at 11:20 +0200, Edward Shishkin wrote:
> > >=20
> > > . Adjust for the new ->get_link() of vfs's inode_operations: we
> > > don't
> > > =C2=A0=C2=A0=C2=A0=C2=A0support RCU mode;
> > > . check returned value of __copy_from_user() to make gcc happy
> > > =C2=A0=C2=A0=C2=A0=C2=A0(the path is never invoked) in create_item_no=
de40().
> > >=20
> > > Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
> > Hi Edward,
> >=20
> > could you please send a separate patch with adjustments for 4.4?
> >=20
> > Thanks,

I meant usual forward-porting changes. But now I see that there were
none :) Sorry for the noise.

--=20
Ivan Shapovalov / intelfx /
--=-c58v3IQJRvMqHXs1yfK7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXBSqfAAoJEHveF8jk4w6dRcIP/3PcJk9vzk8iBberYTqsOcFo
g9pVn42+ftazK66ql/xTO90MRijMIi5qTCU3xCwIHGWc0A1sAxIm18rVB//C28sA
peWh8qxsaINC6mhtsQPIX4bHGt+L6TStTahNcTSKMsg1sUigRJiXkD6BcTbpIehT
pubtycRF8QcemnJOt3JQxr5cMiFdJ8h/X3TPSxCWUuk8D7pCljNMwWPlWDUeKfZA
BBmLUOGt2mQ1CszLwLkEZHVOZ6smJk0Yu7gOnzk1oL2DDnqpBopGdYXFQeOLuo/o
nP4uihGylxYHHxS/FFa3UAWiG1vFSGp6oktS0R7h9+PlZaQ0OwQju7g2FAlFO+Fx
3zfh0zYQtpPfonARw+ocndhE3Yo3VE1RvWeLvcaFyRgWS7AyzIFgjR76bn2PTZ4s
WXpvno25UiKwUUyiUGcCftfTu72JmOk7Z0cudKI0wJJahKQjDRP2fgfrdsdIX1qu
X7l6w9GxJ5TyDkTBPfLnnNd8ov6qg7X3BNKsfsJf9YxWJ/s2abTY2eeXuGeD6PEb
HAEbQMFVJOTz10H8yf+kV9QlVlaS/W5PNeYNLGuMwPTLES/DKDGMQgdx+OVQPtzD
wH4USW0zyD2dHDPq2iY5cfPxEAuz7PX38XiZbF51CXWXS4tCu49FnPDzJSfzLuVc
PtvQJhM4oJBdrICCmsKE
=Z/Yv
-----END PGP SIGNATURE-----

--=-c58v3IQJRvMqHXs1yfK7--

