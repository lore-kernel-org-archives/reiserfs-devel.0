From: Lance Reed <lreed@ruckusnetwork.com>
Subject: Unable to rebuild bitmap.
Date: Tue, 04 Oct 2005 14:27:25 -0400
Message-ID: <4342C98D.2000901@ruckusnetwork.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26396-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I seem to be stuck in a catch 22 and can not seem to rebuild a bitmap.
reiserfsck --check says the bitmap is bad.
reiserfsck --rebuild-sb says it is ok.

I do seem some errors but can not seem to repair them..
"Fs state field: 0x1:
         some corruptions exist."

If I mount the filesystem and try to write to it, I get a kernel oops.

The Filesystem has recently been increased to just under 10 TB.

Anybody have any ideas?

TIA.

Lance

2 2.6.4-52-smp #1 SMP Wed Apr 7 02:11:20 UTC 2004 i686 i686 i386 GNU/Linux
SuSE Linux 9.1 (i586)
VERSION = 9.1
reiserfs-3.6.13-24
lvm2-2.00.09-12


livestore2:~ # reiserfsck --check  /dev/VG01/lvol0
......
Replaying journal..
Reiserfs journal '/dev/VG01/lvol0' in blocks [18..8211]: 0 transactions 
replayed
reiserfs_open_ondisk_bitmap: wrong either bitmaps number,
count of blocks or blocksize, run with --rebuild-sb to fix it
reiserfsck: Could not open bitmap
livestore2:~ # reiserfsck --rebuild-sb   /dev/VG01/lvol0
....
Will check superblock and rebuild it if needed
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
Reiserfs super block in block 16 on 0xfd00 of format 3.6 with standard 
journal
Count of blocks on the device: 2594701312
Number of bitmaps: 13648
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] 
blocks): 919312864
Root block: 23854440
Filesystem is clean
Tree height: 5
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x7c282a2f]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x1:
         some corruptions exist.
sb_version: 2
inode generation number: 51677
UUID: dfc4b601-40b9-44e4-b246-3cb4c96ac152
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN

Super block seems to be correct

If I mount and try try to write to the filesystem.

Oct  3 20:25:30 livestore2 kernel: Unable to handle kernel NULL pointer 
dereference at virtual address 00000c20
Oct  3 20:25:30 livestore2 kernel:  printing eip:
Oct  3 20:25:30 livestore2 kernel: f90a52aa
Oct  3 20:25:30 livestore2 kernel: *pde = 00000000
Oct  3 20:25:30 livestore2 kernel: Oops: 0000 [#1]
Oct  3 20:25:30 livestore2 kernel: SMP
Oct  3 20:25:30 livestore2 kernel: CPU:    1
Oct  3 20:25:30 livestore2 kernel: EIP:    
0060:[__crc_device_suspend+2410267/2709224]    Not tainted
Oct  3 20:25:30 livestore2 kernel: EIP:    0060:[<f90a52aa>]    Not tainted
Oct  3 20:25:30 livestore2 kernel: EFLAGS: 00010246   (2.6.4-52-smp)
Oct  3 20:25:30 livestore2 kernel: EIP is at 
scan_bitmap_block+0x1da/0x480 [reiserfs]
Oct  3 20:25:30 livestore2 kernel: eax: ffffffff   ebx: 00000c20   ecx: 
000000f8   edx: 00000000
Oct  3 20:25:30 livestore2 kernel: esi: f9376310   edi: 00000c20   ebp: 
00000000   esp: efadd930
Oct  3 20:25:30 livestore2 kernel: ds: 007b   es: 007b   ss: 0068
Oct  3 20:25:30 livestore2 kernel: Process rsync (pid: 4193, 
threadinfo=efadc000 task=f5f880b0)
Oct  3 20:25:30 livestore2 kernel: Stack: 0b000001 00000000 cdc2b380 
c0143a56 00006100 00000000 00000000 f9383118
Oct  3 20:25:30 livestore2 kernel:        00000000 f5c65800 efadd9e4 
0000da62 efaddf30 f90c14fa 00000080 0000da62
Oct  3 20:25:30 livestore2 kernel:        00008000 f5c65800 00000001 
f90a6105 00008000 00000001 00000001 00000000
Oct  3 20:25:30 livestore2 kernel: Call Trace:
Oct  3 20:25:30 livestore2 kernel:  [find_get_page+22/64] 
find_get_page+0x16/0x40
Oct  3 20:25:30 livestore2 kernel:  [<c0143a56>] find_get_page+0x16/0x40
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2525547/2709224] 
internal_insert_childs+0x1fa/0x210 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90c14fa>] 
internal_insert_childs+0x1fa/0x210 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2413942/2709224] 
reiserfs_allocate_blocknrs+0x3e5/0xc89 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90a6105>] 
reiserfs_allocate_blocknrs+0x3e5/0xc89 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2481484/2709224] get_far_parent+0x15b/0x350 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90b68db>] 
get_far_parent+0x15b/0x350 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2485508/2709224] get_empty_nodes+0xf3/0x1a0 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90b7893>] 
get_empty_nodes+0xf3/0x1a0 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2487055/2709224] fix_nodes+0x55e/0x1f30 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90b7e9e>] fix_nodes+0x55e/0x1f30 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2487640/2709224] fix_nodes+0x7a7/0x1f30 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90b80e7>] fix_nodes+0x7a7/0x1f30 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2539052/2709224] reiserfs_insert_item+0x18b/0x2f0 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90c49bb>] 
reiserfs_insert_item+0x18b/0x2f0 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2452812/2709224] reiserfs_new_inode+0x46b/0x9d0 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90af8db>] 
reiserfs_new_inode+0x46b/0x9d0 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2586603/2709224] open_xa_dir+0x26a/0x2a0 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90d037a>] open_xa_dir+0x26a/0x2a0 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [d_instantiate+84/96] 
d_instantiate+0x54/0x60
Oct  3 20:25:30 livestore2 kernel:  [<c017bcc4>] d_instantiate+0x54/0x60
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2440906/2709224] reiserfs_lookup+0x1e9/0x1f0 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90aca59>] 
reiserfs_lookup+0x1e9/0x1f0 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2436877/2709224] reiserfs_mkdir+0x1bc/0x350 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90aba9c>] 
reiserfs_mkdir+0x1bc/0x350 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [permission+98/128] 
permission+0x62/0x80
Oct  3 20:25:30 livestore2 kernel:  [<c0172852>] permission+0x62/0x80
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2436433/2709224] reiserfs_mkdir+0x0/0x350 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90ab8e0>] 
reiserfs_mkdir+0x0/0x350 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [vfs_mkdir+188/272] 
vfs_mkdir+0xbc/0x110
Oct  3 20:25:30 livestore2 kernel:  [<c0172bcc>] vfs_mkdir+0xbc/0x110
Oct  3 20:25:30 livestore2 kernel:  [sys_mkdir+166/240] sys_mkdir+0xa6/0xf0
Oct  3 20:25:30 livestore2 kernel:  [<c0175736>] sys_mkdir+0xa6/0xf0
Oct  3 20:25:30 livestore2 kernel:  [sys_write+56/96] sys_write+0x38/0x60
Oct  3 20:25:30 livestore2 kernel:  [<c0164b78>] sys_write+0x38/0x60
Oct  3 20:25:30 livestore2 kernel:  [sysenter_past_esp+82/121] 
sysenter_past_esp+0x52/0x79
Oct  3 20:25:30 livestore2 kernel:  [<c01091c9>] 
sysenter_past_esp+0x52/0x79
Oct  3 20:25:30 livestore2 kernel:
Oct  3 20:25:30 livestore2 kernel: Code: f3 af 74 09 33 47 fc 83 ef 04 
0f bc d0 29 df c1 e7 03 01 fa
Oct  3 20:25:30 livestore2 kernel:  <1>Unable to handle kernel NULL 
pointer dereference at virtual address 00000c20
Oct  3 20:25:30 livestore2 kernel:  printing eip:
Oct  3 20:25:30 livestore2 kernel: f90a52aa
Oct  3 20:25:30 livestore2 kernel: *pde = 00000000
Oct  3 20:25:30 livestore2 kernel: Oops: 0000 [#2]
Oct  3 20:25:30 livestore2 kernel: SMP
Oct  3 20:25:30 livestore2 kernel: CPU:    1
Oct  3 20:25:30 livestore2 kernel: EIP:    
0060:[__crc_device_suspend+2410267/2709224]    Not tainted
Oct  3 20:25:30 livestore2 kernel: EIP:    0060:[<f90a52aa>]    Not tainted
Oct  3 20:25:30 livestore2 kernel: EFLAGS: 00010246   (2.6.4-52-smp)
Oct  3 20:25:30 livestore2 kernel: EIP is at 
scan_bitmap_block+0x1da/0x480 [reiserfs]
Oct  3 20:25:30 livestore2 kernel: eax: ffffffff   ebx: 00000c20   ecx: 
000000f8   edx: 00000000
Oct  3 20:25:30 livestore2 kernel: esi: f9376310   edi: 00000c20   ebp: 
00000000   esp: ef9d990c
Oct  3 20:25:30 livestore2 kernel: ds: 007b   es: 007b   ss: 0068
Oct  3 20:25:30 livestore2 kernel: Process rsync (pid: 4199, 
threadinfo=ef9d8000 task=f658e620)
Oct  3 20:25:30 livestore2 kernel: Stack: 00000000 00000000 00000000 
00000000 00006100 00000000 00000000 00000000
Oct  3 20:25:30 livestore2 kernel:        00000000 f5c65800 ef9d99c0 
0000da62 ef9d9ef8 00000000 00000000 0000da62
Oct  3 20:25:30 livestore2 kernel:        00008000 f5c65800 00000001 
f90a6105 00008000 00000001 00000001 00000000
Oct  3 20:25:30 livestore2 kernel: Call Trace:
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2413942/2709224] 
reiserfs_allocate_blocknrs+0x3e5/0xc89 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90a6105>] 
reiserfs_allocate_blocknrs+0x3e5/0xc89 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2481484/2709224] get_far_parent+0x15b/0x350 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90b68db>] 
get_far_parent+0x15b/0x350 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2485508/2709224] get_empty_nodes+0xf3/0x1a0 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90b7893>] 
get_empty_nodes+0xf3/0x1a0 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2487055/2709224] fix_nodes+0x55e/0x1f30 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90b7e9e>] fix_nodes+0x55e/0x1f30 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2539052/2709224] reiserfs_insert_item+0x18b/0x2f0 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90c49bb>] 
reiserfs_insert_item+0x18b/0x2f0 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2452812/2709224] reiserfs_new_inode+0x46b/0x9d0 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90af8db>] 
reiserfs_new_inode+0x46b/0x9d0 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2430588/2709224] search_by_entry_key+0x1b/0x2d0 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90aa20b>] 
search_by_entry_key+0x1b/0x2d0 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  
[__crc_device_suspend+2438620/2709224] reiserfs_create+0xeb/0x210 
[reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [<f90ac16b>] 
reiserfs_create+0xeb/0x210 [reiserfs]
Oct  3 20:25:30 livestore2 kernel:  [permission+98/128] 
permission+0x62/0x80
Oct  3 20:25:30 livestore2 kernel:  [<c0172852>] permission+0x62/0x80
Oct  3 20:25:30 livestore2 kernel:  [vfs_create+197/288] 
vfs_create+0xc5/0x120
Oct  3 20:25:30 livestore2 kernel:  [<c0172e45>] vfs_create+0xc5/0x120
Oct  3 20:25:30 livestore2 kernel:  [open_namei+764/976] 
open_namei+0x2fc/0x3d0
Oct  3 20:25:30 livestore2 kernel:  [<c0174f4c>] open_namei+0x2fc/0x3d0
Oct  3 20:25:30 livestore2 kernel:  [filp_open+40/80] filp_open+0x28/0x50
Oct  3 20:25:30 livestore2 kernel:  [<c0162468>] filp_open+0x28/0x50
Oct  3 20:25:30 livestore2 kernel:  [sys_open+77/144] sys_open+0x4d/0x90
Oct  3 20:25:30 livestore2 kernel:  [<c01624dd>] sys_open+0x4d/0x90
Oct  3 20:25:30 livestore2 kernel:  [sysenter_past_esp+82/121] 
sysenter_past_esp+0x52/0x79
Oct  3 20:25:30 livestore2 kernel:  [<c01091c9>] 
sysenter_past_esp+0x52/0x79
Oct  3 20:25:30 livestore2 kernel:
Oct  3 20:25:30 livestore2 kernel: Code: f3 af 74 09 33 47 fc 83 ef 04 
0f bc d0 29 df c1 e7 03 01 fa
Oct  3 20:27:36 livestore2 sm-notify[3328]: Unable to notify 
192.168.103.4, giving up
Oct  3 20:27:36 livestore2 sm-notify[3328]: Unable to notify 
192.168.103.3, giving up

livestore2:~ #
livestore2:~ # tail -f /var/log/messages
Oct  3 20:25:30 livestore2 kernel:  [filp_open+40/80] filp_open+0x28/0x50
Oct  3 20:25:30 livestore2 kernel:  [<c0162468>] filp_open+0x28/0x50
Oct  3 20:25:30 livestore2 kernel:  [sys_open+77/144] sys_open+0x4d/0x90
Oct  3 20:25:30 livestore2 kernel:  [<c01624dd>] sys_open+0x4d/0x90
Oct  3 20:25:30 livestore2 kernel:  [sysenter_past_esp+82/121] 
sysenter_past_esp+0x52/0x79
Oct  3 20:25:30 livestore2 kernel:  [<c01091c9>] 
sysenter_past_esp+0x52/0x79
Oct  3 20:25:30 livestore2 kernel:
Oct  3 20:25:30 livestore2 kernel: Code: f3 af 74 09 33 47 fc 83 ef 04 
0f bc d0 29 df c1 e7 03 01 fa
-- 

2 2.6.4-52-smp #1 SMP Wed Apr 7 02:11:20 UTC 2004 i686 i686 i386 GNU/Linux
SuSE Linux 9.1 (i586)
VERSION = 9.1
reiserfs-3.6.13-24
lvm2-2.00.09-12


