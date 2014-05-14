From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [Bug] [Reiser4] [XEN] PV crash on PV shutdown
Date: Wed, 14 May 2014 10:43:22 +0200
Message-ID: <53732CAA.8090201@gmail.com>
References: <20140511004226.Horde.YdilagZKQg2xklQ-6llzdg9@mail.thieu.so> <536F3A5E.8050104@gmail.com> <20140512045528.Horde.bPe89nkfHk2GNvv0sYejHQ1@mail.thieu.so>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=2Z5Nmqd4Z07QY9b6gJKY/Cpz2+4zLU6GiJ8SJp/95rE=;
        b=d2UbwMmVDoLkPeLH3U4ecyviNjMg60x1W6JpPsfYdl2FzeIMTzs0J+cjhc7FcHLcIH
         fw+8UbsVBAp/LPOUug0XUkXsjWkksz0N+ZfAt9G7kdJId9wK46ZTQrCwezsQ0iqqJPoc
         GPaZRSKlN4CGE9gH2aAtT2bdh0mpsQCiSSt0Qcbe6ZrABE6ZL1M2pomZYnzeMSQqvqBq
         t+ug/Y8JeVNsCSpPxglrqEYiFPCGY/5lQEbWGkpfwfTAPB3qg/kr/VNg0QRZV293EFjL
         mXj8CerB3pRLKE3KY6Z2A6wgUwpDz5Ziv3WkiaPOWjMZgVPeYTxf/xTCKde3Kn48nflR
         n6Kw==
In-Reply-To: <20140512045528.Horde.bPe89nkfHk2GNvv0sYejHQ1@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: m@thieu.so
Cc: reiserfs-devel@vger.kernel.org

On 05/12/2014 06:55 AM, m@thieu.so wrote:
> 3.15.0-rc3-Miner-dirty is the rc3 from git + the reiser4 patch


Which reiser4 patch?
As I can see from your kernel logs, this is *not* reiser4-for-3.14.1.patch
Please,  check..

Edward.


>
> I retested the VM and with kernel 3.12, 3.13 and 3.14, it's fine.
>
> The problem is only with 3.15-rc3 and now rc5 that I just compiled. 
> Still, it affect only the VM with a Reiser4 (reg40) /. Don't have any 
> problem with the host but the / is not reiser4. The host only have a 
> luks Reiser4 partition (ccreg40) on a second HDD.
>
> The patch apply but something probably need to be changed.
>
>
> Quoting Edward Shishkin <edward.shishkin@gmail.com>:
>
>> Hello.
>>
>> This is incorrect disk space reservation by some process.
>> What is the "3.15.0-rc3-Miner-dirty"? It could happen that
>> reiser4 stuff was applied incorrectly...
>>
>> Thanks,
>> Edward.
>>
>>
>> On 05/11/2014 02:42 AM, m@thieu.so wrote:
>>> Hi, I got a crash when I shutdown a XEN PV guest.
>>>
>>> This Funtoo guest is freshly installed and the bug is easy to 
>>> reproduce.
>>> * I have lot of Reiser4 partition on bare metal with the same 
>>> kernel, no problem
>>> * After 3-4 times crashing it, running fsck return no corruption.
>>>
>>> to reproduce :
>>> - create a Xen PV with a Reiser4 /
>>> - issue the command : poweroff
>>>
>>> tanith xen # xl create -c metro.pv
>>> Parsing config from metro.pv
>>> [    0.000000] Initializing cgroup subsys cpuset
>>> [    0.000000] Initializing cgroup subsys cpu
>>> [    0.000000] Linux version 3.15.0-rc3-Miner-dirty (root@tanith) 
>>> (gcc version 4.7.3 (Gentoo 4.7.3-r1 p1.4, pie-0.5.5) ) #3 SMP 
>>> PREEMPT Tue Apr 29 22:46:14 CDT 2014
>>> [    0.000000] Command line: console=hvc0 root=/dev/xvda2
>>> [    0.000000] KERNEL supported cpus:
>>> [    0.000000]   AMD AuthenticAMD
>>> [    0.000000] ACPI in unprivileged domain disabled
>>> [    0.000000] e820: BIOS-provided physical RAM map:
>>> [    0.000000] Xen: [mem 0x0000000000000000-0x000000000009ffff] usable
>>> [    0.000000] Xen: [mem 0x00000000000a0000-0x00000000000fffff] 
>>> reserved
>>> [    0.000000] Xen: [mem 0x0000000000100000-0x000000007fffffff] usable
>>> [    0.000000] NX (Execute Disable) protection: active
>>> [    0.000000] MPS support code is not built-in.
>>> [    0.000000] Using acpi=off or acpi=noirq or pci=noacpi may have 
>>> problem
>>> [    0.000000] DMI not present or invalid.
>>> [    0.000000] e820: last_pfn = 0x80000 max_arch_pfn = 0x400000000
>>> [    0.000000] Scanning 1 areas for low memory corruption
>>> [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
>>> [    0.000000] init_memory_mapping: [mem 0x7fe00000-0x7fffffff]
>>> [    0.000000] init_memory_mapping: [mem 0x7c000000-0x7fdfffff]
>>> [    0.000000] init_memory_mapping: [mem 0x00100000-0x7bffffff]
>>> [    0.000000] NUMA turned off
>>> [    0.000000] Faking a node at [mem 
>>> 0x0000000000000000-0x000000007fffffff]
>>> [    0.000000] Initmem setup node 0 [mem 0x00000000-0x7fffffff]
>>> [    0.000000]   NODE_DATA [mem 0x7fc0e000-0x7fc18fff]
>>> [    0.000000] Zone ranges:
>>> [    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
>>> [    0.000000]   DMA32    [mem 0x01000000-0xffffffff]
>>> [    0.000000]   Normal   empty
>>> [    0.000000] Movable zone start for each node
>>> [    0.000000] Early memory node ranges
>>> [    0.000000]   node   0: [mem 0x00001000-0x0009ffff]
>>> [    0.000000]   node   0: [mem 0x00100000-0x7fffffff]
>>> [    0.000000] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
>>> [    0.000000] No local APIC present
>>> [    0.000000] APIC: disable apic facility
>>> [    0.000000] APIC: switched to apic NOOP
>>> [    0.000000] e820: [mem 0x80000000-0xffffffff] available for PCI 
>>> devices
>>> [    0.000000] Booting paravirtualized kernel on Xen
>>> [    0.000000] Xen version: 4.4.0 (preserve-AD)
>>> [    0.000000] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 
>>> nr_cpu_ids:2 nr_node_ids:1
>>> [    0.000000] PERCPU: Embedded 28 pages/cpu @ffff88007d000000 
>>> s83392 r8192 d23104 u1048576
>>> [    0.000000] Built 1 zonelists in Node order, mobility grouping 
>>> on.  Total pages: 515978
>>> [    0.000000] Policy zone: DMA32
>>> [    0.000000] Kernel command line: console=hvc0 root=/dev/xvda2
>>> [    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
>>> [    0.000000] xsave: enabled xstate_bv 0x7, cntxt size 0x340
>>> [    0.000000] Memory: 2040644K/2096764K available (5843K kernel 
>>> code, 589K rwdata, 2168K rodata, 908K init, 2788K bss, 56120K reserved)
>>> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, 
>>> Nodes=1
>>> [    0.000000] Preemptible hierarchical RCU implementation.
>>> [    0.000000]  RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=2.
>>> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, 
>>> nr_cpu_ids=2
>>> [    0.000000] NR_IRQS:4352 nr_irqs:288 16 3.15.0-rc3-Miner-dirty
>>> [    0.000000] xen:events: Using FIFO-based ABI
>>> [    0.000000] Console: colour dummy device 80x25
>>> [    0.000000] console [tty0] enabled
>>> [    0.000000] console [hvc0] enabled
>>> [    0.000000] installing Xen timer for CPU 0
>>> [    0.000000] tsc: Detected 3114.152 MHz processor
>>> [    0.000000] tsc: Marking TSC unstable due to TSCs unsynchronized
>>> [    0.001000] Calibrating delay loop (skipped), value calculated 
>>> using timer frequency.. 6228.30 BogoMIPS (lpj=3114152)
>>> [    0.001000] pid_max: default: 32768 minimum: 301
>>> [    0.001000] Security Framework initialized
>>> [    0.001000] Dentry cache hash table entries: 262144 (order: 9, 
>>> 2097152 bytes)
>>> [    0.001000] Inode-cache hash table entries: 131072 (order: 8, 
>>> 1048576 bytes)
>>> [    0.001205] Mount-cache hash table entries: 4096 (order: 3, 32768 
>>> bytes)
>>> [    0.001219] Mountpoint-cache hash table entries: 4096 (order: 3, 
>>> 32768 bytes)
>>> [    0.001429] Initializing cgroup subsys freezer
>>> [    0.001436] Initializing cgroup subsys net_cls
>>> [    0.001441] Initializing cgroup subsys blkio
>>> [    0.001488] CPU: Physical Processor ID: 0
>>> [    0.001493] CPU: Processor Core ID: 5
>>> [    0.001499] Last level iTLB entries: 4KB 512, 2MB 1024, 4MB 512
>>> [    0.001499] Last level dTLB entries: 4KB 1024, 2MB 1024, 4MB 512, 
>>> 1GB 0
>>> [    0.001499] tlb_flushall_shift: 6
>>> [    0.019675] cpu 0 spinlock event irq 17
>>> [    0.019982] Performance Events: Fam15h core perfctr,
>>> [    0.019989] no APIC, boot with the "lapic" boot parameter to 
>>> force-enable it.
>>> [    0.019995] no hardware sampling interrupt available.
>>> [    0.020000] Broken PMU hardware detected, using software events 
>>> only.
>>> [    0.020000] Failed to access perfctr msr (MSR c0010201 is 
>>> ffffaf1b0426)
>>> [    0.026049] NMI watchdog: disabled (cpu0): hardware events not 
>>> enabled
>>> [    0.028084] installing Xen timer for CPU 1
>>> [    0.028110] cpu 1 spinlock event irq 24
>>> [    0.028221] SMP alternatives: switching to SMP code
>>> [    0.045855] x86: Booted up 1 node, 2 CPUs
>>> [    0.045915] devtmpfs: initialized
>>> [    0.046076] kworker/u4:0 (21) used greatest stack depth: 6608 
>>> bytes left
>>> [    0.046157] xor: automatically using best checksumming function:
>>> [    0.055307]    avx       :  6088.000 MB/sec
>>> [    0.055355] NET: Registered protocol family 16
>>> [    0.055367] xen:grant_table: Grant tables using version 1 layout
>>> [    0.055383] Grant table initialized
>>> [    0.056116] kworker/u4:1 (27) used greatest stack depth: 6504 
>>> bytes left
>>> [    0.056116] kworker/u4:1 (28) used greatest stack depth: 5976 
>>> bytes left
>>> [    0.056243] PCI: setting up Xen PCI frontend stub
>>> [    0.061325] kworker/u4:1 (60) used greatest stack depth: 5544 
>>> bytes left
>>> [    0.074099] raid6: sse2x1    4992 MB/s
>>> [    0.091161] raid6: sse2x2    9789 MB/s
>>> [    0.108221] raid6: sse2x4   11984 MB/s
>>> [    0.108226] raid6: using algorithm sse2x4 (11984 MB/s)
>>> [    0.108231] raid6: using ssse3x2 recovery algorithm
>>> [    0.109001] ACPI: Interpreter disabled.
>>> [    0.109008] xen:balloon: Initialising balloon driver
>>> [    0.112059] xen_balloon: Initialising balloon driver
>>> [    0.113051] vgaarb: loaded
>>> [    0.113103] SCSI subsystem initialized
>>> [    0.113172] usbcore: registered new interface driver usbfs
>>> [    0.113191] usbcore: registered new interface driver hub
>>> [    0.113220] usbcore: registered new device driver usb
>>> [    0.113220] PCI: System does not support PCI
>>> [    0.113220] PCI: System does not support PCI
>>> [    0.113220] NetLabel: Initializing
>>> [    0.113220] NetLabel:  domain hash size = 128
>>> [    0.113220] NetLabel:  protocols = UNLABELED CIPSOv4
>>> [    0.113220] NetLabel:  unlabeled traffic allowed by default
>>> [    0.113236] Switched to clocksource xen
>>> [    0.116033] pnp: PnP ACPI: disabled
>>> [    0.118721] NET: Registered protocol family 2
>>> [    0.118847] TCP established hash table entries: 16384 (order: 5, 
>>> 131072 bytes)
>>> [    0.118918] TCP bind hash table entries: 16384 (order: 6, 262144 
>>> bytes)
>>> [    0.118968] TCP: Hash tables configured (established 16384 bind 
>>> 16384)
>>> [    0.118998] TCP: reno registered
>>> [    0.119009] UDP hash table entries: 1024 (order: 3, 32768 bytes)
>>> [    0.119026] UDP-Lite hash table entries: 1024 (order: 3, 32768 
>>> bytes)
>>> [    0.119152] platform rtc_cmos: registered platform RTC device (no 
>>> PNP device found)
>>> [    0.119240] Scanning for low memory corruption every 60 seconds
>>> [    0.119358] futex hash table entries: 512 (order: 3, 32768 bytes)
>>> [    0.119377] audit: initializing netlink subsys (disabled)
>>> [    0.119390] audit: type=2000 audit(1399767930.035:1): initialized
>>> [    0.129194] HugeTLB registered 2 MB page size, pre-allocated 0 pages
>>> [    0.194964] VFS: Disk quotas dquot_6.5.2
>>> [    0.195013] Dquot-cache hash table entries: 512 (order 0, 4096 
>>> bytes)
>>> [    0.195042] Loading Reiser4. See www.namesys.com for a 
>>> description of Reiser4.
>>> [    0.195284] msgmni has been set to 3985
>>> [    0.195549] Block layer SCSI generic (bsg) driver version 0.4 
>>> loaded (major 253)
>>> [    0.195559] io scheduler noop registered
>>> [    0.195566] io scheduler deadline registered
>>> [    0.195607] io scheduler cfq registered (default)
>>> [    0.195934] crc32: CRC_LE_BITS = 64, CRC_BE BITS = 64
>>> [    0.195941] crc32: self tests passed, processed 225944 bytes in 
>>> 156546 nsec
>>> [    0.196094] crc32c: CRC_LE_BITS = 64
>>> [    0.196100] crc32c: self tests passed, processed 225944 bytes in 
>>> 68927 nsec
>>> [    0.414245] crc32_combine: 8373 self tests passed
>>> [    0.638942] crc32c_combine: 8373 self tests passed
>>> [    0.639166] xen:xen_evtchn: Event-channel device installed
>>> [    0.639642] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
>>> [    0.640072] Linux agpgart interface v0.103
>>> [    0.641081] loop: module loaded
>>> [    0.692213] xen_netfront: Initialising Xen virtual ethernet driver
>>> [    0.720369] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) 
>>> Driver
>>> [    0.720382] ehci-pci: EHCI PCI platform driver
>>> [    0.720408] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
>>> [    0.720419] ohci-pci: OHCI PCI platform driver
>>> [    0.720496] i8042: PNP: No PS/2 controller found. Probing ports 
>>> directly.
>>> [    0.809787] blkfront: xvda: flush diskcache: enabled; persistent 
>>> grants: enabled; indirect descriptors: enabled;
>>> [    0.834386]  xvda: xvda1 xvda2
>>> [    0.848344] blkfront: xvdb: flush diskcache: enabled; persistent 
>>> grants: enabled; indirect descriptors: enabled;
>>> [    0.866357]  xvdb: unknown partition table
>>> [    1.734641] i8042: No controller found
>>> [    1.734812] mousedev: PS/2 mouse device common for all mice
>>> [    1.795015] rtc_cmos rtc_cmos: rtc core: registered rtc_cmos as rtc0
>>> [    1.795094] rtc_cmos: probe of rtc_cmos failed with error -38
>>> [    1.795169] hidraw: raw HID events driver (C) Jiri Kosina
>>> [    1.795244] usbcore: registered new interface driver usbhid
>>> [    1.795253] usbhid: USB HID core driver
>>> [    1.795307] TCP: cubic registered
>>> [    1.795485] registered taskstats version 1
>>> [    1.796024] Btrfs loaded
>>> [    1.796137] console [netcon0] enabled
>>> [    1.796144] netconsole: network logging started
>>> [    1.813668] reiser4: xvda2: found disk format 4.0.0.
>>> [    2.172849] random: nonblocking pool is initialized
>>> [    4.519997] VFS: Mounted root (reiser4 filesystem) on device 202:2.
>>> [    4.521323] Freeing unused kernel memory: 908K (ffffffff81a95000 
>>> - ffffffff81b78000)
>>> Broadcast message from root@localhost (hvc0) (Sat May 10 19:29:08 
>>> 2014):
>>> The system is going down for system halt NOW!
>>> INIT: Switching to runlevel: 0
>>> INIT: Sending processes the TERM signal
>>> localhost ~ #  * Stopping local
>>> [ ok ]
>>> * Saving random seed ...
>>> [ ok ]
>>> * Deactivating additional swap space ...
>>> [ ok ]
>>> * Stopping sshd ...
>>> [ ok ]
>>> * Unmounting network filesystems ...
>>> [ ok ]
>>> * Shutting down network interface lo ...
>>> [ ok ]
>>> * Network interface eth0 down ...
>>> [ ok ]
>>> * Unmounting loop devices
>>> * Unmounting filesystems
>>> *   Unmounting /boot ...
>>> [ ok ]
>>> * Deactivating swap devices ...
>>> [ ok ]
>>> * Stopping udevd daemon ...
>>> [ ok ]
>>> * udev: Device tarball disabled, skipping ...
>>> [ ok ]
>>> * Terminating remaining processes ...
>>> [ ok ]
>>> * Killing remaining processes ...
>>> [ ok ]
>>> * Saving dependency cache ...
>>> [ ok ]
>>> * Remounting remaining filesystems read-only ...
>>> *   Remounting / read only ...
>>> [ ok ]
>>> [ ok ]
>>> [   43.548966] ------------[ cut here ]------------
>>> [   43.548999] kernel BUG at fs/reiser4/block_alloc.c:151!
>>> [   43.549019] invalid opcode: 0000 [#1] PREEMPT SMP
>>> [   43.549049] Modules linked in: ipv6 processor thermal_sys 
>>> crct10dif_pclmul crct10dif_common crc32_pclmul crc32c_intel 
>>> ghash_clmulni_intel aesni_intel aes_x86_64 lrw gf128mul glue_helper 
>>> ablk_helper cryptd microcode unix
>>> [   43.549067] CPU: 1 PID: 20 Comm: kworker/u4:1 Not tainted 
>>> 3.15.0-rc3-Miner-dirty #3
>>> [   43.549067] Workqueue: writeback bdi_writeback_workfn (flush-202:0)
>>> [   43.549067] task: ffff88007cfc0fe0 ti: ffff88007c41e000 task.ti: 
>>> ffff88007c41e000
>>> [   43.549067] RIP: e030:[<ffffffff811e09b4>] [<ffffffff811e09b4>] 
>>> sub_from_ctx_grabbed.isra.10+0x14/0x20
>>> [   43.549067] RSP: e02b:ffff88007c41f808  EFLAGS: 00010297
>>> [   43.549067] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 
>>> 0000000000002624
>>> [   43.549067] RDX: 0000000000000001 RSI: 0000000000000001 RDI: 
>>> ffff88007c47afb0
>>> [   43.549067] RBP: ffff88007c41f808 R08: 00000000000b5f17 R09: 
>>> 0000000000000187
>>> [   43.549067] R10: 0000000000000000 R11: 00000000000061d8 R12: 
>>> ffff88007c41f898
>>> [   43.549067] R13: 0000000000000014 R14: ffff88007c47af00 R15: 
>>> 0000000000000000
>>> [   43.549067] FS:  00007f609a147700(0000) GS:ffff88007d100000(0000) 
>>> knlGS:0000000000000000
>>> [   43.549067] CS:  e033 DS: 0000 ES: 0000 CR0: 000000008005003b
>>> [   43.549067] CR2: 00007f6099c57330 CR3: 000000007b531000 CR4: 
>>> 0000000000040660
>>> [   43.549067] Stack:
>>> [   43.549067]  ffff88007c41f868 ffffffff811e1448 ffff88007c47af00 
>>> ffff88007c41f890
>>> [   43.549067]  0000000000000001 ffff88007c43f000 ffff88007c41f868 
>>> ffff88007c9f7380
>>> [   43.549067]  ffff88007b629d90 0000000000000000 ffff88007c41f9b8 
>>> 0000000000000000
>>> [   43.549067] Call Trace:
>>> [   43.549067]  [<ffffffff811e1448>] reiser4_alloc_blocks+0xc8/0x280
>>> [   43.549067]  [<ffffffff811e697f>] allocate_znode_update+0x7f/0x280
>>> [   43.549067]  [<ffffffff815a95b6>] ? _raw_spin_lock+0x16/0x60
>>> [   43.549067]  [<ffffffff811d6220>] ? jload_gfp+0x40/0x1c0
>>> [   43.549067]  [<ffffffff811e6bfa>] allocate_znode+0x7a/0x1c0
>>> [   43.549067]  [<ffffffff811e8e46>] 
>>> jnode_flush.constprop.35+0x806/0x9e0
>>> [   43.549067]  [<ffffffff811e920e>] flush_current_atom+0x1ee/0x3e0
>>> [   43.549067]  [<ffffffff811e4751>] flush_some_atom+0x111/0x520
>>> [   43.549067]  [<ffffffff811f3e97>] reiser4_writeout+0xb7/0x1a0
>>> [   43.549067]  [<ffffffff811f071c>] 
>>> reiser4_writeback_inodes+0x9c/0x140
>>> [   43.549067]  [<ffffffff813a35eb>] ? xen_send_IPI_one+0x2b/0x60
>>> [   43.549067]  [<ffffffff81187a3c>] writeback_sb_inodes+0x9c/0xc0
>>> [   43.549067]  [<ffffffff81187aff>] __writeback_inodes_wb+0x9f/0xe0
>>> [   43.549067]  [<ffffffff81187d4b>] wb_writeback+0x20b/0x320
>>> [   43.549067]  [<ffffffff81187f9a>] bdi_writeback_workfn+0x13a/0x480
>>> [   43.549067]  [<ffffffff8132f737>] ? debug_smp_processor_id+0x17/0x20
>>> [   43.549067]  [<ffffffff815a5a18>] ? __schedule+0x2f8/0x760
>>> [   43.549067]  [<ffffffff8106a258>] process_one_work+0x178/0x460
>>> [   43.549067]  [<ffffffff8106a9a8>] worker_thread+0x128/0x3a0
>>> [   43.549067]  [<ffffffff8106a880>] ? rescuer_thread+0x300/0x300
>>> [   43.549067]  [<ffffffff810717c4>] kthread+0xc4/0xe0
>>> [   43.549067]  [<ffffffff815a0000>] ? __first_node+0x12/0x1d
>>> [   43.549067]  [<ffffffff81071700>] ? flush_kthread_worker+0x80/0x80
>>> [   43.549067]  [<ffffffff815b118c>] ret_from_fork+0x7c/0xb0
>>> [   43.549067]  [<ffffffff81071700>] ? flush_kthread_worker+0x80/0x80
>>> [   43.549067] Code: 74 0b 89 f6 5d 48 29 b7 78 01 00 00 c3 0f 0b 0f 
>>> 1f 84 00 00 00 00 00 48 8b 07 55 48 89 e5 48 39 f0 72 08 48 29 f0 5d 
>>> 48 89 07 c3 <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 55 48 89 e5 41 54 
>>> 4c 63 e6
>>> [   43.549067] RIP  [<ffffffff811e09b4>] 
>>> sub_from_ctx_grabbed.isra.10+0x14/0x20
>>> [   43.549067]  RSP <ffff88007c41f808>
>>> [   43.550576] ---[ end trace c20d37e211566022 ]---
>>> [   43.550687] BUG: unable to handle kernel paging request at 
>>> ffffffffffffffd8
>>> [   43.550722] IP: [<ffffffff8107196c>] kthread_data+0xc/0x20
>>> [   43.550759] PGD 1a12067 PUD 1a14067 PMD 0
>>> [   43.550795] Oops: 0000 [#2] PREEMPT SMP
>>> [   43.550822] Modules linked in: ipv6 processor thermal_sys 
>>> crct10dif_pclmul crct10dif_common crc32_pclmul crc32c_intel 
>>> ghash_clmulni_intel aesni_intel aes_x86_64 lrw gf128mul glue_helper 
>>> ablk_helper cryptd microcode unix
>>> [   43.550920] CPU: 1 PID: 20 Comm: kworker/u4:1 Tainted: G D       
>>> 3.15.0-rc3-Miner-dirty #3
>>> [   43.550972] task: ffff88007cfc0fe0 ti: ffff88007c41e000 task.ti: 
>>> ffff88007c41e000
>>> [   43.550993] RIP: e030:[<ffffffff8107196c>] [<ffffffff8107196c>] 
>>> kthread_data+0xc/0x20
>>> [   43.551532] RSP: e02b:ffff88007c41f4a0  EFLAGS: 00010092
>>> [   43.551532] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 
>>> 0000000000000008
>>> [   43.551532] RDX: 0000000000000002 RSI: 0000000000000001 RDI: 
>>> ffff88007cfc0fe0
>>> [   43.551532] RBP: ffff88007c41f4b8 R08: 0000000000000001 R09: 
>>> 000000000000013a
>>> [   43.551532] R10: 0000000000000000 R11: 0000000000000000 R12: 
>>> ffff88007d113900
>>> [   43.551532] R13: 0000000000000001 R14: 0000000000000001 R15: 
>>> ffff88007cfc0fe0
>>> [   43.551532] FS:  00007f609a147700(0000) GS:ffff88007d100000(0000) 
>>> knlGS:0000000000000000
>>> [   43.551532] CS:  e033 DS: 0000 ES: 0000 CR0: 000000008005003b
>>> [   43.551532] CR2: 0000000000000028 CR3: 000000007b531000 CR4: 
>>> 0000000000040660
>>> [   43.551532] Stack:
>>> [   43.551532]  ffffffff8106b450 ffff88007c41f4b8 ffff88007cfc1418 
>>> ffff88007c41f538
>>> [   43.551532]  ffffffff815a5ba0 ffff88007c41f4e8 0000000000000000 
>>> ffff88007cfc0fe0
>>> [   43.551532]  0000000000013900 ffff88007c41ffd8 0000000000013900 
>>> ffff88007b494660
>>> [   43.551532] Call Trace:
>>> [   43.551532]  [<ffffffff8106b450>] ? wq_worker_sleeping+0x10/0xa0
>>> [   43.551532]  [<ffffffff815a5ba0>] __schedule+0x480/0x760
>>> [   43.551532]  [<ffffffff815a5f04>] schedule+0x24/0x80
>>> [   43.551532]  [<ffffffff81051e82>] do_exit+0x742/0xb20
>>> [   43.551532]  [<ffffffff8100c532>] ? check_events+0x12/0x20
>>> [   43.551532]  [<ffffffff815aa938>] oops_end+0x98/0x140
>>> [   43.551532]  [<ffffffff81018ea6>] die+0x46/0x80
>>> [   43.551532]  [<ffffffff815aa1fb>] do_trap+0x5b/0x180
>>> [   43.551532]  [<ffffffff81015f97>] do_invalid_op+0x97/0xa0
>>> [   43.551532]  [<ffffffff811e09b4>] ? 
>>> sub_from_ctx_grabbed.isra.10+0x14/0x20
>>> [   43.551532]  [<ffffffff8121aeef>] ? 
>>> bitmap_alloc_forward.constprop.15+0x8f/0xe0
>>> [   43.551532]  [<ffffffff815b25eb>] invalid_op+0x1b/0x20
>>> [   43.551532]  [<ffffffff811e09b4>] ? 
>>> sub_from_ctx_grabbed.isra.10+0x14/0x20
>>> [   43.551532]  [<ffffffff815a8fb6>] ? _raw_spin_unlock+0x16/0x60
>>> [   43.551532]  [<ffffffff811e1448>] reiser4_alloc_blocks+0xc8/0x280
>>> [   43.551532]  [<ffffffff811e697f>] allocate_znode_update+0x7f/0x280
>>> [   43.551532]  [<ffffffff815a95b6>] ? _raw_spin_lock+0x16/0x60
>>> [   43.551532]  [<ffffffff811d6220>] ? jload_gfp+0x40/0x1c0
>>> [   43.551532]  [<ffffffff811e6bfa>] allocate_znode+0x7a/0x1c0
>>> [   43.551532]  [<ffffffff811e8e46>] 
>>> jnode_flush.constprop.35+0x806/0x9e0
>>> [   43.551532]  [<ffffffff811e920e>] flush_current_atom+0x1ee/0x3e0
>>> [   43.551532]  [<ffffffff811e4751>] flush_some_atom+0x111/0x520
>>> [   43.551532]  [<ffffffff811f3e97>] reiser4_writeout+0xb7/0x1a0
>>> [   43.551532]  [<ffffffff811f071c>] 
>>> reiser4_writeback_inodes+0x9c/0x140
>>> [   43.551532]  [<ffffffff813a35eb>] ? xen_send_IPI_one+0x2b/0x60
>>> [   43.551532]  [<ffffffff81187a3c>] writeback_sb_inodes+0x9c/0xc0
>>> [   43.551532]  [<ffffffff81187aff>] __writeback_inodes_wb+0x9f/0xe0
>>> [   43.551532]  [<ffffffff81187d4b>] wb_writeback+0x20b/0x320
>>> [   43.551532]  [<ffffffff81187f9a>] bdi_writeback_workfn+0x13a/0x480
>>> [   43.551532]  [<ffffffff8132f737>] ? debug_smp_processor_id+0x17/0x20
>>> [   43.551532]  [<ffffffff815a5a18>] ? __schedule+0x2f8/0x760
>>> [   43.551532]  [<ffffffff8106a258>] process_one_work+0x178/0x460
>>> [   43.551532]  [<ffffffff8106a9a8>] worker_thread+0x128/0x3a0
>>> [   43.551532]  [<ffffffff8106a880>] ? rescuer_thread+0x300/0x300
>>> [   43.551532]  [<ffffffff810717c4>] kthread+0xc4/0xe0
>>> [   43.551532]  [<ffffffff815a0000>] ? __first_node+0x12/0x1d
>>> [   43.551532]  [<ffffffff81071700>] ? flush_kthread_worker+0x80/0x80
>>> [   43.551532]  [<ffffffff815b118c>] ret_from_fork+0x7c/0xb0
>>> [   43.551532]  [<ffffffff81071700>] ? flush_kthread_worker+0x80/0x80
>>> [   43.551532] Code: 90 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 
>>> 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 48 8b 87 e0 03 00 00 55 
>>> 48 89 e5 5d <48> 8b 40 d8 c3 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 
>>> 00 00 55
>>> [   43.551532] RIP  [<ffffffff8107196c>] kthread_data+0xc/0x20
>>> [   43.551532]  RSP <ffff88007c41f4a0>
>>> [   43.551532] CR2: ffffffffffffffd8
>>> [   43.551532] ---[ end trace c20d37e211566023 ]---
>>> [   43.551532] Fixing recursive fault but reboot is needed!
>>> [   43.551532] BUG: scheduling while atomic: kworker/u4:1/20/0x00000004
>>> [   43.551532] Modules linked in: ipv6 processor thermal_sys 
>>> crct10dif_pclmul crct10dif_common crc32_pclmul crc32c_intel 
>>> ghash_clmulni_intel aesni_intel aes_x86_64 lrw gf128mul glue_helper 
>>> ablk_helper cryptd microcode unix
>>> [   43.551532] Preemption disabled at:[<ffffffff815aa938>] 
>>> oops_end+0x98/0x140
>>> [   43.551532]
>>> [   43.551532] CPU: 1 PID: 20 Comm: kworker/u4:1 Tainted: G D       
>>> 3.15.0-rc3-Miner-dirty #3
>>> [   43.551532]  ffff88007d113900 ffff88007c41f088 ffffffff815a3a26 
>>> 0000000000000005
>>> [   43.551532]  0000000000000009 ffff88007c41f098 ffffffff815a04bf 
>>> ffff88007c41f118
>>> [   43.551532]  ffffffff815a5e4a ffff88007c41f3f8 0000000000000000 
>>> ffff88007cfc0fe0
>>> [   43.551532] Call Trace:
>>> [   43.551532]  [<ffffffff815a3a26>] dump_stack+0x4f/0x7c
>>> [   43.551532]  [<ffffffff815a04bf>] __schedule_bug+0x9a/0xa8
>>> [   43.551532]  [<ffffffff815a5e4a>] __schedule+0x72a/0x760
>>> [   43.551532]  [<ffffffff815a5f04>] schedule+0x24/0x80
>>> [   43.551532]  [<ffffffff8105219e>] do_exit+0xa5e/0xb20
>>> [   43.551532]  [<ffffffff815a0711>] ? printk+0x48/0x4a
>>> [   43.551532]  [<ffffffff81097119>] ? kmsg_dump+0xb9/0xe0
>>> [   43.551532]  [<ffffffff815aa938>] oops_end+0x98/0x140
>>> [   43.551532]  [<ffffffff8159fbf2>] no_context+0x28c/0x2b7
>>> [   43.551532]  [<ffffffff8100b3a9>] ? xen_pud_val+0x9/0x20
>>> [   43.551532]  [<ffffffff8159fdd8>] __bad_area_nosemaphore+0x1bb/0x1da
>>> [   43.551532]  [<ffffffff8159fe05>] bad_area_nosemaphore+0xe/0x10
>>> [   43.551532]  [<ffffffff815ace60>] __do_page_fault+0x3a0/0x4a0
>>> [   43.551532]  [<ffffffff8107cb65>] ? check_preempt_curr+0x85/0xa0
>>> [   43.551532]  [<ffffffff8107cb98>] ? ttwu_do_wakeup+0x18/0x100
>>> [   43.551532]  [<ffffffff815a94c8>] ? 
>>> _raw_spin_unlock_irqrestore+0x28/0x80
>>> [   43.551532]  [<ffffffff8107ffd5>] ? try_to_wake_up+0x1b5/0x280
>>> [   43.551532]  [<ffffffff81322eea>] ? vsnprintf+0x3ca/0x560
>>> [   43.551532]  [<ffffffff815acf82>] do_page_fault+0x22/0x40
>>> [   43.551532]  [<ffffffff815a9dd5>] page_fault+0x25/0x30
>>> [   43.551532]  [<ffffffff8107196c>] ? kthread_data+0xc/0x20
>>> [   43.551532]  [<ffffffff8106b450>] ? wq_worker_sleeping+0x10/0xa0
>>> [   43.551532]  [<ffffffff815a5ba0>] __schedule+0x480/0x760
>>> [   43.551532]  [<ffffffff815a5f04>] schedule+0x24/0x80
>>> [   43.551532]  [<ffffffff81051e82>] do_exit+0x742/0xb20
>>> [   43.551532]  [<ffffffff8100c532>] ? check_events+0x12/0x20
>>> [   43.551532]  [<ffffffff815aa938>] oops_end+0x98/0x140
>>> [   43.551532]  [<ffffffff81018ea6>] die+0x46/0x80
>>> [   43.551532]  [<ffffffff815aa1fb>] do_trap+0x5b/0x180
>>> [   43.551532]  [<ffffffff81015f97>] do_invalid_op+0x97/0xa0
>>> [   43.551532]  [<ffffffff811e09b4>] ? 
>>> sub_from_ctx_grabbed.isra.10+0x14/0x20
>>> [   43.551532]  [<ffffffff8121aeef>] ? 
>>> bitmap_alloc_forward.constprop.15+0x8f/0xe0
>>> [   43.551532]  [<ffffffff815b25eb>] invalid_op+0x1b/0x20
>>> [   43.551532]  [<ffffffff811e09b4>] ? 
>>> sub_from_ctx_grabbed.isra.10+0x14/0x20
>>> [   43.551532]  [<ffffffff815a8fb6>] ? _raw_spin_unlock+0x16/0x60
>>> [   43.551532]  [<ffffffff811e1448>] reiser4_alloc_blocks+0xc8/0x280
>>> [   43.551532]  [<ffffffff811e697f>] allocate_znode_update+0x7f/0x280
>>> [   43.551532]  [<ffffffff815a95b6>] ? _raw_spin_lock+0x16/0x60
>>> [   43.551532]  [<ffffffff811d6220>] ? jload_gfp+0x40/0x1c0
>>> [   43.551532]  [<ffffffff811e6bfa>] allocate_znode+0x7a/0x1c0
>>> [   43.551532]  [<ffffffff811e8e46>] 
>>> jnode_flush.constprop.35+0x806/0x9e0
>>> [   43.551532]  [<ffffffff811e920e>] flush_current_atom+0x1ee/0x3e0
>>> [   43.551532]  [<ffffffff811e4751>] flush_some_atom+0x111/0x520
>>> [   43.551532]  [<ffffffff811f3e97>] reiser4_writeout+0xb7/0x1a0
>>> [   43.551532]  [<ffffffff811f071c>] 
>>> reiser4_writeback_inodes+0x9c/0x140
>>> [   43.551532]  [<ffffffff813a35eb>] ? xen_send_IPI_one+0x2b/0x60
>>> [   43.551532]  [<ffffffff81187a3c>] writeback_sb_inodes+0x9c/0xc0
>>> [   43.551532]  [<ffffffff81187aff>] __writeback_inodes_wb+0x9f/0xe0
>>> [   43.551532]  [<ffffffff81187d4b>] wb_writeback+0x20b/0x320
>>> [   43.551532]  [<ffffffff81187f9a>] bdi_writeback_workfn+0x13a/0x480
>>> [   43.551532]  [<ffffffff8132f737>] ? debug_smp_processor_id+0x17/0x20
>>> [   43.551532]  [<ffffffff815a5a18>] ? __schedule+0x2f8/0x760
>>> [   43.551532]  [<ffffffff8106a258>] process_one_work+0x178/0x460
>>> [   43.551532]  [<ffffffff8106a9a8>] worker_thread+0x128/0x3a0
>>> [   43.551532]  [<ffffffff8106a880>] ? rescuer_thread+0x300/0x300
>>> [   43.551532]  [<ffffffff810717c4>] kthread+0xc4/0xe0
>>> [   43.551532]  [<ffffffff815a0000>] ? __first_node+0x12/0x1d
>>> [   43.551532]  [<ffffffff81071700>] ? flush_kthread_worker+0x80/0x80
>>> [   43.551532]  [<ffffffff815b118c>] ret_from_fork+0x7c/0xb0
>>> [   43.551532]  [<ffffffff81071700>] ? flush_kthread_worker+0x80/0x80
>>> tanith xen # fsck.reiser4 /dev/mapper/XenVolG-metro2 --fix
>>> *******************************************************************
>>> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
>>> *******************************************************************
>>>
>>> Fscking the /dev/mapper/XenVolG-metro2 block device.
>>> Will fix minor corruptions of the Reiser4 SuperBlock.
>>> Will fix minor corruptions of the Reiser4 FileSystem.
>>> Continue?
>>> (Yes/No): Yes
>>> ***** fsck.reiser4 started at Sat May 10 19:30:46 2014
>>> Reiser4 fs was detected on /dev/mapper/XenVolG-metro2.
>>> Master super block (16):
>>> magic:          ReIsEr4
>>> blksize:        4096
>>> format:         0x0 (format40)
>>> uuid:           83dd3b1c-1a24-4420-9c83-3fbd2748ad9d
>>> label:          <none>
>>>
>>> Format super block (17):
>>> plugin:         format40
>>> description:    Disk-format plugin.
>>> version:        0
>>> magic:          ReIsEr40FoRmAt
>>> mkfs id:        0x605ab6a1
>>> flushes:        0
>>> blocks:         10477312
>>> free blocks:    9934667
>>> root block:     184145
>>> tail policy:    0x2 (smart)
>>> next oid:       0x43a76
>>> file count:     208559
>>> tree height:    4
>>> key policy:     LARGE
>>>
>>>
>>> CHECKING THE STORAGE TREE
>>>        Read nodes 78712
>>>        Nodes left in the tree 78712
>>>                Leaves of them 77684, Twigs of them 1012
>>>        Time interval: Sat May 10 19:30:50 2014 - Sat May 10 19:31:08 
>>> 2014
>>> CHECKING EXTENT REGIONS.
>>>        Read twigs 1012
>>>        Time interval: Sat May 10 19:31:08 2014 - Sat May 10 19:31:08 
>>> 2014
>>> CHECKING THE SEMANTIC TREE
>>>        Found 209015 objects (some could be encountered more then once).
>>>        Time interval: Sat May 10 19:31:08 2014 - Sat May 10 19:31:11 
>>> 2014
>>> ***** fsck.reiser4 finished at Sat May 10 19:31:11 2014
>>> Closing fs...done
>>>
>>> FS is consistent.
>>>
>>> tanith xen #
>>>
>>>
>>> -- 
>>> To unsubscribe from this list: send the line "unsubscribe 
>>> reiserfs-devel" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe 
>> reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>
>
>

