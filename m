From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Reiser4 panic at fs/reiser4/lock.c:434
Date: Wed, 24 Mar 2004 17:50:35 -0700
Message-ID: <1080175834.13000.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-PxgM3OG0VgbE/SKRwkc9"
Return-path: <reiserfs-list-return-17450-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

--=-PxgM3OG0VgbE/SKRwkc9
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The system is running Linux kernel 2.6.5-rc2.  It's tainted by Nvidia
drivers.

The system was compiling the kernel, and Reiser4 panicked.
The Reiser4 panic starts at line 443 of the attached dmesg log.

The Reiser4 filesystem is on a MD RAID 0 device made of two SCSI disks.

I had some Reiser4 debugging options turned on.  I was trying to catch
it creating blocks of zeros, which is something I noticed it doing to
frequently appended files like .xsession-errors and my Evolution mbox
file.

After I rebooted the system, I copied the kernel source to another
filesystem and finished the compile, which does not include debugging
options (It was way too slow!), so I am not running with debugging now. 
But if you want more information, let me know and I will try to provide
it.
-- 
Jonathan Briggs
jbriggs@esoft.com

--=-PxgM3OG0VgbE/SKRwkc9
Content-Disposition: attachment; filename=dmesg.out
Content-Type: text/plain; name=dmesg.out; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Linux version 2.6.5-rc2 (jbriggs@oberon.rnd.esoft.com) (gcc version 3.3.2 2=
0031022 (Red Hat Linux 3.3.2-1)) #5 Mon Mar 22 10:50:14 MST 2004
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
 BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000ec000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000001fff0000 (usable)
 BIOS-e820: 000000001fff0000 - 000000001fff8000 (ACPI data)
 BIOS-e820: 000000001fff8000 - 0000000020000000 (ACPI NVS)
 BIOS-e820: 00000000fec00000 - 00000000fec01000 (reserved)
 BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
 BIOS-e820: 00000000ffee0000 - 00000000fff00000 (reserved)
 BIOS-e820: 00000000fffc0000 - 0000000100000000 (reserved)
511MB LOWMEM available.
On node 0 totalpages: 131056
  DMA zone: 4096 pages, LIFO batch:1
  Normal zone: 126960 pages, LIFO batch:16
  HighMem zone: 0 pages, LIFO batch:1
DMI 2.3 present.
ACPI: RSDP (v000 AMI                                       ) @ 0x000fa2c0
ACPI: RSDT (v001 AMIINT SiS735XX 0x00001000 MSFT 0x0100000b) @ 0x1fff0000
ACPI: FADT (v001 AMIINT SiS735XX 0x00001000 MSFT 0x0100000b) @ 0x1fff0030
ACPI: DSDT (v001    SiS      735 0x00000100 MSFT 0x0100000d) @ 0x00000000
Built 1 zonelists
Kernel command line: ro root=3D/dev/md1 rootfstype=3Dreiserfs single
Local APIC disabled by BIOS -- reenabling.
Found and enabled local APIC!
Initializing CPU#0
PID hash table entries: 2048 (order 11: 16384 bytes)
Detected 1659.672 MHz processor.
Using tsc for high-res timesource
Console: colour VGA+ 80x25
Memory: 512988k/524224k available (3016k kernel code, 10472k reserved, 1336=
k data, 156k init, 0k highmem)
Checking if this processor honours the WP bit even in supervisor mode... Ok=
.
Calibrating delay loop... 3284.99 BogoMIPS
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU:     After generic identify, caps: 0383fbff c1c3fbff 00000000 00000000
CPU:     After vendor identify, caps: 0383fbff c1c3fbff 00000000 00000000
CPU: CLK_CTL MSR was 6003d22f. Reprogramming to 2003d22f
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 256K (64 bytes/line)
CPU:     After all inits, caps: 0383fbff c1c3fbff 00000000 00000020
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
CPU: AMD Athlon(tm) XP 2000+ stepping 01
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
enabled ExtINT on CPU#0
ESR value before enabling vector: 00000000
ESR value after enabling vector: 00000000
Using local APIC timer interrupts.
calibrating APIC timer ...
..... CPU clock speed is 1659.0295 MHz.
..... host bus clock speed is 265.0487 MHz.
NET: Registered protocol family 16
PCI: PCI BIOS revision 2.10 entry at 0xfdb01, last bus=3D1
PCI: Using configuration type 1
mtrr: v2.0 (20020519)
ACPI: Subsystem revision 20040311
 tbxface-0117 [03] acpi_load_tables      : ACPI Tables successfully acquire=
d
Parsing all Control Methods:...............................................=
...........................................................................=
......................
Table [DSDT](id F004) - 413 Objects with 41 Devices 144 Methods 18 Regions
ACPI Namespace successfully loaded at root c0589ffc
ACPI: IRQ9 SCI: Edge set to Level Trigger.
evxfevnt-0093 [04] acpi_enable           : Transition to ACPI mode successf=
ul
evgpeblk-0747 [06] ev_create_gpe_block   : GPE 00 to 15 [_GPE] 2 regs at 00=
00000000000820 on int 9
evgpeblk-0747 [06] ev_create_gpe_block   : GPE 16 to 31 [_GPE] 2 regs at 00=
00000000000830 on int 9
Completing Region/Field/Buffer/Package initialization:.....................=
...................................................................
Initialized 18/18 Regions 5/5 Fields 35/35 Buffers 30/30 Packages (422 node=
s)
Executing all Device _STA and_INI methods:.................................=
..........
43 Devices found containing: 43 _STA, 1 _INI methods
ACPI: Interpreter enabled
ACPI: Using PIC for interrupt routing
ACPI: PCI Root Bridge [PCI0] (00:00)
PCI: Probing PCI hardware (bus 00)
Uncovering SIS18 that hid as a SIS503 (compatible=3D1)
Enabling SiS 96x SMBus.
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: Power Resource [URP1] (off)
ACPI: Power Resource [URP2] (off)
ACPI: Power Resource [FDDP] (off)
ACPI: Power Resource [LPTP] (off)
ACPI: PCI Interrupt Link [LNKA] (IRQs *11)
ACPI: PCI Interrupt Link [LNKB] (IRQs *11)
ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 7 *10 12 14 15)
ACPI: PCI Interrupt Link [LNKD] (IRQs *3 4 5 7 10 12 14 15)
ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 7 10 12 14 15)
spurious 8259A interrupt: IRQ7.
ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 7 10 12 14 15)
ACPI: PCI Interrupt Link [LNKG] (IRQs *3 4 5 7 10 12 14 15)
ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 *5 7 10 12 14 15)
SCSI subsystem initialized
ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 11
ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 3
ACPI: PCI Interrupt Link [LNKH] enabled at IRQ 5
ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 10
ACPI: PCI Interrupt Link [LNKG] enabled at IRQ 3
ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 11
PCI: Using ACPI for IRQ routing
PCI: if you experience problems, try using option 'pci=3Dnoacpi' or even 'a=
cpi=3Doff'
Machine check exception polling timer started.
Total HugeTLB memory allocated, 0
ikconfig 0.7 with /proc/config*
VFS: Disk quotas dquot_6.5.1
Loading Reiser4. See www.namesys.com for a description of Reiser4.
phash_hash_table: 128 buckets
ps_hash_table: 32 buckets
ln_hash_table: 1024 buckets
Initializing Cryptographic API
ACPI: Power Button (FF) [PWRF]
ACPI: Sleep Button (CM) [SLPB]
ACPI: Processor [CPU1] (supports C1)
Real Time Clock Driver v1.12
Using anticipatory io scheduler
Floppy drive(s): fd0 is 1.44M
FDC 0 is a post-1991 82077
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=3D=
xx
SIS5513: IDE controller at PCI slot 0000:00:02.5
SIS5513: chipset revision 208
SIS5513: not 100% native mode: will probe irqs later
SIS5513: SiS735 ATA 100 (2nd gen) controller
    ide0: BM-DMA at 0xff00-0xff07, BIOS settings: hda:DMA, hdb:DMA
    ide1: BM-DMA at 0xff08-0xff0f, BIOS settings: hdc:DMA, hdd:DMA
hdc: Pioneer DVD-ROM ATAPIModel DVD-116 0122, ATAPI CD/DVD-ROM drive
ide1 at 0x170-0x177,0x376 on irq 15
sym0: <1010-33> rev 0x1 at pci 0000:00:11.0 irq 11
sym0: using 64 bit DMA addressing
sym0: Symbios NVRAM, ID 7, Fast-80, LVD, parity checking
sym0: open drain IRQ line driver, using on-chip SRAM
sym0: using LOAD/STORE-based firmware.
sym0: handling phase mismatch from SCRIPTS.
sym0: SCAN AT BOOT disabled for targets 2 3 4 5 6 8 9 10 11 12 13 14 15.
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18i
  Vendor: SEAGATE   Model: ST318453LW        Rev: 0005
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym0:0:0: tagged command queuing enabled, command queue depth 16.
  Vendor: SEAGATE   Model: ST318453LW        Rev: 0006
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym0:1:0: tagged command queuing enabled, command queue depth 16.
sym1: <1010-33> rev 0x1 at pci 0000:00:11.1 irq 10
sym1: using 64 bit DMA addressing
sym1: Symbios NVRAM, ID 7, Fast-80, SE, parity checking
sym1: open drain IRQ line driver, using on-chip SRAM
sym1: using LOAD/STORE-based firmware.
sym1: handling phase mismatch from SCRIPTS.
sym1: SCAN AT BOOT disabled for targets 0 1 2 3 4 5 6 8 9 10 11 12 13 14 15=
.
sym1: SCSI BUS has been reset.
scsi1 : sym-2.1.18i
sym0:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 62)
SCSI device sda: 35843686 512-byte hdwr sectors (18352 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3 sda4
Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
sym0:1: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 62)
SCSI device sdb: 35843686 512-byte hdwr sectors (18352 MB)
SCSI device sdb: drive cache: write back
 sdb: sdb1 sdb2 sdb3 sdb4
Attached scsi disk sdb at scsi0, channel 0, id 1, lun 0
mice: PS/2 mouse device common for all mice
serio: i8042 AUX port at 0x60,0x64 irq 12
input: ImPS/2 Logitech Wheel Mouse on isa0060/serio1
serio: i8042 KBD port at 0x60,0x64 irq 1
input: AT Translated Set 2 keyboard on isa0060/serio0
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: md driver 0.90.0 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27
NET: Registered protocol family 2
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
Initializing IPsec netlink socket
NET: Registered protocol family 1
NET: Registered protocol family 17
ACPI: (supports S0 S1 S4 S5)
BIOS EDD facility v0.13 2004-Mar-09, 4 devices found
Please report your BIOS at http://linux.dell.com/edd/results.html
md: Autodetecting RAID arrays.
md: autorun ...
md: considering sdb4 ...
md:  adding sdb4 ...
md: sdb3 has different UUID to sdb4
md: sdb1 has different UUID to sdb4
md:  adding sda4 ...
md: sda3 has different UUID to sdb4
md: sda1 has different UUID to sdb4
md: created md2
md: bind<sda4>
md: bind<sdb4>
md: running: <sdb4><sda4>
md2: setting max_sectors to 2048, segment boundary to 524287
raid0: looking at sdb4
raid0:   comparing sdb4(13478912) with sdb4(13478912)
raid0:   END
raid0:   =3D=3D> UNIQUE
raid0: 1 zones
raid0: looking at sda4
raid0:   comparing sda4(13478912) with sdb4(13478912)
raid0:   EQUAL
raid0: FINAL 1 zones
raid0: done.
raid0 : md_size is 26957824 blocks.
raid0 : conf->hash_spacing is 26957824 blocks.
raid0 : nb_zone is 1.
raid0 : Allocating 4 bytes for hash.
md: considering sdb3 ...
md:  adding sdb3 ...
md: sdb1 has different UUID to sdb3
md:  adding sda3 ...
md: sda1 has different UUID to sdb3
md: created md1
md: bind<sda3>
md: bind<sdb3>
md: running: <sdb3><sda3>
md1: setting max_sectors to 2048, segment boundary to 524287
raid0: looking at sdb3
raid0:   comparing sdb3(3906560) with sdb3(3906560)
raid0:   END
raid0:   =3D=3D> UNIQUE
raid0: 1 zones
raid0: looking at sda3
raid0:   comparing sda3(3906560) with sdb3(3906560)
raid0:   EQUAL
raid0: FINAL 1 zones
raid0: done.
raid0 : md_size is 7813120 blocks.
raid0 : conf->hash_spacing is 7813120 blocks.
raid0 : nb_zone is 1.
raid0 : Allocating 4 bytes for hash.
md: considering sdb1 ...
md:  adding sdb1 ...
md:  adding sda1 ...
md: created md0
md: bind<sda1>
md: bind<sdb1>
md: running: <sdb1><sda1>
raid1: raid set md0 active with 2 out of 2 mirrors
md: ... autorun DONE.
found reiserfs format "3.6" with standard journal
Reiserfs journal params: device md1, size 8192, journal first block 18, max=
 trans len 1024, max batch 900, max commit age 30, max trans age 30
reiserfs: checking transaction log (md1) for (md1)
Using r5 hash to sort names
VFS: Mounted root (reiserfs filesystem) readonly.
Freeing unused kernel memory: 156k freed
drivers/usb/core/usb.c: registered new driver usbfs
drivers/usb/core/usb.c: registered new driver hub
USB Universal Host Controller Interface driver v2.2
uhci_hcd 0000:00:13.0: VIA Technologies, Inc. USB
uhci_hcd 0000:00:13.0: irq 11, io base 0000bc00
uhci_hcd 0000:00:13.0: new USB bus registered, assigned bus number 1
uhci_hcd 0000:00:13.0: detected 2 ports
uhci_hcd 0000:00:13.0: root hub device address 1
usb usb1: new device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
drivers/usb/core/message.c: USB device number 1 default language ID 0x409
usb usb1: Product: VIA Technologies, Inc. USB
usb usb1: Manufacturer: Linux 2.6.5-rc2 uhci_hcd
usb usb1: SerialNumber: 0000:00:13.0
drivers/usb/core/usb.c: usb_hotplug
usb usb1: registering 1-0:1.0 (config #1, interface 0)
drivers/usb/core/usb.c: usb_hotplug
hub 1-0:1.0: usb_probe_interface
hub 1-0:1.0: usb_probe_interface - got id
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
hub 1-0:1.0: standalone hub
hub 1-0:1.0: unknown reserved power switching mode
hub 1-0:1.0: individual port over-current protection
hub 1-0:1.0: Port indicators are not supported
hub 1-0:1.0: power on to power good time: 2ms
hub 1-0:1.0: hub controller current requirement: 0mA
hub 1-0:1.0: local power source is good
hub 1-0:1.0: no over-current condition exists
hub 1-0:1.0: enabling power on all ports
uhci_hcd 0000:00:13.1: VIA Technologies, Inc. USB (#2)
uhci_hcd 0000:00:13.1: irq 11, io base 0000c000
uhci_hcd 0000:00:13.1: new USB bus registered, assigned bus number 2
uhci_hcd 0000:00:13.1: detected 2 ports
uhci_hcd 0000:00:13.1: root hub device address 1
usb usb2: new device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
drivers/usb/core/message.c: USB device number 1 default language ID 0x409
usb usb2: Product: VIA Technologies, Inc. USB (#2)
usb usb2: Manufacturer: Linux 2.6.5-rc2 uhci_hcd
usb usb2: SerialNumber: 0000:00:13.1
drivers/usb/core/usb.c: usb_hotplug
uhci_hcd 0000:00:13.0: port 1 portsc 008a
hub 1-0:1.0: port 1, status 100, change 3, 12 Mb/s
uhci_hcd 0000:00:13.0: port 2 portsc 01ab
hub 1-0:1.0: port 2, status 301, change 3, 1.5 Mb/s
usb usb2: registering 2-0:1.0 (config #1, interface 0)
drivers/usb/core/usb.c: usb_hotplug
hub 2-0:1.0: usb_probe_interface
hub 2-0:1.0: usb_probe_interface - got id
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
hub 2-0:1.0: standalone hub
hub 2-0:1.0: unknown reserved power switching mode
hub 2-0:1.0: individual port over-current protection
hub 2-0:1.0: Port indicators are not supported
hub 2-0:1.0: power on to power good time: 2ms
hub 2-0:1.0: hub controller current requirement: 0mA
hub 2-0:1.0: local power source is good
hub 2-0:1.0: no over-current condition exists
hub 2-0:1.0: enabling power on all ports
uhci_hcd 0000:00:13.0: port 2 portsc 01a9
uhci_hcd 0000:00:13.0: port 2 portsc 01a9
uhci_hcd 0000:00:13.0: port 2 portsc 01a9
ehci_hcd: block sizes: qh 128 qtd 96 itd 192 sitd 96
ehci_hcd 0000:00:13.2: VIA Technologies, Inc. USB 2.0
ehci_hcd 0000:00:13.2: reset hcs_params 0x2204 dbg=3D0 cc=3D2 pcc=3D2 order=
ed !ppc ports=3D4
ehci_hcd 0000:00:13.2: reset hcc_params 0002 thresh 0 uframes 256/512/1024
ehci_hcd 0000:00:13.2: irq 10, pci mem e08d0a00
uhci_hcd 0000:00:13.0: port 2 portsc 01a9
ehci_hcd 0000:00:13.2: new USB bus registered, assigned bus number 3
ehci_hcd 0000:00:13.2: reset command 080002 (park)=3D0 ithresh=3D8 period=
=3D1024 Reset HALT
ehci_hcd 0000:00:13.2: init command 010009 (park)=3D0 ithresh=3D1 period=3D=
256 RUN
ehci_hcd 0000:00:13.2: USB 2.0 enabled, EHCI 0.95, driver 2003-Dec-29
ehci_hcd 0000:00:13.2: root hub device address 1
usb usb3: new device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
drivers/usb/core/message.c: USB device number 1 default language ID 0x409
usb usb3: Product: VIA Technologies, Inc. USB 2.0
usb usb3: Manufacturer: Linux 2.6.5-rc2 ehci_hcd
usb usb3: SerialNumber: 0000:00:13.2
drivers/usb/core/usb.c: usb_hotplug
uhci_hcd 0000:00:13.0: port 2 portsc 01aa
usb usb3: registering 3-0:1.0 (config #1, interface 0)
drivers/usb/core/usb.c: usb_hotplug
uhci_hcd 0000:00:13.0: port 2 portsc 01a8
hub 3-0:1.0: usb_probe_interface
hub 3-0:1.0: usb_probe_interface - got id
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 4 ports detected
hub 3-0:1.0: standalone hub
hub 3-0:1.0: ganged power switching
hub 3-0:1.0: individual port over-current protection
hub 3-0:1.0: Single TT
hub 3-0:1.0: TT requires at most 8 FS bit times
hub 3-0:1.0: Port indicators are not supported
hub 3-0:1.0: power on to power good time: 20ms
hub 3-0:1.0: hub controller current requirement: 0mA
hub 3-0:1.0: local power source is good
hub 3-0:1.0: no over-current condition exists
hub 3-0:1.0: enabling power on all ports
uhci_hcd 0000:00:13.0: port 2 portsc 01a8
uhci_hcd 0000:00:13.0: port 2 portsc 01a8
uhci_hcd 0000:00:13.0: port 2 portsc 01a8
drivers/usb/core/usb.c: registered new driver hid
drivers/usb/input/hid-core.c: v2.0:USB HID core driver
uhci_hcd 0000:00:13.0: port 2 portsc 01a8
uhci_hcd 0000:00:13.0: port 2 portsc 01a8
uhci_hcd 0000:00:13.0: port 2 portsc 01a8
uhci_hcd 0000:00:13.0: port 2 portsc 01a8
uhci_hcd 0000:00:13.0: port 2 portsc 01a8
uhci_hcd 0000:00:13.0: port 2 portsc 01a8
uhci_hcd 0000:00:13.0: port 2 portsc 01a8
hub 1-0:1.0: debounce: port 2: delay 400ms stable 0 status 0x300
hub 1-0:1.0: connect-debounce failed, port 2 disabled
ehci_hcd 0000:00:13.2: GetStatus port 2 status 001403 POWER sig=3Dk  CSC CO=
NNECT
hub 3-0:1.0: port 2, status 501, change 1, 480 Mb/s
hub 3-0:1.0: debounce: port 2: delay 100ms stable 4 status 0x501
ehci_hcd 0000:00:13.2: port 2 low speed --> companion
ehci_hcd 0000:00:13.2: GetStatus port 2 status 003402 POWER OWNER sig=3Dk  =
CSC
uhci_hcd 0000:00:13.1: port 1 portsc 008a
hub 2-0:1.0: port 1, status 100, change 3, 12 Mb/s
uhci_hcd 0000:00:13.1: port 2 portsc 008a
hub 2-0:1.0: port 2, status 100, change 3, 12 Mb/s
uhci_hcd 0000:00:13.0: port 1 portsc 0088
hub 1-0:1.0: port 1 enable change, status 100
uhci_hcd 0000:00:13.0: port 2 portsc 01ab
hub 1-0:1.0: port 2, status 301, change 3, 1.5 Mb/s
uhci_hcd 0000:00:13.0: port 2 portsc 01a9
uhci_hcd 0000:00:13.0: port 2 portsc 01a9
uhci_hcd 0000:00:13.0: port 2 portsc 01a9
uhci_hcd 0000:00:13.0: port 2 portsc 01a9
uhci_hcd 0000:00:13.0: port 2 portsc 01a9
hub 1-0:1.0: debounce: port 2: delay 100ms stable 4 status 0x301
Adding 500728k swap on /dev/sda2.  Priority:1 extents:1
Adding 500728k swap on /dev/sdb2.  Priority:1 extents:1
uhci_hcd 0000:00:13.1: suspend_hc
usb 1-2: new low speed USB device using address 2
usb 1-2: new device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
drivers/usb/core/message.c: USB device number 2 default language ID 0x409
usb 1-2: Product: Microsoft Wireless Intellimouse Explorer=AE 1.0A
usb 1-2: Manufacturer: Microsoft
drivers/usb/core/usb.c: usb_hotplug
usb 1-2: registering 1-2:1.0 (config #1, interface 0)
drivers/usb/core/usb.c: usb_hotplug
hid 1-2:1.0: usb_probe_interface
hid 1-2:1.0: usb_probe_interface - got id
input: USB HID v1.10 Mouse [Microsoft Microsoft Wireless Intellimouse Explo=
rer=AE 1.0A] on usb-0000:00:13.0-2
uhci_hcd 0000:00:13.1: port 1 portsc 0088
hub 2-0:1.0: port 1 enable change, status 100
uhci_hcd 0000:00:13.1: port 2 portsc 0088
hub 2-0:1.0: port 2 enable change, status 100
EXT2-fs warning (device md0): ext2_fill_super: mounting ext3 filesystem as =
ext2

EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended
ef_hash_table: 32768 buckets
z_hash_table: 8192 buckets
z_hash_table: 8192 buckets
j_hash_table: 131072 buckets
loading reiser4 bitmap......done (703 jiffies)
ip_tables: (C) 2000-2002 Netfilter core team
sis900.c: v1.08.07 11/02/2003
eth0: Realtek RTL8201 PHY transceiver found at address 1.
eth0: Using transceiver found at address 1 as default
eth0: SiS 900 PCI Fast Ethernet at 0xd000, IRQ 3, 00:0a:e6:a7:29:60.
eth0: Media Link On 100mbps full-duplex=20
NET: Registered protocol family 10
Disabled Privacy Extensions on device c04ff720(lo)
IPv6 over IPv4 tunneling driver
intel8x0_measure_ac97_clock: measured 49490 usecs
intel8x0: clocking to 48000
parport0: PC-style at 0x378 (0x778) [PCSPP,TRISTATE]
parport0: irq 7 detected
parport0: cpp_daisy: aa5500ff(38)
parport0: assign_addrs: aa5500ff(38)
parport0: cpp_daisy: aa5500ff(38)
parport0: assign_addrs: aa5500ff(38)
lp0: using parport0 (polling).
lp0: console ready
eth0: no IPv6 routers present
nvidia: module license 'NVIDIA' taints kernel.
Linux agpgart interface v0.100 (c) Dave Jones
atkbd.c: Unknown key released (translated set 2, code 0x7a on isa0060/serio=
0).
atkbd.c: This is an XFree86 bug. It shouldn't access hardware directly.
atkbd.c: Unknown key released (translated set 2, code 0x7a on isa0060/serio=
0).
atkbd.c: This is an XFree86 bug. It shouldn't access hardware directly.
hdc: ATAPI 40X DVD-ROM drive, 256kB Cache, UDMA(66)
Uniform CD-ROM driver Revision: 3.20
cdrom: This disc doesn't have any tracks I recognize!
nfs warning: mount version older than kernel
nfs warning: mount version older than kernel
nfs warning: mount version older than kernel
cdrom: This disc doesn't have any tracks I recognize!
ip_conntrack version 2.1 (4095 buckets, 32760 max) - 296 bytes per conntrac=
k
reiser4[cc1(27626)]: check_dkeys (fs/reiser4/search.c:969)[vs-1199]:
code: -503 at fs/reiser4/lock.c:434
reiser4 panicked cowardly: assertion failed: keyeq(&node->rd_key, &right->l=
d_key)
------------[ cut here ]------------
kernel BUG at fs/reiser4/debug.c:75!
invalid operand: 0000 [#1]
PREEMPT=20
CPU:    0
EIP:    0060:[<c01b7b23>]    Tainted: P =20
EFLAGS: 00210202   (2.6.5-rc2)=20
EIP is at reiser4_do_panic+0x1e3/0x2a0
eax: 00000002   ebx: c0587520   ecx: da229d6c   edx: c0587520
esi: dae3e000   edi: d7c59cbd   ebp: d4613d40   esp: dae3f8d8
ds: 007b   es: 007b   ss: 0068
Process cc1 (pid: 27626, threadinfo=3Ddae3e000 task=3Dd2c08820)
Stack: df74d000 00000001 c045c951 dae3f904 c045ef1f 000001b2 52654973 d4613=
e1d=20
       c021ff22 c045c93c c0478880 c0462117 c0412848 c0461e16 000003c9 d7c59=
c00=20
       d4613e0c d4613dec c04c9200 d4613d40 dae3fa28 d4613d40 c0220d7e d4613=
d40=20
Call Trace:
 [<c021ff22>] check_dkeys+0xa2/0xa50
 [<c0220d7e>] cbk_node_lookup+0x2e/0x590
 [<c01b7e25>] schedulable+0x35/0xa0
 [<c0221813>] cbk_cache_scan_slots+0x533/0xea0
 [<c01c5e97>] zload_ra+0x87/0x220
 [<c02221b6>] cbk_cache_search+0x36/0xc0
 [<c0231277>] get_tree+0x17/0xc0
 [<c021df83>] coord_by_handle+0x13/0x40
 [<c021dca3>] object_lookup+0x113/0x3e0
 [<c01b7e25>] schedulable+0x35/0xa0
 [<c01b7e25>] schedulable+0x35/0xa0
 [<c02b58ed>] find_file_item+0x1ad/0x330
 [<c02bdde2>] tail2extent+0x252/0xc00
 [<c02bb509>] unpack+0x129/0x1f0
 [<c02bcd7a>] get_exclusive_access+0x7a/0x2b0
 [<c01e5fad>] done_context+0x43d/0x890
 [<c02babb4>] check_pages_unix_file+0x104/0x170
 [<c01b86b5>] no_counters_are_held+0x5/0xa0
 [<c01e5fad>] done_context+0x43d/0x890
 [<c02bac7a>] mmap_unix_file+0x5a/0x120
 [<c0240abc>] reiser4_mmap+0x6c/0xf0
 [<c0147661>] do_mmap_pgoff+0x321/0x690
 [<c010daf8>] sys_mmap2+0x78/0xb0
 [<c0107335>] sysenter_past_esp+0x52/0x71

Code: 0f 0b 4b 00 52 c9 45 c0 c7 04 24 48 c6 45 c0 c7 44 24 04 e0=20
 <6>note: cc1[27626] exited with preempt_count 2
bad: scheduling while atomic!
Call Trace:
 [<c011ac12>] schedule+0x582/0x590
 [<c011acc1>] __wake_up_common+0x31/0x60
 [<c02d9640>] rwsem_down_failed_common+0x90/0x150
 [<c02d93f9>] rwsem_down_read_failed+0x29/0x40
 [<c01212b6>] .text.lock.exit+0x6b/0xf5
 [<c0108740>] do_invalid_op+0x0/0xd0
 [<c0108459>] die+0xf9/0x100
 [<c0108809>] do_invalid_op+0xc9/0xd0
 [<c01b7b23>] reiser4_do_panic+0x1e3/0x2a0
 [<c032d51f>] vt_console_print+0x5f/0x2f0
 [<c0119cac>] try_to_wake_up+0xac/0x160
 [<c011e5a7>] __call_console_drivers+0x57/0x60
 [<c011acc1>] __wake_up_common+0x31/0x60
 [<c0107d91>] error_code+0x2d/0x38
 [<c01b7b23>] reiser4_do_panic+0x1e3/0x2a0
 [<c021ff22>] check_dkeys+0xa2/0xa50
 [<c0220d7e>] cbk_node_lookup+0x2e/0x590
 [<c01b7e25>] schedulable+0x35/0xa0
 [<c0221813>] cbk_cache_scan_slots+0x533/0xea0
 [<c01c5e97>] zload_ra+0x87/0x220
 [<c02221b6>] cbk_cache_search+0x36/0xc0
 [<c0231277>] get_tree+0x17/0xc0
 [<c021df83>] coord_by_handle+0x13/0x40
 [<c021dca3>] object_lookup+0x113/0x3e0
 [<c01b7e25>] schedulable+0x35/0xa0
 [<c01b7e25>] schedulable+0x35/0xa0
 [<c02b58ed>] find_file_item+0x1ad/0x330
 [<c02bdde2>] tail2extent+0x252/0xc00
 [<c02bb509>] unpack+0x129/0x1f0
 [<c02bcd7a>] get_exclusive_access+0x7a/0x2b0
 [<c01e5fad>] done_context+0x43d/0x890
 [<c02babb4>] check_pages_unix_file+0x104/0x170
 [<c01b86b5>] no_counters_are_held+0x5/0xa0
 [<c01e5fad>] done_context+0x43d/0x890
 [<c02bac7a>] mmap_unix_file+0x5a/0x120
 [<c0240abc>] reiser4_mmap+0x6c/0xf0
 [<c0147661>] do_mmap_pgoff+0x321/0x690
 [<c010daf8>] sys_mmap2+0x78/0xb0
 [<c0107335>] sysenter_past_esp+0x52/0x71


--=-PxgM3OG0VgbE/SKRwkc9
Content-Disposition: attachment; filename=config.gz
Content-Type: application/x-gzip; name=config.gz
Content-Transfer-Encoding: base64

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
zRvJ1F2i/wBWUucegXcAAA==

--=-PxgM3OG0VgbE/SKRwkc9--


