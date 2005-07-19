From: Paul Slootman <paul@debian.org>
Subject: newly created 8.5TB reiserfs fails fsck on amd64 and causes OOPS
Date: Tue, 19 Jul 2005 13:47:36 +0200
Message-ID: <20050719114736.GA25930@wurtel.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25198-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

This is on a dual-CPU opteron system, with 2 x 3ware 9500 12-channel
SATA controllers for a total of 8.5TB; I've configured a RAID5 over each
3ware controller, and use linux md RAID0 over those two "devices".
There was an issue with linux md RAID0 for that size, but that's been
resolved (at least, the problem I had first :-)

The device itself seems to work fine, as reiser4 works. I
wanted to compare to reiserfs 3.6, so I created a reiserfs, mounted it,
and tried to use it. Running bonnie++ on it caused an oops, apparently
in the reiserfs code:

kernel: Unable to handle kernel paging request at 00002aaaaaad79ea RIP:
kernel: <ffffffff801b0ac1>{scan_bitmap_block+129}
kernel: PGD 954ad067 PUD 9a1af067 PMD b75bc067 PTE 0
kernel: Oops: 0000 [1] SMP
kernel: CPU 0
kernel: Modules linked in: raid0 reiser4 zlib_deflate zlib_inflate raid5 raid6 xor ipv6 evdev tg3 3w_9xxx hw_random i2c_amd756 i2c_amd8111 i2c_core psmouse rtc
kernel: Pid: 12006, comm: bonnie++ Not tainted 2.6.12.2.raid0fixreiser4
kernel: RIP: 0010:[scan_bitmap_block+129/768] <ffffffff801b0ac1>{scan_bitmap_block+129}
kernel: RSP: 0018:ffff81007f461a18  EFLAGS: 00010286
kernel: RAX: 00002aaaaaad79ea RBX: 000000000000001c RCX: 00000000000021e0
kernel: RDX: 0000000000000000 RSI: 000000000000001c RDI: ffff81007f461d98
kernel: RBP: ffffc2000050a1c0 R08: 0000000000000001 R09: 0000000000000011
kernel: R10: 0000000000000000 R11: 0000000000000000 R12: ffff81007f461a9c
kernel: R13: 00000000000021e0 R14: ffff81007f0ffc00 R15: 0000000000000011
kernel: FS:  00002aaaab26f8c0(0000) GS:ffffffff804b7480(0000) knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
kernel: CR2: 00002aaaaaad79ea CR3: 00000000d9d11000 CR4: 00000000000006e0
kernel: Process bonnie++ (pid: 12006, threadinfo ffff81007f460000, task ffff81007feee0f0)
kernel: Stack: 0000000000000010 00000000801cabce 0000001c00000001 ffff81007f461d98
kernel:        ffff81009f6c9018 000000000000001c ffff81007f0ffc00 000000000000001c
kernel:        ffff81007f461d98 0000000000000001
kernel: Call Trace:<ffffffff801b10a9>{scan_bitmap+585} <ffffffff801b2313>{reiserfs_allocate_blocknrs+803}
kernel:        <ffffffff801bc08c>{reiserfs_allocate_blocks_for_region+524}
kernel:        <ffffffff80178f36>{alloc_page_buffers+102} <ffffffff801ca1a8>{pathrelse+40}
kernel:        <ffffffff801484b0>{autoremove_wake_function+0} <ffffffff801be315>{reiserfs_file_write+1045}
kernel:        <ffffffff801655ad>{do_anonymous_page+861} <ffffffff80165b90>{handle_mm_fault+304}
kernel:        <ffffffff80203dd1>{__up_read+33} <ffffffff8011e289>{do_page_fault+601}
kernel:        <ffffffff8032a7d3>{_spin_lock+3} <ffffffff80176c90>{vfs_write+192}
kernel:        <ffffffff80176de3>{sys_write+83} <ffffffff8010d91a>{system_call+126}
kernel:
kernel:
kernel: Code: 8b 00 48 c1 e8 02 a8 01 74 17 49 8b 86 70 02 00 00 48 ff 80
kernel: RIP <ffffffff801b0ac1>{scan_bitmap_block+129} RSP <ffff81007f461a18>
kernel: CR2: 00002aaaaaad79ea


I rebooted (hard, as a shutdown didn't work...). After that, I tried a
mkfs followd by an fsck, which gives an error! Here's the console log:


satazilla:~# mkfs.reiserfs /dev/md13
mkfs.reiserfs 3.6.19 (2003 www.namesys.com)

A pair of credits:
Joshua Macdonald wrote the first draft of the transaction manager. Yuri Rupasov
did testing  and benchmarking,  plus he invented the r5 hash  (also used by the
dcache  code).  Yura  Rupasov,  Anatoly Pinchuk,  Igor Krasheninnikov,  Grigory
Zaigralin,  Mikhail  Gilula,   Igor  Zagorovsky,  Roman  Pozlevich,  Konstantin
Shvachko, and Joshua MacDonald are former contributors to the project.

The  Defense  Advanced  Research  Projects Agency (DARPA, www.darpa.mil) is the
primary sponsor of Reiser4.  DARPA  does  not  endorse  this project; it merely 
sponsors it.


Guessing about desired format.. Kernel 2.6.12.2.raid0fixreiser4 is running.
Format 3.6 with standard journal
Count of blocks on the device: 2148377056
Number of blocks consumed by mkreiserfs formatting process: 8239
Blocksize: 4096
Hash function used to sort names: "r5"
Journal Size 8193 blocks (first block 18)
Journal Max transaction length 1024
inode generation number: 0
UUID: 10ae60ee-1abb-49d1-ae55-cf238626c0b5
ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
        ALL DATA WILL BE LOST ON '/dev/md13'!
Continue (y/n):y
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..ok

Tell your friends to use a kernel based on 2.4.18 or later, and especially not a
kernel based on 2.4.9, when you use reiserFS. Have fun.

ReiserFS is successfully created on /dev/md13.
satazilla:~# reiserfsck  /dev/md13
reiserfsck 3.6.19 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will read-only check consistency of the filesystem on /dev/md13
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
###########
reiserfsck --check started at Tue Jul 19 13:29:22 2005
###########
Replaying journal..
No transactions found
reiserfs_open_ondisk_bitmap: wrong either bitmaps number,
count of blocks or blocksize, run with --rebuild-sb to fix it
reiserfsck: Could not open bitmap


When I try running with --rebuild-sb it says:

Reiserfs super block in block 16 on 0x90d of format 3.6 with standard journal
Count of blocks on the device: 2148377056
Number of bitmaps: 28
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 2148368817
Root block: 8211
Filesystem is clean
Tree height: 2
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x168ed58c]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 2
inode generation number: 0
UUID: 10ae60ee-1abb-49d1-ae55-cf238626c0b5
LABEL: 
Set flags in SB:
        ATTRIBUTES CLEAN

Super block seems to be correct



Something seems seriously wrong here.
I'm happy to run any tests or try any patches, this system is mine to play with
until the end of the month.


Paul Slootman
