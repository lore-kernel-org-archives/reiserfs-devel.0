From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH 2/2] reiser4: block_alloc: get rid of discard-related hack in reiser4_dealloc_blocks().,
Date: Sat, 06 Sep 2014 14:33:02 +0400
Message-ID: <2475166.I97gbrPMvH@intelfx-laptop>
References: <1408361471-1488-1-git-send-email-intelfx100@gmail.com> <1408361471-1488-3-git-send-email-intelfx100@gmail.com> <5403914E.2050605@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart15001478.geyILQ7g5S"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=GqNjrRLBxBjP+iG/yQJPcxMTsE2mei+/E9/l60FFX7o=;
        b=xSGKMthLPv03CA9xNLJxzxTASga3GrikGJOnyHXATWZ3kKJioObuCW4XOhoyUWlb2l
         reBNmHWIyUzqlgJBOhzQpWVtuhApqnsX2YE8M/tf1dI2ed3VX+n/ssLt936QJrsha6ab
         IYbb1i5fdNNoNRXETYvpi367ER/fPcJUQz2/hxxnJYFjdFvBWX2bgbfAQmCYjtphdclo
         dMoA2b6EFGuKMG4wBn8g2noINHyT6ejVIKHCi2J1DOBeY2LYVXI4j7cxGE6P2+xJKmKr
         LOn+GEs1nJmVNQPUFCOXP8jx2XfHedo72uZ33BgyHyjj4Krv02WTIQd1/ISmVr0gxUhk
         kMPA==
In-Reply-To: <5403914E.2050605@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart15001478.geyILQ7g5S
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Sunday 31 August 2014 at 23:19:10, Edward Shishkin wrote:=09
>=20
> On 08/18/2014 01:31 PM, Ivan Shapovalov wrote:
> > When discard was enabled, immediate deallocations were made deferre=
d in order
> > to record these extents in the atom's delete set and, consequently,=
 allow
> > their discarding.
> >
> > However, this is wrong in the following way. Immediate deallocation=
s make use
> > of target allocation stage and ancillary flags like BA_PERMANENT an=
d BA_FORMATTED.
> > By converting immediate deallocations to deferred, these flags are =
essentially
> > dropped, and application of deferred deallocations in reiser4_post_=
write_back_hook()
> > uses an equivalent of BLOCK_NOT_COUNTED stage and BA_FORMATTED flag=
.
> >
> > Dropping this hack does not hinder efficiency of the discard proced=
ure, because
> > immediate deallocations are now used only to deallocate "just alloc=
ated" and not
> > yet written blocks, which actually do not need to be discarded.
>=20
>=20
> The idea to defer every "successful" deallocation regardless of disca=
rd
> support status looks OK, but I don't like the first patch (1/2), so=20=

> let's try
> to improve it..
>=20
> So, we want to defer also deallocations in the following 2 places:
> 1) in  dealloc_tx_list();
> 2) in dealloc_wmap_actor().
>=20
> Here we should take care about block stages.
> Let's take a look where and how they were allocated. There are exactl=
y
> 2 places:
>=20
> a) in get_more_wandered_blocks() with block_stage =3D BLOCK_GRABBED;
> b) in alloc_tx() with block_stage =3D BLOCK_GRABBED.
>=20
> Note, that alloc_blocks() with the stage BLOCK_GRABBED calls
> grabbed2used(). This is exactly what we want in apply_dset() called b=
y
> post_write_back_hook.
>=20
> That is, just adding BA_DEFER to (1) and (2) with the patch 2/2 shoul=
d work.
> Please, make sure..

This patchset does it exactly this way.

The first patch does two things:
=2D adds BA_DEFER to deallocations in dealloc_tx_list() and dealloc_wmap_=
actor()
  (because we really want them deferred);
=2D removes BA_FORMATTED from where BA_DEFER is used
  (this is the thing you don't like).

Let me explain why I've done the second thing. When BA_DEFER is specifi=
ed,
BA_FORMATTED is not checked for (there are even no assertions). While i=
t may be
semantically correct to specify BA_FORMATTED as well in these cases, it=
 is not
checked for and thus sooner or later we'll get a case when BA_FORMATTED=
 flag is
missing, and no one will notice that (because it does not influence the=
 system
behavior). So I've decided to force-expire that moment and preemptively=
 remove
the flags :)

Of course, you are the maintainer. If you opt for keeping BA_DEFER | BA=
_FORMATTED
combination, let's do it this way (but then it would sense to add an as=
sertion).

>=20
> P.S. In (1)-(2) we allocate with stage BLOCK_GRABBED, but in (a)-(b) =
we
> deallocate with stage BLOCK_NOT_COUNTED. It can confuse. Let's alloca=
te
> with stage BLOCK_NOT_COUNTED: from the standpoint of alloc_blocks() i=
t
> doesn't matter.

This would be incorrect. The space for allocations in get_more_wandered=
_blocks()
and alloc_tx() is already grabbed at the beginning of commit_tx() (see =
wander.c:1103),
so these allocations have to be done with stage =3D=3D BLOCK_GRABBED.

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart15001478.geyILQ7g5S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlQK4uQACgkQxUKljSIMAnCLugD/R6TtgvB4FKick8nESLxtDg5G
KuO+0hMaGe5YNQVDgAAA/1SEusre9zW8bIOSgm/eKHDDXW4odCNv39MGiAKvdLU+
=M13g
-----END PGP SIGNATURE-----

--nextPart15001478.geyILQ7g5S--

