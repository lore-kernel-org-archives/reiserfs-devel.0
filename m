From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: please help me get my work back
Date: Fri, 27 May 2005 12:43:35 +0400
Message-ID: <1117183414.7083.165.camel@tribesman.namesys.com>
References: <1117119135.4295e29f845be@imp2-q.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24171-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1117119135.4295e29f845be@imp2-q.free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: daniel.leo@free.fr
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2005-05-26 at 18:52, daniel.leo@free.fr wrote:
> human aspect : lots of work on a hardrive that I can't access
>=20
> thanks for your help
> L=E9o
>=20
> technicaly :
>=20
> The problem :
>=20
> reiserfsck 3.6.17 (2003 www.namesys.com)
> returns
please get reiserfsck 3.6.19
(ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.19.tar.gz)

get reliable harddrive and copy /dev/sda3 to it with
dd_rescue

reiserfsck /dev/copy
reiserfsck --rebuild-tree /dev/copy (if necessary)



>=20
> create_badblock_bitmap: block number (960) belongs to system reiserfs are=
a. It
> cannot be relocated.
>=20
> motherboard is a asrock with sata
> harddrive is maxtor sata 80Gb
> all this is detailed is the syslog output below
> this is my dmesg :
>=20
>        Linux version 2.6.10-gentoo-r6 (root@samael) (version gcc 3.3.5
>       (Gentoo Linux 3.3.5-r1, ssp-3.3.2-3, pie-8.7.7.1)) #2 Fri Apr 15
>   22:13:46 CEST 2005 BIOS-provided physical RAM map: BIOS-e820:
>         0000000000000000 - 000000000009fc00 (usable) BIOS-e820:
>       000000000009fc00 - 00000000000a0000 (reserved) BIOS-e820:
>       00000000000d6000 - 00000000000de000 (reserved) BIOS-e820:
>       00000000000f0000 - 0000000000100000 (reserved) BIOS-e820:
>         0000000000100000 - 000000003fff0000 (usable) BIOS-e820:
>      000000003fff0000 - 000000003fff8000 (ACPI data) BIOS-e820:
>       000000003fff8000 - 0000000040000000 (ACPI NVS) BIOS-e820:
>       00000000fec00000 - 00000000fec01000 (reserved) BIOS-e820:
>       00000000fee00000 - 00000000fee01000 (reserved) BIOS-e820:
>    00000000fff80000 - 0000000100000000 (reserved) 127MB HIGHMEM
>  available.  896MB LOWMEM available.  On node 0 totalpages: 262128 DMA
>  zone: 4096 pages, LIFO batch:1 Normal zone: 225280 pages, LIFO
>      batch:16 HighMem zone: 32752 pages, LIFO batch:7 DMI 2.3 present.
>  ACPI: RSDP (v000 AMI                                   ) @ 0x000fa8c0
>  ACPI: RSDT (v001 AMIINT VIA_K7   0x00000010 MSFT 0x00000097) @
>     0x3fff0000 ACPI: FADT (v001 AMIINT VIA_K7   0x00000011 MSFT
>   0x00000097) @ 0x3fff0030 ACPI: MADT (v001 AMIINT VIA_K7   0x00000009
>  MSFT 0x00000097) @ 0x3fff00c0 ACPI: DSDT (v001    VIA    K7VT4
> 0x00001000 MSFT 0x0100000d) @ 0x00000000 ACPI: PM-Timer IO Port: 0x808
>  ACPI: Local APIC address 0xfee00000 ACPI: LAPIC (acpi_id[0x01]
>  lapic_id[0x00] enabled) Processor #0 6:8 APIC version 16 ACPI: IOAPIC
>       (id[0x02] address[0xfec00000] gsi_base[0]) IOAPIC[0]: apic_id 2,
>       version 3, address 0xfec00000, GSI 0-23 ACPI: INT_SRC_OVR (bus 0
>     bus_irq 0 global_irq 2 dfl dfl) ACPI: INT_SRC_OVR (bus 0 bus_irq 9
>  global_irq 9 low level) ACPI: IRQ0 used by override.  ACPI: IRQ2 used
> by override.  ACPI: IRQ9 used by override.  Enabling APIC mode:  Flat.
>  Using 1 I/O APICs Using ACPI (MADT) for SMP configuration information
>        Built 1 zonelists Kernel command line: root=3D/dev/hda3 idebus=3D66
>  hdd=3Dide-scsi ide_setup: idebus=3D66 ide_setup: hdd=3Dide-scsi mapped A=
PIC
>     to ffffd000 (fee00000) mapped IOAPIC to ffffc000 (fec00000)
>      Initializing CPU#0 PID hash table entries: 4096 (order: 12, 65536
>      bytes) Detected 1998.746 MHz processor.  Using pmtmr for high-res
> timesource Console: colour VGA+ 80x25 Dentry cache hash table entries:
>  131072 (order: 7, 524288 bytes) Inode-cache hash table entries: 65536
>    (order: 6, 262144 bytes) Memory: 1034948k/1048512k available (2482k
>  kernel code, 12976k reserved, 1016k data, 176k init, 131008k highmem)
>       Checking if this processor honours the WP bit even in supervisor
>  mode... Ok.  Calibrating delay loop... 3948.54 BogoMIPS (lpj=3D1974272)
>  Mount-cache hash table entries: 512 (order: 0, 4096 bytes) CPU: After
> generic identify, caps: 0383fbff c1c3fbff 00000000 00000000 CPU: After
>  vendor identify, caps:  0383fbff c1c3fbff 00000000 00000000 CPU: L1 I
> Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line) CPU: L2 Cache:
>       256K (64 bytes/line) CPU: After all inits, caps:        0383fbff
> c1c3fbff 00000000 00000020 Intel machine check architecture supported.
>   Intel machine check reporting enabled on CPU#0.  CPU: AMD Athlon(tm)
>       XP 2400+ stepping 01 Enabling fast FPU save and restore... done.
>  Enabling unmasked SIMD FPU exception support... done.  Checking 'hlt'
>  instruction... OK.  ENABLING IO-APIC IRQs ..TIMER: vector=3D0x31 pin1=3D2
> pin2=3D-1 NET: Registered protocol family 16 PCI: PCI BIOS revision 2.10
>     entry at 0xfda71, last bus=3D1 PCI: Using configuration type 1 mtrr:
>    v2.0 (20020519) ACPI: Subsystem revision 20041105 ACPI: Interpreter
> enabled ACPI: Using IOAPIC for interrupt routing ACPI: PCI Root Bridge
>  [PCI0] (00:00) PCI: Probing PCI hardware (bus 00) ACPI: PCI Interrupt
>      Routing Table [\_SB_.PCI0._PRT] ACPI: Power Resource [URP1] (off)
>    ACPI: Power Resource [URP2] (off) ACPI: Power Resource [FDDP] (off)
>      ACPI: Power Resource [LPTP] (off) ACPI: PCI Interrupt Link [LNKA]
> (IRQs 3 4 5 7 10 *11 12 14 15) ACPI: PCI Interrupt Link [LNKB] (IRQs 3
>   4 5 7 *10 11 12 14 15) ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 7
> * 10 11 12 14 15) ACPI: PCI Interrupt Link [LNKD] (IRQs *3 4 5 7 10 11
>    12 14 15) ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 7 10 11 12 14
> 15) *0, disabled.  ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 7 10 11
> 12 14 15) *0, disabled.  ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 7
> 10 11 12 14 15) *0, disabled.  ACPI: PCI Interrupt Link [LNKH] (IRQs 3
> 4 5 7 10 11 12 14 15) *0, disabled.  Linux Plug and Play Support v0.97
> (c) Adam Belay pnp: PnP ACPI init pnp: PnP ACPI: found 11 devices SCSI
>    subsystem initialized usbcore: registered new driver usbfs usbcore:
>       registered new driver hub PCI: Using ACPI for IRQ routing ** PCI
>    interrupts are no longer routed automatically.  If this ** causes a
> device to stop working, it is probably because the ** driver failed to
>    call pci_enable_device().  As a temporary ** workaround, the
>  "pci=3Drouteirq" argument restores the old ** behavior.  If this
>    argument makes the device work again, ** please email the output of
>  "lspci" to bjorn.helgaas@hp.com ** so I can fix the driver.  pnp: the
>      driver 'system' has been registered pnp: match found with the PnP
> device '00:04' and the driver 'system' Machine check exception polling
>   timer started.  audit: initializing netlink socket (disabled)
>      audit(1117124350.355:0): initialized highmem bounce pool size: 64
>      pages Total HugeTLB memory allocated, 0 devfs: 2004-01-31 Richard
>     Gooch (rgooch@atnf.csiro.au) devfs: devfs_debug: 0x0 devfs:
>        boot_options: 0x1 Initializing Cryptographic API inotify device
>     minor=3D63 Linux agpgart interface v0.100 (c) Dave Jones ACPI: Power
>  Button (FF) [PWRF] ACPI: Sleep Button (CM) [SLPB] ibm_acpi: ec object
>   not found serio: i8042 AUX port at 0x60,0x64 irq 12 serio: i8042 KBD
>  port at 0x60,0x64 irq 1 Serial: 8250/16550 driver $Revision: 1.90 $ 8
>   ports, IRQ sharing disabled ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
> pnp: the driver 'serial' has been registered pnp: match found with the
>   PnP device '00:01' and the driver 'serial' ttyS0 at I/O 0x3f8 (irq =3D
> 4)   is a 16550A mice: PS/2 mouse device common for all mice input: AT
>     Translated Set 2 keyboard on isa0060/serio0 input: ImPS/2 Logitech
>   Wheel Mouse on isa0060/serio1 io scheduler noop registered io
>  scheduler anticipatory registered io scheduler deadline registered io
>    scheduler cfq registered elevator: using anticipatory as default io
>     scheduler Floppy drive(s): fd0 is 1.44M FDC 0 is a post-1991 82077
> Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2 ide: Assuming
>     66MHz system bus speed for PIO modes Probing IDE interface ide0...
>     hda: SAMSUNG SP0802N, ATA DISK drive Probing IDE interface ide1...
>       hdc: LITEON DVD-ROM LTD163, ATAPI CD/DVD-ROM drive hdd: HL-DT-ST
> DVDRAM GSA-4163B, ATAPI CD/DVD-ROM drive Probing IDE interface ide2...
>      ide2: Wait for ready failed before probe !  Probing IDE interface
>       ide3...  ide3: Wait for ready failed before probe !  Probing IDE
> interface ide4...  ide4: Wait for ready failed before probe !  Probing
>      IDE interface ide5...  ide5: Wait for ready failed before probe !
>   ide0 at 0x1f0-0x1f7,0x3f6 on irq 14 ide1 at 0x170-0x177,0x376 on irq
>    15 hda: max request size: 1024KiB hda: 156368016 sectors (80060 MB)
>  w/2048KiB Cache, CHS=3D16383/255/63 hda: cache flushes supported
>      /dev/ide/host0/bus0/target0/lun0: p1 p2 p3 hdc: ATAPI 48X DVD-ROM
>      drive, 512kB Cache Uniform CD-ROM driver Revision: 3.20 ACPI: PCI
>    interrupt 0000:00:10.4[C] -> GSI 21 (level, low) -> IRQ 21 ehci_hcd
>    0000:00:10.4: VIA Technologies, Inc. USB 2.0 ehci_hcd 0000:00:10.4:
>   irq 21, pci mem 0xdfffbe00 ehci_hcd 0000:00:10.4: new USB bus
>       registered, assigned bus number 1 ehci_hcd 0000:00:10.4: USB 2.0
>  initialized, EHCI 1.00, driver 26 Oct 2004 hub 1-0:1.0: USB hub found
>  hub 1-0:1.0: 8 ports detected USB Universal Host Controller Interface
> driver v2.2 ACPI: PCI interrupt 0000:00:10.0[A] -> GSI 21 (level, low)
> ->   IRQ 21 PCI: Via IRQ fixup for 0000:00:10.0, from 11 to 5 uhci_hcd
> 0000:00:10.0: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller
>   uhci_hcd 0000:00:10.0: irq 21, io base 0xc000 uhci_hcd 0000:00:10.0:
>     new USB bus registered, assigned bus number 2 hub 2-0:1.0: USB hub
>         found hub 2-0:1.0: 2 ports detected ACPI: PCI interrupt
>    0000:00:10.1[A] -> GSI 21 (level, low) -> IRQ 21 PCI: Via IRQ fixup
>       for 0000:00:10.1, from 11 to 5 uhci_hcd 0000:00:10.1: VIA
>      Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller(#2) uhci_hcd
>    0000:00:10.1: irq 21, io base 0xc400 uhci_hcd 0000:00:10.1: new USB
>   bus registered, assigned bus number 3 hub 3-0:1.0: USB hub found hub
>   3-0:1.0: 2 ports detected ACPI: PCI interrupt 0000:00:10.2[B] -> GSI
> 21 (level, low) -> IRQ 21 PCI: Via IRQ fixup for 0000:00:10.2, from 10
>  to 5 uhci_hcd 0000:00:10.2: VIA Technologies, Inc. VT82xxxxx UHCI USB
> 1. 1 Controller(#3) uhci_hcd 0000:00:10.2: irq 21, io base 0xc800
>   uhci_hcd 0000:00:10.2: new USB bus registered, assigned bus number 4
>     hub 4-0:1.0: USB hub found hub 4-0:1.0: 2 ports detected ACPI: PCI
>    interrupt 0000:00:10.3[B] -> GSI 21 (level, low) -> IRQ 21 PCI: Via
>    IRQ fixup for 0000:00:10.3, from 10 to 5 uhci_hcd 0000:00:10.3: VIA
>      Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller(#4) uhci_hcd
>    0000:00:10.3: irq 21, io base 0xcc00 uhci_hcd 0000:00:10.3: new USB
>   bus registered, assigned bus number 5 hub 5-0:1.0: USB hub found hub
>  5-0:1.0: 2 ports detected usbcore: registered new driver usblp
>      drivers/usb/class/usblp.c: v0.13: USB Printer Device Class driver
>   Initializing USB Mass Storage driver...  usb 3-1: new full speed USB
> device using uhci_hcd and address 2 drivers/usb/class/usblp.c: usblp0:
>      USB Bidirectional printer dev 2 if 0 alt 0 proto 2 vid 0x03F0 pid
>     0x7304 usbcore: registered new driver usb-storage USB Mass Storage
>    support registered.  usbcore: registered new driver hiddev usbcore:
>    registered new driver usbhid drivers/usb/input/hid-core.c: v2.0:USB
>    HID core driver NET: Registered protocol family 2 IP: routing cache
>       hash table of 8192 buckets, 64Kbytes TCP: Hash tables configured
>  (established 262144 bind 65536) ip_conntrack version 2.1 (8191
> buckets, 65528 max) - 300 bytes per conntrack ip_tables: (C) 2000-2002
>     Netfilter core team ipt_recent v0.3.1: Stephen Frost
>  <sfrost@snowman.net>.  http://snowman.net/projects/ipt_recent/
> arp_tables: (C) 2002 David S. Miller NET: Registered protocol family 1
> NET: Registered protocol family 17 ACPI wakeup devices: PCI0 UAR1 USB1
> USB2 USB3 USB4 EHCI USBD PS2M PS2K  AC9  MC9 ILAN SLPB ACPI: (supports
>       S0 S1 S3 S4 S5) ReiserFS: hda3: found reiserfs format "3.6" with
>     standard journal ReiserFS: hda3: using ordered data mode ReiserFS:
>      hda3: journal params: device hda3, size 8192, journal first block
> 18,max trans len 1024, max batch 900, max commit age 30, max trans age
>     30 ReiserFS: hda3: checking transaction log (hda3) ReiserFS: hda3:
>     journal-1153: found in header: first_unflushed_offset 1241,
>    last_flushed_trans_id 347521 ReiserFS: hda3: journal-1206: Starting
>        replay from offset 1492595624641753, trans_id 0 ReiserFS: hda3:
>  journal-1299: Setting newest_mount_id to 443 ReiserFS: hda3: Using r5
>   hash to sort names VFS: Mounted root (reiserfs filesystem) readonly.
>  Mounted devfs on /dev Freeing unused kernel memory: 176k freed Adding
>  2048276k swap on /dev/hda2.  Priority:-1 extents:1 ide-scsi is
>  deprecated for cd burning! Use ide-cd and give dev=3D/dev/hdX as device
>      scsi0 : SCSI host adapter emulation for IDE ATAPI devices Vendor:
>     HL-DT-ST  Model: DVDRAM GSA-4163B  Rev: A100 Type:   CD-ROM
>    ANSI SCSI revision: 02 sr0: scsi3-mmc drive: 40x/40x writer dvd-ram
> cd/rw xa/form2 cdda tray Attached scsi CD-ROM sr0 at scsi0, channel 0,
>   id 0, lun 0 Attached scsi generic sg0 at scsi0, channel 0, id 0, lun
>     0,  type 5 Real Time Clock Driver v1.12 ACPI: PCI interrupt
>   0000:00:0b.0[A] -> GSI 19 (level, low) -> IRQ 19 ACPI: PCI interrupt
>        0000:01:00.0[A] -> GSI 16 (level, low) -> IRQ 16 rivafb: nVidia
>   device/chipset 10DE0171 rivafb: nVidia Corporation NV17 [GeForce4 MX
>   440] rivafb: Detected CRTC controller 0 being used rivafb: RIVA MTRR
> set to ON rivafb: could not retrieve EDID from DDC/I2C rivafb: setting
> virtual Y resolution to 104857 rivafb: PCI nVidia NV17 framebuffer ver
> 0.9. 5b (64MB @ 0xD0000000) via-rhine.c:v1.10-LK1.2.0-2.6 June-10-2004
> Written by Donald Becker ACPI: PCI interrupt 0000:00:12.0[A] -> GSI 23
>     (level, low) -> IRQ 23 eth0: VIA Rhine II at 0xbc00,
>   00:0b:6a:84:bc:c7, IRQ 23.  eth0: MII PHY found at address 1, status
> 0x7849 advertising 05e1 Link 0000.  VP_IDE: IDE controller at PCI slot
>     0000:00:0f.1 ACPI: PCI interrupt 0000:00:0f.1[A] -> GSI 20 (level,
>      low) -> IRQ 20 VP_IDE: chipset revision 6 VP_IDE: not 100% native
>  mode: will probe irqs later VP_IDE: User given PCI clock speed
>   impossible (66000), using 33 MHz instead.  VP_IDE: Use ide0=3Data66 if
>     you want to assume 80-wire cable.  VP_IDE: VIA vt8237 (rev 00) IDE
>      UDMA133 controller on pci0000:00:0f.1 VP_IDE: port 0x01f0 already
>    claimed by ide0 VP_IDE: port 0x0170 already claimed by ide1 VP_IDE:
>  neither IDE port enabled (BIOS) libata version 1.10 loaded.  sata_via
> version 1.1 ACPI: PCI interrupt 0000:00:0f.0[B] -> GSI 20 (level, low)
> ->     IRQ 20 sata_via(0000:00:0f.0): routed to hard irq line 10 ata1:
> SATA max UDMA/133 cmd 0xE800 ctl 0xE402 bmdma 0xD800 irq 20 ata2: SATA
> max UDMA/133 cmd 0xE000 ctl 0xDC02 bmdma 0xD808 irq 20 ata1: dev 0 cfg
>  49:2f00 82:7c6b 83:7b09 84:4003 85:7c68 86:3a01 87:4003 88:407f ata1:
> dev 0 ATA, max UDMA/133, 160086528 sectors: ata1: dev 0 configured for
>      UDMA/133 scsi1 : sata_via ata2: dev 0 cfg 49:2f00 82:7c6b 83:7b09
> 84:4003 85:7c68 86:3a01 87:4003 88:407f ata2: dev 0 ATA, max UDMA/133,
>  160084415 sectors: ata2: dev 0 configured for UDMA/133 scsi2 :
>    sata_via Vendor: ATA       Model: Maxtor 6Y080M0    Rev: YAR5 Type:
>  Direct-Access                      ANSI SCSI revision: 05 SCSI device
> sda: 160086528 512-byte hdwr sectors (81964 MB) SCSI device sda: drive
>     cache: write back SCSI device sda: 160086528 512-byte hdwr sectors
>      (81964 MB) SCSI device sda: drive cache: write back
>  /dev/scsi/host1/bus0/target0/lun0: p1 p2 p3 Attached scsi disk sda at
>      scsi1, channel 0, id 0, lun 0 Attached scsi generic sg1 at scsi1,
>        channel 0, id 0, lun 0,  type 0 Vendor: ATA       Model: Maxtor
>   6Y080M0    Rev: YAR5 Type:   Direct-Access                      ANSI
>     SCSI revision: 05 SCSI device sdb: 160084415 512-byte hdwr sectors
>   (81963 MB) SCSI device sdb: drive cache: write back SCSI device sdb:
>      160084415 512-byte hdwr sectors (81963 MB) SCSI device sdb: drive
> cache: write back /dev/scsi/host2/bus0/target0/lun0: p1 p2 p3 Attached
>   scsi disk sdb at scsi2, channel 0, id 0, lun 0 Attached scsi generic
>    sg2 at scsi2, channel 0, id 0, lun 0,  type 0 agpgart: Detected VIA
> KT400/KT400A/KT600 chipset agpgart: Maximum main memory to use for agp
> memory: 941M agpgart: AGP aperture is 128M @ 0xe0000000 ohci_hcd: 2004
>  Nov 08 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI) cdrom: This
>         disc doesn't have any tracks I recognize
>=20
>=20
>=20
>=20
>=20
>=20
> Kernel version :
>     linux-2.6.10-gentoo-r6
>=20
>=20
>=20
>=20
>=20
>=20
> bash-2.05b# debugreiserfs /dev/sda3
>=20
>      debugreiserfs 3.6.17 (2003 www.namesys.com)
>=20
>=20
> Filesystem state: consistency is not checked after last mounting
>=20
> Reiserfs super block in block 16 on 0x803 of format 3.6 with standard jou=
rnal
> Count of blocks on the device: 19496880
> Number of bitmaps: 595
> Blocksize: 4096
> Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
> blocks):1149561
> Root block: 8257647
> Filesystem marked as NOT cleanly umounted
> Tree height: 5
> Hash function used to sort names: "r5"
> Objectid map size 2, max 972
> Journal parameters:
>         Device [0x0]
>         Magic [0x6e60712c]
>         Size 8193 blocks (including 1 for journal header) (first block 18)
>         Max transaction length 1024 blocks
>         Max batch size 900 blocks
>         Max commit age 30
> Blocks reserved by journal: 0
> Fs state field: 0x0:
> sb_version: 2
> inode generation number: 356334
> UUID: cb64e26e-7557-401d-afea-faf8f4f794f8
> LABEL:
> Set flags in SB:
>         ATTRIBUTES CLEAN
>=20
>=20
> Syslog output :
>=20
> May 26 11:59:14 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:16 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:18 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:20 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:21 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:24 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:25 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:26 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:28 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:30 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:31 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:33 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:34 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:36 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:38 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:39 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:41 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:43 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:44 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:47 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:48 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:49 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:51 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:52 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:54 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:55 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:57 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 11:59:58 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:00 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:00 [CRON] (root) CMD (rm -f /var/spool/cron/lastrun/cron.hou=
rly)
> May 26 12:00:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons
> && /usr/sbin/run-crons )
> May 26 12:00:01 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:03 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:04 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:05 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:07 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:09 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:10 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:12 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:14 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:15 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:17 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:18 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:20 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:22 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:23 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:25 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:27 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:28 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:32 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:33 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:34 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:38 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:40 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:42 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:43 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:45 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:46 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:48 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:49 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:50 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:53 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:54 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:56 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:57 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:00:58 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:00 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:01 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:03 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:04 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:05 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:07 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:08 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:10 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:11 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:12 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:14 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:15 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:16 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:18 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:19 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:21 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:22 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:23 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:26 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:27 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:28 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:30 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:31 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:33 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:34 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:35 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:37 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:38 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:39 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:41 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:42 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:43 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:45 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:46 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:48 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:49 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:50 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:52 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:53 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:54 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:01:58 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:02:00 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:02:02 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:02:03 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:02:05 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:02:05 [kernel] ata1: error=3D0x40 { UncorrectableError }
> May 26 12:02:06 [kernel] ata1: status=3D0x51 { DriveReady SeekComplete Er=
ror }
> May 26 12:02:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:03:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:03:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:04:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:04:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:05:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:05:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:06:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:06:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:07:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:07:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:08:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:08:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:09:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:09:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:10:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:10:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:11:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:11:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:12:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:12:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:13:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:13:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:14:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:14:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:15:00 [CRON] (root) CMD (test -x /usr/sbin/run-crons
> && /usr/sbin/run-crons )
> May 26 12:15:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:15:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:16:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:16:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:17:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:17:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:18:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:18:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:19:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:19:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:20:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:20:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:21:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:21:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:22:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:22:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:23:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:23:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:24:06 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:24:36 [kernel] ata1: command 0xc8 timeout, stat 0x59 host_stat =
0x1
> May 26 12:25:06 [kernel] ata1:
>=20

