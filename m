From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv2 0/5] reiser4: discard support: initial implementation.
Date: Wed, 07 May 2014 11:17:32 +0400
Message-ID: <1996329.dNg2T8uotD@intelfx-laptop>
References: <1399354223-5334-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7216459.cMAusfOZhC"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:user-agent:in-reply-to:references
         :mime-version:content-type;
        bh=Wn9bPGVFls/gk9aZh4N7PX8WM9D0BxySOicueI2ZhAQ=;
        b=bVV6k3WDl9iFay9/7sdfD33MlXP7E07tWO+yzbmH/CS6rTDUg4xfG58L2QEcEah9NK
         cxkQwyc0jriWzv+gur9bOPp/KIpuFu59i04eo3FvJ15JpTkzh2jiyvBx/g3qaQztFlOK
         eNrxr82LzeMjSGbBaHc4TIG78N4xFR31FVv0vfnq/aa37JRfvmJDeCPSGSL7KRPO1Zk9
         kVghFsqvtYSPtNuxeJ9TS+qin3S7iMHfv9dZCnhhxXbBLd8WpoN03p5ak8cdCUHg25q6
         dYdSu6gx5fED9iyfpVtOMFEzsqAD4Lo/OE79Uw467qEPH2BIU4CftukRHRgQlCLpgZlZ
         w3KA==
In-Reply-To: <1399354223-5334-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org


--nextPart7216459.cMAusfOZhC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday 06 May 2014 at 09:30:18, Ivan Shapovalov wrote:=09
> Patches 1 and 2 are a re-send of v1 with some cleanup and fixes disco=
vered
> after enabling debug mode.
> Next patches constitute new code since v1.

FYI, the "intelfx-17" assertion triggered twice in the last day. I've a=
dded=20
a couple of similar checks in places where new extents are created/modi=
fied;=20
now I'm waiting for the bug to manifest itself again.

=2D-
Ivan Shapovalov / intelfx /
--nextPart7216459.cMAusfOZhC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EABEIAAYFAlNp3hEACgkQxUKljSIMAnCbwQEA3QsJpuNpSArFkAy4Wid/ZroS
xxOvkJciIPlQspOHweIBAOz7nNgD5YR4agniiEZ0NnpszZWQZdWojW1NZsmEPLgm
=tDoA
-----END PGP SIGNATURE-----

--nextPart7216459.cMAusfOZhC--

