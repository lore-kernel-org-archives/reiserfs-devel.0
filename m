From: David Greaves <david@dgreaves.com>
Subject: HELP! Reiser 3.6 - attempt to access beyond end of device, then oops
 on mount
Date: Tue, 07 Sep 2004 21:39:29 +0100
Message-ID: <413E1C81.8000001@dgreaves.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21587-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi I first got this oops 'out of the blue'
Memtest seems to run fine
When rebooting and remounting, it now oopses every time I remount the fs

################################
First Oops:
Sep  7 20:32:04 cu kernel: attempt to access beyond end of device
Sep  7 20:32:04 cu kernel: dm-0: rw=0, want=1423563552, limit=1153433600
Sep  7 20:32:04 cu kernel: Buffer I/O error on device dm-0, logical 
block 2862300003
Sep  7 20:45:02 cu kernel: nfs warning: mount version older than kernel
Sep  7 20:45:02 cu last message repeated 4 times
Sep  7 20:56:33 cu kernel: Unable to handle kernel NULL pointer 
dereference at virtual address 000006d8
Sep  7 20:56:33 cu kernel:  printing eip:
Sep  7 20:56:33 cu kernel: c01955fd
Sep  7 20:56:33 cu kernel: *pde = 00000000
Sep  7 20:56:33 cu kernel: Oops: 0002 [#1]
Sep  7 20:56:33 cu kernel: CPU:    0
Sep  7 20:56:33 cu kernel: EIP:    
0060:[set_bit_in_list_bitmap+61/112]    Not tainted
Sep  7 20:56:33 cu kernel: EFLAGS: 00010286   (2.6.6)
Sep  7 20:56:33 cu kernel: EIP is at set_bit_in_list_bitmap+0x3d/0x70
Sep  7 20:56:33 cu kernel: eax: 00000000   ebx: 0001ca42   ecx: 
cec11200   edx: d1201918
Sep  7 20:56:33 cu kernel: esi: 000036d4   edi: d112d104   ebp: 
00000000   esp: cfe11a5c
Sep  7 20:56:33 cu kernel: ds: 007b   es: 007b   ss: 0068
Sep  7 20:56:33 cu kernel: Process kswapd0 (pid: 8, threadinfo=cfe10000 
task=cfe16b70)
Sep  7 20:56:33 cu kernel: Stack: d112d10c d112d10c e52136d4 cec11200 
c019a43b cec11200 e52136d4 d112d104
Sep  7 20:56:33 cu kernel:        c0174b2a cfe11de4 e52136d4 c573165c 
cfe10000 c0174b65 cfe11de4 cec11200
Sep  7 20:56:33 cu kernel:        e52136d4 e52136d4 00000268 c0191e74 
cfe11de4 e52136d4 cf17e330 c04be980
Sep  7 20:56:33 cu kernel: Call Trace:
Sep  7 20:56:33 cu kernel:  [journal_mark_freed+155/512] 
journal_mark_freed+0x9b/0x200
Sep  7 20:56:33 cu kernel:  [_reiserfs_free_block+314/336] 
_reiserfs_free_block+0x13a/0x150
Sep  7 20:56:33 cu kernel:  [reiserfs_free_block+37/64] 
reiserfs_free_block+0x25/0x40
Sep  7 20:56:33 cu kernel:  [prepare_for_delete_or_cut+1380/1920] 
prepare_for_delete_or_cut+0x564/0x780
Sep  7 20:56:33 cu kernel:  [ata_scsi_translate+173/240] 
ata_scsi_translate+0xad/0xf0
Sep  7 20:56:33 cu kernel:  [reiserfs_cut_from_item+191/1248] 
reiserfs_cut_from_item+0xbf/0x4e0
Sep  7 20:56:33 cu kernel:  [reiserfs_do_truncate+606/1328] 
reiserfs_do_truncate+0x25e/0x530
Sep  7 20:56:33 cu kernel:  [reiserfs_delete_object+61/112] 
reiserfs_delete_object+0x3d/0x70
Sep  7 20:56:33 cu kernel:  [reiserfs_delete_inode+130/192] 
reiserfs_delete_inode+0x82/0xc0
Sep  7 20:56:33 cu kernel:  [reiserfs_delete_inode+0/192] 
reiserfs_delete_inode+0x0/0xc0
Sep  7 20:56:33 cu kernel:  [generic_delete_inode+81/208] 
generic_delete_inode+0x51/0xd0
Sep  7 20:56:33 cu kernel:  [iput+85/128] iput+0x55/0x80
Sep  7 20:56:33 cu kernel:  [prune_dcache+249/304] prune_dcache+0xf9/0x130
Sep  7 20:56:33 cu kernel:  [shrink_dcache_memory+35/48] 
shrink_dcache_memory+0x23/0x30
Sep  7 20:56:33 cu kernel:  [shrink_slab+288/368] shrink_slab+0x120/0x170
Sep  7 20:56:33 cu kernel:  [balance_pgdat+513/624] 
balance_pgdat+0x201/0x270
Sep  7 20:56:33 cu kernel:  [kswapd+279/304] kswapd+0x117/0x130
Sep  7 20:56:33 cu kernel:  [autoremove_wake_function+0/80] 
autoremove_wake_function+0x0/0x50
Sep  7 20:56:33 cu kernel:  [autoremove_wake_function+0/80] 
autoremove_wake_function+0x0/0x50
Sep  7 20:56:33 cu kernel:  [kswapd+0/304] kswapd+0x0/0x130
Sep  7 20:56:33 cu kernel:  [kernel_thread_helper+5/20] 
kernel_thread_helper+0x5/0x14
Sep  7 20:56:33 cu kernel:
Sep  7 20:56:33 cu kernel: Code: 0f ab 30 8b 7c 24 0c 8b 5c 24 04 8b 74 
24 08 31 c0 83 c4 10
################################

reboot, mount filesystem, oops:
ReiserFS: dm-0: found reiserfs format "3.6" with standard journal
ReiserFS: dm-0: using ordered data mode
ReiserFS: dm-0: journal params: device dm-0, size 8192, journal first 
block 18, max trans len 1024, max batch 900, max commit age 30, max 
trans age 30
ReiserFS: dm-0: checking transaction log (dm-0)
ReiserFS: dm-0: Using r5 hash to sort names
ReiserFS: dm-0: Removing [243 454 0x0 SD]..<4>ReiserFS: dm-0: warning: 
vs-4075: reiserfs_free_block: block 3844159188 is out of range on dm-0
Unable to handle kernel paging request at virtual address 379df56e
 printing eip:
c019907a
*pde = 00000000
Oops: 0000 [#1]
Modules linked in: ipv6 e1000 usblp uhci_hcd usbcore ext3 jbd mbcache 
nfsd exportfs lockd sunrpc unix
CPU:    0
EIP:    0060:[<c019907a>]    Not tainted
EFLAGS: 00010206   (2.6.7)
EIP is at set_bit_in_list_bitmap+0x3a/0x70
eax: 379df56a   ebx: 000134e8   ecx: cffc3e00   edx: 379df56a
esi: 000044a7   edi: d115e0e4   ebp: 00000000   esp: cda71968
ds: 007b   es: 007b   ss: 0068
Process mount (pid: 1143, threadinfo=cda70000 task=cf867130)
Stack: c03367e1 d115e10c 9a7444a7 cffc3e00 c019df2b cffc3e00 9a7444a7 
d115e0e4
       c042b1a0 cda71d08 9a7444a7 00000001 cd0e0c8c c0177035 cda71d08 
cffc3e00
       9a7444a7 00000000 cda71d08 00000269 cd049658 cda70000 c01953ce 
cda71d08
Call Trace:
 [<c019df2b>] journal_mark_freed+0x9b/0x200
 [<c0177035>] reiserfs_free_block+0x35/0x60
 [<c01953ce>] prepare_for_delete_or_cut+0x58e/0x7a0
 [<c0279e40>] scsi_done+0x0/0x70
 [<c01963bf>] reiserfs_cut_from_item+0xbf/0x560
 [<c0196b50>] reiserfs_do_truncate+0x260/0x570
 [<c0195ecd>] reiserfs_delete_object+0x3d/0x70
 [<c017e542>] reiserfs_delete_inode+0x82/0xc0
 [<c01176e0>] printk+0x100/0x140
 [<c017e4c0>] reiserfs_delete_inode+0x0/0xc0
 [<c015e971>] generic_delete_inode+0x51/0xd0
 [<c015eb75>] iput+0x55/0x80
 [<c018a947>] finish_unfinished+0x1e7/0x350
 [<c018cb22>] reiserfs_fill_super+0x532/0x6e0
 [<c0181020>] reiserfs_init_locked_inode+0x0/0x20
 [<c0173969>] disk_name+0xa9/0xb0
 [<c014e715>] sb_set_blocksize+0x25/0x60
 [<c014e13d>] get_sb_bdev+0x11d/0x150
 [<c018cd3f>] get_super_block+0x2f/0x70
 [<c018c5f0>] reiserfs_fill_super+0x0/0x6e0
 [<c014e38f>] do_kern_mount+0x5f/0xe0
 [<c01610f8>] do_add_mount+0x78/0x170
 [<c01613f4>] do_mount+0x144/0x190
 [<c0161253>] copy_mount_options+0x63/0xc0
 [<c0161780>] sys_mount+0xa0/0xf0
 [<c0103efb>] syscall_call+0x7/0xb

Code: 8b 40 04 0f ab 30 8b 7c 24 0c 8b 5c 24 04 8b 74 24 08 31 c0


Help


David
