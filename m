From: "Stephen D. Williams" <sdw@lig.net>
Subject: Very very slow rm/unlink of large sparse files
Date: Sun, 15 Feb 2004 22:29:35 -0500
Message-ID: <4030391F.5080204@lig.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080100060309010604060902"
Return-path: <reiserfs-list-return-16797-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------080100060309010604060902
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Linux kernel 2.4.21-99 (SuSe 9 Pro kernel), and also experienced with 2.6.1.

When deleting a large file (4-10GB), at least somewhat sparse (created 
completely sparse and filled in as a reiserfs filesystem under 
user-mode-linux), the filesystem layer spends a very very long time, on 
the order of several hours per GB, with constant disk activity trying to 
delete the file.  If the system is rebooted, the partial unlink is 
continued at the same very very slow speed.  A read-only mount works 
just fine.

This is has happened several times as I have reinstalled and reoriented 
systems.  The filesystems are 40-500GB and are running on top of RAID 
0,1, or 5 (ReiserFS->RAID 0, 1, or 5), sometimes with LVM 
(ReiserFS->LVM->RAID 1).  It seems completely repeatable and 
consistent.  I have been waiting about 24 hours for an unlink of a 9.9GB 
file, formatted as ReiserFS and mostly filled with data.  The filesystem 
involved is accessible, but very very slowly.  An ls of a small 
directory takes at least 30 minutes.  The system has 2GB ram and has at 
least half of that free in buffers and cache.  System load is over 8 
because of things waiting for disk I/O, but CPU is 1% user and 3% 
system.  The disk LED is flashing at about 50% load, constant activity.

dd if=/dev/zero of=u.img bs=1 count=1 seek=$((1024 * 1024 * 4300))
mkfs.reiserfs -f u.img
mount -o loop u.img /mnt
cp -r /etc /mnt   # I'm not sure how much data needs to be present, if 
any, to exacerbate the problem.
umount /mnt
rm -f u.img


Is this a known problem?  Has it been fixed in recent versions?  Is 
there a way to avoid practically (but not completely) locking up a 
filesystem for many hours or days just to delete a file?

sdw

-- 
swilliams@hpti.com http://www.hpti.com Personal: sdw@lig.net http://sdw.st
Stephen D. Williams 703-724-0118W 703-995-0407Fax 20147-4622 AIM: sdw



--------------080100060309010604060902--
