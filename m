From: David Greaves <david@dgreaves.com>
Subject: Can't mount after mkfs -b 8192
Date: Thu, 03 Jun 2004 22:35:15 +0100
Message-ID: <40BF9993.5060409@dgreaves.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19000-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Help :)

This seems odd...

Kernel 2.6.6
progsreiserfs 0.3.0.4-3

I have a raid5 array in an LVM2 VG with a 600Gb LV defined.
If I make a reiserfs with a block size of 8192 it won't mount.

The following commands were issued consecutively:

cu:~# mkfs -treiserfs /dev/video_vg/video_lv
All data on /dev/video_vg/video_lv will be lost. Do you really want to 
create reiser filesystem (v3.6) (y/n) y
Creating reiser filesystem (v3.6) with standard journal on 
/dev/video_vg/video_lv
initializing skiped area: done
initializing journal: done
syncing...done

cu:~# mount /dev/video_vg/video_lv /huge

cu:~# df -k
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/hda2             19283776    697988  18585788   4% /
/dev/hda1                97826     13003     79604  15% /boot
/dev/mapper/video_vg-video_lv
                     629126396     32840 629093556   1% /huge

cu:~# umount /huge

cu:~# mkfs -treiserfs -b 8192 /dev/video_vg/video_lv
All data on /dev/video_vg/video_lv will be lost. Do you really want to 
create reiser filesystem (v3.6) (y/n) y
Creating reiser filesystem (v3.6) with standard journal on 
/dev/video_vg/video_lv
initializing skiped area: done
initializing journal: done
syncing...done

cu:~# mount /dev/video_vg/video_lv /huge
mount: wrong fs type, bad option, bad superblock on /dev/video_vg/video_lv,
       or too many mounted file systems

dmesg now shows:
sh-2011: read_super_block: can't find a reiserfs filesystem on (dev 
dm-0, block 16, size 4096)
sh-2021: reiserfs_fill_super: can not find reiserfs on dm-0

David

