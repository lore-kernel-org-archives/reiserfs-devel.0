From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: 2.5.46: SCSI and/or ReiserFS v3.6 broken? Kernel panic (fwd)
Date: Thu, 7 Nov 2002 01:12:53 +0100
Message-ID: <200211070112.53314.Dieter.Nuetzel@hamburg.de>
References: <Pine.LNX.4.02.10211060930300.27381-100000@palpatine.science-computing.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11939-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.02.10211060930300.27381-100000@palpatine.science-computing.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Karsten Weiss <K.Weiss@science-computing.de>, Andrew Morton <akpm@digeo.com>
Cc: Oliver Tennert <tennert@science-computing.de>, ReiserFS List <reiserfs-list@namesys.com>

Am Mittwoch, 6. November 2002 09:47 schrieb Karsten Weiss:
> Hi Andrew!
>
> > Dieter N=FCtzel wrote:
> > > VFS: Cannot open root device "803" or 08:03
> > > Please append a correct "root=3D" boot option
> > > Kernel panic: VFS: unable to mount root fs on 08:03
> >
> > That was happening to me yesterday as well.  After a bit
> > of poking around and recompiling, it mysteriously went away.
> >
> > The same has happened about ten times over the past few months,
> > and rebuilding the world makes it go away.  On ext3.
> >
> > Something is definitely fishy.  It's unhelpful that it cures
> > itself just as you get geared up to fix it.
> >
> > Does a full rebuild fix it for you?
>
> For what it's worth (maybe it does ring a bell):
>
> We have the same problem with kernels >=3D2.4.19 on ext3 partitions. It
> happens in the last line of the SuSE-7.3 initial ramdisk linuxrc script.

OK, it is a SuSE 7.3 based system.
=20
> However, if we comment out the last line of linuxrc it works:

I have no "linuxrc" file.

Even without initrd (didn't use it anyway) it do _NOT_ work.

> [...module loading skipped...]
> mount -n -t proc proc /proc
> mount -n -t ext3 /dev/sda4 /mnt
> rm -f /mnt/.initrd 2>/dev/null
> mkdir -p /mnt/.initrd
> cd /mnt
> pivot_root . .initrd
> umount -n /.initrd/proc
> !!!
> exec sh -c 'umount -n /.initrd; rmdir /.initrd ; mount -n -oremount,ro /'
> </dev/console >/dev/console 2>&1 !!!
>
> The affected machines are HP X4000s (dual Xeon, 4 GB RAMBUS, SCSI
> harddisks)

With "pci=3Dnoacpi" at the boot prompt I get the aic7xxx "debug mode".
How can I dump such stuff to a screen, file, line printer?
=3D> SCSI and not ReiserFS

Without 2.5.46 ;-(

=2DDieter
