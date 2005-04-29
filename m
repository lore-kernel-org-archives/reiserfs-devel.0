From: Vincenzo Costa <vcosta@ct.astro.it>
Subject: error code 6 on root filesystem check
Date: Fri, 29 Apr 2005 19:40:15 +0200 (CEST)
Message-ID: <Pine.LNX.4.53.0504291926360.21283@astrct.ct.astro.it>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23944-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

I recently installed Slackware Linux 10.1 on a Pentium 4 HT, with two
mirrored ide ATA133 hard disks on a RAID controller (Promise Fasttrack
20376, with driver 1.00.0.15 from the manufacturer loaded through initrd
at boot).
Both the root partition and a 'users' partition mounted on /home are using
reiserfs, instead of ext3.
When I or the init scripts try a check of one of these filesystems, using
'reiserfsck', the following error is reported:

"count_blocks: block device too large
Warning... fsck.reiserfs for device /dev/sda5 exited with signal 6"

.. I checked the kernel messages with 'dmesg' and found the following
error message:

ft3xx: Unsupported IOCTL CMD<4>(0x80081272)
ft3xx: Unsupported IOCTL CMD<4>(0x80081272)

where 'ft3xx.o' is the kernel module used to support the Promise RAID
controller.

- Kernel version is Linux 2.4.29
- reiserfsck version is 3.6.18

By the way, everything worked correctly when Slackware 10.0 was installed.
The problems started with the Slackware 10.1 upgrade.

Best wishes
Vincenzo Costa
