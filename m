From: Francesco Biscani <frbiscani@jumpy.it>
Subject: [reiser4] Bug-report
Date: Tue, 6 Jul 2004 16:52:48 +0200
Message-ID: <200407061652.49126.frbiscani@jumpy.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19529-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'm testing reiser4 on my / partition. So far I haven't had a single problem. 
However today I installed the vsftpd ftp server and I had a system freeze. A 
friend of mine was d/l-ing some files from my PC.

The first thing that alarmed me was that I saw on KDE's system monitor that my 
CPU utilization rate, at a certain point, suddenly began to hit 100% 
constantly. "top" revealed that the ftp server was eating all my cpu cycles. 
This lasted for about a minute or slightly less. I don't think this is 
normal, I've never seen this happening with proftpd. I was inclined to 
consider this as a bug of vsftpd's. 

But after about half an hour my X session began to be very sluggish. I could 
not fire up a terminal to see what was going on, but KDE's system monitor 
showed that all CPU power was being eaten by the "system" (I mean that this 
time the CPU was hogged by some kernel activity, not user-space). I had no 
choice but to reset.

Fortunately I found no errors on the fs after the "cold" reboot.

But the system log had not been written during the freeze, so there are not 
many clues on what has happened :-(

I hope this will be useful.. Some of my specs, follow. Let me know if you need 
more.

"Standard" (i.e. default) reiser4 options in kernel .config. No 4k-stacks, 
reiser4 auto-snapshot of 2th July.

#uname -a
Linux kurtz 2.6.7-mm4 #1 Mon Jul 5 10:53:10 CEST 2004 i686 Mobile Intel(R) 
Pentium(R) 4     CPU 2.40GHz GenuineIntel GNU/Linux

#dmesg
Linux version 2.6.7-mm4 (root@kurtz) (gcc version 3.4.0 20040601 (Gentoo Linux 
3.4.0-r6, ssp-3.4-2, pie-8.7.6.3)) #1 Mon Jul 5 10:53:10 CEST 2004
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009f800 (usable)
 BIOS-e820: 000000000009f800 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000d8000 - 00000000000e0000 (reserved)
 BIOS-e820: 00000000000e4000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000001bf70000 (usable)
 BIOS-e820: 000000001bf70000 - 000000001bf7f000 (ACPI data)
 BIOS-e820: 000000001bf7f000 - 000000001bf80000 (ACPI NVS)
 BIOS-e820: 000000001bf80000 - 000000001c000000 (reserved)
 BIOS-e820: 000000002bf80000 - 000000002c000000 (reserved)
 BIOS-e820: 00000000fff80000 - 0000000100000000 (reserved)
447MB LOWMEM available.
On node 0 totalpages: 114544
  DMA zone: 4096 pages, LIFO batch:1
  Normal zone: 110448 pages, LIFO batch:16
  HighMem zone: 0 pages, LIFO batch:1
DMI 2.3 present.
ACPI: RSDP (v000 PTLTD                                     ) @ 0x000f6ab0
ACPI: RSDT (v001 PTLTD    RSDT   0x06040000  LTP 0x00000000) @ 0x1bf7829b
ACPI: FADT (v001 ATI    Salmon   0x06040000 ATI  0x000f4240) @ 0x1bf7ef64
ACPI: BOOT (v001 PTLTD  $SBFTBL$ 0x06040000  LTP 0x00000001) @ 0x1bf7efd8
ACPI: DSDT (v001    ATI MS2_1535 0x06040000 MSFT 0x0100000e) @ 0x00000000
Built 1 zonelists
Initializing CPU#0
Kernel command line: BOOT_IMAGE=2.6.7-mm4 ro root=303
PID hash table entries: 2048 (order 11: 16384 bytes)
Detected 2391.845 MHz processor.
Using tsc for high-res timesource
Console: colour dummy device 80x25
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Memory: 450192k/458176k available (2034k kernel code, 7216k reserved, 814k 
data, 128k init, 0k highmem)
Checking if this processor honours the WP bit even in supervisor mode... Ok.
Calibrating delay loop... 4685.82 BogoMIPS
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU: After generic identify, caps: bfebf9ff 00000000 00000000 00000000
CPU: After vendor identify, caps:  bfebf9ff 00000000 00000000 00000000
CPU: Trace cache: 12K uops, L1 D cache: 8K
CPU: L2 cache: 512K
CPU: After all inits, caps:        bfebf9ff 00000000 00000000 00000080
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
CPU0: Intel P4/Xeon Extended MCE MSRs (12) available
CPU: Intel Mobile Intel(R) Pentium(R) 4     CPU 2.40GHz stepping 09
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Checking 'hlt' instruction... OK.
NET: Registered protocol family 16
PCI: PCI BIOS revision 2.10 entry at 0xfd89b, last bus=2
PCI: Using configuration type 1
mtrr: v2.0 (20020519)
ACPI: Subsystem revision 20040326
ACPI: IRQ9 SCI: Edge set to Level Trigger.
ACPI: Interpreter enabled
ACPI: Using PIC for interrupt routing
ACPI: PCI Root Bridge [PCI0] (00:00)
PCI: Probing PCI hardware (bus 00)
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.AGPB._PRT]
ACPI: PCI Interrupt Link [LNK0] (IRQs 7 10) *0, disabled.
ACPI: PCI Interrupt Link [LNK1] (IRQs 7 *10)
ACPI: PCI Interrupt Link [LNK2] (IRQs 7 *10)
ACPI: PCI Interrupt Link [LNK3] (IRQs 7 *10)
ACPI: PCI Interrupt Link [LNK4] (IRQs 7 10) *0, disabled.
ACPI: PCI Interrupt Link [LNK5] (IRQs 7 11) *0, disabled.
ACPI: PCI Interrupt Link [LNK6] (IRQs 7 10) *0, disabled.
ACPI: PCI Interrupt Link [LNK7] (IRQs *5)
ACPI: PCI Interrupt Link [LNK8] (IRQs 7 10) *0, disabled.
ACPI: Embedded Controller [EC0] (gpe 24)
Linux Plug and Play Support v0.97 (c) Adam Belay
PCI: Using ACPI for IRQ routing
ACPI: PCI Interrupt Link [LNK7] enabled at IRQ 5
ACPI: PCI interrupt 0000:00:06.0[A] -> GSI 5 (level, low) -> IRQ 5
ACPI: PCI Interrupt Link [LNK6] enabled at IRQ 10
ACPI: PCI interrupt 0000:00:08.0[A] -> GSI 10 (level, low) -> IRQ 10
ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 11
ACPI: PCI interrupt 0000:00:0a.0[A] -> GSI 11 (level, low) -> IRQ 11
ACPI: PCI Interrupt Link [LNK2] enabled at IRQ 10
ACPI: PCI interrupt 0000:00:0b.0[A] -> GSI 10 (level, low) -> IRQ 10
ACPI: PCI Interrupt Link [LNK3] enabled at IRQ 10
ACPI: PCI interrupt 0000:00:0b.1[B] -> GSI 10 (level, low) -> IRQ 10
ACPI: PCI interrupt 0000:00:0b.2[C] -> GSI 11 (level, low) -> IRQ 11
ACPI: PCI interrupt 0000:00:0c.0[A] -> GSI 10 (level, low) -> IRQ 10
ACPI: PCI interrupt 0000:00:10.0[A]: no GSI
ACPI: PCI Interrupt Link [LNK1] enabled at IRQ 10
ACPI: PCI interrupt 0000:00:12.0[A] -> GSI 10 (level, low) -> IRQ 10
ACPI: PCI Interrupt Link [LNK0] enabled at IRQ 10
ACPI: PCI interrupt 0000:01:05.0[A] -> GSI 10 (level, low) -> IRQ 10
ACPI: PCI interrupt 0000:01:05.0[A] -> GSI 10 (level, low) -> IRQ 10
radeonfb: Retreived PLL infos from BIOS
radeonfb: Reference=14.32 MHz (RefDiv=31) Memory=183.00 Mhz, System=133.00 MHz
Non-DDC laptop panel detected
radeonfb: Monitor 1 type LCD found
radeonfb: Monitor 2 type no found
radeonfb: panel ID string: LGP
radeonfb: detected LVDS panel size from BIOS: 1024x768
radeondb: BIOS provided dividers will be used
radeonfb: Power Management enabled for Mobility chipsets
radeonfb: ATI Radeon C7  SDR SGRAM 64 MB
Simple Boot Flag at 0x37 set to 0x1
Machine check exception polling timer started.
Initializing Cryptographic API
Activating ISA DMA hang workarounds.
ACPI: AC Adapter [ACAD] (on-line)
ACPI: Battery Slot [BAT1] (battery absent)
ACPI: Power Button (FF) [PWRF]
ACPI: Lid Switch [LID]
ACPI: Processor [CPU0] (supports C1 C2)
ACPI: Thermal Zone [THRM] (51 C)
Console: switching to colour frame buffer device 128x48
Real Time Clock Driver v1.12
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
natsemi dp8381x driver, version 1.07+LK1.0.17, Sep 27, 2002
  originally by Donald Becker <becker@scyld.com>
  http://www.scyld.com/network/natsemi.html
  2.4.x kernel port by Jeff Garzik, Tjeerd Mulder
ACPI: PCI interrupt 0000:00:12.0[A] -> GSI 10 (level, low) -> IRQ 10
natsemi eth0: NatSemi DP8381[56] at 0xdd814000 (0000:00:12.0), 
00:0f:20:22:06:e5, IRQ 10, port TP.
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
ALI15X3: IDE controller at PCI slot 0000:00:10.0
ACPI: PCI interrupt 0000:00:10.0[A]: no GSI
ALI15X3: chipset revision 196
ALI15X3: not 100% native mode: will probe irqs later
    ide0: BM-DMA at 0x2040-0x2047, BIOS settings: hda:DMA, hdb:pio
    ide1: BM-DMA at 0x2048-0x204f, BIOS settings: hdc:pio, hdd:pio
hda: IC25N040ATMR04-0, ATA DISK drive
Using anticipatory io scheduler
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
hdc: HL-DT-STCD-RW/DVD DRIVE GCC-4241N, ATAPI CD/DVD-ROM drive
ide1 at 0x170-0x177,0x376 on irq 15
hda: max request size: 128KiB
hda: 78140160 sectors (40007 MB) w/1740KiB Cache, CHS=16383/255/63, UDMA(100)
hda: cache flushes supported
 hda: hda1 hda2 hda3 hda4
hdc: ATAPI 24X DVD-ROM CD-R/RW drive, 2048kB Cache, DMA
Uniform CD-ROM driver Revision: 3.20
serio: i8042 AUX port at 0x60,0x64 irq 12
serio: i8042 KBD port at 0x60,0x64 irq 1
mice: PS/2 mouse device common for all mice
input: AT Translated Set 2 keyboard on isa0060/serio0
Synaptics Touchpad, model: 1
 Firmware: 5.9
 Sensor: 35
 new absolute packet format
 Touchpad has extended capability bits
 -> multifinger detection
 -> palm detection
input: SynPS/2 Synaptics TouchPad on isa0060/serio1
input: PC Speaker
Advanced Linux Sound Architecture Driver Version 1.0.5 (Sun May 30 10:49:40 
2004 UTC).
PCI: Enabling device 0000:00:06.0 (0005 -> 0007)
ACPI: PCI interrupt 0000:00:06.0[A] -> GSI 5 (level, low) -> IRQ 5
ALSA device list:
  #0: ALI 5451 at 0x1000, irq 5
NET: Registered protocol family 2
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
NET: Registered protocol family 1
NET: Registered protocol family 17
cpufreq: CPU0 - ACPI performance management activated.
cpufreq: *P0: 2394 MHz, 20000 mW, 250 uS
cpufreq:  P1: 1596 MHz, 10000 mW, 250 uS
PM: Reading pmdisk image.
PM: Resume from disk failed.
ACPI: (supports S0 S3 S4 S5)
VFS: Mounted root (reiser4 filesystem) readonly.
Freeing unused kernel memory: 128k freed
Adding 690752k swap on /dev/hda1.  Priority:-1 extents:1
usbcore: registered new driver usbfs
usbcore: registered new driver hub
Linux agpgart interface v0.100 (c) Dave Jones
agpgart: Detected Ati IGP345M chipset
agpgart: Maximum main memory to use for agp memory: 380M
agpgart: AGP aperture is 64M @ 0xd4000000
Linux Kernel Card Services
  options:  [pci] [cardbus] [pm]
PCI: Enabling device 0000:00:0a.0 (0000 -> 0002)
ACPI: PCI interrupt 0000:00:0a.0[A] -> GSI 11 (level, low) -> IRQ 11
Yenta: CardBus bridge found at 0000:00:0a.0 [0000:0000]
Yenta: Using CSCINT to route CSC interrupts to PCI
Yenta: Routing CardBus interrupts to PCI
Yenta TI: socket 0000:00:0a.0, mfunc 0x01111112, devctl 0x64
Yenta: ISA IRQ mask 0x04d8, PCI irq 11
Socket status: 30000006
USB Universal Host Controller Interface driver v2.2
PCI: Enabling device 0000:00:0b.0 (0010 -> 0011)
ACPI: PCI interrupt 0000:00:0b.0[A] -> GSI 10 (level, low) -> IRQ 10
uhci_hcd 0000:00:0b.0: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 
Controller
uhci_hcd 0000:00:0b.0: irq 10, io base 00002000
uhci_hcd 0000:00:0b.0: new USB bus registered, assigned bus number 1
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
PCI: Enabling device 0000:00:0b.1 (0010 -> 0011)
ACPI: PCI interrupt 0000:00:0b.1[B] -> GSI 10 (level, low) -> IRQ 10
uhci_hcd 0000:00:0b.1: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 
Controller (#2)
uhci_hcd 0000:00:0b.1: irq 10, io base 00002020
uhci_hcd 0000:00:0b.1: new USB bus registered, assigned bus number 2
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
eth0: DSPCFG accepted after 0 usec.
eth0: link up.
PCI: Enabling device 0000:00:0b.2 (0010 -> 0012)
ACPI: PCI interrupt 0000:00:0b.2[C] -> GSI 11 (level, low) -> IRQ 11
ehci_hcd 0000:00:0b.2: VIA Technologies, Inc. USB 2.0
ehci_hcd 0000:00:0b.2: irq 11, pci mem dd966000
ehci_hcd 0000:00:0b.2: new USB bus registered, assigned bus number 3
ehci_hcd 0000:00:0b.2: USB 2.0 enabled, EHCI 0.95, driver 2004-May-10
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 4 ports detected
ieee1394: Initialized config rom entry `ip1394'
ohci1394: $Rev: 1223 $ Ben Collins <bcollins@debian.org>
PCI: Enabling device 0000:00:0c.0 (0010 -> 0012)
ACPI: PCI interrupt 0000:00:0c.0[A] -> GSI 10 (level, low) -> IRQ 10
ohci1394: fw-host0: OHCI-1394 1.1 (PCI): IRQ=[10]  MMIO=[d0003800-d0003fff]  
Max Packet=[2048]
usb 1-2: new low speed USB device using address 3
usbcore: registered new driver hiddev
input: USB HID v1.10 Mouse [Logitech Optical USB Mouse] on usb-0000:00:0b.0-2
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.0:USB HID core driver
usbcore: registered new driver usbmouse
drivers/usb/input/usbmouse.c: v1.6:USB HID Boot Protocol mouse driver
ieee1394: Host added: ID:BUS[0-00:1023]  GUID[000f2071a02206b9]
ip1394: $Rev: 1224 $ Ben Collins <bcollins@debian.org>
ip1394: eth1: IEEE-1394 IPv4 over 1394 Ethernet (fw-host0)
ACPI: PCI interrupt 0000:01:05.0[A] -> GSI 10 (level, low) -> IRQ 10
[drm] Initialized radeon 1.11.0 20020828 on minor 0: ATI Technologies Inc 
Radeon IGP 340M
[drm] Used old pci detect: framebuffer loaded
agpgart: Found an AGP 2.0 compliant device at 0000:00:00.0.
agpgart: Putting AGP V2 device at 0000:00:00.0 into 4x mode
agpgart: Putting AGP V2 device at 0000:01:05.0 into 4x mode

