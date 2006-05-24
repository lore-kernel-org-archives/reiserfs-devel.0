From: Iztok Kobal <iztok.kobal@iskrasistemi.si>
Subject: Strange behaviour of SATA-reiserfs-RAID - system stalls
Date: Wed, 24 May 2006 14:08:30 +0200
Message-ID: <44744CBE.8040405@iskrasistemi.si>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090403080704050001080605"
Return-path: <reiserfs-list-return-28671-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------090403080704050001080605
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Dear Sirs !


System:

Machine: Supermicro SC-743 (MB SuperMicro X6DHT-G, Xeon 3.6GHz, 1GB RAM)
SuSE-9.3-x86_64 (kernel 2.6.11.4-20a-smp, SuSE built)
SATA: Marvell AIC 8140 (8 ports SATA controller), driver aar81xx, 
Adaptec built, officially available at Supermicro site
Disks: Seagate ST330083  Model: 1A   Rev: 3.03
Filesystem used: ReiserFS
RAID used: Linux Software RAID, version raidtools-1.00.3, RAID-1
LVM used: lvm2-2.01.07
SAMBA used: samba-3.0.13




Problem description:

Corrupted file or sector caused on of driver/RAID/LVM/ReiserFS to deny 
access to disk pair, CPU consumtion rised to 50% without visible process 
consuming it, unmount or shutdown impossible.

System powerdowned, rebooted, raid sync performed, fsck.reiserfs --check 
shows nothing.

After changing disk (reported as failed 1st) with new one, error 
(obviously mirrored on previously both RAID1 disks) moved to new disk 
and stalled system at read of that certain file again.

After deleting file, everything seems OK.

Primary disk pair used in RAID1 showed no badblock or any other error 
whatsoever when checked with the producer disk tools.


boot.msg, and 2 /var/log/warn files excerpts are attached.


My questions are now: 

Who was responsible for corrupted file/sector ?
What really caused the system crash/stalling ?
Why reiserfs showed nothing ?
How to avoid such situations in future - I really do not like that 
situation where system crashed ?
Who to ask if you - namesys & reiserfs list members - are not the right 
ones ?

Sincerely,

-- 
Iztok Kobal
Iskra SISTEMI, d.d.
Stegne 21
1000 Ljubljana
Tel.: +386 (0)1 5004368
Mobile: +386 (0)51 365443
Fax.: +386 (0)1 5191424
E-mail: iztok.kobal@iskrasistemi.si
WWW: www.iskrasistemi.si


--------------090403080704050001080605
Content-Type: text/plain;
 name="20060518.boot.omsg"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="20060518.boot.omsg"

Inspecting /boot/System.map-2.6.11.4-20a-smp
Loaded 22191 symbols from /boot/System.map-2.6.11.4-20a-smp.
Symbols match kernel version 2.6.11.
No module symbols loaded - kernel modules not enabled.

klogd 1.4.1, log source = ksyslog started.
<4>Bootdata ok (command line is root=/dev/md0 vga=0x31a selinux=0  splash=silent console=tty0 resume=/dev/sda1  showopts)
<4>Linux version 2.6.11.4-20a-smp (geeko@buildhost) (gcc version 3.3.5 20050117 (prerelease) (SUSE Linux)) #1 SMP Wed Mar 23 21:52:37 UTC 2005
<6>BIOS-provided physical RAM map:
<4> BIOS-e820: 0000000000000000 - 0000000000097800 (usable)
<4> BIOS-e820: 0000000000097800 - 00000000000a0000 (reserved)
<4> BIOS-e820: 00000000000ce000 - 00000000000d0000 (reserved)
<4> BIOS-e820: 00000000000e4000 - 0000000000100000 (reserved)
<4> BIOS-e820: 0000000000100000 - 000000003ff70000 (usable)
<4> BIOS-e820: 000000003ff70000 - 000000003ff78000 (ACPI data)
<4> BIOS-e820: 000000003ff78000 - 000000003ff80000 (ACPI NVS)
<4> BIOS-e820: 000000003ff80000 - 0000000040000000 (reserved)
<4> BIOS-e820: 00000000e0000000 - 00000000f0000000 (reserved)
<4> BIOS-e820: 00000000fec00000 - 00000000fec10000 (reserved)
<4> BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
<4> BIOS-e820: 00000000ff800000 - 00000000ffc00000 (reserved)
<4> BIOS-e820: 00000000fffffc00 - 0000000100000000 (reserved)
<7>ACPI: RSDP (v000 PTLTD                                 ) @ 0x00000000000f5d60
<7>ACPI: RSDT (v001 PTLTD    RSDT   0x06040000  LTP 0x00000000) @ 0x000000003ff72fe3
<7>ACPI: FADT (v001 INTEL  LINDHRST 0x06040000 PTL  0x00000003) @ 0x000000003ff77e48
<7>ACPI: MADT (v001 PTLTD  	 APIC   0x06040000  LTP 0x00000000) @ 0x000000003ff77ebc
<7>ACPI: BOOT (v001 PTLTD  $SBFTBL$ 0x06040000  LTP 0x00000001) @ 0x000000003ff77f48
<7>ACPI: SPCR (v001 PTLTD  $UCRTBL$ 0x06040000 PTL  0x00000001) @ 0x000000003ff77f70
<7>ACPI: MCFG (v001 PTLTD  	 MCFG   0x06040000  LTP 0x00000000) @ 0x000000003ff77fc0
<7>ACPI: SSDT (v001  PmRef    CpuPm 0x00003000 INTL 0x20030224) @ 0x000000003ff7301f
<7>ACPI: DSDT (v001  Intel LINDHRST 0x06040000 MSFT 0x0100000e) @ 0x0000000000000000
<6>No NUMA configuration found
<6>Faking a node at 0000000000000000-000000003ff70000
<4>Bootmem setup node 0 0000000000000000-000000003ff70000
<7>On node 0 totalpages: 262000
<7>  DMA zone: 4096 pages, LIFO batch:1
<7>  Normal zone: 257904 pages, LIFO batch:16
<7>  HighMem zone: 0 pages, LIFO batch:1
<7>ACPI: Local APIC address 0xfee00000
<6>ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
<6>Processor #0 15:4 APIC version 16
<6>ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
<6>Processor #1 15:4 APIC version 16
<6>ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
<6>ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
<6>ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
<6>IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-23
<6>ACPI: IOAPIC (id[0x03] address[0xfec10000] gsi_base[24])
<6>IOAPIC[1]: apic_id 3, version 32, address 0xfec10000, GSI 24-47
<6>ACPI: IOAPIC (id[0x04] address[0xfec80000] gsi_base[48])
<6>IOAPIC[2]: apic_id 4, version 32, address 0xfec80000, GSI 48-71
<6>ACPI: IOAPIC (id[0x05] address[0xfec80400] gsi_base[72])
<6>IOAPIC[3]: apic_id 5, version 32, address 0xfec80400, GSI 72-95
<6>ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 high edge)
<6>ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
<7>ACPI: IRQ0 used by override.
<7>ACPI: IRQ2 used by override.
<7>ACPI: IRQ9 used by override.
<6>Setting APIC routing to flat
<6>Using ACPI (MADT) for SMP configuration information
<4>Checking aperture...
<4>Built 1 zonelists
<4>Kernel command line: root=/dev/md0 vga=0x31a selinux=0  splash=silent console=tty0 resume=/dev/sda1  showopts
<6>bootsplash: silent mode.
<4>Initializing CPU#0
<4>PID hash table entries: 4096 (order: 12, 131072 bytes)
<6>time.c: Using 1.193182 MHz PIT timer.
<6>time.c: Detected 3200.267 MHz processor.
<4>Console: colour dummy device 80x25
<4>Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
<4>Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
<4>Memory: 1022976k/1048000k available (2280k kernel code, 0k reserved, 1179k data, 212k init)
<7>Calibrating delay loop... 6324.22 BogoMIPS (lpj=3162112)
<6>Security Framework v1.0.0 initialized
<6>SELinux:  Disabled at boot.
<4>Mount-cache hash table entries: 256 (order: 0, 4096 bytes)
<6>CPU: Trace cache: 12K uops, L1 D cache: 16K
<6>CPU: L2 cache: 2048K
<4>using mwait in idle threads.
<6>CPU: Physical Processor ID: 0
<6>CPU0: Thermal monitoring enabled (TM1)
<6>checking if image is initramfs... it is
<6>ACPI: Looking for DSDT in initrd... not found!
<4> not found!
<6>Using IO APIC NMI watchdog
<6>CPU: Trace cache: 12K uops, L1 D cache: 16K
<6>CPU: L2 cache: 2048K
<6>CPU: Physical Processor ID: 0
<6>CPU0:                   Intel(R) Xeon(TM) CPU 3.20GHz stepping 03
<6>per-CPU timeslice cutoff: 705.82 usecs.
<6>task migration cache decay timeout: 1 msecs.
<6>Booting processor 1/1 rip 6000 rsp ffff810002249f58
<4>Initializing CPU#1
<7>Calibrating delay loop... 6389.76 BogoMIPS (lpj=3194880)
<6>CPU: Trace cache: 12K uops, L1 D cache: 16K
<6>CPU: L2 cache: 2048K
<6>CPU: Physical Processor ID: 0
<6>CPU1: Thermal monitoring enabled (TM1)
<4>                  Intel(R) Xeon(TM) CPU 3.20GHz stepping 03
<6>Total of 2 processors activated (12713.98 BogoMIPS).
<6>activating NMI Watchdog ... done.
<6>testing NMI watchdog ... CPU#1: NMI appears to be stuck (0)!
<6>Using local APIC timer interrupts.
<6>Detected 12.500 MHz APIC timer.
<6>checking TSC synchronization across 2 CPUs: passed.
<6>time.c: Using PIT/TSC based timekeeping.
<4>Brought up 2 CPUs
<6>NET: Registered protocol family 16
<6>PCI: Using configuration type 1
<6>PCI: Using MMCONFIG at e0000000
<6>mtrr: v2.0 (20020519)
<6>ACPI: Subsystem revision 20050211
<6>ACPI: Interpreter enabled
<6>ACPI: Using IOAPIC for interrupt routing
<6>ACPI: PCI Root Bridge [PCI0] (00:00)
<4>PCI: Probing PCI hardware (bus 00)
<6>PCI: Ignoring BAR0-3 of IDE controller 0000:00:1f.1
<6>PCI: Transparent bridge - 0000:00:1e.0
<7>ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
<7>ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEX0._PRT]
<7>ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEX0.PXH0._PRT]
<7>ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEX0.PXH1._PRT]
<7>ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEY0._PRT]
<7>ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEZ0._PRT]
<7>ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PCIX._PRT]
<7>ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PCIB._PRT]
<4>ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 *5 6 7 10 11 14 15)
<4>ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 *10 11 14 15)
<4>ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 *10 11 14 15)
<4>ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 10 *11 14 15)
<4>ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 10 11 14 15) *0, disabled.
<4>ACPI: PCI Interrupt Link [LNKF] (IRQs 4 5 6 7 10 11 14 15) *0, disabled.
<4>ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 7 *10 11 14 15)
<4>ACPI: PCI Interrupt Link [LNKH] (IRQs 4 5 6 7 10 *11 14 15)
<6>PCI: Using ACPI for IRQ routing
<6>PCI: If a device doesn't work, try "pci=routeirq".  If it helps, post a report
<4>TC classifier action (bugs to netdev@oss.sgi.com cc hadi@cyberus.ca)
<6>PCI-DMA: Disabling IOMMU.
<6>Simple Boot Flag at 0x39 set to 0x1
<4>IA32 emulation $Id: sys_ia32.c,v 1.32 2002/03/24 13:02:28 ak Exp $
<6>audit: initializing netlink socket (disabled)
<3>audit(1144403544.344:0): initialized
<4>Total HugeTLB memory allocated, 0
<5>VFS: Disk quotas dquot_6.5.1
<4>Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
<6>Initializing Cryptographic API
<6>vesafb: framebuffer at 0xde000000, mapped to 0xffffc20010100000, using 8128k, total 8128k
<6>vesafb: mode is 1280x1024x16, linelength=2560, pages=2
<6>vesafb: scrolling: redraw
<6>vesafb: Truecolor: size=0:5:6:5, shift=0:11:5:0
<4>Console: switching to colour frame buffer device 160x64
<6>fb0: VESA VGA frame buffer device
<6>Real Time Clock Driver v1.12
<6>Non-volatile memory driver v1.2
<6>Linux agpgart interface v0.100 (c) Dave Jones
<6>serio: i8042 AUX port at 0x60,0x64 irq 12
<6>serio: i8042 KBD port at 0x60,0x64 irq 1
<6>Serial: 8250/16550 driver $Revision: 1.90 $ 8 ports, IRQ sharing disabled
<4>ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
<4>ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
<6>io scheduler noop registered
<6>io scheduler anticipatory registered
<6>io scheduler deadline registered
<6>io scheduler cfq registered
<4>RAMDISK driver initialized: 16 RAM disks of 128000K size 1024 blocksize
<6>loop: loaded (max 8 devices)
<6>mice: PS/2 mouse device common for all mice
<6>input: PC Speaker
<6>md: md driver 0.90.1 MAX_MD_DEVS=256, MD_SB_DISKS=27
<6>NET: Registered protocol family 2
<6>IP: routing cache hash table of 4096 buckets, 64Kbytes
<4>TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
<4>TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
<6>TCP: Hash tables configured (established 262144 bind 65536)
<6>NET: Registered protocol family 1
<4>ACPI wakeup devices: 
<4>PEX0 PXH0 PXH1 PEY0 PEZ0 USB1 USB2 EUSB PCIX PCIB KBC0 MSE0 
<6>ACPI: (supports S0 S1 S4 S5)
<4>    ACPI-1041: *** Warning: Failed to acquire semaphore[ffff81003ff6e8a0|1|0], AE_TIME
<4>    ACPI-0741: *** Warning: Thread 0 could not acquire Mutex AE_TIME
<4>    ACPI-1041: *** Warning: Failed to acquire semaphore[ffff81003ff6e8a0|1|0], AE_TIME
<4>    ACPI-0741: *** Warning: Thread 0 could not acquire Mutex AE_TIME
<4>Freeing unused kernel memory: 212k freed
<5>SCSI subsystem initialized
<4>aar81xx: unsupported module, tainting kernel.
<4>aar81xx: module license 'Adaptec' taints kernel.
<6>ACPI: PCI interrupt 0000:02:03.0[A] -> GSI 56 (level, low) -> IRQ 169
<6>scsi0 : Adaptec AAR-1420SA Serial ATA HostRAID driver
<5>  Vendor: ST380817  Model: AS                Rev: 3.42
<5>  Type:   Direct-Access                      ANSI SCSI revision: 02
<4>scsi:0:0: Tagged Queuing enabled. Depth 1
<5>SCSI device sda: 156184465 512-byte hdwr sectors (79966 MB)
<3>sda: asking for cache data failed
<3>sda: assuming drive cache: write through
<5>SCSI device sda: 156184465 512-byte hdwr sectors (79966 MB)
<3>sda: asking for cache data failed
<3>sda: assuming drive cache: write through
<6> sda: sda1 sda2
<5>Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
<5>  Vendor: ST380817  Model: AS                Rev: 3.42
<5>  Type:   Direct-Access                      ANSI SCSI revision: 02
<4>scsi:1:0: Tagged Queuing enabled. Depth 1
<5>SCSI device sdb: 156184465 512-byte hdwr sectors (79966 MB)
<3>sdb: asking for cache data failed
<3>sdb: assuming drive cache: write through
<5>SCSI device sdb: 156184465 512-byte hdwr sectors (79966 MB)
<3>sdb: asking for cache data failed
<3>sdb: assuming drive cache: write through
<6> sdb: sdb1 sdb2
<5>Attached scsi disk sdb at scsi0, channel 0, id 1, lun 0
<5>  Vendor: ST330083  Model: 1A                Rev: 3.03
<5>  Type:   Direct-Access                      ANSI SCSI revision: 02
<4>scsi:2:0: Tagged Queuing enabled. Depth 1
<5>SCSI device sdc: 585871965 512-byte hdwr sectors (299966 MB)
<3>sdc: asking for cache data failed
<3>sdc: assuming drive cache: write through
<5>SCSI device sdc: 585871965 512-byte hdwr sectors (299966 MB)
<3>sdc: asking for cache data failed
<3>sdc: assuming drive cache: write through
<7>Losing some ticks... checking if CPU frequency changed.
<6> sdc: sdc1
<5>Attached scsi disk sdc at scsi0, channel 0, id 2, lun 0
<5>  Vendor: ST330083  Model: 1A                Rev: 3.03
<5>  Type:   Direct-Access                      ANSI SCSI revision: 02
<4>scsi:3:0: Tagged Queuing enabled. Depth 1
<5>SCSI device sdd: 585871965 512-byte hdwr sectors (299966 MB)
<3>sdd: asking for cache data failed
<3>sdd: assuming drive cache: write through
<5>SCSI device sdd: 585871965 512-byte hdwr sectors (299966 MB)
<3>sdd: asking for cache data failed
<3>sdd: assuming drive cache: write through
<6> sdd: sdd1
<5>Attached scsi disk sdd at scsi0, channel 0, id 3, lun 0
<6>Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
<6>ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
<6>ICH5: IDE controller at PCI slot 0000:00:1f.1
<6>ACPI: PCI interrupt 0000:00:1f.1[A] -> GSI 18 (level, low) -> IRQ 177
<6>ICH5: chipset revision 2
<6>ICH5: not 100% native mode: will probe irqs later
<6>    ide0: BM-DMA at 0x1460-0x1467, BIOS settings: hda:pio, hdb:pio
<6>    ide1: BM-DMA at 0x1468-0x146f, BIOS settings: hdc:DMA, hdd:pio
<7>Probing IDE interface ide0...
<7>Probing IDE interface ide1...
<4>hdc: SONY DVD RW DW-Q28A, ATAPI CD/DVD-ROM drive
<4>ide1 at 0x170-0x177,0x376 on irq 15
<6>md: raid1 personality registered as nr 3
<6>hdc: ATAPI 48X DVD-ROM DVD-R CD-R/RW drive, 2048kB Cache, UDMA(33)
<6>Uniform CD-ROM driver Revision: 3.20
<6>md: Autodetecting RAID arrays.
<6>md: autorun ...
<6>md: considering sdd1 ...
<6>md:  adding sdd1 ...
<6>md:  adding sdc1 ...
<4>md: sdb2 has different UUID to sdd1
<4>md: sda2 has different UUID to sdd1
<6>md: created md1
<6>md: bind<sdc1>
<6>md: bind<sdd1>
<6>md: running: <sdd1><sdc1>
<6>raid1: raid set md1 active with 2 out of 2 mirrors
<6>md: considering sdb2 ...
<6>md:  adding sdb2 ...
<6>md:  adding sda2 ...
<6>md: created md0
<6>md: bind<sda2>
<6>md: bind<sdb2>
<6>md: running: <sdb2><sda2>
<6>raid1: raid set md0 active with 2 out of 2 mirrors
<6>md: ... autorun DONE.
<5>ReiserFS: md0: found reiserfs format "3.6" with standard journal
<5>ReiserFS: md0: using ordered data mode
<4>reiserfs: using flush barriers
<5>ReiserFS: md0: journal params: device md0, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
<5>ReiserFS: md0: checking transaction log (md0)
<5>ReiserFS: md0: Using r5 hash to sort names
<4>md: raidstart(pid 2126) used deprecated START_ARRAY ioctl. This will not be supported beyond 2.6
<3>md: could not bd_claim sdc1.
<4>md: autostart failed!
<4>md: raidstart(pid 2126) used deprecated START_ARRAY ioctl. This will not be supported beyond 2.6
<3>md: could not bd_claim sda2.
<4>md: autostart failed!
<6>md: Autodetecting RAID arrays.
<6>md: autorun ...
<6>md: ... autorun DONE.
<6>device-mapper: 4.4.0-ioctl (2005-01-12) initialised: dm-devel@redhat.com
<6>parport0: PC-style at 0x378 (0x778) [PCSPP,TRISTATE,EPP]
<6>parport0: irq 7 detected
<6>lp0: using parport0 (polling).
<6>usbcore: registered new driver usbfs
<6>usbcore: registered new driver hub
<6>USB Universal Host Controller Interface driver v2.2
<6>ACPI: PCI interrupt 0000:00:1d.0[A] -> GSI 16 (level, low) -> IRQ 185
<6>uhci_hcd 0000:00:1d.0: UHCI Host Controller
<7>PCI: Setting latency timer of device 0000:00:1d.0 to 64
<6>uhci_hcd 0000:00:1d.0: irq 185, io base 0x1400
<6>uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 1
<6>hub 1-0:1.0: USB hub found
<6>hub 1-0:1.0: 2 ports detected
<6>ACPI: PCI interrupt 0000:00:1d.1[B] -> GSI 19 (level, low) -> IRQ 193
<6>uhci_hcd 0000:00:1d.1: UHCI Host Controller
<7>PCI: Setting latency timer of device 0000:00:1d.1 to 64
<6>uhci_hcd 0000:00:1d.1: irq 193, io base 0x1420
<6>uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 2
<6>hub 2-0:1.0: USB hub found
<6>hub 2-0:1.0: 2 ports detected
<6>ACPI: PCI interrupt 0000:00:1d.7[D] -> GSI 23 (level, low) -> IRQ 201
<6>ehci_hcd 0000:00:1d.7: EHCI Host Controller
<7>PCI: Setting latency timer of device 0000:00:1d.7 to 64
<6>ehci_hcd 0000:00:1d.7: irq 201, pci mem 0xdd001400
<6>ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 3
<7>PCI: cache line size of 128 is not supported by device 0000:00:1d.7
<6>ehci_hcd 0000:00:1d.7: USB 2.0 initialized, EHCI 1.00, driver 10 Dec 2004
<6>hub 3-0:1.0: USB hub found
<6>hub 3-0:1.0: 4 ports detected
<6>Intel(R) PRO/1000 Network Driver - version 5.6.10.1-k2-NAPI
<6>Copyright (c) 1999-2004 Intel Corporation.
<6>ACPI: PCI interrupt 0000:06:01.0[A] -> GSI 24 (level, low) -> IRQ 209
<6>e1000: eth0: e1000_probe: Intel(R) PRO/1000 Network Connection
<6>ACPI: PCI interrupt 0000:06:02.0[A] -> GSI 25 (level, low) -> IRQ 217
<6>e1000: eth1: e1000_probe: Intel(R) PRO/1000 Network Connection
<5>Attached scsi generic sg0 at scsi0, channel 0, id 0, lun 0,  type 0
<5>Attached scsi generic sg1 at scsi0, channel 0, id 1, lun 0,  type 0
<5>Attached scsi generic sg2 at scsi0, channel 0, id 2, lun 0,  type 0
<5>Attached scsi generic sg3 at scsi0, channel 0, id 3, lun 0,  type 0
<7>load_module: err 0xffffffffffffffef (dont worry)
<6>cdrom: open failed.
<6>st: Version 20041025, fixed bufsize 32768, s/g segs 256
<6>BIOS EDD facility v0.16 2004-Jun-25, 4 devices found
<5>ReiserFS: dm-0: found reiserfs format "3.6" with standard journal
<5>ReiserFS: dm-0: using ordered data mode
<4>reiserfs: using flush barriers
<5>ReiserFS: dm-0: journal params: device dm-0, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
<5>ReiserFS: dm-0: checking transaction log (dm-0)
<5>ReiserFS: dm-0: Using r5 hash to sort names
<5>ReiserFS: dm-1: found reiserfs format "3.6" with standard journal
<5>ReiserFS: dm-1: using ordered data mode
<4>reiserfs: using flush barriers
<5>ReiserFS: dm-1: journal params: device dm-1, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
<5>ReiserFS: dm-1: checking transaction log (dm-1)
<5>ReiserFS: dm-1: Using r5 hash to sort names
<5>ReiserFS: dm-3: found reiserfs format "3.6" with standard journal
<5>ReiserFS: dm-3: using ordered data mode
<4>reiserfs: using flush barriers
<5>ReiserFS: dm-3: journal params: device dm-3, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
<5>ReiserFS: dm-3: checking transaction log (dm-3)
<5>ReiserFS: dm-3: Using r5 hash to sort names
<5>ReiserFS: dm-5: found reiserfs format "3.6" with standard journal
<5>ReiserFS: dm-5: using ordered data mode
<4>reiserfs: using flush barriers
<5>ReiserFS: dm-5: journal params: device dm-5, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
<5>ReiserFS: dm-5: checking transaction log (dm-5)
<5>ReiserFS: dm-5: Using r5 hash to sort names
<5>ReiserFS: dm-4: found reiserfs format "3.6" with standard journal
<5>ReiserFS: dm-4: using ordered data mode
<4>reiserfs: using flush barriers
<5>ReiserFS: dm-4: journal params: device dm-4, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
<5>ReiserFS: dm-4: checking transaction log (dm-4)
<5>ReiserFS: dm-4: Using r5 hash to sort names
<5>ReiserFS: dm-2: found reiserfs format "3.6" with standard journal
<5>ReiserFS: dm-2: using ordered data mode
<4>reiserfs: using flush barriers
<5>ReiserFS: dm-2: journal params: device dm-2, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
<5>ReiserFS: dm-2: checking transaction log (dm-2)
<5>ReiserFS: dm-2: Using r5 hash to sort names
<6>Capability LSM initialized
<7>ieee1394: Initialized config rom entry `ip1394'
<6>ieee1394: raw1394: /dev/raw1394 device initialized
<6>video1394: Installed video1394 module
Kernel logging (ksyslog) stopped.
Kernel log daemon terminating.

Boot logging started on /dev/tty1(/dev/console) at Fri Apr  7 11:52:57 2006

Master Resource Control: previous runlevel: N, switching to runlevel: 3
<notice>checkproc: /sbin/udevd 2162
<notice>startproc: execve (/usr/bin/dbus-daemon-1) [ /usr/bin/dbus-daemon-1 --system ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty1 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin vga=0x31a RUNLEVEL=3 resume=/dev/sda1 PWD=/ SPLASHCFG= ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/usr/bin/dbus-daemon-1 ]
Initializing random number generatordone
<notice>startproc: execve (/sbin/resmgrd) [ /sbin/resmgrd ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty1 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin vga=0x31a RUNLEVEL=3 resume=/dev/sda1 PWD=/ SPLASHCFG= ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/sbin/resmgrd ]
<notice>startproc: execve (/usr/sbin/irqbalance) [ /usr/sbin/irqbalance ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty1 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin vga=0x31a RUNLEVEL=3 resume=/dev/sda1 PWD=/ SPLASHCFG= ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/usr/sbin/irqbalance ]
Starting irqbalance done
Starting resource managerdone
Starting D-BUS daemondone
Setting up network interfaces:
    lo        
    lo        IP address: 127.0.0.1/8   
done    eth0      device: Intel Corporation 82541GI/PI Gigabit Ethernet Controller (rev 05)
    eth0      configuration: eth-id-00:30:48:76:ac:ba
    eth0      IP address: 172.22.111.13/16   
done    eth1      device: Intel Corporation 82541GI/PI Gigabit Ethernet Controller (rev 05)
    eth1      configuration: eth-id-00:30:48:76:ac:bb
    eth1      IP address: 10.9.1.30/13   
doneSetting up service network  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .done
<notice>startproc: execve (/usr/sbin/mdnsd) [ /usr/sbin/mdnsd -f /etc/rendezvous.conf -b ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty1 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin vga=0x31a RUNLEVEL=3 resume=/dev/sda1 PWD=/ SPLASHCFG= ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/usr/sbin/mdnsd ]
mDNSResponder: Duplicate registration of DNS for domain .

Starting mdnsddone
Starting syslog services<notice>startproc: execve (/sbin/syslog-ng) [ /sbin/syslog-ng ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty1 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin vga=0x31a RUNLEVEL=3 resume=/dev/sda1 PWD=/ SPLASHCFG= ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/sbin/syslog-ng ]
<notice>startproc: execve (/sbin/klogd) [ /sbin/klogd -c 1 -x -x ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty1 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin vga=0x31a RUNLEVEL=3 resume=/dev/sda1 PWD=/ SPLASHCFG= ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/sbin/klogd ]
done
<notice>startproc: execve (/sbin/portmap) [ /sbin/portmap ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty1 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin vga=0x31a RUNLEVEL=3 resume=/dev/sda1 PWD=/ SPLASHCFG= ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/sbin/portmap ]
Starting RPC portmap daemondone
Importing Net File System (NFS)unused
Starting nfsboot (sm-notify) done
<notice>startproc: execve (/usr/sbin/sshd) [ /usr/sbin/sshd -o PidFile=/var/run/sshd.init.pid ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty1 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin vga=0x31a RUNLEVEL=3 resume=/dev/sda1 PWD=/ SPLASHCFG= ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/usr/sbin/sshd ]
Starting sound driverdone
Starting SSH daemondone
Mount SMB/ CIFS File Systems unused
<notice>startproc: execve (/usr/sbin/powersaved) [ /usr/sbin/powersaved -d -x /usr/lib/powersave/scripts -a resmgr -v 3 ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty1 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin vga=0x31a RUNLEVEL=3 resume=/dev/sda1 PWD=/ SPLASHCFG= ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/usr/sbin/powersaved ]
loading ACPI modules (ac battery button fan processor thermal ) done
Starting powersaved  (accessing ACPI events over acpid) done
Loading keymap qwerty/us.map.gz
doneLoading compose table winkeys shiftctrl latin1.adddone
Start Unicode mode
doneLoading console font lat9w-16.psfu  -m trivial G0:loadable
doneStarting hardware scan on boot<notice>startproc: execve (/usr/sbin/ntpd) [ /usr/sbin/ntpd -p /var/lib/ntp/var/run/ntp/ntpd.pid -u ntp -i /var/lib/ntp ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty1 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin vga=0x31a RUNLEVEL=3 resume=/dev/sda1 PWD=/ SPLASHCFG= ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/usr/sbin/ntpd ]
Try to get initial date and time via NTP from 172.22.110.10failed
Starting network time protocol daemon (NTPD)done
<notice>startproc: execve (/usr/sbin/nscd) [ /usr/sbin/nscd ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty1 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin vga=0x31a RUNLEVEL=3 resume=/dev/sda1 PWD=/ SPLASHCFG= ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/usr/sbin/nscd ]
Starting Name Service Cache Daemondone
Starting mail service (Postfix)done
Starting CRON daemon<notice>startproc: execve (/usr/sbin/cron) [ /usr/sbin/cron ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty1 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin vga=0x31a RUNLEVEL=3 resume=/dev/sda1 PWD=/ SPLASHCFG= ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/usr/sbin/cron ]
done
<notice>startproc: execve (/usr/sbin/hald) [ /usr/sbin/hald --daemon=yes ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty1 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin vga=0x31a RUNLEVEL=3 resume=/dev/sda1 PWD=/ SPLASHCFG= ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/usr/sbin/hald ]
Starting HAL daemondone
Master Resource Control: runlevel 3 has been reached
Skipped services in runlevel 3: smbfs nfs
<notice>killproc: kill(5585,3)

Boot logging started on /dev/tty3(/dev/console) at Fri Apr  7 13:51:01 2006

Master Resource Control: previous runlevel: 3, switching to runlevel: 5
<notice>killproc: kill(5967,15)
<notice>startproc: execve (/usr/X11R6/bin/xdm) [ /usr/X11R6/bin/xdm ], [ LC_MONETARY= CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 LC_NUMERIC= QTDIR=/usr/lib/qt3 LC_ALL= INIT_VERSION=sysvinit-2.85 INIT=/sbin/init KDEROOTHOME=/root/.kdm REDIRECT=/dev/tty3 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin LC_MESSAGES= vga=0x31a RUNLEVEL=5 LC_COLLATE= resume=/dev/sda1 PWD=/ SPLASHCFG= LANG=en_US.UTF-8 ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=3 LINES=64 HOME=/ SHLVL=2 XCURSOR_THEME=crystalwhite WINDOWMANAGER=/usr/X11R6/bin/kde LC_CTYPE=en_US.UTF-8 splash=silent SPLASH=no LC_TIME= ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/usr/X11R6/bin/xdm ]
Starting service xdmdone
<notice>killproc: kill(5964,15)
Re-Starting syslog services<notice>startproc: execve (/sbin/syslog-ng) [ /sbin/syslog-ng ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs SHELL=/bin/sh TERM=linux ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty3 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin vga=0x31a RUNLEVEL=5 SPLASHCFG= PWD=/ resume=/dev/sda1 ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=3 LINES=64 SHLVL=2 HOME=/ SPLASH=no splash=silent ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/sbin/syslog-ng ]
<notice>startproc: execve (/sbin/klogd) [ /sbin/klogd -c 1 -x -x ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs SHELL=/bin/sh TERM=linux ROOTFS_FSCK=0 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty3 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin vga=0x31a RUNLEVEL=5 SPLASHCFG= PWD=/ resume=/dev/sda1 ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=3 LINES=64 SHLVL=2 HOME=/ SPLASH=no splash=silent ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/sbin/klogd ]
done
Master Resource Control: runlevel 5 has been reached
<notice>killproc: kill(8767,3)

Boot logging started on /dev/tty2(/dev/console) at Fri Apr  7 13:51:24 2006

Master Resource Control: previous runlevel: 5, switching to runlevel: 3
<notice>killproc: kill(8820,15)
/etc/init.d/kbd stopdone
Shutting down service xdm<notice>killproc: kill(8817,15)
done
Loading keymap qwerty/us.map.gz
doneLoading compose table winkeys shiftctrl latin1.adddone
Start Unicode mode
doneLoading console font lat9w-16.psfu  -m trivial G0:loadable
doneMaster Resource Control: runlevel 3 has been reached
<notice>killproc: kill(8884,3)

Boot logging started on /dev/tty1(/dev/console) at Thu May 18 12:23:33 2006

Mounting shared memory FS on /dev/shmdone
Initializing Multiple Devices...
considering /dev/md1...
/dev/md1 is not a RAID0 or LINEAR array, skipping.
considering /dev/md0...
/dev/md0 is not a RAID0 or LINEAR array, skipping.
/dev/md1: Invalid argument
/dev/md0: Invalid argument
<notice>startproc: execve (/sbin/udevd) [ /sbin/udevd -d ], [ CONSOLE=/dev/console ROOTFS_FSTYPE=reiserfs TERM=linux SHELL=/bin/sh ROOTFS_FSCK=0 UDEVD_EVENT_TIMEOUT=1 UDEVD_EXPECTED_SEQNUM=839 INIT_VERSION=sysvinit-2.85 INIT=/sbin/init REDIRECT=/dev/tty1 UDEVD_MAX_CHILDS=50 COLUMNS=160 PATH=/sbin:/usr/sbin:/bin:/usr/bin:/lib/klibc/bin UDEVD_PIDFILE=/dev/.udevdb/udevd.pid vga=0x31a DO_CONFIRM= RUNLEVEL=S resume=/dev/sda1 PWD=/ SPLASHCFG= ROOTFS_REALDEV=/lib/klibc//dev/md0 PREVLEVEL=N LINES=64 HOME=/ SHLVL=2 splash=silent SPLASH=no UDEVD_THROTTLE=0 ROOTFS_BLKDEV=/dev/md0 _=/sbin/startproc DAEMON=/sbin/udevd ]
Starting udevd done
Activating device mapper...
Creating /dev/mapper/control character device with major:10 minor:63.
done
Coldplug
Coldplug: cleaning /events 
Coldplug: removing left over /var/run/sysconfig/network hwup: Loading module 'lp'  for device 'printer'
 processing eventsdone
Scanning for LVM volume groups...
  Reading all physical volumes.  This may take a while...
  Found volume group "data" using metadata type lvm2
Activating LVM volume groups...
  17 logical volume(s) in volume group "data" now active
done
Checking file systems...
fsck 1.36 (05-Feb-2005)
Reiserfs super block in block 16 on 0xfd00 of format 3.6 with standard journal
Blocks (total/free): 2621440/1328118 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 13, transid 16921, desc 2459, len 3, commit 2463, next trans offset 2446
Reiserfs journal '/dev/data/home' in blocks [18..8211]: 1 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd01 of format 3.6 with standard journal
Blocks (total/free): 2621440/2498307 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 13, transid 5141, desc 1298, len 4, commit 1303, next trans offset 1286
Trans replayed: mountid 13, transid 5142, desc 1304, len 1, commit 1306, next trans offset 1289
Reiserfs journal '/dev/data/opt' in blocks [18..8211]: 2 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd03 of format 3.6 with standard journal
Blocks (total/free): 2621440/2612840 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 13, transid 6056, desc 6804, len 1, commit 6806, next trans offset 6789
Trans replayed: mountid 13, transid 6057, desc 6807, len 1, commit 6809, next trans offset 6792
Trans replayed: mountid 13, transid 6058, desc 6810, len 1, commit 6812, next trans offset 6795
Reiserfs journal '/dev/data/srv' in blocks [18..8211]: 3 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd05 of format 3.6 with standard journal
Blocks (total/free): 7864320/147396 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 14, transid 14619, desc 6833, len 3, commit 6837, next trans offset 6820
Trans replayed: mountid 14, transid 14620, desc 6838, len 6, commit 6845, next trans offset 6828
Trans replayed: mountid 14, transid 14621, desc 6846, len 3, commit 6850, next trans offset 6833
Trans replayed: mountid 14, transid 14622, desc 6851, len 2, commit 6854, next trans offset 6837
Trans replayed: mountid 14, transid 14623, desc 6855, len 5, commit 6861, next trans offset 6844
Trans replayed: mountid 14, transid 14624, desc 6862, len 6, commit 6869, next trans offset 6852
Trans replayed: mountid 14, transid 14625, desc 6870, len 1, commit 6872, next trans offset 6855
Trans replayed: mountid 14, transid 14626, desc 6873, len 3, commit 6877, next trans offset 6860
Trans replayed: mountid 14, transid 14627, desc 6878, len 4, commit 6883, next trans offset 6866
Trans replayed: mountid 14, transid 14628, desc 6884, len 1, commit 6886, next trans offset 6869
Reiserfs journal '/dev/data/ZVE-FS' in blocks [18..8211]: 10 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd04 of format 3.6 with standard journal
Blocks (total/free): 128000/119313 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 14, transid 18186, desc 6867, len 5, commit 6873, next trans offset 6856
Reiserfs journal '/dev/data/tmp' in blocks [18..8211]: 1 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd02 of format 3.6 with standard journal
Blocks (total/free): 128000/119783 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 14, transid 1351, desc 4105, len 1, commit 4107, next trans offset 4090
Reiserfs journal '/dev/data/usr-local' in blocks [18..8211]: 1 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd06 of format 3.6 with standard journal
Blocks (total/free): 2097152/1202532 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 11, transid 5022, desc 3609, len 11, commit 3621, next trans offset 3604
Trans replayed: mountid 11, transid 5023, desc 3622, len 19, commit 3642, next trans offset 3625
Trans replayed: mountid 11, transid 5024, desc 3643, len 14, commit 3658, next trans offset 3641
Trans replayed: mountid 11, transid 5025, desc 3659, len 16, commit 3676, next trans offset 3659
Trans replayed: mountid 11, transid 5026, desc 3677, len 9, commit 3687, next trans offset 3670
Trans replayed: mountid 11, transid 5027, desc 3688, len 3, commit 3692, next trans offset 3675
Trans replayed: mountid 11, transid 5028, desc 3693, len 10, commit 3704, next trans offset 3687
Trans replayed: mountid 11, transid 5029, desc 3705, len 1, commit 3707, next trans offset 3690
Trans replayed: mountid 11, transid 5030, desc 3708, len 5, commit 3714, next trans offset 3697
Trans replayed: mountid 11, transid 5031, desc 3715, len 2, commit 3718, next trans offset 3701
Trans replayed: mountid 11, transid 5032, desc 3719, len 3, commit 3723, next trans offset 3706
Trans replayed: mountid 11, transid 5033, desc 3724, len 2, commit 3727, next trans offset 3710
Trans replayed: mountid 11, transid 5034, desc 3728, len 1, commit 3730, next trans offset 3713
Trans replayed: mountid 11, transid 5035, desc 3731, len 2, commit 3734, next trans offset 3717
Trans replayed: mountid 11, transid 5036, desc 3735, len 1, commit 3737, next trans offset 3720
Trans replayed: mountid 11, transid 5037, desc 3738, len 13, commit 3752, next trans offset 3735
Trans replayed: mountid 11, transid 5038, desc 3753, len 21, commit 3775, next trans offset 3758
Trans replayed: mountid 11, transid 5039, desc 3776, len 12, commit 3789, next trans offset 3772
Trans replayed: mountid 11, transid 5040, desc 3790, len 15, commit 3806, next trans offset 3789
Trans replayed: mountid 11, transid 5041, desc 3807, len 16, commit 3824, next trans offset 3807
Trans replayed: mountid 11, transid 5042, desc 3825, len 14, commit 3840, next trans offset 3823
Trans replayed: mountid 11, transid 5043, desc 3841, len 16, commit 3858, next trans offset 3841
Trans replayed: mountid 11, transid 5044, desc 3859, len 14, commit 3874, next trans offset 3857
Trans replayed: mountid 11, transid 5045, desc 3875, len 5, commit 3881, next trans offset 3864
Reiserfs journal '/dev/data/zve-rcc' in blocks [18..8211]: 24 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd07 of format 3.6 with standard journal
Blocks (total/free): 524288/440647 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 12, transid 1439, desc 3557, len 33, commit 3591, next trans offset 3574
Trans replayed: mountid 12, transid 1440, desc 3592, len 37, commit 3630, next trans offset 3613
Trans replayed: mountid 12, transid 1441, desc 3631, len 18, commit 3650, next trans offset 3633
Trans replayed: mountid 12, transid 1442, desc 3651, len 122, commit 3774, next trans offset 3757
Trans replayed: mountid 12, transid 1443, desc 3775, len 163, commit 3939, next trans offset 3922
Trans replayed: mountid 12, transid 1444, desc 3940, len 76, commit 4017, next trans offset 4000
Trans replayed: mountid 12, transid 1445, desc 4018, len 24, commit 4043, next trans offset 4026
Trans replayed: mountid 12, transid 1446, desc 4044, len 17, commit 4062, next trans offset 4045
Trans replayed: mountid 12, transid 1447, desc 4063, len 22, commit 4086, next trans offset 4069
Trans replayed: mountid 12, transid 1448, desc 4087, len 50, commit 4138, next trans offset 4121
Trans replayed: mountid 12, transid 1449, desc 4139, len 29, commit 4169, next trans offset 4152
Trans replayed: mountid 12, transid 1450, desc 4170, len 18, commit 4189, next trans offset 4172
Trans replayed: mountid 12, transid 1451, desc 4190, len 39, commit 4230, next trans offset 4213
Trans replayed: mountid 12, transid 1452, desc 4231, len 49, commit 4281, next trans offset 4264
Trans replayed: mountid 12, transid 1453, desc 4282, len 53, commit 4336, next trans offset 4319
Trans replayed: mountid 12, transid 1454, desc 4337, len 36, commit 4374, next trans offset 4357
Trans replayed: mountid 12, transid 1455, desc 4375, len 15, commit 4391, next trans offset 4374
Trans replayed: mountid 12, transid 1456, desc 4392, len 7, commit 4400, next trans offset 4383
Reiserfs journal '/dev/data/zve-devel' in blocks [18..8211]: 18 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd09 of format 3.6 with standard journal
Blocks (total/free): 524288/513617 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 12, transid 137, desc 502, len 10, commit 513, next trans offset 496
Trans replayed: mountid 12, transid 138, desc 514, len 1, commit 516, next trans offset 499
Trans replayed: mountid 12, transid 139, desc 517, len 6, commit 524, next trans offset 507
Reiserfs journal '/dev/data/zve-eng' in blocks [18..8211]: 3 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd08 of format 3.6 with standard journal
Blocks (total/free): 524288/516061 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 10, transid 45, desc 124, len 1, commit 126, next trans offset 109
Reiserfs journal '/dev/data/zve-mngmnt' in blocks [18..8211]: 1 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd0b of format 3.6 with standard journal
Blocks (total/free): 524288/408565 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 11, transid 6713, desc 5017, len 1, commit 5019, next trans offset 5002
Trans replayed: mountid 11, transid 6714, desc 5020, len 1, commit 5022, next trans offset 5005
Trans replayed: mountid 11, transid 6715, desc 5023, len 1, commit 5025, next trans offset 5008
Trans replayed: mountid 11, transid 6716, desc 5026, len 1, commit 5028, next trans offset 5011
Trans replayed: mountid 11, transid 6717, desc 5029, len 1, commit 5031, next trans offset 5014
Trans replayed: mountid 11, transid 6718, desc 5032, len 1, commit 5034, next trans offset 5017
Reiserfs journal '/dev/data/zve-pro' in blocks [18..8211]: 6 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd0a of format 3.6 with standard journal
Blocks (total/free): 1048576/1040333 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 11, transid 48, desc 133, len 1, commit 135, next trans offset 118
Reiserfs journal '/dev/data/zve-sales' in blocks [18..8211]: 1 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd0c of format 3.6 with standard journal
Blocks (total/free): 2621440/1606540 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 10, transid 9961, desc 6416, len 9, commit 6426, next trans offset 6409
Reiserfs journal '/dev/data/NEO3000-builds' in blocks [18..8211]: 1 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd0f of format 3.6 with standard journal
Blocks (total/free): 10485760/3077305 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 10, transid 10213, desc 5053, len 2, commit 5056, next trans offset 5039
Trans replayed: mountid 10, transid 10214, desc 5057, len 3, commit 5061, next trans offset 5044
Trans replayed: mountid 10, transid 10215, desc 5062, len 2, commit 5065, next trans offset 5048
Trans replayed: mountid 10, transid 10216, desc 5066, len 1, commit 5068, next trans offset 5051
Trans replayed: mountid 10, transid 10217, desc 5069, len 2, commit 5072, next trans offset 5055
Trans replayed: mountid 10, transid 10218, desc 5073, len 37, commit 5111, next trans offset 5094
Trans replayed: mountid 10, transid 10219, desc 5112, len 1, commit 5114, next trans offset 5097
Trans replayed: mountid 10, transid 10220, desc 5115, len 25, commit 5141, next trans offset 5124
Trans replayed: mountid 10, transid 10221, desc 5142, len 1, commit 5144, next trans offset 5127
Trans replayed: mountid 10, transid 10222, desc 5145, len 27, commit 5173, next trans offset 5156
Trans replayed: mountid 10, transid 10223, desc 5174, len 1, commit 5176, next trans offset 5159
Trans replayed: mountid 10, transid 10224, desc 5177, len 34, commit 5212, next trans offset 5195
Trans replayed: mountid 10, transid 10225, desc 5213, len 2, commit 5216, next trans offset 5199
Trans replayed: mountid 10, transid 10226, desc 5217, len 31, commit 5249, next trans offset 5232
Trans replayed: mountid 10, transid 10227, desc 5250, len 1, commit 5252, next trans offset 5235
Trans replayed: mountid 10, transid 10228, desc 5253, len 41, commit 5295, next trans offset 5278
Trans replayed: mountid 10, transid 10229, desc 5296, len 36, commit 5333, next trans offset 5316
Trans replayed: mountid 10, transid 10230, desc 5334, len 39, commit 5374, next trans offset 5357
Trans replayed: mountid 10, transid 10231, desc 5375, len 31, commit 5407, next trans offset 5390
Trans replayed: mountid 10, transid 10232, desc 5408, len 1, commit 5410, next trans offset 5393
Reiserfs journal '/dev/data/zve-archive' in blocks [18..8211]: 20 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd0d of format 3.6 with standard journal
Blocks (total/free): 1310720/1302469 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 10, transid 105, desc 312, len 1, commit 314, next trans offset 297
Trans replayed: mountid 10, transid 106, desc 315, len 1, commit 317, next trans offset 300
Reiserfs journal '/dev/data/zve-documents' in blocks [18..8211]: 2 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd0e of format 3.6 with standard journal
Blocks (total/free): 5242880/282221 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 10, transid 18777, desc 3664, len 41, commit 3706, next trans offset 3689
Trans replayed: mountid 10, transid 18778, desc 3707, len 41, commit 3749, next trans offset 3732
Trans replayed: mountid 10, transid 18779, desc 3750, len 36, commit 3787, next trans offset 3770
Trans replayed: mountid 10, transid 18780, desc 3788, len 5, commit 3794, next trans offset 3777
Reiserfs journal '/dev/data/zve-projects' in blocks [18..8211]: 4 transactions replayed
Checking internal tree..finished
Reiserfs super block in block 16 on 0xfd10 of format 3.6 with standard journal
Blocks (total/free): 128000/115324 by 4096 bytes
Filesystem is NOT clean
Replaying journal..
Trans replayed: mountid 10, transid 967, desc 3926, len 1, commit 3928, next trans offset 3911
Trans replayed: mountid 10, transid 968, desc 3929, len 1, commit 3931, next trans offset 3914
Reiserfs journal '/dev/data/zve-ec' in blocks [18..8211]: 2 transactions replayed
Checking internal tree..finished
doneSetting up kernel module dependencies (if required)done
Mounting local file systems...
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
tmpfs on /dev/shm type tmpfs (rw)
devpts on /dev/pts type devpts (rw,mode=0620,gid=5)
/dev/mapper/data-home on /home type reiserfs (rw,acl,user_xattr)
/dev/mapper/data-opt on /opt type reiserfs (rw,acl,user_xattr)
/dev/mapper/data-srv on /srv type reiserfs (rw,acl,user_xattr)
/dev/mapper/data-ZVE--FS on /srv/fileserver/ZVE type reiserfs (rw)
/dev/mapper/data-tmp on /tmp type reiserfs (rw,acl,user_xattr)
/dev/mapper/data-usr--local on /usr/local type reiserfs (rw,acl,user_xattr)
/dev/mapper/data-zve--rcc on /srv/fileserver/ZVE/groups/zve-rcc type reiserfs (rw,acl,user_xattr)
/dev/mapper/data-zve--devel on /srv/fileserver/ZVE/groups/zve-devel type reiserfs (rw,acl,user_xattr)
/dev/mapper/data-zve--eng on /srv/fileserver/ZVE/groups/zve-eng type reiserfs (rw,acl,user_xattr)
/dev/mapper/data-zve--mngmnt on /srv/fileserver/ZVE/groups/zve-mngmnt type reiserfs (rw,acl,user_xattr)
/dev/mapper/data-zve--pro on /srv/fileserver/ZVE/groups/zve-pro type reiserfs (rw,acl,user_xattr)
/dev/mapper/data-zve--sales on /srv/fileserver/ZVE/groups/zve-sales type reiserfs (rw,acl,user_xattr)
/dev/mapper/data-NEO3000--builds on /srv/fileserver/NEO3000 type reiserfs (rw,acl,user_xattr)
/dev/mapper/data-zve--archive on /srv/fileserver/ZVE/zve-archive type reiserfs (rw,acl,user_xattr)
/dev/mapper/data-zve--documents on /srv/fileserver/ZVE/zve-documents type reiserfs (rw,acl,user_xattr)
/dev/mapper/data-zve--projects on /srv/fileserver/ZVE/zve-projects type reiserfs (rw,acl,user_xattr)
/dev/mapper/data-zve--ec on /srv/fileserver/ZVE/groups/zve-ec type reiserfs (rw,acl,user_xattr)
doneSetting up the CMOS clockdone
Loading required kernel modules
done
--------------090403080704050001080605
Content-Type: text/plain;
 name="20060518.zve-server.warn"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="20060518.zve-server.warn"

Feb 16 13:08:22 kiztok-3 kernel:     ACPI-0484: *** Warning: Error getting cpuindex for acpiid 0x2
Feb 16 13:08:22 kiztok-3 kernel:     ACPI-0484: *** Warning: Error getting cpuindex for acpiid 0x3
Feb 16 13:08:22 kiztok-3 kernel: end_request: I/O error, dev fd0, sector 0
Feb 16 13:08:22 kiztok-3 kernel: end_request: I/O error, dev fd0, sector 0
Feb 16 13:10:27 kiztok-3 kernel: UDF-fs: No VRS found
Feb 16 13:10:27 kiztok-3 kernel: UDF-fs: No VRS found
Feb 16 13:14:15 kiztok-3 kernel: UDF-fs: No VRS found
Feb 16 13:40:57 kiztok-3 kernel: UDF-fs: No VRS found
Feb 16 13:49:29 kiztok-3 kernel: mtrr: 0xde000000,0x800000 overlaps existing 0xde000000,0x400000
Feb 16 13:49:29 kiztok-3 kernel: mtrr: 0xde000000,0x800000 overlaps existing 0xde000000,0x400000
Feb 16 13:50:51 kiztok-3 kernel: mtrr: 0xde000000,0x800000 overlaps existing 0xde000000,0x400000
Feb 16 13:50:51 kiztok-3 kernel: mtrr: 0xde000000,0x800000 overlaps existing 0xde000000,0x400000
Feb 16 13:51:19 kiztok-3 kernel: mtrr: 0xde000000,0x800000 overlaps existing 0xde000000,0x400000
Feb 16 13:51:19 kiztok-3 kernel: mtrr: 0xde000000,0x800000 overlaps existing 0xde000000,0x400000
Feb 16 13:57:38 kiztok-3 kernel: UDF-fs: No VRS found
Feb 16 14:25:20 kiztok-3 kernel: UDF-fs: No VRS found
Feb 16 14:52:15 kiztok-3 kernel: ip_tables: (C) 2000-2002 Netfilter core team
Feb 16 15:23:51 zve-server kernel:     ACPI-0484: *** Warning: Error getting cpuindex for acpiid 0x2
Feb 16 15:23:51 zve-server kernel:     ACPI-0484: *** Warning: Error getting cpuindex for acpiid 0x3
Feb 16 15:23:51 zve-server kernel: end_request: I/O error, dev fd0, sector 0
Feb 16 15:23:51 zve-server kernel: end_request: I/O error, dev fd0, sector 0
Feb 16 15:37:11 zve-server kernel: UDF-fs: No VRS found
Feb 16 15:40:56 zve-server kernel: UDF-fs: No VRS found
Feb 16 15:44:33 zve-server kernel: UDF-fs: No VRS found
Feb 16 15:51:40 zve-server kernel: UDF-fs: No VRS found
Feb 16 15:56:57 zve-server kernel: mtrr: 0xde000000,0x800000 overlaps existing 0xde000000,0x400000
Feb 16 15:56:57 zve-server kernel: mtrr: 0xde000000,0x800000 overlaps existing 0xde000000,0x400000
Feb 16 17:37:54 zve-server kernel: 	Operation continuing on 1 devices
Feb 16 17:37:54 zve-server kernel: RAID1 conf printout:
Feb 16 17:37:54 zve-server kernel:  --- wd:1 rd:2
Feb 16 17:37:54 zve-server kernel:  disk 0, wo:0, o:1, dev:sda2
Feb 16 17:37:54 zve-server kernel:  disk 1, wo:1, o:0, dev:sdb2
Feb 16 17:37:54 zve-server kernel: RAID1 conf printout:
Feb 16 17:37:54 zve-server kernel:  --- wd:1 rd:2
Feb 16 17:37:54 zve-server kernel:  disk 0, wo:0, o:1, dev:sda2
Feb 16 17:39:12 zve-server kernel: RAID1 conf printout:
Feb 16 17:39:12 zve-server kernel:  --- wd:1 rd:2
Feb 16 17:39:12 zve-server kernel:  disk 0, wo:0, o:1, dev:sda2
Feb 16 17:39:12 zve-server kernel:  disk 1, wo:1, o:1, dev:sdb2
Feb 16 17:39:12 zve-server kernel: ..<6>md: syncing RAID array md0
Feb 16 17:42:52 zve-server kernel: RAID1 conf printout:
Feb 16 17:42:52 zve-server kernel:  --- wd:2 rd:2
Feb 16 17:42:52 zve-server kernel:  disk 0, wo:0, o:1, dev:sda2
Feb 16 17:42:52 zve-server kernel:  disk 1, wo:0, o:1, dev:sdb2
Feb 23 19:55:18 zve-server kernel: ipmi_si: Unknown SMBIOS SI type.
Feb 23 19:55:18 zve-server kernel: ipmi_si: Trying "kcs" at I/O port 0xca2
Feb 23 19:55:18 zve-server kernel: ipmi_si: Trying "smic" at I/O port 0xca9
Feb 23 19:55:18 zve-server kernel: ipmi_si: Trying "bt" at I/O port 0xe4
Feb 23 19:55:18 zve-server kernel: ipmi_si: Unable to find any System Interface(s)
Apr  7 11:53:03 zve-server kernel:     ACPI-0484: *** Warning: Error getting cpuindex for acpiid 0x2
Apr  7 11:53:03 zve-server kernel:     ACPI-0484: *** Warning: Error getting cpuindex for acpiid 0x3
Apr  7 11:53:03 zve-server kernel: end_request: I/O error, dev fd0, sector 0
Apr  7 11:53:03 zve-server kernel: end_request: I/O error, dev fd0, sector 0
Apr  7 13:32:41 zve-server kernel: ip_tables: (C) 2000-2002 Netfilter core team
Apr  7 13:51:08 zve-server kernel: mtrr: 0xde000000,0x800000 overlaps existing 0xde000000,0x400000
Apr  7 13:51:08 zve-server kernel: mtrr: 0xde000000,0x800000 overlaps existing 0xde000000,0x400000
Apr 10 11:54:19 zve-server kernel: md: md1 still in use.
Apr 10 11:54:19 zve-server kernel: md: md0 still in use.
Apr 10 11:54:19 zve-server kernel: md: md1 still in use.
Apr 11 16:31:43 zve-server kernel: md: md1 still in use.
Apr 11 16:31:43 zve-server kernel: md: md0 still in use.
Apr 11 16:31:43 zve-server kernel: md: md1 still in use.
Apr 11 16:31:45 zve-server kernel: reiserfs: using flush barriers
Apr 11 16:31:46 zve-server kernel: ReiserFS: dm-6: warning: Created .reiserfs_priv on dm-6 - reserved for xattr storage.
Apr 11 16:33:07 zve-server kernel: md: md1 still in use.
Apr 11 18:24:58 zve-server kernel: md: md1 still in use.
Apr 11 18:24:59 zve-server kernel: reiserfs: using flush barriers
Apr 11 18:29:08 zve-server kernel: md: md1 still in use.
Apr 11 18:29:09 zve-server kernel: reiserfs: using flush barriers
Apr 11 18:39:58 zve-server kernel: md: md1 still in use.
Apr 11 18:39:58 zve-server kernel: md: md0 still in use.
Apr 11 18:39:58 zve-server kernel: md: md1 still in use.
Apr 11 18:40:01 zve-server kernel: reiserfs: using flush barriers
Apr 11 18:40:01 zve-server kernel: ReiserFS: dm-6: warning: Created .reiserfs_priv on dm-6 - reserved for xattr storage.
Apr 11 18:42:31 zve-server kernel: md: md1 still in use.
Apr 11 18:42:32 zve-server kernel: reiserfs: using flush barriers
Apr 11 18:50:48 zve-server kernel: md: md1 still in use.
Apr 11 18:50:48 zve-server kernel: md: md0 still in use.
Apr 11 18:50:48 zve-server kernel: md: md1 still in use.
Apr 11 18:50:50 zve-server kernel: reiserfs: using flush barriers
Apr 11 18:50:50 zve-server kernel: ReiserFS: dm-7: warning: Created .reiserfs_priv on dm-7 - reserved for xattr storage.
Apr 12 12:33:33 zve-server kernel: md: md1 still in use.
Apr 12 12:33:33 zve-server kernel: md: md0 still in use.
Apr 12 12:33:33 zve-server kernel: md: md1 still in use.
Apr 12 12:33:39 zve-server kernel: reiserfs: using flush barriers
Apr 12 12:33:39 zve-server kernel: ReiserFS: dm-9: warning: Created .reiserfs_priv on dm-9 - reserved for xattr storage.
Apr 12 12:33:40 zve-server kernel: reiserfs: using flush barriers
Apr 12 12:33:40 zve-server kernel: ReiserFS: dm-8: warning: Created .reiserfs_priv on dm-8 - reserved for xattr storage.
Apr 12 12:33:40 zve-server kernel: reiserfs: using flush barriers
Apr 12 12:33:41 zve-server kernel: ReiserFS: dm-11: warning: Created .reiserfs_priv on dm-11 - reserved for xattr storage.
Apr 12 12:33:41 zve-server kernel: reiserfs: using flush barriers
Apr 12 12:33:42 zve-server kernel: ReiserFS: dm-10: warning: Created .reiserfs_priv on dm-10 - reserved for xattr storage.
Apr 13 15:38:47 zve-server kernel: md: md1 still in use.
Apr 13 15:38:47 zve-server kernel: md: md0 still in use.
Apr 13 15:38:47 zve-server kernel: md: md1 still in use.
Apr 13 15:38:50 zve-server kernel: reiserfs: using flush barriers
Apr 13 15:38:51 zve-server kernel: ReiserFS: dm-12: warning: Created .reiserfs_priv on dm-12 - reserved for xattr storage.
Apr 21 12:12:28 zve-server kernel: reiserfs: using flush barriers
Apr 21 12:12:33 zve-server kernel: reiserfs: using flush barriers
Apr 21 12:14:53 zve-server kernel: md: md1 still in use.
Apr 21 12:14:53 zve-server kernel: md: md0 still in use.
Apr 21 12:14:53 zve-server kernel: md: md1 still in use.
Apr 21 12:14:54 zve-server kernel: reiserfs: using flush barriers
Apr 21 12:18:34 zve-server kernel: md: md1 still in use.
Apr 21 12:18:34 zve-server kernel: md: md0 still in use.
Apr 21 12:18:34 zve-server kernel: md: md1 still in use.
Apr 21 12:18:35 zve-server kernel: reiserfs: using flush barriers
Apr 21 12:18:35 zve-server kernel: reiserfs: using flush barriers
Apr 21 12:18:39 zve-server kernel: md: md1 still in use.
Apr 21 12:20:03 zve-server kernel: md: md1 still in use.
Apr 21 12:20:03 zve-server kernel: md: md0 still in use.
Apr 21 12:20:03 zve-server kernel: md: md1 still in use.
Apr 21 12:20:03 zve-server kernel: reiserfs: using flush barriers
Apr 21 12:30:05 zve-server kernel: md: md1 still in use.
Apr 21 12:30:05 zve-server kernel: md: md0 still in use.
Apr 21 12:30:05 zve-server kernel: md: md1 still in use.
Apr 21 12:30:13 zve-server kernel: reiserfs: using flush barriers
Apr 21 12:30:13 zve-server kernel: ReiserFS: dm-15: warning: Created .reiserfs_priv on dm-15 - reserved for xattr storage.
Apr 21 12:30:14 zve-server kernel: reiserfs: using flush barriers
Apr 21 12:30:14 zve-server kernel: ReiserFS: dm-13: warning: Created .reiserfs_priv on dm-13 - reserved for xattr storage.
Apr 21 12:30:15 zve-server kernel: reiserfs: using flush barriers
Apr 21 12:30:16 zve-server kernel: ReiserFS: dm-14: warning: Created .reiserfs_priv on dm-14 - reserved for xattr storage.
May  8 14:12:17 zve-server kernel: md: md1 still in use.
May  8 14:12:17 zve-server kernel: md: md0 still in use.
May  8 14:12:17 zve-server kernel: md: md1 still in use.
May  8 14:12:19 zve-server kernel: reiserfs: using flush barriers
May  8 14:12:20 zve-server kernel: ReiserFS: dm-16: warning: Created .reiserfs_priv on dm-16 - reserved for xattr storage.
May 11 13:38:05 zve-server kernel: md: md1 still in use.
May 11 13:38:05 zve-server kernel: md: md0 still in use.
May 11 13:38:05 zve-server kernel: md: md1 still in use.
May 11 13:45:11 zve-server kernel: md: md1 still in use.
May 11 13:45:11 zve-server kernel: md: md0 still in use.
May 11 13:45:11 zve-server kernel: md: md1 still in use.
May 11 13:45:11 zve-server kernel: reiserfs: using flush barriers
May 11 13:47:35 zve-server kernel: md: md1 still in use.
May 11 13:53:47 zve-server kernel: md: md1 still in use.
May 11 13:53:47 zve-server kernel: md: md0 still in use.
May 11 13:53:47 zve-server kernel: md: md1 still in use.
May 11 13:53:48 zve-server kernel: reiserfs: using flush barriers
May 18 11:06:44 zve-server kernel: end_request: I/O error, dev sdc, sector 331350463
May 18 11:07:25 zve-server kernel: end_request: I/O error, dev sdc, sector 331350471
May 18 11:08:06 zve-server kernel: end_request: I/O error, dev sdc, sector 331350479
May 18 11:08:47 zve-server kernel: end_request: I/O error, dev sdc, sector 331350487
May 18 11:09:28 zve-server kernel: end_request: I/O error, dev sdc, sector 331350495
May 18 11:10:10 zve-server kernel: end_request: I/O error, dev sdc, sector 331350503
May 18 11:10:10 zve-server kernel: 	Operation continuing on 1 devices
May 18 11:10:10 zve-server kernel: raid1: sdc1: rescheduling sector 331350400
May 18 11:10:10 zve-server kernel: raid1: sdd1: redirecting sector 331350400 to another mirror
May 18 11:13:35 zve-server kernel: end_request: I/O error, dev sdd, sector 331350463
May 18 11:14:16 zve-server kernel: end_request: I/O error, dev sdd, sector 331350471
May 18 11:14:57 zve-server kernel: end_request: I/O error, dev sdd, sector 331350479
May 18 11:15:38 zve-server kernel: end_request: I/O error, dev sdd, sector 331350487
May 18 11:16:20 zve-server kernel: end_request: I/O error, dev sdd, sector 331350495
May 18 11:17:01 zve-server kernel: end_request: I/O error, dev sdd, sector 331350503
May 18 11:17:01 zve-server kernel: raid1: sdd1: rescheduling sector 331350400
May 18 11:17:01 zve-server kernel: RAID1 conf printout:
May 18 11:17:01 zve-server kernel:  --- wd:1 rd:2
May 18 11:17:01 zve-server kernel:  disk 0, wo:1, o:0, dev:sdc1
May 18 11:17:01 zve-server kernel:  disk 1, wo:0, o:1, dev:sdd1
May 18 11:17:01 zve-server kernel: RAID1 conf printout:
May 18 11:17:01 zve-server kernel:  --- wd:1 rd:2
May 18 11:17:01 zve-server kernel:  disk 1, wo:0, o:1, dev:sdd1
May 18 11:17:01 zve-server kernel: raid1: sdd1: redirecting sector 331350400 to another mirror
May 18 11:20:26 zve-server kernel: end_request: I/O error, dev sdd, sector 331350463
May 18 11:21:07 zve-server kernel: end_request: I/O error, dev sdd, sector 331350471
May 18 11:21:48 zve-server kernel: end_request: I/O error, dev sdd, sector 331350479
May 18 11:22:30 zve-server kernel: end_request: I/O error, dev sdd, sector 331350487
May 18 11:23:11 zve-server kernel: end_request: I/O error, dev sdd, sector 331350495
May 18 11:23:52 zve-server kernel: end_request: I/O error, dev sdd, sector 331350503
May 18 11:23:52 zve-server kernel: raid1: sdd1: rescheduling sector 331350400
May 18 11:23:52 zve-server kernel: raid1: sdd1: redirecting sector 331350400 to another mirror
May 18 11:27:38 zve-server kernel: end_request: I/O error, dev sdd, sector 331350463
May 18 11:28:19 zve-server kernel: end_request: I/O error, dev sdd, sector 331350471
May 18 11:29:00 zve-server kernel: end_request: I/O error, dev sdd, sector 331350479
May 18 11:29:41 zve-server kernel: end_request: I/O error, dev sdd, sector 331350487
May 18 11:30:22 zve-server kernel: end_request: I/O error, dev sdd, sector 331350495
May 18 11:31:04 zve-server kernel: end_request: I/O error, dev sdd, sector 331350503
May 18 11:31:04 zve-server kernel: raid1: sdd1: rescheduling sector 331350400
May 18 11:31:04 zve-server kernel: raid1: sdd1: redirecting sector 331350400 to another mirror
May 18 11:34:29 zve-server kernel: end_request: I/O error, dev sdd, sector 331350463
May 18 11:35:10 zve-server kernel: end_request: I/O error, dev sdd, sector 331350471
May 18 11:35:51 zve-server kernel: end_request: I/O error, dev sdd, sector 331350479
May 18 11:36:32 zve-server kernel: end_request: I/O error, dev sdd, sector 331350487
May 18 11:37:14 zve-server kernel: end_request: I/O error, dev sdd, sector 331350495
May 18 11:37:55 zve-server kernel: end_request: I/O error, dev sdd, sector 331350503
May 18 11:37:55 zve-server kernel: raid1: sdd1: rescheduling sector 331350400
May 18 11:37:55 zve-server kernel: raid1: sdd1: redirecting sector 331350400 to another mirror
May 18 11:41:20 zve-server kernel: end_request: I/O error, dev sdd, sector 331350463
May 18 11:42:01 zve-server kernel: end_request: I/O error, dev sdd, sector 331350471
May 18 11:43:03 zve-server kernel: end_request: I/O error, dev sdd, sector 331350479
May 18 11:43:44 zve-server kernel: end_request: I/O error, dev sdd, sector 331350487
May 18 11:44:25 zve-server kernel: end_request: I/O error, dev sdd, sector 331350495
May 18 11:45:06 zve-server kernel: end_request: I/O error, dev sdd, sector 331350503
May 18 11:45:06 zve-server kernel: raid1: sdd1: rescheduling sector 331350400
May 18 11:45:06 zve-server kernel: raid1: sdd1: redirecting sector 331350400 to another mirror
May 18 11:48:32 zve-server kernel: end_request: I/O error, dev sdd, sector 331350463
May 18 11:49:13 zve-server kernel: end_request: I/O error, dev sdd, sector 331350471
May 18 11:49:54 zve-server kernel: end_request: I/O error, dev sdd, sector 331350479
May 18 11:50:35 zve-server kernel: end_request: I/O error, dev sdd, sector 331350487
May 18 11:51:16 zve-server kernel: end_request: I/O error, dev sdd, sector 331350495
May 18 11:51:58 zve-server kernel: end_request: I/O error, dev sdd, sector 331350503
May 18 11:51:58 zve-server kernel: raid1: sdd1: rescheduling sector 331350400
May 18 11:51:58 zve-server kernel: raid1: sdd1: redirecting sector 331350400 to another mirror
May 18 11:55:23 zve-server kernel: end_request: I/O error, dev sdd, sector 331350463
May 18 11:56:04 zve-server kernel: end_request: I/O error, dev sdd, sector 331350471
May 18 11:56:45 zve-server kernel: end_request: I/O error, dev sdd, sector 331350479
May 18 11:57:27 zve-server kernel: end_request: I/O error, dev sdd, sector 331350487
May 18 11:58:28 zve-server kernel: end_request: I/O error, dev sdd, sector 331350495
May 18 11:59:09 zve-server kernel: end_request: I/O error, dev sdd, sector 331350503
May 18 11:59:09 zve-server kernel: raid1: sdd1: rescheduling sector 331350400
May 18 11:59:09 zve-server kernel: raid1: sdd1: redirecting sector 331350400 to another mirror
May 18 12:02:35 zve-server kernel: end_request: I/O error, dev sdd, sector 331350463
May 18 12:03:16 zve-server kernel: end_request: I/O error, dev sdd, sector 331350471
May 18 12:03:57 zve-server kernel: end_request: I/O error, dev sdd, sector 331350479
May 18 12:04:38 zve-server kernel: end_request: I/O error, dev sdd, sector 331350487
May 18 12:05:19 zve-server kernel: end_request: I/O error, dev sdd, sector 331350495
May 18 12:06:01 zve-server kernel: end_request: I/O error, dev sdd, sector 331350503
May 18 12:06:01 zve-server kernel: raid1: sdd1: rescheduling sector 331350400
May 18 12:06:01 zve-server kernel: raid1: sdd1: redirecting sector 331350400 to another mirror
May 18 12:09:26 zve-server kernel: end_request: I/O error, dev sdd, sector 331350463
May 18 12:10:07 zve-server kernel: end_request: I/O error, dev sdd, sector 331350471
May 18 12:10:48 zve-server kernel: end_request: I/O error, dev sdd, sector 331350479
May 18 12:11:29 zve-server kernel: end_request: I/O error, dev sdd, sector 331350487
May 18 12:12:11 zve-server kernel: end_request: I/O error, dev sdd, sector 331350495
May 18 12:12:52 zve-server kernel: end_request: I/O error, dev sdd, sector 331350503
May 18 12:12:52 zve-server kernel: raid1: sdd1: rescheduling sector 331350400
May 18 12:12:52 zve-server kernel: raid1: sdd1: redirecting sector 331350400 to another mirror
May 18 12:16:17 zve-server kernel: end_request: I/O error, dev sdd, sector 331350463
May 18 12:16:58 zve-server kernel: end_request: I/O error, dev sdd, sector 331350471
May 18 12:17:39 zve-server kernel: end_request: I/O error, dev sdd, sector 331350479
May 18 12:18:21 zve-server kernel: end_request: I/O error, dev sdd, sector 331350487
May 18 12:19:02 zve-server kernel: end_request: I/O error, dev sdd, sector 331350495
May 18 12:19:43 zve-server kernel: end_request: I/O error, dev sdd, sector 331350503
May 18 12:19:43 zve-server kernel: raid1: sdd1: rescheduling sector 331350400
May 18 12:19:43 zve-server kernel: raid1: sdd1: redirecting sector 331350400 to another mirror
May 18 12:24:34 zve-server kernel:     ACPI-0484: *** Warning: Error getting cpuindex for acpiid 0x2
May 18 12:24:34 zve-server kernel:     ACPI-0484: *** Warning: Error getting cpuindex for acpiid 0x3
May 18 12:24:34 zve-server kernel: end_request: I/O error, dev fd0, sector 0
May 18 12:24:34 zve-server kernel: end_request: I/O error, dev fd0, sector 0

--------------090403080704050001080605
Content-Type: text/plain;
 name="20060522.sdd-io-error"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="20060522.sdd-io-error"

May 22 08:15:38 zve-server smbd[29836]:   gdavid (172.22.110.24) couldn't find service zve-doc
May 22 08:16:38 zve-server kernel: end_request: I/O error, dev sdd, sector 331350463
May 22 08:17:39 zve-server kernel: end_request: I/O error, dev sdd, sector 331350471
May 22 08:18:40 zve-server kernel: end_request: I/O error, dev sdd, sector 331350479
May 22 08:19:05 zve-server smbd[29844]: [2006/05/22 08:19:05, 0] lib/util_sock.c:get_peer_addr(1150)
May 22 08:19:05 zve-server smbd[29844]:   getpeername failed. Error was Transport endpoint is not connected
May 22 08:19:05 zve-server smbd[29844]: [2006/05/22 08:19:05, 0] lib/util_sock.c:write_socket_data(430)
May 22 08:19:05 zve-server smbd[29844]:   write_socket_data: write failure. Error = Connection reset by peer
May 22 08:19:05 zve-server smbd[29844]: [2006/05/22 08:19:05, 0] lib/util_sock.c:write_socket(455)
May 22 08:19:05 zve-server smbd[29844]:   write_socket: Error writing 4 bytes to socket 24: ERRNO = Connection reset by peer
May 22 08:19:05 zve-server smbd[29844]: [2006/05/22 08:19:05, 0] lib/util_sock.c:send_smb(647)
May 22 08:19:05 zve-server smbd[29844]:   Error writing 4 bytes to client. -1. (Connection reset by peer)
May 22 08:19:32 zve-server smbd[29847]: [2006/05/22 08:19:32, 0] lib/util_sock.c:get_peer_addr(1150)
May 22 08:19:32 zve-server smbd[29847]:   getpeername failed. Error was Transport endpoint is not connected
May 22 08:19:32 zve-server smbd[29847]: [2006/05/22 08:19:32, 0] lib/util_sock.c:write_socket_data(430)
May 22 08:19:32 zve-server smbd[29847]:   write_socket_data: write failure. Error = Connection reset by peer
May 22 08:19:32 zve-server smbd[29847]: [2006/05/22 08:19:32, 0] lib/util_sock.c:write_socket(455)
May 22 08:19:32 zve-server smbd[29847]:   write_socket: Error writing 4 bytes to socket 24: ERRNO = Connection reset by peer
May 22 08:19:32 zve-server smbd[29847]: [2006/05/22 08:19:32, 0] lib/util_sock.c:send_smb(647)
May 22 08:19:32 zve-server smbd[29847]:   Error writing 4 bytes to client. -1. (Connection reset by peer)
May 22 08:19:41 zve-server kernel: end_request: I/O error, dev sdd, sector 331350487
May 22 08:20:42 zve-server kernel: end_request: I/O error, dev sdd, sector 331350495
May 22 08:22:14 zve-server kernel: end_request: I/O error, dev sdd, sector 331350503
May 22 08:22:14 zve-server kernel: raid1: sdd1: rescheduling sector 331350400
May 22 08:22:14 zve-server kernel: raid1: sdd1: redirecting sector 331350400 to another mirror
May 22 08:22:14 zve-server smbd[29795]: [2006/05/22 08:22:14, 0] smbd/oplock.c:oplock_break(832)
May 22 08:22:14 zve-server smbd[29795]:   oplock_break: end of file from client
May 22 08:22:14 zve-server smbd[29795]:   oplock_break failed for file Elektro Primorska/RTP_Lucija/Projektiva/Komp_posl/Dokumentacija/Tehni?ni_dokumenti/Tloris stikali??a.dwg (dev = fd0e, inode = 59934, file_id = 1).
May 22 08:22:14 zve-server smbd[29795]: [2006/05/22 08:22:14, 0] smbd/oplock.c:oplock_break(925)
May 22 08:22:14 zve-server smbd[29795]:   oplock_break: client failure in break - shutting down this smbd.
May 22 08:23:52 zve-server smbd[29861]: [2006/05/22 08:23:52, 0] smbd/service.c:make_connection(794)
May 22 08:23:52 zve-server smbd[29861]:   gdavid (172.22.110.24) couldn't find service zve-doc
May 22 08:23:52 zve-server smbd[29861]: [2006/05/22 08:23:52, 0] smbd/service.c:make_connection(794)
May 22 08:23:52 zve-server smbd[29861]:   gdavid (172.22.110.24) couldn't find service zve-doc
May 22 08:24:23 zve-server nmbd[19789]: [2006/05/22 08:24:23, 0] nmbd/nmbd.c:terminate(56)
May 22 08:24:23 zve-server nmbd[19789]:   Got SIGTERM: going down...
May 22 08:27:20 zve-server kernel: end_request: I/O error, dev sdd, sector 331350463
May 22 08:28:21 zve-server kernel: end_request: I/O error, dev sdd, sector 331350471
May 22 08:29:15 zve-server hal.hotplug[29916]: DEVPATH is not set
May 22 08:29:22 zve-server kernel: end_request: I/O error, dev sdd, sector 331350479
May 22 08:30:23 zve-server kernel: end_request: I/O error, dev sdd, sector 331350487
May 22 08:31:24 zve-server kernel: end_request: I/O error, dev sdd, sector 331350495
May 22 08:32:25 zve-server kernel: end_request: I/O error, dev sdd, sector 331350503
May 22 08:32:25 zve-server kernel: raid1: sdd1: rescheduling sector 331350400
May 22 08:32:25 zve-server kernel: raid1: sdd1: redirecting sector 331350400 to another mirror

--------------090403080704050001080605--
