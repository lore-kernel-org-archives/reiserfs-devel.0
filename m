From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Mon, 16 Jun 2014 09:03:24 +0400
Message-ID: <1867805.hmMaC7j7al@intelfx-laptop>
References: <3401431.jj87z7i0xD@intelfx-laptop> <1848882.0DacExnpE3@intelfx-laptop> <539E36F9.6070706@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4402520.o411IYk8Qp"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=NGlpw7f3QZk16VFxARt7vwRo51yi32kEIAkDu8Z0xs4=;
        b=XUN0MSgUuvldelWmgThr9oKRbR1tz0zJEh3NdRfHkwQGodlVQqCH3cNzqIBRSz/Jq/
         UytzxIgvPxxmMajm/zbHP1aot3+41bHWg76SwNH/tY5ewkYASFrB5nihSe0IoKHrpUZn
         humaoHZQI9bL0dMTCoko4D8fpCkCYLDFqazuzspvDsEgLm2E40QMfzWYqtlXhR2CJcxR
         br1elriagEMhdiqAtO01NW1fqG0UNWiJ54zC+j7Dkr4e84w15sxdznps0nODVwTTx9xq
         D8bicpofcYNtADSFPRygR9HUQfXFQLrblRHt2alli7uqD0dVF8vE/gJUEaFkCJgkfENo
         QowA==
In-Reply-To: <539E36F9.6070706@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart4402520.o411IYk8Qp
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 16 June 2014 at 02:14:49, Edward Shishkin wrote:=09
>=20
> On 06/15/2014 11:58 PM, Ivan Shapovalov wrote:
> > On Sunday 15 June 2014 at 23:49:59, Edward Shishkin wrote:=09
> >> On 06/15/2014 08:07 PM, Ivan Shapovalov wrote:
> >>> On Sunday 15 June 2014 at 19:36:05, Edward Shishkin wrote:=09
> >>>> On 06/13/2014 10:28 PM, Ivan Shapovalov wrote:
> >>>>> Here is my "analysis" of what happens in reiser4 during a trans=
action's
> >>>>> lifetime wrt. block allocation and deallocation.
> >>>>>
> >>>>>
> >>>>> THE EFFECTS (SEMANTICS) OF RELATED FUNCTIONS
> >>>>> reiser4_alloc_blocks_bitmap(): allocates in WORKING BITMAP
> >>>> Yes.
> >>>>
> >>>>> reiser4_dealloc_blocks_bitmap(!BA_DEFER): deallocates from WORK=
ING BITMAP
> >>>>> reiser4_dealloc_blocks_bitmap(BA_DEFER): stores to ->delete_set=

> >>>> This is correct for the middle-level allocator (without suffix "=
bitmap").
> >>>> The low-level one frees blocks only in WORKING BITMAP.
> >>> Yes, this was a wording mistake. I've noticed it shortly after se=
nding...
> >>>
> >>>>> reiser4_pre_commit_hook_bitmap(): allocates all relocated nodes=
 in COMMIT BITMAP
> >>>> "Relocated" is bad term here: nodes with new data also get the f=
lag
> >>>> JNODE_RELOC. So, I would rather say, that it applies freshly all=
ocated
> >>>> nodes of the atom to COMMIT BITMAP.
> >>>>
> >>>>
> >>>>>                                      deallocates ->delete_set f=
rom COMMIT BITMAP
> >>>> applies the atom's delete_set to COMMIT BITMAP
> >>> I've meant exactly this.
> >>>
> >>>>> reiser4_post_commit_hook(): deallocates ->delete_set using !BA_=
DEFER
> >>>>>                                                       (i. e. fr=
om WORKING BITMAP)
> >>>> applies the atom's delete_set to WORKING BITMAP.
> >>> ditto
> >>>
> >>>> I would also mention a function of the middle-level block alloca=
tor
> >>>> reiser4_alloc_blocks(): allocates blocks in WORKING  BITMAP.
> >>> Yes, sure.
> >>>
> >>>
> >>>> Note that the middle-level block allocator (block_alloc.c) actua=
lly
> >>>> manipulates
> >>>> with abstract space maps. Currently in reiser4 they are represen=
ted only by
> >>>> bitmaps (plugin/space/bitmap.c). We can also implement another
> >>>> representation -
> >>>> extent tree (like in XFS). I don't see any needs for now, though=
.
> >>> Extent trees seem to be interesting.. They claim that they are mo=
re efficient -
> >>> is the difference that huge?
> >>>
> >>>>> TIMELINE OF ALLOCATIONS FOR "USUAL" NODES, AND TIMELINE OF TRAN=
SACTION COMMIT
> >>>>> - nodes are allocated using reiser4_alloc_blocks() and setting =
JNODE_RELOC,
> >>>>>      so WORKING BITMAP ensures that two nodes cannot get the sa=
me block;
> >>>>> - nodes are deallocated using reiser4_dealloc_blocks(BA_DEFER),=

> >>>>>      so their deallocation is not immediately reflected in WORK=
ING BITMAP;
> >>>>> (the relocate set is written here)
> >>>>> - reiser4_pre_commit_hook_bitmap() uses 1) JNODE_RELOC flag and=
 2) ->delete_set
> >>>>>      to convey effective bitmap changes into COMMIT BITMAP;
> >>>>> (the journal and overwrite set are written here)
> >>>>> - reiser4_post_commit_hook() uses ->delete_set to convey deallo=
cations
> >>>>>      from step 2 to WORKING BITMAP.
> >>>>> (the discard happens here)
> >>>>>
> >>>>>
> >>>>> TIMELINE OF ALLOCATIONS FOR WANDERED JOURNAL BLOCKS
> >>>>> - at commit time, blocks are allocated using reiser4_alloc_bloc=
ks(), so they
> >>>>>      are allocated in WORKING BITMAP and do not interfere with =
any "usual" blocks;
> >>>>> - after writing wandered blocks, they are deallocated using
> >>>>>      reiser4_dealloc_blocks(!BA_DEFER), i. e. from the WORKING =
BITMAP.
> >>>> So, the system of working and commit bitmaps plus the delete set=
 seems
> >>>> to be redundant? I think this is because of performance reasons:=
 block
> >>>> allocation is critical thing...
> >>> Seems like it is -- for performance and simplicity (=3D=3D robust=
ness).
> >>>
> >>>>> CONCLUSION
> >>>>> At possible transaction replay time, journal blocks are not all=
ocated in any
> >>>>> of the bitmaps. However, because the journal is read and replay=
ed before a
> >>>>> transaction has a chance to commit, this fact does not matter.
> >>>>> What matters is that wandered journal blocks never hit COMMIT B=
ITMAP.
> >>>>>
> >>>>> So, if I've got all this correct (which I highly doubt), the di=
sk space leak
> >>>>> (as you pointed it out) does not exist.
> >>>> It seems, you are right..
> >>>>
> >>>>> What exists is a rather different problem with my idea of "log =
every
> >>>>> deallocated block". Current implementation logs every block reg=
ardless of
> >>>>> BA_DEFER flag presence or absence, so non-wandered blocks are l=
ogged twice.
> >>>>>
> >>>>> We could just use ->delete_set, but we would lose wandered bloc=
ks then.
> >>>>> Or we could only log !BA_DEFER requests, which would do the rig=
ht thing
> >>>>> (wandered blocks + deallocations from reiser4_post_commit_hook(=
)), but
> >>>>> the reasoning behind this decision would not be obvious for a c=
asual
> >>>>> code reader.
> >>>> I think that a good comment will save the situation..
> >>>>
> >>>>> Or we could log only wandered blocks (in addition to ->delete_s=
et)
> >>>>> at discard time, but this is messy and requires us to merge the=
 discard log
> >>>>> with ->delete_set at discard time.
> >>>> what is the difference with the previous "we could.."?
> >>> The previous option is to log all !BA_DEFER requests in addition =
to
> >>> ->delete_set, so those two block sets would be partially overlapp=
ing.
> >>
> >> Hmm.. Are they really overlapped?
> >>
> >> reiser4_dealloc_blocks() looks like the following:
> >> {
> >> if (flags & BA_DEFER)
> >>           log in the delete_set;
> >> else
> >>           deallocate in working bitmap
> >> ...
> >> }
> >>
> >> so (!BA_DEFER) requests and the delete_set look disjoint,
> >> or, I missed something?
> > You're right, I've misread the code. I was under impression that
> > reiser4_post_commit_hook() internally calls reiser4_dealloc_blocks(=
!BA_DEFER).
> >
> > So the second option (which I prefer) is to log all sa_dealloc_bloc=
ks() calls.
> > That is, effectively, ->delete_set plus wandered journal block deal=
locations.
>=20
>=20
> Yes, I think to do something like this:
>=20
> reiser4_dealloc_blocks()
> {
> if (flags & BA_DEFER) {
>          ...
>          } else {
>          ...
>          if (discard is turned on)
>                  /* we'll want to discard these blocks, which are not=
 to=20
> be represented
>                      in the COMMIT SPACE MAP, so store them in a=20
> separate list */
>                  do {
>                          blocknr_set_add_extent(atom,=20
> &atom->delete_set_for_wander, &bsep, start, len);
>                          ...
>                  } while (ret =3D=3D -E_REPEAT);
> sa_dealloc_blocks(reiser4_get_space_allocator(ctx->super), *start, *l=
en);
>          ...
> }
>=20
> Then join the sets (->delete_set, and ->delete_set_for_wander) at=20
> discard time
> (should be pretty cheap operation). insert a check at every atoms=20
> fusion, that
> ->delete_set_for_wander of both atoms are empty).

Hm. IIRC, ultimately we wanted to use rb-trees for storing discard bloc=
k sets,
but this means that we'll need to convert two blocknr_sets into an rb-t=
ree
at discard time, which pretty defeats their purpose in our context... O=
r do you
say that blocknr_set itself should be made rb-tree?

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /

>=20
>=20
> >
> >>> And this option is to log only those !BA_DEFER requests which are=
 not in
> >>> ->delete_set, so no block will be stored twice. Thus we will have=
 to consider
> >>> both ->delete_set and this hypothetical ->discard_set at discard =
time.
> >>>
> >>>>> Or we could log wandered blocks straight into ->delete_set and =
do something in
> >>>>> reiser4_post_commit_hook() to separate these entries, but this =
is super messy.
> >>>>>
> >>>>> I'm preferring the second way... Edward, please proof-read all =
this.
> >>>> BTW, what about your current implementation? Does it work for yo=
u?
> >>> Yes, it apparently does (no massive corruptions).
> >>>
> >>> I get batches of "orphan cluster" errors from time to time (from =
offset 0 till
> >>> the supposed end of file),
> >>
> >> this is fsck complaints?
> > Yes. (I do `fsck.reiser4 --build-fs` pretty routinely...)
> >
> >>>    but 1) I do not see which files get corrupted,
> >>> 2) this could be due to txmod=3Dwa, 3) my machine is pretty crash=
y now due to
> >>> some driver issues, so I don't know what exactly causes this.
> >>>
> >>> Thanks for proof-reading. What do you think about all this?
> >>
> >> I think that not bad for the beginning! I have purchased an SSD ca=
rd,
> >> hope to test the discard stuff in the near future.
> > And I hope to finish this feature somewhen... :)
> >
> > Thanks,
> 
--nextPart4402520.o411IYk8Qp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOeeqEACgkQxUKljSIMAnC7UQEAiITgoYaAsIzBvBI96DCk8A15
jVZqOtYzL3lpE5R50KUA/1mQd1PDDumoUaHSFMvCbfW9b96s7PWV480VzhuwH36A
=GG3u
-----END PGP SIGNATURE-----

--nextPart4402520.o411IYk8Qp--

