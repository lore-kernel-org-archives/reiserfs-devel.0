From: Naoki <naoki@valuecommerce.ne.jp>
Subject: Poor sequential write performance.
Date: Thu, 07 Nov 2002 19:59:55 +0900
Message-ID: <3DCA47AB.8060008@valuecommerce.ne.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11943-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Why ohh why..

I have an old RedHat 6.2 box with 2.4.2 kernel and an IDE disk. When I 
'wc' a file of about 100,000 text lines
it take under a second.

On my new RH 8.0 box with 2.4.18-14 kernel and SCSI disk it takes three 
seconds.

This is bizzare. Yes they are under the same load etc etc.  They are 
both mounted with
noatime / nodirtime.  What on earth is going on???

Any help most appreciated.


Look at this -

New machine :

time wc files*
6421   69607  894412 files
38806  420590 5394914 files.1
45227  490197 6289326 total

real    0m3.059s
user    0m2.543s
sys     0m0.064s

Old machine :

time wc files*
18628  201841 2597321 files
46603  505811 6501130 files.1
37122  402985 5201388 files.2
102353 1110637 14299839 total
0.25user 0.04system 0:00.38elapsed 76%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (115major+19minor)pagefaults 0swaps



