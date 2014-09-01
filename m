From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH 1/2] reiser4: sanitize deallocations throughout the code.
Date: Mon, 01 Sep 2014 17:24:08 +0400
Message-ID: <1599366.K3TzElihVn@intelfx-laptop>
References: <1408361471-1488-1-git-send-email-intelfx100@gmail.com> <1408361471-1488-2-git-send-email-intelfx100@gmail.com> <540305F3.5040204@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1893256.UtuuVivxxb"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=dy5uE9VHl66G7bY1eAZhCSE5o8wYaXgGZKGtxVSRZ1k=;
        b=ixZHwRdes0pBcZszK+Vz0RD+W6BRGDoanXDEj+v3ByaR/EPcou6FB7bzefn/IKezWQ
         viq+U7OGscOIvuUi2N6EN6ES3Mk0C8zbYiJq/RHOBUZ37N4BPp+5moRqaGGnWG5NrfEf
         XE5+IdkWNgGnU0B+xC04WDx6h8GHtNjNH4c+F7W+7G8cXLE7CquuA1POaUN/CI5X1FPb
         5XncbPJpy/w8UkK+mF8zWdEQz8ePOXeRr+2829rrjulpwPoC6LiYnlFPouq5rY9Nirht
         3SKKd9jiza11d67GftU69tkjv6vg4ugF3qDDOEtS2OPBQQZ3NAy0XxTMM4jCtdiPovRU
         C8Pw==
In-Reply-To: <540305F3.5040204@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1893256.UtuuVivxxb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Sunday 31 August 2014 at 13:24:35, Edward Shishkin wrote:=09
>=20
> On 08/18/2014 01:31 PM, Ivan Shapovalov wrote:
> > - Deferred (BA_DEFER) deallocations do not make use of target stage=
 and
> >    other flags, so remove them to avoid confusion.
> > - mark final deallocations in wandering log code as deferred.
> >
> > With the last point, there is a clear semantic distinction between
> > deferred and immediate deallocations.
> > Deferred mode is used to deallocate blocks that were previously wri=
tten,
> > immediate mode is used to deallocate "just allocated" blocks in err=
or
> > paths or if some previously allocated blocks turn out to be unneede=
d.
> >
> > This way, we may get rid of discard-related hack in the deallocatio=
n routine,
> > i. e. treating immediate deallocations as deferred (which messes up=

> > block accounting). This is done in the next commit.
> >
> > Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> > ---
> >   fs/reiser4/plugin/txmod.c | 18 ++++++------------
> >   fs/reiser4/tree.c         |  3 +--
> >   fs/reiser4/wander.c       |  5 ++---
> >   3 files changed, 9 insertions(+), 17 deletions(-)
> >
> > diff --git a/fs/reiser4/plugin/txmod.c b/fs/reiser4/plugin/txmod.c
> > index 63d461f..d8a99b7 100644
> > --- a/fs/reiser4/plugin/txmod.c
> > +++ b/fs/reiser4/plugin/txmod.c
> > @@ -287,8 +287,7 @@ static int forward_relocate_unformatted(flush_p=
os_t *flush_pos,
> >   =09=09 * on relocating - free nodes which are going to be
> >   =09=09 * relocated
> >   =09=09 */
> > -=09=09reiser4_dealloc_blocks(&start, &allocated,
> > -=09=09=09=09       BLOCK_ALLOCATED, BA_DEFER);
> > +=09=09reiser4_dealloc_blocks(&start, &allocated, 0, BA_DEFER);
> >  =20
> >   =09/* assign new block numbers to protected nodes */
> >   =09assign_real_blocknrs(flush_pos, oid, index, allocated, first_a=
llocated);
> > @@ -386,16 +385,13 @@ static squeeze_result squeeze_relocate_unform=
atted(znode *left,
> >   =09result =3D put_unit_to_end(left, key, &copy_extent);
> >  =20
> >   =09if (result =3D=3D -E_NODE_FULL) {
> > -=09=09int target_block_stage;
> >   =09=09/*
> >   =09=09 * free blocks which were just allocated
> >   =09=09 */
> > -=09=09target_block_stage =3D
> > -=09=09=09(state =3D=3D
> > -=09=09=09 ALLOCATED_EXTENT) ? BLOCK_FLUSH_RESERVED :
> > -=09=09=09BLOCK_UNALLOCATED;
> >   =09=09reiser4_dealloc_blocks(&first_allocated, &allocated,
> > -=09=09=09=09       target_block_stage,
> > +=09=09=09=09       (state =3D=3D ALLOCATED_EXTENT)
> > +=09=09=09=09       ? BLOCK_FLUSH_RESERVED
> > +=09=09=09=09       : BLOCK_UNALLOCATED,
> >   =09=09=09=09       BA_PERMANENT);
> >   =09=09/*
> >   =09=09 * rewind the preceder
> > @@ -408,8 +404,7 @@ static squeeze_result squeeze_relocate_unformat=
ted(znode *left,
> >   =09=09/*
> >   =09=09 * free nodes which were relocated
> >   =09=09 */
> > -=09=09reiser4_dealloc_blocks(&start, &allocated,
> > -=09=09=09=09       BLOCK_ALLOCATED, BA_DEFER);
> > +=09=09reiser4_dealloc_blocks(&start, &allocated, 0, BA_DEFER);
> >   =09}
> >   =09/*
> >   =09 * assign new block numbers to protected nodes
> > @@ -689,8 +684,7 @@ static int forward_try_defragment_locality(znod=
e * node,
> >   =09=09goto exit;
> >  =20
> >   =09if (!ZF_ISSET(node, JNODE_CREATED) &&
> > -=09    (ret =3D reiser4_dealloc_block(znode_get_block(node), 0,
> > -=09=09=09=09=09 BA_DEFER | BA_FORMATTED)))
> > +=09    (ret =3D reiser4_dealloc_block(znode_get_block(node), 0, BA=
_DEFER)))
>=20
>=20
> Here you drop BA_FORMATTED flag for the node, which is really formatt=
ed.
> It makes a mess. Do you have more neat solution?

I've dropped BA_FORMATTED flag for one reason: if BA_DEFER is specified=
,
other flags are not taken into account. So it is redundant to specify t=
hose.
By the same reason 0 is already passed instead of target block stage.

Actually, only two pieces of this patch are not no-op: I've added BA_DE=
FER
in dealloc_tx_list() and in dealloc_wmap_actor().

If you think that BA_FORMATTED must remain despite it is unused --
then ok, so it shall be.

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1893256.UtuuVivxxb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlQEc38ACgkQxUKljSIMAnC0GAD/R23ioI5erws0dvvhJI2tt9vE
r2JaX1fKIox3nJM1znwA/AjQsxrstwui+5Vt4gjd84BZmki+G3Es+WQzYGwzS/Q4
=3X26
-----END PGP SIGNATURE-----

--nextPart1893256.UtuuVivxxb--

