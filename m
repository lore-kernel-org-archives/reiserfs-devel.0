From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: reiserfs3 and -o sync revisited
Date: Fri, 15 Nov 2002 12:07:09 +0100
Message-ID: <m3ptt7m6qq.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12000-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

I have reiserfs v3.6 (as of 2.4.19) with the following patches:

A-00-version.diff.gz
A-01-relocation-4.diff.gz
A-02-commit_super-9-relocation.diff.gz
A-03-data-logging-25.diff.gz
A-03-logging-export.diff.gz
A-04-write_times.diff.gz
A-05-search_reada-4.diff.gz
B-02-gcc31_cleanup.diff.gz
B-03-help_cleanup.diff.gz
B-04-item_alignment_fix.diff.gz
B-05-reiserfs_make_bad_inode.diff.gz
B-06-bitops.diff.gz
C-bridge-netfilter.diff.gz
D-patchomatic.diff.gz
E-rmap14b.diff.gz
F-config.diff.gz

The A and B patches are Chris Mason's and the official Namesys patches,
possibly gzipped, the rest does not touch ReiserFS code except possibly
rmap.

I have run some bonnie++ 1.02c tests on an old swap partition I
converted to reiserfs, ext3fs or ext2fs, and I gather that using the
mount -o sync option makes virtually no difference on reiserfs, but
brings ext3 and ext2 nearly to a halt. Is mount -o sync implemented and
working?

Hardware: Duron 700, machine was NOT idle, VIA 82C686, Maxtor 4W060H4 as
single master (60 GB, 5400/min, 2 MB cache, write cache off), no slave
in same channel, hdc/hdd also idle.

ext2a: ext2   ext2d: ext2 dirsync   ext2s: ext2 sync
ext3_d=o: ext3 data=ordered ext3_d=w: ext3 data=writeback
ext3_d=j: ext3 data=journal ext3s_d=j: ext3 data=journal,sync
reiser: reiser no options, reiser_s: reiser sync
reiser_d=o: reiser data=ordered reiser_d=w: reiser data=writeback.

(I know the test set is not complete).

Note the data are from a single run of a workstation under my regular
use, but the drive (hda) I made the test on was idle otherwise.

Should I re-run this test with 2.4.20-rcN before anyone has a look at
this?


Version  1.02c      ------Sequential Output------ --Sequential Input- --Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
ext2a          360M            5483   6  3187   4           28930  23 112.5   1
ext2d          360M            4974   4  3310   4           23403  17  97.2   1
ext2s          360M             191   0   637   1           30690  21 113.5   1
ext3_d=o       360M            4898  13  2826   3           20767  15 114.0   1
ext3_d=w       360M            4518  14  3119   4           22996  19  92.6   1
ext3_d=j       360M            1930   7  1876   4           26598  22 101.8   1
ext3s_d=j      360M             222   1   219   0           29708  24  89.4   1
reiser         360M            5845   7  3173   3           28928  14 133.8   1
reiser_s       360M            5861   7  3103   3           28173  16 127.1   1
reiser_d=o     360M            5555   6  3253   3           30279  17 120.8   1
reiser_d=w     360M            5641   6  3223   2           31471  17 120.4   0
                    ------Sequential Create------ --------Random Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
files:max:min        /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
ext2a 10:10000:0/23 12141  97 +++++ +++  1266   4 12307  97 +++++ +++  1214   7
ext2d 10:10000:0/23  2073  15 +++++ +++  1923   7  2185  17 19844  93  1605   8
ext2s 10:10000:0/23    17   0  4577  28    21   0    17   0   351   2    19   0
ext3_ 10:10000:0/23   951  26 19579  93  2045  19   792  18 19435  98  2689  33
ext3_ 10:10000:0/23   681  19 18572  92 10674  93   769  18 17919  94  7238  96
ext3_ 10:10000:0/23   330   9  9302  49 11259  97   337   9  1325   7  7620  95
ext3s 10:10000:0/23    15   0 18928  90    21   0    15   0 14455  77    16   0
reise 10:10000:0/23   247  47   234   1  5245  96   425  37    85   0   298   6
reise 10:10000:0/23   406  47   201   1  2899  52   413  35    91   0   318   7
reise 10:10000:0/23   431  62   219   1  2174  39   408  30    74   0   446  10
reise 10:10000:0/23   354  73   210   1  2351  41   732  72    76   0   350   7


-- 
Matthias Andree
