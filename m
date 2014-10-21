From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv3 1/9] reiser4: block_alloc: add BA_SOME_SPACE flag for grabbing a fixed amount of space.
Date: Tue, 21 Oct 2014 20:17:34 +0400
Message-ID: <3551134.ZdN0znfGUd@intelfx-laptop>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <3239928.cvXopdq3l9@intelfx-laptop> <54463638.7090606@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1500003.6KLlEZv6lY"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=sANQrPKwqiXkXsGs/6xS1p2sOF6jc1tGFR9UowA6gnQ=;
        b=RiBCTUmUSxMd3mo0jjtLzC3AC0+gTkkQnEX8DaMS+av9qFgvhXgbiIaJ68j0MDAMoi
         6k64KBPtxFWGSOdVlvIdKkc0iYAPDGk62ofxl2sl9H6taWlpct1a+CKrDm7wKSNh1WMa
         7FQ9K04EUG8VHvq3r1ul3ThI4HkuPiROJtYMICElavfT0lLYiN6PR0AKGiOA3u6vBkll
         uUI1rtDYuebivTBZAzIAZwUfA3m1Gclq0JIUVcqf1Hs7+C4aA0aG2Yx7JpTbkO6KxCuQ
         pADgvnQsiMouDHiTUPMhI7pAnJR4i/WqLg0BH8tY4dn7YjOTLM3fPR+6QGSrXfTNDbLB
         6qMw==
In-Reply-To: <54463638.7090606@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1500003.6KLlEZv6lY
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 October 2014 at 12:32:24, Edward Shishkin wrote:=09
>=20
> On 10/20/2014 12:36 PM, Ivan Shapovalov wrote:
> > On Monday 20 October 2014 at 00:04:39, Edward Shishkin wrote:=09
> >> On 08/17/2014 11:52 PM, Ivan Shapovalov wrote:
> >>> This is used for FITRIM ioctl which will iteratively grab, alloca=
te and trim disk space
> >>> bit by bit to avoid starving the rest of system.
> >>>
> >>> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> >>> ---
> >>>    fs/reiser4/block_alloc.c | 5 +++++
> >>>    fs/reiser4/block_alloc.h | 5 ++++-
> >>>    2 files changed, 9 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
> >>> index d3d730c..9eed7fc 100644
> >>> --- a/fs/reiser4/block_alloc.c
> >>> +++ b/fs/reiser4/block_alloc.c
> >>> @@ -276,6 +276,11 @@ reiser4_grab(reiser4_context * ctx, __u64 co=
unt, reiser4_ba_flags_t flags)
> >>>   =20
> >>>    =09free_blocks =3D sbinfo->blocks_free;
> >>>   =20
> >>> +=09if (flags & BA_SOME_SPACE) {
> >>> +=09=09/* Reserve 25% of all free space. */
> >> if (free_blocks =3D=3D 0) {
> >>           /* nothing to trim */
> >>           ret=3D RETERR(-ENOSPC);
> >>           goto unlock_and_ret;
> >> }
> > Makes sense, but IMO without returning error. TRIM'ing a completely=
 full
> > filesystem is a no-op (=3D=3D all blocks busy, nothing to trim), no=
t a failure.
>=20
>=20
> (sbinfo->blocks_free) is a rather bad estimation of free space amount=
,
> but we have nothing better. I suggest to return -ENOSPC here, and use=

> reiser4_grab_space() with BA_CAN_COMMIT to make sure that FITRIM
> ioctl gets the "second soft ENOSPC".

Yeah, OK.

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1500003.6KLlEZv6lY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRGhyIACgkQxUKljSIMAnCXNgEAh/VtUv4FN5ItKg9nf4er2KZD
TNniN5stK1HPChfFlEsBAKN5ClSauJgO+OK/KRkYU8vGRRutOZWasz/lNXNyoik+
=O7Er
-----END PGP SIGNATURE-----

--nextPart1500003.6KLlEZv6lY--

