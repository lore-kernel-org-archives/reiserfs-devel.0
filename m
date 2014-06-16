From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Mon, 16 Jun 2014 15:47:45 +0400
Message-ID: <3381547.FkGuFJAHk4@intelfx-laptop>
References: <3401431.jj87z7i0xD@intelfx-laptop> <45271088.MxWDMbZH2T@intelfx-laptop> <539ED5B2.9060406@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart16330247.I70Cs3OiTU"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=yvwDlCc52cr6uM8kXv2+dW0/jM1un9XiUWuPUqPgfBw=;
        b=qMMJU+iwve1EnlnUHyzBqegwxClNmN5gChkbI7ejs/ipWTJE4wzRqZHjFJznBaxyOH
         3lKo4Abw3CqmXop18XqK+AGXxQleDlFII/5j/VIoGHrYQcveYopm3Snz3lsawtgZ3y9c
         ludJZXe4p9fHrTfxsI7bQQLrGSkGId+PfM0I723ly6zw1xuWD4t5In9EhH6wEJzuN8s9
         vW3ei/1e0gBfHL977yVl3vsTloQXxZFFHHw/c9N51qAGuASk0roDk2BM/2JHYTfmiCZ/
         HMODTJTpaN4r7YWvYctKPWCZPX7J66drwjYNb+3VzkmO2sKoMGMCpM+XEieaIuBkRKLy
         8BoQ==
In-Reply-To: <539ED5B2.9060406@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart16330247.I70Cs3OiTU
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 16 June 2014 at 13:32:02, Edward Shishkin wrote:=09
> On 06/16/2014 01:00 PM, Ivan Shapovalov wrote:
> > On Monday 16 June 2014 at 11:24:39, Edward Shishkin wrote:=09
> >> On 06/16/2014 07:03 AM, Ivan Shapovalov wrote:
> >>> On Monday 16 June 2014 at 02:14:49, Edward Shishkin wrote:=09
> >>>> On 06/15/2014 11:58 PM, Ivan Shapovalov wrote:
> >>>>> On Sunday 15 June 2014 at 23:49:59, Edward Shishkin wrote:=09
> >>>>>> On 06/15/2014 08:07 PM, Ivan Shapovalov wrote:
> >>>>>>> On Sunday 15 June 2014 at 19:36:05, Edward Shishkin wrote:=09=

> >>>>>>>> On 06/13/2014 10:28 PM, Ivan Shapovalov wrote:
> >>>>>>>>> Here is my "analysis" of what happens in reiser4 during a t=
ransaction's
> >>>>>>>>> lifetime wrt. block allocation and deallocation.
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> THE EFFECTS (SEMANTICS) OF RELATED FUNCTIONS
> >>>>>>>>> reiser4_alloc_blocks_bitmap(): allocates in WORKING BITMAP
> >>>>>>>> Yes.
> >>>>>>>>
> >>>>>>>>> reiser4_dealloc_blocks_bitmap(!BA_DEFER): deallocates from =
WORKING BITMAP
> >>>>>>>>> reiser4_dealloc_blocks_bitmap(BA_DEFER): stores to ->delete=
_set
> >>>>>>>> This is correct for the middle-level allocator (without suff=
ix "bitmap").
> >>>>>>>> The low-level one frees blocks only in WORKING BITMAP.
> >>>>>>> Yes, this was a wording mistake. I've noticed it shortly afte=
r sending...
> >>>>>>>
> >>>>>>>>> reiser4_pre_commit_hook_bitmap(): allocates all relocated n=
odes in COMMIT BITMAP
> >>>>>>>> "Relocated" is bad term here: nodes with new data also get t=
he flag
> >>>>>>>> JNODE_RELOC. So, I would rather say, that it applies freshly=
 allocated
> >>>>>>>> nodes of the atom to COMMIT BITMAP.
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>>                                        deallocates ->delete=
_set from COMMIT BITMAP
> >>>>>>>> applies the atom's delete_set to COMMIT BITMAP
> >>>>>>> I've meant exactly this.
> >>>>>>>
> >>>>>>>>> reiser4_post_commit_hook(): deallocates ->delete_set using =
!BA_DEFER
> >>>>>>>>>                                                         (i.=
 e. from WORKING BITMAP)
> >>>>>>>> applies the atom's delete_set to WORKING BITMAP.
> >>>>>>> ditto
> >>>>>>>
> >>>>>>>> I would also mention a function of the middle-level block al=
locator
> >>>>>>>> reiser4_alloc_blocks(): allocates blocks in WORKING  BITMAP.=

> >>>>>>> Yes, sure.
> >>>>>>>
> >>>>>>>
> >>>>>>>> Note that the middle-level block allocator (block_alloc.c) a=
ctually
> >>>>>>>> manipulates
> >>>>>>>> with abstract space maps. Currently in reiser4 they are repr=
esented only by
> >>>>>>>> bitmaps (plugin/space/bitmap.c). We can also implement anoth=
er
> >>>>>>>> representation -
> >>>>>>>> extent tree (like in XFS). I don't see any needs for now, th=
ough.
> >>>>>>> Extent trees seem to be interesting.. They claim that they ar=
e more efficient -
> >>>>>>> is the difference that huge?
> >>>>>>>
> >>>>>>>>> TIMELINE OF ALLOCATIONS FOR "USUAL" NODES, AND TIMELINE OF =
TRANSACTION COMMIT
> >>>>>>>>> - nodes are allocated using reiser4_alloc_blocks() and sett=
ing JNODE_RELOC,
> >>>>>>>>>        so WORKING BITMAP ensures that two nodes cannot get =
the same block;
> >>>>>>>>> - nodes are deallocated using reiser4_dealloc_blocks(BA_DEF=
ER),
> >>>>>>>>>        so their deallocation is not immediately reflected i=
n WORKING BITMAP;
> >>>>>>>>> (the relocate set is written here)
> >>>>>>>>> - reiser4_pre_commit_hook_bitmap() uses 1) JNODE_RELOC flag=
 and 2) ->delete_set
> >>>>>>>>>        to convey effective bitmap changes into COMMIT BITMA=
P;
> >>>>>>>>> (the journal and overwrite set are written here)
> >>>>>>>>> - reiser4_post_commit_hook() uses ->delete_set to convey de=
allocations
> >>>>>>>>>        from step 2 to WORKING BITMAP.
> >>>>>>>>> (the discard happens here)
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> TIMELINE OF ALLOCATIONS FOR WANDERED JOURNAL BLOCKS
> >>>>>>>>> - at commit time, blocks are allocated using reiser4_alloc_=
blocks(), so they
> >>>>>>>>>        are allocated in WORKING BITMAP and do not interfere=
 with any "usual" blocks;
> >>>>>>>>> - after writing wandered blocks, they are deallocated using=

> >>>>>>>>>        reiser4_dealloc_blocks(!BA_DEFER), i. e. from the WO=
RKING BITMAP.
> >>>>>>>> So, the system of working and commit bitmaps plus the delete=
 set seems
> >>>>>>>> to be redundant? I think this is because of performance reas=
ons: block
> >>>>>>>> allocation is critical thing...
> >>>>>>> Seems like it is -- for performance and simplicity (=3D=3D ro=
bustness).
> >>>>>>>
> >>>>>>>>> CONCLUSION
> >>>>>>>>> At possible transaction replay time, journal blocks are not=
 allocated in any
> >>>>>>>>> of the bitmaps. However, because the journal is read and re=
played before a
> >>>>>>>>> transaction has a chance to commit, this fact does not matt=
er.
> >>>>>>>>> What matters is that wandered journal blocks never hit COMM=
IT BITMAP.
> >>>>>>>>>
> >>>>>>>>> So, if I've got all this correct (which I highly doubt), th=
e disk space leak
> >>>>>>>>> (as you pointed it out) does not exist.
> >>>>>>>> It seems, you are right..
> >>>>>>>>
> >>>>>>>>> What exists is a rather different problem with my idea of "=
log every
> >>>>>>>>> deallocated block". Current implementation logs every block=
 regardless of
> >>>>>>>>> BA_DEFER flag presence or absence, so non-wandered blocks a=
re logged twice.
> >>>>>>>>>
> >>>>>>>>> We could just use ->delete_set, but we would lose wandered =
blocks then.
> >>>>>>>>> Or we could only log !BA_DEFER requests, which would do the=
 right thing
> >>>>>>>>> (wandered blocks + deallocations from reiser4_post_commit_h=
ook()), but
> >>>>>>>>> the reasoning behind this decision would not be obvious for=
 a casual
> >>>>>>>>> code reader.
> >>>>>>>> I think that a good comment will save the situation..
> >>>>>>>>
> >>>>>>>>> Or we could log only wandered blocks (in addition to ->dele=
te_set)
> >>>>>>>>> at discard time, but this is messy and requires us to merge=
 the discard log
> >>>>>>>>> with ->delete_set at discard time.
> >>>>>>>> what is the difference with the previous "we could.."?
> >>>>>>> The previous option is to log all !BA_DEFER requests in addit=
ion to
> >>>>>>> ->delete_set, so those two block sets would be partially over=
lapping.
> >>>>>> Hmm.. Are they really overlapped?
> >>>>>>
> >>>>>> reiser4_dealloc_blocks() looks like the following:
> >>>>>> {
> >>>>>> if (flags & BA_DEFER)
> >>>>>>             log in the delete_set;
> >>>>>> else
> >>>>>>             deallocate in working bitmap
> >>>>>> ...
> >>>>>> }
> >>>>>>
> >>>>>> so (!BA_DEFER) requests and the delete_set look disjoint,
> >>>>>> or, I missed something?
> >>>>> You're right, I've misread the code. I was under impression tha=
t
> >>>>> reiser4_post_commit_hook() internally calls reiser4_dealloc_blo=
cks(!BA_DEFER).
> >>>>>
> >>>>> So the second option (which I prefer) is to log all sa_dealloc_=
blocks() calls.
> >>>>> That is, effectively, ->delete_set plus wandered journal block =
deallocations.
> >>>> Yes, I think to do something like this:
> >>>>
> >>>> reiser4_dealloc_blocks()
> >>>> {
> >>>> if (flags & BA_DEFER) {
> >>>>            ...
> >>>>            } else {
> >>>>            ...
> >>>>            if (discard is turned on)
> >>>>                    /* we'll want to discard these blocks, which =
are not to
> >>>> be represented
> >>>>                        in the COMMIT SPACE MAP, so store them in=
 a
> >>>> separate list */
> >>>>                    do {
> >>>>                            blocknr_set_add_extent(atom,
> >>>> &atom->delete_set_for_wander, &bsep, start, len);
> >>>>                            ...
> >>>>                    } while (ret =3D=3D -E_REPEAT);
> >>>> sa_dealloc_blocks(reiser4_get_space_allocator(ctx->super), *star=
t, *len);
> >>>>            ...
> >>>> }
> >>>>
> >>>> Then join the sets (->delete_set, and ->delete_set_for_wander) a=
t
> >>>> discard time
> >>>> (should be pretty cheap operation). insert a check at every atom=
s
> >>>> fusion, that
> >>>> ->delete_set_for_wander of both atoms are empty).
> >>> Hm. IIRC, ultimately we wanted to use rb-trees for storing discar=
d block sets,
> >>> but this means that we'll need to convert two blocknr_sets into a=
n rb-tree
> >>> at discard time, which pretty defeats their purpose in our contex=
t... Or do you
> >>> say that blocknr_set itself should be made rb-tree?
> >> I didn't know about the delete sets. They are not optional and lis=
ts are
> >> better for them (as they don't require sorting). So I suggest to c=
onfine
> >> with lists for now, and may be to try the fast-merge trees in the =
future
> >> (if there is a great desire).
> > The discard algorithm still needs its input to be sorted, and block=
nr_set is
> > inherently unordered.
> >
> > So there are two options:
> > - log into ->delete_set and ->delete_set_for_wander (as you've prop=
osed),
> > then merge them into a sorted list at discard time;
> > - log into ->discard_set (just like it is now), just fix what to lo=
g.
> >
> > What do you think?
>=20
>=20
> Are the blocknr sets comfortable?
> Say, can we organize the discard process via the blocknr_set_iterator=
()?
> If yes, then let's do everything via the blocknr sets (i.e. let's=20
> implement the
> first option). Add needed operations to blocknrset.c, the discard ite=
ration
> actor to discard.c, etc.

No, they aren't, and this is a problem. As I said, they are not just un=
sorted,
they are unsortable as I understand them.

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart16330247.I70Cs3OiTU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOe2WYACgkQxUKljSIMAnBaWQD/VVE+Qwnu/1iATwMK+oABLxw3
DBt3q05WBqkzCdsEWDoBAIOwIlcYiQ/XBroTu8jrE3PqUIGWOWvmy8oB5akYJ0Qu
=kAic
-----END PGP SIGNATURE-----

--nextPart16330247.I70Cs3OiTU--

