From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv3 7/9] reiser4: batch discard support: actually implement the FITRIM ioctl handler.
Date: Tue, 21 Oct 2014 02:39:41 +0400
Message-ID: <1474324.CcTjzLnQHn@intelfx-laptop>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <1408312379-1990-8-git-send-email-intelfx100@gmail.com> <5444E9D5.1090908@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2730329.lUl29e1JkO"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=EyxTfL0C3eWG9XCJCB6OQC/qbEqrvuCu4BjT8lXabeI=;
        b=Bmef2oAOb4TRZFHhmNvpE8ZqJkxtg9tWArSPfvLNqe2N/XI5lFrteshF45tyBJ6t5P
         WQ68blOrIyT7F1o0XxYNNTyYsrjCmdYJsoCp+lqvU8oSnK1dyZHNx3o80ZDlfV3IsfXv
         pwb7iwCdceISWT0/xKfz3F420W2qGCfMK5J6x9hCnDiulVpaAblx1jikkPtwjCnGGkqG
         hmwGeiHR3eB81E9PP9VekjqfQ+K6waMiAut9qfdtxraqBQvA15dKnyJqlVYoS8hz36JO
         dr06fbsyyYDM1921U4/Q+uCtGnq5W1l5pqqvGD13aGR5Xhh2DWZGz6JK5C1xESTu5rpa
         maOQ==
In-Reply-To: <5444E9D5.1090908@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart2730329.lUl29e1JkO
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 20 October 2014 at 12:54:13, Edward Shishkin wrote:=09
> On 08/17/2014 11:52 PM, Ivan Shapovalov wrote:
> > [...]
> > +=09=09/*
> > +=09=09 * Grab some sane amount of space.
> > +=09=09 * We will allocate blocks until end of the partition or unt=
il
> > +=09=09 * the grabbed space is exhausted.
> > +=09=09 */
> > +=09=09ret =3D reiser4_grab_reserved(super, 0, BA_CAN_COMMIT | BA_S=
OME_SPACE);
>=20
>=20
> reiser4_grab_reserved() grabs space from the reserved area (5%).
> This is needed to make sure that unlink(), truncate(), etc. won't
> fail, if there is no free space on disk. I don't think that FITRIM
> ioctl needs this reserved area.

Well, IIUC, it doesn't hurt: any "legitimate" user of the reserved spac=
e
will block on the mutex and eventually proceed. At the same time, given=

a filesystem with (5% + eps) free space left, not using the reserved sp=
ace
will result in trimming of (eps) blocks at a time.

Anyway, I should also fix calculation of space to grab in 1/9: if BA_RE=
SERVED
is not set, then the amount to grab should be calculated as 25% of non-=
reserved
free space, not as 25% of all free space...

> If BA_SOME_SPACE is set, then you lock a superblock, and grab 25% of
> the current free space. It means that your grab will always succeed,
> so that BA_CAN_COMMIT flag is also not needed.

If we decide on dropping BA_RESERVED, then you're right here;
reiser4_grab(...BA_SOME_SPACE...) won't return ENOSPC and so this is po=
intless.

If we decide on keeping BA_RESERVED, then this should also stay in orde=
r not to
trigger the assertion.

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart2730329.lUl29e1JkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRFjzUACgkQxUKljSIMAnAubQEA1VfEd/5gt5kkeV1JbD8BS3uW
TnDaAmTh+4rHHKB68HAA/RaV2lkkDO16hQ9Doh+9iOlKj23P6fSabhkagdySSGsM
=jTyq
-----END PGP SIGNATURE-----

--nextPart2730329.lUl29e1JkO--

