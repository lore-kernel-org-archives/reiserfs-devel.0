From: Andreas Abele <aba@IZS.FhG.de>
Subject: Re: mkreiserfs and big RAID-Systems
Date: 15 Jul 2002 16:55:12 +0200
Message-ID: <1026744912.30621.31.camel@pallas.IZS.FhG.de>
References: <1026741573.30600.25.camel@pallas.IZS.FhG.de> 
	<200207151639.03258.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11006-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200207151639.03258.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Hi Vitaly,

do these Informations help you?

thanks=20
Andreas Abele


Am Mon, 2002-07-15 um 14.39 schrieb Vitaly Fertman:
>=20
> HI,=20
>=20
> which reiserfsprogs version do you use?
Name        : reiserfsprogs                Relocations: (not
relocateable)
Version     : 3.x.0j                            Vendor: MandrakeSoft
> what does=20
> 	debugreiserfs /dev/sdf1
> say?
[root@saturn6 root]# debugreiserfs /dev/sdf1
debugreiserfs, 2001 - reiserfsprogs 3.x.0jSuper block of format 3.6
found on the 0x3 in block 16
Block count 180083512
Blocksize 4096
Free blocks 180069805
Busy blocks (skipped 16, bitmaps - 5496, journal blocks - 8193
1 super blocks, 1 data blocks
Root block 8211
Journal block (first) 18
Journal dev 0
Journal orig size 8192
Filesystem state VALID
Tree height 2
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Version 2
>=20
> --=20
>=20
> Thanks,
> Vitaly Fertman
>=20
> On Monday 15 July 2002 17:59, Andreas Abele wrote:
> > Hello,
> >
> > I have a RAID5-Set with 840 GB netto here.
> >
> > 1.) fdisk shows:
> >
> > Festplatte /dev/sdf: 255 K=F6pfe, 63 Sektoren, 104623 Zylinder
> > Einheiten: Zylinder mit 16065 * 512 Bytes
> >     Device boot.  Start       End    Blocks   Id  Dateisystemtyp
> > /dev/sdf1   *         1    104623 840384216   83  Linux
> >                                   ^^^^^^^^^
> > 2.) mkreiserfs /dev/sdf1
> > 3.) mount /dev/sdf1 /users1/p1
> > 4.) df /dev/sdf1
> > Dateisystem          1K-Bl=F6cke    Benutzt Verf=FCgbar Ben% montiert a=
uf
> > /dev/sdf1            720312060     32840 720279220   1% /users1/p1
> >                      ^^^^^^^^^
> >
> > Where are the remaining 120 GBytes?
> >
> > Cross-Test with ext2
> >
> > 2a.) mke2fs /dev/sdf1
> > 3a.) mount /dev/sdf1 /users1/p1
> > 4a.) df /dev/sdf1
> > Dateisystem          1K-Bl=F6cke    Benutzt Verf=FCgbar Ben% montiert a=
uf
> > /dev/sdf1            827197400        20 785178172   1% /users1/p1
> >                      ^^^^^^^^^
> >
> > What is happening here? When i run mkreiserfs, the programs last
> > blocknumber seen is 180060160, which is exactly a1/4 of the mounted
> > kilobytes (4k-Blocks okay). But where are the remaining 120 G-Blocks?
> >
> > Any ideas? According to the reiserfs-specs a filesystem can hold 17.6
> > TBytes.
> >
> > kind regards
> > Andreas Abele


