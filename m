From: Jonathan Briggs <jbriggs@esoft.com>
Subject: SCSI caching and Reiser4
Date: Tue, 07 Mar 2006 10:37:14 -0700
Message-ID: <1141753034.28859.13.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-khJTYhkqNk5lVteULOcb"
Return-path: <reiserfs-list-return-28227-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mail-list <Reiserfs-List@namesys.com>

--=-khJTYhkqNk5lVteULOcb
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I thought I'd ask the list, since I've been wondering about it for a few
versions now, and I haven't been able to figure it out from the code
(although I haven't looked *that* hard).

My SCSI disks report that they have write back cache w/ FUA, which
should mean that write barriers work.  Am I right?

But Reiser4 complains that it is disabling write barriers.

/dev/md2 is a RAID-0 of the two SCSI devices.  I suspect that the MD
driver isn't supporting FUA properly but I haven't been able to figure
that out for sure.

Does anyone know for sure about MD block devices and write barriers?

Here are some of the interesting bits from dmesg:
Linux version 2.6.16-rc5-mm2 (jbriggs@oberon.rnd.esoft.com) (gcc version 4.=
0.2 20051125 (Red Hat 4.0.2-8)) #1 PREEMPT Fri Mar 3 14:06:12 MST 2006
...
SCSI device sda: 35843686 512-byte hdwr sectors (18352 MB)
sda: Write Protect is off
sda: Mode Sense: ab 00 10 08
SCSI device sda: drive cache: write back w/ FUA
SCSI device sda: 35843686 512-byte hdwr sectors (18352 MB)
sda: Write Protect is off
sda: Mode Sense: ab 00 10 08
SCSI device sda: drive cache: write back w/ FUA
 sda: sda1 sda2 sda3 sda4
sd 0:0:0:0: Attached scsi disk sda
SCSI device sdb: 35843686 512-byte hdwr sectors (18352 MB)
sdb: Write Protect is off
sdb: Mode Sense: ab 00 10 08
SCSI device sdb: drive cache: write back w/ FUA
SCSI device sdb: 35843686 512-byte hdwr sectors (18352 MB)
sdb: Write Protect is off
sdb: Mode Sense: ab 00 10 08
SCSI device sdb: drive cache: write back w/ FUA
 sdb: sdb1 sdb2 sdb3 sdb4
sd 0:0:1:0: Attached scsi disk sdb
...
md: Autodetecting RAID arrays.
md: autorun ...
md: considering sdb4 ...
md:  adding sdb4 ...
md: sdb3 has different UUID to sdb4
md: sdb1 has different UUID to sdb4
md:  adding sda4 ...
md: sda3 has different UUID to sdb4
md: sda1 has different UUID to sdb4
md: created md2
...
<5>reiser4[ktxnmgrd:md2:ru(1368)]: disable_write_barrier (fs/reiser4/wander=
.c:234)[zam-1055]:
NOTICE: md2 does not support write barriers, using synchronous write instea=
d.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-khJTYhkqNk5lVteULOcb
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.1 (GNU/Linux)

iD8DBQBEDcTKG8fHaOLTWwgRAuRSAJ9dCIxsE54PpxGK1CgA1Q/IZvYm/gCfQPdk
saDTeBqzQ7fbBD5LNqN+GHk=
=Z5Fn
-----END PGP SIGNATURE-----

--=-khJTYhkqNk5lVteULOcb--

