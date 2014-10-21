From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv3 7/9] reiser4: batch discard support: actually implement the FITRIM ioctl handler.
Date: Tue, 21 Oct 2014 20:23:34 +0400
Message-ID: <44201008.TshRq3mBYC@intelfx-laptop>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <4858515.SiX86K8HSN@intelfx-laptop> <54468824.8060402@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8744194.VYB73aeYUu"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=cMD50sQxa+zEAcZhsOxzXl1rUTqAmZd1GcDfmOXVQDE=;
        b=A2nRrhIJQta/bBLD80qHLNoc/ptJhpoY9WorYDNVYxR/IAn9GyJUwmTpg2XU7dLchQ
         Ea/PtCItnxjsrPRmer1Imu0sOEJfalafvCUytpaf+l0pq0PY7kCVAaG1uh4rp9zVmtf4
         txgdTOmsoCRP8Q4AZbUPO2kZSo6wiblBhYOjiqLgu9tHR6qO6v/R8jGVJcnst4+cQTUQ
         G6DEwFbe8cKIgCWYdXbOapUDA/PsZg4Sauys2SOKd3UuVJYdj2ZHxAeiMYYXhNSomFZf
         qXQ729WfYdoIPInlZhpOMf9KdjsgGu9TQ2SYnoQUdOEZkRfdvNu7aprjCyxNDmc1c17I
         CG5g==
In-Reply-To: <54468824.8060402@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart8744194.VYB73aeYUu
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 October 2014 at 18:21:56, Edward Shishkin wrote:=09
> On 10/21/2014 06:18 PM, Ivan Shapovalov wrote:
> > On Tuesday 21 October 2014 at 12:14:02, Edward Shishkin wrote:=09
> >> On 10/21/2014 12:39 AM, Ivan Shapovalov wrote:
> >>> On Monday 20 October 2014 at 12:54:13, Edward Shishkin wrote:=09
> >>>> On 08/17/2014 11:52 PM, Ivan Shapovalov wrote:
> >>>>> [...]
> >>>>> +=09=09/*
> >>>>> +=09=09 * Grab some sane amount of space.
> >>>>> +=09=09 * We will allocate blocks until end of the partition or=
 until
> >>>>> +=09=09 * the grabbed space is exhausted.
> >>>>> +=09=09 */
> >>>>> +=09=09ret =3D reiser4_grab_reserved(super, 0, BA_CAN_COMMIT | =
BA_SOME_SPACE);
> >>>>   any "legitimate" user of the reserved space
> >>>> will block on the mutex and eventually proceed. At the same time=
, given
> >>>> a filesystem with (5% + eps) free space left, not using the rese=
rved space
> >>>> will result in trimming of (eps) blocks at a time.
> >>>>
> >>>> reiser4_grab_reserved() grabs space from the reserved area (5%).=

> >>>> This is needed to make sure that unlink(), truncate(), etc. won'=
t
> >>>> fail, if there is no free space on disk. I don't think that FITR=
IM
> >>>> ioctl needs this reserved area.
> >>> Well, IIUC, it doesn't hurt:
> >>
> >> "doesn't hurt" is not enough. If you want to take a resource,
> >> you should be going to explain, why do you need this.
> > I've explained the reason below... isn't it sufficient?
>=20
>=20
> Sorry, but I don't see any explanation.

"given a filesystem with (5% + eps) free space left, not using the rese=
rved
space will result in trimming of (eps) blocks at a time."

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart8744194.VYB73aeYUu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRGiIYACgkQxUKljSIMAnCjJAEA5TLeoNR25WgwXaX3RGjD8sD4
FXvz2/i7YYXeNnWYT7UBALxTmzvICCv9MSofpMwROcsf3Ff20o7a55eXQ7Vu2uj4
=AZ2E
-----END PGP SIGNATURE-----

--nextPart8744194.VYB73aeYUu--

