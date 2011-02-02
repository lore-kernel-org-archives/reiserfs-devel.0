From: Andrew Saunders <saunders@pagpaintball.com>
Subject: Reiser4 oops when compiling
Date: Wed, 02 Feb 2011 09:00:53 -0400
Message-ID: <4D495585.40803@pagpaintball.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org


I was compiling kde4.6 when I was given this oops

Jan 30 18:55:18 hedgehog kernel: BUG: unable to handle kernel NULL 
pointer dereference at           (null)
Jan 30 18:55:18 hedgehog kernel: IP: [<ffffffff81168014>] 
reiser4_tree_by_page+0x4/0x20
Jan 30 18:55:18 hedgehog kernel: PGD 90b7f067 PUD 277f3067 PMD 0
Jan 30 18:55:18 hedgehog kernel: Oops: 0000 [#1] PREEMPT SMP
Jan 30 18:55:18 hedgehog kernel: last sysfs file: 
/sys/devices/pci0000:00/0000:00:18.3/temp3_input
Jan 30 18:55:18 hedgehog kernel: CPU 1
Jan 30 18:55:18 hedgehog kernel: Modules linked in: usb_storage vmnet 
vmblock vsock vmci vmmon cifs snd_seq snd_pcm_oss snd_mixer_oss 
snd_usb_audio snd_hwdep snd_usbmidi_lib snd_rawmidi snd_seq_device 
usbhid gspca_ov519 gspca_main videodev v4l1_compat v4l2_compat_ioctl32 
fuse tun bridge stp llc it87 hwmon_vid loop snd_hda_codec_analog 
nvidia(P) ohci_hcd ehci_hcd snd_hda_intel snd_hda_codec snd_pcm 
snd_timer snd k8temp snd_page_alloc i2c_nforce2 evdev i2c_core forcedeth
Jan 30 18:55:18 hedgehog kernel:
Jan 30 18:55:18 hedgehog kernel: Pid: 18388, comm: sh Tainted: 
P            2.6.37-ck1 #2 M2N-SLI DELUXE/System Product Name
Jan 30 18:55:18 hedgehog kernel: RIP: 0010:[<ffffffff81168014>]  
[<ffffffff81168014>] reiser4_tree_by_page+0x4/0x20
Jan 30 18:55:18 hedgehog kernel: RSP: 0018:ffff88009d3f7a90  EFLAGS: 
00010292
Jan 30 18:55:18 hedgehog kernel: RAX: 0000000000000000 RBX: 
ffffea000200cbd0 RCX: 0000000000000000
Jan 30 18:55:18 hedgehog kernel: RDX: 0000000000000000 RSI: 
0000000000000000 RDI: ffffea000200cbd0
Jan 30 18:55:18 hedgehog kernel: RBP: ffffea000200cbd0 R08: 
0000000000000020 R09: 0000000000000026
Jan 30 18:55:18 hedgehog kernel: R10: 0000000000000000 R11: 
0000000000000001 R12: ffff88009d3f7be0
Jan 30 18:55:18 hedgehog kernel: R13: ffff880017196c70 R14: 
ffff8800d24383ec R15: 0000000000000001
Jan 30 18:55:18 hedgehog kernel: FS:  00007f4464cf4700(0000) 
GS:ffff8800dfd00000(0000) knlGS:00000000f7035710
Jan 30 18:55:18 hedgehog kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 
000000008005003b
Jan 30 18:55:18 hedgehog kernel: CR2: 0000000000000000 CR3: 
00000000b778d000 CR4: 00000000000006e0
Jan 30 18:55:18 hedgehog kernel: DR0: 0000000000000000 DR1: 
0000000000000000 DR2: 0000000000000000
Jan 30 18:55:18 hedgehog kernel: DR3: 0000000000000000 DR6: 
00000000ffff0ff0 DR7: 0000000000000400
Jan 30 18:55:18 hedgehog kernel: Process sh (pid: 18388, threadinfo 
ffff88009d3f6000, task ffff8800c38a4140)
Jan 30 18:55:18 hedgehog kernel: Stack:
Jan 30 18:55:18 hedgehog kernel: ffffffff81150aca ffff88009d3f7be0 
ffffea000200cbd0 ffff88009d3f7ba8
Jan 30 18:55:18 hedgehog kernel: ffff88009d3f7be0 ffff880017196c70 
ffff8800d24383ec 0000000000000001
Jan 30 18:55:18 hedgehog kernel: ffffffff811766e5 ffff880000000002 
0000000000000002 ffff880000000002
Jan 30 18:55:18 hedgehog kernel: Call Trace:
Jan 30 18:55:18 hedgehog kernel: [<ffffffff81150aca>] ? 
jnode_of_page+0x2a/0x2b0
Jan 30 18:55:18 hedgehog kernel: [<ffffffff811766e5>] ? 
uf_readpages_filler+0x225/0x2d0
Jan 30 18:55:18 hedgehog kernel: [<ffffffff811764c0>] ? 
uf_readpages_filler+0x0/0x2d0
Jan 30 18:55:18 hedgehog kernel: [<ffffffff811764c0>] ? 
uf_readpages_filler+0x0/0x2d0
Jan 30 18:55:18 hedgehog kernel: [<ffffffff81096331>] ? 
read_cache_pages+0xa1/0x100
Jan 30 18:55:18 hedgehog kernel: [<ffffffff81176466>] ? 
readpages_unix_file+0x56/0xb0
Jan 30 18:55:18 hedgehog kernel: [<ffffffff81095c95>] ? 
__do_page_cache_readahead+0x155/0x230
Jan 30 18:55:18 hedgehog kernel: [<ffffffff81095d8c>] ? ra_submit+0x1c/0x30
Jan 30 18:55:18 hedgehog kernel: [<ffffffff8108d6c0>] ? 
filemap_fault+0x4b0/0x4c0
Jan 30 18:55:18 hedgehog kernel: [<ffffffff81056535>] ? 
sched_clock_local+0x15/0x80
Jan 30 18:55:18 hedgehog kernel: [<ffffffff810a58c2>] ? 
__do_fault+0x52/0x4b0
Jan 30 18:55:18 hedgehog kernel: [<ffffffff810a7c76>] ? 
handle_mm_fault+0x186/0x860
Jan 30 18:55:18 hedgehog kernel: [<ffffffff8109fc88>] ? 
vma_prio_tree_insert+0x28/0x120
Jan 30 18:55:18 hedgehog kernel: [<ffffffff81026c06>] ? 
do_page_fault+0x146/0x430
Jan 30 18:55:18 hedgehog kernel: [<ffffffff810ae3de>] ? 
mmap_region+0x23e/0x530
Jan 30 18:55:18 hedgehog kernel: [<ffffffff814590cf>] ? page_fault+0x1f/0x30
Jan 30 18:55:18 hedgehog kernel: Code: 48 8b 04 25 80 b5 00 00 48 8b 80 
58 04 00 00 48 85 c0 0f 84 40 ff ff ff 8b b0 e8 00 00 00 e9 3c ff ff ff 
90 90 90 90 48 8b 47 18 <48> 8b 00 48 8b 80 10 01 00 00 48 8b 80 70 02 
00 00 48 83 c0 20
Jan 30 18:55:18 hedgehog kernel: RIP  [<ffffffff81168014>] 
reiser4_tree_by_page+0x4/0x20
Jan 30 18:55:18 hedgehog kernel: RSP <ffff88009d3f7a90>
Jan 30 18:55:18 hedgehog kernel: CR2: 0000000000000000
Jan 30 18:55:18 hedgehog kernel: ---[ end trace 83af578b5d964aa3 ]---
Jan 30 18:55:18 hedgehog kernel: reiser4[sh(18388)]: release_unix_file 
(fs/reiser4/plugin/file/file.c:2323)[vs-44]:
Jan 30 18:55:18 hedgehog kernel: WARNING: out of memory?
Jan 30 18:58:14 hedgehog kernel: general protection fault: 0000 [#2] 
PREEMPT SMP
Jan 30 18:58:14 hedgehog kernel: last sysfs file: 
/sys/devices/pci0000:00/0000:00:18.3/temp3_input
Jan 30 18:58:14 hedgehog kernel: CPU 1
Jan 30 18:58:14 hedgehog kernel: Modules linked in: usb_storage vmnet 
vmblock vsock vmci vmmon cifs snd_seq snd_pcm_oss snd_mixer_oss 
snd_usb_audio snd_hwdep snd_usbmidi_lib snd_rawmidi snd_seq_device 
usbhid gspca_ov519 gspca_main videodev v4l1_compat v4l2_compat_ioctl32 
fuse tun bridge stp llc it87 hwmon_vid loop snd_hda_codec_analog 
nvidia(P) ohci_hcd ehci_hcd snd_hda_intel snd_hda_codec snd_pcm 
snd_timer snd k8temp snd_page_alloc i2c_nforce2 evdev i2c_core forcedeth
Jan 30 18:58:14 hedgehog kernel:
Jan 30 18:58:14 hedgehog kernel: Pid: 24060, comm: x86_64-pc-linux 
Tainted: P      D     2.6.37-ck1 #2 M2N-SLI DELUXE/System Product Name
Jan 30 18:58:14 hedgehog kernel: RIP: 0010:[<ffffffff811566ec>]  
[<ffffffff811566ec>] wake_up_all_lopri_owners+0x2c/0x90
Jan 30 18:58:14 hedgehog kernel: RSP: 0018:ffff8800c1a79338  EFLAGS: 
00010282
Jan 30 18:58:14 hedgehog kernel: RAX: 2a39cca0ff6c7626 RBX: 
2a39cca0ff6c75fe RCX: ffff8800d398ee30
Jan 30 18:58:14 hedgehog kernel: RDX: 00000000dfe267c2 RSI: 
0000000000000001 RDI: ffff8800d398ed80
Jan 30 18:58:14 hedgehog kernel: RBP: 0000000000000002 R08: 
0000000000000001 R09: 0000000000000040
Jan 30 18:58:14 hedgehog kernel: R10: ffff8800815f8a50 R11: 
ffff8800815f8d48 R12: ffff8800d398ee48
Jan 30 18:58:14 hedgehog kernel: R13: 0000000000000000 R14: 
ffff880112375d08 R15: 0000000000000000
Jan 30 18:58:14 hedgehog kernel: FS:  00007f3575ffa700(0000) 
GS:ffff8800dfd00000(0000) knlGS:00000000f7035710
Jan 30 18:58:14 hedgehog kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 
000000008005003b
Jan 30 18:58:14 hedgehog kernel: CR2: 00007f357524a004 CR3: 
00000000bb033000 CR4: 00000000000006e0
Jan 30 18:58:14 hedgehog kernel: DR0: 0000000000000000 DR1: 
0000000000000000 DR2: 0000000000000000
Jan 30 18:58:14 hedgehog kernel: DR3: 0000000000000000 DR6: 
00000000ffff0ff0 DR7: 0000000000000400
Jan 30 18:58:14 hedgehog kernel: Process x86_64-pc-linux (pid: 24060, 
threadinfo ffff8800c1a78000, task ffff8800c38a20a0)
Jan 30 18:58:14 hedgehog kernel: Stack:
Jan 30 18:58:14 hedgehog kernel: ffff8800d398ed80 0000000000000002 
ffff880112375d00 ffffffff81156c1a
Jan 30 18:58:14 hedgehog kernel: ffff8800ffffffff ffffffff810cc3e7 
ffff8800d3b49180 ffff8800d398ee30
Jan 30 18:58:14 hedgehog kernel: ffff880112375d78 ffff8800d398edd0 
ffff880112375d28 0178383600000001
Jan 30 18:58:14 hedgehog kernel: Call Trace:
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81156c1a>] ? 
longterm_lock_znode+0x4ca/0x590
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810cc3e7>] ? 
inode_sub_bytes+0x27/0x90
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8116c425>] ? 
lock_neighbor+0x95/0x190
Jan 30 18:58:14 hedgehog kernel: [<ffffffff811837f0>] ? kill_head+0x0/0x20
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8116c574>] ? 
reiser4_get_parent_flags+0x54/0x90
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81152c37>] ? 
lock_carry_node+0x137/0x330
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8115e0fa>] ? 
znode_make_dirty+0x7a/0xd0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8115394c>] ? 
reiser4_carry+0x8c/0x2e0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81158c33>] ? 
kill_node_content+0x123/0x1d0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81158ec9>] ? 
cut_tree_worker_common+0x1e9/0x4d0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81091e3b>] ? 
zone_watermark_ok+0x1b/0xd0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81158ce0>] ? 
cut_tree_worker_common+0x0/0x4d0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81157291>] ? 
reiser4_cut_tree_object+0x121/0x250
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81157412>] ? 
reiser4_cut_tree+0x52/0x80
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81179cb5>] ? replace+0xa5/0x160
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8117a8d3>] ? 
tail2extent+0x503/0x6f0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8108c81e>] ? 
find_get_pages+0x9e/0x110
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8114f549>] ? 
reiser4_preempt_point+0x9/0x30
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81177b98>] ? unpack+0x108/0x120
Jan 30 18:58:14 hedgehog kernel: [<ffffffff811782e1>] ? 
mmap_unix_file+0x111/0x140
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8117adda>] ? 
reiser4_mmap_careful+0x5a/0x150
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810ae51a>] ? 
mmap_region+0x37a/0x530
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8110c680>] ? elf_map+0x1a0/0x1d0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8110cc33>] ? 
load_elf_binary+0x583/0x1c00
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810a8465>] ? 
__get_user_pages+0x115/0x410
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810cf42e>] ? 
get_arg_page+0x9e/0xd0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810cde31>] ? 
search_binary_handler+0x101/0x310
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8110c6b0>] ? 
load_elf_binary+0x0/0x1c00
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810cfdaf>] ? 
do_execve+0x21f/0x2b0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8100a914>] ? sys_execve+0x44/0x70
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810028dc>] ? 
stub_execve+0x6c/0xc0
Jan 30 18:58:14 hedgehog kernel: Code: 54 55 53 8b 87 b0 00 00 00 89 c2 
c1 fa 08 38 c2 74 76 48 8b 9f c8 00 00 00 4c 8d a7 c8 00 00 00 48 83 eb 
28 eb 05 90 48 8d 58 d8 <48> 8b 43 28 48 8d 53 28 49 39 d4 0f 18 08 74 
44 8b 13 85 d2 75
Jan 30 18:58:14 hedgehog kernel: RIP  [<ffffffff811566ec>] 
wake_up_all_lopri_owners+0x2c/0x90
Jan 30 18:58:14 hedgehog kernel: RSP <ffff8800c1a79338>
Jan 30 18:58:14 hedgehog kernel: ---[ end trace 83af578b5d964aa4 ]---
Jan 30 18:58:14 hedgehog kernel: note: x86_64-pc-linux[24060] exited 
with preempt_count 1
Jan 30 18:58:14 hedgehog kernel: BUG: scheduling while atomic: 
x86_64-pc-linux/24060/0x00000002
Jan 30 18:58:14 hedgehog kernel: Modules linked in: usb_storage vmnet 
vmblock vsock vmci vmmon cifs snd_seq snd_pcm_oss snd_mixer_oss 
snd_usb_audio snd_hwdep snd_usbmidi_lib snd_rawmidi snd_seq_device 
usbhid gspca_ov519 gspca_main videodev v4l1_compat v4l2_compat_ioctl32 
fuse tun bridge stp llc it87 hwmon_vid loop snd_hda_codec_analog 
nvidia(P) ohci_hcd ehci_hcd snd_hda_intel snd_hda_codec snd_pcm 
snd_timer snd k8temp snd_page_alloc i2c_nforce2 evdev i2c_core forcedeth
Jan 30 18:58:14 hedgehog kernel: Pid: 24060, comm: x86_64-pc-linux 
Tainted: P      D     2.6.37-ck1 #2
Jan 30 18:58:14 hedgehog kernel: Call Trace:
Jan 30 18:58:14 hedgehog kernel: [<ffffffff814568f3>] ? schedule+0xb33/0xb50
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8126be2c>] ? string+0x4c/0xe0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff812d2c5c>] ? 
vt_console_print+0x7c/0x3b0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81036a0b>] ? 
__call_console_drivers+0x6b/0x80
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8105557d>] ? up+0xd/0x40
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81036f6b>] ? 
release_console_sem+0x19b/0x1e0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8145841d>] ? 
rwsem_down_failed_common+0xbd/0x150
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8126e3e4>] ? 
call_rwsem_down_read_failed+0x14/0x30
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81457a1e>] ? down_read+0xe/0x10
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810687b1>] ? 
acct_collect+0x41/0x1a0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8103a761>] ? do_exit+0x6d1/0x7f0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff814558c7>] ? printk+0x40/0x45
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810377ac>] ? kmsg_dump+0x7c/0x150
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810066b2>] ? oops_end+0x72/0xa0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8145909f>] ? 
general_protection+0x1f/0x30
Jan 30 18:58:14 hedgehog kernel: [<ffffffff811566ec>] ? 
wake_up_all_lopri_owners+0x2c/0x90
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81156c1a>] ? 
longterm_lock_znode+0x4ca/0x590
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810cc3e7>] ? 
inode_sub_bytes+0x27/0x90
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8116c425>] ? 
lock_neighbor+0x95/0x190
Jan 30 18:58:14 hedgehog kernel: [<ffffffff811837f0>] ? kill_head+0x0/0x20
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8116c574>] ? 
reiser4_get_parent_flags+0x54/0x90
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81152c37>] ? 
lock_carry_node+0x137/0x330
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8115e0fa>] ? 
znode_make_dirty+0x7a/0xd0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8115394c>] ? 
reiser4_carry+0x8c/0x2e0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81158c33>] ? 
kill_node_content+0x123/0x1d0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81158ec9>] ? 
cut_tree_worker_common+0x1e9/0x4d0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81091e3b>] ? 
zone_watermark_ok+0x1b/0xd0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81158ce0>] ? 
cut_tree_worker_common+0x0/0x4d0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81157291>] ? 
reiser4_cut_tree_object+0x121/0x250
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81157412>] ? 
reiser4_cut_tree+0x52/0x80
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81179cb5>] ? replace+0xa5/0x160
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8117a8d3>] ? 
tail2extent+0x503/0x6f0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8108c81e>] ? 
find_get_pages+0x9e/0x110
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8114f549>] ? 
reiser4_preempt_point+0x9/0x30
Jan 30 18:58:14 hedgehog kernel: [<ffffffff81177b98>] ? unpack+0x108/0x120
Jan 30 18:58:14 hedgehog kernel: [<ffffffff811782e1>] ? 
mmap_unix_file+0x111/0x140
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8117adda>] ? 
reiser4_mmap_careful+0x5a/0x150
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810ae51a>] ? 
mmap_region+0x37a/0x530
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8110c680>] ? elf_map+0x1a0/0x1d0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8110cc33>] ? 
load_elf_binary+0x583/0x1c00
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810a8465>] ? 
__get_user_pages+0x115/0x410
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810cf42e>] ? 
get_arg_page+0x9e/0xd0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810cde31>] ? 
search_binary_handler+0x101/0x310
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8110c6b0>] ? 
load_elf_binary+0x0/0x1c00
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810cfdaf>] ? 
do_execve+0x21f/0x2b0
Jan 30 18:58:14 hedgehog kernel: [<ffffffff8100a914>] ? sys_execve+0x44/0x70
Jan 30 18:58:14 hedgehog kernel: [<ffffffff810028dc>] ? 
stub_execve+0x6c/0xc0

I usually use the zen kernel but decided to try just ck+reiser4 on this 
one to weed out any abnormalities.

And on a side note I still have this bug which has persisted the last 
few kernels.
https://bugs.kde.org/show_bug.cgi?id=251392
This may be a kde bug, not entirely sure, but it only happens on reiser4 
partitions.

Thanks.


