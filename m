From: "Yura Umanets" <umanets@priocom.com>
Subject: Re: about crash
Date: Thu, 25 Apr 2002 19:17:15 +0300
Message-ID: <3CC82C0B.7030604@priocom.com>
References: <3CC8173B.8030507@priocom.com> <1061290531.20020425170549@tnonline.net> <3CC81E0F.90000@priocom.com> <1672863140.20020425173202@tnonline.net> <3CC82770.4050607@priocom.com> <1294772062.20020425180352@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10175-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Anders Widman wrote:
> Hello again!
> 
> Wouldn't debugreiserfs -B exytract all bad blocks to a file? 
debugreiserfs -B some_block just will be trying to show contains of the 
given block. If this block contains direntry, then it will show it.


This is a part of my root:

[root@banshee tmp]$ debugreiserfs /dev/hda1 -B 13715

<-------------debugreiserfs, 2002------------->
reiserfsprogs 3.x.1b-pre4

13715 is used in ondisk bitmap

===================================================================
LEAF NODE (13715) contains level=1, nr_items=6, free_space=140 rdkey 
(real items 6)
-------------------------------------------------------------------------------
|###|type|ilen|f/sp| loc|fmt|fsck|                   key 
       |
|   |    |    |e/cn|    |   |need| 
       |
-------------------------------------------------------------------------------
|  0|1 2 0x0 SD (0), len 44, location 4052 entry count 0, fsck need 0, 
format new|
(NEW SD), mode drwxr-xr-x, size 448, nlink 16, mtime 04/21/2002 04:23:03 
blocks 1, uid 0
-------------------------------------------------------------------------------
|  1|1 2 0x1 DIR (3), len 448, location 3604 entry count 18, fsck need 
0, format old|
###: Name                     length    Object key           Hash 
Gen number
   0: ".                        "(  1)                 1 2           0 
   1, loc 440, state 4 not set
   1: "..                       "(  2)                 0 1           0 
   2, loc 432, state 4 not set
   2: "bin                      "(  3)             2 16950     2318336 
   0, loc 424, state 4 "r5"
   3: "dev                      "(  3)             2 17415     2354688 
   0, loc 416, state 4 "r5"
   4: "etc                      "(  3)                2 18     2401792 
   0, loc 408, state 4 "r5"
   5: "lib                      "(  3)               2 517     2529152 
   0, loc 400, state 4 "r5"
   6: "mnt                      "(  3)             2 18693     2563328 
   0, loc 392, state 4 "r5"
   7: "tmp                      "(  3)             2 17418     2711168 
   0, loc 384, state 4 "r5"
   8: "var                      "(  3)             2 17417     2730880 
   0, loc 376, state 4 "r5"
   9: "usr                      "(  3)                 2 3     2744576 
   0, loc 368, state 4 "r5"
  10: "boot                     "(  4)             2 17127    25652864 
   0, loc 360, state 4 "r5"
  11: "home                     "(  4)             2 18692    27051904 
   0, loc 352, state 4 "r5"
  12: "proc                     "(  4)             2 17416    29009280 
   0, loc 344, state 4 "r5"
  13: "sbin                     "(  4)                2 47    29360256 
   0, loc 336, state 4 "r5"
  14: "root                     "(  4)             2 18708    29415552 
   0, loc 328, state 4 "r5"
  15: ".autofs                  "(  7)             2 16939   294236416 
   0, loc 320, state 4 "r5"
  16: "quota.group              "( 11)            2 426388  1105062784 
   0, loc 304, state 4 "r5"
  17: "quota.user               "( 10)             2 23274  2056011904 
   0, loc 288, state 4 "r5"




