From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Mongo benchmark for linux journaling fs's
Date: Sun, 11 May 2003 22:08:35 +0200
Message-ID: <200305112208.35987.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14070-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Testparameters:
===============
KERNEL=2.4.21-rc1 + Chris Masons data logging + quota patches (nr's: 02 to 10)
The xfs benchmark was conducted with the 2.4.20 kernel + xfs patch.
The filesize is 4096 bytes which should be the best case for ext3
with blocksize 4k.

TEST PARTITITION SIZE=20GByte on LVM
PROCESSOR=AMD Athlon XP 2000+
RAM=512MB DDR 266
HARDDISK=Seagate Baracuda IV, 60GB
TEST WRITE_BUFFER=4096
TEST FSTYPE=reiserfs
TEST REP_COUNTER=3
TEST GAMMA=0.0
TEST NPROC=3
TEST SYNC=off
TEST DD_MBCOUNT=10000
SER FILE_SIZE=4096
SER BYTES=250000000

        reiserfs writeback, ordered, journal      jfs  ext3 ordered      xfs
============================================================================
PHASE Create
STAT REAL_TIME       82.51    78.97   108.37   554.48        141.44   372.74
STAT CPU_TIME        32.88    30.36    36.22    21.26         26.15    60.39
STAT DF            1515172  1515028  1515236  1680888       1473948  1575300
PHASE Copy
STAT REAL_TIME      349.65   284.71   334.11  1228.76        686.17   905.28
STAT CPU_TIME        48.82    49.56    54.49    43.35         38.37   124.48
STAT DF            3030352  3030308  3030476  3360776       2947896  3150416
PHASE Append
STAT REAL_TIME     1216.95  1192.98  1377.63  2260.01        818.88  1087.89
STAT CPU_TIME        36.33    34.78    47.36    34.34         29.22    61.91
STAT DF            4014480  4014244  4014708  4334936       3922056  4124576
PHASE Modify
STAT REAL_TIME     1613.24  1609.83  1792.76   1843.1        1473.9  1520.02
STAT CPU_TIME        25.68    23.51    32.81    20.09         20.46    54.02
STAT DF            4014480  4014244  4014708  4334936       3922056  4124576
PHASE Overwrite
STAT REAL_TIME     1936.06  1847.97  2237.04  2231.08        1586.9  1629.22
STAT CPU_TIME        30.59    28.08    40.39    23.32         24.29    70.78
STAT DF            4014480  4014244  4014708  4334936       3922056  4124576
PHASE Read
STAT REAL_TIME     1419.71  1391.03  1438.73   1643.8 	    1673.14   1607.4
STAT CPU_TIME        33.29    28.32    29.39    24.65         26.01    68.62
STAT DF            4014480  4014244  4014708  4334936       3922056  4124576
PHASE Stats
STAT REAL_TIME        9.01     9.06     8.87     9.05           9.1     9.08
STAT CPU_TIME         1.85     1.81     1.91     1.91          1.74     2.06
STAT DF            4014480  4014244  4014708  4334936       3922056  4124576
PHASE Delete
STAT REAL_TIME      108.33    98.81    98.48  1574.88         93.68   432.25
STAT CPU_TIME        56.47    53.58    55.38    31.12         19.98   122.75
STAT DF                  0        0        0    11524             0   183968
SER DD_MBCOUNT=10000
PHASE dd_writing_largefile
STAT REAL_TIME      916.88      965  3476.22  1214.42       1216.96   892.72
STAT CPU_TIME       294.66   296.72   508.81   232.92        290.85   186.83
STAT DF           10250180 10250180 10250180 10250288      10250016 10423972
PHASE dd_reading_largefile
STAT REAL_TIME      843.75    841.2   860.58  4504.75        916.95   809.33
STAT CPU_TIME       200.72    200.1   202.39   786.48        191.83   179.29
STAT DF           10250180 10250180 10250180 10250288      10250016 10423972

Large file writes in data=journal mode are pretty bad, but the others have
catched up with xfs!

I hope these are useful.
-- 
lg, Chris

