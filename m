From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Wed, 18 Jun 2014 13:55:18 +0400
Message-ID: <2155505.AXPj8Qz6Nx@intelfx-laptop>
References: <3401431.jj87z7i0xD@intelfx-laptop> <1517464.b3HDrHDRa3@intelfx-laptop> <53A0EE30.3090303@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2352607.UP22oooQhE"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=l4XYzcPhf4hUSrEL9X8dmCtSI4xqAYzQXeRrQTpTbUc=;
        b=BIN1AamtrZ51KezuKiq7JZk0f/yOZqNcc0n3qRsmrXzHNMdQliQV9zx1z4T+NsGQ9z
         fcT6LEOX7xpCxL54BtHgfckev4vETwpsm2vvRIRgxa6q1JH9pbIYvUgokMiXPDQxqTzp
         qv8OEwGkW/F9YuvSjDmRg44NXhAyyOXESn2rVu5JQycwpwhWnmAFPgvCQZxgGK1XK8Ij
         cYNA7ab0CjgmEv4MPZCx0/WCTXMUZZ5QFMpQr/PYpl0T13IIC2xfzme55u54Mqj/W/nS
         TRraFh58y7An/WdzXnZMahM7ZVTwOSr60IzhCYpiHxgxBYQMBz99kh757faFRkFlp3fp
         fMUw==
In-Reply-To: <53A0EE30.3090303@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart2352607.UP22oooQhE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Wednesday 18 June 2014 at 03:41:04, Edward Shishkin wrote:=09
>=20
> On 06/17/2014 10:47 PM, Ivan Shapovalov wrote:
> > On Tuesday 17 June 2014 at 22:31:36, Ivan Shapovalov wrote:=09
> >> On Tuesday 17 June 2014 at 12:29:53, Edward Shishkin wrote:=09
> >>> [...]
> >>>
> >>> Yup.
> >>> So, if discard is on, we work with 2 lists (delete_set,
> >>> delete_set_for_wander).
> >>> If discard is off, we work with one blocknr set..
> >> Good. So I'll do roughly following for v5:
> >> - rename discard_set_* to block_list_* and split off these definit=
ions
> >> - write a family of reiser4_atom_dset_*() (log_deferred, log_immed=
iate,
> >>    apply_deferred, merge, init, destroy) which will encapsulate di=
scard/nodiscard
> >>    check and operate on correct lists (blocknr_set vs block_list)
> >> - call reiser4_atom_dset_{init,destroy,merge}() from respective fu=
nctions
> >> - call reiser4_atom_dset_log_{deferred,immediate}() from reiser4_d=
ealloc_blocks()
> >> - call reiser4_atom_dset_apply_deferred() from reiser4_post_commit=
_hook()
> >> - directly manipulate the block lists from discard_atom(), checkin=
g that we
> >>    indeed have discard enabled
> >>
> >> Is this OK?
> > BTW, with txn_atoms there is a locking idiom involving E_REPEAT loo=
ps.
> >
> > Is it fine to implement a
> > current_atom_dset_log_...(...) // E_REPEAT loop inside
> > instead of
> > atom_dset_log_...(txn_atom* atom, ...)
>=20
> IMHO it is not needed.
>=20
> atom =3D get_current_atom_locked();
> atom_dset_{defer, immed}_add_extent(atom, ...); // <-- the loop is he=
re
> spin_unlock_atom(atom);

IIUC, the point of the E_REPEAT loop is that memory allocations must be=
 done
with atom spinlock released, and once released, the atom may "disappear=
", so
it is unsafe to use the same pointer again. Hence there is a loop of

void *data =3D NULL;

do {
    atom =3D get_current_atom_locked();
    ret =3D blocknr_set_add_extent(atom, &atom->delete_set, &data, ...)=
;
} while (ret =3D=3D -E_REPEAT);

where `data` is a piece of "state" saved across the two blocknr_set_add=
_extent()
calls. On first iteration of the loop, atom lock is released, memory is=

allocated and pointer is stored in `data`, and -E_REPEAT is returned.
On second iteration of the loop, the previously allocated memory is acc=
essed
and the atom is modified under its spinlock.

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart2352607.UP22oooQhE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOhYgsACgkQxUKljSIMAnBrvgEAzEPL2gVriz4GPfjBqrsgSN80
nTW9Xqf0vuI5lV4I75sA/0zPu6YhxFFVuXhvIwCrTogQpQVj/n9Xq2sIhOF3+hQH
=u+R6
-----END PGP SIGNATURE-----

--nextPart2352607.UP22oooQhE--

