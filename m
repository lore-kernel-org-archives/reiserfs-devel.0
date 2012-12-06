From: Tobias Neumann <tobias.neumann@gmail.com>
Subject: Re: Reiser4: BUG: unable to handle kernel NULL pointer dereference
Date: Thu, 6 Dec 2012 17:01:59 +0000 (UTC)
Message-ID: <k9qj27$jao$1@ger.gmane.org>
References: <50B4B991.2050604@inn.nl> <50B4CC7F.7040704@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello!

Not sure if this helps any further, but I get such NULL pointer 
dereferences quite often too, here is one of them. Would it help if I 
activated reiser4 debugging for a better crash report, or do you already 
know where to look at?

[18400.907871] BUG: unable to handle kernel NULL pointer dereference at 
000000000000000e
[18400.907876] IP: [<ffffffff811f4b23>] jnode_of_page+0x33/0x290
[18400.907881] PGD 130294067 PUD 130af1067 PMD 0
[18400.907883] Oops: 0002 [#1] PREEMPT SMP
[18400.907886] Modules linked in: fuse iptable_filter ipt_REDIRECT 
xt_tcpudp xt_owner iptable_nat nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 
nf_conntrack ip_tables x_tables snd_hda_codec_hdmi joydev 
snd_hda_codec_via snd_hda_intel snd_hda_codec snd_hwdep snd_pcm 
snd_page_alloc snd_timer snd soundcore edac_core edac_mce_amd mperf 
kvm_amd kvm psmouse sp5100_tco fglrx(PO) microcode serio_raw i2c_piix4 
pcspkr k10temp evdev i2c_core amd_iommu_v2 atl1c button wmi processor jfs 
dm_mod hid_generic usbhid hid sd_mod ata_generic pata_acpi ohci_hcd 
pata_atiixp ahci libahci ehci_hcd libata usbcore scsi_mod usb_common
[18400.907908] CPU 5
[18400.907911] Pid: 749, comm: flush-8:32 Tainted: P           O 3.6.4-1-
ARCH #1 MSI MS-7599/870-G45 (MS-7599)
[18400.907913] RIP: 0010:[<ffffffff811f4b23>]  [<ffffffff811f4b23>] 
jnode_of_page+0x33/0x290
[18400.907916] RSP: 0018:ffff8801aece58b0  EFLAGS: 00010202
[18400.907917] RAX: ffff8801848df020 RBX: 0000000000000002 RCX: 
000000000000000d
[18400.907919] RDX: 00000000022b8695 RSI: 000000000000001e RDI: 
ffffea0005015540
[18400.907920] RBP: ffff8801aece58f0 R08: 0000000000000039 R09: 
ffff8801a49a48e0
[18400.907921] R10: 0000000000000000 R11: 0000000000000042 R12: 
ffffea0005015540
[18400.907921] R13: ffff88011dea3010 R14: ffff88011dea2ea8 R15: 
ffff8801b45e0000
[18400.907923] FS:  00007fa7b53c1740(0000) GS:ffff8801bfd40000(0000) 
knlGS:000000000915b830
[18400.907924] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[18400.907925] CR2: 000000000000000e CR3: 0000000187571000 CR4: 
00000000000007e0
[18400.907926] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
0000000000000000
[18400.907927] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 
0000000000000400
[18400.907929] Process flush-8:32 (pid: 749, threadinfo ffff8801aece4000, 
task ffff8801b45e0000)
[18400.907929] Stack:
[18400.907930]  0000000000000000 0000000000000021 0000000000000100 
0000000000000000
[18400.907933]  ffffea0005015540 ffff88011dea3010 ffff88011dea2ea8 
ffff8801b45e0000
[18400.907935]  ffff8801aece5940 ffffffff8121d3de ffffea0005015540 
ffff8801b45e0000
[18400.907937] Call Trace:
[18400.907940]  [<ffffffff8121d3de>] find_or_create_extent+0x3e/0x220
[18400.907942]  [<ffffffff8120078e>] ? reiser4_grab_space+0x4e/0xa0
[18400.907944]  [<ffffffff8121da0b>] capture_anonymous_pages+0x1fb/0x3e0
[18400.907946]  [<ffffffff8121dd53>] writepages_unix_file+0x163/0x480
[18400.907949]  [<ffffffff81213eaf>] reiser4_writepages+0x2f/0x40
[18400.907951]  [<ffffffff81128981>] do_writepages+0x21/0x50
[18400.907954]  [<ffffffff811a8ffb>] __writeback_single_inode.isra.31
+0x3b/0x190
[18400.907956]  [<ffffffff8107a037>] ? bit_waitqueue+0x17/0xc0
[18400.907958]  [<ffffffff811a94b5>] generic_writeback_sb_inodes
+0x215/0x410
[18400.907961]  [<ffffffff8120face>] reiser4_writeback_inodes+0x8e/0x150
[18400.907963]  [<ffffffff811aa251>] writeback_sb_inodes+0xa1/0xc0
[18400.907965]  [<ffffffff811aa30f>] __writeback_inodes_wb+0x9f/0xd0
[18400.907967]  [<ffffffff811aa653>] wb_writeback+0x313/0x340
[18400.907969]  [<ffffffff811aa8e6>] wb_do_writeback+0x1c6/0x270
[18400.907971]  [<ffffffff811aaa23>] bdi_writeback_thread+0x93/0x2d0
[18400.907973]  [<ffffffff811aa990>] ? wb_do_writeback+0x270/0x270
[18400.907974]  [<ffffffff81079a03>] kthread+0x93/0xa0
[18400.907977]  [<ffffffff814e7c44>] kernel_thread_helper+0x4/0x10
[18400.907979]  [<ffffffff81079970>] ? kthread_freezable_should_stop
+0x70/0x70
[18400.907981]  [<ffffffff814e7c40>] ? gs_change+0x13/0x13
[18400.907982] Code: 48 89 5d d8 4c 89 65 e0 4c 89 6d e8 4c 89 75 f0 4c 
89 7d f8 66 66 66 66 90 49 89 fc e8 27 8d 01 00 49 8b 5c 24 30 48 85 db 
74 1d <f0> ff 43 0c 48 89 d8 4c 8b 65 e0 48 8b 5d d8 4c 8b 6d e8 4c 8b
[18400.907999] RIP  [<ffffffff811f4b23>] jnode_of_page+0x33/0x290
[18400.908000]  RSP <ffff8801aece58b0>
[18400.908001] CR2: 000000000000000e
[18400.908003] ---[ end trace fa9f5dad422f21f6 ]---

Regards, Tobias

