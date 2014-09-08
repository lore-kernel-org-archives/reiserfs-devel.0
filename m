From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv2 0/3] reiser4: block deallocation fixes.
Date: Mon, 08 Sep 2014 23:52:49 +0400
Message-ID: <1965626.b15caRcJVX@intelfx-laptop>
References: <1410201831-11722-1-git-send-email-intelfx100@gmail.com> <540DFD75.8090003@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2128558.j0aMgefnyV"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=xt3ziFXuTokzQlSugC2sQJAuItgIBxkoZIXdwWnQpkk=;
        b=aS5OZpSyZ8MY8Dobw2Wc4/1kbu/0b8JWJIngOiIqwDax4SqyzqezKfi5p4Mr185yIj
         bIMooS/xvTYwqlcydlM4h9pJcvW6FC+fKlkusyhClEcYmMyOFXuSaHpdv73tbDpY4oEg
         nz1ZMlIdt7PEPlFz1SmlrvS+SkWL6D9Jri+TtxUyZqcUF1k3hJRKifgpcmXB7u15yZjs
         BiVOzy686kRrdhB9F6ZakiTZntsO7v9EoeSQz70ZVh2yzgsrASEsTJL1rIjMSRRVXz9L
         s7sif2qsnWeR7IeFZiFxO/fVEm6Hl8t2fBQgRq4Dc2MTg2koVEPXWLgHupXMSOiAInCN
         PTdw==
In-Reply-To: <540DFD75.8090003@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart2128558.j0aMgefnyV
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 08 September 2014 at 21:03:17, Edward Shishkin wrote:=09
> Ok, I'll include this to the 3.15.2-reiser4-basic-discard-support.pat=
ch

Good, at least this is done...

>=20
> As to 3.16: unfortunately the ancient bug, which leads to non-deleted=

> directories raised the head in 3.16. I don't want to release buggy st=
uff.
> So let's work around the stable 3.15 for now..

Uhm, what relation does that bug have to 3.16? Does it manifest itself =
more often?

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart2128558.j0aMgefnyV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlQOCRYACgkQxUKljSIMAnDnMwEAkmRrHcXLw1/wexFaQvpjtovN
BhCdBwLomIhYxz8DgkYA/3opUKH3DJUH36ZxNcataGfW1hvlMp2lhXU+gAb6gOMh
=hsMJ
-----END PGP SIGNATURE-----

--nextPart2128558.j0aMgefnyV--

