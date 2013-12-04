From: Shaun Robinson <srobinson2@taz.dstl.gov.uk>
Subject: Reiserfs bug
Date: Wed, 04 Dec 2013 07:07:48 +0000
Message-ID: <20131204070748.16375r99zeod4cg0@webmail.dstl.gov.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hi,

I am running Gentoo Linux with a 3.12.1 kernel and I receive the below  
kernel bug:

[19765.370219] ------------[ cut here ]------------
[19765.370358] kernel BUG at fs/reiserfs/stree.c:1477!
[19765.370479] invalid opcode: 0000 [#1] SMP
[19765.370611] Modules linked in: tcm_loop iscsi_target_mod  
target_core_pscsi target_core_file target_core_iblock target_core_mod  
netconsole xt_physdev iptable_filter tun configfs nfsd exportfs  
bonding cdc_acm [last unloaded: target_core_mod]
[19765.371359] CPU: 0 PID: 5917 Comm: kworker/0:0 Not tainted 3.12.1 #1
[19765.371479] Hardware name: Dell Inc. PowerEdge R820/04K5X5, BIOS  
1.5.0 03/08/2013
[19765.371715] Workqueue: events delayed_fput
[19765.371833] task: ffff8806b0049f00 ti: ffff8806b062a000 task.ti:  
ffff8806b062a000
[19765.372051] RIP: e030:[<ffffffff811efb74>]  [<ffffffff811efb74>]  
reiserfs_cut_from_item+0x684/0x700
[19765.372280] RSP: e02b:ffff8806b062b808  EFLAGS: 00010206
[19765.372397] RAX: ffff880f91660800 RBX: ffff8806b062bc18 RCX:  
ffff8806b062bca0
[19765.372519] RDX: 0000000004995c44 RSI: ffff8806b127c750 RDI:  
ffff880f91660800
[19765.372639] RBP: ffff8806b062bb68 R08: 0000000000000000 R09:  
ffff8806b062bb2c
[19765.372816] R10: ffff8806b062bb98 R11: ffff8806ae384000 R12:  
ffff8806b062bb98
[19765.372937] R13: 0000000000001000 R14: ffff8806ad89cf58 R15:  
00000000000001fa
[19765.373063] FS:  00007ffdfef2f700(0000) GS:ffff880fa2200000(0000)  
knlGS:0000000000000000
[19765.373279] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
[19765.373395] CR2: 00007fea4c470000 CR3: 00000000cc4f9000 CR4:  
0000000000042660
[19765.373519] Stack:
[19765.373627]  00000000000001fa ffff8806b062b828 000000000000e02b  
000000004c5b03dc
[19765.373866]  ffffea00147d6b00 0000000000000000 00000000b062b858  
ffffffffffffffff
[19765.374106]  ffff880f91660800 ffff8806b062bca0 ffff8806b062b8b8  
0000000000000000
[19765.374345] Call Trace:
[19765.374459]  [<ffffffff811efded>] reiserfs_do_truncate+0x1fd/0x4f0
[19765.374582]  [<ffffffff811daa3f>] reiserfs_truncate_file+0x19f/0x390
[19765.374703]  [<ffffffff811dedca>] reiserfs_file_release+0x24a/0x310
[19765.374823]  [<ffffffff8115dde9>] __fput+0xa9/0x230
[19765.374938]  [<ffffffff8115df9b>] delayed_fput+0x2b/0x40
[19765.375056]  [<ffffffff810735bb>] process_one_work+0x18b/0x4d0
[19765.375230]  [<ffffffff8107481b>] worker_thread+0x11b/0x3e0
[19765.375348]  [<ffffffff81074700>] ? manage_workers.isra.21+0x320/0x320
[19765.375553]  [<ffffffff8107b6db>] kthread+0xbb/0xc0
[19765.375670]  [<ffffffff81010000>] ? perf_trace_xen_mmu_pte_clear+0x40/0xf0
[19765.375787]  [<ffffffff8107b620>] ? flush_kthread_worker+0xa0/0xa0
[19765.375908]  [<ffffffff8174db4c>] ret_from_fork+0x7c/0xb0
[19765.376022]  [<ffffffff8107b620>] ? flush_kthread_worker+0xa0/0xa0
[19765.376135] Code: ff ff ff 48 8b bd e0 fc ff ff 48 c7 c1 da c3 94  
81 31 c0 48 c7 c2 a0 ee 77 81 48 c7 c6 e8 c3 94 81 e8 31 83 ff ff e9  
f3 fe ff ff <0f> 0b 0f 0b 0f 0b 49 63 04 24 be 03 00 00 00 48 c1 e0 04  
49 01
[19765.376924] RIP  [<ffffffff811efb74>] reiserfs_cut_from_item+0x684/0x700
[19765.377052]  RSP <ffff8806b062b808>
[19765.378930] ---[ end trace 868700fb5cf58b2d ]---

This also occured using the Gentoo kernel version 3.7.10-gentoo-r1 kernel.

This error only happens under heavy server load (both IO and CPU). The  
server is running xen version 4.2 and this is the dom0 kernel which  
crashes. The hardware is a Dell PowerEdge R820.

I've run a reiserfsck on the filesystem and it doesn't find anything  
wring with it.

Does anyone have any ideas as to what would cause this?

Thanks
Shaun
