From: Tupshin Harper <tupshin@tupshin.com>
Subject: Bonnie++ comparison
Date: Tue, 26 Aug 2003 20:49:30 -0700
Message-ID: <3F4C2A4A.70503@tupshin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15448-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

FWIW, I have done a bonnie++ (the fast version with -f parameter) 
comparison on all of the major linux filesystems, including reiser4, 
reiser3, jfs, xfs, ext2, ext3, and ext3 in writeback mode. View in a 
mono-spaced font for legibility. These were done on an Athlon with 1Gb 
of ram, the partition was the same 4G for all tests, and was on LVM. 
Kernel is 2.6.0-test4 + the reiser4 diff released today. Debug was 
disabled. I can perform addtional tests on the same system if anybody 
would like.

-Tupshin

REISER4:
Version  1.03       ------Sequential Output------ --Sequential Input- 
--Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- 
--Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  
/sec %CP
bastard          2G           21152  16 10809  11           18309  12 
108.5   1
                    ------Sequential Create------ --------Random 
Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- 
-Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  
/sec %CP
                 16 17965  91 +++++ +++ 10883  97  8207  93 +++++ +++ 
11040  92
bastard,2G,,,21152,16,10809,11,,,18309,12,108.5,1,16,17965,91,+++++,+++,10883,97,8207,93,+++++,+++,11040,92

REISER3:
Version  1.03       ------Sequential Output------ --Sequential Input- 
--Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- 
--Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  
/sec %CP
bastard          2G           23812  16 12449   8           24847  11  
91.9   0
                    ------Sequential Create------ --------Random 
Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- 
-Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  
/sec %CP
                 16 11964  89 +++++ +++ 11567  99 13482  99 +++++ +++ 
10892  99
bastard,2G,,,23812,16,12449,8,,,24847,11,91.9,0,16,11964,89,+++++,+++,11567,99,13482,99,+++++,+++,10892,99

JFS:
Version  1.03       ------Sequential Output------ --Sequential Input- 
--Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- 
--Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  
/sec %CP
bastard          2G           24416  11 12133   5           25286   8  
95.1   0
                    ------Sequential Create------ --------Random 
Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- 
-Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  
/sec %CP
                 16  5616  18 +++++ +++  5269  21  3392  36 +++++ +++   
627   4
bastard,2G,,,24416,11,12133,5,,,25286,8,95.1,0,16,5616,18,+++++,+++,5269,21,3392,36,+++++,+++,627,4

XFS:
Version  1.03       ------Sequential Output------ --Sequential Input- 
--Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- 
--Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  
/sec %CP
bastard          2G           22428  11 10898   6           25072   9  
81.8   0
                    ------Sequential Create------ --------Random 
Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- 
-Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  
/sec %CP
                 16  1750  25 +++++ +++  1704  41  2004  34 +++++ +++   
531   7
bastard,2G,,,22428,11,10898,6,,,25072,9,81.8,0,16,1750,25,+++++,+++,1704,41,2004,34,+++++,+++,531,7

EXT2:
Version  1.03       ------Sequential Output------ --Sequential Input- 
--Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- 
--Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  
/sec %CP
bastard          2G           24133  10 11762   6           26105   9  
99.3   0
                    ------Sequential Create------ --------Random 
Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- 
-Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  
/sec %CP
                 16  1549  97 +++++ +++ +++++ +++  1633  99 +++++ +++  
3416  99
bastard,2G,,,24133,10,11762,6,,,26105,9,99.3,0,16,1549,97,+++++,+++,+++++,+++,1633,99,+++++,+++,3416,99

EXT3:
Version  1.03       ------Sequential Output------ --Sequential Input- 
--Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- 
--Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  
/sec %CP
bastard          2G           23992  20 11474   7           22902   8  
84.0   0
                    ------Sequential Create------ --------Random 
Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- 
-Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  
/sec %CP
                 16   839  98 +++++ +++ 31979  99   774  93 +++++ +++  
2265  95
bastard,2G,,,23992,20,11474,7,,,22902,8,84.0,0,16,839,98,+++++,+++,31979,99,774,93,+++++,+++,2265,95

EXT3--writeback
Version  1.03       ------Sequential Output------ --Sequential Input- 
--Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- 
--Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  
/sec %CP
bastard          2G           22837  15 12159   6           26974  10  
92.5   0
                    ------Sequential Create------ --------Random 
Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- 
-Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  
/sec %CP
                 16   783  97 +++++ +++ +++++ +++   856  97 +++++ +++  
2410  96
bastard,2G,,,22837,15,12159,6,,,26974,10,92.5,0,16,783,97,+++++,+++,+++++,+++,856,97,+++++,+++,2410,96


