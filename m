From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Thu, 29 Jun 2006 23:12:35 +0400
Message-ID: <1151608355.6335.79.camel@tribesman.namesys.com>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28852-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1151602916.32453.40.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Benoit <ipso@snappymail.ca>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2006-06-29 at 10:41 -0700, Mike Benoit wrote:
> My MythTV box recently started showing odd behavior during recordings,
> at certain times the load of the box would spike to 10+ and recordings
> would start losing frames and become unwatchable. TOP would show
> mythbackend as using 90+% SYS CPU usage, which under normal
> circumstances it normally uses about 5% USR.
> 
> So I finally got around to profiling mythbackend when the load starts to
> spike. To my surprise it appears that once I have less then 10% (30GB)
> free on the drive reiserfs can't up, even just writing at 1mb/sec is too
> much for it. 
> 
> Is there something that can be done to fix this, 30gb seems like a lot
> of wasted space. 
> 
> #opreport
> CPU: CPU with timer interrupt, speed 0 MHz (estimated)
> Profiling through timer interrupt
>           TIMER:0|
>   samples|      %|
> ------------------
>     77863 78.7856 reiserfs
>     18183 18.3984 vmlinux
>       695  0.7032 mysqld
>       452  0.4574 libc-2.4.so
>       360  0.3643 libmythtv-0.19.so.0.19.0
>       324  0.3278 ivtv
>       323  0.3268 nvidia
>       242  0.2449 libqt-mt.so.3.3.6
>       110  0.1113 libpthread-2.4.so
>        53  0.0536 libstdc++.so.6.0.8
>        35  0.0354 ld-2.4.so
>        23  0.0233 libperl.so
>        22  0.0223 libz.so.1.2.3
> <snip>
> 
> #opreport -l /usr/src/linux/vmlinux
> CPU: CPU with timer interrupt, speed 0 MHz (estimated)
> Profiling through timer interrupt
> samples  %        symbol name
> 9607     52.8351  default_idle
> 7694     42.3142  find_next_zero_bit

It looks like the problem is high fragmentation of free space.
find_next_zero_bit is a function which is used to scan bitmaps in order
to find blocks for allocation.

> 183       1.0064  __copy_from_user_ll
> 57        0.3135  handle_IRQ_event
> 37        0.2035  __copy_to_user_ll
> 34        0.1870  ide_outb
> 30        0.1650  ide_end_request
> 22        0.1210  ioread8
> 22        0.1210  schedule
> 21        0.1155  get_page_from_freelist
> 17        0.0935  mmx_clear_page
> <snip>
> 
> System Details:
> -----------------------------------------------
> Kernel v2.6.16.21 (custom compiled)
> - This issue also happened with 2.6.14 too though.
> 
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/hda1             280G  269G   12G  97% /
> 
> [root@mythtv]# cat /proc/mounts
> rootfs / rootfs rw 0 0
> /dev /dev tmpfs rw 0 0
> /dev/root / reiserfs rw,noatime,nodiratime 0 0
> 
> [root@mythtv]# cat /proc/cpuinfo
> processor       : 0
> vendor_id       : AuthenticAMD
> cpu family      : 6
> model           : 6
> model name      : AMD Athlon(tm) XP 2100+
> stepping        : 2
> cpu MHz         : 1759.680
> cache size      : 256 KB
> 
> [root@mythtv]# free
>              total       used       free     shared    buffers
> cached
> Mem:        515992     496256      19736          0      36256
> 271728
> -/+ buffers/cache:     188272     327720
> Swap:       262136        408     261728
> 
> [root@mythtv ~]# hdparm -i /dev/hda
> /dev/hda:
>  Model=ST3300622A, FwRev=3.AND, SerialNo=3NF1GAGW
>  Config={ HardSect NotMFM HdSw>15uSec Fixed DTR>10Mbs RotSpdTol>.5% }
>  RawCHS=16383/16/63, TrkSize=0, SectSize=0, ECCbytes=4
>  BuffType=unknown, BuffSize=16384kB, MaxMultSect=16, MultSect=16
>  CurCHS=4047/16/255, CurSects=16511760, LBA=yes, LBAsects=268435455
>  IORDY=on/off, tPIO={min:240,w/IORDY:120}, tDMA={min:120,rec:120}
>  PIO modes:  pio0 pio1 pio2 pio3 pio4
>  DMA modes:  mdma0 mdma1 mdma2
>  UDMA modes: udma0 udma1 udma2 udma3 udma4 *udma5
>  AdvancedPM=no WriteCache=enabled
>  Drive conforms to: Unspecified:  ATA/ATAPI-1 ATA/ATAPI-2 ATA/ATAPI-3
> ATA/ATAPI-4 ATA/ATAPI-5 ATA/ATAPI-6 ATA/ATAPI-7
>  * signifies the current active mode
> 
> [root@mythtv ~]# hdparm -tT /dev/hda
> /dev/hda:
>  Timing cached reads:   1296 MB in  2.00 seconds = 646.99 MB/sec
>  Timing buffered disk reads:  166 MB in  3.02 seconds =  55.05 MB/sec
> 
> vmstat 1 output:
> --------------------------------------------------------------
> 
> procs -----------memory---------- ---swap-- -----io---- --system--
> ----cpu----
>  r  b   swpd   free   buff  cache   si   so    bi    bo   in    cs us sy
> id wa
>  8  0    408   5800  29308 248604    0    0     0  1036  406   132  2 98
> 0  0
>  4  0    408   5644  29396 248608    0    0     0  1128  437   184  2 92
> 0  6
>  7  0    408   6316  29428 248020    0    0     0  1316  539   287  0 86
> 0 14
>  5  0    408   6104  29480 248180    0    0     0   588  415   187  0 99
> 0  1
>  4  0    408   5764  29536 248364    0    0     0  1092  421   172  2 97
> 1  0
>  6  0    408   6528  29592 247684    0    0     0  1092  425   161  2 98
> 0  1
>  2  1    408   6372  29676 247724    0    0     0  2304  385   170  2 97
> 1  0
>  5  0    408   6400  29676 247616    0    0     0    48  383   122  0
> 100  0  0
>  7  0    408   6192  29704 247872    0    0     0  1080  409   162  1 98
> 0  1
>  6  0    408   5720  29732 248304    0    0     0  1076  414   178  1 98
> 0  1
>  7  0    408   6348  29800 247552    0    0     0  1656  460   300  2 87
> 1 11
>  5  0    408   6628  29848 247248    0    0     0  1164  407   207  1 94
> 0  5
>  5  0    408   5884  29896 247996    0    0     4  1116  453   353  1 76
> 0 23
>  6  0    408   5640  29868 248204    0    0     0  1052  416   132  1 99
> 0  0
>  4  0    408   5772  29940 248104    0    0     0   648  490   314  1 84
> 1 14
>  6  1    408   6328  30036 247464    0    0     0  1928  488   305  2 85
> 0 13
>  4  0    408   6184  30076 247472    0    0     4   860  404   201  1 94
> 0  5
>  4  0    408   6332  30044 247328    0    0     0  1312  429   156  1 99
> 0  0
>  9  0    408   6120  30100 247580    0    0     0   604  494   305  3 81
> 1 16
>  2  1    408   6460  30140 247116    0    0     0  1372  436   315  1 79
> 0 20
> 10  0    408   6252  30176 247372    0    0     0   456  412   126  1 99
> 0  0
>  6  0    408   6432  30164 247276    0    0     4  1268  425   255  1 88
> 1 10
>  3  0    408   5688  30220 247948    0    0     0  1332  454   352  0 78
> 0 22
>  2  1    408   6352  30284 247124    0    0     0  1140  362   156  2 96
> 1  1
>  5  0    408   6564  30284 246908    0    0     0    92  472   316  2 83
> 0 15
>  5  0    408   6348  30352 247056    0    0     0  1168  506   350  0 83
> 0 17
>  4  0    408   5604  30404 247828    0    0     4  1124  448   262  2 87
> 0 11
>  3  0    408   5880  30444 247500    0    0     0  1104  426   315  2 77
> 1 20
>  2  1    408   5916  30496 247352    0    0     0  1064  365   152  1 97
> 0  2
>  7  0    408   6072  30496 247204    0    0     0   440  489   307  1 82
> 0 17
>  6  0    408   5936  30528 247288    0    0     0   816  434   130  2 98
> 0  0
>  4  0    408   5944  30588 247300    0    0     0  1108  359   172  0 98
> 0  2
>  4  0    408   5664  30624 247508    0    0     0  1444  426   161  0 99
> 1  0
>  5  0    408   6656  30608 246572    0    0     0  1220  425   163  2 98
> 0  1
>  6  0    408   6316  30656 246848    0    0     0  1552  441   180  1 98
> 0  1
>  4  0    408   6408  30632 246776    0    0     0   644  403   140  1 99
> 0  0
>  9  0    408   6072  30696 247060    0    0     4   744  496   351  2 82
> 1 16
>  5  0    408   5864  30708 247240    0    0     0  1680  509   335  1 83
> 1 15
> procs -----------memory---------- ---swap-- -----io---- --system--
> ----cpu----
>  r  b   swpd   free   buff  cache   si   so    bi    bo   in    cs us sy
> id wa
>  3  1    408   6284  30768 246768    0    0     0  1132  434   328  1 76
> 1 22
>  6  0    408   6352  30772 246692    0    0     0   576  373   170  0 93
> 0  7
>  4  0    408   6008  30820 246932    0    0     4   612  496   322  1 83
> 0 16
>  4  0    408   6288  30836 246600    0    0     0  1484  480   304  1 85
> 0 14
>  4  0    408   6064  30896 246844    0    0     0  1136  504   337  1 84
> 1 15
>  5  0    408   5728  30900 247116    0    0     4  1188  426   156  1 99
> 0  0
>  6  0    408   5696  30968 247144    0    0     0  1104  367   123  3 97
> 0  0
>  4  0    408   5608  31016 247144    0    0     0  1152  445   378  2 74
> 1 23
>  7  0    408   5576  31008 247088    0    0     0   964  402   115  1 99
> 0  0
>  4  0    408   6328  31052 246396    0    0     0   628  355   152  1 98
> 0  1
>  5  0    408   6116  31112 246524    0    0     0  1620  472   299  2 85
> 1 12
>  2  1    408   6336  31204 246176    0    0     0  1112  367   156  2 96
> 0  2
>  7  0    408   6388  31176 246192    0    0     0    76  457   272  0 86
> 0 14
>  5  0    408   6268  31232 246284    0    0     0  1136  466   267  1 85
> 1 13
>  2  1    408   5932  31304 246616    0    0     4  2068  374   173  1 99
> 0  0
>  6  0    408   5960  31224 246564    0    0     0   104  472   273  1 84
> 0 15
>  6  0    408   5692  31308 246716    0    0     0  1160  412   206  2 94
> 0  4
>  5  0    408   5600  31336 246892    0    0     4  1660  480   289  2 86
> 0 12
>  7  0    408   6400  31336 245964    0    0     0  1052  418   160  3 97
> 0  0
>  6  0    408   6316  31292 246136    0    0     0   512  432   127  1 99
> 0  0
>  5  0    408   5856  31372 246528    0    0     0  1824  404   159  2 96
> 0  2
>  3  0    408   5880  31424 246412    0    0     0  1156  454   174  1 97
> 1  1
>  3  0    408   6024  31372 246336    0    0     0   896  399   130  0
> 100  0  0
>  5  0    408   5812  31432 246492    0    0     0   708  413   160  1 97
> 0  2
>  5  0    408   6396  31424 246024    0    0     0  1604  436   163  1 97
> 1  1
>  6  1    408   6276  31492 245924    0    0   216  1176  511   409  3 82
> 0 15
>  4  0    408   6312  31528 245944    0    0     0  1116  468   263  1 86
> 0 13
>  1  2    408   6592  31576 245628    0    0    56  1044  343   126  0 97
> 0  3
>  5  0    408   6312  31576 245904    0    0    32    48  427   155  0 97
> 0  3
>  1  0    408   5816  31624 246360    0    0    72  1796  590   834  2 40
> 35 24
>  1  1    408  16872  31704 247564    0    0  1232   248  513  1185 28  4
> 11 57
>  1  1    408  31240  31768 248520    0    0   932    92  403   996 32  4
> 10 54
>  1  0    408  29576  31880 248704    0    0   188   248  372   997  7  6
> 61 26
>  1  1    408  28284  31952 249852    0    0   316   344  402   842 20 21
> 45 13
>  0  1    408  27188  32008 250940    0    0   112   976  393   465 33 58
> 0  9
>  5  1    408  24748  32100 253228    0    0  1212  1424  571   949 31 31
> 0 37
>  2  0    408  23052  32156 255032    0    0   544  1036  415   351 16 80
> 0  4
>  0  1    408  21148  32232 256808    0    0   516  1480  454   692 33 41
> 0 25
> procs -----------memory---------- ---swap-- -----io---- --system--
> ----cpu----
>  r  b   swpd   free   buff  cache   si   so    bi    bo   in    cs us sy
> id wa
>  2  1    408  19616  32288 258308    0    0   576  1352  414   478 33 59
> 0  8
>  4  0    408  18084  32348 259816    0    0   496  1344  423   524 29 56
> 0 15
>  5  0    408  17016  32428 260844    0    0   192   812  518   574 24 63
> 0 13
>  2  0    408  15348  32488 262444    0    0   208  1064  416   295 14 85
> 0  1
>  5  0    408  13616  32552 264104    0    0    84  1684  497   615 32 66
> 0  2
>  5  1    408  13496  32612 263992    0    0    92  1148  530   526 14 71
> 0 14
>  0  1    408  13000  32784 264556    0    0    80  1240  506   504  1 59
> 0 40
>  3  1    408  12132  32864 265324    0    0    36   612  431   438  2 65
> 0 34
>  1  1    408  10196  33048 266960    0    0   216     4  440   565  1 60
> 0 39
>  1  1    408   9252  33284 267768    0    0   168  2444  463   617  1 56
> 0 43
>  0  3    408   7208  33376 269680    0    0    32  3460  459   497  1 59
> 0 40
>  2  1    408   6416  33444 270392    0    0    24   748  448   423  0 71
> 0 29
>  0  1    408   5976  33664 270568    0    0   220  1436  481   654  2 55
> 0 43
>  1  0    408   6100  33700 270356    0    0     8   844  406   389  9 70
> 16  5
>  0  0    408   5848  33732 270568    0    0     0  1128  435   401  0 72
> 27  1
>  1  0    408   5720  33772 270664    0    0     0   852  398   350  1 73
> 25  1
>  1  0    408   6100  33780 270320    0    0     0  1216  446   522  0 54
> 45  1
>  3  0    408   5736  33780 270644    0    0     0  1092  475   736  0 32
> 67  1
>  1  0    408   6372  33952 269720    0    0     0  1040  462   522  4 69
> 26  1
>  2  0    408   6436  33944 269592    0    0     0   864  433   287  0 83
> 16  1
>  0  0    408   5848  34024 270140    0    0     4  1232  480   701  3 39
> 53  5
>  2  0    408   9196  33936 266612    0    0   104   212  596  1035 10 43
> 40  8
>  3  0    408   8824  33936 267380    0    0     0   512  388    90  0
> 100  0  0
>  4  0    408   7956  33968 268148    0    0     0   548  400   114  1 98
> 0  1
>  2  0    408   6492  34000 269604    0    0     0   892  432   629  0 38
> 61  1
>  2  0    408   6416  34084 269648    0    0     0  1712  403   591  0 40
> 58  2
>  5  0    408   6612  34120 269376    0    0     0   844  447   557  1 49
> 49  1
>  4  0    408   6424  34148 269548    0    0     0   880  465   493  0 65
> 35  0
>  1  0    408   6336  34196 269596    0    0     0  1112  475   552  3 59
> 36  2
>  4  1    408   6304  34340 269404    0    0     0  1668  378   316  0 78
> 22  0
>  3  0    408   6096  34368 269608    0    0     0   308  411   625  1 38
> 59  2
>  3  0    408   6268  34412 269372    0    0     0  1148  398   583  0 39
> 60  1
>  5  0    408   6400  34444 269264    0    0     0   824  431   414  0 67
> 33  0
> 

