From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 25182] New: Alignment error in XEN domU kernel
Date: Sat, 18 Dec 2010 20:45:35 GMT
Message-ID: <bug-25182-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=25182

           Summary: Alignment error in XEN domU kernel
           Product: File System
           Version: 2.5
    Kernel Version: 2.6.32-bpo.5-xen-amd64 (Debian backports)
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: jekhor@gmail.com
        Regression: No


[7211018.650965] alignment check: 0000 [#1] SMP 
[7211018.651078] last sysfs file: /sys/devices/virtual/net/lo/operstate
[7211018.651084] CPU 0 
[7211018.651087] Modules linked in: xt_multiport iptable_filter ip_tables
x_tables snd_pcm snd_timer snd soundcore snd_page_alloc evdev pcspkr
xen_netfront reiserfs dm_mirror dm_region_hash dm_log dm_snapshot dm_mod
xen_blkfront processor thermal_sys acpi_processor raid10 raid456
async_raid6_recov async_pq raid6_pq async_xor xor async_memcpy async_tx raid1
raid0 md_mod ahci sata_nv sata_sil sata_via libata 3w_9xxx 3w_xxxx scsi_mod
[last unloaded: scsi_wait_scan]
[7211018.651145] Pid: 26692, comm: apache2 Not tainted 2.6.32-bpo.5-xen-amd64
#1 
[7211018.651150] RIP: e030:[<ffffffffa010c57a>]  [<ffffffffa010c57a>]
inode2sd+0x1f/0xbe [reiserfs]
[7211018.651162] RSP: e02b:ffff8800021b7668  EFLAGS: 00250292
[7211018.651166] RAX: 0000000000000000 RBX: ffff88000180cc08 RCX:
ffff88002c01b150
[7211018.651171] RDX: 0000000000195240 RSI: ffff88000180cc08 RDI:
ffff88002c01b31c
[7211018.651176] RBP: ffff88002c01b31c R08: 0000000000000000 R09:
ffff88002c01b000
[7211018.651181] R10: 0000000000000fd0 R11: 0000000000001000 R12:
ffff88003489c310
[7211018.651186] R13: ffff8800021b76b8 R14: ffff8800021b77b8 R15:
ffff8800021b76c0
[7211018.651194] FS:  0000000000000000(0000) GS:ffff880003200000(0000)
knlGS:0000000000000000
[7211018.651200] CS:  e033 DS: 002b ES: 002b CR0: 000000008005003b
[7211018.651204] CR2: 00000000f601b538 CR3: 000000006208e000 CR4:
0000000000002620
[7211018.651209] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[7211018.651214] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7:
0000000000000400
[7211018.651219] Process apache2 (pid: 26692, threadinfo ffff8800021b6000, task
ffff8800019aa350)
[7211018.651224] Stack:
[7211018.651227]  ffff88000180cc08 ffff880000000002 ffff88003489c310
000000000218a7ba
[7211018.651234] <0> ffff88000180cc08 ffffffffa010cf42 0000000000000000
ffffffff8110ecfb
[7211018.651243] <0> 0000000000195240 ffff88000180cb80 0000000000000005
0000000000000000
[7211018.651252] Call Trace:
[7211018.651260]  [<ffffffffa010cf42>] ? reiserfs_update_sd_size+0x2a2/0x2cc
[reiserfs]
[7211018.651268]  [<ffffffff8110ecfb>] ? ll_rw_block+0xda/0xf8
[7211018.651276]  [<ffffffffa0121f35>] ? do_journal_begin_r+0x257/0x2a2
[reiserfs]
[7211018.651285]  [<ffffffffa0114305>] ? reiserfs_dirty_inode+0x64/0x84
[reiserfs]
[7211018.651292]  [<ffffffff81108af1>] ? __mark_inode_dirty+0x25/0x14a
[7211018.651300]  [<ffffffffa010d0c7>] ? reiserfs_write_end+0x15b/0x22b
[reiserfs]
[7211018.651307]  [<ffffffff810b57f9>] ?
generic_file_buffered_write+0x18d/0x278
[7211018.651312]  [<ffffffff810b5c95>] ? __generic_file_aio_write+0x25f/0x293
[7211018.651318]  [<ffffffff810b5d22>] ? generic_file_aio_write+0x59/0x9f
[7211018.651324]  [<ffffffff810ef196>] ? do_sync_write+0xce/0x113
[7211018.651331]  [<ffffffff810659fa>] ? autoremove_wake_function+0x0/0x2e
[7211018.651337]  [<ffffffff8102ddac>] ? pvclock_clocksource_read+0x3a/0x8b
[7211018.651344]  [<ffffffff810809bb>] ? do_acct_process+0x4f1/0x539
[7211018.651349]  [<ffffffff810b5d4c>] ? generic_file_aio_write+0x83/0x9f
[7211018.651355]  [<ffffffff81197c06>] ? __bitmap_weight+0x3a/0x7e
[7211018.651362]  [<ffffffff8100e5b5>] ? xen_force_evtchn_callback+0x9/0xa
[7211018.651367]  [<ffffffff8100ec72>] ? check_events+0x12/0x20
[7211018.651373]  [<ffffffff8105238c>] ? do_exit+0x6a7/0x6b5
[7211018.651378]  [<ffffffff8100b0d9>] ? xen_load_gs_index+0xe/0x17
[7211018.651384]  [<ffffffff81080a6a>] ? acct_process+0x67/0x81
[7211018.651389]  [<ffffffff81051ed6>] ? do_exit+0x1f1/0x6b5
[7211018.651394]  [<ffffffff81052410>] ? do_group_exit+0x76/0x9d
[7211018.651400]  [<ffffffff8105eba5>] ? get_signal_to_deliver+0x318/0x343
[7211018.651405]  [<ffffffff8101104f>] ? do_notify_resume+0x87/0x73f
[7211018.651410]  [<ffffffff8100ec72>] ? check_events+0x12/0x20
[7211018.651416]  [<ffffffff8100ec5f>] ? xen_restore_fl_direct_end+0x0/0x1
[7211018.651423]  [<ffffffff8130baea>] ? _spin_unlock_irqrestore+0xd/0xe
[7211018.651429]  [<ffffffff8130f57c>] ? kprobe_flush_task+0x9f/0xac
[7211018.651434]  [<ffffffff8105238c>] ? do_exit+0x6a7/0x6b5
[7211018.651439]  [<ffffffff81048ea5>] ? finish_task_switch+0x96/0xaf
[7211018.651444]  [<ffffffff81011e0e>] ? int_signal+0x12/0x17
[7211018.651448] Code: 18 8b 43 8c 89 45 1c 41 5b 5b 5d c3 55 48 89 fd 53 48 89
f3 48 83 ec 18 66 8b 86 ae 00 00 00 66 89 07 8b 46 4c 89 47 04 8b 46 50 <48> 89
57 08 89 47 10 8b 46 54 89 47 14 48 8b 86 80 00 00 00 89 
[7211018.850124] RIP  [<ffffffffa010c57a>] inode2sd+0x1f/0xbe [reiserfs]
[7211018.850140]  RSP <ffff8800021b7668>
[7211018.850148] ---[ end trace dbfa423e5a57be19 ]---

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
