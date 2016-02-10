From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Wed, 10 Feb 2016 07:04:07 +0300
Message-ID: <1455077047.22912.4.camel@intelfx.name>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>
	 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>
	 <1435651611.15634.12.camel@gmail.com> <55925A3C.6000604@gmail.com>
	 <1435793708.3758.14.camel@gmail.com> <559790E1.2020009@gmail.com>
	 <1436032389.25552.6.camel@gmail.com> <559826F3.9010201@gmail.com>
	 <1436101712.6440.3.camel@gmail.com>
	 <CADW=+3=J7Rt1yxtTfW=ZCLC40-D1FPCFR7KGSyp_YLgcRcH3FQ@mail.gmail.com>
	 <1436109206.6440.12.camel@gmail.com> <56BA2793.7090906@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-fBDeaVMuSuXVLsv3wXJU"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=Pq/LLqtoHpKqWZNLZ/CSRhI6TfwE5fSMSKq6FuYwUrE=;
        b=cXOveLfhQ3S5xfqKGYiuNrGhD6Ea5ZHke9nL+FzhjlKxmmYSdA8skxYkQdI224Rqdq
         Ul87MzdRMrlIl3sehWlDc2f/eTQ8xZyeXzyk13dGKKi1SeZEQOSNT56ARfYtC/BZND7p
         YAuElTu0rv8cj8/OfvECt9rs9S1+bQfVnAXnw=
In-Reply-To: <56BA2793.7090906@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, =?UTF-8?Q?Du=C5=A1an_=C4=8Coli=C4=87?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>


--=-fBDeaVMuSuXVLsv3wXJU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-02-09 at 18:53 +0100, Edward Shishkin wrote:
> Hi all,
>=20
> There is a pending patch for precise discarsd, which I can not merge
> because it is incomplete. Just want to know, is there any progress on
> this?
>=20
> So we found that calculating discard params by mkfs and storing
> them in superblock is a dirty option, so I suggest to reserve a
> contiguous area (1 MiB?) on disk at "mkfs -d" time (just mark it busy
> in the bitmap). And calculate erase unit size and offset at mount
> time.
> If calculation failed for some reasons, then use non-precise discard.
>=20
> So, I think, we'll need one d32 field in disk superblock, which
> indicates
> number of reserved blocks (0 means no reservation) and a pair of
> definitions in disk_format40.h:
>=20
> #define FORMAT40_FIRST_RESERVED_FOR_PROBING \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0((REISER4_MASTER_OFFSET / PAGE_=
CACHE_SIZE) + 6)
> #define FORMAT40_MAX_BLOCKS_RESERVED_FOR_PROBING
>=20
> If any questions, or technical stoppers, then let me know.
>=20
> Thanks,
> Edward.
>=20

Hello Edward,

yes, finishing this is on top of my to-do list (but it is being
dequeued at a very slow rate due to the university...).

I was under assumption of that we still want to go by path of probing
parameters at mkfs time + having a special utility for rewriting these
fields. But if you are now ok with probing at mount time, then that's
great. I'll try to do something in nearest week or two.

--=20
Ivan Shapovalov / intelfx /


--=-fBDeaVMuSuXVLsv3wXJU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJWura3AAoJEHveF8jk4w6dh4kP/3lu69OGqtYZW4LkNm2Ekpxx
bY0+WVjdg8++3M0NSIENALFZ/bXF/YWg84/yWVJXTUggKw9hWdiT5MFjnHzfscHD
k2kAqCSFBPMUfnrme3N0b/+D+j+EGG/rnGo1PQXHx8vxBLlSeNCz/MKy53AS8MLe
hS7geNRv6dmch75LVajNT9zk/voup6ZdPsZjKOkzILJ1Nbflk+N3Exfj42vJUaOj
39P3gts5+iI2jbyB4JKee46cWir6k4ALg1J7SlT7T1WA9Gx24IdjDp/GJ83Ndql/
hpd0aR+D90C6HLX5T0VYIaiEzFRXx5RWjQHYAooVoUEzpP0eGR6FUKCV4njwjDyy
xNL+CkNQyUWwQnyC+1hr3fe4sAxRrIv8l79M3tnazgd4JYhcL2GrQ40lgh0VKn1o
RRur7q/wBWCF4Jhqcpl302ajqFEsK/+SZ+F4fQ2/SErC3eVx+ZTP2v4WuKXNjosr
RmjaMDuUJzJ+0WkHDVhFAPcYLK6zqghK2CQG+HyT8cC/GgDewclmxrGP0d2G8NWm
MaJmzDI32ZPYTevZb/9YcOFFNAoB0p4eedPErFTUK3Ra+1yv8SKydy577dmBnM/7
CZW4Oko4BfDXryley5RyoqaS2OiCMXpqvsAS2GVSQ+Xt84cNhnoZfvw9IDCw3mkY
KGNczntxS2C4LCRRD2uV
=rHP2
-----END PGP SIGNATURE-----

--=-fBDeaVMuSuXVLsv3wXJU--

