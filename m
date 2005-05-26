From: =?iso-8859-1?q?L=E9o_?= <daniel.leo@free.fr>
Subject: help needed for data recovery, please
Date: Thu, 26 May 2005 16:40:56 +0200
Message-ID: <200505261640.57084.daniel.leo@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24157-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com




human aspect : lots of work on a hardrive that I can't access=20

thanks for your help=20
L=E9o=20

technicaly :=20

The problem :=20

reiserfsck 3.6.17 (2003 www.namesys.com)
returns=20

create_badblock_bitmap: block number (960) belongs to system reiserfs area.=
 It=20
cannot be relocated.

motherboard is a asrock with sata=20
harddrive is maxtor sata 80Gb=20
all this is detailed is the syslog output below=20
this is my dmesg :=20

       Linux version 2.6.10-gentoo-r6 (root@samael) (version gcc 3.3.5
      (Gentoo Linux 3.3.5-r1, ssp-3.3.2-3, pie-8.7.7.1)) #2 Fri Apr 15
  22:13:46 CEST 2005 BIOS-provided physical RAM map: BIOS-e820:
        0000000000000000 - 000000000009fc00 (usable) BIOS-e820:
      000000000009fc00 - 00000000000a0000 (reserved) BIOS-e820:
      00000000000d6000 - 00000000000de000 (reserved) BIOS-e820:
      00000000000f0000 - 0000000000100000 (reserved) BIOS-e820:
        0000000000100000 - 000000003fff0000 (usable) BIOS-e820:
     000000003fff0000 - 000000003fff8000 (ACPI data) BIOS-e820:
      000000003fff8000 - 0000000040000000 (ACPI NVS) BIOS-e820:
      00000000fec00000 - 00000000fec01000 (reserved) BIOS-e820:
      00000000fee00000 - 00000000fee01000 (reserved) BIOS-e820:
   00000000fff80000 - 0000000100000000 (reserved) 127MB HIGHMEM
 available.  896MB LOWMEM available.  On node 0 totalpages: 262128 DMA
 zone: 4096 pages, LIFO batch:1 Normal zone: 225280 pages, LIFO
     batch:16 HighMem zone: 32752 pages, LIFO batch:7 DMI 2.3 present.
 ACPI: RSDP (v000 AMI                                   ) @ 0x000fa8c0
 ACPI: RSDT (v001 AMIINT VIA_K7   0x00000010 MSFT 0x00000097) @
    0x3fff0000 ACPI: FADT (v001 AMIINT VIA_K7   0x00000011 MSFT
  0x00000097) @ 0x3fff0030 ACPI: MADT (v001 AMIINT VIA_K7   0x00000009
 MSFT 0x00000097) @ 0x3fff00c0 ACPI: DSDT (v001    VIA    K7VT4
0x00001000 MSFT 0x0100000d) @ 0x00000000 ACPI: PM-Timer IO Port: 0x808
 ACPI: Local APIC address 0xfee00000 ACPI: LAPIC (acpi_id[0x01]
 lapic_id[0x00] enabled) Processor #0 6:8 APIC version 16 ACPI: IOAPIC
      (id[0x02] address[0xfec00000] gsi_base[0]) IOAPIC[0]: apic_id 2,
      version 3, address 0xfec00000, GSI 0-23 ACPI: INT_SRC_OVR (bus 0
    bus_irq 0 global_irq 2 dfl dfl) ACPI: INT_SRC_OVR (bus 0 bus_irq 9
 global_irq 9 low level) ACPI: IRQ0 used by override.  ACPI: IRQ2 used
by override.  ACPI: IRQ9 used by override.  Enabling APIC mode:  Flat.
 Using 1 I/O APICs Using ACPI (MADT) for SMP configuration information
       Built 1 zonelists Kernel command line: root=3D/dev/hda3 idebus=3D66
 hdd=3Dide-scsi ide_setup: idebus=3D66 ide_setup: hdd=3Dide-scsi mapped APIC
    to ffffd000 (fee00000) mapped IOAPIC to ffffc000 (fec00000)
     Initializing CPU#0 PID hash table entries: 4096 (order: 12, 65536
     bytes) Detected 1998.746 MHz processor.  Using pmtmr for high-res
timesource Console: colour VGA+ 80x25 Dentry cache hash table entries:
 131072 (order: 7, 524288 bytes) Inode-cache hash table entries: 65536
   (order: 6, 262144 bytes) Memory: 1034948k/1048512k available (2482k
 kernel code, 12976k reserved, 1016k data, 176k init, 131008k highmem)
      Checking if this processor honours the WP bit even in supervisor
 mode... Ok.  Calibrating delay loop... 3948.54 BogoMIPS (lpj=3D1974272)
 Mount-cache hash table entries: 512 (order: 0, 4096 bytes) CPU: After
generic identify, caps: 0383fbff c1c3fbff 00000000 00000000 CPU: After
 vendor identify, caps:  0383fbff c1c3fbff 00000000 00000000 CPU: L1 I
Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line) CPU: L2 Cache:
      256K (64 bytes/line) CPU: After all inits, caps:        0383fbff
c1c3fbff 00000000 00000020 Intel machine check architecture supported.
  Intel machine check reporting enabled on CPU#0.  CPU: AMD Athlon(tm)
      XP 2400+ stepping 01 Enabling fast FPU save and restore... done.
 Enabling unmasked SIMD FPU exception support... done.  Checking 'hlt'
 instruction... OK.  ENABLING IO-APIC IRQs ..TIMER: vector=3D0x31 pin1=3D2
pin2=3D-1 NET: Registered protocol family 16 PCI: PCI BIOS revision 2.10
    entry at 0xfda71, last bus=3D1 PCI: Using configuration type 1 mtrr:
   v2.0 (20020519) ACPI: Subsystem revision 20041105 ACPI: Interpreter
enabled ACPI: Using IOAPIC for interrupt routing ACPI: PCI Root Bridge
 [PCI0] (00:00) PCI: Probing PCI hardware (bus 00) ACPI: PCI Interrupt
     Routing Table [\_SB_.PCI0._PRT] ACPI: Power Resource [URP1] (off)
   ACPI: Power Resource [URP2] (off) ACPI: Power Resource [FDDP] (off)
     ACPI: Power Resource [LPTP] (off) ACPI: PCI Interrupt Link [LNKA]
(IRQs 3 4 5 7 10 *11 12 14 15) ACPI: PCI Interrupt Link [LNKB] (IRQs 3
  4 5 7 *10 11 12 14 15) ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 7
* 10 11 12 14 15) ACPI: PCI Interrupt Link [LNKD] (IRQs *3 4 5 7 10 11
   12 14 15) ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 7 10 11 12 14
15) *0, disabled.  ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 7 10 11
12 14 15) *0, disabled.  ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 7
10 11 12 14 15) *0, disabled.  ACPI: PCI Interrupt Link [LNKH] (IRQs 3
4 5 7 10 11 12 14 15) *0, disabled.  Linux Plug and Play Support v0.97
(c) Adam Belay pnp: PnP ACPI init pnp: PnP ACPI: found 11 devices SCSI
   subsystem initialized usbcore: registered new driver usbfs usbcore:
      registered new driver hub PCI: Using ACPI for IRQ routing ** PCI
   interrupts are no longer routed automatically.  If this ** causes a
device to stop working, it is probably because the ** driver failed to
   call pci_enable_device().  As a temporary ** workaround, the
 "pci=3Drouteirq" argument restores the old ** behavior.  If this
   argument makes the device work again, ** please email the output of
 "lspci" to bjorn.helgaas@hp.com ** so I can fix the driver.  pnp: the
     driver 'system' has been registered pnp: match found with the PnP
device '00:04' and the driver 'system' Machine check exception polling
  timer started.  audit: initializing netlink socket (disabled)
     audit(1117124350.355:0): initialized highmem bounce pool size: 64
     pages Total HugeTLB memory allocated, 0 devfs: 2004-01-31 Richard
    Gooch (rgooch@atnf.csiro.au) devfs: devfs_debug: 0x0 devfs:
       boot_options: 0x1 Initializing Cryptographic API inotify device
    minor=3D63 Linux agpgart interface v0.100 (c) Dave Jones ACPI: Power
 Button (FF) [PWRF] ACPI: Sleep Button (CM) [SLPB] ibm_acpi: ec object
  not found serio: i8042 AUX port at 0x60,0x64 irq 12 serio: i8042 KBD
 port at 0x60,0x64 irq 1 Serial: 8250/16550 driver $Revision: 1.90 $ 8
  ports, IRQ sharing disabled ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
pnp: the driver 'serial' has been registered pnp: match found with the
  PnP device '00:01' and the driver 'serial' ttyS0 at I/O 0x3f8 (irq =3D
4)   is a 16550A mice: PS/2 mouse device common for all mice input: AT
    Translated Set 2 keyboard on isa0060/serio0 input: ImPS/2 Logitech
  Wheel Mouse on isa0060/serio1 io scheduler noop registered io
 scheduler anticipatory registered io scheduler deadline registered io
   scheduler cfq registered elevator: using anticipatory as default io
    scheduler Floppy drive(s): fd0 is 1.44M FDC 0 is a post-1991 82077
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2 ide: Assuming
    66MHz system bus speed for PIO modes Probing IDE interface ide0...
    hda: SAMSUNG SP0802N, ATA DISK drive Probing IDE interface ide1...
      hdc: LITEON DVD-ROM LTD163, ATAPI CD/DVD-ROM drive hdd: HL-DT-ST
DVDRAM GSA-4163B, ATAPI CD/DVD-ROM drive Probing IDE interface ide2...
     ide2: Wait for ready failed before probe !  Probing IDE interface
      ide3...  ide3: Wait for ready failed before probe !  Probing IDE
interface ide4...  ide4: Wait for ready failed before probe !  Probing
     IDE interface ide5...  ide5: Wait for ready failed before probe !
  ide0 at 0x1f0-0x1f7,0x3f6 on irq 14 ide1 at 0x170-0x177,0x376 on irq
   15 hda: max request size: 1024KiB hda: 156368016 sectors (80060 MB)
 w/2048KiB Cache, CHS=3D16383/255/63 hda: cache flushes supported
     /dev/ide/host0/bus0/target0/lun0: p1 p2 p3 hdc: ATAPI 48X DVD-ROM
     drive, 512kB Cache Uniform CD-ROM driver Revision: 3.20 ACPI: PCI
   interrupt 0000:00:10.4[C] -> GSI 21 (level, low) -> IRQ 21 ehci_hcd
   0000:00:10.4: VIA Technologies, Inc. USB 2.0 ehci_hcd 0000:00:10.4:
  irq 21, pci mem 0xdfffbe00 ehci_hcd 0000:00:10.4: new USB bus
      registered, assigned bus number 1 ehci_hcd 0000:00:10.4: USB 2.0
 initialized, EHCI 1.00, driver 26 Oct 2004 hub 1-0:1.0: USB hub found
 hub 1-0:1.0: 8 ports detected USB Universal Host Controller Interface
driver v2.2 ACPI: PCI interrupt 0000:00:10.0[A] -> GSI 21 (level, low)
=2D>   IRQ 21 PCI: Via IRQ fixup for 0000:00:10.0, from 11 to 5 uhci_hcd
0000:00:10.0: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller
  uhci_hcd 0000:00:10.0: irq 21, io base 0xc000 uhci_hcd 0000:00:10.0:
    new USB bus registered, assigned bus number 2 hub 2-0:1.0: USB hub
        found hub 2-0:1.0: 2 ports detected ACPI: PCI interrupt
   0000:00:10.1[A] -> GSI 21 (level, low) -> IRQ 21 PCI: Via IRQ fixup
      for 0000:00:10.1, from 11 to 5 uhci_hcd 0000:00:10.1: VIA
     Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller(#2) uhci_hcd
   0000:00:10.1: irq 21, io base 0xc400 uhci_hcd 0000:00:10.1: new USB
  bus registered, assigned bus number 3 hub 3-0:1.0: USB hub found hub
  3-0:1.0: 2 ports detected ACPI: PCI interrupt 0000:00:10.2[B] -> GSI
21 (level, low) -> IRQ 21 PCI: Via IRQ fixup for 0000:00:10.2, from 10
 to 5 uhci_hcd 0000:00:10.2: VIA Technologies, Inc. VT82xxxxx UHCI USB
1. 1 Controller(#3) uhci_hcd 0000:00:10.2: irq 21, io base 0xc800
  uhci_hcd 0000:00:10.2: new USB bus registered, assigned bus number 4
    hub 4-0:1.0: USB hub found hub 4-0:1.0: 2 ports detected ACPI: PCI
   interrupt 0000:00:10.3[B] -> GSI 21 (level, low) -> IRQ 21 PCI: Via
   IRQ fixup for 0000:00:10.3, from 10 to 5 uhci_hcd 0000:00:10.3: VIA
     Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller(#4) uhci_hcd
   0000:00:10.3: irq 21, io base 0xcc00 uhci_hcd 0000:00:10.3: new USB
  bus registered, assigned bus number 5 hub 5-0:1.0: USB hub found hub
 5-0:1.0: 2 ports detected usbcore: registered new driver usblp
     drivers/usb/class/usblp.c: v0.13: USB Printer Device Class driver
  Initializing USB Mass Storage driver...  usb 3-1: new full speed USB
device using uhci_hcd and address 2 drivers/usb/class/usblp.c: usblp0:
     USB Bidirectional printer dev 2 if 0 alt 0 proto 2 vid 0x03F0 pid
    0x7304 usbcore: registered new driver usb-storage USB Mass Storage
   support registered.  usbcore: registered new driver hiddev usbcore:
   registered new driver usbhid drivers/usb/input/hid-core.c: v2.0:USB
   HID core driver NET: Registered protocol family 2 IP: routing cache
      hash table of 8192 buckets, 64Kbytes TCP: Hash tables configured
 (established 262144 bind 65536) ip_conntrack version 2.1 (8191
buckets, 65528 max) - 300 bytes per conntrack ip_tables: (C) 2000-2002
    Netfilter core team ipt_recent v0.3.1: Stephen Frost
 <sfrost@snowman.net>.  http://snowman.net/projects/ipt_recent/
arp_tables: (C) 2002 David S. Miller NET: Registered protocol family 1
NET: Registered protocol family 17 ACPI wakeup devices: PCI0 UAR1 USB1
USB2 USB3 USB4 EHCI USBD PS2M PS2K  AC9  MC9 ILAN SLPB ACPI: (supports
      S0 S1 S3 S4 S5) ReiserFS: hda3: found reiserfs format "3.6" with
    standard journal ReiserFS: hda3: using ordered data mode ReiserFS:
     hda3: journal params: device hda3, size 8192, journal first block
18,max trans len 1024, max batch 900, max commit age 30, max trans age
    30 ReiserFS: hda3: checking transaction log (hda3) ReiserFS: hda3:
    journal-1153: found in header: first_unflushed_offset 1241,
   last_flushed_trans_id 347521 ReiserFS: hda3: journal-1206: Starting
       replay from offset 1492595624641753, trans_id 0 ReiserFS: hda3:
 journal-1299: Setting newest_mount_id to 443 ReiserFS: hda3: Using r5
  hash to sort names VFS: Mounted root (reiserfs filesystem) readonly.
 Mounted devfs on /dev Freeing unused kernel memory: 176k freed Adding
 2048276k swap on /dev/hda2.  Priority:-1 extents:1 ide-scsi is
 deprecated for cd burning! Use ide-cd and give dev=3D/dev/hdX as device
     scsi0 : SCSI host adapter emulation for IDE ATAPI devices Vendor:
    HL-DT-ST  Model: DVDRAM GSA-4163B  Rev: A100 Type:   CD-ROM
   ANSI SCSI revision: 02 sr0: scsi3-mmc drive: 40x/40x writer dvd-ram
cd/rw xa/form2 cdda tray Attached scsi CD-ROM sr0 at scsi0, channel 0,
  id 0, lun 0 Attached scsi generic sg0 at scsi0, channel 0, id 0, lun
    0,  type 5 Real Time Clock Driver v1.12 ACPI: PCI interrupt
  0000:00:0b.0[A] -> GSI 19 (level, low) -> IRQ 19 ACPI: PCI interrupt
       0000:01:00.0[A] -> GSI 16 (level, low) -> IRQ 16 rivafb: nVidia
  device/chipset 10DE0171 rivafb: nVidia Corporation NV17 [GeForce4 MX
  440] rivafb: Detected CRTC controller 0 being used rivafb: RIVA MTRR
set to ON rivafb: could not retrieve EDID from DDC/I2C rivafb: setting
virtual Y resolution to 104857 rivafb: PCI nVidia NV17 framebuffer ver
0.9. 5b (64MB @ 0xD0000000) via-rhine.c:v1.10-LK1.2.0-2.6 June-10-2004
Written by Donald Becker ACPI: PCI interrupt 0000:00:12.0[A] -> GSI 23
    (level, low) -> IRQ 23 eth0: VIA Rhine II at 0xbc00,
  00:0b:6a:84:bc:c7, IRQ 23.  eth0: MII PHY found at address 1, status
0x7849 advertising 05e1 Link 0000.  VP_IDE: IDE controller at PCI slot
    0000:00:0f.1 ACPI: PCI interrupt 0000:00:0f.1[A] -> GSI 20 (level,
     low) -> IRQ 20 VP_IDE: chipset revision 6 VP_IDE: not 100% native
 mode: will probe irqs later VP_IDE: User given PCI clock speed
  impossible (66000), using 33 MHz instead.  VP_IDE: Use ide0=3Data66 if
    you want to assume 80-wire cable.  VP_IDE: VIA vt8237 (rev 00) IDE
     UDMA133 controller on pci0000:00:0f.1 VP_IDE: port 0x01f0 already
   claimed by ide0 VP_IDE: port 0x0170 already claimed by ide1 VP_IDE:
 neither IDE port enabled (BIOS) libata version 1.10 loaded.  sata_via
version 1.1 ACPI: PCI interrupt 0000:00:0f.0[B] -> GSI 20 (level, low)
=2D>     IRQ 20 sata_via(0000:00:0f.0): routed to hard irq line 10 ata1:
SATA max UDMA/133 cmd 0xE800 ctl 0xE402 bmdma 0xD800 irq 20 ata2: SATA
max UDMA/133 cmd 0xE000 ctl 0xDC02 bmdma 0xD808 irq 20 ata1: dev 0 cfg
 49:2f00 82:7c6b 83:7b09 84:4003 85:7c68 86:3a01 87:4003 88:407f ata1:
dev 0 ATA, max UDMA/133, 160086528 sectors: ata1: dev 0 configured for
     UDMA/133 scsi1 : sata_via ata2: dev 0 cfg 49:2f00 82:7c6b 83:7b09
84:4003 85:7c68 86:3a01 87:4003 88:407f ata2: dev 0 ATA, max UDMA/133,
 160084415 sectors: ata2: dev 0 configured for UDMA/133 scsi2 :
   sata_via Vendor: ATA       Model: Maxtor 6Y080M0    Rev: YAR5 Type:
 Direct-Access                      ANSI SCSI revision: 05 SCSI device
sda: 160086528 512-byte hdwr sectors (81964 MB) SCSI device sda: drive
    cache: write back SCSI device sda: 160086528 512-byte hdwr sectors
     (81964 MB) SCSI device sda: drive cache: write back
 /dev/scsi/host1/bus0/target0/lun0: p1 p2 p3 Attached scsi disk sda at
     scsi1, channel 0, id 0, lun 0 Attached scsi generic sg1 at scsi1,
       channel 0, id 0, lun 0,  type 0 Vendor: ATA       Model: Maxtor
  6Y080M0    Rev: YAR5 Type:   Direct-Access                      ANSI
    SCSI revision: 05 SCSI device sdb: 160084415 512-byte hdwr sectors
  (81963 MB) SCSI device sdb: drive cache: write back SCSI device sdb:
     160084415 512-byte hdwr sectors (81963 MB) SCSI device sdb: drive
cache: write back /dev/scsi/host2/bus0/target0/lun0: p1 p2 p3 Attached
  scsi disk sdb at scsi2, channel 0, id 0, lun 0 Attached scsi generic
   sg2 at scsi2, channel 0, id 0, lun 0,  type 0 agpgart: Detected VIA
KT400/KT400A/KT600 chipset agpgart: Maximum main memory to use for agp
memory: 941M agpgart: AGP aperture is 128M @ 0xe0000000 ohci_hcd: 2004
 Nov 08 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI) cdrom: This
        disc doesn't have any tracks I recognize






Kernel version : =20
    linux-2.6.10-gentoo-r6






bash-2.05b# debugreiserfs /dev/sda3

     debugreiserfs 3.6.17 (2003 www.namesys.com)


=46ilesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x803 of format 3.6 with standard journ=
al
Count of blocks on the device: 19496880
Number of bitmaps: 595
Blocksize: 4096
=46ree blocks (count of blocks - used [journal, bitmaps, data, reserved]=20
blocks):1149561
Root block: 8257647
=46ilesystem marked as NOT cleanly umounted
Tree height: 5
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x6e60712c]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
=46s state field: 0x0:
sb_version: 2
inode generation number: 356334
UUID: cb64e26e-7557-401d-afea-faf8f4f794f8
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN


Syslog output :=20

May 26 11:59:14 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:16 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:18 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:20 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:21 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:24 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:25 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:26 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:28 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:30 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:31 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:33 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:34 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:36 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:38 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:39 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:41 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:43 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:44 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:47 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:48 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:49 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:51 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:52 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:54 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:55 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:57 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 11:59:58 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:00 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:00 [CRON] (root) CMD (rm -f /var/spool/cron/lastrun/cron.hourl=
y)=20
May 26 12:00:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 12:00:01 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:03 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:04 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:05 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:07 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:09 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:10 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:12 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:14 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:15 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:17 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:18 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:20 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:22 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:23 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:25 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:27 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:28 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:32 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:33 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:34 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:38 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:40 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:42 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:43 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:45 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:46 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:48 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:49 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:50 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:53 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:54 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:56 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:57 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:00:58 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:00 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:01 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:03 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:04 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:05 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:07 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:08 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:10 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:11 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:12 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:14 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:15 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:16 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:18 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:19 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:21 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:22 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:23 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:26 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:27 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:28 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:30 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:31 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:33 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:34 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:35 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:37 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:38 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:39 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:41 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:42 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:43 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:45 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:46 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:48 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:49 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:50 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:52 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:53 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:54 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:01:58 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:02:00 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:02:02 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:02:03 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:02:05 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:02:05 [kernel] ata1: error=3D0x40 { UncorrectableError }
May 26 12:02:06 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 12:02:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:03:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:03:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:04:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:04:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:05:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:05:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:06:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:06:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:07:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:07:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:08:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:08:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:09:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:09:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:10:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:10:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:11:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:11:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:12:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:12:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:13:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:13:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:14:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:14:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:15:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 12:15:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:15:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:16:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:16:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:17:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:17:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:18:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:18:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:19:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:19:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:20:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:20:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:21:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:21:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:22:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:22:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:23:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:23:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:24:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:24:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:25:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:25:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:26:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:26:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:27:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:27:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:28:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:28:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:29:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:29:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:30:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 12:30:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:30:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:31:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:31:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:32:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:32:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:33:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:33:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:34:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:34:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:35:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:35:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:36:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:36:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:37:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:37:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:38:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:38:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:39:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:39:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:40:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:40:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:41:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:41:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:42:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:42:06 [kernel] ATA: abnormal status 0x59 on port 0xE807
May 26 12:42:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:43:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:43:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:44:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:44:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:45:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 12:45:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:45:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:46:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:46:06 [kernel] ATA: abnormal status 0x59 on port 0xE807
May 26 12:46:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:47:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:47:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:48:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:48:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:49:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:49:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:50:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:50:06 [kernel] ATA: abnormal status 0x59 on port 0xE807
May 26 12:50:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:51:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:51:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:52:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:52:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:53:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:53:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:54:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:54:06 [kernel] ATA: abnormal status 0x59 on port 0xE807
May 26 12:54:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:55:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:55:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:56:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:56:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:57:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:57:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:58:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:58:06 [kernel] ATA: abnormal status 0x59 on port 0xE807
May 26 12:58:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:58:36 [kernel] ATA: abnormal status 0x59 on port 0xE807
May 26 12:59:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 12:59:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:00:00 [CRON] (root) CMD (rm -f /var/spool/cron/lastrun/cron.hourl=
y)=20
May 26 13:00:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 13:00:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:00:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:01:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:01:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:02:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:02:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:02:36 [kernel] ATA: abnormal status 0x59 on port 0xE807
May 26 13:03:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:03:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:04:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:04:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:05:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:05:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:06:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:06:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:06:36 [kernel] ATA: abnormal status 0x59 on port 0xE807
May 26 13:07:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:07:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:08:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:08:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:09:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:09:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:10:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:10:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:10:36 [kernel] ATA: abnormal status 0x59 on port 0xE807
May 26 13:11:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:11:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:12:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:12:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:13:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:13:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:14:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:14:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:14:36 [kernel] ATA: abnormal status 0x59 on port 0xE807
May 26 13:15:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 13:15:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:15:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:16:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:16:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:17:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:17:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:18:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:18:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:18:35 [kernel] ATA: abnormal status 0x59 on port 0xE807
May 26 13:19:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:19:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:20:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:20:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:21:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:21:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:22:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:22:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:22:35 [kernel] ATA: abnormal status 0x59 on port 0xE807
May 26 13:23:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:23:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:24:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:24:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:25:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:25:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:26:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:26:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:27:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:27:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:28:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:28:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:29:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:29:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:30:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 13:30:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:30:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:31:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:31:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:32:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:32:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:33:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:33:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:34:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:34:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:35:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:35:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:36:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:36:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:37:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:37:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:38:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:38:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:39:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:39:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:40:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:40:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:41:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:41:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:42:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:42:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:43:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:43:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:44:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:44:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:45:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 13:45:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:45:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:46:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:46:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:47:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:47:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:48:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:48:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:49:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:49:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:50:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:50:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:51:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:51:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:52:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:52:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:53:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:53:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:54:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:54:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:54:35 [kernel] ATA: abnormal status 0x59 on port 0xE807
May 26 13:55:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:55:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:56:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:56:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:57:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:57:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:58:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:58:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:58:35 [kernel] ATA: abnormal status 0x59 on port 0xE807
May 26 13:59:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 13:59:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:00:00 [CRON] (root) CMD (rm -f /var/spool/cron/lastrun/cron.hourl=
y)=20
May 26 14:00:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 14:00:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:00:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:01:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:01:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:02:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:02:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:02:35 [kernel] ATA: abnormal status 0x59 on port 0xE807
May 26 14:03:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:03:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:04:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:04:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:05:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:05:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:06:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:06:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:07:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:07:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:08:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:08:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:09:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:09:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:10:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:10:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:11:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:11:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:12:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:12:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:13:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:13:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:14:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:14:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:15:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 14:15:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:15:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:16:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:16:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:17:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:17:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:18:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:18:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:19:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:19:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:20:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:20:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:21:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:21:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:22:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:22:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:23:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:23:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:24:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:24:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:25:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:25:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:26:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:26:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:27:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:27:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:28:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:28:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:29:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:29:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:30:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 14:30:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:30:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:31:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:31:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:32:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:32:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:33:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:33:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:34:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:34:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:35:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:35:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:36:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:36:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:37:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:37:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:38:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:38:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:39:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:39:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:40:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:40:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:41:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:41:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:42:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:42:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:43:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:43:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:44:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:44:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:45:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 14:45:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:45:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:46:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:46:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:47:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:47:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:48:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:48:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:49:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:49:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:50:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:50:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:51:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:51:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:52:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:52:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:53:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:53:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:54:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:54:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:55:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:55:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:56:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:56:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:57:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:57:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:58:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:58:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:59:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 14:59:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:00:00 [CRON] (root) CMD (rm -f /var/spool/cron/lastrun/cron.hourl=
y)=20
May 26 15:00:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 15:00:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:00:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:01:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:01:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:02:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:02:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:03:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:03:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:04:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:04:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:05:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:05:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:06:05 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:06:35 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:07:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:07:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:08:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:08:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:09:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:09:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:10:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:10:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:11:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:11:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:12:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:12:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:13:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:13:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:14:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:14:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:15:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 15:15:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:15:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:16:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:16:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:17:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:17:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:18:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:18:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:19:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:19:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:20:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:20:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:21:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:21:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:22:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:22:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:23:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:23:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:24:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:24:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:25:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:25:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:26:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:26:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:27:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:27:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:28:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:28:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:29:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:29:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:30:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 15:30:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:30:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:31:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:31:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:32:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:32:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:33:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:33:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:34:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:34:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:35:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:35:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:36:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:36:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:37:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:37:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:38:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:38:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:39:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:39:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:40:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:40:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:41:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:41:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:42:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:42:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:43:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:43:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:44:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:44:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:45:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 15:45:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:45:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:46:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:46:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:47:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:47:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:48:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:48:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:49:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:49:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:50:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:50:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:51:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:51:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:52:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:52:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:53:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:53:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:54:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:54:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:55:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:55:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:56:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:56:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:57:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:57:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:58:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:58:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:59:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 15:59:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:00:00 [CRON] (root) CMD (rm -f /var/spool/cron/lastrun/cron.hourl=
y)=20
May 26 16:00:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons=20
&& /usr/sbin/run-crons )=20
May 26 16:00:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:00:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:01:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:01:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:02:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:02:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:03:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:03:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:04:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:04:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:05:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:05:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:06:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:06:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:07:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:07:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:08:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:08:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:09:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:09:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:10:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:10:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:11:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:11:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:12:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:12:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:13:04 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:13:34 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat 0x1
May 26 16:13:35 [init] Switching to runlevel: 6
May 26 16:13:40 [sshd] Received signal 15; terminating.
May 26 16:13:41 [xfs] terminating=20
May 26 16:15:39 [kernel] ibm_acpi: ec object not found
May 26 16:15:39 [kernel] serio: i8042 AUX port at 0x60,0x64 irq 12
May 26 16:15:39 [kernel] USB Mass Storage support registered.
May 26 16:15:39 [kernel] usbcore: registered new driver hiddev
May 26 16:15:39 [kernel] usbcore: registered new driver usbhid
May 26 16:15:39 [kernel] drivers/usb/input/hid-core.c: v2.0:USB HID core=20
driver
May 26 16:15:39 [kernel] NET: Registered protocol family 2
May 26 16:15:39 [kernel] IP: routing cache hash table of 8192 buckets,=20
64Kbytes
May 26 16:15:39 [kernel] TCP: Hash tables configured (established 262144 bi=
nd=20
65536)
May 26 16:15:39 [kernel] ip_conntrack version 2.1 (8191 buckets, 65528 max)=
 -=20
300 bytes per conntrack
May 26 16:15:39 [kernel] ip_tables: (C) 2000-2002 Netfilter core team
May 26 16:15:39 [kernel] ipt_recent v0.3.1: Stephen Frost=20
<sfrost@snowman.net>.  http://snowman.net/projects/ipt_recent/
May 26 16:15:39 [kernel] arp_tables: (C) 2002 David S. Miller
May 26 16:15:39 [kernel] NET: Registered protocol family 1
May 26 16:15:39 [kernel] NET: Registered protocol family 17
May 26 16:15:39 [kernel] ACPI wakeup devices:=20
May 26 16:15:39 [kernel] PCI0 UAR1 USB1 USB2 USB3 USB4 EHCI USBD PS2M PS2K =
=20
AC9  MC9 ILAN SLPB=20
May 26 16:15:39 [kernel] ACPI: (supports S0 S1 S3 S4 S5)
May 26 16:15:39 [kernel] ReiserFS: hda3: found reiserfs format "3.6" with=20
standard journal
May 26 16:15:39 [kernel] ReiserFS: hda3: using ordered data mode
May 26 16:15:39 [kernel] ReiserFS: hda3: journal params: device hda3, size=
=20
8192, journal first block 18, max trans len 1024, max batch 900, max commit=
=20
age 30, max trans age 30
May 26 16:15:39 [kernel] ReiserFS: hda3: checking transaction log (hda3)
May 26 16:15:39 [kernel] ReiserFS: hda3: Using r5 hash to sort names
May 26 16:15:39 [kernel] VFS: Mounted root (reiserfs filesystem) readonly.
May 26 16:15:39 [kernel] Mounted devfs on /dev
May 26 16:15:39 [kernel] Freeing unused kernel memory: 176k freed
May 26 16:15:39 [kernel] Adding 2048276k swap on /dev/hda2.  Priority:-1=20
extents:1
May 26 16:15:39 [kernel] ide-scsi is deprecated for cd burning! Use ide-cd =
and=20
give dev=3D/dev/hdX as device
May 26 16:15:39 [kernel] scsi0 : SCSI host adapter emulation for IDE ATAPI=
=20
devices
May 26 16:15:39 [kernel]   Vendor: HL-DT-ST  Model: DVDRAM GSA-4163B  Rev:=
=20
A100
May 26 16:15:39 [kernel]   Type:   CD-ROM                             ANSI=
=20
SCSI revision: 02
May 26 16:15:39 [kernel] sr0: scsi3-mmc drive: 40x/40x writer dvd-ram cd/rw=
=20
xa/form2 cdda tray
May 26 16:15:39 [kernel] Attached scsi generic sg0 at scsi0, channel 0, id =
0,=20
lun 0,  type 5
May 26 16:15:39 [kernel] Real Time Clock Driver v1.12
May 26 16:15:39 [kernel] ACPI: PCI interrupt 0000:00:0b.0[A] -> GSI 19 (lev=
el,=20
low) -> IRQ 19
May 26 16:15:39 [kernel] ACPI: PCI interrupt 0000:01:00.0[A] -> GSI 16 (lev=
el,=20
low) -> IRQ 16
May 26 16:15:39 [kernel] rivafb: nVidia device/chipset 10DE0171
May 26 16:15:39 [kernel] rivafb: nVidia Corporation NV17 [GeForce4 MX 440]
May 26 16:15:39 [kernel] rivafb: Detected CRTC controller 0 being used
May 26 16:15:39 [kernel] rivafb: RIVA MTRR set to ON
May 26 16:15:39 [kernel] rivafb: could not retrieve EDID from DDC/I2C
May 26 16:15:39 [kernel] rivafb: setting virtual Y resolution to 104857
May 26 16:15:39 [kernel] rivafb: PCI nVidia NV17 framebuffer ver 0.9.5b (64=
MB=20
@ 0xD0000000)
May 26 16:15:39 [kernel] via-rhine.c:v1.10-LK1.2.0-2.6 June-10-2004 Written=
 by=20
Donald Becker
May 26 16:15:39 [kernel] ACPI: PCI interrupt 0000:00:12.0[A] -> GSI 23 (lev=
el,=20
low) -> IRQ 23
May 26 16:15:39 [kernel] eth0: VIA Rhine II at 0xbc00, 00:0b:6a:84:bc:c7, I=
RQ=20
23.
May 26 16:15:39 [kernel] eth0: MII PHY found at address 1, status 0x7849=20
advertising 05e1 Link 0000.
May 26 16:15:39 [kernel] VP_IDE: IDE controller at PCI slot 0000:00:0f.1
May 26 16:15:39 [kernel] ACPI: PCI interrupt 0000:00:0f.1[A] -> GSI 20 (lev=
el,=20
low) -> IRQ 20
May 26 16:15:39 [kernel] VP_IDE: chipset revision 6
May 26 16:15:39 [kernel] VP_IDE: not 100% native mode: will probe irqs later
May 26 16:15:39 [kernel] VP_IDE: User given PCI clock speed impossible=20
(66000), using 33 MHz instead.
May 26 16:15:39 [kernel] VP_IDE: Use ide0=3Data66 if you want to assume 80-=
wire=20
cable.
May 26 16:15:39 [kernel] VP_IDE: VIA vt8237 (rev 00) IDE UDMA133 controller=
 on=20
pci0000:00:0f.1
May 26 16:15:39 [kernel] VP_IDE: port 0x01f0 already claimed by ide0
May 26 16:15:39 [kernel] VP_IDE: neither IDE port enabled (BIOS)
May 26 16:15:39 [kernel] ACPI: PCI interrupt 0000:00:0f.0[B] -> GSI 20 (lev=
el,=20
low) -> IRQ 20
May 26 16:15:39 [kernel] sata_via(0000:00:0f.0): routed to hard irq line 10
May 26 16:15:39 [kernel] ata1: SATA max UDMA/133 cmd 0xE800 ctl 0xE402 bmdm=
a=20
0xD800 irq 20
May 26 16:15:39 [kernel] ata2: SATA max UDMA/133 cmd 0xE000 ctl 0xDC02 bmdm=
a=20
0xD808 irq 20
May 26 16:15:39 [kernel] ata1: dev 0 ATA, max UDMA/133, 160086528 sectors:
May 26 16:15:39 [kernel] ata1: dev 0 configured for UDMA/133
May 26 16:15:39 [kernel] scsi1 : sata_via
May 26 16:15:39 [kernel] ata2: dev 0 ATA, max UDMA/133, 160084415 sectors:
May 26 16:15:39 [kernel] ata2: dev 0 configured for UDMA/133
May 26 16:15:39 [kernel] scsi2 : sata_via
May 26 16:15:39 [kernel]   Vendor: ATA       Model: Maxtor 6Y080M0    Rev:=
=20
YAR5
May 26 16:15:39 [kernel]   Type:   Direct-Access                      ANSI=
=20
SCSI revision: 05
May 26 16:15:39 [kernel] SCSI device sda: 160086528 512-byte hdwr sectors=20
(81964 MB)
May 26 16:15:39 [kernel] SCSI device sda: drive cache: write back
May 26 16:15:39 [kernel] SCSI device sda: 160086528 512-byte hdwr sectors=20
(81964 MB)
May 26 16:15:39 [kernel] SCSI device sda: drive cache: write back
May 26 16:15:39 [kernel]  /dev/scsi/host1/bus0/target0/lun0: p1 p2 p3
May 26 16:15:39 [kernel] Attached scsi disk sda at scsi1, channel 0, id 0, =
lun=20
0
May 26 16:15:39 [kernel] Attached scsi generic sg1 at scsi1, channel 0, id =
0,=20
lun 0,  type 0
May 26 16:15:39 [kernel]   Vendor: ATA       Model: Maxtor 6Y080M0    Rev:=
=20
YAR5
May 26 16:15:39 [kernel]   Type:   Direct-Access                      ANSI=
=20
SCSI revision: 05
May 26 16:15:39 [kernel] SCSI device sdb: 160084415 512-byte hdwr sectors=20
(81963 MB)
May 26 16:15:39 [kernel] SCSI device sdb: drive cache: write back
May 26 16:15:39 [kernel] SCSI device sdb: 160084415 512-byte hdwr sectors=20
(81963 MB)
May 26 16:15:39 [kernel] SCSI device sdb: drive cache: write back
May 26 16:15:39 [kernel]  /dev/scsi/host2/bus0/target0/lun0: p1 p2 p3
May 26 16:15:39 [kernel] Attached scsi disk sdb at scsi2, channel 0, id 0, =
lun=20
0
May 26 16:15:39 [kernel] Attached scsi generic sg2 at scsi2, channel 0, id =
0,=20
lun 0,  type 0
May 26 16:15:39 [kernel] agpgart: Detected VIA KT400/KT400A/KT600 chipset
May 26 16:15:39 [kernel] agpgart: Maximum main memory to use for agp memory=
:=20
941M
May 26 16:15:39 [kernel] agpgart: AGP aperture is 128M @ 0xe0000000
May 26 16:15:39 [cron] (CRON) STARTUP (fork ok)=20
May 26 16:15:39 [cron] (root~) ORPHAN (no passwd entry)=20
May 26 16:15:43 [xfs] CONFIG: unknown parameter "cache-hi-mark"=20
May 26 16:15:43 [xfs] CONFIG: unknown parameter "cache-low-mark"=20
May 26 16:15:43 [xfs] CONFIG: unknown parameter "cache-balance"=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/Speedo=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/CID=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/util=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/local=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/Speedo=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/truetype=
=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/freefont=
=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/sharefont=
=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path=20
element /usr/share/fonts/default/Type1 (unreadable)=20
May 26 16:15:44 [xfs] ignoring font path=20
element /usr/share/fonts/ttf/decoratives (unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/ttf/weste=
rn=20
(unreadable)=20
May 26 16:15:44 [init] Activating demand-procedures for 'A'
May 26 16:15:58 [kdm_greet] Can't open default user face
May 26 16:16:03 [kde(pam_unix)] session opened for user root by (uid=3D0)
May 26 16:16:03 [kdm] :0[9992]: PAM pam_putenv: delete non-existent entry;=
=20
REMOTEHOST
May 26 16:16:03 [PAM-env] Unknown PAM_ITEM: <DISPLAY>
May 26 16:16:03 [] PAM pam_putenv: delete non-existent entry; DISPLAY
May 26 16:16:03 [PAM-env] Unknown PAM_ITEM: <XAUTHORITY>
May 26 16:16:03 [] PAM pam_putenv: delete non-existent entry; XAUTHORITY
May 26 16:16:42 [gconfd (root-10101)] d=E9marrage (version 2.8.1), pid 1010=
1=20
utilisateur =AB=A0root=A0=BB
May 26 16:16:42 [gconfd (root-10101)] Adresse=20
=AB=A0xml:readonly:/etc/gconf/gconf.xml.mandatory=A0=BB r=E9solue vers une =
source de=20
configuration en lecture seule =E0 la position 0
May 26 16:16:42 [gconfd (root-10101)] Adresse =AB=A0xml:readwrite:/root/.gc=
onf=A0=BB=20
r=E9solue vers une source de configuration accessible en =E9criture =E0 la =
position=20
1
May 26 16:16:42 [gconfd (root-10101)] Adresse=20
=AB=A0xml:readonly:/etc/gconf/gconf.xml.defaults=A0=BB r=E9solue vers une s=
ource de=20
configuration en lecture seule =E0 la position 2
May 26 16:16:45 [kernel] cdrom: This disc doesn't have any tracks I recogni=
ze!
May 26 16:16:49 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:50 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:51 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:53 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:54 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:55 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:57 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:58 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:59 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:01 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:02 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:03 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:05 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:06 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:07 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:09 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:10 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:11 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:13 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:14 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:15 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:17 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:18 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:19 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:21 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:22 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:24 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:25 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:26 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:28 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:29 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:30 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:32 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:33 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:33 [init] Switching to runlevel: 6
May 26 16:17:34 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:36 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:37 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:38 [sshd] Received signal 15; terminating.
May 26 16:17:38 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:38 [kernel] ata1: error=3D0x40 { UncorrectableError }
May 26 16:17:38 [kernel] SCSI error : <1 0 0 0> return code =3D 0x8000002
May 26 16:17:38 [kernel] Current sda: sense =3D 70  3
May 26 16:17:38 [kernel] ASC=3D11 ASCQ=3D 4
May 26 16:17:38 [kernel] Raw sense data:0x70 0x00 0x03 0x00 0x00 0x00 0x00=
=20
0x0a 0x00 0x00 0x00 0x00 0x11 0x04 0x00 0x00 0x00 0x00=20
May 26 16:17:38 [kernel] end_request: I/O error, dev sda, sector 4104368
May 26 16:17:38 [kernel] Buffer I/O error on device sda3, logical block 7793
May 26 16:17:39 [xfs] terminating=20
May 26 16:15:39 [kernel] ibm_acpi: ec object not found
May 26 16:15:39 [kernel] serio: i8042 AUX port at 0x60,0x64 irq 12
May 26 16:15:39 [kernel] USB Mass Storage support registered.
May 26 16:15:39 [kernel] usbcore: registered new driver hiddev
May 26 16:15:39 [kernel] usbcore: registered new driver usbhid
May 26 16:15:39 [kernel] drivers/usb/input/hid-core.c: v2.0:USB HID core=20
driver
May 26 16:15:39 [kernel] NET: Registered protocol family 2
May 26 16:15:39 [kernel] IP: routing cache hash table of 8192 buckets,=20
64Kbytes
May 26 16:15:39 [kernel] TCP: Hash tables configured (established 262144 bi=
nd=20
65536)
May 26 16:15:39 [kernel] ip_conntrack version 2.1 (8191 buckets, 65528 max)=
 -=20
300 bytes per conntrack
May 26 16:15:39 [kernel] ip_tables: (C) 2000-2002 Netfilter core team
May 26 16:15:39 [kernel] ipt_recent v0.3.1: Stephen Frost=20
<sfrost@snowman.net>.  http://snowman.net/projects/ipt_recent/
May 26 16:15:39 [kernel] arp_tables: (C) 2002 David S. Miller
May 26 16:15:39 [kernel] NET: Registered protocol family 1
May 26 16:15:39 [kernel] NET: Registered protocol family 17
May 26 16:15:39 [kernel] ACPI wakeup devices:=20
May 26 16:15:39 [kernel] PCI0 UAR1 USB1 USB2 USB3 USB4 EHCI USBD PS2M PS2K =
=20
AC9  MC9 ILAN SLPB=20
May 26 16:15:39 [kernel] ACPI: (supports S0 S1 S3 S4 S5)
May 26 16:15:39 [kernel] ReiserFS: hda3: found reiserfs format "3.6" with=20
standard journal
May 26 16:15:39 [kernel] ReiserFS: hda3: using ordered data mode
May 26 16:15:39 [kernel] ReiserFS: hda3: journal params: device hda3, size=
=20
8192, journal first block 18, max trans len 1024, max batch 900, max commit=
=20
age 30, max trans age 30
May 26 16:15:39 [kernel] ReiserFS: hda3: checking transaction log (hda3)
May 26 16:15:39 [kernel] ReiserFS: hda3: Using r5 hash to sort names
May 26 16:15:39 [kernel] VFS: Mounted root (reiserfs filesystem) readonly.
May 26 16:15:39 [kernel] Mounted devfs on /dev
May 26 16:15:39 [kernel] Freeing unused kernel memory: 176k freed
May 26 16:15:39 [kernel] Adding 2048276k swap on /dev/hda2.  Priority:-1=20
extents:1
May 26 16:15:39 [kernel] ide-scsi is deprecated for cd burning! Use ide-cd =
and=20
give dev=3D/dev/hdX as device
May 26 16:15:39 [kernel] scsi0 : SCSI host adapter emulation for IDE ATAPI=
=20
devices
May 26 16:15:39 [kernel]   Vendor: HL-DT-ST  Model: DVDRAM GSA-4163B  Rev:=
=20
A100
May 26 16:15:39 [kernel]   Type:   CD-ROM                             ANSI=
=20
SCSI revision: 02
May 26 16:15:39 [kernel] sr0: scsi3-mmc drive: 40x/40x writer dvd-ram cd/rw=
=20
xa/form2 cdda tray
May 26 16:15:39 [kernel] Attached scsi generic sg0 at scsi0, channel 0, id =
0,=20
lun 0,  type 5
May 26 16:15:39 [kernel] Real Time Clock Driver v1.12
May 26 16:15:39 [kernel] ACPI: PCI interrupt 0000:00:0b.0[A] -> GSI 19 (lev=
el,=20
low) -> IRQ 19
May 26 16:15:39 [kernel] ACPI: PCI interrupt 0000:01:00.0[A] -> GSI 16 (lev=
el,=20
low) -> IRQ 16
May 26 16:15:39 [kernel] rivafb: nVidia device/chipset 10DE0171
May 26 16:15:39 [kernel] rivafb: nVidia Corporation NV17 [GeForce4 MX 440]
May 26 16:15:39 [kernel] rivafb: Detected CRTC controller 0 being used
May 26 16:15:39 [kernel] rivafb: RIVA MTRR set to ON
May 26 16:15:39 [kernel] rivafb: could not retrieve EDID from DDC/I2C
May 26 16:15:39 [kernel] rivafb: setting virtual Y resolution to 104857
May 26 16:15:39 [kernel] rivafb: PCI nVidia NV17 framebuffer ver 0.9.5b (64=
MB=20
@ 0xD0000000)
May 26 16:15:39 [kernel] via-rhine.c:v1.10-LK1.2.0-2.6 June-10-2004 Written=
 by=20
Donald Becker
May 26 16:15:39 [kernel] ACPI: PCI interrupt 0000:00:12.0[A] -> GSI 23 (lev=
el,=20
low) -> IRQ 23
May 26 16:15:39 [kernel] eth0: VIA Rhine II at 0xbc00, 00:0b:6a:84:bc:c7, I=
RQ=20
23.
May 26 16:15:39 [kernel] eth0: MII PHY found at address 1, status 0x7849=20
advertising 05e1 Link 0000.
May 26 16:15:39 [kernel] VP_IDE: IDE controller at PCI slot 0000:00:0f.1
May 26 16:15:39 [kernel] ACPI: PCI interrupt 0000:00:0f.1[A] -> GSI 20 (lev=
el,=20
low) -> IRQ 20
May 26 16:15:39 [kernel] VP_IDE: chipset revision 6
May 26 16:15:39 [kernel] VP_IDE: not 100% native mode: will probe irqs later
May 26 16:15:39 [kernel] VP_IDE: User given PCI clock speed impossible=20
(66000), using 33 MHz instead.
May 26 16:15:39 [kernel] VP_IDE: Use ide0=3Data66 if you want to assume 80-=
wire=20
cable.
May 26 16:15:39 [kernel] VP_IDE: VIA vt8237 (rev 00) IDE UDMA133 controller=
 on=20
pci0000:00:0f.1
May 26 16:15:39 [kernel] VP_IDE: port 0x01f0 already claimed by ide0
May 26 16:15:39 [kernel] VP_IDE: neither IDE port enabled (BIOS)
May 26 16:15:39 [kernel] ACPI: PCI interrupt 0000:00:0f.0[B] -> GSI 20 (lev=
el,=20
low) -> IRQ 20
May 26 16:15:39 [kernel] sata_via(0000:00:0f.0): routed to hard irq line 10
May 26 16:15:39 [kernel] ata1: SATA max UDMA/133 cmd 0xE800 ctl 0xE402 bmdm=
a=20
0xD800 irq 20
May 26 16:15:39 [kernel] ata2: SATA max UDMA/133 cmd 0xE000 ctl 0xDC02 bmdm=
a=20
0xD808 irq 20
May 26 16:15:39 [kernel] ata1: dev 0 ATA, max UDMA/133, 160086528 sectors:
May 26 16:15:39 [kernel] ata1: dev 0 configured for UDMA/133
May 26 16:15:39 [kernel] scsi1 : sata_via
May 26 16:15:39 [kernel] ata2: dev 0 ATA, max UDMA/133, 160084415 sectors:
May 26 16:15:39 [kernel] ata2: dev 0 configured for UDMA/133
May 26 16:15:39 [kernel] scsi2 : sata_via
May 26 16:15:39 [kernel]   Vendor: ATA       Model: Maxtor 6Y080M0    Rev:=
=20
YAR5
May 26 16:15:39 [kernel]   Type:   Direct-Access                      ANSI=
=20
SCSI revision: 05
May 26 16:15:39 [kernel] SCSI device sda: 160086528 512-byte hdwr sectors=20
(81964 MB)
May 26 16:15:39 [kernel] SCSI device sda: drive cache: write back
May 26 16:15:39 [kernel] SCSI device sda: 160086528 512-byte hdwr sectors=20
(81964 MB)
May 26 16:15:39 [kernel] SCSI device sda: drive cache: write back
May 26 16:15:39 [kernel]  /dev/scsi/host1/bus0/target0/lun0: p1 p2 p3
May 26 16:15:39 [kernel] Attached scsi disk sda at scsi1, channel 0, id 0, =
lun=20
0
May 26 16:15:39 [kernel] Attached scsi generic sg1 at scsi1, channel 0, id =
0,=20
lun 0,  type 0
May 26 16:15:39 [kernel]   Vendor: ATA       Model: Maxtor 6Y080M0    Rev:=
=20
YAR5
May 26 16:15:39 [kernel]   Type:   Direct-Access                      ANSI=
=20
SCSI revision: 05
May 26 16:15:39 [kernel] SCSI device sdb: 160084415 512-byte hdwr sectors=20
(81963 MB)
May 26 16:15:39 [kernel] SCSI device sdb: drive cache: write back
May 26 16:15:39 [kernel] SCSI device sdb: 160084415 512-byte hdwr sectors=20
(81963 MB)
May 26 16:15:39 [kernel] SCSI device sdb: drive cache: write back
May 26 16:15:39 [kernel]  /dev/scsi/host2/bus0/target0/lun0: p1 p2 p3
May 26 16:15:39 [kernel] Attached scsi disk sdb at scsi2, channel 0, id 0, =
lun=20
0
May 26 16:15:39 [kernel] Attached scsi generic sg2 at scsi2, channel 0, id =
0,=20
lun 0,  type 0
May 26 16:15:39 [kernel] agpgart: Detected VIA KT400/KT400A/KT600 chipset
May 26 16:15:39 [kernel] agpgart: Maximum main memory to use for agp memory=
:=20
941M
May 26 16:15:39 [kernel] agpgart: AGP aperture is 128M @ 0xe0000000
May 26 16:15:39 [cron] (CRON) STARTUP (fork ok)=20
May 26 16:15:39 [cron] (root~) ORPHAN (no passwd entry)=20
May 26 16:15:43 [xfs] CONFIG: unknown parameter "cache-hi-mark"=20
May 26 16:15:43 [xfs] CONFIG: unknown parameter "cache-low-mark"=20
May 26 16:15:43 [xfs] CONFIG: unknown parameter "cache-balance"=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/Speedo=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/CID=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/util=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/local=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/Speedo=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/truetype=
=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/freefont=
=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/sharefont=
=20
(unreadable)=20
May 26 16:15:44 [xfs] ignoring font path=20
element /usr/share/fonts/default/Type1 (unreadable)=20
May 26 16:15:44 [xfs] ignoring font path=20
element /usr/share/fonts/ttf/decoratives (unreadable)=20
May 26 16:15:44 [xfs] ignoring font path element /usr/share/fonts/ttf/weste=
rn=20
(unreadable)=20
May 26 16:15:44 [init] Activating demand-procedures for 'A'
May 26 16:15:58 [kdm_greet] Can't open default user face
May 26 16:16:03 [kde(pam_unix)] session opened for user root by (uid=3D0)
May 26 16:16:03 [kdm] :0[9992]: PAM pam_putenv: delete non-existent entry;=
=20
REMOTEHOST
May 26 16:16:03 [PAM-env] Unknown PAM_ITEM: <DISPLAY>
May 26 16:16:03 [] PAM pam_putenv: delete non-existent entry; DISPLAY
May 26 16:16:03 [PAM-env] Unknown PAM_ITEM: <XAUTHORITY>
May 26 16:16:03 [] PAM pam_putenv: delete non-existent entry; XAUTHORITY
May 26 16:16:42 [gconfd (root-10101)] d=E9marrage (version 2.8.1), pid 1010=
1=20
utilisateur =AB=A0root=A0=BB
May 26 16:16:42 [gconfd (root-10101)] Adresse=20
=AB=A0xml:readonly:/etc/gconf/gconf.xml.mandatory=A0=BB r=E9solue vers une =
source de=20
configuration en lecture seule =E0 la position 0
May 26 16:16:42 [gconfd (root-10101)] Adresse =AB=A0xml:readwrite:/root/.gc=
onf=A0=BB=20
r=E9solue vers une source de configuration accessible en =E9criture =E0 la =
position=20
1
May 26 16:16:42 [gconfd (root-10101)] Adresse=20
=AB=A0xml:readonly:/etc/gconf/gconf.xml.defaults=A0=BB r=E9solue vers une s=
ource de=20
configuration en lecture seule =E0 la position 2
May 26 16:16:45 [kernel] cdrom: This disc doesn't have any tracks I recogni=
ze!
May 26 16:16:49 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:50 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:51 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:53 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:54 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:55 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:57 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:58 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:16:59 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:01 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:02 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:03 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:05 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:06 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:07 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:09 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:10 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:11 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:13 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:14 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:15 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:17 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:18 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:19 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:21 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:22 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:24 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:25 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:26 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:28 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:29 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:30 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:32 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:33 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:33 [init] Switching to runlevel: 6
May 26 16:17:34 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:36 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:37 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:38 [sshd] Received signal 15; terminating.
May 26 16:17:38 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Erro=
r }
May 26 16:17:38 [kernel] ata1: error=3D0x40 { UncorrectableError }
May 26 16:17:38 [kernel] SCSI error : <1 0 0 0> return code =3D 0x8000002
May 26 16:17:38 [kernel] Current sda: sense =3D 70  3
May 26 16:17:38 [kernel] ASC=3D11 ASCQ=3D 4
May 26 16:17:38 [kernel] Raw sense data:0x70 0x00 0x03 0x00 0x00 0x00 0x00=
=20
0x0a 0x00 0x00 0x00 0x00 0x11 0x04 0x00 0x00 0x00 0x00=20
May 26 16:17:38 [kernel] end_request: I/O error, dev sda, sector 4104368
May 26 16:17:38 [kernel] Buffer I/O error on device sda3, logical block 7793
May 26 16:17:39 [xfs] terminating=20






=2D-=20
L=E9o Daniel
=46onbine
34260 Av=E8ne
06 73 06 20 08
04 67 95 68 63
