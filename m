From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Question: Will these patches be included in the next reiser4 patch set ?
Date: Fri, 13 Jun 2014 18:59:26 +0400
Message-ID: <10895439.g17CoeFLkm@intelfx-laptop>
References: <284cc2e34b93261e75f92b7ad592baf3@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1902273.WaLNtAqcqs"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=5eD3mqHD4UjLhcYygPQWnexlxYFoLTAGtCmZj9EA+wA=;
        b=chdPrw1UDFiMHCz3YLqGjWzHsSewnICfcZNjMUpbROy7Y4d5tGb+zOitmdkKbv7EQZ
         Cvmyzx42Rl4Q7mdRHWyqWaajb9tFzzt8ZWvZVgg34WlMJAZliL42824kDK4yaPkJl7o5
         nXUshYxmK/UHSoARC1jBfUvIf/H9VOc9IKnVeUf6bT/5y88hsWH9AFshTBsE8Hi0Bjf5
         HkLeciO0TjX4Qeb6A+ynl5+0/6afyJ2FozNqis4Jk0/nUwK2ifEez4p5Z/yTb29IXbum
         FKxxTAJpYHd9IjqHBsv6YGBYT/phwJoG33mg2ShP9BD4EG+rIrpyKUc6TAcD98ZNxKmM
         hmdw==
In-Reply-To: <284cc2e34b93261e75f92b7ad592baf3@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: doiggl@velocitynet.com.au


--nextPart1902273.WaLNtAqcqs
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Friday 13 June 2014 at 22:42:18, doiggl@velocitynet.com.au wrote:=09=

> Hello,
> Question: Will these patches[1] be included in the next reiser4 patch=
 set
> ?
> --Glenn
>=20
> [1]
> [RFC] [PATCHv3 0/5] reiser4: discard support: initial implementation.=
,
> Ivan Shapovalov
>=20
>     [RFC] [PATCHv3 1/5] reiser4: discard support: make space_allocato=
r's
> check_blocks() reusable., Ivan Shapovalov
>     [RFC] [PATCHv3 2/5] reiser4: discard support: initial implementat=
ion
> using extent lists., Ivan Shapovalov
>     [RFC] [PATCHv3 3/5] reiser4: discard support: enable discard
> functionality through a mount option., Ivan Shapovalov
>     [RFC] [PATCHv3 4/5] reiser4: discard support: add assertions to a=
ll
> code written within this feature., Ivan Shapovalov
>     [RFC] [PATCHv3 5/5] reiser4: discard support: downgrade all
> reiser4_log() to reiser4_debug()., Ivan Shapovalov
>=20

Seems like they won't be, at least because there is v4 now :)

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1902273.WaLNtAqcqs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlObEdQACgkQxUKljSIMAnCPZQD9FFgad+I8bd+52h6bLapckZ/Y
4Df1WHQxo52VpuSW1W0BAM0mxzZ4nnjYEZpy+BlOtpHrxaRbA/hEx31SmZVC8qyG
=437M
-----END PGP SIGNATURE-----

--nextPart1902273.WaLNtAqcqs--

