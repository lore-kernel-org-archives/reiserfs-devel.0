From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: new v3 2.6.4  logging/xattr patches
Date: Mon, 22 Mar 2004 14:41:37 +0100
Message-ID: <200403221441.37876.Dieter.Nuetzel@hamburg.de>
References: <1079679539.11055.101.camel@watt.suse.com> <200403212022.38572.Dieter.Nuetzel@hamburg.de> <200403212026.07877.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17376-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403212026.07877.Dieter.Nuetzel@hamburg.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>

Am Sonntag, 21. M=E4rz 2004 20:26 schrieb Dieter N=FCtzel:
> Am Sonntag, 21. M=E4rz 2004 20:22 schrieb Dieter N=FCtzel:
> > Am Sonntag, 21. M=E4rz 2004 17:55 schrieben Sie:
> > > On Sun, 2004-03-21 at 11:44, Dieter N=FCtzel wrote:
> > > > > The suse kernel of the day ;-)  My experimental directory is a du=
mp
> > > > > of all the suse reiserfs patches.
> > > >
> > > > kernel-source-2.6.4-9.19.i586		(18.03.2004)
> > > >
> > > > or
> > > >
> > > > kernel-source-2.6.4-13.2.i586		(20.03.2004)
> >
> > Works out of the box.
> > Only Bootsplash is missing.
>
> Argh, "K3b" isn't working, again.
> All SCSI (DVD, CD-RW, etc.).

"Latest" SuSE 9.0 Kernel
kernel-source-2.6.4-13.12.i586	(21.03.2004)

Linux version 2.6.4-13.12-smp (geeko@buildhost) (gcc-Version 3.3.1 (SuSE=20
Linux)) #1 SMP Mon Mar 22 14:19:29 CET 2004

Is very GOOD in all above aspects. ;-)

dual Athlon MP 1900+
1 GB DDR266, CL2 (2x 512 MB)
=46ujitsu MAS3184NP, 15k RPM


Software RAID1

SunWave1 share/dbench# free -t
             total       used       free     shared    buffers     cached
Mem:       1036680     405904     630776          0      53880     137472
=2D/+ buffers/cache:     214552     822128
Swap:      2103288          0    2103288
Total:     3139968     405904    2734064

SunWave1 share/dbench# time dbench 32
32 clients started

Throughput 118.808 MB/sec (NB=3D148.51 MB/sec  1188.08 MBit/sec)  32 procs
8.250u 35.218s 0:35.55 122.2%   0+0k 0+0io 0pf+0w

SunWave1 share/dbench# free -t
             total       used       free     shared    buffers     cached
Mem:       1036680     594592     442088          0      52348      96232
=2D/+ buffers/cache:     446012     590668
Swap:      2103288          0    2103288
Total:     3139968     594592    2545376

Max load was ~15.

=2D------------------------------------------------------------------------=
=2D------------------------
Second run:

Throughput 131.63 MB/sec (NB=3D164.537 MB/sec  1316.3 MBit/sec)  32 procs
8.347u 36.151s 0:32.09 138.6%   0+0k 0+0io 0pf+0w

SunWave1 share/dbench# free -t
             total       used       free     shared    buffers     cached
Mem:       1036680     661580     375100          0      49748      72040
=2D/+ buffers/cache:     539792     496888
Swap:      2103288          0    2103288
Total:     3139968     661580    2478388

Max load was ~18.

***************************************************************************=
***********************

Software RAID0

SunWave1 SOURCE/dbench# free -t
             total       used       free     shared    buffers     cached
Mem:       1036680     665544     371136          0      51852      76056
=2D/+ buffers/cache:     537636     499044
Swap:      2103288          0    2103288
Total:     3139968     665544    2474424

SunWave1 SOURCE/dbench# time dbench 32

Throughput 190.978 MB/sec (NB=3D238.723 MB/sec  1909.78 MBit/sec)  32 procs
8.204u 32.067s 0:22.12 182.0%   0+0k 0+0io 0pf+0w

SunWave1 SOURCE/dbench# free -t
             total       used       free     shared    buffers     cached
Mem:       1036680     437108     599572          0      59028      71192
=2D/+ buffers/cache:     306888     729792
Swap:      2103288          0    2103288
Total:     3139968     437108    2702860

Max load was ~9.

=2D------------------------------------------------------------------------=
=2D------------------------

SunWave1 SOURCE/dbench# free -t
             total       used       free     shared    buffers     cached
Mem:       1036680     437280     599400          0      59460      71032
=2D/+ buffers/cache:     306788     729892
Swap:      2103288          0    2103288
Total:     3139968     437280    2702688
SunWave1 SOURCE/dbench# time dbench 32

Throughput 184.295 MB/sec (NB=3D230.369 MB/sec  1842.95 MBit/sec)  32 procs
8.115u 32.166s 0:22.92 175.6%   0+0k 0+0io 0pf+0w

SunWave1 SOURCE/dbench# free -t
             total       used       free     shared    buffers     cached
Mem:       1036680     523316     513364          0      78532      67260
=2D/+ buffers/cache:     377524     659156
Swap:      2103288          0    2103288
Total:     3139968     523316    2616652

Max load was ~10.


Greetings,
	Dieter
