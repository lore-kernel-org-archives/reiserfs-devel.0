From: ivan <ivan@t1.unisoftbg.com>
Subject: Re: production use of reiserfs
Date: Fri, 28 Nov 2003 12:42:18 +0200
Message-ID: <200311281242.18139.ivan@t1.unisoftbg.com>
References: <200311280846.12697.ivan@t1.unisoftbg.com> <16327.6650.487369.786012@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16176-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16327.6650.487369.786012@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list@namesys.com

Hi ,
Thanks for the answer!.

It is the info.
I hope it is all that I have.
And it is from the last crashed system.

/etc/fstat:

/dev/hda2               /                       reiserfs defaults        =
1 1
/dev/hda1               /boot                   reiserfs defaults        =
1 2
none                    /dev/pts                devpts  gid=3D5,mode=3D62=
0  0 0
none                    /proc                   proc    defaults        0=
 0
none                    /dev/shm                tmpfs   defaults        0=
 0
/dev/hda3               swap                    swap    defaults        0=
 0
/dev/hdc2               /mnt/diske              reiserfs defaults        =
1 2



[root@tp1 root]# dmesg
Linux version 2.4.20-8 (bhcompile@porky.devel.redhat.com) (gcc version 3.=
2.2=20
20030222 (Red Hat Linux 3.2.2-5)) #1 Thu Mar 13 17:54:28 EST 2003
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 00000000000a0000 (usable)
 BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000001ffeb000 (usable)
 BIOS-e820: 000000001ffeb000 - 000000001ffef000 (ACPI data)
 BIOS-e820: 000000001ffef000 - 000000001ffff000 (reserved)
 BIOS-e820: 000000001ffff000 - 0000000020000000 (ACPI NVS)
 BIOS-e820: 00000000fff80000 - 0000000100000000 (reserved)
0MB HIGHMEM available.
511MB LOWMEM available.
On node 0 totalpages: 131051
zone(0): 4096 pages.
zone(1): 126955 pages.
zone(2): 0 pages.
Kernel command line: ro root=3D/dev/hda2
Initializing CPU#0
Detected 938.034 MHz processor.
Console: colour VGA+ 80x25
Calibrating delay loop... 1874.32 BogoMIPS
Memory: 511304k/524204k available (1347k kernel code, 10340k reserved, 99=
9k=20
data, 132k init, 0k highmem)
Dentry cache hash table entries: 65536 (order: 7, 524288 bytes)
Inode cache hash table entries: 32768 (order: 6, 262144 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
CPU: L1 I cache: 16K, L1 D cache: 16K
CPU: L2 cache: 256K
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
CPU:     After generic, caps: 0383f9ff 00000000 00000000 00000000
CPU:             Common caps: 0383f9ff 00000000 00000000 00000000
CPU: Intel Pentium III (Coppermine) stepping 06
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
mtrr: v1.40 (20010327) Richard Gooch (rgooch@atnf.csiro.au)
mtrr: detected mtrr type: Intel
PCI: PCI BIOS revision 2.10 entry at 0xf0df0, last bus=3D2
PCI: Using configuration type 1
PCI: Probing PCI hardware
Transparent bridge - Intel Corp. 82801BA/CA/DB PCI Bridge
PCI: Using IRQ router PIIX [8086/2440] at 00:1f.0
isapnp: Scanning for PnP cards...
isapnp: No Plug & Play device found
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16)
Starting kswapd
VFS: Disk quotas vdquot_6.5.1
Detected PS/2 Mouse Port.
pty: 2048 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS MULTIPORT SHARE_=
IRQ=20
SERIAL_PCI ISAPNP enabled
Real Time Clock Driver v1.10e
Floppy drive(s): fd0 is 1.44M
FDC 0 is a post-1991 82077
NET4: Frame Diverter 0.46
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Uniform Multi-Platform E-IDE driver Revision: 7.00beta-2.4
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=3D=
xx
ICH2: IDE controller at PCI slot 00:1f.1
ICH2: chipset revision 2
ICH2: not 100% native mode: will probe irqs later
    ide0: BM-DMA at 0xb800-0xb807, BIOS settings: hda:DMA, hdb:pio
    ide1: BM-DMA at 0xb808-0xb80f, BIOS settings: hdc:DMA, hdd:pio
hda: MAXTOR 6L040J2, ATA DISK drive
blk: queue c03c9f40, I/O limit 4095Mb (mask 0xffffffff)
hdc: Maxtor 2B020H1, ATA DISK drive
blk: queue c03ca3a0, I/O limit 4095Mb (mask 0xffffffff)
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
ide1 at 0x170-0x177,0x376 on irq 15
hda: host protected area =3D> 1
hda: 78177792 sectors (40027 MB) w/1818KiB Cache, CHS=3D4866/255/63, UDMA=
(33)
hdc: host protected area =3D> 1
hdc: 40020624 sectors (20491 MB) w/2048KiB Cache, CHS=3D39703/16/63, UDMA=
(100)
ide-floppy driver 0.99.newide
Partition check:
 hda: hda1 hda2 hda3
 hdc: [PTBL] [2491/255/63] hdc1 hdc2 hdc3
ide-floppy driver 0.99.newide
md: md driver 0.90.0 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
Linux IP multicast router 0.06 plus PIM-SM
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
RAMDISK: Compressed image found at block 0
Freeing initrd memory: 179k freed
VFS: Mounted root (ext2 filesystem).
reiserfs: checking transaction log (device 03:02) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
Freeing unused kernel memory: 132k freed
Adding Swap: 1020116k swap-space (priority -1)
reiserfs: checking transaction log (device 03:01) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 16:02) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
ip_tables: (C) 2000-2002 Netfilter core team
8139too Fast Ethernet driver 0.9.26
PCI: Found IRQ 4 for device 02:0d.0
divert: allocating divert_blk for eth0
eth0: RealTek RTL8139 Fast Ethernet at 0xe0ada000, 00:c0:26:25:7b:30, IRQ=
 4
eth0:  Identified 8139 chip type 'RTL-8139C'
eth0: Setting 100mbps full-duplex based on auto-negotiated partner abilit=
y=20
45e1.
lp: driver loaded but no devices found


[root@tp1 root]# cat /proc/version
Linux version 2.4.20-8 (bhcompile@porky.devel.redhat.com) (gcc version 3.=
2.2=20
20030222 (Red Hat Linux 3.2.2-5)) #1 Thu Mar 13 17:54:28 EST 2003



On Friday 28 November 2003 11:48 am, Nikita Danilov wrote:
> ivan writes:
>  > Hi all,
>
> Hello,
>
>  > We are collecting our statistic for the last 9 m. of using linux +
>  > postgreSQL as oracle+windows alternative in production.
>  >
>  > We are using linux redhat (7.3 and 9.0) + reiserfs (it was recomende=
t as
>  > stable and fast).
>  >
>  > For this time we have 6 filesystem crashes (all after powerdown) wit=
h
>  > total database lose.
>  >
>  > It is very bad situation because for this period we do not have any
>  > problems with windows + oracle.
>
> Please provide more info: kernel messages, mount options, kernel versio=
n
> (cat /proc/version), reiserfs-related portion of kernel .config, etc.
>
>  > So it is now time to see if resierfs is production ready or we need =
to
>  > change the filesystem (or OS distro).
>  >
>  > My question:
>  >
>  > exist somewath special in reiserfs setup on redhat, that we need to
>  > change? We are using the standart install (linux reiserfs).
>  >
>  > We do not make changes on kernel or setup.
>  >
>  > Is it good idea to change redhat?
>  >
>  > Also it is possible to use redhat AS 3.0, but we do not find any inf=
o
>  > how to instsall it with reiserfs. Exist any problems on this distro?
>
> It is much easier for us to track and deal with problems in the stock
> kernel, but look at the http://www.namesys.com/support.html :)

I readet it, but it is for problems.
I can not figure exactly my problem.
It is not one time crash.

I am searching info to know if reiserfs is production ready.
And also to know if exists any problems in redhat implementation for reis=
erfs.

>
>  > regards,
>  > ivan.
>
> Nikita.

regards,
ivan.
