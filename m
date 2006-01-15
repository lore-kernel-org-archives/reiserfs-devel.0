From: Jan Kara <jack@ucw.cz>
Subject: Re: Data being corrupted on reiserfs 3.6
Date: Sun, 15 Jan 2006 21:41:43 +0100
Message-ID: <20060115204143.GC24752@atrey.karlin.mff.cuni.cz>
References: <43C97E17.7030604@xterminate.me.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27730-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43C97E17.7030604@xterminate.me.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Barnwell <xterminate@xterminate.me.uk>
Cc: reiserfs-list@namesys.com

  Hello,

> I'm experiencing data corruption when creating or copy data to my 
> reiserfs 3.6 partition mounted under /home. The following extract gives 
> a pretty clear indication that it's getting corrupted somewhere.
> 
> michael@biggs:/tmp$ mount
> /dev/md0 on / type ext3 (rw,errors=remount-ro)
> proc on /proc type proc (rw)
> sysfs on /sys type sysfs (rw)
> devpts on /dev/pts type devpts (rw,gid=5,mode=620)
> tmpfs on /dev/shm type tmpfs (rw)
> usbfs on /proc/bus/usb type usbfs (rw)
> tmpfs on /dev type tmpfs (rw,size=10M,mode=0755)
> /dev/md2 on /home type reiserfs (rw)
> 
> michael@biggs:/tmp$ dd bs=1024 count=1000k if=/dev/urandom of=./1GB.tst
> 1024000+0 records in
> 1024000+0 records out
> 1048576000 bytes transferred in 231.749782 seconds (4524604 bytes/sec)
> 
> michael@biggs:/tmp$ md5sum 1GB.tst
> 48f46744c7e50c42c061a00d11541a85  1GB.tst
> 
> michael@biggs:/tmp$ cp 1GB.tst /home/michael/
> 
> michael@biggs:/tmp$ md5sum /home/michael/1GB.tst
> 042d8c462882f848412679e3cea03fe2  /home/michael/1GB.tst
  Hmm, that is really strange. Do the files have the same size? Do you
get an error also if you just create file full of zeros? If so, how do
the differences look like (e.g. any signs of flipped bits or so?).

> I'm running Debian Sarge on an Athlon XP 2200+, /dev/md2 is made up of 
> four 400GB SATA hard disks on a Silicon Image 3114 controller in RAID 5. 
> Dmesg is showing no errors what so ever, the RAID array has been stable 
> since I installed it a couple of weeks ago and the drive was formatted 
> with mkfs.reiserfs with no special options.
> 
> michael@biggs:/tmp$ uname -a
> Linux biggs 2.6.8-2-k7 #1 Tue Aug 16 14:00:15 UTC 2005 i686 GNU/Linux
  Any chance of trying some newer kernel? 2.6.8 is really old...

								Honza
