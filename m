From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: What Filesystem?
Date: Wed, 29 Jan 2003 20:31:15 +0100
Message-ID: <200301292031.15306.Dieter.Nuetzel@hamburg.de>
References: <3E38378A.8030406@jtmstudio.fsbusiness.co.uk> <200301300458.59629.sam@vilain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12547-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200301300458.59629.sam@vilain.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sam Vilain <sam@vilain.net>, james@jtmstudio.fsbusiness.co.uk, reiserfs-list@namesys.com

Am Mittwoch, 29. Januar 2003 16:58 schrieb Sam Vilain:
> Reiserfs is probably not what you want for doing lots of high volume data.
> Reiserfs is good with many small files and general purpose use.  It is
> actually the slowest filesystem for bulk data.

To general ;-)

> I'm sure some smartass will probably post some benchmark to prove me wron=
g,
> but SGI have a long heritage of making filesystems for exactly what you
> want and so if XFS works I'd say use that.  It's pumpin'.  Of course more
> quantitative comparisons can easily be found on the linux-kernel mailing
> list.

No. View the ext2/3, Reiser, FS mailing lists.
XFS was designed for granted video/audio bandwidth in the first place.
Latest ReiserFS 3.x patches catches up and Reiser4 will do some/better.

> However, the practical difference between the high performance filesystems
> you mentioned, or the difference between running pre-empt or not should be
> considered marginal compared to other factors

You have to split this into two sentences.

"High performance filesystems" and low kernel response (low latency and=20
pre-emption).

You will have all three together I "swear";-)
Everyone who haven't tested a "multi media"/VIS workstation (3D OpenGL/Mesa=
=20
(DRI) graphics) without pre-emption and low latency should try.

> - such as, the load that
> your hard disk controller places on the system and the number of physical
> disks you have (and how many RPM they run at).  Keep in mind that you can
> often nearly double the data throughput of a system by doubling the number
> of physical disks in it, and using RAID.

Yes. Hard or SoftRAID as you like.

> Even with the latest UDMA-133, I haven't seen any IDE system actually
> perform without bothering the CPU non-trivially (of course YMMV).  Using
> SCSI disks and controllers will give you a smoother system ride; which is
> why 95% of high-end workstations come equipped with SCSI.  You can get
> 15,000 RPM U320 SCSI disks, which are f*** fast (though loud).  This is
> largely because the SCSI protocol was designed properly, IDE/ATA is a
> hack.  Serial-ATA promises to offer SCSI like host efficiency, but I'll
> only believe it when I see it.  And at the moment the costs are as bad as
> SCSI anyway.

Very true.
But ATA-RAID (SoftRAID) together with LVM/LVM2/EVMS is OK.

> Of course, being able to move around large chunks of data quickly extends
> to other parts of the system, too.  The bigger and faster the system BUS,
> the better.  Having `researched hardware platforms' you should know this,
> of course.  As far as Athlon Motherboards go, Tyan are a reputable vendor
> who used to produce Sun clone motherboards - they have a really nice dual
> capable system with dual U160 SCSI controllers and 66MHz PCI slots - which
> must mean that the SCSI controllers run at that speed.  It's definitely
> worth the ~$500 price tag.  They all pale in comparison to R10000+ based
> SGI or Sparc 9+ platforms of course.

All AMD 768MPX dual motherboards have 2 PCI64/66 slots.

Running a MSI K7D Master-L, (aka MS-6501, Rev 1.0, AMD 768MPX), dual Athlon=
 MP=20
1900+, 1 GB DDR-SDRAM 266 CL2 (2x 512 MB), Radeon 8500 (DRI CVS), 10k U160=
=20
system, here.

> From a graphic artist's perspective, you're probably better off buying a
> new G4 based system and running MacOS X, you know :-).

If you already have the software for Mac, yes. But if you will/have to buy =
it=20
then you can go fine with Linux. See all the good "Hollywood" reports.

> Linux isn't exactly `The Platform' for digital content creation.

To general.
Some apps are missing, but it catches up very fast.
Even with low lateny and pre-emption. With Linux 2.6 still around it _is_=20
predestinated for this stuff

> The Mac's CPU and hardware platform are a lot better at moving data aroun=
d,

In short: NO.

You have much more hardware alternatives with Linux.
Consider the brand new AMD Hammer waiting for launch.

> and if you've got a Mac then you can run Mac OS X, or Linux + Mac OS
> inside an emulator (which runs FAST!).

Yes. But fast? ;-)
Most Linux binary apps are made for x86 systems.

> As a final note, keep in mind that a filesystem reformat does not mean a
> re-install; keep your partitions as small as practical and you can change
> them over individually.

See above: LVM/LVM2/EVMS

[full quote deleted]

Regards,
	Dieter

=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)

