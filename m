From: Viktors Rotanovs <viktors@rotanovs.com>
Subject: strange errors
Date: Thu, 18 Dec 2003 13:16:11 +0200
Message-ID: <3FE18C7B.5070402@rotanovs.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060204000004080008090208"
Return-path: <reiserfs-list-return-16357-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------060204000004080008090208
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

3 days after upgrade to 2.4.23+grsecurity 1.9.13 our highly loaded 
server (avg. load 10, peak 50, 10 ide hdds, 2 scsi hdds) showed the 
following messages:

ide0(3,6):vs-13060: reiserfs_update_sd: stat data of object [87648 
668456 0x0 SD] (nlink == 1) not found (pos 31)
ide0(3,6):vs-13060: reiserfs_update_sd: stat data of object [87648 
668456 0x0 SD] (nlink == 1) not found (pos 31)
ide0(3,6):vs-5355: reiserfs_delete_solid_item: [87648 668456 0x0 SD] not 
found

There are no other disk-related warning messages. What might have caused 
these errors? I'd like to investigate a little bit before running 
reiserfsck.

I've attached dmesg output.

Best Wishes,
Viktors


--------------060204000004080008090208
Content-Type: text/plain;
 name="dmesg.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dmesg.txt"

Linux version 2.4.23-grsec (root@tom.inbox.lv) (gcc version 3.2 20020903 (Red Hat Linux 8.0 3.2-7)) #2 Tue Dec 16 04:52:09 EET 2003
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 00000000000a0000 (usable)
 BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000005fff0000 (usable)
 BIOS-e820: 000000005fff0000 - 000000005fff3000 (ACPI NVS)
 BIOS-e820: 000000005fff3000 - 0000000060000000 (ACPI data)
 BIOS-e820: 00000000ffff0000 - 0000000100000000 (reserved)
639MB HIGHMEM available.
896MB LOWMEM available.
On node 0 totalpages: 393200
zone(0): 4096 pages.
zone(1): 225280 pages.
zone(2): 163824 pages.
Kernel command line: auto BOOT_IMAGE=linux_exper ro root=301 BOOT_FILE=/boot/bzImage.exper
Initializing CPU#0
Detected 1795.833 MHz processor.
Console: colour VGA+ 80x25
Calibrating delay loop... 3578.26 BogoMIPS
Memory: 1546720k/1572800k available (1505k kernel code, 25696k reserved, 91k data, 2780k init, 655296k highmem)
Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
Inode cache hash table entries: 131072 (order: 8, 1048576 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer cache hash table entries: 131072 (order: 7, 524288 bytes)
Page-cache hash table entries: 524288 (order: 9, 2097152 bytes)
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 256K (64 bytes/line)
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
CPU:     After generic, caps: 0383f9ff c1c3f9ff 00000000 00000000
CPU:             Common caps: 0383f9ff c1c3f9ff 00000000 00000000
CPU: AMD Athlon(tm) XP 2200+ stepping 00
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
PCI: PCI BIOS revision 2.10 entry at 0xfb4d0, last bus=1
PCI: Using configuration type 1
PCI: Probing PCI hardware
PCI: Probing PCI hardware (bus 00)
PCI: Using IRQ router default [1106/3099] at 00:00.0
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
allocated 32 pages and 32 bhs reserved for the highmem bounces
devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
pty: 1024 Unix98 ptys configured
Real Time Clock Driver v1.10e
keyboard: Timeout - AT keyboard not present?(ed)
keyboard: Timeout - AT keyboard not present?(f4)
8139too Fast Ethernet driver 0.9.26
eth0: RealTek RTL8139 at 0xf8800000, 00:50:fc:b0:d6:f8, IRQ 12
eth0:  Identified 8139 chip type 'RTL-8100B/8139D'
eth1: RealTek RTL8139 at 0xf8802000, 00:c0:26:23:30:bb, IRQ 11
eth1:  Identified 8139 chip type 'RTL-8100B/8139D'
Uniform Multi-Platform E-IDE driver Revision: 7.00beta4-2.4
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
PDC20265: IDE controller at PCI slot 00:0f.0
PDC20265: chipset revision 2
PDC20265: not 100% native mode: will probe irqs later
PDC20265: (U)DMA Burst Bit ENABLED Primary MASTER Mode Secondary MASTER Mode.
    ide2: BM-DMA at 0xbc00-0xbc07, BIOS settings: hde:pio, hdf:pio
    ide3: BM-DMA at 0xbc08-0xbc0f, BIOS settings: hdg:pio, hdh:pio
VP_IDE: IDE controller at PCI slot 00:11.1
VP_IDE: chipset revision 6
VP_IDE: not 100% native mode: will probe irqs later
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
VP_IDE: VIA vt8233 (rev 00) IDE UDMA100 controller on pci00:11.1
    ide0: BM-DMA at 0xc000-0xc007, BIOS settings: hda:DMA, hdb:DMA
    ide1: BM-DMA at 0xc008-0xc00f, BIOS settings: hdc:DMA, hdd:DMA
hda: FUJITSU MPG3204AH EF, ATA DISK drive
hdb: ST380021A, ATA DISK drive
blk: queue c01420e0, I/O limit 4095Mb (mask 0xffffffff)
blk: queue c014221c, I/O limit 4095Mb (mask 0xffffffff)
hdc: ST380021A, ATA DISK drive
hdd: SAMSUNG SP1604N, ATA DISK drive
blk: queue c0142534, I/O limit 4095Mb (mask 0xffffffff)
blk: queue c0142670, I/O limit 4095Mb (mask 0xffffffff)
hde: Maxtor 6Y160P0, ATA DISK drive
hdf: ST380021A, ATA DISK drive
blk: queue c0142988, I/O limit 4095Mb (mask 0xffffffff)
blk: queue c0142ac4, I/O limit 4095Mb (mask 0xffffffff)
hdg: ST380021A, ATA DISK drive
blk: queue c0142ddc, I/O limit 4095Mb (mask 0xffffffff)
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
ide1 at 0x170-0x177,0x376 on irq 15
ide2 at 0x1c00-0x1c07,0xb002 on irq 10
ide3 at 0x1400-0x1407,0xb802 on irq 10
hda: attached ide-disk driver.
hda: host protected area => 1
hda: 40031712 sectors (20496 MB) w/2048KiB Cache, CHS=2491/255/63, UDMA(100)
hdb: attached ide-disk driver.
hdb: host protected area => 1
hdb: 156301488 sectors (80026 MB) w/2048KiB Cache, CHS=9729/255/63, UDMA(100)
hdc: attached ide-disk driver.
hdc: host protected area => 1
hdc: 156301488 sectors (80026 MB) w/2048KiB Cache, CHS=155061/16/63, UDMA(100)
hdd: attached ide-disk driver.
hdd: host protected area => 1
hdd: 312581808 sectors (160042 MB) w/2048KiB Cache, CHS=19457/255/63, UDMA(100)
hde: attached ide-disk driver.
hde: host protected area => 1
hde: 320173056 sectors (163929 MB) w/7936KiB Cache, CHS=19929/255/63, UDMA(100)
hdf: attached ide-disk driver.
hdf: host protected area => 1
hdf: 156301488 sectors (80026 MB) w/2048KiB Cache, CHS=155061/16/63, UDMA(100)
hdg: attached ide-disk driver.
hdg: host protected area => 1
hdg: 156301488 sectors (80026 MB) w/2048KiB Cache, CHS=155061/16/63, UDMA(100)
Partition check:
 /dev/ide/host0/bus0/target0/lun0: p1 p2 < p5 p6 p7 >
 /dev/ide/host0/bus0/target1/lun0: p1
 /dev/ide/host0/bus1/target0/lun0: [PTBL] [9729/255/63] p1
 /dev/ide/host0/bus1/target1/lun0: p1
 /dev/ide/host2/bus0/target0/lun0: p1
 /dev/ide/host2/bus0/target1/lun0: p1
 /dev/ide/host2/bus1/target0/lun0: p1
SCSI subsystem driver Revision: 1.00
scsi0 : Adaptec AIC7XXX EISA/VLB/PCI SCSI HBA DRIVER, Rev 6.2.36
        <Adaptec 2940 Ultra SCSI adapter>
        aic7880: Ultra Wide Channel A, SCSI Id=7, 16/253 SCBs

blk: queue c2261794, I/O limit 4095Mb (mask 0xffffffff)
(scsi0:A:0): 40.000MB/s transfers (20.000MHz, offset 8, 16bit)
  Vendor: FUJITSU   Model: MAG3091LP         Rev: 5210
  Type:   Direct-Access                      ANSI SCSI revision: 02
blk: queue c2261894, I/O limit 4095Mb (mask 0xffffffff)
(scsi0:A:1): 40.000MB/s transfers (20.000MHz, offset 8, 16bit)
  Vendor: FUJITSU   Model: MAG3091LP         Rev: 5210
  Type:   Direct-Access                      ANSI SCSI revision: 02
blk: queue c2261b94, I/O limit 4095Mb (mask 0xffffffff)
scsi0:A:0:0: Tagged Queuing enabled.  Depth 32
scsi0:A:1:0: Tagged Queuing enabled.  Depth 32
Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
Attached scsi disk sdb at scsi0, channel 0, id 1, lun 0
SCSI device sda: 17827698 512-byte hdwr sectors (9128 MB)
 /dev/scsi/host0/bus0/target0/lun0: p1
SCSI device sdb: 17827698 512-byte hdwr sectors (9128 MB)
 /dev/scsi/host0/bus0/target1/lun0: p1
Initializing Cryptographic API
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 16384 buckets, 128Kbytes
TCP: Hash tables configured (established 262144 bind 65536)
ip_conntrack version 2.1 (8192 buckets, 65536 max) - 292 bytes per conntrack
ip_tables: (C) 2000-2002 Netfilter core team
ipt_recent v0.3.1: Stephen Frost <sfrost@snowman.net>.  http://snowman.net/projects/ipt_recent/
arp_tables: (C) 2002 David S. Miller
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
Mounted devfs on /dev
Freeing unused kernel memory: 2780k freed
grsec: mount /proc to /proc by (mount:6908) UID(0) EUID(0), parent (initlog:12174) UID(0) EUID(0)
grsec: time set by (hwclock:14862) UID(0) EUID(0), parent (rc.sysinit:8230) UID(0) EUID(0)
Adding Swap: 530104k swap-space (priority -1)
grsec: mount /dev/hda1 to / by (mount:8738) UID(0) EUID(0), parent (initlog:4719) UID(0) EUID(0)
EXT2-fs warning (device ide0(3,7)): ext2_read_super: mounting ext3 filesystem as ext2

grsec: mount /dev/hda7 to /home by (mount:10266) UID(0) EUID(0), parent (initlog:8653) UID(0) EUID(0)
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device ide0(3,6)) ...
for (ide0(3,6))
ide0(3,6):Using r5 hash to sort names
grsec: mount /dev/hda6 to /var by (mount:10266) UID(0) EUID(0), parent (initlog:8653) UID(0) EUID(0)
grsec: mount none to /dev/shm by (mount:10266) UID(0) EUID(0), parent (initlog:8653) UID(0) EUID(0)
grsec: mount none to /dev/pts by (mount:10266) UID(0) EUID(0), parent (initlog:8653) UID(0) EUID(0)
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device ide0(3,65)) ...
for (ide0(3,65))
ide0(3,65):Using r5 hash to sort names
grsec: mount /dev/hdb1 to /b by (mount:10266) UID(0) EUID(0), parent (initlog:8653) UID(0) EUID(0)
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device ide1(22,1)) ...
for (ide1(22,1))
ide1(22,1):Using r5 hash to sort names
grsec: mount /dev/hdc1 to /c by (mount:10266) UID(0) EUID(0), parent (initlog:8653) UID(0) EUID(0)
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device ide1(22,65)) ...
for (ide1(22,65))
ide1(22,65):Using r5 hash to sort names
grsec: mount /dev/hdd1 to /d by (mount:10266) UID(0) EUID(0), parent (initlog:8653) UID(0) EUID(0)
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device ide2(33,1)) ...
for (ide2(33,1))
ide2(33,1):Using r5 hash to sort names
grsec: mount /dev/hde1 to /e by (mount:10266) UID(0) EUID(0), parent (initlog:8653) UID(0) EUID(0)
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device ide2(33,65)) ...
for (ide2(33,65))
ide2(33,65):Using r5 hash to sort names
grsec: mount /dev/hdf1 to /f by (mount:10266) UID(0) EUID(0), parent (initlog:8653) UID(0) EUID(0)
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device ide3(34,1)) ...
for (ide3(34,1))
ide3(34,1):Using r5 hash to sort names
grsec: mount /dev/hdg1 to /g by (mount:10266) UID(0) EUID(0), parent (initlog:8653) UID(0) EUID(0)
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device sd(8,1)) ...
for (sd(8,1))
sd(8,1):Using r5 hash to sort names
grsec: mount /dev/scsi/host0/bus0/target0/l to /0 by (mount:10266) UID(0) EUID(0), parent (initlog:8653) UID(0) EUID(0)
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device sd(8,17)) ...
for (sd(8,17))
sd(8,17):Using r5 hash to sort names
grsec: mount /dev/scsi/host0/bus0/target1/l to /1 by (mount:10266) UID(0) EUID(0), parent (initlog:8653) UID(0) EUID(0)
eth0: link up, 100Mbps, full-duplex, lpa 0x45E1
eth1: link up, 100Mbps, full-duplex, lpa 0x45E1
blk: queue c01420e0, I/O limit 4095Mb (mask 0xffffffff)
blk: queue c014221c, I/O limit 4095Mb (mask 0xffffffff)
blk: queue c0142534, I/O limit 4095Mb (mask 0xffffffff)
blk: queue c0142670, I/O limit 4095Mb (mask 0xffffffff)
blk: queue c0142988, I/O limit 4095Mb (mask 0xffffffff)
blk: queue c0142ac4, I/O limit 4095Mb (mask 0xffffffff)
blk: queue c0142ddc, I/O limit 4095Mb (mask 0xffffffff)
grsec: From 10.0.1.4: signal 7 sent to (imapd:30941) UID(501) EUID(501), parent (master:3464) UID(501) EUID(501)
grsec: From 10.0.1.4: attempted resource overstep by requesting 4096 for RLIMIT_CORE against limit 0 by (imapd:30941) UID(501) EUID(501), parent (master:3464) UID(501) EUID(501)
grsec: From 10.0.1.2: signal 7 sent to (imapd:1294) UID(501) EUID(501), parent (master:23318) UID(501) EUID(501)
grsec: From 10.0.1.2: attempted resource overstep by requesting 4096 for RLIMIT_CORE against limit 0 by (imapd:1294) UID(501) EUID(501), parent (master:23318) UID(501) EUID(501)
grsec: From 10.0.1.2: signal 7 sent to (imapd:5216) UID(501) EUID(501), parent (master:23318) UID(501) EUID(501)
grsec: From 10.0.1.2: attempted resource overstep by requesting 4096 for RLIMIT_CORE against limit 0 by (imapd:5216) UID(501) EUID(501), parent (master:23318) UID(501) EUID(501)
grsec: From 10.0.1.4: signal 7 sent to (imapd:16188) UID(501) EUID(501), parent (master:23318) UID(501) EUID(501)
grsec: From 10.0.1.4: attempted resource overstep by requesting 4096 for RLIMIT_CORE against limit 0 by (imapd:16188) UID(501) EUID(501), parent (master:23318) UID(501) EUID(501)
grsec: From 10.0.1.4: signal 7 sent to (imapd:17957) UID(501) EUID(501), parent (master:23318) UID(501) EUID(501)
grsec: From 10.0.1.4: attempted resource overstep by requesting 4096 for RLIMIT_CORE against limit 0 by (imapd:17957) UID(501) EUID(501), parent (master:23318) UID(501) EUID(501)
grsec: From 10.0.1.4: signal 7 sent to (imapd:4475) UID(501) EUID(501), parent (master:23318) UID(501) EUID(501)
grsec: From 10.0.1.4: attempted resource overstep by requesting 4096 for RLIMIT_CORE against limit 0 by (imapd:4475) UID(501) EUID(501), parent (master:23318) UID(501) EUID(501)
grsec: From 10.0.1.4: signal 7 sent to (imapd:14815) UID(501) EUID(501), parent (master:23318) UID(501) EUID(501)
grsec: From 10.0.1.4: attempted resource overstep by requesting 4096 for RLIMIT_CORE against limit 0 by (imapd:14815) UID(501) EUID(501), parent (master:23318) UID(501) EUID(501)
grsec: From 10.0.1.4: signal 7 sent to (imapd:31585) UID(501) EUID(501), parent (master:23318) UID(501) EUID(501)
grsec: From 10.0.1.4: attempted resource overstep by requesting 4096 for RLIMIT_CORE against limit 0 by (imapd:31585) UID(501) EUID(501), parent (master:23318) UID(501) EUID(501)
ide0(3,6):vs-13060: reiserfs_update_sd: stat data of object [87648 668456 0x0 SD] (nlink == 1) not found (pos 31)
ide0(3,6):vs-13060: reiserfs_update_sd: stat data of object [87648 668456 0x0 SD] (nlink == 1) not found (pos 31)
ide0(3,6):vs-5355: reiserfs_delete_solid_item: [87648 668456 0x0 SD] not found
grsec: time set by (ntpdate:7914) UID(0) EUID(0), parent (crond:4488) UID(0) EUID(0)

--------------060204000004080008090208--

