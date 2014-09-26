From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Non-deleted directories (Was Re: reiser4 (ccreg40)...)
Date: Fri, 26 Sep 2014 21:27:21 +0400
Message-ID: <1681022.dqZonnvJOp@intelfx-laptop>
References: <1466481.l6KPymqJEh@intelfx-laptop> <5411D8F8.2070603@gmail.com> <542320D9.8050601@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart13716644.7YQ321gilf"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=cOGJxPKURPqBeLc31SnhRy+IZUEe63eHunPtdqxcw5M=;
        b=0+weBqp4Dl3sLo5nT22txyl88J8Nvtq7uswmwtUpBqIQkvQ6eSSsfdHIzhUhA8lF+H
         YdbX8KV0JCm0zvsFWS2rpRMoDysnCDX4D6hFhnPbOaj3WS3wMxtdFyYMQUbEnpq1ix/D
         aH5Ll1zF/UozfiY0hhJ+p7l0EioGigw05gftSC3bm5Vx61mcnquSIlY74Ke4RCqzehHb
         FHUr5MvDH4/fISTmWCyEJC47i63NNOxamSrVPqaYP1IPIpBV97PZsBPzUUUiyn3zhi1n
         asrUrctiVyA5QoPpRVfqyeZPXilTeiwdEozMrC/WqtmH5UfYpsU4YkP0mxrK0cQoqYA0
         sR9g==
In-Reply-To: <542320D9.8050601@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>


--nextPart13716644.7YQ321gilf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Wednesday 24 September 2014 at 21:51:53, Edward Shishkin wrote:=09
> On 09/11/2014 07:16 PM, Edward Shishkin wrote:
> >
> > On 09/10/2014 11:39 PM, Ivan Shapovalov wrote:
> >
>=20
> [...]
>=20
> >>>> 3a. I can reproduce the "directory not empty" bug :) Interesting=
ly,=20
> >>>> it is
> >>>> always the same directory under the aforementioned huge hierarch=
y.=20
> >>>> (I've
> >>>> done the unpack-remove cycle a few times.)
> >>> I've made a conclusion that this is caused by unexpected disappea=
ring
> >>> of a record, which represents a directory entry in the directory =
item
> >>> (currently directory items are managed by cde ITEM plugin, aka=20=

> >>> "compound
> >>> directory entries"). In the error path (ENOENT) the size of the=20=

> >>> directory is
> >>> not decremented, which makes the directory undeletable. I still=20=

> >>> don't know
> >>> who kills the entries. Special debugging info is needed to find/f=
ix it.
> >> What kind of information is needed?
> >
> >
> > We need to find all places, where the records are created / killed
> > and insert a hook, which prints such events for the entry which
> > unexpectedly disappears. This will get us a chance to find the culp=
rit.
> > I have to say: this is not a big fun...
>=20
>=20
> Ughhh, parse_cut (node40.c) is the culprit.
> If region to cut contains objects with non-unique keys (the case of
> hash collisions), then this function evaluates the cut mode incorrect=
ly.

> non-unique keys

Wow.
(I wonder, how many else "what the..."-style things are there in reiser=
4?...)

So this becomes re-classified as kernel version agnostic bug, right? Th=
en why
do you see it in 3.16 only?..

>=20
> I think that this bug has been introduced implicitly ~11 years ago
> after the design change in reiser4 (introducing non-unique keys).
>=20
> I'll provide the fixup later..

Great. Will be waiting for. /* also, what's with batch discard code and=
 the
second space allocation patchset? do you have any plans for reviewing i=
t? */

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart13716644.7YQ321gilf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlQlof4ACgkQxUKljSIMAnD/lwEA7VPxwInQ6j4rkpdeAJQjRoY6
sSo+w83zBHbl58qfGbAA/i8Ar8045ZQecIBhF3Tw7o0IZx6nlARM7uVVu3rwXBz9
=IAQz
-----END PGP SIGNATURE-----

--nextPart13716644.7YQ321gilf--

