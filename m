From: Javier Marcet <jmarcet@pobox.com>
Subject: Corruptions on every filesystem with 02-reiserfs_file_write.diff.gz
Date: Tue, 20 Aug 2002 17:17:01 +0200
Message-ID: <20020820151701.GA15499@jerry.boludo.cjb.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <reiserfs-list-return-11256-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When applying the second of the patches available under
reiserfs-for-2.4/2.4.19.pending/testing I get corruptions on any write
comitted to ANY filesystem, including ram.

I cannot give more specifics than adding that patch, doing a simple test
like creating a tar.bz2 out of a folder on my HD (be it SCSI or IDE),
produces a corrupt archive; i.e. testing it with 'bzip2 -t' gives a CRC
error on the archive.
The oddest part is that it does not only affect to reiserfs partitions,
but to any file created on ext2, xfs or even ramfs (/dev/shm)
partitions.
This behaviour was the same with either 2.4.19-pre5-aa1 (aka 2.4.19-aa),
2.4.19 barebone, 2.4.20-pre2, 2.4.20-pre-ac2 ac3 and ac4.
In each of them I had applied the corresponding patches of the main
2.4.19.pending dir which had not been previously merged on the kernel.

I tried different things to avoid those corruptions I was suddenly
getting until I began removing the patches I had applied to all my
testing kernels, and the culprit was 02-reiserfs_file_write.diff.gz
The first one gave no problems, although to be on the safe side, I have
removed it too.

I attach some relevant information about my system.

Let me reinforce the fact that without that I have no problems at all,
and reiserfs is working better than ever :)

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=dmesg

Linux version 2.4.20-p2ac4-rmap14a (root@) (gcc version 3.2) 
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009f800 (usable)
 BIOS-e820: 000000000009f800 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000000ffec000 (usable)
 BIOS-e820: 000000000ffec000 - 000000000ffef000 (ACPI data)
 BIOS-e820: 000000000ffef000 - 000000000ffff000 (reserved)
 BIOS-e820: 000000000ffff000 - 0000000010000000 (ACPI NVS)
 BIOS-e820: 00000000ffff0000 - 0000000100000000 (reserved)
255MB LOWMEM available.
On node 0 totalpages: 65516
zone(0): 4096 pages.
zone(1): 61420 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/sda2 video=matrox:mem:32,xres:1280,yres:960,left:264,right:24,hslen:160,upper:47,lower:1,vslen:3,pixclock:6024,sync:0x03,depth:32,pan,panicblink=2,devfs=mount
Local APIC disabled by BIOS -- reenabling.
Found and enabled local APIC!
Initializing CPU#0
Detected 1544.517 MHz processor.
Console: colour dummy device 80x25
Calibrating delay loop... 3080.19 BogoMIPS
Memory: 254120k/262064k available (1379k kernel code, 5512k reserved, 438k data, 108k init, 0k highmem)
Dentry cache hash table entries: 32768 (order: 6, 262144 bytes)
Inode cache hash table entries: 16384 (order: 5, 131072 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
ramfs: mounted with options: <defaults>
ramfs: max_pages=32020 max_file_pages=0 max_inodes=0 max_dentries=32020
Buffer cache hash table entries: 16384 (order: 4, 65536 bytes)
Page-cache hash table entries: 65536 (order: 6, 262144 bytes)
CPU: Before vendor init, caps: 0383fbff c1c3fbff 00000000, vendor = 2
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 256K (64 bytes/line)
CPU: After vendor init, caps: 0383fbff c1c3fbff 00000000 00000000
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
CPU:     After generic, caps: 0383fbff c1c3fbff 00000000 00000000
CPU:             Common caps: 0383fbff c1c3fbff 00000000 00000000
CPU: AMD Athlon(TM) XP 1800+ stepping 02
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
enabled ExtINT on CPU#0
ESR value before enabling vector: 00000000
ESR value after enabling vector: 00000000
Using local APIC timer interrupts.
calibrating APIC timer ...
..... CPU clock speed is 1544.6280 MHz.
..... host bus clock speed is 268.6308 MHz.
cpu: 0, clocks: 2686308, slice: 1343154
CPU0<T0:2686304,T1:1343136,D:14,S:1343154,C:2686308>
mtrr: v1.40 (20010327) Richard Gooch (rgooch@atnf.csiro.au)
mtrr: detected mtrr type: Intel
PCI: PCI BIOS revision 2.10 entry at 0xf1180, last bus=1
PCI: Probing PCI hardware
Disabling VIA memory write queue (PCI ID 0305, rev 03): [55] 89 & 1f -> 09
Unknown bridge resource 0: assuming transparent
PCI: Using IRQ router VIA [1106/0686] at 00:04.0
Applying VIA southbridge workaround.
PCI: Disabling Via external APIC routing
PnPBIOS: Found PnP BIOS installation structure at 0xc00fc4f0
PnPBIOS: PnP BIOS version 1.0, entry 0xf0000:0xc520, dseg 0xf0000
PnPBIOS: 15 nodes reported by PnP BIOS; 15 recorded by driver
PnPBIOS: PNP0c02: ioport range 0xe400-0xe47f has been reserved
PnPBIOS: PNP0c02: ioport range 0xe800-0xe83f could not be reserved
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
devfs: v1.12a (20020514) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x0
ACPI: Core Subsystem version [20011018]
ACPI: Subsystem enabled
ACPI: System firmware supports S0 S1 S4 S5
Processor[0]: C0 C1 C2, 8 throttling states
ACPI: Power Button (FF) found
ACPI: Multiple power buttons detected, ignoring fixed-feature
ACPI: Power Button (CM) found
matroxfb: Matrox Millennium G400 MAX (AGP) detected
matroxfb: MTRR's turned on
matroxfb: 1280x960x32bpp (virtual: 1280x3276)
matroxfb: framebuffer at 0xE2000000, mapped to 0xd0811000, size 33554432
Console: switching to colour frame buffer device 160x60
fb0: MATROX VGA frame buffer device
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
VP_IDE: IDE controller on PCI bus 00 dev 21
VP_IDE: chipset revision 6
VP_IDE: not 100% native mode: will probe irqs later
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
VP_IDE: VIA vt82c686b (rev 40) IDE UDMA100 controller on pci00:04.1
    ide0: BM-DMA at 0xd800-0xd807, BIOS settings: hda:DMA, hdb:pio
hda: IBM-DTLA-307045, ATA DISK drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
PDC20265: IDE controller on PCI bus 00 dev 88
PCI: Found IRQ 10 for device 00:11.0
PCI: Sharing IRQ 10 with 00:0b.0
PDC20265: chipset revision 2
PDC20265: not 100% native mode: will probe irqs later
PDC20265: (U)DMA Burst Bit DISABLED Primary PCI Mode Secondary PCI Mode.
    ide2: BM-DMA at 0x7800-0x7807, BIOS settings: hde:pio, hdf:pio
    ide3: BM-DMA at 0x7808-0x780f, BIOS settings: hdg:DMA, hdh:pio
hda: host protected area => 1
hda: 90069840 sectors (46116 MB) w/1916KiB Cache, CHS=5606/255/63, UDMA(100)
Partition check:
 /dev/ide/host0/bus0/target0/lun0: p1 p2 < p5 p6 p7 p8 p9 p10 p11 >
SCSI subsystem driver Revision: 1.00
PCI: Found IRQ 10 for device 00:0b.0
PCI: Sharing IRQ 10 with 00:11.0
scsi0 : Adaptec AIC7XXX EISA/VLB/PCI SCSI HBA DRIVER, Rev 6.2.8
        <Adaptec 2940 Ultra2 SCSI adapter>
        aic7890/91: Ultra2 Wide Channel A, SCSI Id=7, 32/253 SCBs

  Vendor: IBM       Model: DNES-309170W      Rev: SA30
  Type:   Direct-Access                      ANSI SCSI revision: 03
  Vendor: TEAC      Model: CD-R56S           Rev: 1.0P
  Type:   CD-ROM                             ANSI SCSI revision: 02
  Vendor: PIONEER   Model: DVD-ROM DVD-305   Rev: 1.03
  Type:   CD-ROM                             ANSI SCSI revision: 02
scsi0:A:0:0: Tagged Queuing enabled.  Depth 253
Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
(scsi0:A:0): 80.000MB/s transfers (40.000MHz, offset 31, 16bit)
SCSI device sda: 17916240 512-byte hdwr sectors (9173 MB)
 /dev/scsi/host0/bus0/target0/lun0: p1 p2 p3 p4 < p5 p6 p7 p8 >
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 16384 bind 32768)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
reiserfs: checking transaction log (device 08:02) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
VFS: Mounted root (reiserfs filesystem) readonly.
Freeing unused kernel memory: 108k freed
Adding Swap: 530104k swap-space (priority -1)
reiserfs: checking transaction log (device 08:05) ...
reiserfs: replayed 1 transactions in 2 seconds
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 08:06) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 08:07) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 08:08) ...
reiserfs: replayed 11 transactions in 4 seconds
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 03:07) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 03:09) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 03:0a) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
usb.c: registered new driver hub
Real Time Clock Driver v1.10e
PCI: Found IRQ 5 for device 00:0d.0
PCI: Sharing IRQ 5 with 00:04.2
PCI: Sharing IRQ 5 with 00:04.3
PCI: Sharing IRQ 5 with 00:09.0
3c59x: Donald Becker and others. www.scyld.com/network/vortex.html
00:0d.0: 3Com PCI 3c905C Tornado at 0x9400. Vers LK1.1.18-ac
spurious 8259A interrupt: IRQ7.
i2c-core.o: i2c core module
Linux video capture interface: v1.00
i2c-core.o: driver VES1893 DVB demodulator registered.
i2c-core.o: driver VES1820 DVB demodulator registered.
i2c-core.o: driver L64781 DVB demodulator registered.
init_SP8870:
i2c-core.o: driver SP8870 DVB demodulator registered.
i2c-core.o: driver tda8083 DVB demodulator registered.
i2c-core.o: driver stv0299 DVB demodulator registered.
i2c-core.o: driver i2c TV tuner driver registered.
saa7146_core.o: saa7146(1): bus:0, rev:1, mem:0xd2e1a000.
i2c-core.o: client [VES1893] registered to adapter [saa7146(1)](pos. 0).
VES1893: attaching VES1893 at 0x10 to adapter saa7146(1)
tuner: chip found @ 0x61
i2c-core.o: client [i2c tv tuner chip] registered to adapter [saa7146(1)](pos. 1).
i2c-core.o: adapter saa7146(1) registered as adapter 0.
dvb0: AV7111 - firm f0240009, rtsl b0250018, vid 71010068, app 00012301
dvb: 1 dvb(s) found!
dvb: 1 dvb(s) released.
free irqs
VES1893: detach_client
i2c-core.o: client [VES1893] unregistered.
i2c-core.o: client [SP5659] unregistered.
i2c-core.o: adapter unregistered: saa7146(1)
i2c-core.o: driver unregistered: L64781 DVB demodulator
exit_SP8870:
i2c-core.o: driver unregistered: SP8870 DVB demodulator
i2c-core.o: driver unregistered: VES1820 DVB demodulator
i2c-core.o: driver unregistered: VES1893 DVB demodulator
i2c-core.o: driver unregistered: stv0299 DVB demodulator
i2c-core.o: driver unregistered: tda8083 DVB demodulator
i2c-core.o: driver unregistered: i2c TV tuner driver
i2c-core.o: i2c core module
Linux video capture interface: v1.00
i2c-core.o: driver VES1893 DVB demodulator registered.
i2c-core.o: driver VES1820 DVB demodulator registered.
i2c-core.o: driver L64781 DVB demodulator registered.
init_SP8870:
i2c-core.o: driver SP8870 DVB demodulator registered.
i2c-core.o: driver tda8083 DVB demodulator registered.
i2c-core.o: driver stv0299 DVB demodulator registered.
i2c-core.o: driver i2c TV tuner driver registered.
saa7146_core.o: saa7146(1): bus:0, rev:1, mem:0xd2e1a000.
i2c-core.o: client [VES1893] registered to adapter [saa7146(1)](pos. 0).
VES1893: attaching VES1893 at 0x10 to adapter saa7146(1)
tuner: chip found @ 0x61
i2c-core.o: client [i2c tv tuner chip] registered to adapter [saa7146(1)](pos. 1).
i2c-core.o: adapter saa7146(1) registered as adapter 0.
dvb0: AV7111 - firm f0240009, rtsl b0250018, vid 71010068, app 00012301
dvb: 1 dvb(s) found!
Linux agpgart interface v0.99 (c) Jeff Hartmann
agpgart: Maximum main memory to use for agp memory: 203M
agpgart: Detected Via Apollo Pro KT133 chipset
agpgart: AGP aperture is 64M @ 0xe4000000
[drm] AGP 0.99 on VIA Apollo KT133 @ 0xe4000000 64MB
[drm] Initialized mga 3.0.2 20010321 on minor 0
Attached scsi CD-ROM sr0 at scsi0, channel 0, id 1, lun 0
Attached scsi CD-ROM sr1 at scsi0, channel 0, id 2, lun 0
(scsi0:A:1): 10.000MB/s transfers (10.000MHz, offset 15)
sr0: scsi3-mmc drive: 24x/24x writer cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.12
(scsi0:A:2): 20.000MB/s transfers (20.000MHz, offset 16)
sr1: scsi3-mmc drive: 16x/40x cd/rw xa/form2 cdda tray
(scsi0:A:0:0): Locking max tag count at 64
dvb: 1 dvb(s) released.
free irqs
VES1893: detach_client
i2c-core.o: client [VES1893] unregistered.
i2c-core.o: client [SP5659] unregistered.
i2c-core.o: adapter unregistered: saa7146(1)
i2c-core.o: driver unregistered: L64781 DVB demodulator
exit_SP8870:
i2c-core.o: driver unregistered: SP8870 DVB demodulator
i2c-core.o: driver unregistered: VES1820 DVB demodulator
i2c-core.o: driver unregistered: VES1893 DVB demodulator
i2c-core.o: driver unregistered: stv0299 DVB demodulator
i2c-core.o: driver unregistered: tda8083 DVB demodulator
i2c-core.o: driver unregistered: i2c TV tuner driver
i2c-core.o: i2c core module
Linux video capture interface: v1.00
i2c-core.o: driver VES1893 DVB demodulator registered.
i2c-core.o: driver VES1820 DVB demodulator registered.
i2c-core.o: driver L64781 DVB demodulator registered.
init_SP8870:
i2c-core.o: driver SP8870 DVB demodulator registered.
i2c-core.o: driver tda8083 DVB demodulator registered.
i2c-core.o: driver stv0299 DVB demodulator registered.
i2c-core.o: driver i2c TV tuner driver registered.
saa7146_core.o: saa7146(1): bus:0, rev:1, mem:0xd2e1a000.
i2c-core.o: client [VES1893] registered to adapter [saa7146(1)](pos. 0).
VES1893: attaching VES1893 at 0x10 to adapter saa7146(1)
tuner: chip found @ 0x61
i2c-core.o: client [i2c tv tuner chip] registered to adapter [saa7146(1)](pos. 1).
i2c-core.o: adapter saa7146(1) registered as adapter 0.
dvb0: AV7111 - firm f0240009, rtsl b0250018, vid 71010068, app 00012301
dvb: 1 dvb(s) found!

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=proc_pci

PCI devices found:
  Bus  0, device   0, function  0:
    Host bridge: VIA Technologies, Inc. VT8363/8365 [KT133/KM133] (rev 3).
      Master Capable.  Latency=8.  
      Prefetchable 32 bit memory at 0xe4000000 [0xe7ffffff].
  Bus  0, device   1, function  0:
    PCI bridge: VIA Technologies, Inc. VT8363/8365 [KT133/KM133 AGP] (rev 0).
      Master Capable.  No bursts.  Min Gnt=8.
  Bus  0, device   4, function  0:
    ISA bridge: VIA Technologies, Inc. VT82C686 [Apollo Super South] (rev 64).
  Bus  0, device   4, function  1:
    IDE interface: VIA Technologies, Inc. Bus Master IDE (rev 6).
      Master Capable.  Latency=64.  
      I/O at 0xd800 [0xd80f].
  Bus  0, device   4, function  2:
    USB Controller: VIA Technologies, Inc. UHCI USB (rev 22).
      IRQ 5.
      Master Capable.  Latency=64.  
      I/O at 0xd400 [0xd41f].
  Bus  0, device   4, function  3:
    USB Controller: VIA Technologies, Inc. UHCI USB (#2) (rev 22).
      IRQ 5.
      Master Capable.  Latency=64.  
      I/O at 0xd000 [0xd01f].
  Bus  0, device   4, function  4:
    Bridge: VIA Technologies, Inc. VT82C686 [Apollo Super ACPI] (rev 64).
      IRQ 9.
  Bus  0, device   9, function  0:
    Multimedia audio controller: Creative Labs SB Live! EMU10k1 (rev 4).
      IRQ 5.
      Master Capable.  Latency=64.  Min Gnt=2.Max Lat=20.
      I/O at 0xa400 [0xa41f].
  Bus  0, device   9, function  1:
    Input device controller: Creative Labs SB Live! MIDI/Game Port (rev 1).
      Master Capable.  Latency=64.  
      I/O at 0xa000 [0xa007].
  Bus  0, device  10, function  0:
    Multimedia controller: Philips Semiconductors SAA7146 (rev 1).
      IRQ 15.
      Master Capable.  Latency=64.  Min Gnt=15.Max Lat=38.
      Non-prefetchable 32 bit memory at 0xe0000000 [0xe00001ff].
  Bus  0, device  11, function  0:
    SCSI storage controller: Adaptec AHA-2940U2/U2W (rev 0).
      IRQ 10.
      Master Capable.  Latency=64.  Min Gnt=39.Max Lat=25.
      I/O at 0x9800 [0x98ff].
      Non-prefetchable 64 bit memory at 0xdf800000 [0xdf800fff].
  Bus  0, device  13, function  0:
    Ethernet controller: 3Com Corporation 3c905C-TX/TX-M [Tornado] (rev 116).
      IRQ 5.
      Master Capable.  Latency=64.  Min Gnt=10.Max Lat=10.
      I/O at 0x9400 [0x947f].
      Non-prefetchable 32 bit memory at 0xdf000000 [0xdf00007f].
  Bus  0, device  17, function  0:
    Unknown mass storage controller: Promise Technology, Inc. 20265 (rev 2).
      IRQ 10.
      Master Capable.  Latency=64.  
      I/O at 0x9000 [0x9007].
      I/O at 0x8800 [0x8803].
      I/O at 0x8400 [0x8407].
      I/O at 0x8000 [0x8003].
      I/O at 0x7800 [0x783f].
      Non-prefetchable 32 bit memory at 0xde800000 [0xde81ffff].
  Bus  1, device   0, function  0:
    VGA compatible controller: Matrox Graphics, Inc. MGA G400 AGP (rev 3).
      IRQ 11.
      Master Capable.  Latency=64.  Min Gnt=16.Max Lat=32.
      Prefetchable 32 bit memory at 0xe2000000 [0xe3ffffff].
      Non-prefetchable 32 bit memory at 0xe1000000 [0xe1003fff].
      Non-prefetchable 32 bit memory at 0xe0800000 [0xe0ffffff].

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=proc_scsi_scsi

Attached devices: 
Host: scsi0 Channel: 00 Id: 00 Lun: 00
  Vendor: IBM      Model: DNES-309170W     Rev: SA30
  Type:   Direct-Access                    ANSI SCSI revision: 03
Host: scsi0 Channel: 00 Id: 01 Lun: 00
  Vendor: TEAC     Model: CD-R56S          Rev: 1.0P
  Type:   CD-ROM                           ANSI SCSI revision: 02
Host: scsi0 Channel: 00 Id: 02 Lun: 00
  Vendor: PIONEER  Model: DVD-ROM DVD-305  Rev: 1.03
  Type:   CD-ROM                           ANSI SCSI revision: 02

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=proc_ide_via

----------VIA BusMastering IDE Configuration----------------
Driver Version:                     3.34
South Bridge:                       VIA vt82c686b
Revision:                           ISA 0x40 IDE 0x6
Highest DMA rate:                   UDMA100
BM-DMA base:                        0xd800
PCI clock:                          33.3MHz
Master Read  Cycle IRDY:            0ws
Master Write Cycle IRDY:            0ws
BM IDE Status Register Read Retry:  yes
Max DRDY Pulse Width:               No limit
-----------------------Primary IDE-------Secondary IDE------
Read DMA FIFO flush:          yes                 yes
End Sector FIFO flush:         no                  no
Prefetch Buffer:              yes                  no
Post Write Buffer:            yes                  no
Enabled:                      yes                  no
Simplex only:                  no                  no
Cable Type:                   80w                 40w
-------------------drive0----drive1----drive2----drive3-----
Transfer Mode:       UDMA       PIO       PIO       PIO
Address Setup:       30ns     120ns     120ns     120ns
Cmd Active:          90ns      90ns     480ns     480ns
Cmd Recovery:        30ns      30ns     480ns     480ns
Data Active:         90ns     330ns     330ns     330ns
Data Recovery:       30ns     270ns     270ns     270ns
Cycle Time:          20ns     600ns     600ns     600ns
Transfer Rate:   99.9MB/s   3.3MB/s   3.3MB/s   3.3MB/s

--a8Wt8u1KmwUX3Y2C--
