From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: [PATCH] updated 2.6 reiserfsv3 patch set
Date: Fri, 5 Mar 2004 01:05:27 +0100
Message-ID: <200403050105.28086.Dieter.Nuetzel@hamburg.de>
References: <1078364753.3928.188.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17083-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1078364753.3928.188.camel@watt.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>

Am Donnerstag, 4. M=E4rz 2004 02:45 schrieb Chris Mason:
> Hello everyone,
>
> ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6.3
>
> Has updated patches for reiserfs v3.  New in this set:
>
> reiserfs-lock-lat-2 -- updated to give better latencies during a delete
> reiserfs-search-restart-2 -- better schedule detection
> reiserfs-write-sched-bug -- schedule detection fix
> reiserfs-jh-5 -- shouldn't hang during lilo anymore
>
> The lilo fix for reiserfs-jh-5 is below as an incremental.

Up and running. ;-)

Linux version 2.6.3-16-smp-DN (geeko@buildhost) (gcc version 3.3.1 (SuSE=20
Linux)) #1 SMP Fri Mar 5 00:30:35 CET 2004

time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G count=3D1
1+0 Records ein
1+0 Records aus
0.000u 2.802s 0:04.24 66.0%     0+0k 0+0io 0pf+0w

insgesamt 288711
drwxrwxr-x    5 root     root          200 2004-03-05 01:00 .
drwxr-xr-x    3 root     root           72 2004-01-12 13:53 ..
drwxr-xr-x    2 nuetzel  users         856 2003-12-27 14:51 bench
drwxr-xr-x    3 nuetzel  users          72 2003-09-07 20:37 dri-trunk
=2Drw-r--r--    1 nuetzel  users    214748364801 2004-03-05 01:00 sparse
=2Dr--r--r--    1 root     root     295631743 2004-02-27 01:42=20
SPECViewperf7.1.1.tar.gz
drwxr-xr-x   15 nuetzel  users         392 2004-01-17 04:24 viewperf-6.1.2

time rm sparse
0.000u 7.713s 0:21.52 35.8%     0+0k 0+0io 0pf+0w

Mouse is _smooth_ now but 'rm' takes longer.

top
  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  WCHAN     COMM=
AND
12786 nuetzel   18   0  1772  540 1620 D 37.8  0.1   0:02.28 io_schedu rm

Cheers,
	Dieter
