From: Laurynas Biveinis <Laurynas.Biveinis@mif.vu.lt>
Subject: Re: Partial data loss with reiserfs3
Date: Mon, 14 Feb 2005 16:40:48 +0200
Message-ID: <1108392048.4210b87003405@webmail.vu.lt>
References: <1108315756.420f8e6ce67b0@webmail.vu.lt> <200502141544.34513.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502141544.34513.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: vitaly@namesys.com, reiserfs-list@namesys.com

Hello,

Cituojant Vitaly Fertman <vitaly@namesys.com>:

> reboot is required between repartitioning a drive and starting to use
> 
> moved/created partitions. without that the kernel may continue to
> use
> old partition table. so it would be great to recall step-by-step
> history 
> of your copings, removes, repatitionings and reboots.

Starting from the last successful cpio between old and new /home
partitions - can I assume that data was intact at this point if cpio
succeeded?

At this point the disk has, in order of physical layout: /dev/hda5
(NTFS), 4GB /dev/hda6 (no FS), 2GB /dev/hda7 (reiser).

I tried my best to reconstruct this history, but there might be some
mistakes, of course.

[root@laurynas-pc ~]# mkfs -t reiserfs /dev/hda6

# Copy data
[root@laurynas-pc ~]# mount /dev/hda7 /home.old
[root@laurynas-pc ~]# mount /dev/hda6 /home
[root@laurynas-pc ~]# cd /home.old
[root@laurynas-pc ~]# find . -depth -print0 | cpio --null -pvd /home
[root@laurynas-pc ~]# umount /dev/hda7
[root@laurynas-pc ~]# umount /dev/hda6

# Delete /dev/hda7, delete /dev/hda6 and re-create it with the
# same starting sector, but take all former /dev/hda7 space too.
[root@laurynas-pc ~]# fdisk

# Try to resize /dev/hda6
[root@laurynas-pc ~]# resizefs.reiserfs /dev/hda6 6964146K
Error: Can't resize filesystem outside the device.

# Try to resize /dev/hda6 to a value really known to fit in the 
# new partition
# ... some 6 invocations of resizefs with values ~6GB here...
[root@laurynas-pc ~]# resizefs.reiserfs /dev/hda6 +1G
Error: Can't resize filesystem outside the device.

# Remembered about reboot
[root@laurynas-pc ~]# reboot

# Size too big; missed the -f option
[root@laurynas-pc ~]# resizefs.reiserfs /dev/hda6 +3G
Error: Can't resize filesystem outside the device.

# Do the resize!
[root@laurynas-pc ~]# resizefs.reiserfs -f /dev/hda6 +3G

[root@laurynas-pc ~]# mount /dev/hda6 /home
...typical mount output, as in previous e-mail...

[root@laurynas-pc ~]# df
... partition size and free/used space reported OK...

[root@laurynas-pc ~]# reboot

There tried to login with non-root user, and the rest of the story is
in
the previous e-mail.

Here is the current partition table:

Disk /dev/hda: 120.0 GB, 120034123776 bytes
255 heads, 63 sectors/track, 14593 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1   *           1         927     7446096   83  Linux
/dev/hda2             928         978      409657+  82  Linux swap
/dev/hda3             979       14593   109362487+   f  W95 Ext'd (LBA)
/dev/hda5             979       13726   102398278+   7  HPFS/NTFS
/dev/hda6           13727       14593     6964146   83  Linux

--
Thanks,
Laurynas

