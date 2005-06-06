From: "E.Gryaznova" <grev@namesys.com>
Subject: Re: reiser4 panicked cowardly: assertion failed: hint->blk < reiser4_block_count(super)
Date: Mon, 06 Jun 2005 12:43:19 +0400
Message-ID: <42A40CA7.2020404@namesys.com>
References: <20050605165029.386dc82e.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24316-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050605165029.386dc82e.reiser4@blinkenlights.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: reiserfs-list@namesys.com

Hello.

Do you have more than one mounted reiser4 partition?

Thanks,
Lena

Adrian Ulrich wrote:

>Hi,
>
>Well, i managed to crash reiser4 ;-)
>
>I created an iso-image on my reiser4 filesystem (it's my rootfs)
>using mkisofs. mkisofs aborted because the filesystem was full.
>After freeing up some space, i ran mkisofs again and: *bam*
>
>fsck.reiser4 told me to run '--rebuild-sb' but looks like
>it didn't help:
> The System still crashes while creating the ISO
> (Should be 4.1 GiB, but crashes at ~ 3.7 GiB..)
>
>
># fsck.reiser4 --version
>fsck.reiser4 1.0.4
>Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed
>by  reiser4progs/COPYING. 
>
># uname -a
>Linux fuzzy 2.6.11.10 #1 SMP Sat May 21 13:17:21 CEST 2005 i686 unknown
>unknown GNU/Linux
>
>* I attached the Syslog output
>* I rand 'debugfs.reiserf -P $device' and can
>  provide the output to namesys if they need it
>  (9.3 MiB)
>
>
>
>
>  
>
>------------------------------------------------------------------------
>
>Jun  5 15:59:23 fuzzy kernel: Linux version 2.6.11.10 (root@fuzzy) (gcc version 3.3.4) #1 SMP Sat May 21 13:17:21 CEST 2005
>Jun  5 15:59:23 fuzzy kernel:  BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
>Jun  5 15:59:23 fuzzy kernel:  BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
>Jun  5 15:59:23 fuzzy kernel:  BIOS-e820: 00000000000e6000 - 0000000000100000 (reserved)
>Jun  5 15:59:23 fuzzy kernel:  BIOS-e820: 0000000000100000 - 000000003fe30000 (usable)
>Jun  5 15:59:23 fuzzy kernel:  BIOS-e820: 000000003fe30000 - 000000003fe414a0 (ACPI NVS)
>Jun  5 15:59:23 fuzzy kernel:  BIOS-e820: 000000003fe414a0 - 000000003ff30000 (usable)
>Jun  5 15:59:23 fuzzy kernel:  BIOS-e820: 000000003ff30000 - 000000003ff40000 (ACPI data)
>Jun  5 15:59:23 fuzzy kernel:  BIOS-e820: 000000003ff40000 - 000000003fff0000 (ACPI NVS)
>Jun  5 15:59:23 fuzzy kernel:  BIOS-e820: 000000003fff0000 - 0000000040000000 (reserved)
>Jun  5 15:59:23 fuzzy kernel:  BIOS-e820: 00000000fecf0000 - 00000000fecf1000 (reserved)
>Jun  5 15:59:23 fuzzy kernel:  BIOS-e820: 00000000fed20000 - 00000000feda0000 (reserved)
>Jun  5 15:59:23 fuzzy kernel: Processor #0 15:2 APIC version 20
>Jun  5 15:59:23 fuzzy kernel: Processor #1 15:2 APIC version 20
>Jun  5 15:59:23 fuzzy kernel: IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-23
>Jun  5 15:59:23 fuzzy kernel: Enabling APIC mode:  Flat.  Using 1 I/O APICs
>Jun  5 15:59:23 fuzzy kernel: Allocating PCI resources starting at 40000000 (gap: 40000000:becf0000)
>Jun  5 15:59:23 fuzzy kernel: Built 1 zonelists
>Jun  5 15:59:23 fuzzy kernel: Kernel command line: root=/dev/md1 sbp2_serialize_io=1 sbp2_max_speed=2
>Jun  5 15:59:23 fuzzy kernel: PID hash table entries: 4096 (order: 12, 65536 bytes)
>Jun  5 15:59:23 fuzzy kernel: Detected 2992.449 MHz processor.
>Jun  5 15:59:23 fuzzy kernel: Console: colour VGA+ 80x25
>Jun  5 15:59:23 fuzzy kernel: Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
>Jun  5 15:59:23 fuzzy kernel: Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
>Jun  5 15:59:23 fuzzy kernel: Checking if this processor honours the WP bit even in supervisor mode... Ok.
>Jun  5 15:59:23 fuzzy kernel: Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
>Jun  5 15:59:23 fuzzy kernel: CPU0: Intel(R) Pentium(R) 4 CPU 3.00GHz stepping 09
>Jun  5 15:59:23 fuzzy kernel: per-CPU timeslice cutoff: 1462.91 usecs.
>Jun  5 15:59:23 fuzzy kernel: task migration cache decay timeout: 2 msecs.
>Jun  5 15:59:23 fuzzy kernel: Booting processor 1/1 eip 3000
>Jun  5 15:59:23 fuzzy kernel: CPU1: Intel(R) Pentium(R) 4 CPU 3.00GHz stepping 09
>Jun  5 15:59:23 fuzzy kernel: ENABLING IO-APIC IRQs
>Jun  5 15:59:23 fuzzy kernel: Brought up 2 CPUs
>Jun  5 15:59:23 fuzzy kernel:     ACPI-1138: *** Error: Method execution failed [\MCTH] (Node c191ee60), AE_AML_BUFFER_LIMIT
>Jun  5 15:59:23 fuzzy kernel:     ACPI-1138: *** Error: Method execution failed [\OSFL] (Node c191e540), AE_AML_BUFFER_LIMIT
>Jun  5 15:59:23 fuzzy kernel:     ACPI-1138: *** Error: Method execution failed [\_SB_.PCI0.SBRG.PS2M._STA] (Node c193c2a0), AE_AML_BUFFER_LIMIT
>Jun  5 15:59:23 fuzzy kernel:     ACPI-0158: *** Error: Method execution failed [\_SB_.PCI0.SBRG.PS2M._STA] (Node c193c2a0), AE_AML_BUFFER_LIMIT
>Jun  5 15:59:23 fuzzy kernel: PCI: Probing PCI hardware (bus 00)
>Jun  5 15:59:23 fuzzy kernel:     ACPI-1138: *** Error: Method execution failed [\MCTH] (Node c191ee60), AE_AML_BUFFER_LIMIT
>Jun  5 15:59:23 fuzzy kernel:     ACPI-1138: *** Error: Method execution failed [\OSFL] (Node c191e540), AE_AML_BUFFER_LIMIT
>Jun  5 15:59:23 fuzzy kernel:     ACPI-1138: *** Error: Method execution failed [\_SB_.PCI0.SBRG.PS2M._STA] (Node c193c2a0), AE_AML_BUFFER_LIMIT
>Jun  5 15:59:23 fuzzy kernel: ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 9 10 *11 12 14 15)
>Jun  5 15:59:23 fuzzy kernel: ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 9 *10 11 12 14 15)
>Jun  5 15:59:23 fuzzy kernel: ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 *9 10 11 12 14 15)
>Jun  5 15:59:23 fuzzy kernel: ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 *5 6 7 9 10 11 12 14 15)
>Jun  5 15:59:23 fuzzy kernel: ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 9 10 *11 12 14 15)
>Jun  5 15:59:23 fuzzy kernel: ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 9 10 *11 12 14 15)
>Jun  5 15:59:23 fuzzy kernel: ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 7 9 *10 11 12 14 15)
>Jun  5 15:59:23 fuzzy kernel: ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 *10 11 12 14 15)
>Jun  5 15:59:23 fuzzy kernel:     ACPI-1138: *** Error: Method execution failed [\MCTH] (Node c191ee60), AE_AML_BUFFER_LIMIT
>Jun  5 15:59:23 fuzzy kernel:     ACPI-1138: *** Error: Method execution failed [\OSFL] (Node c191e540), AE_AML_BUFFER_LIMIT
>Jun  5 15:59:23 fuzzy kernel:     ACPI-1138: *** Error: Method execution failed [\_SB_.SYSM._CRS] (Node c193ef40), AE_AML_BUFFER_LIMIT
>Jun  5 15:59:23 fuzzy kernel:     ACPI-0158: *** Error: Method execution failed [\_SB_.SYSM._CRS] (Node c193ef40), AE_AML_BUFFER_LIMIT
>Jun  5 15:59:23 fuzzy kernel: highmem bounce pool size: 64 pages
>Jun  5 15:59:23 fuzzy kernel: ps_hash_table: 32 buckets
>Jun  5 15:59:23 fuzzy kernel: Hangcheck: starting hangcheck timer 0.5.0 (tick is 180 seconds, margin is 60 seconds).
>Jun  5 15:59:23 fuzzy kernel: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
>Jun  5 15:59:23 fuzzy kernel: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
>Jun  5 15:59:23 fuzzy kernel: eepro100.c:v1.09j-t 9/29/99 Donald Becker http://www.scyld.com/network/eepro100.html
>Jun  5 15:59:23 fuzzy kernel: eepro100.c: $Revision: 1.36 $ 2000/11/17 Modified by Andrey V. Savochkin <saw@saw.sw.com.sg> and others
>Jun  5 15:59:23 fuzzy kernel: PCI: Enabling device 0000:00:1f.1 (0005 -> 0007)
>Jun  5 15:59:23 fuzzy kernel: hda: MAXTOR 6L080J4, ATA DISK drive
>Jun  5 15:59:23 fuzzy kernel: hdb: _NEC DVD_RW ND-2500A, ATAPI CD/DVD-ROM drive
>Jun  5 15:59:23 fuzzy kernel: ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
>Jun  5 15:59:23 fuzzy kernel: hdc: ST380011A, ATA DISK drive
>Jun  5 15:59:23 fuzzy kernel: ide1 at 0x170-0x177,0x376 on irq 15
>Jun  5 15:59:23 fuzzy kernel: TCP established hash table entries: 262144 (order: 9, 2097152 bytes)
>Jun  5 15:59:23 fuzzy kernel: TCP bind hash table entries: 65536 (order: 7, 524288 bytes)
>Jun  5 15:59:23 fuzzy kernel: ACPI wakeup devices: 
>Jun  5 15:59:23 fuzzy kernel: TANA P0P3 AC97 USB0 USB1 USB2 USB3 USB7 UAR1 UAR2 SLPB 
>Jun  5 15:59:23 fuzzy kernel: md: hdc1 has different UUID to hdc3
>Jun  5 15:59:23 fuzzy kernel: md: hda1 has different UUID to hdc3
>Jun  5 15:59:23 fuzzy kernel: md5: setting max_sectors to 128, segment boundary to 32767
>Jun  5 15:59:23 fuzzy kernel: raid0: looking at hdc3
>Jun  5 15:59:23 fuzzy kernel: raid0:   comparing hdc3(38596096) with hdc3(38596096)
>Jun  5 15:59:23 fuzzy kernel: raid0:   END
>Jun  5 15:59:23 fuzzy kernel: raid0:   ==> UNIQUE
>Jun  5 15:59:23 fuzzy kernel: raid0: 1 zones
>Jun  5 15:59:23 fuzzy kernel: raid0: looking at hda3
>Jun  5 15:59:23 fuzzy kernel: raid0:   comparing hda3(38620160) with hdc3(38596096)
>Jun  5 15:59:23 fuzzy kernel: raid0:   NOT EQUAL
>Jun  5 15:59:23 fuzzy kernel: raid0:   comparing hda3(38620160) with hda3(38620160)
>Jun  5 15:59:23 fuzzy kernel: raid0:   END
>Jun  5 15:59:23 fuzzy kernel: raid0:   ==> UNIQUE
>Jun  5 15:59:23 fuzzy kernel: raid0: 2 zones
>Jun  5 15:59:23 fuzzy kernel: raid0: FINAL 2 zones
>Jun  5 15:59:23 fuzzy kernel: raid0: zone 1
>Jun  5 15:59:23 fuzzy kernel: raid0: checking hda3 ... contained as device 0
>Jun  5 15:59:23 fuzzy kernel:   (38620160) is smallest!.
>Jun  5 15:59:23 fuzzy kernel: raid0: checking hdc3 ... nope.
>Jun  5 15:59:23 fuzzy kernel: raid0: zone->nb_dev: 1, size: 24064
>Jun  5 15:59:23 fuzzy kernel: raid0: current zone offset: 38620160
>Jun  5 15:59:23 fuzzy kernel: raid0: done.
>Jun  5 15:59:23 fuzzy kernel: raid0 : md_size is 77216256 blocks.
>Jun  5 15:59:23 fuzzy kernel: raid0 : conf->hash_spacing is 77192192 blocks.
>Jun  5 15:59:23 fuzzy kernel: raid0 : nb_zone is 2.
>Jun  5 15:59:23 fuzzy kernel: raid0 : Allocating 8 bytes for hash.
>Jun  5 15:59:23 fuzzy kernel: md: kicking non-fresh hdc1 from array!
>Jun  5 15:59:23 fuzzy kernel: ef_hash_table: 8192 buckets
>Jun  5 15:59:23 fuzzy kernel: z_hash_table: 8192 buckets
>Jun  5 15:59:23 fuzzy kernel: z_hash_table: 8192 buckets
>Jun  5 15:59:23 fuzzy kernel: j_hash_table: 16384 buckets
>Jun  5 15:59:23 fuzzy kernel: sda: asking for cache data failed
>Jun  5 15:59:23 fuzzy kernel: sda: assuming drive cache: write through
>Jun  5 15:59:23 fuzzy kernel: sda: asking for cache data failed
>Jun  5 15:59:23 fuzzy kernel: sda: assuming drive cache: write through
>Jun  5 15:59:23 fuzzy kernel: sdb: asking for cache data failed
>Jun  5 15:59:23 fuzzy kernel: sdb: assuming drive cache: write through
>Jun  5 15:59:23 fuzzy kernel: sdb: asking for cache data failed
>Jun  5 15:59:23 fuzzy kernel: sdb: assuming drive cache: write through
>Jun  5 15:59:23 fuzzy kernel: ...done (2229 jiffies)
>Jun  5 15:59:23 fuzzy kernel: d_cursor_hash_table: 256 buckets
>Jun  5 15:59:23 fuzzy kernel: VFS: Mounted root (reiser4 filesystem) readonly.
>Jun  5 15:59:23 fuzzy kernel: sr0: scsi3-mmc drive: 40x/40x writer cd/rw xa/form2 cdda tray
>Jun  5 15:59:23 fuzzy kernel: sdc: assuming drive cache: write through
>Jun  5 15:59:23 fuzzy kernel: sdc: assuming drive cache: write through
>Jun  5 16:00:50 fuzzy kernel: reiser4[mkisofs(3178)]: alloc_blocks_forward (fs/reiser4/plugin/space/bitmap.c:1074)[zam-397]:
>Jun  5 16:00:50 fuzzy kernel: code: -2 at fs/reiser4/search.c:1159
>Jun  5 16:00:50 fuzzy kernel: reiser4 panicked cowardly: assertion failed: hint->blk < reiser4_block_count(super)
>Jun  5 16:00:50 fuzzy kernel: pins held: jnode: 0, tree: 0 (r:0,w:0), dk: 0 (r:0,w:0)
>Jun  5 16:00:50 fuzzy kernel: jload: 0, txnh: 0, atom: 0, stack: 0, txnmgr: 0, ktxnmgrd: 0, fq: 0, reiser4_sb: 0
>Jun  5 16:00:50 fuzzy kernel: inode: 0, cbk_cache: 0 (r:0,w0), epoch: 0, eflush: 0, zlock: 0 (r:0, w:0)
>Jun  5 16:00:50 fuzzy kernel: spin: 0, long: 1 inode_sem: (r:0,w:0)
>Jun  5 16:00:50 fuzzy kernel: d: 2, x: 275850, t: 7
>Jun  5 16:00:50 fuzzy kernel: ^Ilocks: jnode: 0, tree: 0 (r:0,w:0), dk: 0 (r:0,w:0)
>Jun  5 16:00:50 fuzzy kernel: jload: 0, txnh: 0, atom: 0, stack: 0, txnmgr: 0, ktxnmgrd: 0, fq: 0, reiser4_sb: 0
>Jun  5 16:00:50 fuzzy kernel: inode: 0, cbk_cache: 0 (r:0,w0), epoch: 0, eflush: 0, zlock: 0 (r:0, w:0)
>Jun  5 16:00:50 fuzzy kernel: spin: 0, long: 1 inode_sem: (r:0,w:0)
>Jun  5 16:00:50 fuzzy kernel: d: 2, x: 275850, t: 7
>Jun  5 16:00:50 fuzzy kernel: pid: 3178, comm: mkisofs
>Jun  5 16:00:50 fuzzy kernel: ^Ilock stack:
>Jun  5 16:00:50 fuzzy kernel: .... nr_signaled 0
>Jun  5 16:00:50 fuzzy kernel: .... curpri low
>Jun  5 16:00:50 fuzzy kernel: .... current locks:
>Jun  5 16:00:50 fuzzy kernel: ...... write: 6291574
>Jun  5 16:00:50 fuzzy kernel: ^Iatom: refcount: 2 id: 30 flags: 0 txnh_count: 1 capture_count: 128619 stage: 1 start: 4294703571, flushed: 0
>Jun  5 16:00:50 fuzzy kernel: ------------[ cut here ]------------
>Jun  5 16:00:50 fuzzy kernel: kernel BUG at fs/reiser4/debug.c:141!
>Jun  5 16:00:50 fuzzy kernel: invalid operand: 0000 [#1]
>Jun  5 16:00:50 fuzzy kernel: SMP 
>Jun  5 16:00:50 fuzzy kernel: Modules linked in: e1000 reiserfs visor usbserial sr_mod
>Jun  5 16:00:50 fuzzy kernel: CPU:    1
>Jun  5 16:00:50 fuzzy kernel: EIP:    0060:[<c0192af0>]    Not tainted VLI
>Jun  5 16:00:50 fuzzy kernel: EFLAGS: 00010246   (2.6.11.10) 
>Jun  5 16:00:50 fuzzy kernel: EIP is at reiser4_do_panic+0x250/0x310
>Jun  5 16:00:50 fuzzy kernel: eax: c061b644   ebx: c061b648   ecx: c061b648   edx: c061b648
>Jun  5 16:00:50 fuzzy kernel: esi: f6528000   edi: 00000432   ebp: 00000000   esp: f6529538
>Jun  5 16:00:50 fuzzy kernel: ds: 007b   es: 007b   ss: 0068
>Jun  5 16:00:50 fuzzy kernel: Process mkisofs (pid: 3178, threadinfo=f6528000 task=f7793020)
>Jun  5 16:00:50 fuzzy kernel: Stack: f7d51600 00000001 c04ca1b8 f6529564 c04cf9df 00000487 c04ad23d c04eaac0 
>Jun  5 16:00:50 fuzzy kernel:        c02ab3cf c04ca1a3 c04eada0 c04d8379 c04ad23d c04eaac0 00000432 c0213bc7 
>Jun  5 16:00:50 fuzzy kernel:        f7d51600 f65295c8 00000000 f652964c f6529e34 000146b4 00000000 c01cba69 
>Jun  5 16:00:50 fuzzy kernel: Call Trace:
>Jun  5 16:00:50 fuzzy kernel:  [<c02ab3cf>] alloc_blocks_forward+0xaf/0x310
>Jun  5 16:00:50 fuzzy kernel:  [<c0213bc7>] get_space_allocator+0x17/0xd0
>Jun  5 16:00:50 fuzzy kernel:  [<c01cba69>] reiser4_alloc_blocks+0xb9/0x6c0
>Jun  5 16:00:50 fuzzy kernel:  [<c0290d2f>] extent_unit_index+0x2f/0x120
>Jun  5 16:00:50 fuzzy kernel:  [<c0290a06>] extent_allocate_blocks+0x56/0xe0
>Jun  5 16:00:50 fuzzy kernel:  [<c0295a6c>] alloc_extent+0x31c/0x730
>Jun  5 16:00:50 fuzzy kernel:  [<c029866f>] item_length_by_coord+0x4f/0x1e0
>Jun  5 16:00:50 fuzzy kernel:  [<c02338db>] is_plugin_id_valid+0x1b/0xa0
>Jun  5 16:00:50 fuzzy kernel:  [<c029b2cf>] item_is_extent+0x1f/0x90
>Jun  5 16:00:50 fuzzy kernel:  [<c01ef721>] handle_pos_on_twig+0x71/0x1e0
>Jun  5 16:00:50 fuzzy kernel:  [<c01f1458>] squalloc+0x28/0x60
>Jun  5 16:00:50 fuzzy kernel:  [<c01e99c7>] jnode_flush+0x6a7/0xeb0
>Jun  5 16:00:50 fuzzy kernel:  [<c027f993>] nr_units_extent+0x23/0x90
>Jun  5 16:00:50 fuzzy kernel:  [<c01eaab6>] flush_current_atom+0x8b6/0x1180
>Jun  5 16:00:50 fuzzy kernel:  [<c01d766c>] flush_some_atom+0x76c/0xe10
>Jun  5 16:00:50 fuzzy kernel:  [<c0175db0>] iput+0x40/0x90
>Jun  5 16:00:50 fuzzy kernel:  [<c0220b4b>] writeout+0x7b/0xe0
>Jun  5 16:00:50 fuzzy kernel:  [<c0220c0e>] reiser4_sync_inodes+0x5e/0xf0
>Jun  5 16:00:50 fuzzy kernel:  [<c019dcce>] jnode_invariant_f+0x29e/0x2b0
>Jun  5 16:00:50 fuzzy kernel:  [<c017e9be>] sync_sb_inodes+0x2e/0x40
>Jun  5 16:00:50 fuzzy kernel:  [<c017eab2>] writeback_inodes+0xe2/0xf0
>Jun  5 16:00:50 fuzzy kernel:  [<c0141168>] balance_dirty_pages+0x98/0x160
>Jun  5 16:00:50 fuzzy kernel:  [<c01cfe82>] txn_restart_current+0x22/0x80
>Jun  5 16:00:50 fuzzy kernel:  [<c0289a29>] extent_balance_dirty_pages+0x109/0x1e0
>Jun  5 16:00:50 fuzzy kernel:  [<c0192d45>] schedulable+0x45/0xc0
>Jun  5 16:00:50 fuzzy kernel:  [<c028a1f9>] extent_write_flow+0x6f9/0x16e0
>Jun  5 16:00:50 fuzzy kernel:  [<c028b470>] write_extent+0x0/0x50
>Jun  5 16:00:50 fuzzy kernel:  [<c02b980d>] append_and_or_overwrite+0x48d/0xb00
>Jun  5 16:00:50 fuzzy kernel:  [<c02395e7>] key_by_inode_and_offset_common+0x27/0x250
>Jun  5 16:00:50 fuzzy kernel:  [<c02b9f5a>] write_flow+0xda/0x130
>Jun  5 16:00:50 fuzzy kernel:  [<c01cce45>] grabbed2free+0x145/0x290
>Jun  5 16:00:50 fuzzy kernel:  [<c02ba2fa>] write_file+0x9a/0x110
>Jun  5 16:00:50 fuzzy kernel:  [<c02ba6e4>] write_unix_file+0x374/0x560
>Jun  5 16:00:50 fuzzy kernel:  [<c0225512>] reiser4_write+0x92/0x1d0
>Jun  5 16:00:50 fuzzy kernel:  [<c011e4ad>] release_console_sem+0x7d/0xc0
>Jun  5 16:00:50 fuzzy kernel:  [<c015b0de>] vfs_write+0xae/0x130
>Jun  5 16:00:50 fuzzy kernel:  [<c015b231>] sys_write+0x51/0x80
>Jun  5 16:00:50 fuzzy kernel:  [<c0103123>] syscall_call+0x7/0xb
>Jun  5 16:00:50 fuzzy kernel: Code: ff ff 8b 11 85 d2 0f 84 33 ff ff ff 8b 00 39 c8 0f 85 29 ff ff ff 39 42 04 0f 85 20 ff ff ff b8 44 b6 61 c0 e8 d2 ce 2c 00 89 f6 <0f> 0b 8d 00 b9 a1 4c c0 c7 04 24 ec 3f 4f c0 b8 e0 b1 61 c0 89 
>  
>


