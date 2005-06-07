From: "E.Gryaznova" <grev@namesys.com>
Subject: Re: extract files without mounting a partition?
Date: Tue, 07 Jun 2005 11:05:39 +0400
Message-ID: <42A54743.5000506@namesys.com>
References: <200506061130.38536.rdeepak@nmsworks.co.in>	 <1118046894.3188.51.camel@tribesman.namesys.com>	 <200506061422.34983.rdeepak@nmsworks.co.in>	 <200506061500.41547.rdeepak@nmsworks.co.in> <7e6ceab3050606170723dba2d2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24333-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <7e6ceab3050606170723dba2d2@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Deepak Ram <r.deepak.ram@gmail.com>
Cc: vs@namesys.com, reiserfs-dev@namesys.com, reiserfs-list@namesys.com

Hello.

Would you please send us the following :
1. # cat /proc/mdstat
2. the raid configuration file wich you used for creating this md0?

Thanks,
Lena  


Deepak Ram wrote:

>>>On Monday 06 June 2005 14:04, you wrote:
>>>      
>>>
>>>>Hello
>>>>
>>>>On Mon, 2005-06-06 at 10:00, R Deepak wrote:
>>>>        
>>>>
>>>>>Greets!
>>>>>
>>>>>Can I ask support questions here? If not, sorry.. :(
>>>>>
>>>>>I have a RAID0 config with 2 80GB SATA disks. I screwed up during an
>>>>>install and the super block got overwritten.
>>>>>
>>>>>When I ran reiserfsck on /dev/md0, it asked me to use --rebuild-sb
>>>>>Which I did. It reported quite a few errors and moved lots of files
>>>>>to lost+found.
>>>>>
>>>>>Now the problem is that I am not able to mount this partition. I've
>>>>>tried with different kernels, gentoo 2005.0 live CD (amd64), knoppix
>>>>>(32bit), and an old gentoo 2004.1 (x86) live CD.
>>>>>
>>>>>As soon as I try to mount it, I get something like the following
>>>>>
>>>>>ReiserFS: md0: found reiserfs format "3.6" with standard journal
>>>>><kernel panic>
>>>>>          
>>>>>
>>>>There should be more than that. Can you please show all kernel logs
>>>>related to the problem.
>>>>        
>>>>
>>>There is.. I'll have to write it down since everything freezes. Will send
>>>the whole thing as soon as I get back home.
>>>      
>>>
>>You should use either serial console or netconsole to catch kernel logs
>>in case when they do not manage to not get written to log files.
>>You can read linux/Documentation/serial-console.txt and
>>linux/Documentation/networking/netconsole.txt about those things.
>>    
>>
>
>'ve attached the dmesg output and the output of "debugreiserfs
>/dev/md0". Should I send you something else?
>
>One  correction though.. the system didn't freeze. There was just an oops.
>
>Please help..
>
>Regards
>Deepak
>  
>
>------------------------------------------------------------------------
>
>gt64 root # debugreiserfs /dev/md0
>debugreiserfs 3.6.19 (2003 www.namesys.com)
>
>
>Filesystem state: consistent
>
>Reiserfs super block in block 2 on 0x900 of format 3.6 with standard journal
>Count of blocks on the device: 39074048
>Number of bitmaps: 1193
>Blocksize: 4096
>Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 8088863
>Root block: 30086
>Filesystem is clean
>Tree height: 5
>Hash function used to sort names: "r5"
>Objectid map size 972, max 972
>Journal parameters:
>        Device [0x0]
>        Magic [0x7e8f0ae8]
>        Size 8193 blocks (including 1 for journal header) (first block 1196)
>        Max transaction length 1024 blocks
>        Max batch size 900 blocks
>        Max commit age 30
>Blocks reserved by journal: 0
>Fs state field: 0x0:
>sb_version: 2
>inode generation number: 25219262
>UUID: 2234f94c-a9be-46ec-9bb7-018a53f424b4
>LABEL:
>Set flags in SB:
>        ATTRIBUTES CLEAN
>  
>
>------------------------------------------------------------------------
>
>Bootdata ok (command line is root=/dev/hda2 vga=9)
>Linux version 2.6.11-gentoo-r9 (root@livecd) (gcc version 3.4.3 20041125 (Gentoo Linux 3.4.3-r1, ssp-3.4.3-0, pie-8.7.7)) #1 Sun Jun 5 11:03:09 IST 2005
>BIOS-provided physical RAM map:
> BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
> BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
> BIOS-e820: 00000000000e4000 - 0000000000100000 (reserved)
> BIOS-e820: 0000000000100000 - 000000003ff30000 (usable)
> BIOS-e820: 000000003ff30000 - 000000003ff40000 (ACPI data)
> BIOS-e820: 000000003ff40000 - 000000003fff0000 (ACPI NVS)
> BIOS-e820: 000000003fff0000 - 0000000040000000 (reserved)
> BIOS-e820: 00000000fff80000 - 0000000100000000 (reserved)
>ACPI: RSDP (v002 ACPIAM                                ) @ 0x00000000000faac0
>ACPI: XSDT (v001 A M I  OEMXSDT  0x08000403 MSFT 0x00000097) @ 0x000000003ff30100
>ACPI: FADT (v003 A M I  OEMFACP  0x08000403 MSFT 0x00000097) @ 0x000000003ff30290
>ACPI: MADT (v001 A M I  OEMAPIC  0x08000403 MSFT 0x00000097) @ 0x000000003ff30390
>ACPI: OEMB (v001 A M I  OEMBIOS  0x08000403 MSFT 0x00000097) @ 0x000000003ff40040
>ACPI: DSDT (v001  A0091 A0091006 0x00000006 MSFT 0x0100000d) @ 0x0000000000000000
>On node 0 totalpages: 261936
>  DMA zone: 4096 pages, LIFO batch:1
>  Normal zone: 257840 pages, LIFO batch:16
>  HighMem zone: 0 pages, LIFO batch:1
>ACPI: Local APIC address 0xfee00000
>ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
>Processor #0 15:12 APIC version 16
>ACPI: IOAPIC (id[0x01] address[0xfec00000] gsi_base[0])
>IOAPIC[0]: apic_id 1, version 3, address 0xfec00000, GSI 0-23
>ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
>ACPI: IRQ0 used by override.
>ACPI: IRQ2 used by override.
>ACPI: IRQ9 used by override.
>Setting APIC routing to flat
>Using ACPI (MADT) for SMP configuration information
>Checking aperture...
>CPU 0: aperture @ e0000000 size 256 MB
>Built 1 zonelists
>Kernel command line: root=/dev/hda2 vga=9 console=tty0
>Initializing CPU#0
>PID hash table entries: 4096 (order: 12, 131072 bytes)
>time.c: Using 1.193182 MHz PIT timer.
>time.c: Detected 1802.347 MHz processor.
>Console: colour VGA+ 132x44
>Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
>Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
>Memory: 1024160k/1047744k available (3253k kernel code, 22880k reserved, 1192k data, 172k init)
>Calibrating delay loop... 3538.94 BogoMIPS (lpj=1769472)
>Mount-cache hash table entries: 256 (order: 0, 4096 bytes)
>CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
>CPU: L2 Cache: 512K (64 bytes/line)
>CPU: AMD Athlon(tm) 64 Processor 2800+ stepping 00
> tbxface-0118 [02] acpi_load_tables      : ACPI Tables successfully acquired
>Parsing all Control Methods:...........................................................................................................................................
>Table [DSDT](id F004) - 517 Objects with 44 Devices 139 Methods 25 Regions
>ACPI Namespace successfully loaded at root ffffffff805d03c0
>evxfevnt-0094 [03] acpi_enable           : Transition to ACPI mode successful
>Using local APIC NMI watchdog using perfctr0
>Using local APIC timer interrupts.
>Detected 12.516 MHz APIC timer.
>NET: Registered protocol family 16
>PCI: Using configuration type 1
>mtrr: v2.0 (20020519)
>ACPI: Subsystem revision 20050211
>evgpeblk-0979 [06] ev_create_gpe_block   : GPE 00 to 0F [_GPE] 2 regs on int 0x9
>evgpeblk-0987 [06] ev_create_gpe_block   : Found 7 Wake, Enabled 0 Runtime GPEs in this block
>Completing Region/Field/Buffer/Package initialization:........................................................................................................................
>Initialized 24/25 Regions 44/44 Fields 39/39 Buffers 13/14 Packages (526 nodes)
>Executing all Device _STA and_INI methods:...............................................
>47 Devices found containing: 47 _STA, 0 _INI methods
>ACPI: Interpreter enabled
>ACPI: Using IOAPIC for interrupt routing
>ACPI: PCI Root Bridge [PCI0] (00:00)
>PCI: Probing PCI hardware (bus 00)
>PCI: Via IRQ fixup
>ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
>ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 7 10 *11 14 15)
>ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 7 *10 11 14 15)
>ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 *5 7 10 11 14 15)
>ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 7 10 11 14 15) *0, disabled.
>ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 7 10 11 14 15) *0, disabled.
>ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 7 10 11 14 15) *0, disabled.
>ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 7 10 11 14 15) *0, disabled.
>ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 7 10 11 14 15) *0, disabled.
>Linux Plug and Play Support v0.97 (c) Adam Belay
>pnp: PnP ACPI init
>pnp: PnP ACPI: found 10 devices
>SCSI subsystem initialized
>usbcore: registered new driver usbfs
>usbcore: registered new driver hub
>PCI: Using ACPI for IRQ routing
>** PCI interrupts are no longer routed automatically.  If this
>** causes a device to stop working, it is probably because the
>** driver failed to call pci_enable_device().  As a temporary
>** workaround, the "pci=routeirq" argument restores the old
>** behavior.  If this argument makes the device work again,
>** please email the output of "lspci" to bjorn.helgaas@hp.com
>** so I can fix the driver.
>TC classifier action (bugs to netdev@oss.sgi.com cc hadi@cyberus.ca)
>agpgart: Detected AGP bridge 0
>agpgart: Maximum main memory to use for agp memory: 941M
>agpgart: AGP aperture is 256M @ 0xe0000000
>PCI-DMA: Disabling IOMMU.
>IA32 emulation $Id: sys_ia32.c,v 1.32 2002/03/24 13:02:28 ak Exp $
>Total HugeTLB memory allocated, 0
>inotify device minor=63
>VFS: Disk quotas dquot_6.5.1
>Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
>Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
>Initializing Cryptographic API
>Real Time Clock Driver v1.12
>Non-volatile memory driver v1.2
>Linux agpgart interface v0.100 (c) Dave Jones
>Hangcheck: starting hangcheck timer 0.5.0 (tick is 180 seconds, margin is 60 seconds).
>ACPI: Power Button (FF) [PWRF]
>ACPI: Sleep Button (CM) [SLPB]
>serio: i8042 AUX port at 0x60,0x64 irq 12
>serio: i8042 KBD port at 0x60,0x64 irq 1
>Serial: 8250/16550 driver $Revision: 1.90 $ 8 ports, IRQ sharing disabled
>ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
>ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
>mice: PS/2 mouse device common for all mice
>input: AT Translated Set 2 keyboard on isa0060/serio0
>input: ImPS/2 Logitech Wheel Mouse on isa0060/serio1
>input: PC Speaker
>io scheduler noop registered
>io scheduler anticipatory registered
>io scheduler deadline registered
>io scheduler cfq registered
>floppy0: no floppy controllers found
>loop: loaded (max 8 devices)
>nbd: registered device at major 43
>Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
>ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
>VP_IDE: IDE controller at PCI slot 0000:00:0f.1
>ACPI: PCI interrupt 0000:00:0f.1[A] -> GSI 20 (level, low) -> IRQ 169
>VP_IDE: chipset revision 6
>VP_IDE: not 100% native mode: will probe irqs later
>VP_IDE: VIA vt8237 (rev 00) IDE UDMA133 controller on pci0000:00:0f.1
>    ide0: BM-DMA at 0xfc00-0xfc07, BIOS settings: hda:DMA, hdb:DMA
>    ide1: BM-DMA at 0xfc08-0xfc0f, BIOS settings: hdc:DMA, hdd:pio
>Probing IDE interface ide0...
>hda: QUANTUM FIREBALLlct15 20, ATA DISK drive
>hdb: Maxtor 6Y200P0, ATA DISK drive
>ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
>Probing IDE interface ide1...
>hdc: ATAPI DVD-ROM 16X Maximum, ATAPI CD/DVD-ROM drive
>ide1 at 0x170-0x177,0x376 on irq 15
>Probing IDE interface ide2...
>Probing IDE interface ide3...
>Probing IDE interface ide4...
>Probing IDE interface ide5...
>hda: max request size: 128KiB
>hda: 39876480 sectors (20416 MB) w/418KiB Cache, CHS=39560/16/63, UDMA(66)
>hda: cache flushes not supported
> hda: hda1 hda2
>hdb: max request size: 1024KiB
>hdb: 398297088 sectors (203928 MB) w/7936KiB Cache, CHS=24792/255/63, UDMA(133)
>hdb: cache flushes supported
> hdb: hdb1 hdb2 < hdb5 > hdb3 hdb4
>hdc: ATAPI 48X DVD-ROM drive, 256kB Cache, UDMA(66)
>Uniform CD-ROM driver Revision: 3.20
>libata version 1.10 loaded.
>sata_via version 1.1
>ACPI: PCI interrupt 0000:00:0f.0[B] -> GSI 20 (level, low) -> IRQ 169
>sata_via(0000:00:0f.0): routed to hard irq line 4
>ata1: SATA max UDMA/133 cmd 0xE800 ctl 0xE402 bmdma 0xD400 irq 169
>ata2: SATA max UDMA/133 cmd 0xE000 ctl 0xD802 bmdma 0xD408 irq 169
>ata1: dev 0 cfg 49:2f00 82:346b 83:7d01 84:4003 85:3469 86:3c01 87:4003 88:007f
>ata1: dev 0 ATA, max UDMA/133, 156301488 sectors: lba48
>ata1: dev 0 configured for UDMA/133
>scsi0 : sata_via
>ata2: dev 0 cfg 49:2f00 82:346b 83:7d01 84:4003 85:3469 86:3c01 87:4003 88:007f
>ata2: dev 0 ATA, max UDMA/133, 156301488 sectors: lba48
>ata2: dev 0 configured for UDMA/133
>scsi1 : sata_via
>  Vendor: ATA       Model: ST380013AS        Rev: 3.18
>  Type:   Direct-Access                      ANSI SCSI revision: 05
>  Vendor: ATA       Model: ST380013AS        Rev: 3.18
>  Type:   Direct-Access                      ANSI SCSI revision: 05
>SCSI device sda: 156301488 512-byte hdwr sectors (80026 MB)
>SCSI device sda: drive cache: write back
>SCSI device sda: 156301488 512-byte hdwr sectors (80026 MB)
>SCSI device sda: drive cache: write back
> sda: sda1
>Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
>SCSI device sdb: 156301488 512-byte hdwr sectors (80026 MB)
>SCSI device sdb: drive cache: write back
>SCSI device sdb: 156301488 512-byte hdwr sectors (80026 MB)
>SCSI device sdb: drive cache: write back
> sdb: sdb1
>Attached scsi disk sdb at scsi1, channel 0, id 0, lun 0
>ACPI: PCI interrupt 0000:00:10.4[C] -> GSI 21 (level, low) -> IRQ 177
>ehci_hcd 0000:00:10.4: VIA Technologies, Inc. USB 2.0
>ehci_hcd 0000:00:10.4: irq 177, pci mem 0xfdf00000
>ehci_hcd 0000:00:10.4: new USB bus registered, assigned bus number 1
>ehci_hcd 0000:00:10.4: USB 2.0 initialized, EHCI 1.00, driver 10 Dec 2004
>hub 1-0:1.0: USB hub found
>hub 1-0:1.0: 8 ports detected
>ohci_hcd: 2004 Nov 08 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
>USB Universal Host Controller Interface driver v2.2
>ACPI: PCI interrupt 0000:00:10.0[A] -> GSI 21 (level, low) -> IRQ 177
>uhci_hcd 0000:00:10.0: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller
>uhci_hcd 0000:00:10.0: irq 177, io base 0xdc00
>uhci_hcd 0000:00:10.0: new USB bus registered, assigned bus number 2
>hub 2-0:1.0: USB hub found
>hub 2-0:1.0: 2 ports detected
>ACPI: PCI interrupt 0000:00:10.1[A] -> GSI 21 (level, low) -> IRQ 177
>uhci_hcd 0000:00:10.1: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller (#2)
>uhci_hcd 0000:00:10.1: irq 177, io base 0xec00
>uhci_hcd 0000:00:10.1: new USB bus registered, assigned bus number 3
>hub 3-0:1.0: USB hub found
>hub 3-0:1.0: 2 ports detected
>ACPI: PCI interrupt 0000:00:10.2[B] -> GSI 21 (level, low) -> IRQ 177
>uhci_hcd 0000:00:10.2: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller (#3)
>uhci_hcd 0000:00:10.2: irq 177, io base 0xc000
>uhci_hcd 0000:00:10.2: new USB bus registered, assigned bus number 4
>hub 4-0:1.0: USB hub found
>hub 4-0:1.0: 2 ports detected
>ACPI: PCI interrupt 0000:00:10.3[B] -> GSI 21 (level, low) -> IRQ 177
>uhci_hcd 0000:00:10.3: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller (#4)
>uhci_hcd 0000:00:10.3: irq 177, io base 0xc400
>uhci_hcd 0000:00:10.3: new USB bus registered, assigned bus number 5
>hub 5-0:1.0: USB hub found
>hub 5-0:1.0: 2 ports detected
>usb 2-2: new full speed USB device using uhci_hcd and address 2
>usbcore: registered new driver usbhid
>drivers/usb/input/hid-core.c: v2.0:USB HID core driver
>md: linear personality registered as nr 1
>md: raid0 personality registered as nr 2
>md: raid1 personality registered as nr 3
>md: raid10 personality registered as nr 9
>md: raid5 personality registered as nr 4
>raid5: automatically using best checksumming function: generic_sse
>   generic_sse:  5444.000 MB/sec
>raid5: using function: generic_sse (5444.000 MB/sec)
>raid6: int64x1   1472 MB/s
>raid6: int64x2   2132 MB/s
>raid6: int64x4   2253 MB/s
>raid6: int64x8   1542 MB/s
>raid6: sse2x1    1085 MB/s
>raid6: sse2x2    1921 MB/s
>raid6: sse2x4    2511 MB/s
>raid6: using algorithm sse2x4 (2511 MB/s)
>md: raid6 personality registered as nr 8
>md: multipath personality registered as nr 7
>md: md driver 0.90.1 MAX_MD_DEVS=256, MD_SB_DISKS=27
>oprofile: using NMI interrupt.
>NET: Registered protocol family 2
>IP: routing cache hash table of 8192 buckets, 64Kbytes
>TCP established hash table entries: 262144 (order: 9, 2097152 bytes)
>TCP bind hash table entries: 65536 (order: 7, 524288 bytes)
>TCP: Hash tables configured (established 262144 bind 65536)
>NET: Registered protocol family 1
>NET: Registered protocol family 17
>powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09e)
>powernow-k8: BIOS error - no PSB
>ACPI wakeup devices: 
>PCI0 PS2K PS2M UAR1 AC97 USB1 USB2 USB3 USB4 EHCI PWRB SLPB 
>ACPI: (supports S0 S1 S3 S4 S5)
>BIOS EDD facility v0.16 2004-Jun-25, 2 devices found
>md: Autodetecting RAID arrays.
>md: autorun ...
>md: considering sdb1 ...
>md:  adding sdb1 ...
>md:  adding sda1 ...
>md: created md0
>md: bind<sda1>
>md: bind<sdb1>
>md: running: <sdb1><sda1>
>md0: setting max_sectors to 128, segment boundary to 32767
>raid0: looking at sdb1
>raid0:   comparing sdb1(78148096) with sdb1(78148096)
>raid0:   END
>raid0:   ==> UNIQUE
>raid0: 1 zones
>raid0: looking at sda1
>raid0:   comparing sda1(78148096) with sdb1(78148096)
>raid0:   EQUAL
>raid0: FINAL 1 zones
>raid0: done.
>raid0 : md_size is 156296192 blocks.
>raid0 : conf->hash_spacing is 156296192 blocks.
>raid0 : nb_zone is 1.
>raid0 : Allocating 8 bytes for hash.
>md: ... autorun DONE.
>ReiserFS: hda2: found reiserfs format "3.6" with standard journal
>ReiserFS: hda2: using ordered data mode
>ReiserFS: hda2: journal params: device hda2, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
>ReiserFS: hda2: checking transaction log (hda2)
>ReiserFS: hda2: Using r5 hash to sort names
>VFS: Mounted root (reiserfs filesystem) readonly.
>Freeing unused kernel memory: 172k freed
>Adding 977216k swap on /dev/hda1.  Priority:-1 extents:1
>ACPI: PCI interrupt 0000:00:11.5[C] -> GSI 22 (level, low) -> IRQ 185
>PCI: Setting latency timer of device 0000:00:11.5 to 64
>codec_read: codec 0 is not valid [0xfe0000]
>codec_read: codec 0 is not valid [0xfe0000]
>codec_read: codec 0 is not valid [0xfe0000]
>codec_read: codec 0 is not valid [0xfe0000]
>cdc_acm 2-2:1.0: ttyACM0: USB ACM device
>usbcore: registered new driver cdc_acm
>drivers/usb/class/cdc-acm.c: v0.23:USB Abstract Control Model driver for USB modems and ISDN adapters
>CSLIP: code copyright 1989 Regents of the University of California
>PPP generic driver version 2.4.2
>PPP BSD Compression module registered
>PPP Deflate Compression module registered
>fglrx: module license 'Proprietary. (C) 2002 - ATI Technologies, Starnberg, GERMANY' taints kernel.
>[fglrx] Maximum main memory to use for locked dma buffers: 918 MBytes.
>ACPI: PCI interrupt 0000:01:00.0[A] -> GSI 16 (level, low) -> IRQ 193
>[fglrx] module loaded - fglrx 8.12.10 [Apr  4 2005] on minor 0
>[fglrx] Internal AGP support requested, but kernel AGP support active.
>[fglrx] Have to use kernel AGP support to avoid conflicts.
>[fglrx] AGP detected, AgpState   = 0x1f000a1a (hardware caps of chipset)
>agpgart: Found an AGP 3.5 compliant device at 0000:00:00.0.
>agpgart: Putting AGP V3 device at 0000:00:00.0 into 8x mode
>agpgart: Putting AGP V3 device at 0000:01:00.0 into 8x mode
>[fglrx] AGP enabled,  AgpCommand = 0x1f000312 (selected caps)
>[fglrx] free  AGP = 256126976
>[fglrx] max   AGP = 256126976
>[fglrx] free  LFB = 116387840
>[fglrx] max   LFB = 116387840
>[fglrx] free  Inv = 0
>[fglrx] max   Inv = 0
>[fglrx] total Inv = 0
>[fglrx] total TIM = 0
>[fglrx] total FB  = 0
>[fglrx] total AGP = 65536
>ReiserFS: hdb5: found reiserfs format "3.6" with standard journal
>ReiserFS: hdb5: using ordered data mode
>ReiserFS: hdb5: journal params: device hdb5, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
>ReiserFS: hdb5: checking transaction log (hdb5)
>ReiserFS: hdb5: Using r5 hash to sort names
>PPP: VJ decompression error
>PPP: VJ decompression error
>PPP: VJ decompression error
>PPP: VJ decompression error
>PPP: VJ decompression error
>PPP: VJ decompression error
>usb 2-2: USB disconnect, address 2
>usb 2-2: new full speed USB device using uhci_hcd and address 3
>cdc_acm 2-2:1.0: ttyACM0: USB ACM device
>Losing some ticks... checking if CPU frequency changed.
>PPP: VJ decompression error
>PPP: VJ decompression error
>PPP: VJ decompression error
>PPP: VJ decompression error
>PPP: VJ decompression error
>PPP: VJ decompression error
>FAT: bogus number of reserved sectors
>VFS: Can't find a valid FAT filesystem on dev md0.
>ReiserFS: md0: found reiserfs format "3.6" with standard journal
>Unable to handle kernel paging request at ffffc200002ec008 RIP: 
>[<ffffffff801cbc35>]
>PGD 3ff12067 PUD 3ff11067 PMD 3f521067 PTE 0
>Oops: 0002 [1] PREEMPT 
>CPU 0 
>Modules linked in: fglrx ppp_deflate zlib_deflate bsd_comp ppp_async crc_ccitt ppp_generic slhc w83627hf eeprom i2c_sensor i2c_isa snd_ioctl32 snd_pcm_oss snd_mixer_oss snd_seq_oss snd_seq_midi_event snd_seq cdc_acm i2c_viapro i2c_core snd_via82xx snd_mpu401_uart snd_emu10k1 snd_rawmidi snd_seq_device snd_ac97_codec snd_pcm snd_timer snd_page_alloc snd_util_mem snd_hwdep snd siimage
>Pid: 27434, comm: mount Tainted: P      2.6.11-gentoo-r9
>RIP: 0010:[<ffffffff801cbc35>] [<ffffffff801cbc35>]
>RSP: 0018:ffff81002ecd5ac8  EFLAGS: 00010202
>RAX: ffff81000d5edd98 RBX: ffffc200002e9000 RCX: ffff81002ecd5a70
>RDX: ffff81000d5edd98 RSI: ffff81002ecd5a58 RDI: ffff810001dff6d0
>RBP: 0000000000003000 R08: ffff81002ecd4000 R09: 0000000000000001
>R10: 00000000ffffffff R11: ffffffff8035d100 R12: ffff81003d9bcc00
>R13: ffff810011991800 R14: 0000000000000300 R15: ffff81000359b000
>FS:  00002aaaaaff36d0(0000) GS:ffffffff805f5f40(0000) knlGS:0000000000000000
>CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
>CR2: ffffc200002ec008 CR3: 00000000080d8000 CR4: 00000000000006e0
>Process mount (pid: 27434, threadinfo ffff81002ecd4000, task ffff810031424130)
>Stack: 0000000000000000 ffffffea00000003 ffff81000359b000 0000000000000001 
>       0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>       0000000000000000 0000000000000000 
>Call Trace:[<ffffffff802838b5>] [<ffffffff801cb980>] [<ffffffff80283be3>] 
>       [<ffffffff80282d3e>] [<ffffffff8017bc0e>] [<ffffffff8017c540>] 
>       [<ffffffff801cb980>] [<ffffffff8017c6a0>] [<ffffffff8017c93f>] 
>       [<ffffffff80194c9f>] [<ffffffff80120b1c>] [<ffffffff80164e40>] 
>       [<ffffffff80158d11>] [<ffffffff8010ecf1>] [<ffffffff8015922f>] 
>       [<ffffffff801950bc>] [<ffffffff8010e3d6>] 
>
>Code: 48 89 44 1d 08 49 8b 84 24 50 02 00 00 48 8b 40 10 48 83 7c 
>RIP [<ffffffff801cbc35>] RSP <ffff81002ecd5ac8>
>CR2: ffffc200002ec008
> 
>  
>


