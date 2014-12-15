From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: patches to apply to reiser4-for-3.17.2 patch
Date: Mon, 15 Dec 2014 18:49:22 +0300
Message-ID: <2903313.NdQFEzTvCb@intelfx-laptop>
References: <fb7b470f8ebd17f88a212b398c8db0ac@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2123951.0ACg2dMQns"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=x51gDfbR0oB+TrZEqXXK61do0hhhbXWJh+fKWih/G6Q=;
        b=fP712i+RIcBKCtxaw2+6b6JBrX261pOOC4QY/z5wEcQC/uq+DWPevqtPn+iS6yc7yr
         v+9qM+khiqODUZdcKzmzgiyKa4TO2c9P8rTnclxQ+mUQxXAjFVljLpfyQ0XBCoZ7LVm2
         qcYlPuTLC6hkX5g9bjFh/1ArD2OGhJj9fgdO/n8/nqw4aHllQ6lBpvLJgRLD6EyBjFq4
         +0bDLY9H/MtzvpV/AjpjpwwoaqAmweKPMu4/tKbFQECYvPtfgVmBGu/sDcBlplGWhdY+
         tHOXIcleFeAOEKoxvR4a2zoNnn5U72NlNztPKHv/A9fnbPPs8sO3gQJHBZDnIQvbVcW0
         A4jQ==
In-Reply-To: <fb7b470f8ebd17f88a212b398c8db0ac@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: "<doiggl@velocitynet.com.au>" <doiggl@velocitynet.com.au>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--nextPart2123951.0ACg2dMQns
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

[resend with cc:reiserfs-devel@vger.kernel.org]

> 15 =D0=B4=D0=B5=D0=BA. 2014 =D0=B3., =D0=B2 12:50, <doiggl@velocityne=
t.com.au> <doiggl@velocitynet.com.au> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=
=B0=D0=BB(=D0=B0):
>=20
> Hello,
> - Do these patches apply on top of the reiser4-for-3.17.2 patch or no=
t [1]
> - Do any other patches apply on top of the reiser4-for-3.17.2 patch, =
if
> so, which patches are they and is there a link to the patch?
> --Thanks Glenn

Hi Glenn,

This is a development mailing list, and as such everything that appears=
 here (patches, discussions, etc), except announcements, is a work-in-p=
rogress.
If you are a user, or if you build kernels for general usage, then you =
most probably do not need any of these patches.

Otherwise -- *otherwise* -- if you want to help with development or tes=
ting, then you'd better familiarize yourself with the context. Blindly =
grabbing WIP patches and applying them is a bad idea in either case.

=2D-
Ivan Shapovalov / intelfx /

(Sent from a phone. Havoc may be wreaked on the formatting.)
--nextPart2123951.0ACg2dMQns
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlSPAwIACgkQxUKljSIMAnAioAD/a9KmVnmpkoFV8dZPLEcf+lDf
otXQRnYGpF2qT8RtBHoA/Akxbb0bdIEfAE/wkpmOHcGZNpl41DOHsSwclK6JMq6g
=bDLp
-----END PGP SIGNATURE-----

--nextPart2123951.0ACg2dMQns--

