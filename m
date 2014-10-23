From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv3 2/9] reiser4: block_alloc: add a "forward" parameter to reiser4_blocknr_hint to allocate blocks only in forward direction.
Date: Thu, 23 Oct 2014 11:24:13 +0400
Message-ID: <3138233.23nIal2kT0@intelfx-laptop>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <1408312379-1990-3-git-send-email-intelfx100@gmail.com> <544680BF.5040204@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2205438.H2QEBUHNQO"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=2wrlA9H1d1Iaf2FlEX8l4VrNOehfDqgzGI0D867O2/0=;
        b=CdSbLnKGIdn0Dz2k3xpbWi7kfU9+QsZCgorcscV/XVJ1iMldBhtMd7GZX02EhEIeIa
         wR7njY/Wgx8jTPylzJZ1tyh7D3/fj48TTS83AoKbumLWCfwVnhWcTXNN5nF9Tex9X7en
         BQG4mr1ukWq3bevmziet2yH9lZWwtC35aTt9yP2dU+koOg4xKklcAD03vBZGutM+0MaI
         eDz79VgNDo8vj+Agt3v+mWp9wD/Y9/klXz6NyZKqNtX0PZ1c4PMDGLr8BoBLir1LaFiM
         O/GP0H64+/Pe2KrzUVkfRfy3/aBYKnahD2Dc8U8he1zIPb9Bflp9bUWu8NJzwLB/wLZL
         0fgg==
In-Reply-To: <544680BF.5040204@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart2205438.H2QEBUHNQO
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 October 2014 at 17:50:23, Edward Shishkin wrote:=09
> On 08/17/2014 11:52 PM, Ivan Shapovalov wrote:
> > Signed-off-by: Ivan Shapovalov<intelfx100@gmail.com>
> > ---
> >   fs/reiser4/block_alloc.h         | 5 +++--
> >   fs/reiser4/plugin/space/bitmap.c | 3 ++-
> >   2 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/reiser4/block_alloc.h b/fs/reiser4/block_alloc.h
> > index bfc6be9..08b3941 100644
> > --- a/fs/reiser4/block_alloc.h
> > +++ b/fs/reiser4/block_alloc.h
> > @@ -51,9 +51,10 @@ struct reiser4_blocknr_hint {
> >   =09/* block allocator assumes that blocks, which will be mapped t=
o disk,
> >   =09   are in this specified block_stage */
> >   =09block_stage_t block_stage;
> > -=09/* If direction =3D 1 allocate blocks in backward direction fro=
m the end
> > -=09 * of disk to the beginning of disk.  */
> > +=09/* Allocate blocks only in backward direction starting from blk=
. */
> >   =09unsigned int backward:1;
> > +=09/* Allocate blocks only in forward direction starting from blk.=
 */
> > +=09unsigned int forward:1;
>=20
>=20
> I suggest to call this bitfield "monotonic_forward"

Isn't it an opposite of "backward"? Should we rename both?

BTW, in plugin/space/bitmap.c:1141 (around that line)
in function alloc_blocks_forward()
shouldn't the second scan be done with bitmap_alloc_backward(), as per =
the
comment?

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /

> >  =20
> >   };
> >  =20
> > diff --git a/fs/reiser4/plugin/space/bitmap.c b/fs/reiser4/plugin/s=
pace/bitmap.c
> > index 3da3f6b..9beaf66 100644
> > --- a/fs/reiser4/plugin/space/bitmap.c
> > +++ b/fs/reiser4/plugin/space/bitmap.c
> > @@ -1127,7 +1127,8 @@ static int alloc_blocks_forward(reiser4_block=
nr_hint *hint, int needed,
> >   =09/* There is only one bitmap search if max_dist was specified o=
r first
> >   =09   pass was from the beginning of the bitmap. We also do one p=
ass for
> >   =09   scanning bitmap in backward direction. */
> > -=09if (!(actual_len !=3D 0 || hint->max_dist !=3D 0 || search_star=
t =3D=3D 0)) {
> > +=09if (actual_len =3D=3D 0 && search_start !=3D 0 &&
> > +=09    hint->max_dist =3D=3D 0 && hint->forward =3D=3D 0) {
> >   =09=09/* next step is a scanning from 0 to search_start */
> >   =09=09search_end =3D search_start;
> >   =09=09search_start =3D 0;
>=20
>=20
> OK with this patch,
> I'll continue to review this patch series at leisure.
>=20
> Thanks,
> Edward.
--nextPart2205438.H2QEBUHNQO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRIrR0ACgkQxUKljSIMAnAQRwEAq7TtQZewKd7K1+2CKrmhiC7A
7HzUJT/zfP+QD3RJ0C8BAJ21e/j5+uT/o6BrGMIxqJHK835PzWputczCDkNBjf6I
=haKl
-----END PGP SIGNATURE-----

--nextPart2205438.H2QEBUHNQO--

