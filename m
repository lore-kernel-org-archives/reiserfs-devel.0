From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiserfs crashes with small file systems!!! (kernel 2.6.6)
Date: Wed, 16 Jun 2004 09:53:04 -0700
Message-ID: <40D07AF0.1040404@namesys.com>
References: <20040616082658.GA24578@xy1.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19216-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040616082658.GA24578@xy1.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs@xy1.org, reiserfs-list@namesys.com

Chris, your work day is still in progress, can you look into this?

Thanks,

Hans

reiserfs@xy1.org wrote:

>I tested reiserfs with a small file system and it crashed the kernel 2.6.5!
>
>The steps was:
>- creating a small partition (100 MB big)
>- mkfs.reiserfs on this partition
>- mounting the partition
>- filling up the free space by copying data on this partition (cp -r /usr/*)
>- BOOM! cp SEGFAULTS!!!! Sometimes it's Killed by the kernel. (kernel code bug?!)
>  With dmesg I can see kernel panic style messages.
>
>The running kernel:
>lice03:~ # uname -ar
>Linux lice03 2.6.5-7.5-smp #1 SMP Mon Apr 19 19:30:53 UTC 2004 x86_64 x86_64 x86_64 GNU/Linux
>
>I tested it also on a Intel x86 32 Bits processor. I got the same error.
>
>After the crashing of the file system, I lost 100% of the data!!!
>Impossible to recover for me the data (I'm not reiserfs guru, but I didn't found how to do).
>
>The system is no more rebootable by commands like "shutdown -r 0 or reboot", you must turn off the power
>directly on the chase, because the Linux kernel become totally instable once the reiserfs system crashed.
>
>Here is my output:
>
>lice03:/ # fdisk /dev/hda
>
>The number of cylinders for this disk is set to 9730.
>There is nothing wrong with that, but this is larger than 1024,
>and could in certain setups cause problems with:
>1) software that runs at boot time (e.g., old versions of LILO)
>2) booting and partitioning software from other OSs
>   (e.g., DOS FDISK, OS/2 FDISK)
>
>Command (m for help): p
>
>Disk /dev/hda: 80.0 GB, 80032038912 bytes
>255 heads, 63 sectors/track, 9730 cylinders
>Units = cylinders of 16065 * 512 = 8225280 bytes
>
>   Device Boot      Start         End      Blocks   Id  System
>/dev/hda1               1         262     2104483+  82  Linux swap
>/dev/hda2             263        2873    20972857+  83  Linux
>/dev/hda3            2874        9729    55070820    f  W95 Ext'd (LBA)
>/dev/hda5            2874        2893      160618+  8e  Linux LVM
>/dev/hda6            2894        2914      168651   8e  Linux LVM
>/dev/hda7            2915        2925       88326   8e  Linux LVM
>/dev/hda8            2926        2938      104391   83  Linux
>
>Command (m for help): quit
>
>lice03:/ # mkfs.reiserfs /dev/hda8
>mkfs.reiserfs 3.6.13 (2003 www.namesys.com)
>
>A pair of credits:
>Vitaly Fertman wrote  fsck for V3 and  maintains the reiserfsprogs package now.
>He wrote librepair,  userspace plugins repair code, fsck for V4,  and worked on
>developing libreiser4 and userspace plugins with Umka.
>
>Alexander  Lyamin  keeps our hardware  running,  and was very  generous  to our
>project in many little ways.
>
>
>Guessing about desired format.. Kernel 2.6.5-7.5-smp is running.
>Format 3.6 with standard journal
>Count of blocks on the device: 26096
>Number of blocks consumed by mkreiserfs formatting process: 8212
>Blocksize: 4096
>Hash function used to sort names: "r5"
>Journal Size 8193 blocks (first block 18)
>Journal Max transaction length 1024
>inode generation number: 0
>UUID: bc140a87-65bc-41ac-bcc8-deb1045b13e1
>ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
>        ALL DATA WILL BE LOST ON '/dev/hda8'!
>Continue (y/n):y
>Initializing journal - 0%....20%....40%....60%....80%....100%
>Syncing..ok
>ReiserFS is successfully created on /dev/hda8.
>lice03:/ # mount -t reiserfs -v /dev/hda8 /local2
>/dev/hda8 on /local2 type reiserfs (rw)
>lice03:/ # cd local2/
>lice03:/local2 # df -h
>Filesystem            Size  Used Avail Use% Mounted on
>/dev/hda2              21G  2.6G   18G  13% /
>tmpfs                 1.5G  4.0K  1.5G   1% /dev/shm
>/dev/hda8             102M   33M   70M  32% /local2
>lice03:/local2 # cp -r /usr/* .
>Segmentation fault
>
>Message from syslogd@lice03 at Tue Jun 15 16:20:19 2004 ...
>lice03 kernel: general protection fault: 0000 [1] SMP 
>lice03:/local2 # 
>
>dmesg:
>
>ReiserFS: hda8: warning: allocator defaults = [00001420]
>
>ReiserFS: hda8: found reiserfs format "3.6" with standard journal
>ReiserFS: hda8: using ordered data mode
>ReiserFS: hda8: journal params: device hda8, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
>ReiserFS: hda8: checking transaction log (hda8)
>ReiserFS: hda8: Using r5 hash to sort names
>ReiserFS: hda8: warning: Created .reiserfs_priv on hda8 - reserved for xattr storage.
>general protection fault: 0000 [1] SMP 
>CPU 0 
>Pid: 3722, comm: cp Not tainted 2.6.5-7.5-smp
>RIP: 0010:[<ffffffffa00442fa>] <ffffffffa00442fa>{:reiserfs:scan_bitmap_block+106}
>RSP: 0018:00000100ad649a28  EFLAGS: 00010282
>RAX: 0000000000000010 RBX: 0000000000000001 RCX: 0000000000000000
>RDX: 00000100be93be80 RSI: 0000000000000001 RDI: 6e25b4b200000400
>RBP: 0000000000000001 R08: 0000000000000010 R09: 0000000000000011
>R10: 00000100ad649c08 R11: 00000000000065ef R12: ffffff0000266010
>R13: 00000100ad649af0 R14: 0000000000000801 R15: 00000100b1b71400
>FS:  0000002a95baa7e0(0000) GS:ffffffff804dde80(0000) knlGS:0000000000000000
>CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
>CR2: 0000000000754058 CR3: 0000000000101000 CR4: 00000000000006e0
>Process cp (pid: 3722, stackpage=100b9a57230)
>Stack: 00000100a2cf315c 0000001100000000 0000000100000010 00000100ad649db8 
>       0000000000000000 0000000000000001 0000000000000001 00000100b1b71400 
>       0000000000000001 00000100ad649b40 
>Call Trace:<ffffffffa00459ac>{:reiserfs:reiserfs_allocate_blocknrs+3084} 
>       <ffffffffa0051e84>{:reiserfs:reiserfs_allocate_blocks_for_region+516} 
>       <ffffffffa0051ccf>{:reiserfs:reiserfs_allocate_blocks_for_region+79} 
>       <ffffffffa006225d>{:reiserfs:search_for_position_by_key+589} 
>       <ffffffff80159584>{add_to_page_cache+100} <ffffffffa005194c>{:reiserfs:reiserfs_prepare_file_region_for_write+1404} 
>       <ffffffffa0053454>{:reiserfs:reiserfs_file_write+1300} 
>       <ffffffff801f88da>{avc_has_perm+90} <ffffffff801885ba>{cp_new_stat+234} 
>       <ffffffff801f9eb2>{inode_has_perm+98} <ffffffff801fa4bb>{selinux_file_permission+299} 
>       <ffffffff8017e9f4>{vfs_write+228} <ffffffff8017eb19>{sys_write+73} 
>       <ffffffff80110734>{system_call+124} 
>
>Code: 8b 07 a8 04 74 05 e8 7b d9 13 e0 41 0f b7 44 24 02 31 d2 3b 
>RIP <ffffffffa00442fa>{:reiserfs:scan_bitmap_block+106} RSP <00000100ad649a28>
> 
>lice03:/local2 # 
>
>  
>

