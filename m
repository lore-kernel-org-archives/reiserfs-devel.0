From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Mon, 16 Jun 2014 15:00:52 +0400
Message-ID: <45271088.MxWDMbZH2T@intelfx-laptop>
References: <3401431.jj87z7i0xD@intelfx-laptop> <1867805.hmMaC7j7al@intelfx-laptop> <539EB7D7.8020407@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2575785.KdZSbHTvW6"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=U2r3l05f+w7fPWZRvyVeI0+3qLVNmx+mwrg63ozP0Zg=;
        b=NtnG+IgAHstaZ+2MJaLMT1zJxwOeO7eNeHSPPvVCnYLhKAW+WIsbfJRE4J1kY6naFX
         b3Pp8PEvNntzb9TnEfyoio7iheEoWQKvZGPD6Qi/y59jKaoYsFZQ5etv3UODzMZPB4Pf
         lyxlvuvxH6JLOT4Gs1xCL8lVHAuJB4l5k7TEdWxY4+WlR3EiYFM5nizEDOejweDEtG3E
         XM+X8UyhUf74OJqMseqSNtwYFUIaYglziCMV1p/aMfvuvTxdOs6UfWz50uUbchydOk+9
         nTiJGmZYRaXKPYtBuRpUiTejV6LRMUydt+3ny4BHCHi0mGA+kCvrEwm264fXcGWcbFN+
         5uNA==
In-Reply-To: <539EB7D7.8020407@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart2575785.KdZSbHTvW6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 16 June 2014 at 11:24:39, Edward Shishkin wrote:=09
>=20
> On 06/16/2014 07:03 AM, Ivan Shapovalov wrote:
> > On Monday 16 June 2014 at 02:14:49, Edward Shishkin wrote:=09
> >> On 06/15/2014 11:58 PM, Ivan Shapovalov wrote:
> >>> On Sunday 15 June 2014 at 23:49:59, Edward Shishkin wrote:=09
> >>>> On 06/15/2014 08:07 PM, Ivan Shapovalov wrote:
> >>>>> On Sunday 15 June 2014 at 19:36:05, Edward Shishkin wrote:=09
> >>>>>> On 06/13/2014 10:28 PM, Ivan Shapovalov wrote:
> >>>>>>> Here is my "analysis" of what happens in reiser4 during a tra=
nsaction's
> >>>>>>> lifetime wrt. block allocation and deallocation.
> >>>>>>>
> >>>>>>>
> >>>>>>> THE EFFECTS (SEMANTICS) OF RELATED FUNCTIONS
> >>>>>>> reiser4_alloc_blocks_bitmap(): allocates in WORKING BITMAP
> >>>>>> Yes.
> >>>>>>
> >>>>>>> reiser4_dealloc_blocks_bitmap(!BA_DEFER): deallocates from WO=
RKING BITMAP
> >>>>>>> reiser4_dealloc_blocks_bitmap(BA_DEFER): stores to ->delete_s=
et
> >>>>>> This is correct for the middle-level allocator (without suffix=
 "bitmap").
> >>>>>> The low-level one frees blocks only in WORKING BITMAP.
> >>>>> Yes, this was a wording mistake. I've noticed it shortly after =
sending...
> >>>>>
> >>>>>>> reiser4_pre_commit_hook_bitmap(): allocates all relocated nod=
es in COMMIT BITMAP
> >>>>>> "Relocated" is bad term here: nodes with new data also get the=
 flag
> >>>>>> JNODE_RELOC. So, I would rather say, that it applies freshly a=
llocated
> >>>>>> nodes of the atom to COMMIT BITMAP.
> >>>>>>
> >>>>>>
> >>>>>>>                                       deallocates ->delete_se=
t from COMMIT BITMAP
> >>>>>> applies the atom's delete_set to COMMIT BITMAP
> >>>>> I've meant exactly this.
> >>>>>
> >>>>>>> reiser4_post_commit_hook(): deallocates ->delete_set using !B=
A_DEFER
> >>>>>>>                                                        (i. e.=
 from WORKING BITMAP)
> >>>>>> applies the atom's delete_set to WORKING BITMAP.
> >>>>> ditto
> >>>>>
> >>>>>> I would also mention a function of the middle-level block allo=
cator
> >>>>>> reiser4_alloc_blocks(): allocates blocks in WORKING  BITMAP.
> >>>>> Yes, sure.
> >>>>>
> >>>>>
> >>>>>> Note that the middle-level block allocator (block_alloc.c) act=
ually
> >>>>>> manipulates
> >>>>>> with abstract space maps. Currently in reiser4 they are repres=
ented only by
> >>>>>> bitmaps (plugin/space/bitmap.c). We can also implement another=

> >>>>>> representation -
> >>>>>> extent tree (like in XFS). I don't see any needs for now, thou=
gh.
> >>>>> Extent trees seem to be interesting.. They claim that they are =
more efficient -
> >>>>> is the difference that huge?
> >>>>>
> >>>>>>> TIMELINE OF ALLOCATIONS FOR "USUAL" NODES, AND TIMELINE OF TR=
ANSACTION COMMIT
> >>>>>>> - nodes are allocated using reiser4_alloc_blocks() and settin=
g JNODE_RELOC,
> >>>>>>>       so WORKING BITMAP ensures that two nodes cannot get the=
 same block;
> >>>>>>> - nodes are deallocated using reiser4_dealloc_blocks(BA_DEFER=
),
> >>>>>>>       so their deallocation is not immediately reflected in W=
ORKING BITMAP;
> >>>>>>> (the relocate set is written here)
> >>>>>>> - reiser4_pre_commit_hook_bitmap() uses 1) JNODE_RELOC flag a=
nd 2) ->delete_set
> >>>>>>>       to convey effective bitmap changes into COMMIT BITMAP;
> >>>>>>> (the journal and overwrite set are written here)
> >>>>>>> - reiser4_post_commit_hook() uses ->delete_set to convey deal=
locations
> >>>>>>>       from step 2 to WORKING BITMAP.
> >>>>>>> (the discard happens here)
> >>>>>>>
> >>>>>>>
> >>>>>>> TIMELINE OF ALLOCATIONS FOR WANDERED JOURNAL BLOCKS
> >>>>>>> - at commit time, blocks are allocated using reiser4_alloc_bl=
ocks(), so they
> >>>>>>>       are allocated in WORKING BITMAP and do not interfere wi=
th any "usual" blocks;
> >>>>>>> - after writing wandered blocks, they are deallocated using
> >>>>>>>       reiser4_dealloc_blocks(!BA_DEFER), i. e. from the WORKI=
NG BITMAP.
> >>>>>> So, the system of working and commit bitmaps plus the delete s=
et seems
> >>>>>> to be redundant? I think this is because of performance reason=
s: block
> >>>>>> allocation is critical thing...
> >>>>> Seems like it is -- for performance and simplicity (=3D=3D robu=
stness).
> >>>>>
> >>>>>>> CONCLUSION
> >>>>>>> At possible transaction replay time, journal blocks are not a=
llocated in any
> >>>>>>> of the bitmaps. However, because the journal is read and repl=
ayed before a
> >>>>>>> transaction has a chance to commit, this fact does not matter=
.
> >>>>>>> What matters is that wandered journal blocks never hit COMMIT=
 BITMAP.
> >>>>>>>
> >>>>>>> So, if I've got all this correct (which I highly doubt), the =
disk space leak
> >>>>>>> (as you pointed it out) does not exist.
> >>>>>> It seems, you are right..
> >>>>>>
> >>>>>>> What exists is a rather different problem with my idea of "lo=
g every
> >>>>>>> deallocated block". Current implementation logs every block r=
egardless of
> >>>>>>> BA_DEFER flag presence or absence, so non-wandered blocks are=
 logged twice.
> >>>>>>>
> >>>>>>> We could just use ->delete_set, but we would lose wandered bl=
ocks then.
> >>>>>>> Or we could only log !BA_DEFER requests, which would do the r=
ight thing
> >>>>>>> (wandered blocks + deallocations from reiser4_post_commit_hoo=
k()), but
> >>>>>>> the reasoning behind this decision would not be obvious for a=
 casual
> >>>>>>> code reader.
> >>>>>> I think that a good comment will save the situation..
> >>>>>>
> >>>>>>> Or we could log only wandered blocks (in addition to ->delete=
_set)
> >>>>>>> at discard time, but this is messy and requires us to merge t=
he discard log
> >>>>>>> with ->delete_set at discard time.
> >>>>>> what is the difference with the previous "we could.."?
> >>>>> The previous option is to log all !BA_DEFER requests in additio=
n to
> >>>>> ->delete_set, so those two block sets would be partially overla=
pping.
> >>>> Hmm.. Are they really overlapped?
> >>>>
> >>>> reiser4_dealloc_blocks() looks like the following:
> >>>> {
> >>>> if (flags & BA_DEFER)
> >>>>            log in the delete_set;
> >>>> else
> >>>>            deallocate in working bitmap
> >>>> ...
> >>>> }
> >>>>
> >>>> so (!BA_DEFER) requests and the delete_set look disjoint,
> >>>> or, I missed something?
> >>> You're right, I've misread the code. I was under impression that
> >>> reiser4_post_commit_hook() internally calls reiser4_dealloc_block=
s(!BA_DEFER).
> >>>
> >>> So the second option (which I prefer) is to log all sa_dealloc_bl=
ocks() calls.
> >>> That is, effectively, ->delete_set plus wandered journal block de=
allocations.
> >>
> >> Yes, I think to do something like this:
> >>
> >> reiser4_dealloc_blocks()
> >> {
> >> if (flags & BA_DEFER) {
> >>           ...
> >>           } else {
> >>           ...
> >>           if (discard is turned on)
> >>                   /* we'll want to discard these blocks, which are=
 not to
> >> be represented
> >>                       in the COMMIT SPACE MAP, so store them in a
> >> separate list */
> >>                   do {
> >>                           blocknr_set_add_extent(atom,
> >> &atom->delete_set_for_wander, &bsep, start, len);
> >>                           ...
> >>                   } while (ret =3D=3D -E_REPEAT);
> >> sa_dealloc_blocks(reiser4_get_space_allocator(ctx->super), *start,=
 *len);
> >>           ...
> >> }
> >>
> >> Then join the sets (->delete_set, and ->delete_set_for_wander) at
> >> discard time
> >> (should be pretty cheap operation). insert a check at every atoms
> >> fusion, that
> >> ->delete_set_for_wander of both atoms are empty).
> > Hm. IIRC, ultimately we wanted to use rb-trees for storing discard =
block sets,
> > but this means that we'll need to convert two blocknr_sets into an =
rb-tree
> > at discard time, which pretty defeats their purpose in our context.=
.. Or do you
> > say that blocknr_set itself should be made rb-tree?
>=20
> I didn't know about the delete sets. They are not optional and lists =
are
> better for them (as they don't require sorting). So I suggest to conf=
ine
> with lists for now, and may be to try the fast-merge trees in the fut=
ure
> (if there is a great desire).

The discard algorithm still needs its input to be sorted, and blocknr_s=
et is
inherently unordered.

So there are two options:
=2D log into ->delete_set and ->delete_set_for_wander (as you've proposed=
),
then merge them into a sorted list at discard time;
=2D log into ->discard_set (just like it is now), just fix what to log.

What do you think?

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart2575785.KdZSbHTvW6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOezmgACgkQxUKljSIMAnA5SgEAq0J7MnWd+5t4FpMF/0KjOyhL
qbDsqaqSJtMgC5Ys3ZgA/36wzZwPwmoWB+1bGZcou8BM46o2t/DoY5K17J0dNxga
=XQIy
-----END PGP SIGNATURE-----

--nextPart2575785.KdZSbHTvW6--

