From: Radim Kolar <hsn@cybermail.net>
Subject: BUG: uncorrectable/undetectable damage by reiserfsck
Date: Wed, 7 Aug 2002 07:05:35 +0200
Message-ID: <20020807050535.GA541@home>
References: <1028663930.11027.ezmlm@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11136-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1028663930.11027.ezmlm@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,
  I have damaged reiserfs, which can not be repaired by any utility and
  detected only by linux kernel.
  
  When used this filesystem with 2.4.18 kernel and reiserfs detect this
  damage, it traps kernel or lock out the filesystem and will not make
  any further reads/writes to them. With the new 2.4.19 kernel reiserfs
  do not hangs kernel or filesystem. At least my system is more useable
  now. 

  There are some files which can
  be reached  by opendir() / readdir() calls but there are not lstat or
  stat() -able. I can not do nothing with them (i.e. delete them). I
  will get permission denied error from kernel.

  reiserfsck --check will not see this corruption
  reiserfsck --fix-fixable do not repair it and
  reiserfsck --rebuild-tree also do not repair it

  Summary: it needs to have AT LEAST better --check option :)

DETAILS FOLLOWS:

home:~# time reiserfsck -q --check /dev/hdd2

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.2

Will read-only check consistency of the filesystem on /dev/hdd2
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Wed Aug  7 06:27:31 2002
###########
Replaying journal..
No transactions found
Checking S+tree..ok
Comparing bitmaps..ok
Checking Semantic tree...
ok
No corruptions found
There are on the filesystem:
        Leaves 27251
        Internal nodes 190
        Directories 11271
        Other files 86195
        Data block pointers 519647 (4 of them are zero)
        Safe links 0
###########
reiserfsck finished at Wed Aug  7 06:36:08 2002
###########

real    8m40.062s
user    0m36.510s
sys     0m13.920s
home:~# 

here is what reiserfs says when accessing that files:

home:/mnt/home-bk/hsn/.gimp-1.2/gimpressionist# ls
is_leaf: wrong item type for item *3.5*[45156 16306 0x1 IND], item_len 4, item_location 1698, free_space(entry_count) 0
vs-5150: search_by_key: invalid format found in block 431754. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of [45143 45144 0x0 SD]
ls: Paper: Permission denied
is_leaf: wrong item type for item *3.5*[45156 16306 0x1 IND], item_len 4, item_location 1698, free_space(entry_count) 0
vs-5150: search_by_key: invalid format found in block 431754. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of [45143 45145 0x0 SD]
ls: Brushes: Permission denied
is_leaf: wrong item type for item *3.5*[45156 16306 0x1 IND], item_len 4, item_location 1698, free_space(entry_count) 0
vs-5150: search_by_key: invalid format found in block 431754. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of [45143 45146 0x0 SD]
ls: Presets: Permission denied
home:/mnt/home-bk/hsn/.gimp-1.2/gimpressionist#

i am providing dump of this block 431754 by debugreiserfs

Script started on Wed Aug  7 06:54:00 2002
home:~# debugreiserfs -1 431754 /dev/hdd2 

<-------------debugreiserfs, 2002------------->
reiserfsprogs 3.6.2

431754 is used in ondisk bitmap

===================================================================
LEAF NODE (431754) contains level=1, nr_items=20, free_space=96 rdkey (real items 20)
-------------------------------------------------------------------------------
|###|type|ilen|f/sp| loc|fmt|fsck|                   key                      |
|   |    |    |e/cn|    |   |need|                                            |
-------------------------------------------------------------------------------
|  0|45098 45108 0x228 DRCT (2), len 972, location 3124 entry count 65535, fsck need 0, format old|
-------------------------------------------------------------------------------
|  1|45098 45109 0x0 SD (0), len 32, location 3092 entry count 65535, fsck need 0, format old|
(OLD SD), mode -rw-rw-r--, size 263, nlink 1, uid 1000, FDB 1, mtime 05/14/1999 14:56:08 blocks 8
-------------------------------------------------------------------------------
|  2|45098 45109 0x1 DRCT (2), len 263, location 2829 entry count 65535, fsck need 0, format old|
-------------------------------------------------------------------------------
|  3|45098 45183 0x0 SD (0), len 32, location 2797 entry count 65535, fsck need 0, format old|
(OLD SD), mode -rw-rw-r--, size 163, nlink 1, uid 1000, FDB 1, mtime 05/14/1999 14:56:07 blocks 8
-------------------------------------------------------------------------------
|  4|45098 45183 0x1 DRCT (2), len 163, location 2634 entry count 65535, fsck need 0, format old|
-------------------------------------------------------------------------------
|  5|45098 45184 0x0 SD (0), len 32, location 2602 entry count 65535, fsck need 0, format old|
(OLD SD), mode -rw-rw-r--, size 69, nlink 1, uid 1000, FDB 1, mtime 05/14/1999 14:56:07 blocks 8
-------------------------------------------------------------------------------
|  6|45098 45184 0x1 DRCT (2), len 69, location 2533 entry count 65535, fsck need 0, format old|
-------------------------------------------------------------------------------
|  7|45098 45185 0x0 SD (0), len 32, location 2501 entry count 65535, fsck need 0, format old|
(OLD SD), mode -rw-rw-r--, size 522, nlink 1, uid 1000, FDB 1, mtime 05/14/1999 14:56:08 blocks 8
-------------------------------------------------------------------------------
|  8|45098 45185 0x1 DRCT (2), len 522, location 1979 entry count 65535, fsck need 0, format old|
-------------------------------------------------------------------------------
|  9|45143 45144 0x0 SD (0), len 32, location 1947 entry count 65535, fsck need 0, format old|
(OLD SD), mode drwxrwxr-x, size 35, nlink 2, uid 1000, FDB 4294967295, mtime 07/11/2001 08:29:22 blocks 1
-------------------------------------------------------------------------------
| 10|45143 45144 0x1 DIR (3), len 35, location 1912 entry count 2, fsck need 0, format old|
###: Name                     length    Object key           Hash     Gen number
  0: ".                        "(  1)         45143 45144           0    1, loc 34, state 4 not set
  1: "..                       "(  2)         38347 45143           0    2, loc 32, state 4 not set
-------------------------------------------------------------------------------
| 11|45143 45145 0x0 SD (0), len 32, location 1880 entry count 65535, fsck need 0, format old|
(OLD SD), mode drwxrwxr-x, size 35, nlink 2, uid 1000, FDB 4294967295, mtime 07/11/2001 08:29:22 blocks 1
-------------------------------------------------------------------------------
| 12|45143 45145 0x1 DIR (3), len 35, location 1845 entry count 2, fsck need 0, format old|
###: Name                     length    Object key           Hash     Gen number
  0: ".                        "(  1)         45143 45145           0    1, loc 34, state 4 not set
  1: "..                       "(  2)         38347 45143           0    2, loc 32, state 4 not set
-------------------------------------------------------------------------------
| 13|45143 45146 0x0 SD (0), len 32, location 1813 entry count 65535, fsck need 0, format old|
(OLD SD), mode drwxrwxr-x, size 35, nlink 2, uid 1000, FDB 4294967295, mtime 07/11/2001 08:29:22 blocks 1
-------------------------------------------------------------------------------
| 14|45143 45146 0x1 DIR (3), len 35, location 1778 entry count 2, fsck need 0, format old|
###: Name                     length    Object key           Hash     Gen number
  0: ".                        "(  1)         45143 45146           0    1, loc 34, state 4 not set
  1: "..                       "(  2)         38347 45143           0    2, loc 32, state 4 not set
-------------------------------------------------------------------------------
| 15|45156 4126 0x0 SD (0), len 32, location 1746 entry count 65535, fsck need 0, format old|
(OLD SD), mode -rw-rw-r--, size 11044, nlink 1, uid 1000, FDB 4294967295, mtime 07/14/2002 18:09:05 blocks 24
-------------------------------------------------------------------------------
| 16|45156 4126 0x1 IND (1), len 12, location 1734 entry count 0, fsck need 0, format old|
3 pointers
[ 431756 431762 431765]
-------------------------------------------------------------------------------
| 17|45156 16306 0x0 SD (0), len 32, location 1702 entry count 65535, fsck need 0, format old|
(OLD SD), mode -rw-rw-r--, size 5194, nlink 1, uid 1000, FDB 4097, mtime 07/17/2002 21:59:06 blocks 16
-------------------------------------------------------------------------------
| 18|45156 16306 0x1 IND (1), len 4, location 1698 entry count 0, fsck need 4, format old|
1 pointer
[ 403749]
-------------------------------------------------------------------------------
| 19|45156 16306 0x1001 DRCT (2), len 1098, location 600 entry count 0, fsck need 0, format old|
===================================================================
home:~# cat /proc/partitions

major minor  #blocks  name

  22     0    1667232 ide/host0/bus1/target0/lun0/disc
  22     1      40288 ide/host0/bus1/target0/lun0/part1
  22     2      48384 ide/host0/bus1/target0/lun0/part2
  22     3          1 ide/host0/bus1/target0/lun0/part3
  22     5     782176 ide/host0/bus1/target0/lun0/part5
  22     6     796288 ide/host0/bus1/target0/lun0/part6
  22    64    3153024 ide/host0/bus1/target1/lun0/disc
  22    65      96736 ide/host0/bus1/target1/lun0/part1
  22    66    3056256 ide/host0/bus1/target1/lun0/part2
   3     0    1251936 ide/host0/bus0/target0/lun0/disc
   3     1    1249888 ide/host0/bus0/target0/lun0/part1
Script done on Wed Aug  7 06:54:09 2002

If you need more information, mail me. I am interrested in some info how
to repair this. This filesystem has quite a lot corruptions which are
exactly like this (bug in reiserfs core?).
