From: Michael Barnwell <xterminate@xterminate.me.uk>
Subject: Data being corrupted on reiserfs 3.6
Date: Sat, 14 Jan 2006 22:41:27 +0000
Message-ID: <43C97E17.7030604@xterminate.me.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27720-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

I'm experiencing data corruption when creating or copy data to my 
reiserfs 3.6 partition mounted under /home. The following extract gives 
a pretty clear indication that it's getting corrupted somewhere.

michael@biggs:/tmp$ mount
/dev/md0 on / type ext3 (rw,errors=remount-ro)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
tmpfs on /dev/shm type tmpfs (rw)
usbfs on /proc/bus/usb type usbfs (rw)
tmpfs on /dev type tmpfs (rw,size=10M,mode=0755)
/dev/md2 on /home type reiserfs (rw)

michael@biggs:/tmp$ dd bs=1024 count=1000k if=/dev/urandom of=./1GB.tst
1024000+0 records in
1024000+0 records out
1048576000 bytes transferred in 231.749782 seconds (4524604 bytes/sec)

michael@biggs:/tmp$ md5sum 1GB.tst
48f46744c7e50c42c061a00d11541a85  1GB.tst

michael@biggs:/tmp$ cp 1GB.tst /home/michael/

michael@biggs:/tmp$ md5sum /home/michael/1GB.tst
042d8c462882f848412679e3cea03fe2  /home/michael/1GB.tst


I'm running Debian Sarge on an Athlon XP 2200+, /dev/md2 is made up of 
four 400GB SATA hard disks on a Silicon Image 3114 controller in RAID 5. 
Dmesg is showing no errors what so ever, the RAID array has been stable 
since I installed it a couple of weeks ago and the drive was formatted 
with mkfs.reiserfs with no special options.

michael@biggs:/tmp$ uname -a
Linux biggs 2.6.8-2-k7 #1 Tue Aug 16 14:00:15 UTC 2005 i686 GNU/Linux

michael@biggs:/tmp$ cat /proc/mdstat
Personalities : [raid1] [raid5]
md2 : active raid5 sdd1[0] sdc1[3] sdb1[2] sda1[1]
       1172126208 blocks level 5, 64k chunk, algorithm 2 [4/4] [UUUU]

If anyone has any idea what's going on I would be much appreciated.

Regards,

Michael Barnwell.
