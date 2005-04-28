From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: can't umount / how to fsck at boot
Date: Thu, 28 Apr 2005 16:08:45 +0400
Message-ID: <1114690125.3402.281.camel@tribesman.namesys.com>
References: <1114671510.3402.2.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23936-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1114671510.3402.2.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: todd@curryweb.com
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2005-04-27 at 21:19, Todd Curry wrote:
> Gang, I=92m new to ReiserFS  and admittedly clueless about filesystems.=20
> I=92ve been happily easing into Linux for about a year,  until we went
> RAID and LVM and suddenly I need to know things that: (a) I didn=92t
> before, and (b) are a bit more arcane than I=92m used to.  I=92ve googled
> and read man pages extensively, but I=92m hitting diminishing returns
> for a fairly simple question / problem.
>=20
> =20
>=20
> Situation:  unable to run reiserfsck on my reiser partition, which has
> what appears to be an error message while running debugreiserfs:  This
> filesystem is NOT clean.  No other errors, drive appears to be
> functioning normally.  I=92d like to ensure it is clean as a whistle,
> however.
>=20
> =20
>=20
> I=92m running a simple RAID 5 setup as follows
>=20
> =20
>=20
> sda
>=20
> /boot =3D=3D ext3
>=20
> Lvm=85
>=20
> =20
>=20
> On lvm
>=20
> /           =3D=3D ext3
>=20
> /lvm      =3D=3D reiserfs (3, not 4)
>=20
> =20
>=20
> =20
>=20
> So, I tried umounting the /dev/lvmname/lvmX partition and get the
> =93device busy=94 error
>=20

You can try to mount -o remount,ro and reiserfsck it.
If you can not even remount it readonly - you have to boot of rescue CD,
active lvm, and reiserfsck.

If you can not do that either
find /reiserfs-mount-point -type f -exec cat {} > /dev/null \;
if it works without problems - filesystem has reasonable consistency=20


> =20
>=20
> I=92d like to find a way to run reiserfsck at boot either while I=92m
> watching or log the output.  I=92m running Fedora Core 2.  Any
> suggestions on how best to do this? =20
>=20
> =20
>=20
> Thanks,
>=20
> =20
>=20
> Todd=20
>=20
> =20
>=20
> Output from debugresiserfs below, for any experts who might see a
> problem=85
>=20
> =20
>=20
> [root@curryserver fcdrive]# debugreiserfs /dev/currylvm/lvm03
>=20
> debugreiserfs 3.6.19 (2003 www.namesys.com)
>=20
> =20
>=20
> =20
>=20
> Filesystem state: consistency is not checked after last mounting
>=20

As long as filesystem is mounted - it is ok.

> =20
>=20
> Reiserfs super block in block 16 on 0xfd01 of format 3.6 with standard
> journal
>=20
> Count of blocks on the device: 115572736
>=20
> Number of bitmaps: 3527
>=20
> Blocksize: 4096
>=20
> Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
> blocks): 58330605
>=20
> Root block: 23098989
>=20
> Filesystem is NOT clean
>=20

As long as filesystem is mounted - it is ok.

> Tree height: 5
>=20
> Hash function used to sort names: "r5"
>=20
> Objectid map size 2, max 972
>=20
> Journal parameters:
>=20
>         Device [0x0]
>=20
>         Magic [0x4e42afa0]
>=20
>         Size 8193 blocks (including 1 for journal header) (first block
> 18)
>=20
>         Max transaction length 1024 blocks
>=20
>         Max batch size 900 blocks
>=20
>         Max commit age 30
>=20
> Blocks reserved by journal: 0
>=20
> Fs state field: 0x0:
>=20
> sb_version: 2
>=20
> inode generation number: 1695433
>=20
> UUID: e38d4ba5-0c05-4e3c-92e5-ba714062622c
>=20
> LABEL:
>=20
> Set flags in SB:
>=20
>         ATTRIBUTES CLEAN
>=20
>=20

