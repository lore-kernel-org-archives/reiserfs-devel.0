From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Partial data loss with reiserfs3
Date: Wed, 16 Feb 2005 16:22:06 +0300
Message-ID: <200502161622.06930.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rikard Johnels <rikjoh@norweb.se>
Cc: reiserfs-list@namesys.com

Hello,

the history with some questions. do you have anything to add here?

> I was trying to move data from my NTFS partition to Linux (Fedora Core
> 3).   I had 2GB ext3 partition for /home. After copying some files from
> NTFS partition to /home

(1) copy NTFS -> ext3

> and successfully shrinking NTFS partition by
> 4GB I wanted to enlarge my /home. 

(2) shrink NTFS

> NTFS was shrinked several reboots ago under Linux with
> ntfsresize/fdisk.

(3) reboot

> Ext3 does not support partition
> resize and move there, so I have decided to switch /home to ReiserFS
> v3 (That's the version available for FC3)
>
> At this point the disk has, in order of physical layout: /dev/hda5
> (NTFS), 4GB /dev/hda6 (no FS), 2GB /dev/hda7 (reiser).

was hda7 reiserfs or ext3 ??

> I've created 4GB Reiser partition (/dev/hda6)
> It's very likely that mkfs was the first thing after boot.

(4) create reiserfs on former NTFS, between NTFS and ext3

> and moved data there from old /home (/dev/hda7):
> umount /home
> mkdir /home.old
> mount /dev/hda7 /home.old
> mount /dev/hda6 /home
> cd /home.old
> find . -depth -print0 | cpio --null -pvd /home

(5) copy ext3 -> reiserfs

> It worked OK (as in "cpio did not fail and I could see my directories
> and files")
>
> It is possible that I had created, copied, destroyed partitions
> since last boot - but no repartitioning.

this is not clear: created, destroyed partitions means repartitioning,
changing parittion table means repartitioning. Do I understand correctly
that you mean create, copy, destroy filesystems here?

> Then I deleted my old /dev/hda7, and tried to enlarge /dev/hda6 to take
> its space - by resizing partition,

(6) fdisk: remove hda7, remove hda6, create large hda6;

> then by resizefs.reiserfs. Resizefs complained about "Error: Can't resize
> filesystem outside the device." no matter what I size I would try to expand
> it, and with '-f' option too.  It occured to me that perhaps reboot might
> be required there, so I rebooted.

(7) reboot

> Bingo, after reboot resizefs enlarged partition to the size I wanted.
>
> # Size too big; missed the -f option
> [root@laurynas-pc ~]# resizefs.reiserfs /dev/hda6 +3G
> Error: Can't resize filesystem outside the device.
>
> # Do the resize!
> [root@laurynas-pc ~]# resizefs.reiserfs -f /dev/hda6 +3G

3G just looks too large, there was only 2G hda7 as you have mentioned.
right?

(8) rezise.reiserfs

> Reboot once again

(9) reboot

> and try to login with ordinary user (whose home is on that partition).
> Login got to the point of KDE "Restoring session state" and then PC
> hanged.

(10) login failed

> Hmm. Reboot and retry login with non-root user. The same.
> Reboot and log-in as root.
>
> [root@laurynas-pc ~]# umount /home
> [root@laurynas-pc ~]# reiserfsck /dev/hda6

(11) lots of fs corruptions.
 -- some lost file StatDatas 
 -- some wrong delimiting keys
 -- some unformatted blocks are used more then once
 -- 1 formatted block is used more then once 
 -- many broken bitmap blocks

> I've never run 'reiserfsck --rebuild-sb'. progs 3.6.18
>
> debugreiserfs /dev/hda6
> Count of blocks on the device: 1741036
> Number of bitmaps: 54
> Blocksize: 4096
> Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
> blocks):1696533
> Root block: 8212

when you run resizer, has it ever asked for confirmation?
like 'Do you want to continue? [y/N]:'

are you sure you have the relable memory? would you test it?

the reason of the problem is not clear. resizer on expand writes only 
to _new_ bitmap blocks and overwrites only super block, and it does 
not touch the fs storage tree.

so you can try to recover from the whole partition on the copy. Have 
you made fs/partition backup before rebuild-tree (probably fdisk)? 
If no, make a copy of the hda6 partition and run
	reiserfsck --rebuild-tree -S <hda6-copy> -l logfile
if yes, copy it back to hda6 and run on hda6.

-- 
Thanks,
Vitaly Fertman

