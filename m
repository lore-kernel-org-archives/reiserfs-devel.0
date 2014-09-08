From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv2 0/3] reiser4: block deallocation fixes.
Date: Tue, 09 Sep 2014 01:13:01 +0400
Message-ID: <1416703.LvzVPnS5Yo@intelfx-laptop>
References: <1410201831-11722-1-git-send-email-intelfx100@gmail.com> <1965626.b15caRcJVX@intelfx-laptop> <540E0F57.5090503@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1948932.tmxK0MWdBd"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=m4/R3XM1YcnA1ALUUvkB85lyF6hnGAn16FVMJwq8ytk=;
        b=Hq3UDy7n6iRG69HPYhi67xJkme79/yVxg3a10ahHuiDJrbUIseMg7ulR/U+U9dc0Eu
         VZU82/GE2OvfVKIEOJT7YeKTo/ebp9B4Ac9NpDrRYZlKTIsxH8+y6A6L2YBXVlBp1qaj
         cmKWZ2wDJyHDxBfxe3nwR2S2liGEScnkfbPxTyn5H8lYvcGUwCcJX+NqWOnGkAC8w3Oj
         kCoZHOyJjtj98qPezpe5BenR03Q8XOJVb8HDbVH//meX4B261iwBQ35S2Wryf5TwPnJL
         lMTNYGvtX8YlzBKcTCiP0PbFmBSNBuHCewbViQe7RTXCiChVA2udZbdy4/wa3iAQhXZ5
         oRbQ==
In-Reply-To: <540E0F57.5090503@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1948932.tmxK0MWdBd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 08 September 2014 at 22:19:35, Edward Shishkin wrote:=09
> [..]
> > Uhm, what relation does that bug have to 3.16? Does it manifest its=
elf more often?
>=20
>=20
> I can reproduce it in 3.10, 3.16.
> I can not in 3.11 - 3.15..

Hm. Never encountered such bug.

That said, do you have any plans on fixing that? ;) Or will we just sit=
 with 3.15
and wait for a kernel when it suddenly stops appearing?

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1948932.tmxK0MWdBd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlQOG+EACgkQxUKljSIMAnC8KQD9EET5ZH3H/IisBLl78UYtm7jf
45FGda23w9h5sGV8+aEBAJi7Y1ZlZfIYcZTIVBUT3IgQS6OwFkFYYnNgiEVCE7cU
=ZBua
-----END PGP SIGNATURE-----

--nextPart1948932.tmxK0MWdBd--

