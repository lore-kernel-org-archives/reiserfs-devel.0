From: jose@mictlantecuhtli.metztli-it.com (Jose R Rodriguez)
Subject: Google Cloud image issue with Reiser4-for-linux-4.11 patch
Date: Sat,  8 Jul 2017 14:46:27 -0700 (PDT)
Message-ID: <20170708214627.51F96BE260D@mictlantecuhtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1499550687; h=From: Date: Message-Id: To: Subject: Sender;
 bh=dISQXq0DLLHe9S3ZBHQoe/j+CJC1WElTtOYIRf0GwyE=; b=njH92UCHNNrJB5/r8tF2X0L+YD+AXgXLQpIfVYhRyZIMcJIm8jGAlaMusQ3FlP21BFcTDo8e
 riUSRNn63E+stKTYteSoAvLTsOPAEdPQS3SAtQuTYxpU9zUrbII+74hw5HmVqC0n5Cur+3PU
 iwCpvfSmoDI68X4ZZ66W6htfsz8=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

Niltze, Edward-

Created a Metztli-Reiser4 Debian Stretch AMD64 image for Google Compute Engine (GCE).

At the time I integrated reiser4-patched Linux-4.11.5 kernel from kernel.org wrapped in a Debian packaging for 4.11.4-1;
yes its a hack, but a carefully developed hack as I applied your patch for Linux-4.11 and generated
modules for the Debian-Installer.

As I was developing/testing the image for Google Cloud, on some instances I got the issue
below by viewing the serial console output
< https://cloud.google.com/compute/docs/instances/interacting-with-serial-console >

and wondered if you might provides some insight. Thank you in advance.


[[0;32m  OK  [0[   11.610689] ------------[ cut here ]------------
[   11.615662] kernel BUG at /mnt/chiucuetetl/usr/src/linux/fs/reiser4/block_alloc.c:152!
[   11.624829] invalid opcode: 0000 [#1] SMP
[   11.629707] Modules linked in: ip_tables x_tables autofs4 reiser4 sd_mod crc32c_intel virtio_scsi scsi_mod virtio_net aesni_intel aes_x86_64 crypto_simd cryptd glue_helper psmouse virtio_pci virtio_ring virtio i2c_piix4
[   11.649506] CPU: 0 PID: 462 Comm: systemd-tmpfile Not tainted 4.11.0-1+reiser4.0.1-amd64 #1 Debian 4.11.4-1+reiser4.0.1
[   11.660628] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
[   11.670892] task: ffff8e06b69cf000 task.stack: ffff99274059c000
[   11.676967] RIP: 0010:sub_from_ctx_grabbed.isra.9.part.10+0x5/0x10 [reiser4]
[   11.686143] RSP: 0018:ffff99274059fbb0 EFLAGS: 00010202
[   11.692026] RAX: 0000000000000000 RBX: ffff8e06b6908000 RCX: 0000000000000000
[   11.699292] RDX: ffff8e06e9ae3400 RSI: 0000000000000001 RDI: ffff8e06e9553c40
[   11.706718] RBP: ffff8e06e9553c40 R08: 0000000000000000 R09: 0000000000000001
[   11.714111] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8e06e97ea7d0
[   11.721404] R13: ffff99274059fc70 R14: ffff8e06e97f1518 R15: 0000000000000000
[   11.728699] FS:  00007f4286b4d8c0(0000) GS:ffff8e06ec800000(0000) knlGS:0000000000000000
[   11.737534] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.743682] CR2: 00007f9d6af5d228 CR3: 0000000068e2a000 CR4: 00000000001406f0
[   11.750954] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   11.758217] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   11.765487] Call Trace:
[   11.768082]  ? grabbed2flush_reserved_nolock+0x7b/0x90 [reiser4]
[   11.774242]  ? jnode_make_dirty_locked+0xe6/0x1b0 [reiser4]
[   11.780250]  ? znode_make_dirty+0x28/0xe0 [reiser4]
[   11.785285]  ? update_sd+0x288/0x470 [reiser4]
[   11.790063]  ? __switch_to+0x234/0x4d0
[   11.793966]  ? write_sd_by_inode_common+0x8c/0x90 [reiser4]
[   11.799777]  ? reiser4_dirty_inode+0x3e/0xd0 [reiser4]
[   11.805083]  ? __mark_inode_dirty+0x165/0x350
[   11.809669]  ? generic_update_time+0x7b/0xd0
[   11.814201]  ? current_time+0x38/0x80
[   11.818002]  ? touch_atime+0xab/0xd0
[   11.821737]  ? read_unix_file+0x49c/0x4d0 [reiser4]
[   11.826769]  ? reiser4_read_dispatch+0x59/0x130 [reiser4]
[   11.832442]  ? vfs_read+0x91/0x130
[   11.836068]  ? SyS_read+0x52/0xc0
[   11.839513]  ? system_call_fast_compare_end+0xc/0x9b
[   11.844633] Code: 84 00 00 00 00 00 0f 1f 44 00 00 48 8b 47 28 89 f6 48 85 c0 74 07 48 01 f0 48 89 47 28 48 29 77 20 48 01 77 18 c3 0f 1f 44 00 00 <0f> 0b 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 53 48 63 df 
[   11.863676] RIP: sub_from_ctx_grabbed.isra.9.part.10+0x5/0x10 [reiser4] RSP: ffff99274059fbb0
m] Started Remou[   11.872615] ---[ end trace 7824876f84a24103 ]---
nt Root and Kernel File Systems.
[   11.883476] reiser4[systemd-tmpfile(462)]: release_unix_file (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/file/file.c:2358)[vs-44]:
[   11.883476] WARNING: out of memory?
[   32.890111] INFO: rcu_sched detected stalls on CPUs/tasks:
[   32.895770] 	(detected by 0, t=5252 jiffies, g=336, c=335, q=54)
[   32.901997] All QSes seen, last rcu_sched kthread activity 5252 (4294900518-4294895266), jiffies_till_next_fqs=1, root ->qsmask 0x0
[   32.913952] systemd-tmpfile R  running task        0   462      1 0x0000000a
[   32.921147] Call Trace:
[   32.923763]  <IRQ>
[   32.925911]  ? sched_show_task+0xcb/0x130
[   32.930055]  ? rcu_check_callbacks+0x8a7/0x8b0
[   32.934640]  ? tick_sched_handle.isra.15+0x50/0x50
[   32.939574]  ? update_process_times+0x28/0x50
[   32.944412]  ? tick_sched_handle.isra.15+0x20/0x50
[   32.949343]  ? tick_sched_timer+0x38/0x70
[   32.953667]  ? __hrtimer_run_queues+0xdc/0x240
[   32.958357]  ? hrtimer_interrupt+0xa6/0x1f0
[   32.962849]  ? smp_apic_timer_interrupt+0x34/0x50
[   32.967802]  ? apic_timer_interrupt+0x82/0x90
[   32.972291]  </IRQ>
[   32.974550]  ? native_queued_spin_lock_slowpath+0x21/0x190
[   32.980521]  ? _raw_spin_lock+0x1d/0x20
[   32.984516]  ? reiser4_free_file_fsdata+0x19/0x50 [reiser4]
[   32.990336]  ? release_unix_file+0x87/0x190 [reiser4]
[   32.995547]  ? reiser4_release_dispatch+0x43/0x110 [reiser4]
[   33.001549]  ? __fput+0xd5/0x210
[   33.004921]  ? task_work_run+0x79/0xa0
[   33.008908]  ? do_exit+0x2ed/0xb70
[   33.012450]  ? vfs_read+0x91/0x130
[   33.015986]  ? SyS_read+0x52/0xc0
[   33.019439]  ? rewind_stack_do_exit+0x17/0x20
[   33.023934] rcu_sched kthread starved for 5252 jiffies! g336 c335 f0x2 RCU_GP_WAIT_FQS(3) ->state=0x0
[   33.033388] rcu_sched       R  running task        0     8      2 0x00000000
[   33.040574] Call Trace:
[   33.043159]  ? __schedule+0x3c2/0x8b0
[   33.047032]  ? schedule+0x32/0x80
[   33.050475]  ? schedule_timeout+0x17c/0x310
[   33.054886]  ? del_timer_sync+0x50/0x50
[   33.058867]  ? rcu_gp_kthread+0x505/0x850
[   33.063008]  ? prepare_to_swait_event+0x1f/0x40
[   33.067677]  ? rcu_gp_kthread+0x505/0x850
[   33.071831]  ? kthread+0xfc/0x130
[   33.075288]  ? rcu_note_context_switch+0xe0/0xe0
[   33.080052]  ? kthread_create_on_node+0x70/0x70
[   33.084715]  ? ret_from_fork+0x26/0x40
[   60.054109] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [systemd-tmpfile:462]
[   60.062393] Modules linked in: ip_tables x_tables autofs4 reiser4 sd_mod crc32c_intel virtio_scsi scsi_mod virtio_net aesni_intel aes_x86_64 crypto_simd cryptd glue_helper psmouse virtio_pci virtio_ring virtio i2c_piix4
[   60.082069] CPU: 0 PID: 462 Comm: systemd-tmpfile Tainted: G      D         4.11.0-1+reiser4.0.1-amd64 #1 Debian 4.11.4-1+reiser4.0.1
[   60.094264] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
[   60.103603] task: ffff8e06b69cf000 task.stack: ffff99274059c000
[   60.110564] RIP: 0010:native_queued_spin_lock_slowpath+0xf/0x190
[   60.116777] RSP: 0018:ffff99274059fdf0 EFLAGS: 00000202 ORIG_RAX: ffffffffffffff10
[   60.124466] RAX: 0000000000000001 RBX: ffff8e06e5ecf300 RCX: 0000000000000000
[   60.131720] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff8e06e97f1400
[   60.138972] RBP: ffff8e06e5ecf300 R08: 0000000000000000 R09: 000000000000016b
[   60.146247] R10: ffff8e06e5ecf310 R11: ffffffffbaabff59 R12: ffff8e06e97f1518
[   60.153500] R13: ffff8e06e9ae3400 R14: ffff8e06e5ecf300 R15: ffff8e06e97f1518
[   60.160761] FS:  0000000000000000(0000) GS:ffff8e06ec800000(0000) knlGS:0000000000000000
[   60.168969] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   60.174836] CR2: 00007f9d69b66ab4 CR3: 0000000052409000 CR4: 00000000001406f0
[   60.182181] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   60.189784] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   60.197485] Call Trace:
[   60.200057]  ? _raw_spin_lock+0x1d/0x20
[   60.204046]  ? reiser4_free_file_fsdata+0x19/0x50 [reiser4]
[   60.209768]  ? release_unix_file+0x87/0x190 [reiser4]
[   60.214966]  ? reiser4_release_dispatch+0x43/0x110 [reiser4]
[   60.220841]  ? __fput+0xd5/0x210
[   60.224281]  ? task_work_run+0x79/0xa0
[   60.228153]  ? do_exit+0x2ed/0xb70
[   60.231682]  ? vfs_read+0x91/0x130
[   60.235200]  ? SyS_read+0x52/0xc0
[   60.238643]  ? rewind_stack_do_exit+0x17/0x20
[   60.243220] Code: 0e 84 c0 74 f4 eb 02 f3 90 8b 07 84 c0 75 f8 c3 66 90 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 0f 1f 44 00 00 ba 01 00 00 00 <8b> 07 85 c0 75 0a 3e 0f b1 17 85 c0 75 f2 f3 c3 f3 90 eb ec 81 
[   88.054113] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [systemd-tmpfile:462]
[   88.062287] Modules linked in: ip_tables x_tables autofs4 reiser4 sd_mod crc32c_intel virtio_scsi scsi_mod virtio_net aesni_intel aes_x86_64 crypto_simd cryptd glue_helper psmouse virtio_pci virtio_ring virtio i2c_piix4
[   88.081898] CPU: 0 PID: 462 Comm: systemd-tmpfile Tainted: G      D      L  4.11.0-1+reiser4.0.1-amd64 #1 Debian 4.11.4-1+reiser4.0.1
[   88.094017] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
[   88.103369] task: ffff8e06b69cf000 task.stack: ffff99274059c000
[   88.109943] RIP: 0010:native_queued_spin_lock_slowpath+0x11/0x190
[   88.116711] RSP: 0018:ffff99274059fdf0 EFLAGS: 00000202 ORIG_RAX: ffffffffffffff10
[   88.124406] RAX: 0000000000000001 RBX: ffff8e06e5ecf300 RCX: 0000000000000000
[   88.131662] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff8e06e97f1400
[   88.138921] RBP: ffff8e06e5ecf300 R08: 0000000000000000 R09: 000000000000016b
[   88.146176] R10: ffff8e06e5ecf310 R11: ffffffffbaabff59 R12: ffff8e06e97f1518
[   88.153434] R13: ffff8e06e9ae3400 R14: ffff8e06e5ecf300 R15: ffff8e06e97f1518
[   88.160785] FS:  0000000000000000(0000) GS:ffff8e06ec800000(0000) knlGS:0000000000000000
[   88.168998] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   88.175058] CR2: 00007f9d69b66ab4 CR3: 0000000052409000 CR4: 00000000001406f0
[   88.182328] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   88.189748] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   88.197006] Call Trace:
[   88.199583]  ? _raw_spin_lock+0x1d/0x20
[   88.203585]  ? reiser4_free_file_fsdata+0x19/0x50 [reiser4]
[   88.209303]  ? release_unix_file+0x87/0x190 [reiser4]
[   88.214508]  ? reiser4_release_dispatch+0x43/0x110 [reiser4]
[   88.220388]  ? __fput+0xd5/0x210
[   88.223746]  ? task_work_run+0x79/0xa0
[   88.227944]  ? do_exit+0x2ed/0xb70
[   88.231628]  ? vfs_read+0x91/0x130
[   88.235155]  ? SyS_read+0x52/0xc0
[   88.238598]  ? rewind_stack_do_exit+0x17/0x20
[   88.243077] Code: c0 74 f4 eb 02 f3 90 8b 07 84 c0 75 f8 c3 66 90 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 0f 1f 44 00 00 ba 01 00 00 00 8b 07 <85> c0 75 0a 3e 0f b1 17 85 c0 75 f2 f3 c3 f3 90 eb ec 81 fe 00 
[   95.910172] INFO: rcu_sched detected stalls on CPUs/tasks:
[   95.916110] 	(detected by 0, t=21007 jiffies, g=336, c=335, q=54)
[   95.922986] All QSes seen, last rcu_sched kthread activity 21007 (4294916273-4294895266), jiffies_till_next_fqs=1, root ->qsmask 0x0
[   95.936048] systemd-tmpfile R  running task        0   462      1 0x0000000a
[   95.944386] Call Trace:
[   95.947248]  <IRQ>
[   95.949482]  ? sched_show_task+0xcb/0x130
[   95.953606]  ? rcu_check_callbacks+0x8a7/0x8b0
[   95.958929]  ? tick_sched_handle.isra.15+0x50/0x50
[   95.964287]  ? update_process_times+0x28/0x50
[   95.968776]  ? tick_sched_handle.isra.15+0x20/0x50
[   95.974038]  ? tick_sched_timer+0x38/0x70
[   95.979040]  ? __hrtimer_run_queues+0xdc/0x240
[   95.983817]  ? hrtimer_interrupt+0xa6/0x1f0
[   95.988138]  ? smp_apic_timer_interrupt+0x34/0x50
[   95.992958]  ? apic_timer_interrupt+0x82/0x90
[   95.997443]  </IRQ>
[   96.000645]  ? native_queued_spin_lock_slowpath+0x11/0x190
[   96.007229]  ? _raw_spin_lock+0x1d/0x20
[   96.011857]  ? reiser4_free_file_fsdata+0x19/0x50 [reiser4]
[   96.020480]  ? release_unix_file+0x87/0x190 [reiser4]
[   96.026154]  ? reiser4_release_dispatch+0x43/0x110 [reiser4]
[   96.031948]  ? __fput+0xd5/0x210
[   96.035606]  ? task_work_run+0x79/0xa0
[   96.039792]  ? do_exit+0x2ed/0xb70
[   96.043849]  ? vfs_read+0x91/0x130
[   96.047765]  ? SyS_read+0x52/0xc0
[   96.054662]  ? rewind_stack_do_exit+0x17/0x20
[   96.060605] rcu_sched kthread starved for 21007 jiffies! g336 c335 f0x2 RCU_GP_WAIT_FQS(3) ->state=0x0
[   96.071078] rcu_sched       R  running task        0     8      2 0x00000000
[   96.078252] Call Trace:
[   96.081001]  ? __schedule+0x3c2/0x8b0
[   96.084951]  ? schedule+0x32/0x80
[   96.088387]  ? schedule_timeout+0x17c/0x310
[   96.092695]  ? del_timer_sync+0x50/0x50
[   96.096645]  ? rcu_gp_kthread+0x505/0x850
[   96.100770]  ? prepare_to_swait_event+0x1f/0x40
[   96.105429]  ? rcu_gp_kthread+0x505/0x850
[   96.109567]  ? kthread+0xfc/0x130
[   96.113044]  ? rcu_note_context_switch+0xe0/0xe0
[   96.117780]  ? kthread_create_on_node+0x70/0x70
[   96.122429]  ? ret_from_fork+0x26/0x40
[  120.054111] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [systemd-tmpfile:462]
[  120.062449] Modules linked in: ip_tables x_tables autofs4 reiser4 sd_mod crc32c_intel virtio_scsi scsi_mod virtio_net aesni_intel aes_x86_64 crypto_simd cryptd glue_helper psmouse virtio_pci virtio_ring virtio i2c_piix4
[  120.082061] CPU: 0 PID: 462 Comm: systemd-tmpfile Tainted: G      D      L  4.11.0-1+reiser4.0.1-amd64 #1 Debian 4.11.4-1+reiser4.0.1
[  120.094185] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
[  120.103518] task: ffff8e06b69cf000 task.stack: ffff99274059c000
[  120.110192] RIP: 0010:native_queued_spin_lock_slowpath+0xf/0x190
[  120.116840] RSP: 0018:ffff99274059fdf0 EFLAGS: 00000202 ORIG_RAX: ffffffffffffff10
[  120.124540] RAX: 0000000000000001 RBX: ffff8e06e5ecf300 RCX: 0000000000000000
[  120.131963] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff8e06e97f1400
[  120.139575] RBP: ffff8e06e5ecf300 R08: 0000000000000000 R09: 000000000000016b
[  120.146846] R10: ffff8e06e5ecf310 R11: ffffffffbaabff59 R12: ffff8e06e97f1518
[  120.154095] R13: ffff8e06e9ae3400 R14: ffff8e06e5ecf300 R15: ffff8e06e97f1518
[  120.161342] FS:  0000000000000000(0000) GS:ffff8e06ec800000(0000) knlGS:0000000000000000
[  120.169545] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  120.175598] CR2: 00007f9d69b66ab4 CR3: 0000000052409000 CR4: 00000000001406f0
[  120.182885] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  120.190155] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  120.197407] Call Trace:
[  120.199989]  ? _raw_spin_lock+0x1d/0x20
[  120.204278]  ? reiser4_free_file_fsdata+0x19/0x50 [reiser4]
[  120.210003]  ? release_unix_file+0x87/0x190 [reiser4]
[  120.215198]  ? reiser4_release_dispatch+0x43/0x110 [reiser4]
[  120.221001]  ? __fput+0xd5/0x210
[  120.224349]  ? task_work_run+0x79/0xa0
[  120.228219]  ? do_exit+0x2ed/0xb70
[  120.231765]  ? vfs_read+0x91/0x130
[  120.235284]  ? SyS_read+0x52/0xc0
[  120.238719]  ? rewind_stack_do_exit+0x17/0x20
[  120.243193] Code: 0e 84 c0 74 f4 eb 02 f3 90 8b 07 84 c0 75 f8 c3 66 90 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 0f 1f 44 00 00 ba 01 00 00 00 <8b> 07 85 c0 75 0a 3e 0f b1 17 85 c0 75 f2 f3 c3 f3 90 eb ec 81 


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch with Linux 4.11
---------------------------------------------------------------------------------------------
for AMD64 https://sf.net/projects/metztli-reiser4/
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
