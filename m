From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [veryRFC] [PATCH 0/2] reiser4: discard before dealloc: first approximation.
Date: Thu, 17 Jul 2014 13:46:44 +0400
Message-ID: <1921159.vPDThm1Mru@intelfx-laptop>
References: <53C652BE.4010203@gmail.com> <1405509844-30070-1-git-send-email-intelfx100@gmail.com> <53C70C38.3080002@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6860112.MQajr0WgrP"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=OYCHrBW3rOlopWuk6bZ356Qu7/ZHGmTjDDvPIujIYdI=;
        b=W6lZ5ragiNPUkLwJbJGpMfEBt2wjmFJbmYXQZbdzZJ48+nTcZreHqgy1JnjbUpzjKD
         ZA5cJswrwvKTQ9Nm2TDAeZOcMkx85/7l0LIgXF+J20VzNO/QNFah5XPmIE8AgfAA8Fvy
         L9OSAWmyy3h87YN9H07+lVAif06SdMXur2wBYlsqrjy+O62PPXxlWXadkInhJo1m/2lD
         ndm778yygO3ZxuT0qrPvfFZ48YN6T/fDAaE5vQ5/L9Nd5EksDw0Ns0ePzmnQvSUa3rA2
         qqY0CpsuKsZX7Mg2RbpCW9h9h0u5mVBVxwaxt1z8czG75PPmzwPaU649wYOKKP2aSfmI
         TFRQ==
In-Reply-To: <53C70C38.3080002@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart6860112.MQajr0WgrP
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Thursday 17 July 2014 at 01:35:20, Edward Shishkin wrote:=09
> On 07/16/2014 01:24 PM, Ivan Shapovalov wrote:
> > This needs your version of discard algorithm, because blocks inside=
 extents of
> > discard set are now marked as allocated.
>=20
>=20
> OK, I'll try to finish it in weekends..
>=20
>=20
> > BTW, have you dropped the case with erase unit size < block size?
>=20
>=20
> In my version all erase units are supported except ones which are
> not a power of 2. We can support all erase units without exceptions,
> if needed.

I mean, when erase unit size < block size, erase unit size is forced to=
 be
exactly one block. Again, this is OK, but in this case any alignment (b=
y
definition less than one block then) will be dropped and represented as=
 zero,
and _this_ deserves a warning :)

// btw, as you probably guess, these two patches are completely unteste=
d.

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /

>=20
>=20
> >   This is
> > probably OK, but configurations with nonzero alignments are then br=
oken.
>=20
>=20
> I support alignments with (bdev_discard_alignment % sb->s_blocksize =3D=
=3D 0)
> We can support all alignments without exceptions, but it will lead to=
=20
> complications
> in discard_sorted_extents().
>=20
>=20
> >   Not
> > worth handling these, I think, but nevertheless a warning could be =
useful ;)
>=20
> Agreed. It is important.
>=20
> Thanks!
> Edward.
>=20
>=20
> >
> > Ivan Shapovalov (2):
> >    reiser4: discard support: perform discards and deallocations aft=
er writing logs.
> >    reiser4: discard support: proof-of-concept for "discard before d=
ealloc".
> >
> >   fs/reiser4/block_alloc.c | 48 +++++++++++++++++++----------------=
=2D--
> >   fs/reiser4/discard.c     | 60 ++++++++++++++++++++++++++++++++++-=
=2D------------
> >   fs/reiser4/discard.h     |  4 +++-
> >   fs/reiser4/txnmgr.c      | 35 ----------------------------
> >   fs/reiser4/txnmgr.h      | 13 ++---------
> >   fs/reiser4/wander.c      |  3 ++-
> >   6 files changed, 73 insertions(+), 90 deletions(-)
> >
> 
--nextPart6860112.MQajr0WgrP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPHm4oACgkQxUKljSIMAnBNcwEA5e94k8Ypzu2RM5hlQgMgRBwz
XzZOHBqxvw4qTnCubTkBAOUF1E+jYQ0kIMqfpf/jz1tZcA4KgqLQcLqW+7gK/Lzn
=8bz1
-----END PGP SIGNATURE-----

--nextPart6860112.MQajr0WgrP--

