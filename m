From: Robert Brockway <robert@timetraveller.org>
Subject: Possible problem with Firewire device
Date: Sat, 17 Aug 2002 11:28:59 +1000 (EST)
Message-ID: <Pine.LNX.4.44.0208171042410.10279-100000@avon.timetraveller.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11216-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi all.  I have an external HD casing with an ATA/Firewire bridge built
in.  A 3.5" ATA66/100 drive is put in the casing and it connects to the
box through firewire.

I've got a 15Gb ATA66 drive in the casing right now.

The whole drive is in a single partition.  I've been running ext2/3 on the
drive for some months under a number of 2.4 kernels without issue.  I
decided to convert it to Reiserfs the other day.

I was able to mkreiserfs without error on the partition (which is mapped
into the system as /dev/sda1).

I was then able to mount the drive as /backup.  No problem.

I then kicked off a backup job which grabs a tar file of my system,
excluding /proc,/tmp and other areas that aren't to be backed up.  This is
a home grown script I've been using for ages.

The tar should have come out at about 7.5Gb (no compression).  The tar
seemed to be fine until it got to about 382Mb.  At this point the tar
stopped.  The process was still running but was not hitting the disk.  I
left this for several minutes with no change.  The process didn't accept a
SIGTERM or a SIGKILL.  Unable to umount the device in any way I then
attempted a reboot.  The reboot command hung for several minutes and I
eventually had to power cycle the box to recover.  On reboot /backup
mounted fine and the tar file was still present.

I immediately remade the filesystem as ext3 as this is actually a
production box (handling mostly non-interactive jobs like mail I'm pleased
to say).  I was then able to run my backup successfully onto the ext3 FS.

Kernel version:	Modular Vanilla 2.4.19.

Reiserfsprogs:	3.x.1b

The Reiserfs on the root filesystem was built under Debian's 2.4bf kernel
as part of a Debian 3.0r0 install recently and works perfectly.

Due to the nature of the system I was not able to experiment extensively
but do have the opportunity to take the system down later to test this a
bit better if needed (right after taking a backup :)

If any further info is required I'm happy to supply it.

Rob

-- Robert Brockway B.Sc. email: robert@timetraveller.org  ICQ: 104781119
   Linux counter project ID #16440 (http://counter.li.org)
   "The earth is but one country and mankind its citizens" -Baha'u'llah

