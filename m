From: Sebastian Kanthak <sebastian.kanthak@muehlheim.de>
Subject: vs-3050: wait_buffer_until_released
Date: Tue, 18 Feb 2003 18:40:47 +0100
Message-ID: <200302181840.47996.sebastian.kanthak@muehlheim.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_fAnU+iC56kvkgQf"
Return-path: <reiserfs-list-return-12817-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com


--Boundary-00=_fAnU+iC56kvkgQf
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I'm using a  vanilla 2.4.20 kernel with reiserfs on lvm. I can reproducably 
crash the system by accessing the reiserfs-partition via samba. If I do this, 
the following message appears in the kernel log and repeats every 5 or 10 
seconds.

Feb 18 11:11:10 manticore kernel: vs-3050: wait_buffer_until_released: nobody 
releases buffer (dev 3a:01, size 4096, blocknr 128036, count 2, list 0, state 
0x10019, page c1108284, (UPTODATE, CLEAN, UNLOCKED)). Still waiting 
(60000000)  JDIRTY !JWAIT

I've dumped the mentioned block via debugreiserfs and attached it to this 
email.

The only way to stop the machine is to hit the reset button, as every process 
that accesses the reiserfs-partition freezes and cannot be killed, including 
shutdown.

A reiserfsck scan gave the following results:

###########
reiserfsck --check started at Tue Feb 18 18:09:32 2003
###########
Replaying journal..
0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
Checking Semantic tree:
finished
1 found corruptions can be fixed with --fix-fixable
###########
reiserfsck finished at Tue Feb 18 18:26:47 2003
###########

Should I fix the bitmap thing? Is it the reason or the consequence from the 
above problem. We've changed to reiserfs one day ago, so I'm afraid that the 
problem will reappear, even if I fix it with reiserfsck.

I've searched the mailing list archives and found others with the same 
problem, however, no solution yet. Do you know the reason for the problem?

Sebastian

--Boundary-00=_fAnU+iC56kvkgQf
Content-Type: text/plain;
  charset="us-ascii";
  name="block.dat"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="block.dat"

<--------debugreiserfs 3.6.4, 2002-------->

128036 is free in ondisk bitmap

===================================================================
LEAF NODE (128036) contains level=1, nr_items=15, free_space=16 rdkey (real items 15)
-------------------------------------------------------------------------------
|###|type|ilen|f/sp| loc|fmt|fsck|                   key                      |
|   |    |    |e/cn|    |   |need|                                            |
-------------------------------------------------------------------------------
|  0|21317 21320 0x61 DRCT (2), len 176, location 3920 entry count 65535, fsck need 0, format new|
-------------------------------------------------------------------------------
|  1|21317 21321 0x0 SD (0), len 44, location 3876 entry count 65535, fsck need 0, format new|
(NEW SD), mode -rw-r--r--, size 375, nlink 1, mtime 05/18/1999 17:46:24 blocks 8, uid 1002
-------------------------------------------------------------------------------
|  2|21317 21321 0x1 DRCT (2), len 376, location 3500 entry count 65535, fsck need 0, format new|
-------------------------------------------------------------------------------
|  3|21317 21322 0x0 SD (0), len 44, location 3456 entry count 65535, fsck need 0, format new|
(NEW SD), mode drwxr-xr-x, size 320, nlink 10, mtime 02/15/2003 20:49:28 blocks 1, uid 1002
-------------------------------------------------------------------------------
|  4|21317 21322 0x1 DIR (3), len 320, location 3136 entry count 12, fsck need 0, format old|
###: Name                     length    Object key           Hash     Gen number
  0: ".                        "(  1)       [21317 21322]           0    1, loc 312, state 4 not set
  1: "..                       "(  2)           [3 21317]           0    2, loc 304, state 4 not set
  2: "His6                     "(  4)       [21322 22291]    19401984    0, loc 296, state 4 "r5"
  3: "Verlauf                  "(  7)       [21322 22332]    43074944    0, loc 288, state 4 "r5"
  4: "Recent                   "(  6)       [21322 21361]   472559104    0, loc 280, state 4 "r5"
  5: "USER.DAT                 "(  8)       [21322 22330]   788601344    0, loc 272, state 4 "r5"
  6: "Cookies                  "(  7)       [21322 21941]   817404288    0, loc 264, state 4 "r5"
  7: "Desktop                  "(  7)       [21322 21323]   856471936    0, loc 256, state 4 "r5"
  8: "Favoriten                "(  9)       [21322 22331]  1054739968    0, loc 240, state 4 "r5"
  9: "Anwendungsdaten          "( 15)       [21322 21613]  1200321920    0, loc 224, state 4 "r5"
 10: "Netzwerkumgebung         "( 16)       [21322 21555]  1733406080    0, loc 208, state 4 "r5"
 11: "PROB005.TMP              "( 11)       [21322 22329]  1887205248    0, loc 192, state 4 "r5"
-------------------------------------------------------------------------------
|  5|21317 22378 0x0 SD (0), len 44, location 3092 entry count 65535, fsck need 0, format new|
(NEW SD), mode -rwx------, size 1474560, nlink 1, mtime 05/19/1999 19:25:52 blocks 2880, uid 1002
-------------------------------------------------------------------------------
|  6|21317 22378 0x1 IND (1), len 1440, location 1652 entry count 0, fsck need 0, format new|
360 pointers
[ 141297(360)]
-------------------------------------------------------------------------------
|  7|21317 22379 0x0 SD (0), len 44, location 1608 entry count 65535, fsck need 0, format new|
(NEW SD), mode drwxr-xr-x, size 112, nlink 3, mtime 01/05/2000 18:58:18 blocks 1, uid 1002
-------------------------------------------------------------------------------
|  8|21317 22379 0x1 DIR (3), len 112, location 1496 entry count 4, fsck need 0, format old|
###: Name                     length    Object key           Hash     Gen number
  0: ".                        "(  1)       [21317 22379]           0    1, loc 104, state 4 not set
  1: "..                       "(  2)           [3 21317]           0    2, loc 96, state 4 not set
  2: "maps                     "(  4)       [22379 22380]    27933440    0, loc 88, state 4 "r5"
  3: "lambda_rotate.gif        "( 17)       [22379 22385]  1478681856    0, loc 64, state 4 "r5"
-------------------------------------------------------------------------------
|  9|21317 22386 0x0 SD (0), len 44, location 1452 entry count 65535, fsck need 0, format new|
(NEW SD), mode -rwx------, size 888053, nlink 1, mtime 08/15/2000 10:11:16 blocks 1736, uid 1002
-------------------------------------------------------------------------------
| 10|21317 22386 0x1 IND (1), len 868, location 584 entry count 0, fsck need 0, format new|
217 pointers
[ 140093(4) 140121(213)]
-------------------------------------------------------------------------------
| 11|21317 22387 0x0 SD (0), len 44, location 540 entry count 65535, fsck need 0, format new|
(NEW SD), mode drwx--x--x, size 48, nlink 2, mtime 08/07/2002 19:56:20 blocks 1, uid 1002
-------------------------------------------------------------------------------
| 12|21317 22387 0x1 DIR (3), len 48, location 492 entry count 2, fsck need 0, format old|
###: Name                     length    Object key           Hash     Gen number
  0: ".                        "(  1)       [21317 22387]           0    1, loc 40, state 4 not set
  1: "..                       "(  2)           [3 21317]           0    2, loc 32, state 4 not set
-------------------------------------------------------------------------------
| 13|21317 22388 0x0 SD (0), len 44, location 448 entry count 65535, fsck need 0, format new|
(NEW SD), mode drwx------, size 160, nlink 6, mtime 12/11/2000 20:32:27 blocks 1, uid 1002
-------------------------------------------------------------------------------
| 14|21317 22388 0x1 DIR (3), len 48, location 400 entry count 2, fsck need 0, format old|
###: Name                     length    Object key           Hash     Gen number
  0: ".                        "(  1)       [21317 22388]           0    1, loc 40, state 4 not set
  1: "..                       "(  2)           [3 21317]           0    2, loc 32, state 4 not set
===================================================================

--Boundary-00=_fAnU+iC56kvkgQf--

