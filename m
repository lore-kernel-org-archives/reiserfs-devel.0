From: Ralf Gross <Ralf-Lists@ralfgross.de>
Subject: warning: is_tree_node: node level 56362 does not match to the expected one 1
Date: Sun, 8 Jun 2008 19:43:22 +0200
Message-ID: <20080608174322.GC19640@p15145560.pureserver.info>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hi,

I'm not sure if this is the right list, but I couldn't find a -user
list. So I'll try my luck here.

Last Friday a backup server running backuppc crashed and did not
respond to pings anymore. I logged in using the IPMI management card
and found this (sorry I couldn't scroll up or get the output from any
logfile):

http://pirx.askja.de/Supermicro_Daughter_Card_Remote_Console.png

Next I reset the system and booted. But I couldn't boot the system to
the login prompt. Many reiserfs warnings appeared.

To start reiserfsck I booted grml from CD. The first run with the
check option resulted in errors and I restarted reiserfsck with the
--rebuilt-tree option which complained after 40% about a possible
harware problems.

http://pirx.askja.de/Supermicro_Daughter_Card_Remote_Console-1.png

With the rescue CD I could also take a look at the system logfiles
from the time of the crash:


Jun  5 21:59:20 server -- MARK --
Jun  5 22:05:54 server kernel: ReiserFS: warning: is_tree_node: node level 56362 does not match to the expected one 1
Jun  5 22:05:54 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514510379. Fsck?
Jun  5 22:05:54 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
Jun  5 22:06:04 server kernel: ReiserFS: warning: is_tree_node: node level 26161 does not match to the expected one 1
Jun  5 22:06:04 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514464681. Fsck?
Jun  5 22:06:04 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
Jun  5 22:07:12 server kernel: ReiserFS: warning: is_tree_node: node level 2318 does not match to the expected one 1
Jun  5 22:07:12 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514480243. Fsck?
Jun  5 22:07:12 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
Jun  5 22:07:16 server kernel: ReiserFS: warning: is_tree_node: node level 26161 does not match to the expected one 1
Jun  5 22:07:16 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514464681. Fsck?
Jun  5 22:07:16 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
Jun  5 22:10:20 server kernel: ReiserFS: warning: is_tree_node: node level 25139 does not match to the expected one 1
Jun  5 22:10:20 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514472403. Fsck?
Jun  5 22:10:20 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
Jun  5 22:10:29 server kernel: ReiserFS: warning: is_tree_node: node level 25139 does not match to the expected one 1
Jun  5 22:10:29 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514472403. Fsck?
Jun  5 22:10:29 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
Jun  5 22:10:29 server kernel: ReiserFS: warning: is_tree_node: node level 25139 does not match to the expected one 1
Jun  5 22:10:29 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514472403. Fsck?
Jun  5 22:10:29 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
Jun  5 22:10:49 server kernel: ReiserFS: warning: is_tree_node: node level 26161 does not match to the expected one 1
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514464681. Fsck?
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
Jun  5 22:10:49 server kernel: ReiserFS: warning: is_tree_node: node level 26161 does not match to the expected one 1
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514464681. Fsck?
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
Jun  5 22:10:49 server kernel: ReiserFS: warning: is_tree_node: node level 25139 does not match to the expected one 1
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514472403. Fsck?
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
Jun  5 22:10:49 server kernel: ReiserFS: warning: is_tree_node: node level 25139 does not match to the expected one 1
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514472403. Fsck?
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
Jun  5 22:10:49 server kernel: ReiserFS: warning: is_tree_node: node level 25139 does not match to the expected one 1
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514472403. Fsck?
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
Jun  5 22:10:49 server kernel: ReiserFS: warning: is_tree_node: node level 25139 does not match to the expected one 1
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514472403. Fsck?
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
Jun  5 22:10:49 server kernel: ReiserFS: warning: is_tree_node: node level 25139 does not match to the expected one 1
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514472403. Fsck?
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
Jun  5 22:10:49 server kernel: ReiserFS: warning: is_tree_node: node level 25139 does not match to the expected one 1
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514472403. Fsck?
Jun  5 22:10:49 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
Jun  5 22:39:20 server -- MARK --
Jun  5 22:59:20 server -- MARK --
Jun  5 23:19:20 server -- MARK --


Here is the complete logfile:

http://pirx.askja.de/messages



The server is running Debian Etch with 2.6.18 kernel.

reiser4progs	1.0.5-2
reiserfsprogs   3.6.19-4    

The reiserfs is built on top of 3 raid volumes (Areca sata controller,
7 x 750 GB, raid 5, each volume 1,5 TB) and one large LVM vg.

  --- Volume group ---
  VG Name               vg-data
  System ID             
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  2
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               4.09 TB
  PE Size               4.00 MB
  Total PE              1072880
  Alloc PE / Size       1072880 / 4.09 TB
  Free  PE / Size       0 / 0   
  VG UUID               gvgzD2-0Xff-GEDR-1WlY-7OOD-Bwi4-5tig7


Hardware:

Supermicro Mainboard
C2D CPU
4 GB ECC RAM
Areca SATA RAID Controller

The system was running as backuppc server for 18 months without
problems. No power failure or other harware problems were detected
before the fail.

Since Friday I've been running memtest86+ (20 passes, app. 25 hours),
prime95 and badblocks. No problems so far.


What can I do next? Any chance to save the fs? Gladly I've a second
backup system, so not all backups are lost. But if I can get this fs
back, I'd be happy.

Ralf
