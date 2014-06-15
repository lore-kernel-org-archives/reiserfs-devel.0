From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Mon, 16 Jun 2014 01:58:26 +0400
Message-ID: <1848882.0DacExnpE3@intelfx-laptop>
References: <3401431.jj87z7i0xD@intelfx-laptop> <1427799.NLW5IsuhQY@intelfx-laptop> <539E1507.4070503@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1775253.GBhA88PEUJ"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=ilWVfFcweUBhhuBrYg9kItTEHOEjq4n2Wq5dS2Zo0lE=;
        b=Oy4FvF43tdHZ5NbjM1XFv1pK/qVjkib6HoR2OZa4qfmd94x+nmaOXglxY3zJ2oDpqu
         yYXLZV49U30/tMn/fmh+EhV4A4ZKZpRdf9U/rp8Ow8iIJJsazY+Z1DZ9XjxlOmGRCbEC
         7oYn2OS2VD/9FMwju12PywRDettYOZ4ww42aKHhVfgJu+ye0V56iaQZurhWQulaHNIVS
         Ayq80T0hY3yKaISSUqIRAuWXlxF87hQPUggaXT3uysx90/J7dX9T0avJvJW+LHtlYkdp
         snLH1jI18DLsvRnKt808R2DC0OIojgaaWjDaohEWlh+swX3BGOq+kytaDLoWaZd6n0Wa
         rCjQ==
In-Reply-To: <539E1507.4070503@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1775253.GBhA88PEUJ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Sunday 15 June 2014 at 23:49:59, Edward Shishkin wrote:=09
>=20
> On 06/15/2014 08:07 PM, Ivan Shapovalov wrote:
> > On Sunday 15 June 2014 at 19:36:05, Edward Shishkin wrote:=09
> >> On 06/13/2014 10:28 PM, Ivan Shapovalov wrote:
> >>> Here is my "analysis" of what happens in reiser4 during a transac=
tion's
> >>> lifetime wrt. block allocation and deallocation.
> >>>
> >>>
> >>> THE EFFECTS (SEMANTICS) OF RELATED FUNCTIONS
> >>> reiser4_alloc_blocks_bitmap(): allocates in WORKING BITMAP
> >> Yes.
> >>
> >>> reiser4_dealloc_blocks_bitmap(!BA_DEFER): deallocates from WORKIN=
G BITMAP
> >>> reiser4_dealloc_blocks_bitmap(BA_DEFER): stores to ->delete_set
> >> This is correct for the middle-level allocator (without suffix "bi=
tmap").
> >> The low-level one frees blocks only in WORKING BITMAP.
> > Yes, this was a wording mistake. I've noticed it shortly after send=
ing...
> >
> >>> reiser4_pre_commit_hook_bitmap(): allocates all relocated nodes i=
n COMMIT BITMAP
> >> "Relocated" is bad term here: nodes with new data also get the fla=
g
> >> JNODE_RELOC. So, I would rather say, that it applies freshly alloc=
ated
> >> nodes of the atom to COMMIT BITMAP.
> >>
> >>
> >>>                                     deallocates ->delete_set from=
 COMMIT BITMAP
> >> applies the atom's delete_set to COMMIT BITMAP
> > I've meant exactly this.
> >
> >>> reiser4_post_commit_hook(): deallocates ->delete_set using !BA_DE=
FER
> >>>                                                      (i. e. from =
WORKING BITMAP)
> >> applies the atom's delete_set to WORKING BITMAP.
> > ditto
> >
> >> I would also mention a function of the middle-level block allocato=
r
> >> reiser4_alloc_blocks(): allocates blocks in WORKING  BITMAP.
> > Yes, sure.
> >
> >
> >> Note that the middle-level block allocator (block_alloc.c) actuall=
y
> >> manipulates
> >> with abstract space maps. Currently in reiser4 they are represente=
d only by
> >> bitmaps (plugin/space/bitmap.c). We can also implement another
> >> representation -
> >> extent tree (like in XFS). I don't see any needs for now, though.
> > Extent trees seem to be interesting.. They claim that they are more=
 efficient -
> > is the difference that huge?
> >
> >>> TIMELINE OF ALLOCATIONS FOR "USUAL" NODES, AND TIMELINE OF TRANSA=
CTION COMMIT
> >>> - nodes are allocated using reiser4_alloc_blocks() and setting JN=
ODE_RELOC,
> >>>     so WORKING BITMAP ensures that two nodes cannot get the same =
block;
> >>> - nodes are deallocated using reiser4_dealloc_blocks(BA_DEFER),
> >>>     so their deallocation is not immediately reflected in WORKING=
 BITMAP;
> >>> (the relocate set is written here)
> >>> - reiser4_pre_commit_hook_bitmap() uses 1) JNODE_RELOC flag and 2=
) ->delete_set
> >>>     to convey effective bitmap changes into COMMIT BITMAP;
> >>> (the journal and overwrite set are written here)
> >>> - reiser4_post_commit_hook() uses ->delete_set to convey dealloca=
tions
> >>>     from step 2 to WORKING BITMAP.
> >>> (the discard happens here)
> >>>
> >>>
> >>> TIMELINE OF ALLOCATIONS FOR WANDERED JOURNAL BLOCKS
> >>> - at commit time, blocks are allocated using reiser4_alloc_blocks=
(), so they
> >>>     are allocated in WORKING BITMAP and do not interfere with any=
 "usual" blocks;
> >>> - after writing wandered blocks, they are deallocated using
> >>>     reiser4_dealloc_blocks(!BA_DEFER), i. e. from the WORKING BIT=
MAP.
> >>
> >> So, the system of working and commit bitmaps plus the delete set s=
eems
> >> to be redundant? I think this is because of performance reasons: b=
lock
> >> allocation is critical thing...
> > Seems like it is -- for performance and simplicity (=3D=3D robustne=
ss).
> >
> >>> CONCLUSION
> >>> At possible transaction replay time, journal blocks are not alloc=
ated in any
> >>> of the bitmaps. However, because the journal is read and replayed=
 before a
> >>> transaction has a chance to commit, this fact does not matter.
> >>> What matters is that wandered journal blocks never hit COMMIT BIT=
MAP.
> >>>
> >>> So, if I've got all this correct (which I highly doubt), the disk=
 space leak
> >>> (as you pointed it out) does not exist.
> >> It seems, you are right..
> >>
> >>> What exists is a rather different problem with my idea of "log ev=
ery
> >>> deallocated block". Current implementation logs every block regar=
dless of
> >>> BA_DEFER flag presence or absence, so non-wandered blocks are log=
ged twice.
> >>>
> >>> We could just use ->delete_set, but we would lose wandered blocks=
 then.
> >>> Or we could only log !BA_DEFER requests, which would do the right=
 thing
> >>> (wandered blocks + deallocations from reiser4_post_commit_hook())=
, but
> >>> the reasoning behind this decision would not be obvious for a cas=
ual
> >>> code reader.
> >> I think that a good comment will save the situation..
> >>
> >>> Or we could log only wandered blocks (in addition to ->delete_set=
)
> >>> at discard time, but this is messy and requires us to merge the d=
iscard log
> >>> with ->delete_set at discard time.
> >> what is the difference with the previous "we could.."?
> > The previous option is to log all !BA_DEFER requests in addition to=

> > ->delete_set, so those two block sets would be partially overlappin=
g.
>=20
>=20
> Hmm.. Are they really overlapped?
>=20
> reiser4_dealloc_blocks() looks like the following:
> {
> if (flags & BA_DEFER)
>          log in the delete_set;
> else
>          deallocate in working bitmap
> ...
> }
>=20
> so (!BA_DEFER) requests and the delete_set look disjoint,
> or, I missed something?

You're right, I've misread the code. I was under impression that
reiser4_post_commit_hook() internally calls reiser4_dealloc_blocks(!BA_=
DEFER).

So the second option (which I prefer) is to log all sa_dealloc_blocks()=
 calls.
That is, effectively, ->delete_set plus wandered journal block dealloca=
tions.

> > And this option is to log only those !BA_DEFER requests which are n=
ot in
> > ->delete_set, so no block will be stored twice. Thus we will have t=
o consider
> > both ->delete_set and this hypothetical ->discard_set at discard ti=
me.
> >
> >>> Or we could log wandered blocks straight into ->delete_set and do=
 something in
> >>> reiser4_post_commit_hook() to separate these entries, but this is=
 super messy.
> >>>
> >>> I'm preferring the second way... Edward, please proof-read all th=
is.
> >> BTW, what about your current implementation? Does it work for you?=

> > Yes, it apparently does (no massive corruptions).
> >
> > I get batches of "orphan cluster" errors from time to time (from of=
fset 0 till
> > the supposed end of file),
>=20
>=20
> this is fsck complaints?

Yes. (I do `fsck.reiser4 --build-fs` pretty routinely...)

> >   but 1) I do not see which files get corrupted,
> > 2) this could be due to txmod=3Dwa, 3) my machine is pretty crashy =
now due to
> > some driver issues, so I don't know what exactly causes this.
> >
> > Thanks for proof-reading. What do you think about all this?
>=20
>=20
> I think that not bad for the beginning! I have purchased an SSD card,=

> hope to test the discard stuff in the near future.

And I hope to finish this feature somewhen... :)

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /

>=20
> Thanks,
> Edward.

--nextPart1775253.GBhA88PEUJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOeFwcACgkQxUKljSIMAnCl7wEAlbvQjUsdNADp820Tl4EkhT1t
MDPR9/pVQPjz1sFI3E4A/jT7eANn0FZwzu/ZxWDD9Zhh2ODOg4xf00uXhsUa9xeg
=5G4s
-----END PGP SIGNATURE-----

--nextPart1775253.GBhA88PEUJ--

