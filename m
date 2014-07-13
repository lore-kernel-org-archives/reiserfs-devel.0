From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using linked lists.
Date: Sun, 13 Jul 2014 16:47:50 +0400
Message-ID: <2333335.ugWK4TrHUo@intelfx-laptop>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <2011776.QNB5kWXL2t@intelfx-laptop> <53C1E205.3030209@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1912104.K6pxmSBkkZ"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=H4FatmONXmxaFtuGBii4GvGls/bV/zjeb3XmXkiMa6o=;
        b=UVqu5TfH8c2zZnTpdGfVffGrG84uTYG4AC1EXteNhAQtsY2RgKDJZEPtlJYk41P+3n
         O+Uyrs0/3CQZZFj+QwTmAmTc7u2zArNeaD0I4fY7SWVXedY39pBSDSEtwMYOYYMXiB7r
         sJB/Shd/s5rCAcb7Pr4PBSofDW9Np0KBSEOPStva5ALNFhXHGYZPCHvbeY47plSKJpnx
         zbXb9dQ0ivc560q7hDGJTQJAXxcUrnOzGGlSpdrYwXZRnp5C8gCPow8SdIZ/4kriSzCW
         4QK+XkM8fwCv32Are3MKRfx505yoVecY8XC1PEG4+epXcG8T47U+PA1m5DS4o6GL24mR
         clfg==
In-Reply-To: <53C1E205.3030209@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1912104.K6pxmSBkkZ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Sunday 13 July 2014 at 03:33:57, Edward Shishkin wrote:=09
> On 07/09/2014 02:40 PM, Ivan Shapovalov wrote:
> > On Monday 07 July 2014 at 01:47:41, Edward Shishkin wrote:=09
> >> On 06/22/2014 12:48 PM, Ivan Shapovalov wrote:
> >> [...]
> [...]
> >>
> >>> + * - if a single extent is smaller than the erase unit, then thi=
s particular
> >>> + *   extent won't be discarded even if it is surrounded by enoug=
h free blocks
> >>> + *   to constitute a whole erase unit;
> >>
> >> Why not to discard the aligned and padded extent, which coincides
> >> with the whole erase unit?
> > With a number of whole erase units.
> >
> >>
> >>> + * - we won't be able to merge small adjacent extents forming an=
 extent long
> >>> + *   enough to be discarded.
> >>
> >> At this point we have already sorted and merged everything.
> >> So may be it makes sense just to check the head and tail of every =
resulted
> >> extent and discard the aligned and padded one?
> > "Head and tail" is not sufficient. We may check the whole extent wi=
th a single
> > bitmap request, but such algorithm will be very inefficient: it wil=
l miss many
> > possibilities for discarding.
> >
> > Consider many-block extent, from which one block has been allocated=
 again.
> > In this case we miss (all-1) blocks to be discarded (if granularity=
 =3D 1 block).
> >
> >> Please, consider such possibility. Iterating over erase units in
> >> discard_extent()
> >> looks suboptimal.
> > Yes, it's costly... but I don't see any other ways to do the task e=
fficiently.
>=20
>=20
> How about this function?  (the attached patch is against v6-series).
> Total number of bitmap checks is in [N+1, 2N], where N is number of
> extents  in the list. At the same time we don't leave any non-discard=
ed
> "garbage"...
>=20
> Edward.
> P.S. I tested it, but not enough.

Hm. I'm probably a dumbass, but...

I don't see where the [start; start+len) region is checked for being fr=
ee.

Also, btw, do we need to cut the head (lines 155-163 of the patch) if h=
eadp
is empty? It seems that it would reduce extent by one whole erase unit
without any justification.

But I like the idea of gluing padded extents together if possible...

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1912104.K6pxmSBkkZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPCf/sACgkQxUKljSIMAnCXdwD+MyjzVj8rWWSb2SxZQ0jUa1el
mi4Cjy9FESwjiYv6sokA+wWyCHeVj641elCXQOEUADgj4OPuoDWSrDR32cVPxQ4B
=ZSGE
-----END PGP SIGNATURE-----

--nextPart1912104.K6pxmSBkkZ--

