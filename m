From: rwhron@earthlink.net
Subject: big reiserfs regression in 2.4.20-pre2
Date: Thu, 15 Aug 2002 23:08:28 -0400
Message-ID: <20020816030828.GC10387@rushmore>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11202-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On a quad xeon with 3.75 gb ram there was a big
regression in dbench and tiobench with many threads
between 2.4.20-pre1 and 2.4.20-pre2.  Below is from
5 dbench runs.

There was a 23% regression at 192 processes

reiserfs

dbench 192 processes    Average		High		Low
2.4.20-pre1             55.94		 58.17		 54.26
2.4.20-pre2         	42.98		 44.73		 42.30

And 13% regression at 64 processes.

dbench 64 processes     Average		High		Low
2.4.20-pre1         	 70.98		 72.53		 69.47
2.4.20-pre2         	 61.93		 64.01		 57.31

ext2 and ext3 did not change between 2.4.20-pre1 and pre2.

ext3

dbench 192 processes    Average		High		Low
2.4.20-pre1         	 60.50		 61.47		 59.01
2.4.20-pre2         	 60.61		 61.63		 58.80

dbench 64 processes     Average		High		Low
2.4.20-pre1         	 82.73		 89.63		 64.67
2.4.20-pre2         	 83.12		 91.28		 65.11

ext2

dbench 192 processes    Average		High		Low
2.4.20-pre1         	116.32		124.44		110.95
2.4.20-pre2         	116.45		119.89		109.89

dbench 64 processes     Average		High		Low
2.4.20-pre1         	145.61		158.67		102.33
2.4.20-pre2         	145.77		158.96		103.89

CPU utilization on reiserfs went down in the high thread count 
tiobench tests, but it also had a throughput regression when there was 
more than one thread most tests.  ext2 and ext3 didn't have a regression.  

tiobench-0.3.3
Unit information
================
File size = 12288 megabytes
Blk Size  = 4096 bytes
Rate      = megabytes per second
CPU%      = percentage of CPU used during the test
Latency   = milliseconds
Lat%      = percent of requests that took longer than X seconds
CPU Eff   = Rate divided by CPU% - throughput per cpu load

Sequential Reads reiserfs had the biggest drop in throughput.

               Num                    Avg       Maximum     Lat%     Lat%  CPU
Kernel         Thr   Rate  (CPU%)   Latency     Latency      >2s     >10s  Eff
-------------  ---  ----------------------------------------------------------
2.4.20-pre1      1   35.11 23.02%     0.331      107.07  0.00000  0.00000  152
2.4.20-pre2      1   34.68 22.83%     0.335      119.57  0.00000  0.00000  152

2.4.20-pre1     32   27.27 20.12%    11.536   258436.68  0.01275  0.01135  136
2.4.20-pre2     32    8.00  6.05%    43.881     7568.44  0.00096  0.00000  132

2.4.20-pre1     64   26.50 19.63%    21.328   361756.08  0.02183  0.02053  135
2.4.20-pre2     64    8.42  6.46%    79.039    15721.84  0.18813  0.00000  130

2.4.20-pre1    128   27.72 21.17%    35.485   814716.92  0.02671  0.02549  131
2.4.20-pre2    128    9.30  7.10%   135.056    32520.09  3.92532  0.00035  131

2.4.20-pre1    256   26.55 19.95%    68.425   825224.03  0.04636  0.04515  133
2.4.20-pre2    256    8.47  6.49%   285.430    62013.50  4.68931  0.11676  131

Random Reads reiserfs went down when there is more than 1 thread.

               Num                    Avg       Maximum     Lat%     Lat%  CPU
Kernel         Thr   Rate  (CPU%)   Latency     Latency      >2s     >10s  Eff
-------------  ---  ----------------------------------------------------------
2.4.20-pre1      1    0.68  0.84%    17.320       51.54  0.00000  0.00000   81
2.4.20-pre2      1    0.70  0.76%    16.787       53.99  0.00000  0.00000   92

2.4.20-pre1     32    3.09  6.80%   102.783      535.46  0.00000  0.00000   46
2.4.20-pre2     32    1.98  3.84%   147.780    16015.44  0.55000  0.00000   52

2.4.20-pre1     64    3.10  5.99%   178.641    10722.38  0.50403  0.00000   52
2.4.20-pre2     64    2.18  3.70%   229.511    16850.53  2.77218  0.00000   59

2.4.20-pre1    128    3.35  5.27%   226.876     9018.16  1.91532  0.00000   64
2.4.20-pre2    128    2.31  3.98%   378.511    17932.69  5.77117  0.00000   58

2.4.20-pre1    256    3.26  6.44%   249.264     5751.33  0.57292  0.00000   51
2.4.20-pre2    256    2.20  5.53%   724.340    19268.40 13.09896  0.00000   40

Sequential Writes reiserfs cpu utilization went down, but throughput dropped.

               Num                    Avg       Maximum     Lat%     Lat%  CPU
Kernel         Thr   Rate  (CPU%)   Latency     Latency      >2s     >10s  Eff
-------------  ---  ----------------------------------------------------------
2.4.20-pre1      1   39.31 71.71%     0.282     6301.59  0.00012  0.00000   55
2.4.20-pre2      1   38.28 73.39%     0.290     8058.03  0.00019  0.00000   52

2.4.20-pre1     32   29.64 119.5%    11.171    16619.06  0.18094  0.00000   25
2.4.20-pre2     32   23.52 103.0%    10.242    17721.55  0.13629  0.00000   23

2.4.20-pre1     64   29.02 115.6%    22.065    38792.62  0.38675  0.00426   25
2.4.20-pre2     64   20.92 84.06%    19.449    41273.31  0.33824  0.00480   25

2.4.20-pre1    128   31.52 111.6%    36.264   104743.20  0.40728  0.11428   28
2.4.20-pre2    128   22.31 87.18%    36.251    78916.66  0.46791  0.10154   26

2.4.20-pre1    256   28.95 132.7%    75.959   163159.61  0.79301  0.24067   22
2.4.20-pre2    256   20.08 93.50%    74.113   114883.50  0.83399  0.23864   21

Random Writes reiserfs - slightly improved.
               Num                    Avg       Maximum     Lat%     Lat%  CPU
Kernel         Thr   Rate  (CPU%)   Latency     Latency      >2s     >10s  Eff
-------------  ---  ----------------------------------------------------------
2.4.20-pre1      1    3.57  3.80%     0.091        0.57  0.00000  0.00000   94
2.4.20-pre2      1    3.63  3.79%     0.089        0.68  0.00000  0.00000   96

2.4.20-pre1     32    3.52  9.15%     0.654      268.43  0.00000  0.00000   38
2.4.20-pre2     32    3.57  8.15%     0.377      258.42  0.00000  0.00000   44

2.4.20-pre1     64    3.68  9.50%     0.567      196.77  0.00000  0.00000   39
2.4.20-pre2     64    3.78  9.76%     0.450      319.24  0.00000  0.00000   39

2.4.20-pre1    128    3.48  8.38%     2.923      626.60  0.00000  0.00000   42
2.4.20-pre2    128    3.54  8.98%     0.669      735.87  0.00000  0.00000   39

2.4.20-pre1    256    3.45  9.11%     3.416      572.87  0.00000  0.00000   38
2.4.20-pre2    256    3.59 10.12%     1.350      824.15  0.00000  0.00000   35

Bonnie++ did not have these regressions, but I run that as a single thread.

More on the tests at:
http://home.earthlink.net/~rwhron/kernel/bigbox.html
-- 
Randy Hron

