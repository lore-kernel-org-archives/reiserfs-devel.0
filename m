From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv2 0/3] reiser4: discard support: perform discard before all deallocations.
Date: Fri, 01 Aug 2014 02:06:31 +0400
Message-ID: <2591358.BvzLLDQF7r@intelfx-laptop>
References: <1405966771-12575-1-git-send-email-intelfx100@gmail.com> <6214930.f2LU7SrKWL@intelfx-laptop> <53DAB521.4090902@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2308758.COULkcVomL"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=pPOMKr17bRKsJi2ItX1MuBA5185i9wGXqKg5+E/3/JI=;
        b=ptEvGCG0bHlLLXxQY+FGfFL0iiCgfSzPSgElxLMF5ku15N+DLjVUjP84rLzAvbN/Cu
         GaRs02HjABbnUhCfALahIqQzq349+moDdd3a7ch4gadv5z3Gix96aj9dpdupB6kCioji
         3b3y90ObQ0ed3ZYEfJvt44rcLeHPAXYOChbS1W6/rfuoT/8j+36nsezIufG7ATANYjug
         5bK4oa/SDYrkCDsZtlBTflLqKgvFBvK1kEXNiLuRj5S0+bld8f0QFiB4VI4YeMkBEHYF
         2n3TqRrdZPdKD+zgnuATPOEaIli11I0A5jz+83MY6ibIunBCjoX+lffdfeyGMqOUf7fP
         REMg==
In-Reply-To: <53DAB521.4090902@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart2308758.COULkcVomL
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Thursday 31 July 2014 at 23:29:05, Edward Shishkin wrote:=09
>=20
> On 07/29/2014 11:29 AM, Ivan Shapovalov wrote:
> > On Monday 28 July 2014 at 13:46:01, Edward Shishkin wrote:=09
> >> Thanks, looks OK (I haven't tested it yet though..)
> >>
> >> I suggest to release a version without garbage collection for now
> >> (just pass the sorted and merged extents to blkdev_issue_discard).=

> > Yeah, seems reasonable.
> > I'll submit v7 of "initial implementation" shortly with simplified =
discard_extent(),
> > then we could apply two patchsets and that'll be it.
> >
> > ----
> > Regarding the "ideal" solution
>=20
>=20
> BTW, do we need this "ideal solution" at all?
> For example, my SSD Samsung 840 EVO shows erase_unit =3D 512 bytes,
> and alignment =3D 0. It means that in my case everything will be disc=
arded
> in the best form with the simplified discard_extent().
>=20
> I am not lazy, just want to make sure we do useful work :)
> May be it makes sense to perform a small investigation of the SSD mar=
ket
> first?

Erase unit can't be 512 bytes. Well, it can, but this is _highly_ unlik=
ely...
(byte < page < block; writes are per-page, erases are per-block, and
minimal common page size is 512 bytes)

Try to check with `hdparm -I /dev/sdX | grep TRIM`, or, even better, pi=
ck an
unused sector, write something to it and try to discard it using
`hdparm --trim-sector-ranges`, then check the sector's contents.

>=20
>=20
> > ----
> >
> > It seems that reiser4_alloc_blocks() can't be told to "allocate thi=
s exact
> > count of blocks or fail". It allocates any number of blocks from 1 =
to needed,
> > and actual count is returned in *len.
> >
> > Is it better to add an "exact" flag to reiser4_blocknr_hint or to a=
dd an
> > "allocate" flag to reiser4_check_blocks()?
>=20
>=20
> Let's decide what we want from check_blocks().
>=20
> When (discard_offset % block_size !=3D 0) we'll always need (even in =
the
> case of empty headp (tailp) to check the left (right) neighbor block =
of
> the extent. If it is busy, then we'll need to reduce alen (alen -=3D =
d_uni)
> because of the "shift".
>=20
> It means that we want check_blocks() to do the following:
> . go leftward (rightward) and allocate not more than @count continuou=
s
> free blocks;
> . return actual number of allocated blocks.
>=20
> It seems that currently we don't have suitable primitives in our spac=
e
> allocator. I prefer to not modify existing ones and write a new primi=
tive.

Yeah, after another glance through bitmap code this seems to be the cle=
anest
way. The alloc_blocks_{forward,backward}_bitmap() functions simply conv=
ert the
hint to an "internal representation" (search start/end, length min/max)=
 and
call bitmap_alloc_{forward,backward}().

I'd write something like alloc_blocks_*_exact_bitmap(start, min_len, ma=
x_len)
eventually calling into the same bitmap_alloc_*() functions. They also =
can be
reused in the batch discard code (if we decide to implement it). OK?

>=20
> Edward.


Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart2308758.COULkcVomL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPavecACgkQxUKljSIMAnC21gEA3gKP6eGGCllb6OS1D/jyDmGH
Yl405X9yO1nBTmqraf8BAMzPfoKWO9WdzWNgcvDiQjtxkYtkcx4HhsXKFwYS60qC
=6At3
-----END PGP SIGNATURE-----

--nextPart2308758.COULkcVomL--

