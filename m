From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Testing a custom kernel (2.6.39) with native reiser4 support
Date: Tue, 15 May 2012 12:12:19 +0200
Message-ID: <4FB22C03.1080509@gmail.com>
References: <CANish_kwKO1EUys-QS44oJeD1T7daFMn1QA0LdPC1ZVG6_RtOg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=Ox3Pl08e9QWq4hFW+Gvl/FOXhrKb3csxHbI2Im1RuUg=;
        b=AoarXPEu8CTm866nGcYqsyw+e2otTkO/j6I4wtHchTD02K8n4Jdqb97NzNG4wSotFo
         MlT+yHrE3hBFOVzpV7bvCc8L00DN9WNHDkaHLMCzSrqiImpUddAXdY8bvmY3FUU9N37Z
         ELRuf7aS8tO/OPjzM+IzvNBSE8nVhUJpA+OouWpXBiNbSGJqpOhtNRPXBR8ktO0Wx+k5
         +otUWVKFY99Wv4kgCvT/cFcQCiST+Q+1DlZnc/t3NK/ybRQEaVNk5sxabifvwOWn0Uh1
         oBN3XKycxxm906pK/Th+3SM8Jz9zKMGa0NCYJRKRGg7CBF/lMQf7cL71pgFVQTD5djui
         Pivg==
In-Reply-To: <CANish_kwKO1EUys-QS44oJeD1T7daFMn1QA0LdPC1ZVG6_RtOg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sandro Souza <escovadordebits@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 05/15/2012 12:55 AM, Sandro Souza wrote:
> Hello my friends.

Hello.

>
> I made a new custom distro based on debian squeeze, but with 2.6.39
> kernel, patched with reiser4
> (http://downloads.sourceforge.net/project/reiser4/reiser4-for-linux-2.6/reiser4-for-2.6.39-1.patch.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Freiser4%2Ffiles%2Freiser4-for-linux-2.6%2F&ts=1337035240&use_mirror=ufpr).
>
> Trying to copy a folder from a reiser3 partition to a reiser4
> partition, I got error messages.
>
> Testing my custom kernel with "preemption model" in "Preemptible
> Kernel", I got these messages:
>
> [  286.945598] ------------[ cut here ]------------
> [  286.945609] kernel BUG at fs/reiser4/block_alloc.c:151!
> [  286.945617] invalid opcode: 0000 [#1] PREEMPT SMP
> [  286.945626] last sysfs file:
>
[...]

> [  286.945676]
> [  286.945683] Pid: 2433, comm: nautilus Not tainted 2.6.39-reiser4 #1
> innotek GmbH VirtualBox
> [  286.945691] RIP: 0010:[<ffffffff81178fae>]  [<ffffffff81178fae>]
> grabbed2flush_reserved_nolock+0x33/0x7b


It seems we forget to reserve space somewhere in write_end_cryptcompress().

Reiser4 uses technique of "soft ENOSPC": since it is impossible to
estimate precisely amount of disk space that will be spent by any
operation, every thread reserves needed amount of space with store,
so that surplus will be freed at commit time.

It seems we forget to reserve space somewhere in 
write_end_cryptcompress() for some needs, so that all reserved space
is exhausted and update_sd(), which wants 1 reserved block encounters
a zeroed counter of reserved blocks.

I'll try to take a look at this problem at leisure. For now
please don't use loop devices over compressed reiser4 files.

Thanks,
Edward.



> [  286.945704] RSP: 0018:ffff880014219b38  EFLAGS: 00010297
> [  286.945711] RAX: ffff88003b3df900 RBX: ffff88002fe75000 RCX: 0000000000112ef7
> [  286.945718] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff88003d3801c0
> [  286.945724] RBP: 0000000000000001 R08: 0000000000000000 R09: 000000000000000b
> [  286.945730] R10: dead000000100100 R11: ffff880014219c50 R12: ffff88003d385500
> [  286.945737] R13: ffff8800119bb000 R14: ffff880014219c38 R15: 0000000000001000
> [  286.945744] FS:  00007f126661d700(0000) GS:ffff88003fc00000(0000)
> knlGS:0000000000000000
> [  286.945750] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> [  286.945756] CR2: 00007fba4a3df010 CR3: 000000003be2b000 CR4: 00000000000006f0
> [  286.945766] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  286.945772] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
> [  286.945778] Process nautilus (pid: 2433, threadinfo
> ffff880014218000, task ffff88001406e940)
> [  286.945783] Stack:
> [  286.945788]  0000000000000000 ffff8800119bb000 ffff88003d3801c0
> ffffffff8117b484
> [  286.945795]  ffff8800119bb050 ffff8800119bb000 0000000000000000
> ffffffff8117b529
> [  286.945802]  0000000000000000 ffff88003d385608 0000000000000000
> ffffffff8118e00d
> [  286.945808] Call Trace:
> [  286.945817]  [<ffffffff8117b484>] ? jnode_make_dirty_locked+0x112/0x18f
> [  286.945824]  [<ffffffff8117b529>] ? znode_make_dirty+0x28/0x87
> [  286.945831]  [<ffffffff8118e00d>] ? update_sd+0x344/0x3a4
> [  286.945838]  [<ffffffff81387a46>] ? sub_preempt_count+0x83/0x94
> [  286.945845]  [<ffffffff8118e096>] ? write_sd_by_inode_common+0x29/0x92
> [  286.945852]  [<ffffffff8103cb67>] ? get_parent_ip+0x9/0x1b
> [  286.945858]  [<ffffffff8118512b>] ? reiser4_dirty_inode+0x19/0x73
> [  286.945865]  [<ffffffff810edecb>] ? T.1132+0x12/0x2e
> [  286.945872]  [<ffffffff8104b288>] ? current_fs_time+0x1e/0x24
> [  286.945878]  [<ffffffff81112ddb>] ? __mark_inode_dirty+0x28/0x1c8
> [  286.945885]  [<ffffffff81108169>] ? file_update_time+0xf7/0x126
> [  286.945891]  [<ffffffff811924ee>] ? reiser4_write_end_careful+0x147/0x184
> [  286.945897]  [<ffffffff81115083>] ? pipe_to_file+0x152/0x161
> [  286.945903]  [<ffffffff81387af5>] ? add_preempt_count+0x9e/0xa0
> [  286.945909]  [<ffffffff81114f31>] ? generic_file_splice_write+0x133/0x133
> [  286.945914]  [<ffffffff811143cb>] ? splice_from_pipe_feed+0x6d/0xed
> [  286.945920]  [<ffffffff81114eb3>] ? generic_file_splice_write+0xb5/0x133
> [  286.945933]  [<ffffffff811162a6>] ? sys_splice+0x2f8/0x3d2
> [  286.945939]  [<ffffffff8138a7d2>] ? system_call_fastpath+0x16/0x1b
> [  286.945944] Code: 25 80 cc 00 00 53 48 83 ec 08 48 8b 80 38 05 00
> 00 48 8b 90 a0 00 00 00 48 8b 9a 88 02 00 00 48 8b 90 b0 00 00 00 48
> 39 f2 73 04<0f>  0b eb fe 48 29 f2 48 89 90 b0 00 00 00 8b 07 89 c2 c1
> fa 10
> [  286.945968] RIP  [<ffffffff81178fae>] grabbed2flush_reserved_nolock+0x33/0x7b
> [  286.945974]  RSP<ffff880014219b38>
> [  286.945979] ---[ end trace cd39088cc6246a13 ]---
>
> Testing my custom kernel with "preemption model" in "Voluntary  Kernel
> Preemption", I got these messages:
>
> [  234.212538] ------------[ cut here ]------------
> [  234.212549] kernel BUG at fs/reiser4/block_alloc.c:151!
> [  234.212551] invalid opcode: 0000 [#1] SMP
> [  234.212553] last sysfs file:
> /sys/devices/pci0000:00/0000:00:0b.0/usb1/1-1/1-1:1.0/host2/target2:0:0/2:0:0:0/block/sdc/sdc1/uevent
> [  234.212556] CPU 0
> [  234.212557] Modules linked in: mperf cpufreq_powersave
> cpufreq_stats cpufreq_userspace cpufreq_conservative ppdev lp
> bluetooth rfkill binfmt_misc fuse loop snd_intel8x0 i2c_piix4
> snd_ac97_codec psmouse joydev processor thermal_sys evdev i2c_core
> parport_pc parport tpm_tis pcspkr tpm serio_raw tpm_bios ac ac97_bus
> snd_pcm snd_seq snd_timer snd_seq_device snd button soundcore
> snd_page_alloc usbhid hid ide_cd_mod cdrom ata_generic sd_mod
> pata_acpi ata_piix crc_t10dif usb_storage ide_pci_generic ohci_hcd
> ahci libahci ehci_hcd libata piix scsi_mod usbcore e1000 ide_core
> [last unloaded: scsi_wait_scan]
> [  234.212581]
> [  234.212583] Pid: 2530, comm: nautilus Not tainted 2.6.39-reiser4 #1
> innotek GmbH VirtualBox
> [  234.212585] RIP: 0010:[<ffffffff81173400>]  [<ffffffff81173400>]
> grabbed2flush_reserved_nolock+0x33/0x87
> [  234.212591] RSP: 0018:ffff88003da41b68  EFLAGS: 00010297
> [  234.212592] RAX: ffff88003c939500 RBX: ffff88003bcf9800 RCX: ffff880007e49d80
> [  234.212594] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff8800215e41c0
> [  234.212595] RBP: 0000000000000001 R08: 0000000000000000 R09: 000000000000000b
> [  234.212596] R10: ffff88002d3b96b0 R11: ffff88003da41c80 R12: ffff880021693500
> [  234.212598] R13: ffff88001056b900 R14: ffff88003da41c68 R15: 0000000000001000
> [  234.212605] FS:  00007f94bc7cc700(0000) GS:ffff88003fc00000(0000)
> knlGS:0000000000000000
> [  234.212607] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> [  234.212608] CR2: 0000000000428060 CR3: 000000003c197000 CR4: 00000000000006f0
> [  234.212614] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  234.212615] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
> [  234.212617] Process nautilus (pid: 2530, threadinfo
> ffff88003da40000, task ffff880026095b00)
> [  234.212618] Stack:
> [  234.212619]  0000000000000000 ffff88001056b900 ffff8800215e41c0
> ffffffff81175c90
> [  234.212621]  0000000000001000 ffff88001056b900 0000000000000000
> ffffffff81175d40
> [  234.212624]  0000000000000000 ffff880021693608 0000000000000000
> ffffffff81188945
> [  234.212626] Call Trace:
> [  234.212630]  [<ffffffff81175c90>] ? jnode_make_dirty_locked+0x112/0x19a
> [  234.212632]  [<ffffffff81175d40>] ? znode_make_dirty+0x28/0xa1
> [  234.212634]  [<ffffffff81188945>] ? update_sd+0x368/0x3d9
> [  234.212637]  [<ffffffff81171f26>] ? insert_by_coord+0xef/0x101
> [  234.212641]  [<ffffffff81199f4d>] ? ctail_insert_unprepped_cluster+0xe3/0xf2
> [  234.212643]  [<ffffffff811889df>] ? write_sd_by_inode_common+0x29/0x92
> [  234.212645]  [<ffffffff81175a1d>] ? jnode_get_atom+0x34/0xac
> [  234.212648]  [<ffffffff8117fab1>] ? reiser4_dirty_inode+0x19/0x73
> [  234.212652]  [<ffffffff81049a2c>] ? current_fs_time+0x1e/0x24
> [  234.212656]  [<ffffffff810ea179>] ? kfree+0xa8/0xcc
> [  234.212659]  [<ffffffff8110d9ee>] ? __mark_inode_dirty+0x22/0x1a4
> [  234.212671]  [<ffffffff81103254>] ? file_update_time+0xea/0x115
> [  234.212674]  [<ffffffff8118ce02>] ? reiser4_write_end_careful+0x147/0x184
> [  234.212677]  [<ffffffff8110fa8c>] ? pipe_to_file+0x12f/0x13e
> [  234.212679]  [<ffffffff8110f95d>] ? generic_file_splice_write+0x133/0x133
> [  234.212681]  [<ffffffff8110eebb>] ? splice_from_pipe_feed+0x6d/0xed
> [  234.212684]  [<ffffffff8110f8df>] ? generic_file_splice_write+0xb5/0x133
> [  234.212686]  [<ffffffff811100c7>] ? sys_splice+0x2f8/0x3db
> [  234.212689]  [<ffffffff81382412>] ? system_call_fastpath+0x16/0x1b
> [  234.212690] Code: 25 80 cc 00 00 53 48 83 ec 08 48 8b 80 18 05 00
> 00 48 8b 90 a0 00 00 00 48 8b 9a 88 02 00 00 48 8b 90 b0 00 00 00 48
> 39 f2 73 04<0f>  0b eb fe 48 29 f2 48 89 90 b0 00 00 00 8b 07 89 c2 c1
> fa 10
> [  234.212706] RIP  [<ffffffff81173400>] grabbed2flush_reserved_nolock+0x33/0x87
> [  234.212708]  RSP<ffff88003da41b68>
> [  234.212710] ---[ end trace 6e3abf5361ca3bde ]---
>
> Please, I need help to find the right way.
>
> Thanks in advance.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

