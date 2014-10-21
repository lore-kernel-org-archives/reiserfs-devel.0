From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv3 7/9] reiser4: batch discard support: actually implement the FITRIM ioctl handler.
Date: Tue, 21 Oct 2014 23:00:44 +0400
Message-ID: <7015958.kMalmhT48L@intelfx-laptop>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <1599695.kol3gtzCnm@intelfx-laptop> <5446AA9B.1080401@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3827463.MZ6KSAAJuU"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=cSAprybD4yeoG8CgggSds4x4NNvp6qBHbh/okmYuj2Q=;
        b=KwAD+AIjaprqKfh9CDmk6ZevmaOrlCkU01uVirGbr0XHxMEY8GfKCmR+Q9MZSZGdy3
         OPQGUgkAeRH9QF8CRwDh+LPA/Od6Yj4v0sBCceVJSrfKuFlh7egpB5rRUcn8+JAegNXJ
         KjF+G/I/gnZiS/CeDvbWDLcbv9mSRwP2w6Xd4vCfZ9ZO0XGC+ATIEYwJJkRLMs4WHwgK
         JOmNYAhcW+RX6WskhJe4ja/AP0IDvEdLnX5ifuaSfBYfQr8ZLGiMqNGuj8NIjCywetaG
         1jtGmN0Sb7/thm59GJXvM0kee40QAyN4bUV8QirRHbrKDiU3EoMb8FzizfoFdZQkIPlL
         pN1g==
In-Reply-To: <5446AA9B.1080401@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart3827463.MZ6KSAAJuU
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 October 2014 at 20:48:59, Edward Shishkin wrote:=09
> On 10/21/2014 08:11 PM, Ivan Shapovalov wrote:
> > On Tuesday 21 October 2014 at 20:01:55, Edward Shishkin wrote:=09
> >> On 10/21/2014 06:42 PM, Ivan Shapovalov wrote:
> >>> On Tuesday 21 October 2014 at 18:33:11, Edward Shishkin wrote:=09=

> >>>> [...]
> >>>>
> >>>> Ok, it is clear, why we can not fail with -ENOSPC when trying to=
 delete
> >>>> a file from a full partition, yes?
> >>> Sure. Please note that making reiser4_trim_fs's allocations BA_RE=
SERVED will
> >>> not hinder this: delete_mutex is there for a reason.
> >>
> >> Sure, and this is the reason, because when I hear "let's take a mu=
tex",
> >> I start to feel bad :)

Does this (ab)use of delete_mutex violates any ordering?
If not, it should be OK.

> >>>> I want to see explanation, why FITRIM ioclt can not finish the w=
ork when
> >>>> there is no free space on disk.
> >>> Suppose we do not use reserved space for reiser4_trim_fs's alloca=
tions.
> >>> Let's analyze those two cases:
> >>>
> >>> 1. There is <=3D 5% free space on disk.
> >>> Initial grabbing fails, nothing can be trimmed.
> >>> This is wrong.
> >>>
> >>> 2. There is 5% + X (where X is some small number) free space on d=
isk.
> >>> We can grab only X blocks at a time, so a total of ((SIZE * 5% / =
X) + 1)
> >>> transactions will be created. BTW, if X < erase unit, nothing can=
 be trimmed.
> >>> This is ineffective.
> >>>
> >>> Hope this makes sense.
> >>
> >> This is already much better, thanks!
> >> Then I should say that the whole idea to reserve % of free space i=
s
> >> incorrect.
> >> Try to reserve 1% of total partition size with BA_CAN_COMMIT for a=
n
> >> iteration.
> >> If it fails, then try to reserve 1 block with BA_CAN_COMMIT.
> > Hm? Both described cases are still broken.
> >
> > In #1 (free space <=3D 5%) nothing changes; reiser4_trim_fs will ne=
ver be able
> > to do its task without using reserved space.
> >
> > In updated #2 (5% < free space < 6%), a transaction per every block=
 (!)
> > will be created, and none of them will trim anything (1 block < era=
se unit).
>=20
>=20
> If (5% < free_space < 5% + erase_unit), then fail with ENOSPC.

...and s/1 block/1 erase unit/ in your proposal?
Still this will create too many transactions.

> Why not? This is not the unlink case...

It looks like fighting an artificially created problem. I fail to see w=
hy
can't we use BA_RESERVED. This will solve both cases at no harm.

Note -- I'm not saying "let's take this resource, it does not harm", bu=
t
"let's take this resource, it solves two cases AND does not harm" :)

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart3827463.MZ6KSAAJuU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRGrWIACgkQxUKljSIMAnBKiwD/fzjIE0Aii/64Khww3VdNIBCk
ikASlMjrDmSFU00/70sBAOxbIqrbZVyBpParUrtd+NpAvHAY1u3VzB2iSZ9OuL7u
=Yk+B
-----END PGP SIGNATURE-----

--nextPart3827463.MZ6KSAAJuU--

