From: tric <tric@renatager.de>
Subject: Reiserfs on ide linux sw-raid 5
Date: Fri, 2 Aug 2002 21:11:09 +0200
Message-ID: <E17ahpN-00064d-00@tric>
Reply-To: tric <tric@renatager.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11116-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

hi,

im using reiserfs on a IDE linux SW raid5, kernel 2.4.19-rc5-ac1 and i have
a pretty big performance issue concerning creating files. on a normal
partition bonnie++ reports 2000+ files/sec. On my raid5 i get 11 or 12
files/sec. (ive included bonnie++ results). Im using 4k chunk, algorithm 2
for my raid5. FS is only around 70% full. Do you have any advice?

volker gropp

raid5 results:
Version 1.02c       ------Sequential Output------ --Sequential Input-
--Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block--
--Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec
%CP
kiste            1G  5394  77 20967  46 16144  24  7416  95 40924  27 104.3
1
                    ------Sequential Create------ --------Random
Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read---
-Delete--
files:max            /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec
%CP
          5:15000:0    11  91  3847  29  1586  38    11  89  6809  49  1633
42
kiste,1G,5394,77,20967,46,16144,24,7416,95,40924,27,104.3,1,5:15000:0,11,91,
3847,29,1586,38,11,89,6809,49,1633,42



