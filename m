From: Jan Fengler <janfengler@web.de>
Subject: fsck.reiser4
Date: Sun, 21 Dec 2003 22:03:52 +0100
Sender: janfengler@web.de
Message-ID: <200312212203.52775.janfengler@web.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_4qg5/AE2uw+ih9v"
Return-path: <reiserfs-list-return-16364-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_4qg5/AE2uw+ih9v
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,

I have some trouble checking my reiser4 partition. I use fsck.reiser4 versi=
on=20
0.4.19 and libaal version 0.4.14 on linux-2.6.0-test11. I've attached the=20
logfile and the output from dmesg.
I dont know if it is a bug in fsck.reiser4, but if there is really an error=
 on=20
my partition (everything works well 'til now), i think it should be possibl=
e=20
to correct it via fsck.
I've already tried to use the newest bitkeeper-sources of=20
libaal/reiserfs4progs, but the reiserfs4progs won't compile.

Thanks in advance for your attention!
=A0=A0=A0=A0=A0=A0=A0=A0Jan Fengler

--Boundary-00=_4qg5/AE2uw+ih9v
Content-Type: text/plain;
  charset="us-ascii";
  name="dmesg.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="dmesg.txt"

.  psargs-0352: *** Error: Looking up [Z00Q] in namespace, AE_NOT_FOUND
search_node dff2d0e8 start_node dff2d0e8 return_node 00000000
 psparse-1120: *** Error: Method execution failed [\_SB_.PCI0.ISA_.SIO_.COM2._STA] (Node dff2d0e8), AE_NOT_FOUND
.  psargs-0352: *** Error: Looking up [Z00Q] in namespace, AE_NOT_FOUND
search_node dff2c368 start_node dff2c368 return_node 00000000
 psparse-1120: *** Error: Method execution failed [\_SB_.PCI0.ISA_.SIO_.LPT_._STA] (Node dff2c368), AE_NOT_FOUND
...
27 Devices found containing: 27 _STA, 0 _INI methods
ACPI: Interpreter enabled
ACPI: Using PIC for interrupt routing
ACPI: PCI Root Bridge [PCI0] (00:00)
PCI: Probing PCI hardware (bus 00)
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.AGP_._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs 3 *5 10 11)
ACPI: PCI Interrupt Link [LNKB] (IRQs 3 5 10 11)
ACPI: PCI Interrupt Link [LNKC] (IRQs 3 5 *10 11)
ACPI: PCI Interrupt Link [LNKD] (IRQs 3 5 10 *11)
  psargs-0352: *** Error: Looking up [Z00Q] in namespace, AE_NOT_FOUND
search_node dff2d9e8 start_node dff2d9e8 return_node 00000000
 psparse-1120: *** Error: Method execution failed [\_SB_.PCI0.ISA_.SIO_.COM1._STA] (Node dff2d9e8), AE_NOT_FOUND
  psargs-0352: *** Error: Looking up [Z00Q] in namespace, AE_NOT_FOUND
search_node dff2d0e8 start_node dff2d0e8 return_node 00000000
 psparse-1120: *** Error: Method execution failed [\_SB_.PCI0.ISA_.SIO_.COM2._STA] (Node dff2d0e8), AE_NOT_FOUND
  psargs-0352: *** Error: Looking up [Z00Q] in namespace, AE_NOT_FOUND
search_node dff2c368 start_node dff2c368 return_node 00000000
 psparse-1120: *** Error: Method execution failed [\_SB_.PCI0.ISA_.SIO_.LPT_._STA] (Node dff2c368), AE_NOT_FOUND
Linux Plug and Play Support v0.97 (c) Adam Belay
pnp: the driver 'system' has been registered
PnPBIOS: Scanning system for PnP BIOS support...
PnPBIOS: Found PnP BIOS installation structure at 0xc00f74d0
PnPBIOS: PnP BIOS version 1.0, entry 0xf0000:0x9ec0, dseg 0x400
pnp: match found with the PnP device '00:00' and the driver 'system'
pnp: match found with the PnP device '00:09' and the driver 'system'
pnp: 00:09: ioport range 0x4d0-0x4d1 has been reserved
pnp: match found with the PnP device '00:0a' and the driver 'system'
pnp: match found with the PnP device '00:0b' and the driver 'system'
pnp: match found with the PnP device '00:0d' and the driver 'system'
spurious 8259A interrupt: IRQ7.
PnPBIOS: 18 nodes reported by PnP BIOS; 18 recorded by driver
SCSI subsystem initialized
drivers/usb/core/usb.c: registered new driver usbfs
drivers/usb/core/usb.c: registered new driver hub
ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 11
ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 9
ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 10
ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 5
PCI: Using ACPI for IRQ routing
PCI: if you experience problems, try using option 'pci=noacpi' or even 'acpi=off'
vesafb: framebuffer at 0xe0000000, mapped to 0xe0808000, size 16384k
vesafb: mode is 1024x768x16, linelength=2048, pages=84
vesafb: protected mode interface info at c000:5570
vesafb: scrolling: redraw
vesafb: directcolor: size=0:5:6:5, shift=0:11:5:0
fb0: VESA VGA frame buffer device
Machine check exception polling timer started.
IA-32 Microcode Update Driver: v1.13 <tigran@veritas.com>
Starting balanced_irq
ikconfig 0.7 with /proc/config*
devfs: v1.22 (20021013) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Loading Reiser4. See www.namesys.com for a description of Reiser4.
udf: registering filesystem
SGI XFS for Linux with ACLs, no debug enabled
SGI XFS Quota Management subsystem
Initializing Cryptographic API
BIOS failed to enable PCI standards compliance, fixing this error.
I/O APIC: AMD Errata #22 may be present. In the event of instability try
        : booting with the "noapic" option.
ACPI: Power Button (FF) [PWRF]
ACPI: Sleep Button (FF) [SLPF]
ACPI: Processor [CPU0] (supports C1)
ACPI: Processor [CPU1] (supports C1)
isapnp: Scanning for PnP cards...
isapnp: No Plug & Play device found
Console: switching to colour frame buffer device 128x48
pty: 256 Unix98 ptys configured
request_module: failed /sbin/modprobe -- parport_lowlevel. error = -16
lp: driver loaded but no devices found
Real Time Clock Driver v1.12
ipmi: message handler initialized
ipmi: device interface at char major 254
ipmi_kcs: No KCS @ port 0x0ca2
ipmi_kcs: Unable to find any KCS interfaces
IPMI watchdog by Corey Minyard (minyard@mvista.com)
Hangcheck: starting hangcheck timer 0.5.0 (tick is 180 seconds, margin is 60 seconds).
Serial: 8250/16550 driver $Revision: 1.90 $ 8 ports, IRQ sharing disabled
ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
pnp: the driver 'serial' has been registered
pnp: match found with the PnP device '00:10' and the driver 'serial'
pnp: match found with the PnP device '00:11' and the driver 'serial'
pnp: the driver 'parport_pc' has been registered
pnp: match found with the PnP device '00:0e' and the driver 'parport_pc'
parport0: PC-style at 0x378 (0x778) [PCSPP,TRISTATE,EPP]
parport0: irq 7 detected
parport0: cpp_mux: aa55f00f52ad51(8f)
parport0: cpp_daisy: aa5500ff(08)
parport0: assign_addrs: aa5500ff(08)
parport0: cpp_daisy: aa5500ff(08)
parport0: assign_addrs: aa5500ff(08)
lp0: using parport0 (polling).
Using anticipatory io scheduler
Floppy drive(s): fd0 is 1.44M
FDC 0 is a post-1991 82077
RAMDISK driver initialized: 16 RAM disks of 64000K size 1024 blocksize
8139too Fast Ethernet driver 0.9.26
eth0: RealTek RTL8139 at 0xe1867000, 00:e0:7d:c8:97:cd, IRQ 10
eth0:  Identified 8139 chip type 'RTL-8139C'
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
AMD7411: IDE controller at PCI slot 0000:00:07.1
AMD7411: chipset revision 1
AMD7411: not 100% native mode: will probe irqs later
AMD7411: 0000:00:07.1 (rev 01) UDMA100 controller
    ide0: BM-DMA at 0xf000-0xf007, BIOS settings: hda:DMA, hdb:pio
    ide1: BM-DMA at 0xf008-0xf00f, BIOS settings: hdc:pio, hdd:pio
hda: LITEON DVD-ROM LTD163D, ATAPI CD/DVD-ROM drive
hdb: Hewlett-Packard CD-Writer Plus 7500, ATAPI CD/DVD-ROM drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
hdc: CD-ROM 56X/AKH, ATAPI CD/DVD-ROM drive
ide1 at 0x170-0x177,0x376 on irq 15
PDC20271: IDE controller at PCI slot 0000:00:09.0
PDC20271: chipset revision 2
PDC20271: 100% native mode on irq 9
    ide2: BM-DMA at 0x1830-0x1837, BIOS settings: hde:pio, hdf:pio
    ide3: BM-DMA at 0x1838-0x183f, BIOS settings: hdg:pio, hdh:pio
hde: IC35L040AVVA07-0, ATA DISK drive
ide2 at 0x1858-0x185f,0x1852 on irq 9
hdg: IC35L040AVVA07-0, ATA DISK drive
ide3 at 0x1848-0x184f,0x1846 on irq 9
hde: max request size: 128KiB
hde: 80418240 sectors (41174 MB) w/1863KiB Cache, CHS=65535/16/63, UDMA(100)
 /dev/ide/host2/bus0/target0/lun0: p1 p2 p3 p4
hdg: max request size: 128KiB
hdg: 80418240 sectors (41174 MB) w/1863KiB Cache, CHS=65535/16/63, UDMA(100)
 /dev/ide/host2/bus1/target0/lun0: p1 p2 p3
ide-scsi is deprecated for cd burning! Use ide-cd and give dev=/dev/hdX as device
scsi0 : SCSI host adapter emulation for IDE ATAPI devices
  Vendor: LITEON    Model: DVD-ROM LTD163D   Rev: GHR3
  Type:   CD-ROM                             ANSI SCSI revision: 02
scsi1 : SCSI host adapter emulation for IDE ATAPI devices
  Vendor: HP        Model: CD-Writer+ 7500   Rev: 1.0a
  Type:   CD-ROM                             ANSI SCSI revision: 02
scsi2 : SCSI host adapter emulation for IDE ATAPI devices
  Vendor: E-IDE     Model: CD-ROM 56X/AKH    Rev: A8E 
  Type:   CD-ROM                             ANSI SCSI revision: 02
sr0: scsi3-mmc drive: 0x/48x cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.12
Attached scsi CD-ROM sr0 at scsi0, channel 0, id 0, lun 0
sr1: scsi3-mmc drive: 24x/24x writer cd/rw xa/form2 cdda tray
Attached scsi CD-ROM sr1 at scsi1, channel 0, id 0, lun 0
sr2: scsi3-mmc drive: 0x/52x cd/rw xa/form2 cdda tray
Attached scsi CD-ROM sr2 at scsi2, channel 0, id 0, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 0, lun 0,  type 5
Attached scsi generic sg1 at scsi1, channel 0, id 0, lun 0,  type 5
Attached scsi generic sg2 at scsi2, channel 0, id 0, lun 0,  type 5
Console: switching to colour frame buffer device 128x48
ehci_hcd: block sizes: qh 128 qtd 96 itd 128 sitd 64
ohci_hcd: 2003 Oct 13 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
ohci_hcd: block sizes: ed 64 td 64
ohci_hcd 0000:00:07.4: OHCI Host Controller
ohci_hcd 0000:00:07.4: USB HC TakeOver from BIOS/SMM
ohci_hcd 0000:00:07.4: reset, control = 0x683
ohci_hcd 0000:00:07.4: irq 11, pci mem c00dc000
ohci_hcd 0000:00:07.4: new USB bus registered, assigned bus number 1
ohci_hcd 0000:00:07.4: root hub device address 1
usb usb1: new device strings: Mfr=3, Product=2, SerialNumber=1
drivers/usb/core/message.c: USB device number 1 default language ID 0x409
usb usb1: Product: OHCI Host Controller
usb usb1: Manufacturer: Linux 2.6.0-test11 ohci_hcd
usb usb1: SerialNumber: 0000:00:07.4
drivers/usb/core/usb.c: usb_hotplug
usb usb1: registering 1-0:1.0 (config #1, interface 0)
drivers/usb/core/usb.c: usb_hotplug
hub 1-0:1.0: usb_probe_interface
hub 1-0:1.0: usb_probe_interface - got id
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 4 ports detected
hub 1-0:1.0: standalone hub
hub 1-0:1.0: ganged power switching
hub 1-0:1.0: global over-current protection
hub 1-0:1.0: Port indicators are not supported
hub 1-0:1.0: power on to power good time: 2ms
hub 1-0:1.0: hub controller current requirement: 0mA
hub 1-0:1.0: local power source is good
hub 1-0:1.0: no over-current condition exists
hub 1-0:1.0: enabling power on all ports
ohci_hcd 0000:00:07.4: created debug files
ohci_hcd 0000:00:07.4: OHCI controller state
ohci_hcd 0000:00:07.4: OHCI 1.0, with legacy support registers
ohci_hcd 0000:00:07.4: control 0x68f RWE RWC HCFS=operational IE PLE CBSR=3
ohci_hcd 0000:00:07.4: cmdstatus 0x00000 SOC=0
ohci_hcd 0000:00:07.4: intrstatus 0x00000004 SF
ohci_hcd 0000:00:07.4: intrenable 0x80000002 MIE WDH
ohci_hcd 0000:00:07.4: hcca frame #0020
ohci_hcd 0000:00:07.4: roothub.a 01000204 POTPGT=1 NPS NDP=4
ohci_hcd 0000:00:07.4: roothub.b 00000000 PPCM=0000 DR=0000
ohci_hcd 0000:00:07.4: roothub.status 00000000
ohci_hcd 0000:00:07.4: roothub.portstatus [0] 0x00000100 PPS
ohci_hcd 0000:00:07.4: roothub.portstatus [1] 0x00000100 PPS
ohci_hcd 0000:00:07.4: roothub.portstatus [2] 0x00000100 PPS
ohci_hcd 0000:00:07.4: roothub.portstatus [3] 0x00000100 PPS
Initializing USB Mass Storage driver...
drivers/usb/core/usb.c: registered new driver usb-storage
USB Mass Storage support registered.
drivers/usb/core/usb.c: registered new driver hiddev
drivers/usb/core/usb.c: registered new driver hid
drivers/usb/input/hid-core.c: v2.0:USB HID core driver
mice: PS/2 mouse device common for all mice
gameport: pci0000:00:0c.1 speed 1217 kHz
input: PS2++ Logitech Wheel Mouse on isa0060/serio1
serio: i8042 AUX port at 0x60,0x64 irq 12
input: AT Translated Set 2 keyboard on isa0060/serio0
serio: i8042 KBD port at 0x60,0x64 irq 1
I2O Core - (C) Copyright 1999 Red Hat Software
I2O: Event thread created as pid 30
i2o: Checking for PCI I2O controllers...
I2O configuration manager v 0.04.
  (C) Copyright 1999 Red Hat Software
I2O Block Storage OSM v0.9
   (c) Copyright 1999-2001 Red Hat Software.
i2o_block: Checking for Boot device...
i2o_block: Checking for I2O Block devices...
i2o_scsi.c: Version 0.1.2
  chain_pool: 0 bytes @ dfc13d20
  (512 byte buffers X 4 can_queue X 0 i2o controllers)
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :  2232.000 MB/sec
   8regs_prefetch:  2292.000 MB/sec
   32regs    :  1772.000 MB/sec
   32regs_prefetch:  1600.000 MB/sec
   pIII_sse  :  4436.000 MB/sec
   pII_mmx   :  4440.000 MB/sec
   p5_mmx    :  5940.000 MB/sec
raid5: using function: pIII_sse (4436.000 MB/sec)
md: multipath personality registered as nr 7
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
device-mapper: 1.0.6-ioctl (2002-10-15) initialised: dm@uk.sistina.com
Advanced Linux Sound Architecture Driver Version 0.9.7 (Thu Sep 25 19:16:36 2003 UTC).
request_module: failed /sbin/modprobe -- snd-card-0. error = -16
ALSA device list:
  #0: Sound Blaster Live! (rev.7) at 0x1800, irq 5
NET: Registered protocol family 2
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 32768 bind 32768)
NET: Registered protocol family 1
NET: Registered protocol family 17
ACPI: (supports S0 S1 S4 S5)
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
sh-2021: reiserfs_fill_super: can not find reiserfs on hdg2
loading reiser4 bitmap......done (1448 jiffies)
VFS: Mounted root (reiser4 filesystem) readonly.
Mounted devfs on /dev
Freeing unused kernel memory: 224k freed
Adding 987988k swap on /dev/hde2.  Priority:-1 extents:1
Adding 977216k swap on /dev/hdg1.  Priority:-2 extents:1
sym0: <810a> rev 0x12 at pci 0000:00:0b.0 irq 11
sym0: No NVRAM, ID 7, Fast-10, SE, parity checking
sym0: SCSI BUS has been reset.
scsi3 : sym-2.1.18b
Linux video capture interface: v1.00
bttv: driver version 0.9.12 loaded
bttv: using 8 buffers with 2080k (520 pages) each for capture
bttv: Bt8xx card found (0).
bttv0: Bt878 (rev 17) at 0000:00:0d.0, irq: 9, latency: 132, mmio: 0xd0401000
bttv0: detected: Hauppauge WinTV [card=10], PCI subsystem ID is 0070:13eb
bttv0: using: Hauppauge (bt878) [card=10,autodetected]
bttv0: Hauppauge/Voodoo msp34xx: reset line init [5]
bttv0: Hauppauge eeprom: model=44004, tuner=Temic 4006FH5 (14), radio=no
bttv0: using tuner=14
bttv0: i2c: checking for MSP34xx @ 0x80... not found
bttv0: i2c: checking for TDA9875 @ 0xb0... not found
bttv0: i2c: checking for TDA7432 @ 0x8a... not found
tvaudio: TV audio decoder + audio/video mux driver
tvaudio: known chips: tda9840,tda9873h,tda9874h/a,tda9850,tda9855,tea6300,tea6420,tda8425,pic16c54 (PV951),ta8874z
tuner: chip found @ 0xc2
tuner: type set to 14 (Temic PAL_BG (4006FH5))
registering 0-0061
bttv0: registered device video0
bttv0: registered device vbi0
bttv0: PLL: 28636363 => 35468950 .. ok
input: Gravis Blackhawk Digital on pci0000:00:0c.1/gameport0
Linux agpgart interface v0.100 (c) Dave Jones
agpgart: Detected AMD 760MP chipset
agpgart: Maximum main memory to use for agp memory: 439M
agpgart: AGP aperture is 64M @ 0xd4000000
[drm] Initialized radeon 1.9.0 20020828 on minor 0
registering 1-002c
registering 1-0049
registering 1-0048
registering 1-002d
w83781d 1-002d: Subclient 0 registration at address 0x49 failed.
tuner: type already set (14)
registering 0-0050
registering 1-0050
registering 1-0054
XFS mounting filesystem hde3
Starting XFS recovery on filesystem: hde3 (dev: hde3)
Ending XFS recovery on filesystem: hde3 (dev: hde3)
eth0: link up, 100Mbps, full-duplex, lpa 0x45E1
mtrr: 0xe0000000,0x4000000 overlaps existing 0xe0000000,0x1000000
mtrr: 0xe0000000,0x4000000 overlaps existing 0xe0000000,0x1000000
bttv0: skipped frame. no signal? high irq latency?
reiser4[rm(7384)]: delete_inode_common (fs/reiser4/plugin/object.c:1008)[vs-1434]:
WARNING: nrpages 1

mtrr: 0xe0000000,0x4000000 overlaps existing 0xe0000000,0x1000000
spurious 8259A interrupt: IRQ15.
mtrr: 0xe0000000,0x4000000 overlaps existing 0xe0000000,0x1000000

--Boundary-00=_4qg5/AE2uw+ih9v
Content-Type: text/plain;
  charset="us-ascii";
  name="fsck.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="fsck.txt"

Error: Directory [10f72:526f6c6c656e73:11017], plugin [dir40], node [498172], item [0], unit [8]: entry has wrong offset 
[11017:0(NAME):14c6562656e736c:61756620766f6e20:bbdfc5d78a9263d9]. Should be []. Removed. 
Error: Node (498172), item (8): item registering failed--it belongs to another object already. Plugin (dir40). 

--Boundary-00=_4qg5/AE2uw+ih9v--

