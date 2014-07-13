From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using linked lists.
Date: Sun, 13 Jul 2014 23:18:16 +0400
Message-ID: <2160912.yche19jEn0@intelfx-laptop>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <2333335.ugWK4TrHUo@intelfx-laptop> <53C2D82B.7030201@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2359477.GaViqbEBpf"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=xksy9r8j1/Er8jNEh+aDyWTObrt5vrhVRXRWSeIZauw=;
        b=YaaD1gr+lEDTckL5+SS9Z1rIxPAT0mz0Cyt/AGgZGUjrGl/nqIaeova3ul/IstjdSJ
         KAfHXSivkxDKAZH1uxyQnT89DVoKOUWLXnoEhMwnO4w8fU9udJzB9EDYz3GHPgi1bCQS
         vDtQDpofCVAMK4AOTjZtoKiyeoUFaw8D4c5rxupV37K4Bfy36CH6ibxmYo6Zc4BRqGYU
         CIM6AvfEdxCCVg0+Ig0Tzjiau+Ic2nFyKvMOsVhnr5/QB8SeEYq27oFj/d2qEGdjM0UC
         tvs3oXk17kBSy7w8Gik+XpmhDYnHchcYdqKAoryfOdzf+PcvCC0eAEamofCx8akkTSAH
         D2rw==
In-Reply-To: <53C2D82B.7030201@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart2359477.GaViqbEBpf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Sunday 13 July 2014 at 21:04:11, Edward Shishkin wrote:=09
>=20
> On 07/13/2014 02:47 PM, Ivan Shapovalov wrote:
> > On Sunday 13 July 2014 at 03:33:57, Edward Shishkin wrote:=09
> >> On 07/09/2014 02:40 PM, Ivan Shapovalov wrote:
> >>> On Monday 07 July 2014 at 01:47:41, Edward Shishkin wrote:=09
> >>>> On 06/22/2014 12:48 PM, Ivan Shapovalov wrote:
> >>>> [...]
> >> [...]
> >>>>> + * - if a single extent is smaller than the erase unit, then t=
his particular
> >>>>> + *   extent won't be discarded even if it is surrounded by eno=
ugh free blocks
> >>>>> + *   to constitute a whole erase unit;
> >>>> Why not to discard the aligned and padded extent, which coincide=
s
> >>>> with the whole erase unit?
> >>> With a number of whole erase units.
> >>>
> >>>>> + * - we won't be able to merge small adjacent extents forming =
an extent long
> >>>>> + *   enough to be discarded.
> >>>> At this point we have already sorted and merged everything.
> >>>> So may be it makes sense just to check the head and tail of ever=
y resulted
> >>>> extent and discard the aligned and padded one?
> >>> "Head and tail" is not sufficient. We may check the whole extent =
with a single
> >>> bitmap request, but such algorithm will be very inefficient: it w=
ill miss many
> >>> possibilities for discarding.
> >>>
> >>> Consider many-block extent, from which one block has been allocat=
ed again.
> >>> In this case we miss (all-1) blocks to be discarded (if granulari=
ty =3D 1 block).
> >>>
> >>>> Please, consider such possibility. Iterating over erase units in=

> >>>> discard_extent()
> >>>> looks suboptimal.
> >>> Yes, it's costly... but I don't see any other ways to do the task=
 efficiently.
> >>
> >> How about this function?  (the attached patch is against v6-series=
).
> >> Total number of bitmap checks is in [N+1, 2N], where N is number o=
f
> >> extents  in the list. At the same time we don't leave any non-disc=
arded
> >> "garbage"...
> >>
> >> Edward.
> >> P.S. I tested it, but not enough.
> > Hm. I'm probably a dumbass, but...
> >
> > I don't see where the [start; start+len) region is checked for bein=
g free.
>=20
>=20
> check_free_blocks() is called for this purpose.
>=20
> Firstly when checking head padding. Secondly in the gluing loop
> (to glue 2 extents in particular means to make sure that region
> between them is free). Finally we check if the tail padding is free.

There are three calls to check_free_blocks():

line 197, check_free_blocks(start - headp, headp)
This checks first extent's head padding.

line 247, check_free_blocks(end, next_start - end)
This checks blocks between end of first extent and start of second exte=
nt
(including possible tail padding of first extent and possible head padd=
ing
of second extent).

line 284, check_free_blocks(end, tailp)
This checks first extent's tail padding.

Nothing seems to call at least check_free_blocks(begin, end)...

BTW, what's the purpose of headp_is_known_dirty? All uses of this varia=
ble
can be compile-time resolved to 0. It is never read after assigned 1.

>=20
>=20
> >
> > Also, btw, do we need to cut the head (lines 155-163 of the patch) =
if headp
> > is empty? It seems that it would reduce extent by one whole erase u=
nit
> > without any justification.
>=20
>=20
> Yes, this is definitely a leak of not discarded erase units.
> Is the attached version better?

Yes.. and lines 290-295, seems that tail padding handling has the same =
problem.
If tailp =3D=3D 0 (i. e. division remainder is 0 so that end is already=
 aligned),
alen is reduced by d_uni.

>=20
> Edward.

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart2359477.GaViqbEBpf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPC23gACgkQxUKljSIMAnDHggD/Vi4JkEru9OH12snsiVJFmB+e
mD3gnicAinVwS98Hr9MA/jS9apZ5laE8dl8VHKd9dIkfvj5AAsQekWcZOLd4eNPC
=DHgN
-----END PGP SIGNATURE-----

--nextPart2359477.GaViqbEBpf--

