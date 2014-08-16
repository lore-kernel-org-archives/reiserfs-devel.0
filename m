From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Sat, 16 Aug 2014 21:05:16 +0400
Message-ID: <2229007.oN40ML3YOA@intelfx-laptop>
References: <3405506.BC0S4TX54B@intelfx-laptop> <2295734.UIR3OjHuyC@intelfx-laptop> <53EF5E2E.6000109@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart176040932.GJHDJh03e3"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=vqWNtb8qGU+iX48TxQvg92R+LzNbrn+fKOBBazSPRUM=;
        b=FiqQNHU0Rx/fd1XUezGd+oUUkYXqTFsu2r8GDBU8N0zBIiqRHbbPFP/uqQmxGMm68I
         M6pDRjkg/yXfF/GJI5b+rEolQw1DihEy7AdmjipD2gsLoVZPl5ecvvPReugB4CXKdhBm
         mGlE/s3tcGPHzX5BeBrl05qRxl6tawYbYdF2UQ/3mjQe4jW6jejwJV8oQWlIPoweaj5/
         CZHBW3dtf5WtK0CWdYEHGAoNBHc+6jTzQwjn9/qDmkOPt2wPI6AdpouqVp/D7AOicC1L
         NDnRUkiyT5l4MWzPJyDzhPpJZixrd76mlv5AYOHFnlW09UreueRyDvFT/WRCApm3a0xU
         CA5w==
In-Reply-To: <53EF5E2E.6000109@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart176040932.GJHDJh03e3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Saturday 16 August 2014 at 15:35:42, Edward Shishkin wrote:=09
>=20
> On 08/16/2014 01:27 PM, Ivan Shapovalov wrote:
> > On Saturday 16 August 2014 at 10:23:08, Edward Shishkin wrote:=09
> >> [...]
> >>>> So I need to find a way to take rwsem in a read-biased mode... A=
ny
> >>>> advice is
> >>>> accepted, including "give up with adding of yet another lock and=
 go with
> >>>> multiple transactions" :)
> >>>
> >>> IMHO this is too complicated.
> >>>
> >>> Why don't you want to grab, say, 20M per iteration?
> >>> It should work without any problems, just maintain a
> >>> counter of blocks allocated in the iteration..
> > I see it mostly like a "good to have" thing.
>=20
>=20
> Nop, we discuss the reasonable implementation of the "must have" -
> space reservation by the fitrim process..
>=20
>=20
> >   When the system is under load,
> > FITRIM implemented in this "simple" way will be ineffective: it wil=
l miss
> > some blocks that are temporarily allocated (journal, etc.)
>=20
>=20
> It will be perfectly discarded by the realtime discard
>=20
>=20
> >   even though it is
> > theoretically possible to stop accepting new transactions, commit a=
ll existing
> > ones and perform discard while the system is artificially made idle=
, then
> > resume everything.
>=20
>=20
> IMHO complicated and not need.
> Anyway, missing 2 blocks per device is not critical.

OK. Giving up then. Let's go the multiple transaction approach.

>=20
>=20
> >
> > So I've been trying to check if this is feasible. Looks like it isn=
't.
> >
> >> add the counter to the struct reiser4_context and
> >> set it to zero at the beginning of every iteration.
> >> use get_current_context() to access the counter.
> > Is it needed? The simple way is just a loop consisting of
> > - grab space
> > - allocate blocks forward from start position (initially 0) until e=
nd of
> >    partition or limit reached
> > - update start position to `last allocated block + 1`
> > - put allocated space to the delete set
> > - mark for force-committing
> > - reiser4_txn_restart_current()
> > - if we've reached end of partition earlier, break, otherwise loop
> >
>=20
>=20
> Ok, it will also work (with more iterations, though),
> well, let's do so..

More iterations? It seems like I don't really understand your idea
with the counter.
Could you please elaborate a bit?

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart176040932.GJHDJh03e3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPvj0wACgkQxUKljSIMAnBa4gD/YcRlwkia/znCck4wScbHmmbn
jPdLozRFZBIBnmzvTqsBALvU3ayg5YhZS9/XzYfgjFUVf1dGx3xl5VmeDrcZNJya
=MTs1
-----END PGP SIGNATURE-----

--nextPart176040932.GJHDJh03e3--

