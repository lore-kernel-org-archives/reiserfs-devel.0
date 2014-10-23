From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv3 2/9] reiser4: block_alloc: add a "forward" parameter to reiser4_blocknr_hint to allocate blocks only in forward direction.
Date: Fri, 24 Oct 2014 00:58:45 +0400
Message-ID: <2901509.x8vlNgQx5H@intelfx-laptop>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <3138233.23nIal2kT0@intelfx-laptop> <5449128C.4040501@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1580913.yuaxAMd70N"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=g7+PK7sI1uUhaqML2EhbzXx+Ex47bQgyRFly2E2SEQw=;
        b=NKfm3D87lL6LaGw06XgpVetOoNPO/m1G9SO2UVJ8WNqsOVZGYT3OyGYW9ZxAwSgcx3
         9Yaj8oENoSXXsq/3hT3htL4wht8kdXvVw9n+9eIUi8mgJ2fZczYdbTmfTSUoHzW4mxp5
         kKz2olJ4h+It9acr7TMogNhx0hsxKV3GHncOqQPtqaOeN+qN4M1eX3FO+OlZ1+kJGCHQ
         I1MGJClspUev+fr973MaJSfM+4RBHVX3s07pMiyKYvxTP/dGtXBSzXHcXsmJgRS+fLge
         WrQebQLt91Y1rRGrVtBr6nKMrfbU+OtcI4MnWDPvew3DGwi3ToDZjtMOoIkokNgX6yRS
         46OQ==
In-Reply-To: <5449128C.4040501@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1580913.yuaxAMd70N
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Thursday 23 October 2014 at 16:37:00, Edward Shishkin wrote:=09
> On 10/23/2014 09:24 AM, Ivan Shapovalov wrote:
> > On Tuesday 21 October 2014 at 17:50:23, Edward Shishkin wrote:=09
> >> [...]
> >>
> >> I suggest to call this bitfield "monotonic_forward"
> > Isn't it an opposite of "backward"? Should we rename both?
>=20
>=20
> No, it isn't. And this is the reason of the rename.
> monotonic_forward is to skip the second pass in alloc_blocks_forward(=
)

OK, will rename.

> > BTW, in plugin/space/bitmap.c:1141 (around that line)
> > in function alloc_blocks_forward()
> > shouldn't the second scan be done with bitmap_alloc_backward(), as =
per the
> > comment?
>=20
>=20
> I think that those comment means a jump in backward direction
> (to the start) and one more pass with bitmap_alloc_forward().
> Such a "compound, non-monotonic" forward...

I don't intend to argue here, but doesn't that defeat the purpose of hi=
nt->blk?
The first pass begins from the *closest* blocks. And if it fails, the s=
econd
pass begins from the *most distant* blocks...

("closest" and "most distant" terms are used here with respect to hint-=
>blk)

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1580913.yuaxAMd70N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRJbAkACgkQxUKljSIMAnCGTAEA0SDrVUbIePkfAr92OZSzqbAv
XNbfHGeeWwOqpm2uqJwA/iuGlrP0NcotxQgW6gS0aqcFFuYeYoUK7qNUZlqZyZSH
=+s+R
-----END PGP SIGNATURE-----

--nextPart1580913.yuaxAMd70N--

