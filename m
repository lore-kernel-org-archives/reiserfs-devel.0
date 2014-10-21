From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv3 7/9] reiser4: batch discard support: actually implement the FITRIM ioctl handler.
Date: Tue, 21 Oct 2014 20:18:49 +0400
Message-ID: <4858515.SiX86K8HSN@intelfx-laptop>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <1474324.CcTjzLnQHn@intelfx-laptop> <544631EA.6090502@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5292141.vxb8Jo17Sg"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=bd+jU/NInUniAa51bCXHgzqUnFesX5odYW++Pl+nSFY=;
        b=kfZeGXuRzKKFIRXfK4KJb8a9jfUWkz5CquDWBI4pZ3ieL4ItJeTHKSL3z0D5ccEhq+
         CvS6EE971bRnekkeWNPY/t7C0dX5gTmEnGMWx0/DN8rXCwv6+v60DBDuwfsACFsjqJ2R
         XKz2+USWmEzL5MflC/AULxCTE3aJycWi7IZeuNCUibd25x/OGD4z/jjD/2VDNSAdNBDD
         qT301BfU4QDB+ILRScvBVpDADpGPVBT0XAOI4s71vIRW691ehKvm8heRkhMIVeR+HlMZ
         d8WVB+WKvyr5atx46j3O+QoqDG5Wgu0hP2hUHZOEekZiU8tY9dL3VK/AgfaF5HMFIQiI
         CarQ==
In-Reply-To: <544631EA.6090502@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart5292141.vxb8Jo17Sg
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 October 2014 at 12:14:02, Edward Shishkin wrote:=09
>=20
> On 10/21/2014 12:39 AM, Ivan Shapovalov wrote:
> > On Monday 20 October 2014 at 12:54:13, Edward Shishkin wrote:=09
> >> On 08/17/2014 11:52 PM, Ivan Shapovalov wrote:
> >>> [...]
> >>> +=09=09/*
> >>> +=09=09 * Grab some sane amount of space.
> >>> +=09=09 * We will allocate blocks until end of the partition or u=
ntil
> >>> +=09=09 * the grabbed space is exhausted.
> >>> +=09=09 */
> >>> +=09=09ret =3D reiser4_grab_reserved(super, 0, BA_CAN_COMMIT | BA=
_SOME_SPACE);
> >>
> >> reiser4_grab_reserved() grabs space from the reserved area (5%).
> >> This is needed to make sure that unlink(), truncate(), etc. won't
> >> fail, if there is no free space on disk. I don't think that FITRIM=

> >> ioctl needs this reserved area.
> > Well, IIUC, it doesn't hurt:
>=20
>=20
> "doesn't hurt" is not enough. If you want to take a resource,
> you should be going to explain, why do you need this.

I've explained the reason below... isn't it sufficient?

=2D-=20
Ivan Shapovalov / intelfx /

> >   any "legitimate" user of the reserved space
> > will block on the mutex and eventually proceed. At the same time, g=
iven
> > a filesystem with (5% + eps) free space left, not using the reserve=
d space
> > will result in trimming of (eps) blocks at a time.
> >
> > [...]
--nextPart5292141.vxb8Jo17Sg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRGh2kACgkQxUKljSIMAnBLJwEA393x5cvQ8nHvkqvL/m9VQC3x
qgjy6rk+T//kMrQCPN4A/0+Rgg9WGKzEMSAkpiMdk0o3MEcfEu9T86/TKVlwH5w+
=93q3
-----END PGP SIGNATURE-----

--nextPart5292141.vxb8Jo17Sg--

