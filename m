From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: speedup patch for 2.4.19-pre6
Date: Thu, 11 Apr 2002 23:44:41 +0200
Message-ID: <200204112344.41906.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10049-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Chris Mason <mason@suse.com>, ReiserFS List <reiserfs-list@namesys.com>

> Hello!
>
>   attached the combined speedup patch for 2.4.19-pre6

I combined them all together...:-)

Kernel 2.4.19-pre5-vm33-rml

2.4.19-pre5
00_k7-prefetch-1
01-broken-readahead-1			(IDE)
02-vm-io-3
10-x86-fast-pte-1
11-spinlock-cacheline-3
25-read-latency-2
vm-33
preempt-kernel-rml-2.4.19-pre5-2
lock-break-rml-2.4.18-1			(latest, applies)
page_color-2.4.18-20020323.patch	(cache page coloring)
linux-2.4.19p5-iicache-new-11.patch
speedup-2.4.19-pre6.diff			(yes, pre6 works)


My slow IBM DDRS-34560D disk.
SunWave1 /home/nuetzel# hdparm -tT /dev/sdb5

/dev/sdb5:
 Timing buffer-cache reads:   128 MB in  0.76 seconds =168.42 MB/sec
 Timing buffered disk reads:  64 MB in  5.48 seconds = 11.68 MB/sec

mount		Throughput
-			28.8716 MB/sec (NB=36.0895 MB/sec  288.716 MBit/sec)
			13.850u 56.380s 2:27.31 47.6%   0+0k 0+0io 938pf+0w

notail		30.2834 MB/sec (NB=37.8543 MB/sec  302.834 MBit/sec)
			14.600u 53.660s 2:20.50 48.5%   0+0k 0+0io 938pf+0w

iicache		30.9775 MB/sec (NB=38.7219 MB/sec  309.775 MBit/sec)
			14.320u 52.970s 2:17.37 48.9%   0+0k 0+0io 938pf+0w

iicache,notail	31.6363 MB/sec (NB=39.5453 MB/sec  316.363 MBit/sec)
			14.340u 50.040s 2:14.53 47.8%   0+0k 0+0io 938pf+0w

!!! One problem !!!

When / is mounted with iicache + whatever then /etc/cups/ppds.dat is not
accessable?

/home/nuetzel> l /etc/cups/ppds.dat
-rw-r--r--    1 root     root       614016 Apr 11 02:23 /etc/cups/ppds.dat

The faster IBM DDYS-T18350N show hardly any difference.
Should I test "huge" block loads? SO loading for example?

Regards,
	Dieter
