From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH 2/3] reiser4: block_alloc: sanitize grab_enabled modifications.
Date: Sun, 16 Nov 2014 08:39:51 +0300
Message-ID: <8104890.sZBY8gmzym@intelfx-laptop>
References: <1408371283-1319-1-git-send-email-intelfx100@gmail.com> <5442A7B1.2030407@gmail.com> <32143848.hSvPupG6vO@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1618371.MB47nQR5nc"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=Vkc+yQ+xKLPfHCZmcBjtBQvsmDhckDhJ5TEcj8NPnp8=;
        b=ym0S+0G2CJTOTtiKJNTFHMsgUyuTHJdvCDsfBUL1MmAsEdUG1+pGYDa887kHCxde5s
         g4Uo07ZqLsXY+JwkGzBu0luGNtEIMBFSfw8SOchfLth5O3Ujv745cWhrAwmqxAlSl82Q
         sZGxBvja8HSBAUXmA9yvE+ZBQH/hfYF+FBgQEMaG3MXDDBz4YYSULoDo8yydVT2NL+zc
         RsQu0Gld0uya1YATHxMvXla4a2JOsBqzLO2cvUo+4MVl9JEq1mUVqk/vVuylwAB2XWEc
         0bWm8bz8ppBcRSkWkdisz0M4LDPXd1bW49kTUcdC4DtTk9pZl+jRSiIneJlsHNe+6m5p
         /FIw==
In-Reply-To: <32143848.hSvPupG6vO@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart1618371.MB47nQR5nc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 20 October 2014 at 13:43:50, Ivan Shapovalov wrote:=09
> On Saturday 18 October 2014 at 19:47:29, Edward Shishkin wrote:=09
> > On 08/18/2014 04:14 PM, Ivan Shapovalov wrote:
> > > - move all grab_enabled checks and modifications into reiser4_gra=
b_space();
> > > - only disable grab if not BA_FORCE;
> > > - do not re-enable grab before doing second attempt in BA_CAN_COM=
MIT sequence
> > >    (feels hackish and is unneeded after the first change).
> > >
> > > Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> > > ---
> > >   fs/reiser4/block_alloc.c | 22 ++++++++++++----------
> > >   1 file changed, 12 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
> > > index 7f9f910..a30f7b9 100644
> > > --- a/fs/reiser4/block_alloc.c
> > > +++ b/fs/reiser4/block_alloc.c
> > > @@ -270,12 +270,6 @@ reiser4_grab(reiser4_context * ctx, __u64 co=
unt, reiser4_ba_flags_t flags)
> > >  =20
> > >   =09assert("vs-1276", ctx =3D=3D get_current_context());
> > >  =20
> > > -=09/* Do not grab anything on ro-mounted fs. */
> > > -=09if (rofs_super(ctx->super)) {
> > > -=09=09ctx->grab_enabled =3D 0;
> > > -=09=09return 0;
> > > -=09}
> > > -
> > >   =09sbinfo =3D get_super_private(ctx->super);
> > >  =20
> > >   =09spin_lock_reiser4_super(sbinfo);
> > > @@ -300,9 +294,6 @@ reiser4_grab(reiser4_context * ctx, __u64 cou=
nt, reiser4_ba_flags_t flags)
> > >  =20
> > >   =09assert("nikita-2986", reiser4_check_block_counters(ctx->supe=
r));
> > >  =20
> > > -=09/* disable grab space in current context */
> > > -=09ctx->grab_enabled =3D 0;
> > > -
> > >   unlock_and_ret:
> > >   =09spin_unlock_reiser4_super(sbinfo);
> > >  =20
> > > @@ -321,6 +312,12 @@ int reiser4_grab_space(__u64 count, reiser4_=
ba_flags_t flags)
> > >   =09if (!(flags & BA_FORCE) && !is_grab_enabled(ctx))
> > >   =09=09return 0;
> > >  =20
> > > +=09/* Do not grab anything on ro-mounted fs. */
> > > +=09if (rofs_super(ctx->super)) {
> > > +=09=09ctx->grab_enabled =3D 0;
> > > +=09=09return 0;
> > > +=09}
> > > +
> > >   =09ret =3D reiser4_grab(ctx, count, flags);
> > >   =09if (ret =3D=3D -ENOSPC) {
> > >  =20
> > > @@ -328,10 +325,15 @@ int reiser4_grab_space(__u64 count, reiser4=
_ba_flags_t flags)
> > >   =09=09   present */
> > >   =09=09if (flags & BA_CAN_COMMIT) {
> > >   =09=09=09txnmgr_force_commit_all(ctx->super, 0);
> > > -=09=09=09ctx->grab_enabled =3D 1;
> > >   =09=09=09ret =3D reiser4_grab(ctx, count, flags);
> > >   =09=09}
> > >   =09}
> > > +
> > > +=09if (!(flags & BA_FORCE) && (ret =3D=3D 0)) {
> >=20
> >=20
> > Hmm, but we disabled it unconditionally in reiser4_grab().
> > Not sure, if this is equivalent...
>=20
> Yes, you are right. I can't recall any particular justification for t=
his
> change...

I've apparently "rediscovered" the justification. See my response to
PATCHv2 2/3...

=2D-=20
Ivan Shapovalov / intelfx /

> so it should probably say
>=20
>     if (ret =3D=3D 0) {
>=20
> > > +=09=09/* disable grab space in current context */
> > > +=09=09ctx->grab_enabled =3D 0;
> > > +=09}
> > 
--nextPart1618371.MB47nQR5nc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRoOKcACgkQxUKljSIMAnAe+wD/WTZk0D7vYkoeHKv7iUuqrTFm
3RywUd1An5a614OrlcIBAO3bWvMklzodXVi8AGWWq4x2ULlGF9gX6yHDzId4jN82
=M3vt
-----END PGP SIGNATURE-----

--nextPart1618371.MB47nQR5nc--

