From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv2 2/3] reiser4: block_alloc: sanitize grab_enabled modifications.
Date: Wed, 19 Nov 2014 04:39:10 +0300
Message-ID: <2621673.rSzuMbAR7S@intelfx-laptop>
References: <1414048685-4224-1-git-send-email-intelfx100@gmail.com> <546873FF.6040804@gmail.com> <5468805B.2070609@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1695413.eXB6hLkgNU"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=yqhZiW0syc1G5iFlH7eevGz9i1QXv4aYNJUHrPozApk=;
        b=vZCoedOBl2dJX7J1Sz4G/iUJhIvmnu9MfJuWFS8H4ZjP8Gy0kHrFuHyiR+TA6End90
         /+a77HsCFpqYCYIjKmOsuA6b7r2jGiMYzQh8u4pPTVEGF4KUqIVFlIGlHP3HZxNlR7Tp
         cYg/VorNy3z7ywu+1eYkCAcJ+sARA2VkeBlVxPz+f9J+JUCySOr5UUEBWoioFDx8WxLq
         ggR/6rAeWLArD4lqSxp7+9bGFeNACnhZWNJ8YS8Rnx4EFjVykqmzs2yN/9+C6ApLlrwV
         xNyB8vwAUo9gmuLIbu3o7qjR9RNQ6XnZ1OwAcx9aUXHQLReZlFNGo3SXOgKKAw1O99Xy
         0k7w==
In-Reply-To: <5468805B.2070609@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1695413.eXB6hLkgNU
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Sunday 16 November 2014 at 11:45:47, Edward Shishkin wrote:=09
>=20
> On 11/16/2014 10:53 AM, Edward Shishkin wrote:
> >
> > On 11/16/2014 06:38 AM, Ivan Shapovalov wrote:
> >> On Thursday 23 October 2014 at 11:18:04, Ivan Shapovalov wrote:
> >>> - check and modify ctx->grab_enabled in reiser4_grab_space(), not=
=20
> >>> reiser4_grab()
> >>> - do not re-enable grab before doing second attempt in BA_CAN_COM=
MIT=20
> >>> sequence
> >>>    (it is unneeded given the first change)
> >> ...testing has revealed that this is wrong. Please see below.
> >>
> >>> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> >>> ---
> >>>   fs/reiser4/block_alloc.c | 22 ++++++++++++----------
> >>>   1 file changed, 12 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
> >>> index 7f9f910..9339de7 100644
> >>> --- a/fs/reiser4/block_alloc.c
> >>> +++ b/fs/reiser4/block_alloc.c
> >>> @@ -270,12 +270,6 @@ reiser4_grab(reiser4_context * ctx, __u64=20=

> >>> count, reiser4_ba_flags_t flags)
> >>>         assert("vs-1276", ctx =3D=3D get_current_context());
> >>>   -    /* Do not grab anything on ro-mounted fs. */
> >>> -    if (rofs_super(ctx->super)) {
> >>> -        ctx->grab_enabled =3D 0;
> >>> -        return 0;
> >>> -    }
> >>> -
> >>>       sbinfo =3D get_super_private(ctx->super);
> >>>         spin_lock_reiser4_super(sbinfo);
> >>> @@ -300,9 +294,6 @@ reiser4_grab(reiser4_context * ctx, __u64 cou=
nt,=20
> >>> reiser4_ba_flags_t flags)
> >>>         assert("nikita-2986",=20
> >>> reiser4_check_block_counters(ctx->super));
> >>>   -    /* disable grab space in current context */
> >>> -    ctx->grab_enabled =3D 0;
> >>> -
> >>>   unlock_and_ret:
> >>>       spin_unlock_reiser4_super(sbinfo);
> >>>   @@ -321,6 +312,12 @@ int reiser4_grab_space(__u64 count,=20
> >>> reiser4_ba_flags_t flags)
> >>>       if (!(flags & BA_FORCE) && !is_grab_enabled(ctx))
> >>>           return 0;
> >>>   +    /* Do not grab anything on ro-mounted fs. */
> >>> +    if (rofs_super(ctx->super)) {
> >>> +        ctx->grab_enabled =3D 0;
> >>> +        return 0;
> >>> +    }
> >>> +
> >>>       ret =3D reiser4_grab(ctx, count, flags);
> >>>       if (ret =3D=3D -ENOSPC) {
> >>>   @@ -328,10 +325,15 @@ int reiser4_grab_space(__u64 count,=20
> >>> reiser4_ba_flags_t flags)
> >>>              present */
> >>>           if (flags & BA_CAN_COMMIT) {
> >>>               txnmgr_force_commit_all(ctx->super, 0);
> >>> -            ctx->grab_enabled =3D 1;
> >>>               ret =3D reiser4_grab(ctx, count, flags);
> >>>           }
> >> Here, txnmgr_force_commit_all() performs space grabbing (with=20
> >> BA_FORCE flag)
> >> and as such indirectly sets ctx->grab_enabled to 0.
> >>
> >> Initial problem.
> >> Situation: ctx->grab_enabled =3D=3D 0
> >> Call: reiser4_grab_space(toomany, BA_FORCE | BA_CAN_COMMIT)
> >> * first reiser4_grab() returns -ENOSPC
> >> * txnmgr_force_commit_all() is called
> >> * ctx->grab_enabled is set to 1 by us
> >> * second reiser4_grab() returns -ENOSPC as well
> >> Result: ctx->grab_enabled =3D=3D 1
> >>
> >> Problem with this patch.
> >> Situation: ctx->grab_enabled =3D=3D 1
> >> Call: reiser4_grab_space(toomany, BA_CAN_COMMIT)
> >> * first reiser4_grab() returns -ENOSPC
> >> * txnmgr_force_commit_all() is called and sets ctx->grab_enabled t=
o 0
> >> * second reiser4_grab() returns -ENOSPC as well
> >> Result: no grab performed, but ctx->grab_enabled =3D=3D 0.
> >>   Solution 1:
> >> save and restore ctx->grab_enabled across call to=20
> >> txnmgr_force_commit_all();
> >>
> >> Solution 2:
> >> make txnmgr_force_commit_all() not touch ctx->grab_enabled,
> >> i. e. set ctx->grab_enabled to 0 only if !BA_FORCE.
> >>
> >> What would you suggest?
> >
> >
> > Could you please remind, what problem
> > this patch series (sanitize grab_enabled) fixes?
>=20
>=20
> To be clear, I forgot why I included this patch series.

This patch series hasn't yet been merged, has it?

> What is the system crash, or disk space leak, or something else..?

There is no particular problem. You can think it's a kind of "refactori=
ng".

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1695413.eXB6hLkgNU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRr9MMACgkQxUKljSIMAnA/AgD+OrkpVzls6bFgEyS02hZwd415
bmJtk+l/1AIMLODOzG4A/2GCCHq2xOgQe/fMPxJzX70v46jal0JUjdMw/9QSyHvo
=NxGv
-----END PGP SIGNATURE-----

--nextPart1695413.eXB6hLkgNU--

