From: Gerrit Hannaert <degerrit@web.de>
Subject: Corruption: --fix-fixable results in all nlink values = 0
Date: Thu, 15 Aug 2002 20:07:41 +0200
Message-ID: <200208152007.42370.degerrit@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11194-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

I recently noticed some errors in my system log, and had already found a di=
rectory with a few files in it which could not be deleted.=20
So I downloaded the newest reiserfs tools, compiled them and had a shot at =
reiserfsck --fix-fixable.
Big mistake. My 60GB filesystem had gone from slightly corrupt to becoming =
completely unmountable by doing this.

Some further analysis led me to the conclusion that *all* fields for nlink =
had become '0' (something I suppose shouldn't happen).

reiserfsprogs 3.6.3
filesystem version 3.6, created with something from 2.4.16 to .18
gcc used to compile: version 3.1.1 20020722 (prerelease) (SuSE Linux)
kernel 2.4.19 (compiled with same gcc)

What went wrong here?=20
Will reiserfsck --rebuild-tree fix this? Or is the error some compilation t=
hing?=20
What are my chances to recover the filesystem?

Regards,

=2D Gerrit



=2D-
luna:/ # mount /home
mount: Not a directory

=2D- /var/log/messages
Aug 15 19:40:51 luna kernel: reiserfs: found format "3.6" with standard jou=
rnal
Aug 15 19:40:51 luna kernel: reiserfs: checking transaction log (ide0(3,9))=
 for (ide0(3,9))
Aug 15 19:40:51 luna kernel: reiserfs: using ordered data mode
Aug 15 19:40:51 luna kernel: vs-13075: reiserfs_read_inode2: dead inode rea=
d from disk [1 2 0x0 SD]. This is likely to be race with knfsd. Ign
ore
Aug 15 19:40:51 luna kernel: Using r5 hash to sort names

=2D- reiserfsck output
/  1 (of   4)/  1 (of 159)/  1 (of 169)bad_stat_data: block 8232, [1 2 0x0 =
SD (0)], directory SD has bad nlink number
bad_stat_data: block 8232, [2 3 0x0 SD (0)], directory SD has bad nlink num=
ber
bad_stat_data: block 8232, [2 13 0x0 SD (0)], directory SD has bad nlink nu=
mber
bad_stat_data: block 8232, [2 14 0x0 SD (0)], directory SD has bad nlink nu=
mber
/  2 (of 169)bad_stat_data: block 8233, [2 132 0x0 SD (0)], directory SD ha=
s bad nlink number
bad_stat_data: block 8233, [2 1855 0x0 SD (0)], directory SD has bad nlink =
number
/  5 (of 169)bad_stat_data: block 8755, [2 3793 0x0 SD (0)], directory SD h=
as bad nlink number

=2D- ALL values of nlink are 0:
luna:/ # zcat /home.debugreiserfs.log.gz | grep "nlink"  | awk '{print $8}'=
 | sort | uniq -c
 382201 0,

=2D- debugreiserfs output
=46ilesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x309 of format 3.6 with standard journ=
al
Count of blocks on the device: 17638606
Number of bitmaps: 539
Blocksize: 4096
=46ree blocks (count of blocks - used [journal, bitmaps, data, reserved] bl=
ocks): 4826281
Root block: 39819
=46ilesystem is cleanly umounted
Tree height: 5
Hash function used to sort names: "r5"
Objectid map size 972, max 972
Journal parameters:
        Device [0x0]
        Magic [0x38906a00]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
=46s state field: 0x1
sb_version: 2
inode generation number: 12589619
UUID: 00000000-0000-0000-0000-000000000000
LABEL:
Set flags in SB:

INTERNAL NODE (39819) contains level=3D4, nr_items=3D3, free_space=3D3992 r=
dkey
PTR 0: [dc_number=3D8387, dc_size=3D3800] KEY 0: 68140 71445 0x1a07001 IND =
(1) PTR 1: [dc_number=3D713991, dc_size=3D2864] KEY 1: 1671434 1672343 0x4a
=2E..
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
LEAF NODE (8232) contains level=3D1, nr_items=3D8, free_space=3D128 rdkey (=
real items 8)
=2D------------------------------------------------------------------------=
=2D-----
|###|type|ilen|f/sp| loc|fmt|fsck|                   key                   =
   |
|   |    |    |e/cn|    |   |need|                                         =
   |
=2D------------------------------------------------------------------------=
=2D-----
|  0|1 2 0x0 SD (0), len 44, location 4052 entry count 0, fsck need 0, form=
at new|
(NEW SD), mode drwxr-xr-x, size 1408, nlink 0, mtime 07/19/2002 03:02:40 bl=
ocks 3, uid 0
=2D------------------------------------------------------------------------=
=2D-----
|  1|1 2 0x1 DIR (3), len 1408, location 2644 entry count 51, fsck need 0, =
format old|
###: Name                     length    Object key           Hash     Gen n=
umber
  0: ".                        "(  1)                 1 2           0    1,=
 loc 1400, state 4 not set
  1: "..                       "(  2)                 0 1           0    2,=
 loc 1392, state 4 not set
=2E..
 49: "lost+found               "( 10)             2 26247  2077744896    0,=
 loc 832, state 4 "r5"
 50: "bigfiles.list            "( 13)           2 2241662  2088467072    0,=
 loc 816, state 4 "r5"
=2D------------------------------------------------------------------------=
=2D-----
|  2|2 3 0x0 SD (0), len 44, location 2600 entry count 65535, fsck need 0, =
format new|
(NEW SD), mode drwxr-xr-x, size 264, nlink 0, mtime 06/25/2000 19:48:19 blo=
cks 1, uid 0
=2D------------------------------------------------------------------------=
=2D-----
|  3|2 3 0x1 DIR (3), len 264, location 2336 entry count 11, fsck need 0, f=
ormat old|
###: Name                     length    Object key           Hash     Gen n=
umber
  0: ".                        "(  1)                 2 3           0    1,=
 loc 256, state 4 not set
  1: "..                       "(  2)                 1 2           0    2,=
 loc 248, state 4 not set
  2: "at                       "(  2)                 3 5      208896    0,=
 loc 240, state 4 "r5"
  3: "kbd                      "(  3)                 3 8     2494720    0,=
 loc 232, state 4 "r5"
  4: "bash                     "(  4)                 3 6    25360384    0,=
 loc 224, state 4 "r5"
=2E..
