From: Voicu Liviu <liviu.voicu@huji.ac.il>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 14:54:22 +0200
Message-ID: <200302281454.22600.liviu.voicu@huji.ac.il>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281442.06876.liviu.voicu@huji.ac.il> <20030228134531.E24291@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12990-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030228134531.E24291@humilis>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

> cat /proc/cpuinfo

$ cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 1
model name      : Intel(R) Pentium(R) 4 CPU 1.50GHz
stepping        : 2
cpu MHz         : 1495.561
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca=
=20
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm
bogomips        : 2949.12

> cat /proc/meminfo

 $  cat /proc/meminfo
        total:    used:    free:  shared: buffers:  cached:
Mem:  262090752 258859008  3231744        0 27267072 122875904
Swap: 526409728   147456 526262272
MemTotal:       255948 kB
MemFree:          3156 kB
MemShared:           0 kB
Buffers:         26628 kB
Cached:         119996 kB
SwapCached:          0 kB
Active:          59220 kB
Inactive:       121724 kB
HighTotal:           0 kB
HighFree:            0 kB
LowTotal:       255948 kB
LowFree:          3156 kB
SwapTotal:      514072 kB
SwapFree:       513928 kB

> hdparm /dev/hda

# hdparm /dev/hda

/dev/hda:
 multcount    =3D 16 (on)
 IO_support   =3D  1 (32-bit)
 unmaskirq    =3D  1 (on)
 using_dma    =3D  1 (on)
 keepsettings =3D  0 (off)
 readonly     =3D  0 (off)
 readahead    =3D  8 (on)
 geometry     =3D 4865/255/63, sectors =3D 78165360, start =3D 0


> dmesg

Linux version 2.4.20-ck3 (root@starshooter.huji.ac.il) (gcc version 3.2.2) =
#1=20
Thu Feb 27 22:09:05 IST 2003
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
 BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000e0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000000ffc0000 (usable)
 BIOS-e820: 000000000ffc0000 - 000000000fff8000 (ACPI data)
 BIOS-e820: 000000000fff8000 - 0000000010000000 (ACPI NVS)
 BIOS-e820: 00000000fec00000 - 00000000fec01000 (reserved)
 BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
 BIOS-e820: 00000000ffb80000 - 00000000ffc00000 (reserved)
 BIOS-e820: 00000000fff00000 - 0000000100000000 (reserved)
255MB LOWMEM available.
ACPI: have wakeup address 0xc0001000
On node 0 totalpages: 65472
zone(0): 4096 pages.
zone(1): 61376 pages.
zone(2): 0 pages.
ACPI: RSDP (v000 AMI                        ) @ 0x000ff980
ACPI: RSDT (v001 D850MV MV85010A 08193.04113) @ 0x0fff0000
ACPI: FADT (v001 D850MV MV85010A 08193.04113) @ 0x0fff1000
ACPI: MADT (v001 D850MV MV85010A 08193.04113) @ 0x0ffe2f45
ACPI: DSDT (v001 D850MV MV85010A 00000.00003) @ 0x00000000
ACPI: BIOS passes blacklist
ACPI: Local APIC address 0xfee00000
ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
Processor #0 Unknown CPU [15:1] APIC version 16
ACPI: LAPIC_NMI (acpi_id[0x01] polarity[0x0] trigger[0x0] lint[0x1])
ACPI: IOAPIC (id[0x01] address[0xfec00000] global_irq_base[0x0])
IOAPIC[0]: Assigned apic_id 1
IOAPIC[0]: apic_id 1, version 32, address 0xfec00000, IRQ 0-23
ACPI: INT_SRC_OVR (bus[0] irq[0x9] global_irq[0x9] polarity[0x1] trigger[0x=
3])
ACPI: INT_SRC_OVR (bus[0] irq[0x0] global_irq[0x2] polarity[0x0] trigger[0x=
0])
Using ACPI (MADT) for SMP configuration information
Kernel command line: root=3D/dev/hda2 vga=3D0x318 hdd=3Dide-scsi
Initializing CPU#0
Detected 1495.561 MHz processor.
Console: colour dummy device 80x25
Calibrating delay loop... 2949.12 BogoMIPS
Memory: 255780k/261888k available (1822k kernel code, 5720k reserved, 610k=
=20
data, 168k init, 0k highmem)
Dentry cache hash table entries: 32768 (order: 6, 262144 bytes)
Inode cache hash table entries: 16384 (order: 5, 131072 bytes)
Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
Buffer-cache hash table entries: 16384 (order: 4, 65536 bytes)
Page-cache hash table entries: 65536 (order: 6, 262144 bytes)
CPU: L1 I cache: 0K, L1 D cache: 8K
CPU: L2 cache: 256K
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
CPU:     After generic, caps: 3febfbff 00000000 00000000 00000000
CPU:             Common caps: 3febfbff 00000000 00000000 00000000
CPU: Intel(R) Pentium(R) 4 CPU 1.50GHz stepping 02
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
enabled ExtINT on CPU#0
ESR value before enabling vector: 00000000
ESR value after enabling vector: 00000000
ENABLING IO-APIC IRQs
init IO_APIC IRQs
 IO-APIC (apicid-pin) 1-0, 1-16, 1-17, 1-18, 1-19, 1-20, 1-21, 1-22, 1-23 n=
ot=20
connected.
=2E.TIMER: vector=3D0x31 pin1=3D2 pin2=3D0
number of MP IRQ sources: 16.
number of IO-APIC #1 registers: 24.
testing the IO APIC.......................

IO APIC #1......
=2E... register #00: 01000000
=2E......    : physical APIC id: 01
=2E... register #01: 00178020
=2E......     : max redirection entries: 0017
=2E......     : PRQ implemented: 1
=2E......     : IO APIC version: 0020
=2E... register #02: 00000000
=2E......     : arbitration: 00
=2E... IRQ redirection table:
 NR Log Phy Mask Trig IRR Pol Stat Dest Deli Vect:  =20
 00 000 00  1    0    0   0   0    0    0    00
 01 001 01  0    0    0   0   0    1    1    39
 02 001 01  0    0    0   0   0    1    1    31
 03 001 01  0    0    0   0   0    1    1    41
 04 001 01  0    0    0   0   0    1    1    49
 05 001 01  0    0    0   0   0    1    1    51
 06 001 01  0    0    0   0   0    1    1    59
 07 001 01  0    0    0   0   0    1    1   =20
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+X1v+czD4Ii52ssMRAl3EAJ0ZQddD4oJM5jp+EUAKMdXh85mbrQCfQI3Q
nGl+j6p45NPiZlST2PTPTi0=3D
=3DIFFf
=2D----END PGP SIGNATURE-----

