From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Which patches can be applied on top of reiser4-for-3.15.1.patch.gz
Date: Wed, 20 Aug 2014 12:14:41 +0400
Message-ID: <14374339.ZjIIAzvjXL@intelfx-laptop>
References: <f6e6b313d9543ba6a1ad9a5707637dc8@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2425968.2atlqWOOLd"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=zqVqcYDyudropMkNpeLZ1iVI+4Wou/pfLYl9EEtXyAc=;
        b=C94W2IwW6cVxyn2UKBLwPwAFgbfR7ekGPbOWYRSQnd18944+K7fE9h/YE/aJecmbjD
         V0p2H+5+73ZtNl1g86GLyaSMTbsaBPMoKGDEFxFzT4Ysi7aMNvjutopJvO7foCxmZ2a6
         osnazlRiTvv6lBVL5bJRAtc6fRAp8T34hCJgatUvNqeCPf7Bys69QfRUwKFVn6mxJiSg
         8mdWg09m/UHG+x27opYKcsuVdt9dGAZQhSwlNBpnpkXR8JlUy8frAq/uyZAy8PT2cIM9
         3sBOhbxPIPIrYFWE+p5NhAzw/kXuMwlxT8USbUCvS7mTpjePNhDSeF90aiHmWtifMMRM
         AuFQ==
In-Reply-To: <f6e6b313d9543ba6a1ad9a5707637dc8@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: doiggl@velocitynet.com.au


--nextPart2425968.2atlqWOOLd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Wednesday 20 August 2014 at 17:42:52, doiggl@velocitynet.com.au wrot=
e:=09
> Hello,
>=20
> Which patches can be applied on top of reiser4-for-3.15.1.patch.gz
> 2014-08-09 616.4 kB=20
> I see this listing[1]  [sorted by date] in
> http://www.spinics.net/lists/reiserfs-devel/maillist.html
> Thanks Glenn

The patches marked with [RFC] are pre-experimental, that is, "request f=
or
comments". They are not to be applied to any configuration with signifi=
cant
data, not to mention in any way production systems.

Remaining ones are a bit less experimental, but anyway -- they are stil=
l up to
review. Testing is appreciated, but... it can result in anything.

Currently there are three actual patchsets "in flight":

=2D [RFC] [PATCHv3 0/9] reiser4: batch discard support (FITRIM ioctl): in=
itial implementation.
=2D [PATCH 0/2] reiser4: block deallocation fixes.
=2D [PATCH 0/3] reiser4: space grabbing fixes.

The main discard support patchset,

=2D [PATCHv7 0/6] reiser4: discard support: simplified and race-free init=
ial implementation.

is already reviewed by Edward and uploaded to sourceforge under name of=

3.15.1-reiser4-basic-discard-support.patch.gz. It is to be applied on t=
op of
reiser4-for-3.15.1.

The "in-flight" patchsets are to be applied on top of discard support p=
atch.

Hope that helps,
=2D-=20
Ivan Shapovalov / intelfx /

>=20
> [1] long patch listing based on date.
> extracted via  # grep -i PATCHv listing.txt  | grep -i reiser4:| more=

>=20
> [...]
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--nextPart2425968.2atlqWOOLd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlP0WPoACgkQxUKljSIMAnBNygEA5QnzNWPVIXn2zN2seoJAixpj
h8t2166aBhh+3dzRdm4A/RVjTaZP2+2iL42qjeEc9sqYGyFDtCquvH8k2qOraQP3
=za/o
-----END PGP SIGNATURE-----

--nextPart2425968.2atlqWOOLd--

