From: David Greaves <david@dgreaves.com>
Subject: Re: HELP! Reiser 3.6 - attempt to access beyond end of device, then
 oops on mount
Date: Tue, 07 Sep 2004 21:50:06 +0100
Message-ID: <413E1EFE.2080107@dgreaves.com>
References: <413E1C81.8000001@dgreaves.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21588-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <413E1C81.8000001@dgreaves.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Greaves <david@dgreaves.com>, reiserfs-list@namesys.com

David Greaves wrote:

> Hi I first got this oops 'out of the blue'
> Memtest seems to run fine
> When rebooting and remounting, it now oopses every time I remount the fs

I should have given you:
The reiserfs is on top of an lvm2 on top of a raid5
I tried booting with 2.6.6 and then 2.6.7

dmesg:
Linux version 2.6.7 (root@cu.dgreaves.com) (gcc version 3.3.3 (Debian 
20040422)) #1 Wed Jun 16 12:39:51 BST 2004
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009e800 (usable)
 BIOS-e820: 000000000009e800 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000000ffec000 (usable)
 BIOS-e820: 000000000ffec000 - 000000000ffef000 (ACPI data)
 BIOS-e820: 000000000ffef000 - 000000000ffff000 (reserved)
 BIOS-e820: 000000000ffff000 - 0000000010000000 (ACPI NVS)
 BIOS-e820: 00000000ffff0000 - 0000000100000000 (reserved)
0MB HIGHMEM available.
255MB LOWMEM available.
On node 0 totalpages: 65516
  DMA zone: 4096 pages, LIFO batch:1
  Normal zone: 61420 pages, LIFO batch:14
  HighMem zone: 0 pages, LIFO batch:1
DMI 2.3 present.
ACPI: RSDP (v000 ASUS                                      ) @ 0x000f6900
ACPI: RSDT (v001 ASUS   A7V-133  0x30303031 MSFT 0x31313031) @ 0x0ffec000
ACPI: FADT (v001 ASUS   A7V-133  0x30303031 MSFT 0x31313031) @ 0x0ffec080
ACPI: BOOT (v001 ASUS   A7V-133  0x30303031 MSFT 0x31313031) @ 0x0ffec040
ACPI: DSDT (v001   ASUS A7V-133  0x00001000 MSFT 0x0100000b) @ 0x00000000
Built 1 zonelists
Kernel command line: root=/dev/hda2 ro single
Local APIC disabled by BIOS -- reenabling.
Found and enabled local APIC!
Initializing CPU#0
PID hash table entries: 1024 (order 10: 8192 bytes)
Detected 1276.141 MHz processor.
Using tsc for high-res timesource
Console: colour VGA+ 80x25
Memory: 255892k/262064k available (2095k kernel code, 5440k reserved, 
889k data, 160k init, 0k highmem)
Checking if this processor honours the WP bit even in supervisor mode... Ok.
Calibrating delay loop... 2506.75 BogoMIPS
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU:     After generic identify, caps: 0183fbff c1c7fbff 00000000 00000000
CPU:     After vendor identify, caps: 0183fbff c1c7fbff 00000000 00000000
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 256K (64 bytes/line)
CPU:     After all inits, caps: 0183fbff c1c7fbff 00000000 00000020
CPU: AMD Athlon(tm) Processor stepping 02
Enabling fast FPU save and restore... done.
Checking 'hlt' instruction... OK.
enabled ExtINT on CPU#0
ESR value before enabling vector: 00000000
ESR value after enabling vector: 00000000
Using local APIC timer interrupts.
calibrating APIC timer ...
..... CPU clock speed is 1275.0740 MHz.
..... host bus clock speed is 268.0576 MHz.
NET: Registered protocol family 16
PCI: PCI BIOS revision 2.10 entry at 0xf1150, last bus=1
PCI: Using configuration type 1
mtrr: v2.0 (20020519)
ACPI: Subsystem revision 20040326
ACPI: IRQ9 SCI: Edge set to Level Trigger.
ACPI: Interpreter enabled
ACPI: Using PIC for interrupt routing
ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 9 10 *11 12 14 15)
ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 9 10 11 12 14 15) *0, 
disabled.
ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 9 *10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKD] (IRQs 3 *4 5 6 7 9 10 11 12 14 15)
ACPI: PCI Root Bridge [PCI0] (00:00)
PCI: Probing PCI hardware (bus 00)
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
SCSI subsystem initialized
ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 4
ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 10
ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 11
PCI: Using ACPI for IRQ routing
spurious 8259A interrupt: IRQ7.
atyfb: 3D RAGE II+ (GTB) [0x4755 rev 0x9a] 4M EDO, 14.31818 MHz XTAL, 
200 MHz PLL, 63 Mhz MCLK
fb0: ATY Mach64 frame buffer device on PCI
Simple Boot Flag at 0x3a set to 0x1
SGI XFS with ACLs, no debug enabled
Applying VIA southbridge workaround.
PCI: Disabling Via external APIC routing
Console: switching to colour frame buffer device 80x25
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
VP_IDE: IDE controller at PCI slot 0000:00:04.1
VP_IDE: chipset revision 6
VP_IDE: not 100% native mode: will probe irqs later
VP_IDE: VIA vt82c686b (rev 40) IDE UDMA100 controller on pci0000:00:04.1
    ide0: BM-DMA at 0xd800-0xd807, BIOS settings: hda:DMA, hdb:DMA
    ide1: BM-DMA at 0xd808-0xd80f, BIOS settings: hdc:DMA, hdd:DMA
hda: ST320420A, ATA DISK drive
hdb: Maxtor 5A300J0, ATA DISK drive
Using anticipatory io scheduler
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
hdc: Memorex 482E CD-ROM, ATAPI CD/DVD-ROM drive
hdd: PLEXTOR CD-R PX-W2410A, ATAPI CD/DVD-ROM drive
ide1 at 0x170-0x177,0x376 on irq 15
hda: max request size: 128KiB
hda: 39851760 sectors (20404 MB) w/2048KiB Cache, CHS=39535/16/63, UDMA(66)
 hda: hda1 hda2 hda3
hdb: max request size: 1024KiB
hdb: 585940320 sectors (300001 MB) w/2048KiB Cache, CHS=36473/255/63, 
UDMA(100)
 hdb: hdb1 hdb2
hdc: ATAPI 48X CD-ROM drive, 128kB Cache, UDMA(33)
Uniform CD-ROM driver Revision: 3.20
hdd: ATAPI 40X CD-ROM CD-R/RW drive, 4096kB Cache, UDMA(33)
libata version 1.02 loaded.
sata_promise version 1.00
ata1: SATA max UDMA/133 cmd 0xD100D200 ctl 0xD100D238 bmdma 0x0 irq 11
ata2: SATA max UDMA/133 cmd 0xD100D280 ctl 0xD100D2B8 bmdma 0x0 irq 11
ata3: SATA max UDMA/133 cmd 0xD100D300 ctl 0xD100D338 bmdma 0x0 irq 11
ata4: SATA max UDMA/133 cmd 0xD100D380 ctl 0xD100D3B8 bmdma 0x0 irq 11
ata1: dev 0 cfg 49:2f00 82:7c6b 83:7f09 84:4003 85:7c69 86:3e01 87:4003 
88:407f
ata1: dev 0 ATA, max UDMA/133, 490234752 sectors: lba48
ata1: dev 0 configured for UDMA/133
scsi0 : sata_promise
ata2: dev 0 cfg 49:2f00 82:7c6b 83:7f09 84:4003 85:7c69 86:3e01 87:4003 
88:407f
ata2: dev 0 ATA, max UDMA/133, 490234752 sectors: lba48
ata2: dev 0 configured for UDMA/133
scsi1 : sata_promise
ata3: dev 0 cfg 49:2f00 82:7c6b 83:7f09 84:4003 85:7c69 86:3e01 87:4003 
88:407f
ata3: dev 0 ATA, max UDMA/133, 490234752 sectors: lba48
ata3: dev 0 configured for UDMA/133
scsi2 : sata_promise
ata4: dev 0 cfg 49:2f00 82:7c6b 83:7f09 84:4003 85:7c69 86:3e01 87:4003 
88:407f
ata4: dev 0 ATA, max UDMA/133, 490234752 sectors: lba48
ata4: dev 0 configured for UDMA/133
scsi3 : sata_promise
  Vendor: ATA       Model: Maxtor 7Y250M0    Rev: YAR5
  Type:   Direct-Access                      ANSI SCSI revision: 05
  Vendor: ATA       Model: Maxtor 7Y250M0    Rev: YAR5
  Type:   Direct-Access                      ANSI SCSI revision: 05
  Vendor: ATA       Model: Maxtor 7Y250M0    Rev: YAR5
  Type:   Direct-Access                      ANSI SCSI revision: 05
  Vendor: ATA       Model: Maxtor 7Y250M0    Rev: YAR5
  Type:   Direct-Access                      ANSI SCSI revision: 05
SCSI device sda: 490234752 512-byte hdwr sectors (251000 MB)
SCSI device sda: drive cache: write back
 sda: sda1
Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
SCSI device sdb: 490234752 512-byte hdwr sectors (251000 MB)
SCSI device sdb: drive cache: write back
 sdb: sdb1
Attached scsi disk sdb at scsi1, channel 0, id 0, lun 0
SCSI device sdc: 490234752 512-byte hdwr sectors (251000 MB)
SCSI device sdc: drive cache: write back
 sdc: sdc1
Attached scsi disk sdc at scsi2, channel 0, id 0, lun 0
SCSI device sdd: 490234752 512-byte hdwr sectors (251000 MB)
SCSI device sdd: drive cache: write back
 sdd: sdd1
Attached scsi disk sdd at scsi3, channel 0, id 0, lun 0
mice: PS/2 mouse device common for all mice
serio: i8042 AUX port at 0x60,0x64 irq 12
input: ImPS/2 Logitech Wheel Mouse on isa0060/serio1
serio: i8042 KBD port at 0x60,0x64 irq 1
input: AT Translated Set 2 keyboard on isa0060/serio0
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :  1700.000 MB/sec
   8regs_prefetch:  1608.000 MB/sec
   32regs    :  1300.000 MB/sec
   32regs_prefetch:  1296.000 MB/sec
   pII_mmx   :  3408.000 MB/sec
   p5_mmx    :  4572.000 MB/sec
raid5: using function: p5_mmx (4572.000 MB/sec)
raid6: int32x1    503 MB/s
raid6: int32x2    671 MB/s
raid6: int32x4    441 MB/s
raid6: int32x8    402 MB/s
raid6: mmxx1     1070 MB/s
raid6: mmxx2     1824 MB/s
raid6: sse1x1     980 MB/s
raid6: sse1x2    1667 MB/s
raid6: using algorithm sse1x2 (1667 MB/s)
md: raid6 personality registered as nr 8
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
device-mapper: 4.1.0-ioctl (2003-12-10) initialised: dm@uk.sistina.com
NET: Registered protocol family 2
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 16384 bind 32768)
ACPI: (supports S0 S1 S4 S5)
md: Autodetecting RAID arrays.
md: autorun ...
md: considering sdd1 ...
md:  adding sdd1 ...
md:  adding sdc1 ...
md:  adding sdb1 ...
md:  adding sda1 ...
md:  adding hdb1 ...
md: created md0
md: bind<hdb1>
md: bind<sda1>
md: bind<sdb1>
md: bind<sdc1>
md: bind<sdd1>
md: running: <sdd1><sdc1><sdb1><sda1><hdb1>
raid5: device sdd1 operational as raid disk 3
raid5: device sdc1 operational as raid disk 1
raid5: device sdb1 operational as raid disk 2
raid5: device sda1 operational as raid disk 0
raid5: device hdb1 operational as raid disk 4
raid5: allocated 5222kB for md0
raid5: raid level 5 set md0 active with 5 out of 5 devices, algorithm 2
RAID5 conf printout:
 --- rd:5 wd:5 fd:0
 disk 0, o:1, dev:sda1
 disk 1, o:1, dev:sdc1
 disk 2, o:1, dev:sdb1
 disk 3, o:1, dev:sdd1
 disk 4, o:1, dev:hdb1
md: ... autorun DONE.
XFS mounting filesystem hda2
Starting XFS recovery on filesystem: hda2 (dev: hda2)
Ending XFS recovery on filesystem: hda2 (dev: hda2)
VFS: Mounted root (xfs filesystem) readonly.
Freeing unused kernel memory: 160k freed
NET: Registered protocol family 1
Adding 522100k swap on /dev/hda3.  Priority:-1 extents:1
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
kjournald starting.  Commit interval 5 seconds
EXT3 FS on hda1, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
usbcore: registered new driver usbfs
usbcore: registered new driver hub
USB Universal Host Controller Interface driver v2.2
uhci_hcd 0000:00:04.2: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 
Controller
uhci_hcd 0000:00:04.2: irq 4, io base 0000d400
uhci_hcd 0000:00:04.2: new USB bus registered, assigned bus number 1
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
uhci_hcd 0000:00:04.3: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 
Controller (#2)
uhci_hcd 0000:00:04.3: irq 4, io base 0000d000
uhci_hcd 0000:00:04.3: new USB bus registered, assigned bus number 2
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
usb 1-1: new full speed USB device using address 2
drivers/usb/class/usblp.c: usblp0: USB Bidirectional printer dev 2 if 0 
alt 0 proto 2 vid 0x04B8 pid 0x0005
usbcore: registered new driver usblp
drivers/usb/class/usblp.c: v0.13: USB Printer Device Class driver

