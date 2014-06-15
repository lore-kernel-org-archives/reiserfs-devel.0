From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Sun, 15 Jun 2014 22:07:40 +0400
Message-ID: <1427799.NLW5IsuhQY@intelfx-laptop>
References: <3401431.jj87z7i0xD@intelfx-laptop> <539DD985.4010304@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1446848.R3uV9ClYHL"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=UCAKtBYdk5b2XsEELGSuStM+B3mNNBt4cNQ/PUGPfew=;
        b=w4FjXxOckKnGZLoIveVtCcNL4xwK2MDuxsdWhCDSdPDTtQZOINbtR1cjCxO1/1MTWk
         Kd6JFluQDICiUshO85cxMaRsveUesll+mW8vSRAa5Pd8oi1oNQL+hyLWP8jzDED2zMYc
         HpMUEv1DshGRKY7MLxTqY4yfs+mOOFVwqPw/GHrHze0T7uQD4frLZ0oZQlbhgU2qKqXi
         1igknZz0+9m2m1u3KTpnXZVK1YwlJu5P4R6r9Xe6ILN2u7oN992g+Wpm1NGtnIR80/Z3
         LnOfz+0EtGmZEa1zxiVwuXVh2WWgZzXJi0BULt5aYE8OVY6/wmoAtH3QRpB0FfhAWhlv
         iNgQ==
In-Reply-To: <539DD985.4010304@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1446848.R3uV9ClYHL
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Sunday 15 June 2014 at 19:36:05, Edward Shishkin wrote:=09
> On 06/13/2014 10:28 PM, Ivan Shapovalov wrote:
> > Here is my "analysis" of what happens in reiser4 during a transacti=
on's
> > lifetime wrt. block allocation and deallocation.
> >
> >
> > THE EFFECTS (SEMANTICS) OF RELATED FUNCTIONS
> > reiser4_alloc_blocks_bitmap(): allocates in WORKING BITMAP
>=20
> Yes.
>=20
> > reiser4_dealloc_blocks_bitmap(!BA_DEFER): deallocates from WORKING =
BITMAP
> > reiser4_dealloc_blocks_bitmap(BA_DEFER): stores to ->delete_set
>=20
> This is correct for the middle-level allocator (without suffix "bitma=
p").
> The low-level one frees blocks only in WORKING BITMAP.

Yes, this was a wording mistake. I've noticed it shortly after sending.=
..

> > reiser4_pre_commit_hook_bitmap(): allocates all relocated nodes in =
COMMIT BITMAP
>=20
> "Relocated" is bad term here: nodes with new data also get the flag
> JNODE_RELOC. So, I would rather say, that it applies freshly allocate=
d
> nodes of the atom to COMMIT BITMAP.
>=20
>=20
> >                                    deallocates ->delete_set from CO=
MMIT BITMAP
>=20
> applies the atom's delete_set to COMMIT BITMAP

I've meant exactly this.

> > reiser4_post_commit_hook(): deallocates ->delete_set using !BA_DEFE=
R
> >                                                     (i. e. from WOR=
KING BITMAP)
>=20
> applies the atom's delete_set to WORKING BITMAP.

ditto

> I would also mention a function of the middle-level block allocator
> reiser4_alloc_blocks(): allocates blocks in WORKING  BITMAP.

Yes, sure.


> Note that the middle-level block allocator (block_alloc.c) actually=20=

> manipulates
> with abstract space maps. Currently in reiser4 they are represented o=
nly by
> bitmaps (plugin/space/bitmap.c). We can also implement another=20
> representation -
> extent tree (like in XFS). I don't see any needs for now, though.

Extent trees seem to be interesting.. They claim that they are more eff=
icient -
is the difference that huge?

> > TIMELINE OF ALLOCATIONS FOR "USUAL" NODES, AND TIMELINE OF TRANSACT=
ION COMMIT
> > - nodes are allocated using reiser4_alloc_blocks() and setting JNOD=
E_RELOC,
> >    so WORKING BITMAP ensures that two nodes cannot get the same blo=
ck;
> > - nodes are deallocated using reiser4_dealloc_blocks(BA_DEFER),
> >    so their deallocation is not immediately reflected in WORKING BI=
TMAP;
> > (the relocate set is written here)
> > - reiser4_pre_commit_hook_bitmap() uses 1) JNODE_RELOC flag and 2) =
=2D>delete_set
> >    to convey effective bitmap changes into COMMIT BITMAP;
> > (the journal and overwrite set are written here)
> > - reiser4_post_commit_hook() uses ->delete_set to convey deallocati=
ons
> >    from step 2 to WORKING BITMAP.
> > (the discard happens here)
> >
> >
> > TIMELINE OF ALLOCATIONS FOR WANDERED JOURNAL BLOCKS
> > - at commit time, blocks are allocated using reiser4_alloc_blocks()=
, so they
> >    are allocated in WORKING BITMAP and do not interfere with any "u=
sual" blocks;
> > - after writing wandered blocks, they are deallocated using
> >    reiser4_dealloc_blocks(!BA_DEFER), i. e. from the WORKING BITMAP=
.
>=20
>=20
> So, the system of working and commit bitmaps plus the delete set seem=
s
> to be redundant? I think this is because of performance reasons: bloc=
k
> allocation is critical thing...

Seems like it is -- for performance and simplicity (=3D=3D robustness).=


> > CONCLUSION
> > At possible transaction replay time, journal blocks are not allocat=
ed in any
> > of the bitmaps. However, because the journal is read and replayed b=
efore a
> > transaction has a chance to commit, this fact does not matter.
> > What matters is that wandered journal blocks never hit COMMIT BITMA=
P.
> >
> > So, if I've got all this correct (which I highly doubt), the disk s=
pace leak
> > (as you pointed it out) does not exist.
>=20
> It seems, you are right..
>=20
> >
> > What exists is a rather different problem with my idea of "log ever=
y
> > deallocated block". Current implementation logs every block regardl=
ess of
> > BA_DEFER flag presence or absence, so non-wandered blocks are logge=
d twice.
> >
> > We could just use ->delete_set, but we would lose wandered blocks t=
hen.
> > Or we could only log !BA_DEFER requests, which would do the right t=
hing
> > (wandered blocks + deallocations from reiser4_post_commit_hook()), =
but
> > the reasoning behind this decision would not be obvious for a casua=
l
> > code reader.
>=20
> I think that a good comment will save the situation..
>=20
> > Or we could log only wandered blocks (in addition to ->delete_set)
> > at discard time, but this is messy and requires us to merge the dis=
card log
> > with ->delete_set at discard time.
>=20
> what is the difference with the previous "we could.."?

The previous option is to log all !BA_DEFER requests in addition to
=2D>delete_set, so those two block sets would be partially overlapping.

And this option is to log only those !BA_DEFER requests which are not i=
n
=2D>delete_set, so no block will be stored twice. Thus we will have to co=
nsider
both ->delete_set and this hypothetical ->discard_set at discard time.

> > Or we could log wandered blocks straight into ->delete_set and do s=
omething in
> > reiser4_post_commit_hook() to separate these entries, but this is s=
uper messy.
> >
> > I'm preferring the second way... Edward, please proof-read all this=
.
>=20
> BTW, what about your current implementation? Does it work for you?

Yes, it apparently does (no massive corruptions).

I get batches of "orphan cluster" errors from time to time (from offset=
 0 till
the supposed end of file), but 1) I do not see which files get corrupte=
d,
2) this could be due to txmod=3Dwa, 3) my machine is pretty crashy now =
due to
some driver issues, so I don't know what exactly causes this.

Thanks for proof-reading. What do you think about all this?

=2D-=20
Ivan Shapovalov / intelfx /

>=20
> Thanks,
> Edward.
--nextPart1446848.R3uV9ClYHL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOd4PEACgkQxUKljSIMAnCyZAD/V2cqDfwwvQfW5KBOAslnpBRQ
jLE8TIU/Sq7Gppt4W9oBAON1AFeaHJw12ZsZ9NCgSvNT1xEZT/F1dqH71ViNFUxU
=f88u
-----END PGP SIGNATURE-----

--nextPart1446848.R3uV9ClYHL--

