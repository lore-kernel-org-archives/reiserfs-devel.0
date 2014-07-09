From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using linked lists.
Date: Wed, 09 Jul 2014 16:40:11 +0400
Message-ID: <2011776.QNB5kWXL2t@intelfx-laptop>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <1403434126-6390-4-git-send-email-intelfx100@gmail.com> <53B9E01D.10503@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1412443.Ju37LcYbpy"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=4X/SBPAJ2wUJQ1vDzr++o2IZMc7lFJzazFZit44uui4=;
        b=O4vrz4h8vf2z+Erb8u7qrR9f+iSYcl4JnUej4wU3ZMPTsr44pok3pbEMV0F5SbQLK9
         AMUyVGA2hr992ka7yOfGKN4vFS4oAkplvpchYOK85iivEoeZBocFQylWbyEfvbKRrPd6
         S9pVUSrv32FbmxrH80TxezEjb7yhoxiVlBQNupkb8lB7Jqwr1kcHVTZpNFdEngvtthbn
         X6IX1kjY/plQaJhnajHf8m06rt/nU4wU431/59BekBjGLzBtizzAXI4uBIPNne0zwYef
         zSyBYwac3s7EVODOFzjJKU0SeiQzjpRpt8Jhaq7EornQdEd69JeKTkh+0sOjWVXKdI0k
         fTlA==
In-Reply-To: <53B9E01D.10503@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1412443.Ju37LcYbpy
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 07 July 2014 at 01:47:41, Edward Shishkin wrote:=09
>=20
> On 06/22/2014 12:48 PM, Ivan Shapovalov wrote:
> [...]
> > +++ b/fs/reiser4/discard.c
> > @@ -0,0 +1,216 @@
> > +/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed b=
y
> > + * reiser4/README */
> > +
> > +/* TRIM/discard interoperation subsystem for reiser4. */
> > +
> > +/*
> > + * This subsystem is responsible for populating an atom's ->discar=
d_set and
> > + * (later) converting it into a series of discard calls to the ker=
nel.
> > + *
> > + * The discard is an in-kernel interface for notifying the storage=

> > + * hardware about blocks that are being logically freed by the fil=
esystem.
> > + * This is done via calling the blkdev_issue_discard() function. T=
here are
> > + * restrictions on block ranges: they should constitute at least o=
ne erase unit
> > + * in length and be correspondingly aligned. Otherwise a discard r=
equest will
> > + * be ignored.
> > + *
> > + * The erase unit size is kept in struct queue_limits as discard_g=
ranularity.
> > + * The offset from the partition start to the first erase unit is =
kept in
> > + * struct queue_limits as discard_alignment.
> > + *
> > + * At atom level, we record numbers of all blocks that happen to b=
e deallocated
> > + * during the transaction. Then we read the generated set, filter =
out any blocks
> > + * that have since been allocated again and issue discards for eve=
rything still
> > + * valid. This is what discard.[ch] is here for.
> > + *
> > + * However, simply iterating through the recorded extents is not e=
nough:
>=20
>=20
> I still don't understand this explanation..

In short: we need to "screen" those extents to check whether they are s=
till
free.

>=20
>=20
> > + * - if a single extent is smaller than the erase unit, then this =
particular
> > + *   extent won't be discarded even if it is surrounded by enough =
free blocks
> > + *   to constitute a whole erase unit;
>=20
>=20
> Why not to discard the aligned and padded extent, which coincides
> with the whole erase unit?

With a number of whole erase units.

>=20
>=20
> > + * - we won't be able to merge small adjacent extents forming an e=
xtent long
> > + *   enough to be discarded.
>=20
>=20
> At this point we have already sorted and merged everything.
> So may be it makes sense just to check the head and tail of every res=
ulted
> extent and discard the aligned and padded one?

"Head and tail" is not sufficient. We may check the whole extent with a=
 single
bitmap request, but such algorithm will be very inefficient: it will mi=
ss many
possibilities for discarding.

Consider many-block extent, from which one block has been allocated aga=
in.
In this case we miss (all-1) blocks to be discarded (if granularity =3D=
 1 block).

>=20
> Please, consider such possibility. Iterating over erase units in=20
> discard_extent()
> looks suboptimal.

Yes, it's costly... but I don't see any other ways to do the task effic=
iently.

=2D-=20
Ivan Shapovalov / intelfx /

>=20
> Thanks,
> Edward.
--nextPart1412443.Ju37LcYbpy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlO9ODAACgkQxUKljSIMAnAHswD+P94l8lu+2BeEsXQdL5LVHsWi
nm5okO7cXUK/TdR3+e4A/1MBZ4iS15YsxxgvKFy4//Pzhwer8Qb3xUTOXTjnLJ1Z
=VgHS
-----END PGP SIGNATURE-----

--nextPart1412443.Ju37LcYbpy--

