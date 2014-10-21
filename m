From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv3 7/9] reiser4: batch discard support: actually implement the FITRIM ioctl handler.
Date: Tue, 21 Oct 2014 20:42:04 +0400
Message-ID: <3623276.DiI5EXUh1u@intelfx-laptop>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <44201008.TshRq3mBYC@intelfx-laptop> <54468AC7.3040107@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5907654.ftvh114HTG"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=H4LG5/cObLNnPUqd++S/eSX/cwwHgt+HWp38v3GyPRc=;
        b=R7liPfEKHi4ePScdAYlMbzdW3yrKM/JITuvEUhc/jTYjIi1MD4ZpbAVpXdLcd4XYCH
         pTxLYZeHSx9WEy3b3Thzq642ZA1o3PUsL4cP45MaBR6hzUoUiUdT5BFORcSwnIpvOcSk
         FxL8LtdR1W/A399VfCADHBrHZ34J/H/X45ouwGZFQoN8Hf2RM/GBUgw8zPzhc2qLyDio
         uKTbbqxbKwZtOTfoBDg+HB7DsyjUaDVLOgP5171PKjRbQv7flvqDxBnt8uPVvx7T65dU
         Ju1q0JH9k8MqfLewWtZxjdGeOkGYtX59CDPYWizcFSNKhVzZkQdsn+01wDdo80b2WzyJ
         87pg==
In-Reply-To: <54468AC7.3040107@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart5907654.ftvh114HTG
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 October 2014 at 18:33:11, Edward Shishkin wrote:=09
> On 10/21/2014 06:23 PM, Ivan Shapovalov wrote:
> > On Tuesday 21 October 2014 at 18:21:56, Edward Shishkin wrote:=09
> >> [...]
> >>
> >> Sorry, but I don't see any explanation.
> > "given a filesystem with (5% + eps) free space left, not using the =
reserved
> > space will result in trimming of (eps) blocks at a time."
> >
>=20
>=20
> This is something that I am not able to parse :)
>=20
> Ok, it is clear, why we can not fail with -ENOSPC when trying to dele=
te
> a file from a full partition, yes?

Sure. Please note that making reiser4_trim_fs's allocations BA_RESERVED=
 will
not hinder this: delete_mutex is there for a reason.

> I want to see explanation, why FITRIM ioclt can not finish the work w=
hen
> there is no free space on disk.

Suppose we do not use reserved space for reiser4_trim_fs's allocations.=

Let's analyze those two cases:

1. There is <=3D 5% free space on disk.
Initial grabbing fails, nothing can be trimmed.
This is wrong.

2. There is 5% + X (where X is some small number) free space on disk.
We can grab only X blocks at a time, so a total of ((SIZE * 5% / X) + 1=
)
transactions will be created. BTW, if X < erase unit, nothing can be tr=
immed.
This is ineffective.

Hope this makes sense.

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart5907654.ftvh114HTG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRGjOMACgkQxUKljSIMAnBI+gEA0s936UAKDdfz9RtCu48zrbcM
HwM5DYKs2DJySlrTluUBAIMe+rRhbEQWJQJwK5CJTTydM1dWiM77dxKrCOqqxdcP
=QVdS
-----END PGP SIGNATURE-----

--nextPart5907654.ftvh114HTG--

