From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Wed, 18 Jun 2014 16:26:08 +0400
Message-ID: <2270789.8YxXj97joR@intelfx-laptop>
References: <3401431.jj87z7i0xD@intelfx-laptop> <2155505.AXPj8Qz6Nx@intelfx-laptop> <53A17CCA.5030306@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2473629.o1iaGBoS38"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=DFn2Nu6o5NPc9hKoWAmA0zf8FtxMWmm5WU4a5nNY0mE=;
        b=ImJBvC7cqCLDntX6LPg3BkeF8thMuiXA7mErO9+YNozOVeyvbegq0lHMChTywdbld7
         fYvi/1I8dvEk/tk4ZrxFtWpyoJ7pRbGTfxfXF6f7ElWwsPhGBWjeo1mxu+vjL2TbE0Jj
         58hkV/TJ28te6krSSkBKt7bknVpUfm4fgMrz/zH6Px83NAuC3gRMcMSvYHv3jOAb9zxx
         DEnN8x762GNlL4/L/1GV+mInEaNNSMBuE3vwC/IoiIVX3aPmt7TUagdAGNp6kfx7H4Y3
         uFzM9uJj6/j0v0EKyGES7sA/l4C/8mLwC8dxOggNjaCjIdDeq+3sL6cDpc70jvC/ni9I
         SW8w==
In-Reply-To: <53A17CCA.5030306@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart2473629.o1iaGBoS38
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Wednesday 18 June 2014 at 13:49:30, Edward Shishkin wrote:=09
> On 06/18/2014 11:55 AM, Ivan Shapovalov wrote:
> > On Wednesday 18 June 2014 at 03:41:04, Edward Shishkin wrote:=09
> >> On 06/17/2014 10:47 PM, Ivan Shapovalov wrote:
> >>> On Tuesday 17 June 2014 at 22:31:36, Ivan Shapovalov wrote:=09
> >>>> On Tuesday 17 June 2014 at 12:29:53, Edward Shishkin wrote:=09
> >>>>> [...]
> >>>>>
> >>>>> Yup.
> >>>>> So, if discard is on, we work with 2 lists (delete_set,
> >>>>> delete_set_for_wander).
> >>>>> If discard is off, we work with one blocknr set..
> >>>> Good. So I'll do roughly following for v5:
> >>>> - rename discard_set_* to block_list_* and split off these defin=
itions
> >>>> - write a family of reiser4_atom_dset_*() (log_deferred, log_imm=
ediate,
> >>>>     apply_deferred, merge, init, destroy) which will encapsulate=
 discard/nodiscard
> >>>>     check and operate on correct lists (blocknr_set vs block_lis=
t)
> >>>> - call reiser4_atom_dset_{init,destroy,merge}() from respective =
functions
> >>>> - call reiser4_atom_dset_log_{deferred,immediate}() from reiser4=
_dealloc_blocks()
> >>>> - call reiser4_atom_dset_apply_deferred() from reiser4_post_comm=
it_hook()
> >>>> - directly manipulate the block lists from discard_atom(), check=
ing that we
> >>>>     indeed have discard enabled
> >>>>
> >>>> Is this OK?
> >>> BTW, with txn_atoms there is a locking idiom involving E_REPEAT l=
oops.
> >>>
> >>> Is it fine to implement a
> >>> current_atom_dset_log_...(...) // E_REPEAT loop inside
> >>> instead of
> >>> atom_dset_log_...(txn_atom* atom, ...)
> >> IMHO it is not needed.
> >>
> >> atom =3D get_current_atom_locked();
> >> atom_dset_{defer, immed}_add_extent(atom, ...); // <-- the loop is=
 here
> >> spin_unlock_atom(atom);
> > IIUC, the point of the E_REPEAT loop is that memory allocations mus=
t be done
> > with atom spinlock released, and once released,
>=20
>=20
> You are right, we need something similar for the lists. Otherwise,
> deadlocks are possible (they will appear on high-load systems).
> Not necessarily in the first edition: first make sure that the base
> stuff works.

It's cheap, there is no need to delay this until some ephemeral "final
imlementation". I just wanted to make sure it's OK per coding style to
implement functions like "current_atom_XXX()" which internally do
get_current_atom_locked() and all that stuff. (Or not OK, in which case=

I'll push this loop out of the function.)

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /

>=20
>=20
> >   the atom may "disappear", so
> > it is unsafe to use the same pointer again. Hence there is a loop o=
f
> >
> > void *data =3D NULL;
> >
> > do {
> >      atom =3D get_current_atom_locked();
> >      ret =3D blocknr_set_add_extent(atom, &atom->delete_set, &data,=
 ...);
> > } while (ret =3D=3D -E_REPEAT);
> >
> > where `data` is a piece of "state" saved across the two blocknr_set=
_add_extent()
> > calls. On first iteration of the loop, atom lock is released, memor=
y is
> > allocated and pointer is stored in `data`, and -E_REPEAT is returne=
d.
> > On second iteration of the loop, the previously allocated memory is=
 accessed
> > and the atom is modified under its spinlock.
> >
> 
--nextPart2473629.o1iaGBoS38
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOhhWcACgkQxUKljSIMAnAySAD+M3EX2qiSiOC8HAL0XOFv/Num
01jEX0DydAA7MWZiYngBAKpK+W9DBPfT362UbwllbIDd75ZyXDJ+HCf7/B3P/rv9
=rqyH
-----END PGP SIGNATURE-----

--nextPart2473629.o1iaGBoS38--

