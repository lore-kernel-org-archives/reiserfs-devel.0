From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv2 2/3] reiser4: block_alloc: sanitize grab_enabled modifications.
Date: Sun, 16 Nov 2014 08:38:23 +0300
Message-ID: <2228941.DWoZ5v2hiQ@intelfx-laptop>
References: <1414048685-4224-1-git-send-email-intelfx100@gmail.com> <1414048685-4224-3-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5937969.eShBBTWfS6"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:user-agent:in-reply-to:references
         :mime-version:content-type;
        bh=D3CqV5WGmvpMAknNZUqin9eAdKj8fYHC1RjbkS7OGrE=;
        b=R7gdYtdfgSFxMF7S2hKlHwopKTeGXXjBJ0r93lXtXL4r3dEp0hwvNcqwKka3F2utoT
         X3XWbEdwo8367lBmaf6vKe1D7oFZdPpD5XdtOQtigpGilSm9qpfFtxOSCDuGzZ00ZPaq
         fMHVGh5/0FIGS0BLLSCIVwSUEEZDjCdDUP7iIuE56GIbZcMHYbZLmwfpYeHXzg8PX66e
         +APT0HFa2ihJ7K2laAGvCm/5JylSJqNFNATtsFk7RVGQrUtSRQx2d8bGbG5jWQD67XGT
         NkOWp1vmh7W+1Cq/3aR+v7s8qPvBi3+kjJSnRJKuvgPA/FLeMutjk47trG4JJbnfpTa0
         meaw==
In-Reply-To: <1414048685-4224-3-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org


--nextPart5937969.eShBBTWfS6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Thursday 23 October 2014 at 11:18:04, Ivan Shapovalov wrote:=09
> - check and modify ctx->grab_enabled in reiser4_grab_space(), not rei=
ser4_grab()
> - do not re-enable grab before doing second attempt in BA_CAN_COMMIT =
sequence
>   (it is unneeded given the first change)

...testing has revealed that this is wrong. Please see below.

>=20
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>  fs/reiser4/block_alloc.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>=20
> diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
> index 7f9f910..9339de7 100644
> --- a/fs/reiser4/block_alloc.c
> +++ b/fs/reiser4/block_alloc.c
> @@ -270,12 +270,6 @@ reiser4_grab(reiser4_context * ctx, __u64 count,=
 reiser4_ba_flags_t flags)
> =20
>  =09assert("vs-1276", ctx =3D=3D get_current_context());
> =20
> -=09/* Do not grab anything on ro-mounted fs. */
> -=09if (rofs_super(ctx->super)) {
> -=09=09ctx->grab_enabled =3D 0;
> -=09=09return 0;
> -=09}
> -
>  =09sbinfo =3D get_super_private(ctx->super);
> =20
>  =09spin_lock_reiser4_super(sbinfo);
> @@ -300,9 +294,6 @@ reiser4_grab(reiser4_context * ctx, __u64 count, =
reiser4_ba_flags_t flags)
> =20
>  =09assert("nikita-2986", reiser4_check_block_counters(ctx->super));
> =20
> -=09/* disable grab space in current context */
> -=09ctx->grab_enabled =3D 0;
> -
>  unlock_and_ret:
>  =09spin_unlock_reiser4_super(sbinfo);
> =20
> @@ -321,6 +312,12 @@ int reiser4_grab_space(__u64 count, reiser4_ba_f=
lags_t flags)
>  =09if (!(flags & BA_FORCE) && !is_grab_enabled(ctx))
>  =09=09return 0;
> =20
> +=09/* Do not grab anything on ro-mounted fs. */
> +=09if (rofs_super(ctx->super)) {
> +=09=09ctx->grab_enabled =3D 0;
> +=09=09return 0;
> +=09}
> +
>  =09ret =3D reiser4_grab(ctx, count, flags);
>  =09if (ret =3D=3D -ENOSPC) {
> =20
> @@ -328,10 +325,15 @@ int reiser4_grab_space(__u64 count, reiser4_ba_=
flags_t flags)
>  =09=09   present */
>  =09=09if (flags & BA_CAN_COMMIT) {
>  =09=09=09txnmgr_force_commit_all(ctx->super, 0);
> -=09=09=09ctx->grab_enabled =3D 1;
>  =09=09=09ret =3D reiser4_grab(ctx, count, flags);
>  =09=09}

Here, txnmgr_force_commit_all() performs space grabbing (with BA_FORCE =
flag)
and as such indirectly sets ctx->grab_enabled to 0.

Initial problem.
Situation: ctx->grab_enabled =3D=3D 0
Call: reiser4_grab_space(toomany, BA_FORCE | BA_CAN_COMMIT)
* first reiser4_grab() returns -ENOSPC
* txnmgr_force_commit_all() is called
* ctx->grab_enabled is set to 1 by us
* second reiser4_grab() returns -ENOSPC as well
Result: ctx->grab_enabled =3D=3D 1

Problem with this patch.
Situation: ctx->grab_enabled =3D=3D 1
Call: reiser4_grab_space(toomany, BA_CAN_COMMIT)
* first reiser4_grab() returns -ENOSPC
* txnmgr_force_commit_all() is called and sets ctx->grab_enabled to 0
* second reiser4_grab() returns -ENOSPC as well
Result: no grab performed, but ctx->grab_enabled =3D=3D 0.
=20
Solution 1:
save and restore ctx->grab_enabled across call to txnmgr_force_commit_a=
ll();

Solution 2:
make txnmgr_force_commit_all() not touch ctx->grab_enabled,
i. e. set ctx->grab_enabled to 0 only if !BA_FORCE.

What would you suggest?

=2D-=20
Ivan Shapovalov / intelfx /

>  =09}
> +
> +=09if (ret =3D=3D 0) {
> +=09=09/* disable grab space in current context */
> +=09=09ctx->grab_enabled =3D 0;
> +=09}
> +
>  =09/*
>  =09 * allocation from reserved pool cannot fail. This is severe erro=
r.
>  =09 */
> 
--nextPart5937969.eShBBTWfS6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRoOFQACgkQxUKljSIMAnCe6wD/TRkJJsBzfEB7q8MYMvIkb1NR
38+OLB9k+yeHaUM+5CkBALnxLqM6e1qmWTUK7eibLN/Ac3SIJg0tD0WofmBq8HG9
=eXw1
-----END PGP SIGNATURE-----

--nextPart5937969.eShBBTWfS6--

