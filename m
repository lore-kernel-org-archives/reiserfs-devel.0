From: "Bill Rees" <bill@billrees.com>
Subject: Error In Dmesg
Date: Fri, 30 May 2003 08:56:32 -0400
Message-ID: <NHBBIGLOALLFLCNJNOLHMECLCBAA.bill@billrees.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14325-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS ML <reiserfs-list@namesys.com>

My application is running with the Sun jdk 1.4.1_02 under Red Hat 9.0 and
I've received this  error in dmesg:

Linux version 2.4.20-8smp (bhcompile@porky.devel.redhat.com) (gcc version
3.2.2 20030222 (Red Hat Linux 3.2.2-5)) #1 SMP Thu Mar 13 17:45:54 EST 2003
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
 BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000001fff0000 (usable)
 BIOS-e820: 000000001fff0000 - 000000001fff3000 (ACPI NVS)
 BIOS-e820: 000000001fff3000 - 0000000020000000 (ACPI data)
 BIOS-e820: 00000000fec00000 - 0000000100000000 (reserved)
0MB HIGHMEM available.
511MB LOWMEM available.
found SMP MP-table at 000f5660
hm, page 000f5000 reserved twice.
hm, page 000f6000 reserved twice.
hm, page 000f1000 reserved twice.
hm, page 000f2000 reserved twice.
On node 0 totalpages: 131056
zone(0): 4096 pages.
zone(1): 126960 pages.
zone(2): 0 pages.
Intel MultiProcessor Specification v1.4
    Virtual Wire compatibility mode.
OEM ID: OEM00000 Product ID: PROD00000000 APIC at: 0xFEE00000
Processor #0 Pentium(tm) Pro APIC version 17
Processor #1 Pentium(tm) Pro APIC version 17
I/O APIC #2 Version 17 at 0xFEC00000.
Enabling APIC mode: Flat.	Using 1 I/O APICs
Processors: 2
Kernel command line: ro root=LABEL=/1
Initializing CPU#0
Detected 999.696 MHz processor.
Console: colour VGA+ 80x25
Calibrating delay loop... 1992.29 BogoMIPS
Memory: 510644k/524224k available (1480k kernel code, 11016k reserved, 1094k
data, 156k init, 0k highmem)
Dentry cache hash table entries: 65536 (order: 7, 524288 bytes)
Inode cache hash table entries: 32768 (order: 6, 262144 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
CPU: L1 I cache: 16K, L1 D cache: 16K
CPU: L2 cache: 256K
CPU serial number disabled.
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
CPU:     After generic, caps: 0383fbff 00000000 00000000 00000000
CPU:             Common caps: 0383fbff 00000000 00000000 00000000
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
mtrr: v1.40 (20010327) Richard Gooch (rgooch@atnf.csiro.au)
mtrr: detected mtrr type: Intel
CPU: L1 I cache: 16K, L1 D cache: 16K
CPU: L2 cache: 256K
Intel machine check reporting enabled on CPU#0.
CPU:     After generic, caps: 0383fbff 00000000 00000000 00000000
CPU:             Common caps: 0383fbff 00000000 00000000 00000000
CPU0: Intel Pentium III (Coppermine) stepping 0a
per-CPU timeslice cutoff: 731.73 usecs.
task migration cache decay timeout: 10 msecs.
enabled ExtINT on CPU#0
ESR value before enabling vector: 00000000
ESR value after enabling vector: 00000000
Booting processor 1/1 eip 2000
Initializing CPU#1
masked ExtINT on CPU#1
ESR value before enabling vector: 00000000
ESR value after enabling vector: 00000000
Calibrating delay loop... 1998.84 BogoMIPS
CPU: L1 I cache: 16K, L1 D cache: 16K
CPU: L2 cache: 256K
CPU serial number disabled.
Intel machine check reporting enabled on CPU#1.
CPU:     After generic, caps: 0383fbff 00000000 00000000 00000000
CPU:             Common caps: 0383fbff 00000000 00000000 00000000
CPU1: Intel Pentium III (Coppermine) stepping 0a
Total of 2 processors activated (3991.14 BogoMIPS).
ENABLING IO-APIC IRQs
Setting 2 in the phys_id_present_map
...changing IO-APIC physical APIC ID to 2 ... ok.
init IO_APIC IRQs
 IO-APIC (apicid-pin) 2-0, 2-16, 2-17, 2-18, 2-19, 2-20, 2-21, 2-22, 2-23
not connected.
..TIMER: vector=0x31 pin1=2 pin2=0
number of MP IRQ sources: 19.
number of IO-APIC #2 registers: 24.
testing the IO APIC.......................

IO APIC #2......
.... register #00: 02000000
.......    : physical APIC id: 02
.... register #01: 00178011
.......     : max redirection entries: 0017
.......     : PRQ implemented: 1
.......     : IO APIC version: 0011
.... register #02: 00000000
.......     : arbitration: 00
.... IRQ redirection table:
 NR Log Phy Mask Trig IRR Pol Stat Dest Deli Vect:
 00 000 00  1    0    0   0   0    0    0    00
 01 0FF 0F  0    0    0   0   0    1    1    39
 02 0FF 0F  0    0    0   0   0    1    1    31
 03 0FF 0F  0    0    0   0   0    1    1    41
 04 0FF 0F  0    0    0   0   0    1    1    49
 05 0FF 0F  1    1    0   1   0    1    1    51
 06 0FF 0F  0    0    0   0   0    1    1    59
 07 0FF 0F  0    0    0   0   0    1    1    61
 08 0FF 0F  0    0    0   0   0    1    1    69
 09 0FF 0F  1    1    0   1   0    1    1    71
 0a 0FF 0F  1    1    0   1   0    1    1    79
 0b 0FF 0F  1    1    0   1   0    1    1    81
 0c 0FF 0F  0    0    0   0   0    1    1    89
 0d 0FF 0F  0    0    0   0   0    1    1    91
 0e 0FF 0F  0    0    0   0   0    1    1    99
 0f 0FF 0F  0    0    0   0   0    1    1    A1
 10 000 00  1    0    0   0   0    0    0    00
 11 000 00  1    0    0   0   0    0    0    00
 12 000 00  1    0    0   0   0    0    0    00
 13 000 00  1    0    0   0   0    0    0    00
 14 000 00  1    0    0   0   0    0    0    00
 15 000 00  1    0    0   0   0    0    0    00
 16 000 00  1    0    0   0   0    0    0    00
 17 000 00  1    0    0   0   0    0    0    00
IRQ to pin mappings:
IRQ0 -> 0:2
IRQ1 -> 0:1
IRQ3 -> 0:3
IRQ4 -> 0:4
IRQ5 -> 0:5
IRQ6 -> 0:6
IRQ7 -> 0:7
IRQ8 -> 0:8
IRQ9 -> 0:9
IRQ10 -> 0:10
IRQ11 -> 0:11
IRQ12 -> 0:12
IRQ13 -> 0:13
IRQ14 -> 0:14
IRQ15 -> 0:15
.................................... done.
Using local APIC timer interrupts.
calibrating APIC timer ...
..... CPU clock speed is 999.5208 MHz.
..... host bus clock speed is 133.2692 MHz.
cpu: 0, clocks: 1332692, slice: 444230
CPU0<T0:1332688,T1:888448,D:10,S:444230,C:1332692>
cpu: 1, clocks: 1332692, slice: 444230
CPU1<T0:1332688,T1:444224,D:4,S:444230,C:1332692>
checking TSC synchronization across CPUs: passed.
Starting migration thread for cpu 0
smp_num_cpus: 2.
Starting migration thread for cpu 1
mtrr: your CPUs had inconsistent variable MTRR settings
mtrr: probably your BIOS does not setup all CPUs
PCI: PCI BIOS revision 2.10 entry at 0xfb3e0, last bus=1
PCI: Using configuration type 1
PCI: Probing PCI hardware
PCI: Using IRQ router VIA [1106/0686] at 00:07.0
PCI->APIC IRQ transform: (B0,I7,P3) -> 9
PCI->APIC IRQ transform: (B0,I7,P3) -> 9
PCI->APIC IRQ transform: (B0,I9,P0) -> 11
PCI->APIC IRQ transform: (B0,I11,P0) -> 5
PCI->APIC IRQ transform: (B0,I12,P0) -> 10
PCI->APIC IRQ transform: (B1,I0,P0) -> 5
PCI: Enabling Via external APIC routing
isapnp: Scanning for PnP cards...
isapnp: No Plug & Play device found
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
apm: BIOS version 1.2 Flags 0x07 (Driver version 1.16)
apm: disabled - APM is not SMP safe.
Starting kswapd
VFS: Disk quotas vdquot_6.5.1
pty: 2048 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS MULTIPORT SHARE_IRQ
SERIAL_PCI ISAPNP enabled
ttyS0 at 0x03f8 (irq = 4) is a 16550A
ttyS1 at 0x02f8 (irq = 3) is a 16550A
Real Time Clock Driver v1.10e
Floppy drive(s): fd0 is 1.44M
FDC 0 is a post-1991 82077
NET4: Frame Diverter 0.46
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Uniform Multi-Platform E-IDE driver Revision: 7.00beta-2.4
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
VP_IDE: IDE controller at PCI slot 00:07.1
VP_IDE: chipset revision 6
VP_IDE: not 100% native mode: will probe irqs later
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
VP_IDE: VIA vt82c686b (rev 40) IDE UDMA100 controller on pci00:07.1
    ide0: BM-DMA at 0xd000-0xd007, BIOS settings: hda:DMA, hdb:pio
    ide1: BM-DMA at 0xd008-0xd00f, BIOS settings: hdc:DMA, hdd:pio
hda: WDC WD200EB-00CSF0, ATA DISK drive
blk: queue c0453420, I/O limit 4095Mb (mask 0xffffffff)
hdc: FX54++W, ATAPI CD/DVD-ROM drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
ide1 at 0x170-0x177,0x376 on irq 15
hda: host protected area => 1
hda: 39102336 sectors (20020 MB) w/2048KiB Cache, CHS=2434/255/63, UDMA(100)
ide-floppy driver 0.99.newide
Partition check:
 hda: hda1 hda2 hda3
ide-floppy driver 0.99.newide
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
pci_hotplug: PCI Hot Plug PCI Core version: 0.5
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 32768 bind 32768)
Linux IP multicast router 0.06 plus PIM-SM
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
RAMDISK: Compressed image found at block 0
Freeing initrd memory: 226k freed
VFS: Mounted root (ext2 filesystem).
SCSI subsystem driver Revision: 1.00
3ware Storage Controller device driver for Linux v1.02.00.031.
scsi0 : Found a 3ware Storage Controller at 0xdc00, IRQ: 11, P-chip: 5.7
scsi0 : 3ware Storage Controller
blk: queue dfb48e18, I/O limit 4095Mb (mask 0xffffffff)
  Vendor: 3ware     Model: 3w-xxxx           Rev: 1.0
  Type:   Direct-Access                      ANSI SCSI revision: 00
blk: queue dfb48c18, I/O limit 4095Mb (mask 0xffffffff)
  Vendor: 3ware     Model: 3w-xxxx           Rev: 1.0
  Type:   Direct-Access                      ANSI SCSI revision: 00
blk: queue dfb48a18, I/O limit 4095Mb (mask 0xffffffff)
  Vendor: 3ware     Model: 3w-xxxx           Rev: 1.0
  Type:   Direct-Access                      ANSI SCSI revision: 00
blk: queue dfb48818, I/O limit 4095Mb (mask 0xffffffff)
  Vendor: 3ware     Model: 3w-xxxx           Rev: 1.0
  Type:   Direct-Access                      ANSI SCSI revision: 00
blk: queue dfb48618, I/O limit 4095Mb (mask 0xffffffff)
Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
Attached scsi disk sdb at scsi0, channel 0, id 1, lun 0
Attached scsi disk sdc at scsi0, channel 0, id 2, lun 0
Attached scsi disk sdd at scsi0, channel 0, id 3, lun 0
SCSI device sda: 320173056 512-byte hdwr sectors (163929 MB)
 sda: sda1
SCSI device sdb: 320173056 512-byte hdwr sectors (163929 MB)
 sdb: sdb1
SCSI device sdc: 80041248 512-byte hdwr sectors (40981 MB)
 sdc: sdc1
SCSI device sdd: 80041248 512-byte hdwr sectors (40981 MB)
 sdd: sdd1
Journalled Block Device driver loaded
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
Freeing unused kernel memory: 156k freed
usb.c: registered new driver usbdevfs
usb.c: registered new driver hub
usb-uhci.c: $Revision: 1.275 $ time 17:50:55 Mar 13 2003
usb-uhci.c: High bandwidth mode enabled
usb-uhci.c: USB UHCI at I/O 0xd400, IRQ 9
usb-uhci.c: Detected 2 ports
usb.c: new USB bus registered, assigned bus number 1
hub.c: USB hub found
hub.c: 2 ports detected
usb-uhci.c: USB UHCI at I/O 0xd800, IRQ 9
usb-uhci.c: Detected 2 ports
usb.c: new USB bus registered, assigned bus number 2
hub.c: USB hub found
hub.c: 2 ports detected
usb-uhci.c: v1.275:USB Universal Host Controller Interface driver
usb.c: registered new driver hiddev
usb.c: registered new driver hid
hid-core.c: v1.8.1 Andreas Gal, Vojtech Pavlik <vojtech@suse.cz>
hid-core.c: USB HID support drivers
mice: PS/2 mouse device common for all mice
EXT3 FS 2.4-0.9.19, 19 August 2002 on ide0(3,2), internal journal
Unable to find swap-space signature
Adding Swap: 1044216k swap-space (priority -1)
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.19, 19 August 2002 on ide0(3,1), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
reiserfs: checking transaction log (device 08:21) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 08:31) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
Unable to find swap-space signature
parport0: PC-style at 0x378 [PCSPP,EPP]
parport_pc: Via 686A parallel port: io=0x378
ip_tables: (C) 2000-2002 Netfilter core team
Intel(R) PRO/100 Network Driver - version 2.1.29-k2
Copyright (c) 2002 Intel Corporation

e100: selftest OK.
divert: allocating divert_blk for eth0
e100: eth0: Intel(R) PRO/100 S Desktop Adapter
  Hardware receive checksums enabled
  cpu cycle saver enabled

e100: selftest OK.
divert: allocating divert_blk for eth1
e100: eth1: Intel(R) PRO/100 S Desktop Adapter
  Hardware receive checksums enabled
  cpu cycle saver enabled

e100: eth0 NIC Link is Up 100 Mbps Full duplex
e100: eth1 NIC Link is Up 100 Mbps Full duplex
parport0: PC-style at 0x378 [PCSPP,EPP]
parport_pc: Via 686A parallel port: io=0x378
lp0: using parport0 (polling).
lp0: console ready
ide-floppy driver 0.99.newide
hdc: ATAPI 54X CD-ROM drive, 128kB Cache, UDMA(33)
Uniform CD-ROM driver Revision: 3.12
Unable to handle kernel NULL pointer dereference at virtual address 00000018
 printing eip:
e092b263
*pde = 00000000
Oops: 0000
ide-cd cdrom parport_pc lp parport autofs e100 ipt_REJECT iptable_filter
ip_tables reiserfs keybdev mousedev hid input usb-uhci usbcore ext3 jbd
3w-xxxx sd_mo
CPU:    0
EIP:    0060:[<e092b263>]    Not tainted
EFLAGS: 00010282

EIP is at do_journal_end [reiserfs] 0x3b3 (2.4.20-8smp)
eax: 00000000   ebx: 0c2b90bf   ecx: d0f46000   edx: 00000033
esi: 00306ffe   edi: e0a35300   ebp: e0a0cc68   esp: da92fe1c
ds: 0068   es: 0068   ss: 0068
Process java (pid: 22687, stackpage=da92f000)
Stack: c2547000 00000000 00001000 00000000 00000004 e09f73c4 00000000
00000000
       00000000 00000000 00000034 dbdacd80 c57b2400 c33da380 ca975000
d0f46000
       e0a35300 00000000 dd1be180 da92fea8 d74eba80 e092a265 da92fea8
c2547000
Call Trace:   [<e092a265>] journal_end [reiserfs] 0x35 (0xda92fe70))
[<e090e5aa>] reiserfs_unlink [reiserfs] 0x1da (0xda92fe84))
[<e0934f16>] .rodata.str1.1 [reiserfs] 0x7d4 (0xda92fea8))
[<c015efdb>] cached_lookup [kernel] 0x1b (0xda92ff54))
[<c01615d0>] vfs_unlink [kernel] 0x160 (0xda92ff68))
[<c0161869>] sys_unlink [kernel] 0x119 (0xda92ff84))
[<c01098cf>] system_call [kernel] 0x33 (0xda92ffc0))


Code: 8b 40 18 a9 00 00 01 00 0f 85 71 06 00 00 ff 4c 24 28 8b 6d


