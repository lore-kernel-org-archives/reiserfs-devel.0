From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv2 0/5] reiser4: discard support: initial implementation.
Date: Tue, 06 May 2014 13:56:37 +0400
Message-ID: <4205015.az6QQplYXK@intelfx-laptop>
References: <1399354223-5334-1-git-send-email-intelfx100@gmail.com> <CADW=+3=B7aNyBdKwhHS_r8bMO+ZrjK5WNbdEXVXfGvRP7KQK-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1831945.sgKW4Lr6lm"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=yCiTtgJ5iW10XlioHqsao51UvPllFnM4TcbYXwsi62A=;
        b=uu0HXjpw0bPUACoUVHQt+NGVaH/q+DUlJKfUIFBY8fNNo68Rt+0ksIRNH0NRVoX7HN
         D9KWoZbZm6BtMVYBkpU01lMRmcKCUJ8b6hN4wDC9uFhqAave0Z7t7rVpB7reDjPmjSiF
         c+v6n9yudklXgiaXmrP3WrWVPXr3PNnmJZUAfZSM+e7657GNoYRW0xb5aZP77hnz0NCO
         WlohOR+5TD3CoTOC+ifQeED9GP+fGA971w8lJHer4OeJopAnOhzXTMWFRoa87amhXL1V
         4OAzZF4VKckg0eMSK/HjIxsvqcnypgC6JGeno5Va5+GNx0LhQpln7AY5Lu0ed4WDf5ft
         Qhuw==
In-Reply-To: <CADW=+3=B7aNyBdKwhHS_r8bMO+ZrjK5WNbdEXVXfGvRP7KQK-g@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: =?utf-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>


--nextPart1831945.sgKW4Lr6lm
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Du=C5=A1an,

On Tuesday 06 May 2014 at 09:09:12, Du=C5=A1an =C4=8Coli=C4=87 wrote:=09=

> What about trim performance penalty? AFAIK all devices that are below=

> SATA3.1 have pretty long time to execute discard command so if we exe=
cute
> discard at every commit time we could make large stalls to the system=
. Can
> we batch them

This is already happening. Other filesystems issue discard requests dir=
ectly=20
when blocks are deallocated, once per each extent. We delay them until =
a=20
transaction is committed, in hope to be able to merge small extents int=
o large=20
ones and issue a lesser count of discard requests.

Any penalties remaining with this approach are inherent; if one can't t=
olerate=20
these, they just should not use "realtime" TRIM, i. e. not pass 'discar=
d'=20
mount option.

There is other way around: fstrim utility and FITRIM ioctl, which tells=
=20
filesystem to do a "cleaning sweep" and discard every free block at onc=
e. This=20
is to be implemented shortly.

=2D-=20
Ivan Shapovalov / intelfx /

> or make the discard period configurable through mount option?
>=20
> http://en.wikipedia.org/wiki/Trim_(computing)#Shortcomings
>=20
> On Tue, May 6, 2014 at 7:30 AM, Ivan Shapovalov <intelfx100@gmail.com=
>wrote:
> > [...]
--nextPart1831945.sgKW4Lr6lm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EABEIAAYFAlNoseQACgkQxUKljSIMAnBNTQEAmTwHxCvYAMh3qgYIE5ZMpI68
PCDKJcEx9kl4BxoNGF4A/1J5lqFrsaHhyG4QKJJz0Q0HeyfrJt5569LWv5epoiQw
=xOhk
-----END PGP SIGNATURE-----

--nextPart1831945.sgKW4Lr6lm--

