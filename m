From: michael chang <thenewme91@gmail.com>
Subject: Re: recovering from "rm -rf"
Date: Sun, 7 Aug 2005 17:33:47 -0400
Message-ID: <b14e81f005080714337b98765c@mail.gmail.com>
References: <42F3A08A.30102@planet.nl> <42F3C73B.9040808@slaphack.com>
	 <b14e81f0050805135739c94933@mail.gmail.com>
	 <42F3D760.7090008@slaphack.com> <op.su10y3q7th1vuj@localhost>
	 <42F3E7F1.1030205@slaphack.com> <42F3EF37.3090705@edsons.demon.nl>
	 <42F3F4A4.2050505@slaphack.com> <42F468CD.9070709@namesys.com>
	 <42F55078.2030204@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25333-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F55078.2030204@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

On 8/6/05, David Masover <ninja@slaphack.com> wrote:
> > Did you try
> > what Vitaly advised yet?
>=20
> Yes, it seems to have worked.  I seem to have all my important files,
> except one album of music and the last few episodes of anime -- and I'm
> still going through lost+found.  That's really not much of a loss.
>=20
> By the way, I also discovered a nice trick to avoid making a full disk
> backup.  I had a 500 gig RAID array that I was trying to rescue, and the
> biggest spare disk I had available was 80 gigs.  So, I used dm_snapshot
> to create a writable snapshot, using a loopback file on the 80 gig drive
> as the COW device.  I did the fsck on the snapshot, then wrote the
> snapshot back to the original device (dd if=3Dsnapshot of=3Dorig_device)
> once I was sure it worked.  If it hadn't worked, I could have simply
> removed the snapshot (dmsetup remove snapshot).
>=20
> The COW file was a 60 gig sparse file that ended up using only 2 gigs or
> so on disk after the fsck.
>=20
> Be warned, though, that dm_snapshot isn't quite like LVM snapshots, and
> only LVM snapshots are documented, while only dm_snapshot will work for
> this.  I had to read the source.

Congratulations.  Hopefully, you'll have another way to make room for
Windows though [assuming you haven't already] -- if it's not too much
of a pain, I've found some people resort to having disk images (e.g. a
FAT32 image on a Linux Filesystem) and using either VMWare or QEMU...
*sigh*  But you'll need a fast machine to get even a semi decent
speed, and the file can be huge (e.g. couple of gigs) and if it gets
fragmented, then performance is a pain (fragemented files on a
fragmented disk image.. uggh, I don't want to think about it).

I guess something to keep in mind on the online resizer -- ability to
handle larger images than free space (if possible) or at least large
files.  This, I suppose, could be boasted as a reason to convert e.g.
VMWare users to use Resier4 as an underlying filesystem in the future.
 If you make a Windows driver also, [with a decent defragmenter,
online or otherwise, that handles large disk images] then people who
use VMWare surely wouldn't mind paying a couple of bucks to ensure
maximum "performance" from their disks.  Just something to consider.
;)  [Note: I don't personally use VMWare, but this is my opinion of
their users, considering how expensive VMWare licences are in and of
themselves - a Resier4 driver would probably pale in comparison, and
be considered a bargain.  Hopefully.]

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
