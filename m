From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCH 0/7] reiser4: batch discard support (FITRIM ioctl): initial implementation.
Date: Sun, 17 Aug 2014 20:18:37 +0400
Message-ID: <5846460.pSnBE1QeaT@intelfx-laptop>
References: <1408290206-7427-1-git-send-email-intelfx100@gmail.com> <CADW=+3kCURR6UB5Tm8OcJnSYV1cNcYtTmbNNrv_QCO3o1RzwDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7493840.Oj7zHQonOH"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=sDWGgkV3Ku9ZCZIW3CimqsZG/zjZNe2Z1trNEgnM114=;
        b=Z8LfSlYpl6lwn3yxhCKb+Dx6XK2UD3wlwtNpvh7Ev0bIPFAos4oa8RXh9JU2ya3YwJ
         TiNQY512Rf+z/UIzNGqjl53SNV34pVKCxIW1fHU65LSX5+G/OLdbhrT/K/07RVtWCEWi
         I/stvVk9uN7VNOi/OoALcz8oNRBxVGd2byNE83Dl86u2NwxwnHKVBSXETdNb8SHk9awf
         JXLi5k8h5P+4NJSnPoAE6HbLgTo22ZqIXIJhPXHZr06OmGlM+WqWBBttjzhC/91brlkc
         AOlRhl5t3wCK/eJxtG6+JKrmT4Qyuft2wS191jHbDY9iWVxANEKSpMhE2lW23dKhtTHw
         0d2Q==
In-Reply-To: <CADW=+3kCURR6UB5Tm8OcJnSYV1cNcYtTmbNNrv_QCO3o1RzwDQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: =?utf-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>


--nextPart7493840.Oj7zHQonOH
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Sunday 17 August 2014 at 18:14:10, Du=C5=A1an =C4=8Coli=C4=87 wrote:=
=09
> [...]
> >
> > Points I'm really uncertain of:
> > - grabbing fixed amount of space (new BA_SOME_SPACE flag, grabs 25%=
 of
> disk space)
>=20
> Maybe grabbing 25% of remaining empty disk space would be better?

What do you mean by "remaining"? 25% is recalculated on each iteration.=

However, the reserved and allocated disk space is reclaimed at the end
of each iteration, so the amount really stays the same.

=2D-=20
Ivan Shapovalov / intelfx /

>=20
> > - creation of empty atoms (reiser4_create_atom())
> > - handling of empty atoms in commit_current_atom()
> >
> [...]
--nextPart7493840.Oj7zHQonOH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPw1eQACgkQxUKljSIMAnAEiAEA0kcztL87ljQWVHbGvPNl6Btu
aRoeIBpXmNQriq7tkBoA/RF+dHtaw73L36Bfo2HVcPGnDiNv9bs/AOo8roQvhKN/
=djYV
-----END PGP SIGNATURE-----

--nextPart7493840.Oj7zHQonOH--

