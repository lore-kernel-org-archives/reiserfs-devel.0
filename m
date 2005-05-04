From: Greg Burri <greg@euphorik.ch>
Subject: My reiserfs module crash...
Date: Thu, 05 May 2005 01:03:37 +0200
Message-ID: <427954C9.9090004@euphorik.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23982-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi everybody !
I have a big trouble with my reiserfs partition :/, I wish that someone 
can help me. so I'll expose my problem.
(I'm don't know very well english so I'll to make the better I can, 
sorry in advance)

So. I use reiserfs 3.6.19 under a Debian sarge Linux distribution, I use 
the kernel 2.6.11 (but the bug appeared with a 2.6.8 too).
When I try to mount my partition the reiserfs module crash like that :

#> mount -t reiserfs /dev/sda1 /var/data/
ReiserFS: sda1: found reiserfs format "3.6" with standard journal
hpt374: Abort called pid: 46 target: 0 lun: 0 flags: 1 reason 0
hpt374: Reset called pid: 46 target: 0 lun: 0 flags: 1
hpt374: Abort called pid: 47 target: 0 lun: 0 flags: 1 reason 0
hpt374: Reset called pid: 47 target: 0 lun: 0 flags: 1
hpt374: Abort called pid: 49 target: 0 lun: 0 flags: 1 reason 0
hpt374: Reset called pid: 49 target: 0 lun: 0 flags: 1
hpt374: Abort called pid: 50 target: 0 lun: 0 flags: 1 reason 0
hpt374: Reset called pid: 50 target: 0 lun: 0 flags: 1
hpt374: Abort called pid: 52 target: 0 lun: 0 flags: 1 reason 0
hpt374: Reset called pid: 52 target: 0 lun: 0 flags: 1
hpt374: Abort called pid: 53 target: 0 lun: 0 flags: 1 reason 0
hpt374: Reset called pid: 53 target: 0 lun: 0 flags: 1
hpt374: Abort called pid: 55 target: 0 lun: 0 flags: 1 reason 0
hpt374: Reset called pid: 55 target: 0 lun: 0 flags: 1
hpt374: Abort called pid: 56 target: 0 lun: 0 flags: 1 reason 0
hpt374: Reset called pid: 56 target: 0 lun: 0 flags: 1
ReiserFS: sda1: using ordered data mode
ReiserFS: sda1: journal params: device sda1, size 8192, journal first 
block 18, max trans len 1024, max batch 900, max commit age 30, max 
trans age 30
ReiserFS: sda1: checking transaction log (sda1)
ReiserFS: warning: is_tree_node: node level 0 does not match to the 
expected one 65534
ReiserFS: sda1: warning: vs-5150: search_by_key: invalid format found in 
block 0. Fsck?
ReiserFS: sda1: warning: vs-13070: reiserfs_read_locked_inode: i/o 
failure occurred trying to find stat data of [1 2 0x0 SD]
ReiserFS: sda1: Using r5 hash to sort names
------------[ cut here ]------------
kernel BUG at fs/reiserfs/journal.c:2858!
invalid operand: 0000 [#1]
Modules linked in: reiserfs ipv6 evdev pcspkr parport_pc parport 8139cp 
i2c_viapro i2c_core pci_hotplug via_agp uhci_hcd usbcore 8139too mii 
agpgart sd_mod capability commoncap hpt374 scsi_mod psmouse ide_cd cdrom 
genrtc ext3 jbd mbcache ide_disk ide_generic via82cxxx trm290 triflex 
slc90e66 sis5513 siimage serverworks sc1200 rz1000 piix pdc202xx_old 
opti621 ns87415 hpt366 hpt34x generic cy82c693 cs5530 cs5520 cmd64x 
atiixp amd74xx alim15x3 aec62xx pdc202xx_new unix fbcon font bitblit 
vesafb cfbcopyarea cfbimgblt cfbfillrect ide_core
CPU:    0
EIP:    0060:[<e8b22ae6>]    Tainted: PF     VLI
EFLAGS: 00010246   (2.6.11-1-686)
EIP is at journal_mark_dirty+0x216/0x270 [reiserfs]
eax: 00000000   ebx: e480e600   ecx: 00000002   edx: c174be34
esi: e480e600   edi: e8a84000   ebp: e47cb730   esp: c174bdb0
ds: 007b   es: 007b   ss: 0068
Process mount (pid: 3075, threadinfo=c174a000 task=c17dd0a0)
Stack: e480e600 e3670db0 c174a000 c174be34 e480e600 c174be10 e8b2283e 
c174be34
       00000002 00000000 e7f18120 e480e600 c174be34 00000001 e8b11bc6 
c174be34
       e480e600 e47cb730 e8b04ee0 c174be10 c174be20 00000000 e43ea000 
00000000
Call Trace:
 [<e8b2283e>] journal_begin+0x6e/0x100 [reiserfs]
 [<e8b11bc6>] reiserfs_fill_super+0x576/0x770 [reiserfs]
 [<e8b04ee0>] reiserfs_init_locked_inode+0x0/0x20 [reiserfs]
 [<c01b6b27>] snprintf+0x27/0x30
 [<c01584ae>] sb_set_blocksize+0x2e/0x60
 [<c0157de0>] get_sb_bdev+0x100/0x150
 [<c016bfe0>] alloc_vfsmnt+0x90/0xd0
 [<e8b127b0>] get_super_block+0x30/0x34 [reiserfs]
 [<e8b11650>] reiserfs_fill_super+0x0/0x770 [reiserfs]
 [<c0158090>] do_kern_mount+0xa0/0x170
 [<c016d0c7>] do_new_mount+0x77/0xc0
 [<c016d714>] do_mount+0x174/0x1c0
 [<c016d543>] copy_mount_options+0x63/0xc0
 [<c016daca>] sys_mount+0x9a/0xe0
 [<c0102f33>] syscall_call+0x7/0xb
Code: 83 47 2c 12 8b 42 08 e9 31 ff ff ff 8b 47 30 bd 00 b0 b2 e8 89 6c 
24 04 89 1c 24 89 44 24 08 e8 51 0a ff ff ba 01 00 00 00 eb bd <0f> 0b 
2a 0b 35 c4 b2 e8 e9 0a fe ff ff 89 54 24 0c 8b 54 24 3c

(hpt374 is the driver for my sata-card)
My partition was in good health but a day I don't know why I had this 
message when I was mounting /dev/sda1 ...
I already try reiserfsck but without success :'( I don't know what can I 
do to repair that.

Please help me,
Thx

Greg Burri
