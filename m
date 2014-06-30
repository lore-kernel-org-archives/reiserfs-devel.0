From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard implementation, part 2: FITRIM ioctl aka batch mode
Date: Mon, 30 Jun 2014 17:24:09 +0400
Message-ID: <4560396.zXPdZqCS3Y@intelfx-laptop>
References: <1706370.uJ3CLsN3j1@intelfx-laptop> <53B155D5.4070700@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5529607.2Tzy2aIy0c"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=2eegUAmNNPjCvuHcdov1984tGV1oRBlsjXidPIFKhyY=;
        b=M1gUANzNWiUJY0pE8mMUOVFNvXywqUHXr98eCZCRQJGze2Bs8jIB35RF7N64euzpEG
         Jnj78/xb9Bu02yPVKn3Fvsyt02zdCDOolzG0/0sgtJ/GYeI01RaI9orkXQSLRqvrRPKG
         gWTFlW5NtfySm6TAMMrCPEWnMqsYTfX81e5FjUfwTWLPLaNLblvArA5ZGD5fRuoI8x+h
         PVQVNaOhwXb905pjcyDLz0t6cZObSNSXY4/fD2aUQZXXUDXMXQT7IOGRhJ4VGdy8sTTr
         wTNjGShBU7Nnr77FbEKiyNl8ciRhmU5Y4TS8fRBqp4NfhlnrghZV7v3W9ImDyfKHT1qW
         YD9A==
In-Reply-To: <53B155D5.4070700@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart5529607.2Tzy2aIy0c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 30 June 2014 at 14:19:33, Edward Shishkin wrote:=09
> Hi Ivan,
>=20
> I think that everything should be quite simple.
>=20
> Let the FITRIM ioctl spawn a process, which scans all the bitmap bloc=
ks
> and puts the free-space-extents to the deferred delete_set. At the sa=
me
> time, we mark them as "busy" in the WORKING bitmap to make sure that
> nobody will touch them (the post_commit_hook will make them clean
> again). Basically, that's all: our transaction manager and the discar=
d
> code will do all the other work :)

As I've stated, I'm afraid that it will be very inoptimal. The current
algorithm used for "real-time" discard is not suited for discarding
big chunks of known free space: it verifies each discard unit by
querying the bitmap. (This is even worse as current implementation
is simplified to do one bitmap query per each discard unit, not checkin=
g
if a bitmap block is bigger than a discard unit, thus it can result
in doing multiple bitmap queries for the same block.)

However, we can add a per-transaction flag "batch mode discard" which c=
hanges
the discard algorithm to something suitable for this scenario.
If this "discard transaction" can be merged with usual ones, we still
need to verify all extents... But it can be done not so thoroughly.
=2D do one bitmap query per each recorded extent
=2D if OK, then discard
=2D if not, just skip the whole extent

>=20
> Details
>=20
> First, the trim process reads up a bitmap node and puts it to the
> transaction (see try_capture() and friends). Then we go from left to

Hm, bitmap nodes are never captured by current code, so won't this effe=
ctively
be a no-op?

> right in the region of blocks covered by the bitmap node and handle
> the "free extents". In every such iteration we lock the bitmap node,
> locate the free extent, mark it dirty in the WORKING bitmap, put the
> respective entry to the deferred delete_set and unlock the bitmap nod=
e.

This can be done on allocator level by adding an "iterate free space"
interface method...

>=20
> NOTE that commit of atoms spawned by the trim process will be unusual=
:
> no dirty jnodes, hence, no flush, no IOs (as RELOCATE and OVERWRITE
> sets are empty). Only issuing discard requests.. Of course, this is
> only in the case when other processes spawning dirty jnodes didn't
> join our atom (they can do it perfectly, as we lock bitmaps only per =
a
> free extent handling).

Again, bitmap nodes are not captured by current code. Is it critical th=
at we
fuse with anything modifying the bitmaps?

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /

>=20
> There can be potential problems around the "unusual" commits (false
> positives in the debugging code, etc.), but I hope they are minor..
>=20
> Thanks,
> Edward.
>=20
>=20
> On 06/30/2014 11:35 AM, Ivan Shapovalov wrote:
> > Hi,
> >
> > I've started to think about implementing the second part of discard=
 support,
> > namely "batch mode" (FITRIM ioctl). And it seems like I don't yet q=
uite
> > understand how to do it.
> >
> > It had been suggested to reuse existing transaction and discard mac=
hinery for
> > this feature: create a transaction, allocate+deallocate all possibl=
e blocks
> > and then force-commit it.
> >
> > However, the algorithms of discard_atom() are very inoptimal for di=
scarding
> > large amounts of known free space -- a bitmap check is performed fo=
r every
> > single discard unit. Repeatedly calling reiser4_alloc_blocks() to a=
llocate
> > every possible block also seems inefficient. And this will still mi=
ss those
> > 10% of reserved space, IIUC.
> >
> > So the best way I can imagine is to introduce a new space allocator=
 method,
> > "iterate free space", and discard all reported extents (blkdev_issu=
e_discard()
> > will take care of aligning them properly).
> >
> > With such method, a question arises: how to prevent bitmap modifica=
tions
> > and disk writes to free space when such iteration is in progress?
> >
> > Thanks,
> 
--nextPart5529607.2Tzy2aIy0c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOxZPkACgkQxUKljSIMAnDkOQD+JdNT5aHsaXsI3TC2nvsm5B6y
+5HltauQWEJhyHPk4P4BANYvf/SM0/ISCXOvuDiAVD6Th/ez6HQqkvet+XULuNGp
=31gN
-----END PGP SIGNATURE-----

--nextPart5529607.2Tzy2aIy0c--

