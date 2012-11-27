From: Arend Freije <afreije@inn.nl>
Subject: Reiser4: BUG: unable to handle kernel NULL pointer dereference
Date: Tue, 27 Nov 2012 14:01:05 +0100
Message-ID: <50B4B991.2050604@inn.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hi,

Since the adaption of Reiser4 for VFS my system has become less stable. 
The filesystems get corrupted, files lost. e.g./etc/passwd recently, :(
, kernel Oopses and NULL pointer dereferences in the kernel. I converted 
the Reiser4 partitions to ext4, and the system has become stable.
Mount options were pretty straightforward, with noatime, and no 
encryption nor compression.
Unfortunately I have no time to play around with debugging, so I'll 
stick to ext4 for the moment.

The NULL pointer dereference traces look like this:

ov 26 11:31:05 afdesk02 kernel: [15780.132525] BUG: unable to handle 
kernel NULL pointer dereference at 0000000000000052
Nov 26 11:31:05 afdesk02 kernel: [15780.132655] IP: [<ffffffff813ceb18>] 
_raw_spin_lock+0x18/0x40
Nov 26 11:31:05 afdesk02 kernel: [15780.132752] PGD 1132f4067 PUD 
11655b067 PMD 0
Nov 26 11:31:05 afdesk02 kernel: [15780.132841] Oops: 0002 [#4] PREEMPT SMP
Nov 26 11:31:05 afdesk02 kernel: [15780.132921] Modules linked in: ipv6 
af_packet dm_mod radeonfb fb_ddc intel_agp intel_gtt rtc joydev 
hid_sunplus usbhid hid radeon 8250_pnp ppdev parport_pc powernow_k8 ttm 
mperf drm_kms_helper ohci_hcd 8250 snd_hda_codec_hdmi serial_core 
ata_generic pata_acpi drm kvm snd_hda_codec_via parport processor button 
ghash_clmulni_intel snd_hda_intel sg xhci_hcd pata_atiixp snd_hda_codec 
i2c_algo_bit r8169 cfbcopyarea ehci_hcd evdev i2c_piix4 cfbimgblt 
cfbfillrect pcspkr snd_hwdep psmouse shpchp snd_pcm usbcore serio_raw 
cryptd pci_hotplug usb_common snd_timer snd mii soundcore microcode 
snd_page_alloc unix
Nov 26 11:31:05 afdesk02 kernel: [15780.134068] CPU 0
Nov 26 11:31:05 afdesk02 kernel: [15780.134104] Pid: 3779, comm: 
flush-9:1 Tainted: G      D      3.6.4-reiser4 #1 System manufacturer 
System Product Name/M5A78L-M/USB3
Nov 26 11:31:05 afdesk02 kernel: [15780.134280] RIP: 
0010:[<ffffffff813ceb18>]  [<ffffffff813ceb18>] _raw_spin_lock+0x18/0x40
Nov 26 11:31:05 afdesk02 kernel: [15780.134406] RSP: 
0018:ffff8801010d9af0  EFLAGS: 00010202
Nov 26 11:31:05 afdesk02 kernel: [15780.134485] RAX: 0000000000000100 
RBX: ffffea0004169b40 RCX: 0000000000000000
Nov 26 11:31:05 afdesk02 kernel: [15780.134587] RDX: ffffea0004169b40 
RSI: ffff8801010d9aa0 RDI: 0000000000000052
Nov 26 11:31:05 afdesk02 kernel: [15780.134688] RBP: ffff8801010d9af0 
R08: 0000000000003280 R09: 0000000000000000
Nov 26 11:31:05 afdesk02 kernel: [15780.134789] R10: 0000000000000000 
R11: 0000000000000006 R12: 0000000000000002
Nov 26 11:31:05 afdesk02 kernel: [15780.134889] R13: 0000000000000052 
R14: ffff88010b762900 R15: ffff8801097cda20
Nov 26 11:31:05 afdesk02 kernel: [15780.134991] FS: 
00007f27d0fec880(0000) GS:ffff88011ec00000(0000) knlGS:0000000000000000
Nov 26 11:31:05 afdesk02 kernel: [15780.135106] CS:  0010 DS: 0000 ES: 
0000 CR0: 000000008005003b
Nov 26 11:31:05 afdesk02 kernel: [15780.135198] CR2: 0000000000000052 
CR3: 0000000113fc9000 CR4: 00000000000407f0
Nov 26 11:31:05 afdesk02 kernel: [15780.135300] DR0: 0000000000000000 
DR1: 0000000000000000 DR2: 0000000000000000
Nov 26 11:31:05 afdesk02 kernel: [15780.135401] DR3: 0000000000000000 
DR6: 00000000ffff0ff0 DR7: 0000000000000400
Nov 26 11:31:05 afdesk02 kernel: [15780.135502] Process flush-9:1 (pid: 
3779, threadinfo ffff8801010d8000, task ffff880119fa2520)
Nov 26 11:31:05 afdesk02 kernel: [15780.135621] Stack:
Nov 26 11:31:05 afdesk02 kernel: [15780.135654]  ffff8801010d9ba0 
ffffffff81197305 0000000000000001 ffff880100000000
Nov 26 11:31:05 afdesk02 kernel: [15780.135784]  ffff8801010d9d10 
0000000000001d70 ffff8801097cd8c8 ffff8801097cd7c0
Nov 26 11:31:05 afdesk02 kernel: [15780.135915]  ffff880119fa2520 
0000000000005079 ffff8801097cda10 ffff8801097cd838
Nov 26 11:31:05 afdesk02 kernel: [15780.136044] Call Trace:
Nov 26 11:31:05 afdesk02 kernel: [15780.136088] [<ffffffff81197305>] 
writepages_unix_file+0x305/0x4e0
Nov 26 11:31:05 afdesk02 kernel: [15780.136183] [<ffffffff8118e045>] 
reiser4_writepages+0x25/0x30
Nov 26 11:31:05 afdesk02 kernel: [15780.136271] [<ffffffff810c1e3b>] 
do_writepages+0x1b/0x30
Nov 26 11:31:05 afdesk02 kernel: [15780.136353] [<ffffffff8112a59e>] 
__writeback_single_inode.clone.26+0x3e/0x130
Nov 26 11:31:05 afdesk02 kernel: [15780.136460] [<ffffffff8112ab65>] 
generic_writeback_sb_inodes+0x1d5/0x340
Nov 26 11:31:05 afdesk02 kernel: [15780.136559] [<ffffffff81189f4d>] 
reiser4_writeback_inodes+0x8d/0x140
Nov 26 11:31:05 afdesk02 kernel: [15780.136653] [<ffffffff8112b3ad>] 
writeback_sb_inodes+0x8d/0xb0
Nov 26 11:31:05 afdesk02 kernel: [15780.136739] [<ffffffff8112b560>] 
wb_writeback+0xd0/0x1e0
Nov 26 11:31:05 afdesk02 kernel: [15780.136819] [<ffffffff8112b79c>] 
wb_do_writeback+0x9c/0x1c0
Nov 26 11:31:05 afdesk02 kernel: [15780.136906] [<ffffffff81044496>] ? 
lock_timer_base.clone.30+0x36/0x70
Nov 26 11:31:05 afdesk02 kernel: [15780.137002] [<ffffffff8112b94a>] 
bdi_writeback_thread+0x8a/0x160
Nov 26 11:31:05 afdesk02 kernel: [15780.137091] [<ffffffff8112b8c0>] ? 
wb_do_writeback+0x1c0/0x1c0
Nov 26 11:31:05 afdesk02 kernel: [15780.137177] [<ffffffff8112b8c0>] ? 
wb_do_writeback+0x1c0/0x1c0
Nov 26 11:31:05 afdesk02 kernel: [15780.137265] [<ffffffff81055186>] 
kthread+0x96/0xa0
Nov 26 11:31:05 afdesk02 kernel: [15780.137338] [<ffffffff813d0ab4>] 
kernel_thread_helper+0x4/0x10
Nov 26 11:31:05 afdesk02 kernel: [15780.137426] [<ffffffff810550f0>] ? 
kthread_freezable_should_stop+0x60/0x60
Nov 26 11:31:05 afdesk02 kernel: [15780.137528] [<ffffffff813d0ab0>] ? 
gs_change+0xb/0xb
Nov 26 11:31:05 afdesk02 kernel: [15780.137601] Code: 48 89 e5 e8 7b fe 
ff ff c9 c3 90 90 90 90 90 90 90 90 90 55 65 48 8b 04 25 08 b8 00 00 48 
89 e5 ff 80 44 e0 ff ff b8 00 01 00 00 <f0> 66 0f c1 07 0f b6 d4 38 c2 
74 0d 0f 1f 40 00 f3 90 0f b6 07
Nov 26 11:31:05 afdesk02 kernel: [15780.138344] RIP [<ffffffff813ceb18>] 
_raw_spin_lock+0x18/0x40
Nov 26 11:31:05 afdesk02 kernel: [15780.138441]  RSP <ffff8801010d9af0>
Nov 26 11:31:05 afdesk02 kernel: [15780.138495] CR2: 0000000000000052
Nov 26 11:31:05 afdesk02 kernel: [15780.138546] ---[ end trace 
792199483cf446de ]---


Nov 26 11:30:14 afdesk02 kernel: [15729.205316] BUG: unable to handle 
kernel NULL pointer dereference at 00000000000002e3
Nov 26 11:30:14 afdesk02 kernel: [15729.211462] IP: [<ffffffff811aa2ee>] 
rem_entry_cde+0x1e/0x110
Nov 26 11:30:14 afdesk02 kernel: [15729.217619] PGD 116519067 PUD 
11651a067 PMD 0
Nov 26 11:30:14 afdesk02 kernel: [15729.223776] Oops: 0000 [#3] PREEMPT SMP
Nov 26 11:30:14 afdesk02 kernel: [15729.229911] Modules linked in: ipv6 
af_packet dm_mod radeonfb fb_ddc intel_agp intel_gtt rtc joydev 
hid_sunplus usbhid hid radeon 8250_pnp ppdev parport_pc powernow_k8 ttm 
mperf drm_kms_helper ohci_hcd 8250 snd_hda_codec_hdmi serial_core 
ata_generic pata_acpi drm kvm snd_hda_codec_via parport processor button 
ghash_clmulni_intel snd_hda_intel sg xhci_hcd pata_atiixp snd_hda_codec 
i2c_algo_bit r8169 cfbcopyarea ehci_hcd evdev i2c_piix4 cfbimgblt 
cfbfillrect pcspkr snd_hwdep psmouse shpchp snd_pcm usbcore serio_raw 
cryptd pci_hotplug usb_common snd_timer snd mii soundcore microcode 
snd_page_alloc unix
Nov 26 11:30:14 afdesk02 kernel: [15729.243556] CPU 1 <4>[15729.243561] 
Pid: 3428, comm: Cache I/O Tainted: G D      3.6.4-reiser4 #1 System 
manufacturer System Product Name/M5A78L-M/USB3
Nov 26 11:30:14 afdesk02 kernel: [15729.243563] RIP: 
0010:[<ffffffff811aa2ee>]  [<ffffffff811aa2ee>] rem_entry_cde+0x1e/0x110
Nov 26 11:30:14 afdesk02 kernel: [15729.243570] RSP: 
0018:ffff8800c325bd58  EFLAGS: 00010282
Nov 26 11:30:14 afdesk02 kernel: [15729.243571] RAX: 0000000000000270 
RBX: ffff880119f0f250 RCX: 0000000000000000
Nov 26 11:30:14 afdesk02 kernel: [15729.243572] RDX: ffffffff81528660 
RSI: 00000000000002df RDI: ffff880119f0f250
Nov 26 11:30:14 afdesk02 kernel: [15729.243574] RBP: ffff8800c325bdc8 
R08: 0000000000000001 R09: ce00000000000000
Nov 26 11:30:14 afdesk02 kernel: [15729.243575] R10: a8000b97e7000000 
R11: dead000000100100 R12: 00000000000002df
Nov 26 11:30:14 afdesk02 kernel: [15729.243577] R13: ffff8800cf9f0200 
R14: ffff880119f0f250 R15: 0000000000000c5b
Nov 26 11:30:14 afdesk02 kernel: [15729.243579] FS: 
00007f0468ffe700(0000) GS:ffff88011ec40000(0000) knlGS:0000000000000000
Nov 26 11:30:14 afdesk02 kernel: [15729.243581] CS:  0010 DS: 0000 ES: 
0000 CR0: 0000000080050033
Nov 26 11:30:14 afdesk02 kernel: [15729.243582] CR2: 00000000000002e3 
CR3: 000000010b526000 CR4: 00000000000407e0
Nov 26 11:30:14 afdesk02 kernel: [15729.243583] DR0: 0000000000000000 
DR1: 0000000000000000 DR2: 0000000000000000
Nov 26 11:30:14 afdesk02 kernel: [15729.243585] DR3: 0000000000000000 
DR6: 00000000ffff0ff0 DR7: 0000000000000400
Nov 26 11:30:14 afdesk02 kernel: [15729.243587] Process Cache I/O (pid: 
3428, threadinfo ffff8800c325a000, task ffff880119872520)
Nov 26 11:30:14 afdesk02 kernel: [15729.243587] Stack:
Nov 26 11:30:14 afdesk02 kernel: [15729.243589]  ffff8800c325bd68 
ffff880112bc0d80 ffff8800c325bdb8 ffffffff81170abb
Nov 26 11:30:14 afdesk02 kernel: [15729.243592]  ffff880119f0f240 
ffff880100000000 ffff8800c325bd98 ffff880112bc0d80
Nov 26 11:30:14 afdesk02 kernel: [15729.243596]  ffff8800c325bda8 
ffffffff811a3a0f ffff880119f0f250 00000000000002df
Nov 26 11:30:14 afdesk02 kernel: [15729.243599] Call Trace:
Nov 26 11:30:14 afdesk02 kernel: [15729.243601] [<ffffffff81170abb>] ? 
jload_gfp+0xcb/0x1f0
Nov 26 11:30:14 afdesk02 kernel: [15729.243607] [<ffffffff811a3a0f>] ? 
plugin_by_coord_node40+0x2f/0x40
Nov 26 11:30:14 afdesk02 kernel: [15729.243617] [<ffffffff81195aa7>] 
validate_extended_coord+0x57/0x80
Nov 26 11:30:14 afdesk02 kernel: [15729.243621] [<ffffffff81197ee8>] 
read_unix_file+0x3e8/0x520
Nov 26 11:30:14 afdesk02 kernel: [15729.243625] [<ffffffff8119b1b0>] 
reiser4_read_careful+0x70/0x160
Nov 26 11:30:14 afdesk02 kernel: [15729.243629] [<ffffffff81105913>] 
vfs_read+0xc3/0x170
Nov 26 11:30:14 afdesk02 kernel: [15729.243632] [<ffffffff81105a0c>] 
sys_read+0x4c/0x90
Nov 26 11:30:14 afdesk02 kernel: [15729.243638] [<ffffffff813cfa62>] 
system_call_fastpath+0x16/0x1b
Nov 26 11:30:14 afdesk02 kernel: [15729.243666] Code: ee 4c 89 f7 e8 34 
d1 fc ff eb b7 66 90 55 48 89 e5 48 83 ec 70 4c 89 65 e8 49 89 f4 48 89 
5d e0 4c 89 6d f0 4c 89 75 f8 49 89 fe <8b> 76 04 49 8b 7c 24 08 49 89 
d5 bb 32 00 00 00 e8 3d 51 fd ff
Nov 26 11:30:14 afdesk02 kernel: [15729.243670] RIP [<ffffffff811aa2ee>] 
rem_entry_cde+0x1e/0x110
Nov 26 11:30:14 afdesk02 kernel: [15729.243671]  RSP <ffff8800c325bd58>
Nov 26 11:30:14 afdesk02 kernel: [15729.243672] CR2: 00000000000002e3
Nov 26 11:30:14 afdesk02 kernel: [15729.243826] ---[ end trace 
792199483cf446dd ]---


Nov 26 11:31:05 afdesk02 kernel: [15780.132525] BUG: unable to handle 
kernel NULL pointer dereference at 0000000000000052
Nov 26 11:31:05 afdesk02 kernel: [15780.132655] IP: [<ffffffff813ceb18>] 
_raw_spin_lock+0x18/0x40
Nov 26 11:31:05 afdesk02 kernel: [15780.132752] PGD 1132f4067 PUD 
11655b067 PMD 0
Nov 26 11:31:05 afdesk02 kernel: [15780.132841] Oops: 0002 [#4] PREEMPT SMP
Nov 26 11:31:05 afdesk02 kernel: [15780.132921] Modules linked in: ipv6 
af_packet dm_mod radeonfb fb_ddc intel_agp intel_gtt rtc joydev 
hid_sunplus usbhid hid radeon 8250_pnp ppdev parport_pc powernow_k8 ttm 
mperf drm_kms_helper ohci_hcd 8250 snd_hda_codec_hdmi serial_core 
ata_generic pata_acpi drm kvm snd_hda_codec_via parport processor button 
ghash_clmulni_intel snd_hda_intel sg xhci_hcd pata_atiixp snd_hda_codec 
i2c_algo_bit r8169 cfbcopyarea ehci_hcd evdev i2c_piix4 cfbimgblt 
cfbfillrect pcspkr snd_hwdep psmouse shpchp snd_pcm usbcore serio_raw 
cryptd pci_hotplug usb_common snd_timer snd mii soundcore microcode 
snd_page_alloc unix
Nov 26 11:31:05 afdesk02 kernel: [15780.134068] CPU 0
Nov 26 11:31:05 afdesk02 kernel: [15780.134104] Pid: 3779, comm: 
flush-9:1 Tainted: G      D      3.6.4-reiser4 #1 System manufacturer 
System Product Name/M5A78L-M/USB3
Nov 26 11:31:05 afdesk02 kernel: [15780.134280] RIP: 
0010:[<ffffffff813ceb18>]  [<ffffffff813ceb18>] _raw_spin_lock+0x18/0x40
Nov 26 11:31:05 afdesk02 kernel: [15780.134406] RSP: 
0018:ffff8801010d9af0  EFLAGS: 00010202
Nov 26 11:31:05 afdesk02 kernel: [15780.134485] RAX: 0000000000000100 
RBX: ffffea0004169b40 RCX: 0000000000000000
Nov 26 11:31:05 afdesk02 kernel: [15780.134587] RDX: ffffea0004169b40 
RSI: ffff8801010d9aa0 RDI: 0000000000000052
Nov 26 11:31:05 afdesk02 kernel: [15780.134688] RBP: ffff8801010d9af0 
R08: 0000000000003280 R09: 0000000000000000
Nov 26 11:31:05 afdesk02 kernel: [15780.134789] R10: 0000000000000000 
R11: 0000000000000006 R12: 0000000000000002
Nov 26 11:31:05 afdesk02 kernel: [15780.134889] R13: 0000000000000052 
R14: ffff88010b762900 R15: ffff8801097cda20
Nov 26 11:31:05 afdesk02 kernel: [15780.134991] FS: 
00007f27d0fec880(0000) GS:ffff88011ec00000(0000) knlGS:0000000000000000
Nov 26 11:31:05 afdesk02 kernel: [15780.135106] CS:  0010 DS: 0000 ES: 
0000 CR0: 000000008005003b
Nov 26 11:31:05 afdesk02 kernel: [15780.135198] CR2: 0000000000000052 
CR3: 0000000113fc9000 CR4: 00000000000407f0
Nov 26 11:31:05 afdesk02 kernel: [15780.135300] DR0: 0000000000000000 
DR1: 0000000000000000 DR2: 0000000000000000
Nov 26 11:31:05 afdesk02 kernel: [15780.135401] DR3: 0000000000000000 
DR6: 00000000ffff0ff0 DR7: 0000000000000400
Nov 26 11:31:05 afdesk02 kernel: [15780.135502] Process flush-9:1 (pid: 
3779, threadinfo ffff8801010d8000, task ffff880119fa2520)
Nov 26 11:31:05 afdesk02 kernel: [15780.135621] Stack:
Nov 26 11:31:05 afdesk02 kernel: [15780.135654]  ffff8801010d9ba0 
ffffffff81197305 0000000000000001 ffff880100000000
Nov 26 11:31:05 afdesk02 kernel: [15780.135784]  ffff8801010d9d10 
0000000000001d70 ffff8801097cd8c8 ffff8801097cd7c0
Nov 26 11:31:05 afdesk02 kernel: [15780.135915]  ffff880119fa2520 
0000000000005079 ffff8801097cda10 ffff8801097cd838
Nov 26 11:31:05 afdesk02 kernel: [15780.136044] Call Trace:
Nov 26 11:31:05 afdesk02 kernel: [15780.136088] [<ffffffff81197305>] 
writepages_unix_file+0x305/0x4e0
Nov 26 11:31:05 afdesk02 kernel: [15780.136183] [<ffffffff8118e045>] 
reiser4_writepages+0x25/0x30
Nov 26 11:31:05 afdesk02 kernel: [15780.136271] [<ffffffff810c1e3b>] 
do_writepages+0x1b/0x30
Nov 26 11:31:05 afdesk02 kernel: [15780.136353] [<ffffffff8112a59e>] 
__writeback_single_inode.clone.26+0x3e/0x130
Nov 26 11:31:05 afdesk02 kernel: [15780.136460] [<ffffffff8112ab65>] 
generic_writeback_sb_inodes+0x1d5/0x340
Nov 26 11:31:05 afdesk02 kernel: [15780.136559] [<ffffffff81189f4d>] 
reiser4_writeback_inodes+0x8d/0x140
Nov 26 11:31:05 afdesk02 kernel: [15780.136653] [<ffffffff8112b3ad>] 
writeback_sb_inodes+0x8d/0xb0
Nov 26 11:31:05 afdesk02 kernel: [15780.136739] [<ffffffff8112b560>] 
wb_writeback+0xd0/0x1e0
Nov 26 11:31:05 afdesk02 kernel: [15780.136819] [<ffffffff8112b79c>] 
wb_do_writeback+0x9c/0x1c0
Nov 26 11:31:05 afdesk02 kernel: [15780.136906] [<ffffffff81044496>] ? 
lock_timer_base.clone.30+0x36/0x70
Nov 26 11:31:05 afdesk02 kernel: [15780.137002] [<ffffffff8112b94a>] 
bdi_writeback_thread+0x8a/0x160
Nov 26 11:31:05 afdesk02 kernel: [15780.137091] [<ffffffff8112b8c0>] ? 
wb_do_writeback+0x1c0/0x1c0
Nov 26 11:31:05 afdesk02 kernel: [15780.137177] [<ffffffff8112b8c0>] ? 
wb_do_writeback+0x1c0/0x1c0
Nov 26 11:31:05 afdesk02 kernel: [15780.137265] [<ffffffff81055186>] 
kthread+0x96/0xa0
Nov 26 11:31:05 afdesk02 kernel: [15780.137338] [<ffffffff813d0ab4>] 
kernel_thread_helper+0x4/0x10
Nov 26 11:31:05 afdesk02 kernel: [15780.137426] [<ffffffff810550f0>] ? 
kthread_freezable_should_stop+0x60/0x60
Nov 26 11:31:05 afdesk02 kernel: [15780.137528] [<ffffffff813d0ab0>] ? 
gs_change+0xb/0xb
Nov 26 11:31:05 afdesk02 kernel: [15780.137601] Code: 48 89 e5 e8 7b fe 
ff ff c9 c3 90 90 90 90 90 90 90 90 90 55 65 48 8b 04 25 08 b8 00 00 48 
89 e5 ff 80 44 e0 ff ff b8 00 01 00 00 <f0> 66 0f c1 07 0f b6 d4 38 c2 
74 0d 0f 1f 40 00 f3 90 0f b6 07
Nov 26 11:31:05 afdesk02 kernel: [15780.138344] RIP [<ffffffff813ceb18>] 
_raw_spin_lock+0x18/0x40
Nov 26 11:31:05 afdesk02 kernel: [15780.138441]  RSP <ffff8801010d9af0>
Nov 26 11:31:05 afdesk02 kernel: [15780.138495] CR2: 0000000000000052
Nov 26 11:31:05 afdesk02 kernel: [15780.138546] ---[ end trace 
792199483cf446de ]---
Nov 26 11:31:05 afdesk02 kernel: [15780.138616] note: flush-9:1[3779] 
exited with preempt_count 1

Cheers and good luck.
Arend
