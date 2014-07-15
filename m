From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using linked lists.
Date: Tue, 15 Jul 2014 15:42:04 +0400
Message-ID: <1467759.jhr2SzDkiE@intelfx-laptop>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <2160912.yche19jEn0@intelfx-laptop> <53C338DB.7070603@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2990463.iMsETPj120"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=LfSp11W3SnUnMn3Ruv91IytS/44JwlbAtpoWO6Yo/Ro=;
        b=IGHo8NTOHI8oj+9Ng02W69VzG0W5IsECAiyz7MuV1iZXyLovpCzZEoWqkedASp9Aqs
         w7la+KqMsZOY82u860vh6wwY8slqeERubZ9HSyeelISHixr1N085SPjo9bi9NvHvCMR8
         QLcah6jMINggCwEgqu7OAOsj6t0lbMStKTDU3bAgyMP8QaFcdJbL434lyyT15fUR86vv
         2eVPKbCSbHGqley1fYVXNwlvJCRSDglkNlwFLzuwzHjIOKV01txEJFK8ErxJPhGTBDsn
         fbmC4Ua2Z1NCxTWQsyHTKEX/DnWpYg+RTKM37j0T0JaNhHw1MaIMsVa38GV1mscBmZS/
         m8Dw==
In-Reply-To: <53C338DB.7070603@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart2990463.iMsETPj120
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 14 July 2014 at 03:56:43, Edward Shishkin wrote:=09
>=20
> On 07/13/2014 09:18 PM, Ivan Shapovalov wrote:
> > On Sunday 13 July 2014 at 21:04:11, Edward Shishkin wrote:=09
> >> On 07/13/2014 02:47 PM, Ivan Shapovalov wrote:
> >>> On Sunday 13 July 2014 at 03:33:57, Edward Shishkin wrote:=09
> >>>> On 07/09/2014 02:40 PM, Ivan Shapovalov wrote:
> >>>>> On Monday 07 July 2014 at 01:47:41, Edward Shishkin wrote:=09
> >>>>>> On 06/22/2014 12:48 PM, Ivan Shapovalov wrote:
> >>>>>> [...]
> >>>> [...]
> >>>>>>> + * - if a single extent is smaller than the erase unit, then=
 this particular
> >>>>>>> + *   extent won't be discarded even if it is surrounded by e=
nough free blocks
> >>>>>>> + *   to constitute a whole erase unit;
> >>>>>> Why not to discard the aligned and padded extent, which coinci=
des
> >>>>>> with the whole erase unit?
> >>>>> With a number of whole erase units.
> >>>>>
> >>>>>>> + * - we won't be able to merge small adjacent extents formin=
g an extent long
> >>>>>>> + *   enough to be discarded.
> >>>>>> At this point we have already sorted and merged everything.
> >>>>>> So may be it makes sense just to check the head and tail of ev=
ery resulted
> >>>>>> extent and discard the aligned and padded one?
> >>>>> "Head and tail" is not sufficient. We may check the whole exten=
t with a single
> >>>>> bitmap request, but such algorithm will be very inefficient: it=
 will miss many
> >>>>> possibilities for discarding.
> >>>>>
> >>>>> Consider many-block extent, from which one block has been alloc=
ated again.
> >>>>> In this case we miss (all-1) blocks to be discarded (if granula=
rity =3D 1 block).
> >>>>>
> >>>>>> Please, consider such possibility. Iterating over erase units =
in
> >>>>>> discard_extent()
> >>>>>> looks suboptimal.
> >>>>> Yes, it's costly... but I don't see any other ways to do the ta=
sk efficiently.
> >>>> How about this function?  (the attached patch is against v6-seri=
es).
> >>>> Total number of bitmap checks is in [N+1, 2N], where N is number=
 of
> >>>> extents  in the list. At the same time we don't leave any non-di=
scarded
> >>>> "garbage"...
> >>>>
> >>>> Edward.
> >>>> P.S. I tested it, but not enough.
> >>> Hm. I'm probably a dumbass, but...
> >>>
> >>> I don't see where the [start; start+len) region is checked for be=
ing free.
> >>
> >> check_free_blocks() is called for this purpose.
> >>
> >> Firstly when checking head padding. Secondly in the gluing loop
> >> (to glue 2 extents in particular means to make sure that region
> >> between them is free). Finally we check if the tail padding is fre=
e.
> > There are three calls to check_free_blocks():
> >
> > line 197, check_free_blocks(start - headp, headp)
> > This checks first extent's head padding.
> >
> > line 247, check_free_blocks(end, next_start - end)
> > This checks blocks between end of first extent and start of second =
extent
> > (including possible tail padding of first extent and possible head =
padding
> > of second extent).
> >
> > line 284, check_free_blocks(end, tailp)
> > This checks first extent's tail padding.
> >
> > Nothing seems to call at least check_free_blocks(begin, end)...
>=20
>=20
> Oh, bad... I thought all this time that extents of the delete sets ar=
e=20
> still dirty
> in the working bitmap at the moment of discard.
> Hmm, I definitely don't want to check the whole extents for discard..=
.
>=20
> Why not to delay the actual deallocation (in the working bitmap)?
> Anyway, in the situations of disk space pressure (on the first "soft=20=

> ENOSPC")
> everyone waits for commit-everything completion. Let's think in this=20=

> direction...

That's a good idea, actually. Let's outline what is needed for this:

=2D move reiser4_post_commit_hook() after the call to discard;

This will also move it outside of reiser4_write_logs(), after
reiser4_post_write_back_hook() and various immediate deallocations done=
 by the
journal code. I suppose this is OK for we're under commit mutex anyway.=


=2D defer journal's immediate deallocations until discard.

This is more interesting. Inside of the journal code, blocks are deallo=
cated
in four places:
* dealloc_tx_list()
* dealloc_wmap() -> dealloc_wmap_actor()
* add_region_to_wmap() /* in error path */
* alloc_tx() /* seems like in error path, len =3D=3D 0 in case of norma=
l exit */

That is, blocks are deallocated after all meaningful work and so relati=
ve
order of these deallocations seems to not matter.

Given that point 1 is done, i. e. delete_set is applied to WORKING BITM=
AP
after reiser4_write_logs(), we can simply make these deallocations defe=
rred
(BA_DEFER flag). This way, we also get rid of aux_delete_set.

The only thing to check is deallocation attributes. All journal's deall=
ocations
are done with target_stage =3D=3D BLOCK_NOT_COUNTED. This happily coinc=
ides with
what's done in apply_dset(), so no problems here.

Is this correct?

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /

>=20
>=20
> >
> > BTW, what's the purpose of headp_is_known_dirty?
>=20
> To avoid unneeded checks.
>=20
> (end + tailp > next_start) means that the head padding of the next ex=
tent
> includes the region [end, next_start), which was found dirty (when tr=
ying
> to glue this next extent).
>=20
>=20
> >   All uses of this variable
> > can be compile-time resolved to 0. It is never read after assigned =
1.
>=20
>=20
> Yup. Its declaration with the first assignment are at wrong place.
> It should be above (near the @pos). I definitely needed to work more
> on this function.
>=20
>=20
> >
> >>
> >>> Also, btw, do we need to cut the head (lines 155-163 of the patch=
) if headp
> >>> is empty? It seems that it would reduce extent by one whole erase=
 unit
> >>> without any justification.
> >>
> >> Yes, this is definitely a leak of not discarded erase units.
> >> Is the attached version better?
> > Yes.. and lines 290-295, seems that tail padding handling has the s=
ame problem.
> > If tailp =3D=3D 0 (i. e. division remainder is 0 so that end is alr=
eady aligned),
>=20
> OK, will be fixed in the same way.
>=20
> Thanks,
> Edward.
--nextPart2990463.iMsETPj120
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPFE5EACgkQxUKljSIMAnDaMwEAn4xUpPlOp219oKVkyVtvVeEH
es/rC754LefAJxf6fqUA/00q4L7ljzif41CY87QiEpbak0Lfu0ZGazkz45SEq9dM
=mzi6
-----END PGP SIGNATURE-----

--nextPart2990463.iMsETPj120--

