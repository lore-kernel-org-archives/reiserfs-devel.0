From: "Alexander Waller" <a.waller@webpoint.at>
Subject: HILFE! HELP! Problem with my root-partition
Date: Tue, 26 Aug 2003 19:41:05 +0200
Message-ID: <200308261742.h7QHgGD02541@fx.webpoint.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15422-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi!
I restarted my server.
Now my reiserfs-root-partition cannot be mounted.
Reiserfsck doesn=B4t help.

filehound:~ # reiserfsck --fix-fixable /dev/hdb3
reiserfsck 3.6.4 (2002 www.namesys.com)
Will check consistency of the filesystem on /dev/hdb3
and will fix what can be fixed w/o --rebuild-tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
reiserfs_open: neither new nor old reiserfs format found on /dev/hdb3

reiserfsck: Cannot not open filesystem on "/dev/hdb3"
Aborted
filehound:~

There is a harddisk, realy.=20
filehound:~ # fdisk -l /dev/hdb

Disk /dev/hdb: 28.5 GB, 28520497152 bytes
16 heads, 63 sectors/track, 55262 cylinders
Units =3D cylinders of 1008 * 512 =3D 516096 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hdb1   *         1        33     16600+  83  Linux
/dev/hdb2            34       292    130536   82  Linux swap
/dev/hdb3           293     55252  27699840   83  Linux
filehound:~ #

Please can anyone help me ?!
Alex.



--=20

WebPoint Internet Solutions
Alexander Waller
Vorarlberger Wirtschaftspark
A-6840 G=F6tzis
=20
www.webpoint.at
tel.  +43 5523 58244
fax.  +43 5523 58255
mobil +43 676 4121128
=20
webmaster-team  : webmaster@webpoint.at
hostmaster-team : hostmaster@webpoint.at

***                                     ***
*       WebPoint Internet Solutions       *
***                                     ***
=20


