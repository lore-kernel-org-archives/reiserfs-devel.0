From: Hans Reiser <reiser@namesys.com>
Subject: Re: Mongo benchmark for latest reiserfs data logging
Date: Sat, 10 May 2003 15:24:30 +0400
Message-ID: <3EBCE16E.1030701@namesys.com>
References: <200305092353.21291.may@sbox.tugraz.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14047-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305092353.21291.may@sbox.tugraz.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Mayrhuber <may@sbox.tugraz.at>
Cc: reiserfs-list@namesys.com

Christian Mayrhuber wrote:

>Hi,
> 
>I've run a couple of tests with the different data logging modes
>writeback, ordered and journal.
>All data logging modes were perfectly stable, a kernel compile and a
>bonnie benchmark on /dev/md0 mounted on / did not have any negative impact
>on the filesystem. reiserfsck said that it was clean.
>
>Testparameters:
>===============
>KERNEL=2.4.21-rc1 + Chris Masons data logging + quota patches (nr's: 02 to 10)
>TEST PARTITITION SIZE=10GByte on LVM
>PROCESSOR=AMD Athlon XP 2000+
>RAM=512MB DDR 266
>HARDDISK=Seagate Baracuda IV, 60GB
>TEST WRITE_BUFFER=4096
>TEST FSTYPE=reiserfs
>TEST REP_COUNTER=3
>TEST GAMMA=0.0
>TEST NPROC=3
>TEST SYNC=off
>SER FILE_SIZE=4096
>SER BYTES=250000000
>
>                    reiser writeback  reiser ordered  reiser journal
>====================================================================
>PHASE Create
>STAT REAL_TIME                 84.53           81.87          114.36
>STAT CPU_TIME                  33.17           32.39           36.55
>STAT DF                      1515040         1515032         1515136
>PHASE Copy
>STAT REAL_TIME                278.98          289.65          338.67
>STAT CPU_TIME                  50.36           51.53            53.3
>STAT DF                      3030296         3030276         3030308
>PHASE Append
>STAT REAL_TIME               1256.53         1251.68            1404
>STAT CPU_TIME                  38.52           37.18           47.19
>STAT DF                      4014560         4014392         4014392
>PHASE Modify
>STAT REAL_TIME               1793.68         1665.74         1767.42
>STAT CPU_TIME                  29.05           26.61           33.65
>STAT DF                      4014560         4014392         4014392 
>PHASE Overwrite
>STAT REAL_TIME               2294.99         2047.15         2120.25
>STAT CPU_TIME                  32.27           30.68           40.06
>STAT DF                      4014560         4014392         4014392
>PHASE Read
>STAT REAL_TIME               1460.46         1411.12         1454.93
>STAT CPU_TIME                  30.83           30.94           32.82
>STAT DF                      4014560         4014392         4014392
>PHASE Stats
>STAT REAL_TIME                  8.83            8.93            8.89
>STAT CPU_TIME                   1.79            1.83             1.7
>STAT DF                      4014560         4014392         4014392
>PHASE Delete
>STAT REAL_TIME                101.59          111.34           108.8
>STAT CPU_TIME                  55.51           58.12           55.32
>STAT DF                            0               0               0
>
>  
>
Thanks for the measurements.  Try it with writing a single large file 
also....

-- 
Hans


