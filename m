From: Philipp Morger <philipp.morger@dolphins.ch>
Subject: Reiser4 on Loop Device
Date: Wed, 9 Mar 2005 08:47:55 +0100
Message-ID: <20050309074755.GA10678@atlantis.dolphins.ch>
Reply-To: Philipp Morger <philipp.morger@dolphins.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Dear List,

I'm having difficulties running reiser4 on a loop device:

--(#:~)-- dd if=3D/dev/zero of=3Dtestfile bs=3D1M count=3D500
500+0 records in
500+0 records out
--(#:~)-- losetup /dev/loop/0 testfile
--(#:~)-- losetup -a
/dev/loop/0: [0802]:55565837 (testfile)
--(#:~)-- mkfs.reiser4 /dev/loop/0
mkfs.reiser4 0.4.18
Copyright (C) 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser=
4progs/COPYING.

Block size 4096 will be used.
Linux 2.6.11-rc5-mm1 is detected.
Uuid 7f5aa34e-c3b5-4463-85c4-b49f7a73176b will be used.
Reiser4 is going to be created on /dev/loop/0.
(Yes/No): Yes
Creating reiser4 on /dev/loop/0...done
--(#:~)-- fsck.reiser4 /dev/loop/0
  *************************************************************
  ** If you are using the latest reiser4progs and  it fails **
  ** please  email bug reports to reiserfs-list@namesys.com, **
  ** providing  as  much  information  as  possible --  your **
  ** hardware,  kernel,  patches,  settings,  all  reiserfsk **
  ** messages  (including version), the reiser4fsck logfile, **
  ** check  the  syslog file  for  any  related information. **
  ** If you would like advice on using this program, support **
  ** is available  for $25 at  www.namesys.com/support.html. **
  *************************************************************

Fscking the /dev/loop/0 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Will use (default) params.
Continue?
(Yes/No): Yes
***** Openning the fs.
Fatal: Device operation "read" isn't implemented.
Fatal: Can't read master super block.
Fatal: Failed to open the master super block.
Fatal: Cannot open the FileSystem on (/dev/loop/0).
Segmentation fault


Versions in use:

--(#:~)-- uname -a
Linux eternity 2.6.11-rc5-mm1 #1 Tue Mar 8 11:11:03 CET 2005 i686 Intel(R) =
Pentium(R) 4 CPU 2.40GHz GenuineIntel GNU/Linux

--(#:~)-- ldd /usr/sbin/mkfs.reiser4
        linux-gate.so.1 =3D>  (0xffffe000)
        libreiser4-0.4.so.18 =3D> /usr/lib/libreiser4-0.4.so.18 (0x4cd45000)
        libaal-0.4.so.13 =3D> /usr/lib/libaal-0.4.so.13 (0x4ccef000)
        libuuid.so.1 =3D> /lib/libuuid.so.1 (0xb7f28000)
        libncurses.so.5 =3D> /lib/libncurses.so.5 (0xb7ed1000)
        libreadline.so.4 =3D> /lib/libreadline.so.4 (0x467e6000)
        libc.so.6 =3D> /lib/libc.so.6 (0xb7da8000)
        /lib/ld-linux.so.2 (0xb7f47000)

--(#:~)-- ldd /usr/sbin/fsck.reiser4
        linux-gate.so.1 =3D>  (0xffffe000)
        libreiser4-0.4.so.18 =3D> /usr/lib/libreiser4-0.4.so.18 (0x4cd45000)
        librepair-0.4.so.18 =3D> /usr/lib/librepair-0.4.so.18 (0x4ccfa000)
        libaal-0.4.so.13 =3D> /usr/lib/libaal-0.4.so.13 (0x4ccef000)
        libuuid.so.1 =3D> /lib/libuuid.so.1 (0xb7f07000)
        libncurses.so.5 =3D> /lib/libncurses.so.5 (0xb7eb0000)
        libreadline.so.4 =3D> /lib/libreadline.so.4 (0x467e6000)
        libc.so.6 =3D> /lib/libc.so.6 (0xb7d86000)
        /lib/ld-linux.so.2 (0xb7f26000)

--(#:/usr/src/linux-2.6.11-rc5-mm1)-- grep REISER .config
CONFIG_REISER4_FS=3Dy
# CONFIG_REISER4_DEBUG is not set
CONFIG_REISERFS_FS=3Dy
# CONFIG_REISERFS_CHECK is not set
CONFIG_REISERFS_PROC_INFO=3Dy
# CONFIG_REISERFS_FS_XATTR is not set

Unfortunately I don't have any real block devices handy at the moment on th=
e machine,=20
but I'll manage to get some. The final idea is to use dm-crypt with reiser4

--(#:/usr/src/linux-2.6.11-rc5-mm1)-- cryptsetup --cipher=3Dtwofish --key-s=
ize=3D256  --hash=3Dsha512 create crypt /dev/loop/0
Enter passphrase:

--(#:/usr/src/linux-2.6.11-rc5-mm1)-- cryptsetup status crypt
/dev/mapper/crypt is active:
  cipher:  twofish-cbc-plain
  keysize: 256 bits
  device:  /dev/loop/0
  offset:  0 sectors
  size:    1024000 sectors

To show that there's no conceptual error in the other parts of this system,=
 I'll use reiser3=20

--(#:/usr/src/linux-2.6.11-rc5-mm1)-- mkfs.reiserfs /dev/mapper/crypt
mkfs.reiserfs 3.6.19 (2003 www.namesys.com)

A pair of credits:
Chris Mason wrote the journaling code for V3,  which was enormously more us=
eful
to users than just waiting until  we could create a wandering log filesyste=
m as
Hans would have unwisely done without him.
Jeff Mahoney optimized the bitmap  scanning code for V3,  and performed the=
 big
endian cleanups.

Elena Gryaznova performed testing and benchmarking.


Guessing about desired format.. Kernel 2.6.11-rc5-mm1 is running.
Format 3.6 with standard journal
Count of blocks on the device: 128000
Number of blocks consumed by mkreiserfs formatting process: 8215
Blocksize: 4096
Hash function used to sort names: "r5"
Journal Size 8193 blocks (first block 18)
Journal Max transaction length 1024
inode generation number: 0
UUID: <no libuuid installed>
ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
        ALL DATA WILL BE LOST ON '/dev/mapper/crypt'!
Continue (y/n):y
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..ok

Tell your friends to use a kernel based on 2.4.18 or later, and especially =
not a
kernel based on 2.4.9, when you use reiserFS. Have fun.

ReiserFS is successfully created on /dev/mapper/crypt.

--(#:/usr/src/linux-2.6.11-rc5-mm1)-- fsck.reiserfs /dev/mapper/crypt
reiserfsck 3.6.19 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will read-only check consistency of the filesystem on /dev/mapper/crypt
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Y=
es
###########
reiserfsck --check started at Wed Mar  9 08:40:41 2005
###########
Replaying journal..
No transactions found
Checking internal tree..finished
Comparing bitmaps..finished
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem:
        Leaves 1
        Internal nodes 0
        Directories 1
        Other files 0
        Data block pointers 0 (0 of them are zero)
        Safe links 0
###########
reiserfsck finished at Wed Mar  9 08:40:42 2005
###########


If you need any further information, please contact me directly,=20
as I'm not subscribed to the ML


Thanks & Regards
Philipp

--=20
     _;\_    Philipp Morger / PHM2-RIPE     System & Network Administrator
    /_.  \   Dolphins Network Systems AG    Phone +41-1-847'45'45
   |/ -\ .)  Hardturmstrasse 135            Fax   +41-1-847'45'49
 -'^`-   \;  CH-8005 Z=C3=BCrich                 http://www.dolphins.ch/

       "The truth is just an excuse for the lack of a good imagination."
         -- Elim Garak, Star Trek: Deep Space Nine

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCLqorI9azw8usBlsRAllsAKCA9s73cVeCASGuuEsxi2cP/k+J+ACgm3y+
uEsTEO4n6WZZjGxQ85rU5g0=
=xNA7
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
