From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: One more result on speedup-patch 2.4.19-pre5
Date: Tue, 16 Apr 2002 02:14:42 +0200
Message-ID: <3CBB6CF2.4050307@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010703030408050707010906"
Return-path: <reiserfs-list-return-10073-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

--------------010703030408050707010906
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleg and others!

I'm referring to Olegs speedup patch for 2.4.19-pre5+ - oh maybe it was 
a modified one for -pre6 (not to Chris' more actual version). In the 
attachment there are some beautified results on my backup cycle.

The new file size distribution statistics according to the alteration to 
the first known one are available upon request, Oleg, but the rate 
differences are really similar, so I assume you won't need them.

I removed the iicache patches.

I found these values very nice!

Bye,

Manuel


--------------010703030408050707010906
Content-Type: text/plain;
 name="backup-comparison-020412.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="backup-comparison-020412.txt"

1st partition: 1958788 kB (system) notail:
------------------------------------------
 real     5m16.853s user    0m1.660s sys     0m53.090s
           6.037MB/s
 
1st partition: 1951092 kB = 77% of part. notail + speedup:
----------------------------------------------------------
 real     4m27.137s user    0m1.490s sys     0m51.860s
           7,133MB/s => +18%
  
2nd partition: 4085252 kB (archives) notail:
--------------------------------------------
 real    11m3.024s  user    0m1.460s sys     1m26.780s
           6.017MB/s
 
2nd partition: 4179504 kB = 76% of part. notail + speedup:
----------------------------------------------------------
 real     9m28.626s user    0m1.850s sys     1m27.220s
            7.178MB/s => +19%


Data: 
-----
Previously fresh backupped/copied partitions (shown are copy-back-times 
"without fragmentation"). Mount options "-o noatime,notail"

Settings: 
--------
AA VM and AKPM max_bomb_segments settings same as in my first private 
mails, see information below, only disk content "slightly" differing. 

Kernel: 
-------
Still Kernel 2.4.19-pre5, aa.vm-33 + some other aa.patches, 
akpm.read-latency-2 applied, some standard kernel values are altered 
with powertweak-0.99.4.

Hardware: 
---------
933MHz-PIII-noname/Clevo.tw-notebook, one of the partitions' 
counterparts only ide1-tree udma(33), first one ide-0 udma(66), 
512MB RAM.

Circumstances:
--------------
Only KDE 2.2.1 running (untouched) additionally. 

No new bitmap allocator, yet.

CONFIG_REISERFS_PROC_INFO enabled.

That latest backup copies consume about 20..30% (varying) CPU. dd...s take
about 22%, ksysguard approx. values



--------------010703030408050707010906--

