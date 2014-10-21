From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv3 7/9] reiser4: batch discard support: actually implement the FITRIM ioctl handler.
Date: Tue, 21 Oct 2014 22:11:11 +0400
Message-ID: <1599695.kol3gtzCnm@intelfx-laptop>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <3623276.DiI5EXUh1u@intelfx-laptop> <54469F93.8000802@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1801610.SEGrUB5GHh"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=ze5V0rPHVRXgPqveVvbmfj4EBywbCDNQSqYf8n85j/g=;
        b=nd23L+ZN5/nf1Q4HpiM2C3vCVOY/k7/OZh2+PzOPc4vTI4F+cEfLfapsTfXXzej8W2
         bI4rFFm57wBWfC/1HTbtojS5TbeENtp8RKBE6T7g01KuI+89+CUD1QLmLiX5xnlvLKuW
         cttz7e5PdO9Tu+mUKclcgw0ujxUfCuivxDAusy3w5u/UI5fU56zUd43Uat6W02Rtd5ln
         lf+SOt+wsGCQgjDDFAfwzKLc1WiZUJEXfx4QVrUdbTkWVUk+Kxy2gBYMpDhbFSHsG4E9
         GL30+zxlaWfBUO6Hj3tzvHPoBY9yxdJVLoZ/e41n8G8q7X4mQFEHWnI2Sd/51/N3/DMZ
         RIZQ==
In-Reply-To: <54469F93.8000802@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1801610.SEGrUB5GHh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 October 2014 at 20:01:55, Edward Shishkin wrote:=09
> On 10/21/2014 06:42 PM, Ivan Shapovalov wrote:
> > On Tuesday 21 October 2014 at 18:33:11, Edward Shishkin wrote:=09
> >> On 10/21/2014 06:23 PM, Ivan Shapovalov wrote:
> >>> On Tuesday 21 October 2014 at 18:21:56, Edward Shishkin wrote:=09=

> >>>> [...]
> >>>>
> >>>> Sorry, but I don't see any explanation.
> >>> "given a filesystem with (5% + eps) free space left, not using th=
e reserved
> >>> space will result in trimming of (eps) blocks at a time."
> >>>
> >>
> >> This is something that I am not able to parse :)
> >>
> >> Ok, it is clear, why we can not fail with -ENOSPC when trying to d=
elete
> >> a file from a full partition, yes?
> > Sure. Please note that making reiser4_trim_fs's allocations BA_RESE=
RVED will
> > not hinder this: delete_mutex is there for a reason.
>=20
>=20
> Sure, and this is the reason, because when I hear "let's take a mutex=
",
> I start to feel bad :)
>=20
>=20
> >
> >> I want to see explanation, why FITRIM ioclt can not finish the wor=
k when
> >> there is no free space on disk.
> > Suppose we do not use reserved space for reiser4_trim_fs's allocati=
ons.
> > Let's analyze those two cases:
> >
> > 1. There is <=3D 5% free space on disk.
> > Initial grabbing fails, nothing can be trimmed.
> > This is wrong.
> >
> > 2. There is 5% + X (where X is some small number) free space on dis=
k.
> > We can grab only X blocks at a time, so a total of ((SIZE * 5% / X)=
 + 1)
> > transactions will be created. BTW, if X < erase unit, nothing can b=
e trimmed.
> > This is ineffective.
> >
> > Hope this makes sense.
>=20
>=20
> This is already much better, thanks!
> Then I should say that the whole idea to reserve % of free space is=20=

> incorrect.
> Try to reserve 1% of total partition size with BA_CAN_COMMIT for an=20=

> iteration.
> If it fails, then try to reserve 1 block with BA_CAN_COMMIT.

Hm? Both described cases are still broken.

In #1 (free space <=3D 5%) nothing changes; reiser4_trim_fs will never =
be able
to do its task without using reserved space.

In updated #2 (5% < free space < 6%), a transaction per every block (!)=

will be created, and none of them will trim anything (1 block < erase u=
nit).

Have I misunderstood you?

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1801610.SEGrUB5GHh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRGocgACgkQxUKljSIMAnCP3gEAz4990uapQp12F/o/9HgyKx7i
34QFu98yHO4Ml8YXbzIA/isSvgiujW1Uxnogw0pdFsHX4BWVtOXJBjfVkFX476EY
=KIa5
-----END PGP SIGNATURE-----

--nextPart1801610.SEGrUB5GHh--

