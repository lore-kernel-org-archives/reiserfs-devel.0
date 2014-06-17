From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Wed, 18 Jun 2014 00:47:45 +0400
Message-ID: <1517464.b3HDrHDRa3@intelfx-laptop>
References: <3401431.jj87z7i0xD@intelfx-laptop> <53A018A1.5030403@gmail.com> <1775901.eB9J0phJSL@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3240232.yzpVVUh1Ws"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=oqZRD2iD1brJc7BV0xQfkxbz4nnUjM4rmhbhV97w7TE=;
        b=uoUhyhm9ePjsAdcivVR/xHXRTo8DNDNsmZdf5KPFbhD1Ggl7DorYM6e84FAJe/YWIn
         kP/ZZ8IHQvM2PISOGNzqp+Y4MwA607CT8FU/dBgYjRJ41N4CTr7+281AbfxGRb7SvKGB
         rAHbQPpHR8JVymCJOXVRReYd6FG++SifEx9ABMA7qALAn+wFKoeP8/zHB6hyBATA5sUb
         vOlfIBpLGWTFIIOV/+0+otAbCqSwg7wFrAaoSOznKuN2ihRzEsU+hK9Vyz3Qy3ibXA+S
         aCZmajDlaSFt+QO3Jw1mEldIbabohKXdzUbavVHyVqVcMEvCuczVQXLnPSQHTpRQaKzy
         XWug==
In-Reply-To: <1775901.eB9J0phJSL@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart3240232.yzpVVUh1Ws
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday 17 June 2014 at 22:31:36, Ivan Shapovalov wrote:=09
> On Tuesday 17 June 2014 at 12:29:53, Edward Shishkin wrote:=09
> >=20
> > [...]
> >=20
> > Yup.
> > So, if discard is on, we work with 2 lists (delete_set,=20
> > delete_set_for_wander).
> > If discard is off, we work with one blocknr set..
>=20
> Good. So I'll do roughly following for v5:
> - rename discard_set_* to block_list_* and split off these definition=
s
> - write a family of reiser4_atom_dset_*() (log_deferred, log_immediat=
e,
>   apply_deferred, merge, init, destroy) which will encapsulate discar=
d/nodiscard
>   check and operate on correct lists (blocknr_set vs block_list)
> - call reiser4_atom_dset_{init,destroy,merge}() from respective funct=
ions
> - call reiser4_atom_dset_log_{deferred,immediate}() from reiser4_deal=
loc_blocks()
> - call reiser4_atom_dset_apply_deferred() from reiser4_post_commit_ho=
ok()
> - directly manipulate the block lists from discard_atom(), checking t=
hat we
>   indeed have discard enabled
>=20
> Is this OK?

BTW, with txn_atoms there is a locking idiom involving E_REPEAT loops.

Is it fine to implement a
current_atom_dset_log_...(...) // E_REPEAT loop inside
instead of
atom_dset_log_...(txn_atom* atom, ...) // may return E_REPEAT
?

I mean, per coding style.

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart3240232.yzpVVUh1Ws
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOgqXUACgkQxUKljSIMAnC+FwEAvOqoXXH0hKlw2K57AZX/4fGV
fGAz4L10v11o3aSu32QA/R51k7iltwgVEphdqq5DHIr2wonvTsmBIkkyy1hDPrzk
=N2hD
-----END PGP SIGNATURE-----

--nextPart3240232.yzpVVUh1Ws--

