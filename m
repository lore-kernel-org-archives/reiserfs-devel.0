From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: reiser4 and quotas
Date: Sat, 14 Feb 2015 00:34:16 +0300
Message-ID: <1423863256.8650.2.camel@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-edTd4MRoJW6oBMgRH2e+"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:content-type:mime-version;
        bh=njHWDBlX5t5nmbvalTeQ5/TffebWT0ffpPtP+OFweHA=;
        b=LJa1w6xPBkVuJ9hwaK3HKrYFXgvniYWIzKniqfGE2J9QC40I3W1r5HKN39VPcq1NYd
         2xSyRBAq3/vDfShezrrjM4XyhcL7JBp41UeM3U+H3i9gxP1+UlgESVjsPQeT5FFTC0e6
         Vu5UXH+rMS/6wH9YqxCyXlqF4kLCDKhecl9eN/M35WSV5nLPAKG1vxK8vMpJ5kzgKLhj
         WGb6dn3fHFWZR5Jgls9DeRRffUjz3ENfXz9tJaGpDVD4vKFJkY3U1OGLJMXAgyUHXo1H
         S0hm6bnkhhLOhly5Zbf0kjmKx0E8kOELpnulT13JOkd5l8H0+MME692LU2CTsCzTByrI
         8rhw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--=-edTd4MRoJW6oBMgRH2e+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

the question is simple: do we support quotas?

There is some code calling into that subsystem, but no
->quota_{read,write} in super_operations...

/*
Also, super_block's ->dq_op and ->s_qcop are not set.
*/

--=20
Ivan Shapovalov / intelfx /

--=-edTd4MRoJW6oBMgRH2e+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlTebdgACgkQxUKljSIMAnBMowEAgr9MURZIhwRuCWZXkUoWxjFz
i5c79pfsJJvFz5GzfY8BANks/a43N0GN7XetoSyFpZJeLmOnsWuZZXbSGrJtV9m3
=mgg5
-----END PGP SIGNATURE-----

--=-edTd4MRoJW6oBMgRH2e+--

