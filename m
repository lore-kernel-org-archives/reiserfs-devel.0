From: Francois-Rene Rideau <fare@tunes.org>
Subject: recovery of crashed reiserfs disk?
Date: Fri, 17 Jan 2003 23:15:35 +0100
Sender: Francois-Rene Rideau <fare@Samaris.tunes.org>
Message-ID: <20030117221535.GA945@Kadath>
Reply-To: Francois-Rene Rideau <fare@tunes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12430-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Dear ReiserFS developers,

I have at home a reiserfs partition that seems to be corrupted,
on a physically damaged disk.
I would like to know if there's any chance of either my recovering any
data, or if I'd better send the disk back for replacement immediately.
(I have backups for most but not all of my data).

* Here is what I get when the kernel tries to mount the root partition
 at bootup:
------>8------>8------>8------>8------>8------>8------>8------>8------>8---=
---
hda: read_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D223035648, s=
ector=3D204472320
end_request: I/O error, dev 03:04 (hda), sector 204472320
hda: read_intr: status=3D0x59 { DriveReady SeekComplete DataRequest Error }
hda: read_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D227754240, s=
ector=3D209190912
end_request: I/O error, dev 03:04 (hda), sector 209190912
sh-2029: reiserfs read_bitmaps: bitmap block (#15630336) reading failed
reiserfs_read_super: unable to read bitmap
hda: read_intr: status=3D0x59 { DriveReady SeekComplete DataRequest Error }
hda: read_intr: error=3D0x01 { AddrMarkNotFound }, LBAsect=3D230637824, sec=
tor=3D212074496
hda: read_intr: status=3D0x59 { DriveReady SeekComplete DataRequest Error }
hda: read_intr: error=3D0x01 { AddrMarkNotFound }, LBAsect=3D230637824, sec=
tor=3D212074496
hda: read_intr: status=3D0x59 { DriveReady SeekComplete DataRequest Error }
hda: read_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D230637824, s=
ector=3D212074496
end_request: I/O error, dev 03:04 (hda), sector 212074496
hda: read_intr: status=3D0x59 { DriveReady SeekComplete DataRequest Error }
hda: read_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D235880704, s=
ector=3D217317376
end_request: I/O error, dev 03:04 (hda), sector 217317376
Kernel panic: VFS: Unable to mount root fs on 03:04
------>8------>8------>8------>8------>8------>8------>8------>8------>8---=
---
 All in all something like 14 I/O error series of message clutter appear,
 for something like 3 screen fulls. The first error message is a block read
 error for a sector at LBA sector 143606016, and it goes on and on with
 other blocks failing to be read, until that final series of messages.

More information:
* the 120MB disk was used on my old P75 server, which was feeling slow for
 many applications. I took an opportunity to upgrade it to a PII-350, and
 decided to physically move the disk to the new server (after configuring
 GRUB to default to a kernel adapted to the new hardware).
 It seems that the disk got too hot and crashed at some point,
 probably after shutting it down at this very time
 and moving it to a new case while it was still very hot.
 In any case, another disk died prematurely and completely when placed
 at the same place in the same machine, one year ago -- probably due
 to heat and stress. This heat was also one of the reasons that prompted
 me to upgrade the hardware. Should have done so earlier. Doh.
=20
* I tried to inspect the disk from my workstation, to see what I could
 salvage. Thanks to IDE racks, I can easily use the disk as /dev/hdc.
 Below is some information about its configuration.

* In the old machine, the old BIOS forced me to partition it using C/H/S
 geometry 238216/16/63 instead of the usual LBA 14946/255/63 that is used
 on a similar disk in my workstation. The disk was partitioned as follows
------>8------>8------>8------>8------>8------>8------>8------>8------>8---=
---
Disk /dev/hdc: 122.9 GB, 122942324736 bytes
16 heads, 63 sectors/track, 238216 cylinders
Units =3D cylinders of 1008 * 512 =3D 516096 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hdc1             1       130     65488+  83  Linux
/dev/hdc2           131     16384   8192016   83  Linux
/dev/hdc3         16385     18416   1024128   82  Linux swap
/dev/hdc4         18417    238216 110779200   83  Linux
------>8------>8------>8------>8------>8------>8------>8------>8------>8---=
---

* hda4 is the rootfs, hda1 is /boot -- both reiserfs.
 hda2 is spare, and hda3 is swap.

* /dev/hda1 works perfectly (but doesn't contain much information,
 besides the kernel and boot configuration).

* reiserfsck -a /dev/hdc4 reports:
------>8------>8------>8------>8------>8------>8------>8------>8------>8---=
---
Reiserfs super block in block 16 on 0x1604 of format 3.6 with standard jour=
nal
Blocks (total/free): 27694800/15423590 by 4096 bytes
Filesystem is cleanly umounted
------>8------>8------>8------>8------>8------>8------>8------>8------>8---=
---

* reiserfsck /dev/hdc4 screams the following:
------>8------>8------>8------>8------>8------>8------>8------>8------>8---=
---
<--------reiserfsck 3.6.4, 2002-------->

Will read-only check consistency of the filesystem on /dev/hdc4
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Y=
es
###########
reiserfsck --check started at Fri Jan 17 19:47:07 2003
###########

The problem has occurred looks like a hardware problem.
Check your hard drive for badblocks.

bread: Cannot read the block (15630336).

zsh: 980 abort      reiserfsck /dev/hdc4
------>8------>8------>8------>8------>8------>8------>8------>8------>8---=
---

* Indeed, if reiserfs is counting 4096-byte blocks, then 15630336 matches
 LBA sector 143606016 (the first in the kernel error log), and
	dd if=3D/dev/hdc of=3D/dev/zero count=3D1 skip=3D143606016
 reports an error, and so do nearby sectors from ...007 to ...023 (whereas
 for instance the last sector in partition is 221558399 and works perfectly=
).
 Ouch.

* I was distracted for some time, because according to the suggestion
 of reiserfs, I tried badblocks for the whole disk:
  badblocks -o bad.hdc -b 512 -c 1024 /dev/hdc
 But it reported no error. I then tried just for the detected bad sector:
  badblocks -o bad.hdc -b 512 -c 1 /dev/hdc 143606020 143606010
 It still reported no error -- useless program!

* The disk is not quite full, and block 15630336 (60GB) is possibly beyond
 the last data written to disk. Indeed, readable blocks around that place
 seem to be consistently filled with zeros.

* So is there any chance that I may recover some data from the readable part
 of the disk?

* If mirroring the "good" part could help, I've got another 120GB disk to do
 it (that holds the backup), but all the data shuffling involved in trying =
is
 heavy enough (and risky for the data, too) that I don't want to try without
 hope from you -- also, if there is hope in such a thing, do you know where
 to find a program that would indeed copy all the good sectors and skip over
 the bad ones?

Thanks a lot for any answer, even just to tell me there's no hope.

[ Fran=E7ois-Ren=E9 =D0VB Rideau | Reflection&Cybernethics | http://fare.tu=
nes.org ]
[  TUNES project for a Free Reflective Computing System  | http://tunes.org=
  ]
God exists and I'm His Prophet. And He says: "Don't you believe in Me or in
My Prophet, least you be doomed to go to Hell, for I gave you brains not to
believe in things dogmatically and superstitiously, but to think rationally=
."
		-- Far=E9
