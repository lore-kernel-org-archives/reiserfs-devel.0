From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Which patches can be applied on top of reiser4-for-3.15.1.patch.gz
Date: Mon, 25 Aug 2014 02:57:29 +0400
Message-ID: <2478269.HnJ0o2pqqt@intelfx-laptop>
References: <f6e6b313d9543ba6a1ad9a5707637dc8@mail.velocitynet.com.au> <14374339.ZjIIAzvjXL@intelfx-laptop> <ddb1dce22777b95f061191f777a1d349@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1946138.eoRedxo5z5"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=HmuIX7kwK7BVg3/X6ljWiNaw4RqCqq13+GPXJ0Hi5xo=;
        b=PvZu/oinvuXONG23zbCpfo2y920fvzS9eaKtznySh4ASJMmE9+GOj8rmtyN0WgGxho
         QuC3xaDdeSU5HiAM3GWb2+CfZqbjNJBceZatnR0yAiy3YAvRdUVyQTkskT9x/F/ARTtQ
         CZOOXlZcUdMauN7+HSH0gHWw2QZubBOwHXn3qM1eXlafvvklH1VbTNLqmxzYN7YrYazD
         kecW3EvJTM1uJLgae8Zkfca/jcAPW/jhBmDFADaxH/n4Fgkl/MzSqJumCrVb5YU/J1VK
         mKHvXbPYpL2zZQniumhtaSn414e6e6a1QcGUcaWzx1hjkEcX2CB4EADOyGbQczJsEfur
         Lu1w==
In-Reply-To: <ddb1dce22777b95f061191f777a1d349@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: doiggl@velocitynet.com.au


--nextPart1946138.eoRedxo5z5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Sunday 24 August 2014 at 18:09:13, doiggl@velocitynet.com.au wrote:=09=

> [...]
>=20
> Hello,
> Thanks for the details.
>=20
> rpms did build with following patches applied:
>         reiser4-for-3.15.1.patch
>         3.15.1-reiser4-basic-discard-support.patch
>=20
> see link to built rpms url [with above patches applied]
> https://build.opensuse.org/package/binaries/home:doiggl/kernel-reiser=
4?repository=3DopenSUSE_13.1
>=20
> Question:
> Which "in-flight" patchsets can be applied on top of discard support =
patch
> ?
> Url link to patch appreciated.

Why do you ask? Do you want to build a general-purpose kernel with thes=
e patches
or just help with testing?
Anyway,

this is a last bugfix patch from Edward (on top of 3.15):

=2D [patch 1/1] reiser4: implement ->remount_fs() super operation
http://www.spinics.net/lists/reiserfs-devel/msg04193.html

and these are three patchsets that can be applied but are _unreviewed_
(on top of 3.15 + basic discard support):

=2D [RFC] [PATCHv3 0/9] reiser4: batch discard support (FITRIM ioctl): in=
itial implementation.
http://www.spinics.net/lists/reiserfs-devel/msg04166.html

=2D [PATCH 0/2] reiser4: block deallocation fixes.
http://www.spinics.net/lists/reiserfs-devel/msg04177.html

=2D [PATCH 0/3] reiser4: space grabbing fixes.
http://www.spinics.net/lists/reiserfs-devel/msg04180.html

Hope that helps,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1946138.eoRedxo5z5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlP6bd8ACgkQxUKljSIMAnAzcwD/SwsV5LhdHNG0SVbbABe4Ha3X
ji7zD71lXVpd1sq8lHoA/jBBI3ERliopeitkdiWTZCqa3LdP241gdM9n6K9a8H5T
=rKK7
-----END PGP SIGNATURE-----

--nextPart1946138.eoRedxo5z5--

