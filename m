From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv5 0/4] reiser4: discard support: initial implementation, refactored.
Date: Sat, 21 Jun 2014 02:35:43 +0400
Message-ID: <3309631.pk4ACE3OmJ@intelfx-laptop>
References: <1403296798-11742-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1717001.ctLg5L4gbu"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=zdEcMZTmc8X7z7xZSzkzf9RiiXq3aH4pOlZOXIGvDsk=;
        b=WCMEE0p5uGxCwDyh+Vm2csnculnXtrS5Y6+WHr8Ou7lrrWCX+Q4I3kPC5zGHwg/Dpd
         10EvbzyFKeELsd/QjZDx/20+C+X9a9vQvujcQuj189xwGGkEJR9GHCX206ZOkO18fjsw
         2lcgW5Th6n8sKuWg9Xbg2LW3Jrh2BOPonli0msWEk0Ctd5hMPa0MBfzha0z7XxOyDN3v
         PiurLquid1FOiAQuMhwy3DeEzHwbQ20tozwypzUdXWHoROobTJrnfaZFy7q5gw3mCk6Q
         ZYkG12kLyavB/++dOkzkAe0kJ0Y1yopLOUoC0F1wuSE9WZf/eeDieK2wMr3uKEo3GiTF
         LQbg==
In-Reply-To: <1403296798-11742-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com


--nextPart1717001.ctLg5L4gbu
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Saturday 21 June 2014 at 00:39:54, Ivan Shapovalov wrote:=09
> v1: - initial implementation (patches 1, 2)
>=20
> v2: - cleanup, fixes discovered in debug mode
>     - saner logging
>     - assertions
>     - enablement of discard through mount option
>=20
> v3: - fixed the extent merge loop in discard_atom()
>=20
> v4: - squashed fix-ups into the main patch (with exception of reiser4=
_debug())
>     - fixed bug in usage of division ops discovered while building on=
 ARM
>=20
> v5: - squashed mount option into the main patch
>     - refactor based on discussion (see commit msg)
>       - splitted off blocknr_list code
>       - replaced ->discard_set with ->delete_set and ->aux_delete_set=

>=20
> Ivan Shapovalov (4):
>   reiser4: make space_allocator's check_blocks() reusable.
>   reiser4: add an implementation of "block lists", splitted off the d=
iscard code.
>   reiser4: add reiser4_debug(): a conditional equivalent of reiser4_l=
og().
>   reiser4: discard support: initial implementation using linked lists=
.
>=20
>  fs/reiser4/Makefile                       |   2 +
>  fs/reiser4/block_alloc.c                  |  49 ++---
>  fs/reiser4/block_alloc.h                  |  14 +-
>  fs/reiser4/blocknrlist.c                  | 315 ++++++++++++++++++++=
++++++++++
>  fs/reiser4/debug.h                        |   4 +
>  fs/reiser4/dformat.h                      |   2 +
>  fs/reiser4/discard.c                      | 247 ++++++++++++++++++++=
+++
>  fs/reiser4/discard.h                      |  31 +++
>  fs/reiser4/forward.h                      |   1 +
>  fs/reiser4/init_super.c                   |   2 +
>  fs/reiser4/plugin/space/bitmap.c          |  84 +++++---
>  fs/reiser4/plugin/space/bitmap.h          |   2 +-
>  fs/reiser4/plugin/space/space_allocator.h |   4 +-
>  fs/reiser4/super.h                        |   4 +-
>  fs/reiser4/txnmgr.c                       | 125 +++++++++++-
>  fs/reiser4/txnmgr.h                       |  63 +++++-
>  fs/reiser4/znode.c                        |   9 +-
>  17 files changed, 884 insertions(+), 74 deletions(-)
>  create mode 100644 fs/reiser4/blocknrlist.c
>  create mode 100644 fs/reiser4/discard.c
>  create mode 100644 fs/reiser4/discard.h

Also I would like if this code could be given a review. :)

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1717001.ctLg5L4gbu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOkt0MACgkQxUKljSIMAnAYlAEAujM1no6n354HP3Usa5MtxVae
6p4EN3aB4zv0XaX6P6QA/3HH5CLDLQqa9Wx1+nU6z2dEZSSN7lF3syig+k+jmIXK
=mySt
-----END PGP SIGNATURE-----

--nextPart1717001.ctLg5L4gbu--

