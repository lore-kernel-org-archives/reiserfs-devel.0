From: Greg Ward <gward@python.net>
Subject: Safely spinning down SCSI ReiserFS disk
Date: Sat, 26 Apr 2003 17:16:38 -0400
Message-ID: <20030426211638.GA690@cthulhu.gerg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-13830-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all -- I'd like to make it so my primary disk, which is a very noisy
10000 RPM SCSI disk, spins down at night.  (I also plan to "apm
--suspend" the system immediately after spinning the disk down, so I'm
not worried about normal system activity failing because of a "dead"
disk.  And of course the first thing the system will do when it wakes up
in the morning will be to spin up the disk!)

From searching the list archives, I know I'm not the only one who wants
to do this, but I'm having problems that might be ReiserFS-related.
Specifically, it looks like ReiserFS is trying to write journal data to
the disk after it's spun down, even though I run /bin/sync before the
spindown.

Here's my setup: / is /dev/sda2; the only other partitions on sda are
swap and /scratch.  /home, /var, /tmp, /usr/local are all on that one
partition.  I also have a big (and blissfully quiet) IDE disk at my
disposal.

Here's how I spin the disk down now:

  * create a ramdisk with a few minimal tools -- mainly the
    scsi-spin binary from scsitools 0.3-2 (Debian package)

  * write a script in the ramdisk that runs
      sync
      scsi-spin --force --down /dev/sda
      sleep 5
      scsi-spin --force --up /dev/sda

  * sync and chroot to the ramdisk and run that script in it

The disk spins down fine, and then comes back up -- but any process that
tries to access the disk blocks forever, and there's a "kernel bug" dump
on my console.  At that point I have to reboot -- good thing I built the
"Magic SysRq key" feature into my kernel, since I can't even run the
"reboot" binary!

Is this sort of behaviour expected?  Is there anything more I should be
doing to safely spin down the disk containing ReiserFS filesystems?
Would it be useful if I provided that "kernel bug" dump?  (Maybe I can
write it to my IDE disk before rebooting... hmmm...)

Thanks --

        Greg
-- 
Greg Ward <gward@python.net>                         http://www.gerg.ca/
