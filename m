From: Sam Vilain <sam@vilain.net>
Subject: Re: What Filesystem?
Date: Thu, 30 Jan 2003 04:58:59 +1300
Sender: Sam Vilain <sv@vilain.net>
Message-ID: <200301300458.59629.sam@vilain.net>
References: <3E38378A.8030406@jtmstudio.fsbusiness.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12540-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E38378A.8030406@jtmstudio.fsbusiness.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: james@jtmstudio.fsbusiness.co.uk, reiserfs-list@namesys.com

Reiserfs is probably not what you want for doing lots of high volume data=
=2E =20
Reiserfs is good with many small files and general purpose use.  It is=20
actually the slowest filesystem for bulk data.

I'm sure some smartass will probably post some benchmark to prove me wron=
g,=20
but SGI have a long heritage of making filesystems for exactly what you=20
want and so if XFS works I'd say use that.  It's pumpin'.  Of course more=
=20
quantitative comparisons can easily be found on the linux-kernel mailing=20
list.

However, the practical difference between the high performance filesystem=
s=20
you mentioned, or the difference between running pre-empt or not should b=
e=20
considered marginal compared to other factors - such as, the load that=20
your hard disk controller places on the system and the number of physical=
=20
disks you have (and how many RPM they run at).  Keep in mind that you can=
=20
often nearly double the data throughput of a system by doubling the numbe=
r=20
of physical disks in it, and using RAID.

Even with the latest UDMA-133, I haven't seen any IDE system actually=20
perform without bothering the CPU non-trivially (of course YMMV).  Using=20
SCSI disks and controllers will give you a smoother system ride; which is=
=20
why 95% of high-end workstations come equipped with SCSI.  You can get=20
15,000 RPM U320 SCSI disks, which are f*** fast (though loud).  This is=20
largely because the SCSI protocol was designed properly, IDE/ATA is a=20
hack.  Serial-ATA promises to offer SCSI like host efficiency, but I'll=20
only believe it when I see it.  And at the moment the costs are as bad as=
=20
SCSI anyway.

Of course, being able to move around large chunks of data quickly extends=
=20
to other parts of the system, too.  The bigger and faster the system BUS,=
=20
the better.  Having `researched hardware platforms' you should know this,=
=20
of course.  As far as Athlon Motherboards go, Tyan are a reputable vendor=
=20
who used to produce Sun clone motherboards - they have a really nice dual=
=20
capable system with dual U160 SCSI controllers and 66MHz PCI slots - whic=
h=20
must mean that the SCSI controllers run at that speed.  It's definitely=20
worth the ~$500 price tag.  They all pale in comparison to R10000+ based=20
SGI or Sparc 9+ platforms of course.

=46rom a graphic artist's perspective, you're probably better off buying =
a=20
new G4 based system and running MacOS X, you know :-).  Linux isn't=20
exactly `The Platform' for digital content creation.  The Mac's CPU and=20
hardware platform are a lot better at moving data around, and if you've=20
got a Mac then you can run Mac OS X, or Linux + Mac OS inside an emulator=
=20
(which runs FAST!).

As a final note, keep in mind that a filesystem reformat does not mean a=20
re-install; keep your partitions as small as practical and you can change=
=20
them over individually.

Sam.

On Thu, 30 Jan 2003 09:20, James Thompson wrote:
> Dear Sirs,
>
> I am a visual artist and musician.  As well as a range of traditional
> media I use Linux Mandrake 8.0 on an old Athlon-based PC.  I wrote to
> Mr. Hans Reiser, after following a mailto link on the Namesys website,
> with a slightly lengthier version of the question written below, and wa=
s
> advised that "This is really a better question for our mailing list
> (reiserfs-list@namesys.com) than for me, as I am obviously biased."  I
> am therefore sending this email to you in the hope that somebody may be
> able to solve my puzzle - or at least direct me towards another
> knowledgeable source of information!  Thank you.
>
>  >> The question:
>
> ... I have done much research in the field of computer /hardware/
> suitable for commercial Digital Content Creation (P4 Xeon; Wildcat
> graphics; ART's "PURE" raytracing PCI render board, etc. ...) and now
> look to a better understanding of the choices I might make for a
> (presumably) Linux-based OS running on (presumably) Intel 32-bit
> hardware SUCH AS these two elements:-
>
>      1. Kernel Patches - pre-empt and low latency;
>      2. File System type - EXT3, ReiserFS, SGi's XFS, HFS, JFS....;
>
> Would you be able to advsie me on any issues I might need to be aware o=
f
> and perhaps any firm decisions you think would be good for me to make,
> regarding OS choice and configuration?  I realise that all pre-built
> workstations supplied by Dell, IBM and HP-Compaq come with RedHat, but,
> just for the record, I like Mandrake and I am getting into the
> WindowMaker desktop :).
>
> I also develop my website locally using Apache (but hosted on Freeserve
>
> :( ), and I understand pre-empt &/or low-latency patches are
>
> counter-effective for servers.  However, as long as no real harm can be
> expected, my priority is for graphics and sound creation, editing,
> compositing, publishing, etc., while fast response for just developing
> html pages isn't.
>
> I would like to believe that, somewhere, I can get a 'standard' Linux
> patched for optimal DCC, with suitable FS type available to choose from
> during installation.  If not, I will have to find and apply patches, bu=
t
> I know that with FS type any change demands a reformat, which can reall=
y
> disrupt a working week!
>
>  >> [End question]
>
> Yours faithfully,
>
> James Thompson,
> Visual Artist & Musician
> H.E. Student of Fine Arts

--=20
Sam Vilain, sam@vilain.net

  Sure there are dishonest men in local government.  But there are
dishonest men in national government too.
RICHARD M NIXON
