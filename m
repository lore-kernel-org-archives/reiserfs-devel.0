From: Simon Raffeiner <sturmflut@lieberbiber.de>
Subject: Re: problem with reiser4
Date: Sun, 13 Mar 2005 16:29:16 +0100
Message-ID: <200503131629.29120.sturmflut@lieberbiber.de>
References: <4224BA6B.7040402@iparadigms.com> <opsnkzb7igt3f2uk@localhost>
Reply-To: sturmflut@lieberbiber.de
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1134319.MkdXrSWIUh";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <opsnkzb7igt3f2uk@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart1134319.MkdXrSWIUh
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

One of the 2.6.10-mm kernels killed my Reiser4 Root Partition, yesterday a=
=20
2.6.11-mm one nearly killed a ReiserFS 3.6 partition. Luckily I was able to=
=20
recover it by rebooting with Kanotix and running reiserfsck. Did you try wi=
th=20
Kernel 2.6.9-mm1, it's the last kernel I am running that runs without=20
problems.

Am Sonntag, 13. M=E4rz 2005 15:46 schrieb =A3ukasz Mierzwa:
> Dnia Tue, 01 Mar 2005 10:54:35 -0800, fitzboy <fitzboy@iparadigms.com>=20
napisa=B3:
> > Hello all,
> > I'm just switching from 2.4/reiser3 to 2.6/reiser4 on the first batch of
> > machines. We are running a bunch of apple xRAIDs connected to Dell
> > servers running Debian. we have the 2.6.10-mm kernel and we can make the
> > reiser4 partitions, but there is a lot of lost space somewhere. If I
> > create a reiser3 or xfs partition, I get 1.1T, but with reiser4 I can't
> > get above 984GB. That is too much of a jump to be explained by overhead,
> > so something is wrong... any thoughts?
>
> I got the same problem:
>
> gremlin prymitive # mkfs.ext3 /dev/hdd5
> mke2fs 1.35 (28-Feb-2004)
> Etykieta systemu plik=F3w=3D
> Typ OS: Linux
> Rozmiar bloku=3D4096 (log=3D2)
> Rozmiar fragmentu=3D4096 (log=3D2)
> 2562240 i-w=EAz=B3=F3w, 5120710 blok=F3w
> 256035 blok=F3w (5.00%) zarezerwowanych dla superu=BFytkownika
> Pierwszy blok danych=3D0
> 157 grup blok=F3w
> 32768 blok=F3w w grupie, 32768 fragment=F3w w grupie
> 16320 i-w=EAz=B3=F3w w grupie
> Kopie zapasowe superbloku zapisane w blokach:
>          32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632,
> 2654208, 4096000
>
> Zapis tablicy i-w=EAz=B3=F3w: zako=F1czono
> Tworzenie kroniki (8192 blok=F3w): wykonano
> Zapis superblok=F3w i podsumowania systemu plik=F3w: wykonano
>
> Ten system plik=F3w b=EAdzie automatycznie sprawdzany co ka=BFde 24 monto=
wa=F1
> lub co 180 dni, zale=BFnie co nast=B1pi pierwsze. Mo=BFna to zmieni=E6 po=
przez
> tune2fs -c lub -i.
>
> gremlin mnt # mount -t ext3 /dev/hdd5 /mnt/seagate/
> gremlin mnt # df
> System plik=F3w      bl. 1MB B        u=BFyte dost=EApne %u=BF. zamont. na
> /dev/hda1              69790MB   54438MB   15352MB  79% /
> none                     262MB       0MB     262MB   0% /dev/shm
> /dev/hdd5              20646MB      34MB   19563MB   1% /mnt/seagate
> gremlin mnt # umount /mnt/seagate
> gremlin mnt # mkfs.reiser4 /dev/hdd5
> mkfs.reiser4 1.0.4
> Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by
> reiser4progs/COPYING.
>
> Block size 4096 will be used.
> Linux 2.6.11-cko2 is detected.
> Uuid 74aecbaf-6013-4b9f-9006-691d55f26940 will be used.
> Reiser4 is going to be created on /dev/hdd5.
> (Yes/No): Yes
> Creating reiser4 on /dev/hdd5 ... done
> gremlin mnt # mount -t reiser4 /dev/hdd5 /mnt/seagate/
> gremlin mnt # df
> System plik=F3w      bl. 1MB B        u=BFyte dost=EApne %u=BF. zamont. na
> /dev/hda1              69790MB   54438MB   15352MB  79% /
> none                     262MB       0MB     262MB   0% /dev/shm
> /dev/hdd5              19930MB       1MB   19930MB   1% /mnt/seagate
>
> so it's 20646MB on ext3 versus 19930 with reiser4
> I used reiser4progs 1.0.4 under 2.6.11-cko2 kernel
>
> =A3ukasz Mierzwa

--nextPart1134319.MkdXrSWIUh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCNFxZd2q78rIgT6ARAuWTAJ9o4tvxHgD2Hol6xB6rbGmlwkjupQCdHBj6
PubyvMZrK6DEMc6PAIYOT8M=
=UmoJ
-----END PGP SIGNATURE-----

--nextPart1134319.MkdXrSWIUh--
