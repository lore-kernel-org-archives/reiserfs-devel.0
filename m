From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv3 2/9] reiser4: block_alloc: add a "forward" parameter to reiser4_blocknr_hint to allocate blocks only in forward direction.
Date: Mon, 27 Oct 2014 02:21:14 +0300
Message-ID: <2730931.4oMvakIZcW@intelfx-laptop>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <2901509.x8vlNgQx5H@intelfx-laptop> <544D252D.9070606@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1549636.T7cMgN0aPE"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=1p+qCNRPjWtCFCs/FvzWOEQV1ev5Q9Xspu24jnRiGh4=;
        b=W13N50lfunNWa37LgexWuLQzkL522iun5wKkOFzZnXE2zlZYlitABZK0+ym/WMRIRf
         GNeiyi+pT3ga7fw/6j+gpzF7ETVUWTxgsMh+hXLymquCHcKeNIYcpR0gU+SN23vaRKI0
         1NmPKFMeXGcPbXYg65Vv3w8AmDztJ0fkndYs3h9gFHGrsPXIvjaj3EDvrFfdN4x9YR6t
         vmOXBfq/iFvl1H2ckdFZCnFef8Y4hbz9Y6VIss/p+l2ZMIaiFw9wiQnDXVjq6cXZfbSC
         lw8pr8JR1UZOj4xwR4BM5te95QPkpXT/MLhst3GJVy0KPpahFI4+AyCHOS+8su0OK4hU
         AkCg==
In-Reply-To: <544D252D.9070606@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1549636.T7cMgN0aPE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Sunday 26 October 2014 at 17:45:33, Edward Shishkin wrote:=09
> [...]
> >
> >>> BTW, in plugin/space/bitmap.c:1141 (around that line)
> >>> in function alloc_blocks_forward()
> >>> shouldn't the second scan be done with bitmap_alloc_backward(), a=
s per the
> >>> comment?
> >>
> >> I think that those comment means a jump in backward direction
> >> (to the start) and one more pass with bitmap_alloc_forward().
> >> Such a "compound, non-monotonic" forward...
> > I don't intend to argue here, but doesn't that defeat the purpose o=
f hint->blk?
> > The first pass begins from the *closest* blocks. And if it fails, t=
he second
> > pass begins from the *most distant* blocks...
> >
> > ("closest" and "most distant" terms are used here with respect to h=
int->blk)
>=20
>=20
> You don't like the block allocator?
> Actually it was a subject of long investigations in ReiserFS (v3).
> You can find a number of block allocators in ./fs/reiserfs/bitmap.c
> I don't know which one went to reiser4..

I've specifically stated that I don't intend to argue or claim that the=

allocator is wrong in any way :)

That thing has just seemed strange to me, so I decided to ask whether i=
s this
intentional and, if yes, what was the intention.

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1549636.T7cMgN0aPE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRNge4ACgkQxUKljSIMAnBoJgD9HhNsVFwbAvSdMoP9hoywhVVz
yhaFPjMU4NXfdEKIb7EBAJVY/z8BJr6cC/5/GlfZ2KmPMyS1Dax9fsF7WbwoDZXi
=zOIh
-----END PGP SIGNATURE-----

--nextPart1549636.T7cMgN0aPE--

