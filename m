From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: speedup patch for 2.4.19-pre6
Date: Thu, 11 Apr 2002 23:49:44 +0200
Message-ID: <200204112349.44268.Dieter.Nuetzel@hamburg.de>
References: <200204112344.41906.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10050-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200204112344.41906.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Oleg Drokin <green@namesys.com>
Cc: Chris Mason <mason@suse.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thursday 11 April 2002 :44, Dieter N=FCtzel wrote:

> My slow IBM DDRS-34560D disk.
> SunWave1 /home/nuetzel# hdparm -tT /dev/sdb5

Ups, dbench 32 was the test prog.

> /dev/sdb5:
>  Timing buffer-cache reads:   128 MB in  0.76 seconds =3D168.42 MB/sec
>  Timing buffered disk reads:  64 MB in  5.48 seconds =3D 11.68 MB/sec
>
> mount		Throughput
> -			28.8716 MB/sec (NB=3D36.0895 MB/sec  288.716 MBit/sec)
> 			13.850u 56.380s 2:27.31 47.6%   0+0k 0+0io 938pf+0w
>
> notail		30.2834 MB/sec (NB=3D37.8543 MB/sec  302.834 MBit/sec)
> 			14.600u 53.660s 2:20.50 48.5%   0+0k 0+0io 938pf+0w
>
> iicache		30.9775 MB/sec (NB=3D38.7219 MB/sec  309.775 MBit/sec)
> 			14.320u 52.970s 2:17.37 48.9%   0+0k 0+0io 938pf+0w
>
> iicache,notail	31.6363 MB/sec (NB=3D39.5453 MB/sec  316.363 MBit/sec)
> 			14.340u 50.040s 2:14.53 47.8%   0+0k 0+0io 938pf+0w

-Dieter
