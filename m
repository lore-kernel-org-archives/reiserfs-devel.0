From: NeilBrown <neilb@suse.de>
Subject: Re: [RFA] reiserfs 3.6 on SSD software RAID1 with TRIM/DISCARD on
 SMP-system doable?
Date: Mon, 4 Mar 2013 17:02:17 +1100
Message-ID: <20130304170217.0f869fa5@notabene.brown>
References: <30c9401395b356be4b2cdf42e1afa833@mail.ud03.udmedia.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/EIO7.i.l6n0btJhYud.5OJH"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <30c9401395b356be4b2cdf42e1afa833@mail.ud03.udmedia.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <dieter@nuetzel-hh.de>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org

--Sig_/EIO7.i.l6n0btJhYud.5OJH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 28 Feb 2013 04:29:18 +0100 Dieter N=C3=BCtzel <dieter@nuetzel-hh.de=
> wrote:

> Hello,
>=20
> I'm on ReiserFS 3.6 since the beginning (under S.u.S.E. :-) even with=20
> beta stuff.
> Now it is time for SSDs.
> I migrated one UP workstation (openSUSE 12.2 + stable + etc.) and have=20
> to switch all other servers + workstations onto SSDs, too.
>=20
> Please give me your advice if I better should switch to ext4 or=20
> whatever.
> All systems should run your great MD software RAID1 on SSD hopefully=20
> with TRIM and/or DISCARD.
>=20

Sorry, but I am not in a position to recommend one filesystem over another.
You might get more opinions if you posted somewhere like
linux-raid@vger.kernel.org .

> Thanks,
>     Dieter
>=20
> PS @Neil:
> I get /dev/md0 (swap) and poorly /dev/md127 (root).
> But YaST created this /etc/mdadm.conf on the first workstation:
>=20
> DEVICE containers partitions
> ARRAY /dev/md0 UUID=3Dbd5xxxxx
> ARRAY /dev/md1 UUID=3De74xxxxx
>=20
> Ahhh, now I see something (below).
> Can we clean this?

Sorry, but I don't really understand the question.

>=20
> Sonja /home/dieter# cat /proc/mdstat
> Personalities : [raid1] [raid0] [raid10] [raid6] [raid5] [raid4]
> md0 : active raid1 sdb1[0] sda1[1]
>        1051584 blocks super 1.0 [2/2] [UU]
>        bitmap: 0/1 pages [0KB], 65536KB chunk
>=20
> md127 : active raid1 sdb2[0] sda2[2]
>        30209920 blocks super 1.0 [2/2] [UU]
>        bitmap: 1/1 pages [4KB], 65536KB chunk
>=20
> unused devices: <none>
>=20
> Should I generate partition tables on the devices or are the raw=20
> devices enough?

Either works fine.

NeilBrown

--Sig_/EIO7.i.l6n0btJhYud.5OJH
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIVAwUBUTQ46Tnsnt1WYoG5AQLxPg//QDRqoemkGBwfHiHZTwhwN3N9ZXn4NhBc
tQvQKmyVjT47p3fdPkCXxn5RRDNex+zIWyCMzy6Cg1KSV9cOfBva5+2o6LZcKo2J
RKVcKW5oKeLXdbOFvm125+jOl9Li+K4kSF18fy8oLjV1t9clQGQ2NstXluqm8kSv
4VKRHJt/eFN+IWYvDvnyJ8e+hGr33A+4BJ/fPzJF3C6pEjt4TuW4MgU0yG1851BC
n1MKgnNT3APzF6DbPkmsU9tG1HwRam7rTJ4IIlmSZ+IIkrMqYEtz2xEn1dA26rMa
ug4v0wPorhprB1uJKC8yNovHIvApJU78ZMbToViu7x8pXik0R4yX86cLFIfxZfZe
eXHeEvk2HLuzyG7inqlmB4Iotmnad9/sIBUNzEtuYS0ig7lMXAPRbhMsQIHiBpSb
OkAEfuKJn56Q47TS1loUQusw/v0O3swUiJD7mycZP5odGtEMm2bC4tSH+/dot7AP
Htaer2VI+Yx0n0WwlAe50XTxGUGtt6mlsaVtAvOtYSbcecTkRk1gInE0GsfpVoDR
kWLiKjX5BaT/KdNy6xPpJbiZ4f5OckeUy9SK3GFXBb+jZHzk8YPE/mOr+EWSz+Vx
M49+Jiceke8on7zwKL2172DyOt9i9NqkC2n2pMygPLx9xQeDTRUZcgrvuR2jiqIe
4pwHuarNgjY=
=MgGR
-----END PGP SIGNATURE-----

--Sig_/EIO7.i.l6n0btJhYud.5OJH--
