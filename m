From: "Juan Fco. Giordana" <juangiordana@gmail.com>
Subject: bug on reiserfs
Date: Fri, 19 Dec 2008 23:16:44 -0200
Message-ID: <494C477C.3060803@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020501020706000607010006"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type;
        bh=ZADYyaI1v1OFI0iUx9OR/4lstOemoI1gZejImJO1pEI=;
        b=vmJX7856d0QuA51CTIlDyM1QrNSQ+23xCtKAjir0hRiqvl38/poVEEffxhD2Vl+AqW
         4tuRzxaeDgHqP+EfYehojaXRyeUKRb9TSzfhId7SrdpVEYslpcrBC48iywwO4EpUqWvo
         rLoCVVurwlYzcb0Wy8SofYwv7QtoDgTevYdy8=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: torque@ukrpost.net
Cc: reiserfs-dev@namesys.com, reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------020501020706000607010006
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Actually I don't know if somebody will get this email, but I'll try this 
anyway. I couldn't find a place to report this bug

Try to ./configure  php-5.2.8 on a reiserfs partition formated with
'mkreiserfs -b 1024' and mounted as 'notai,noatime'.

Doing this as root will *hang* the system on this configure step:

"checking whether pwrite works..."

Watch the load average grow.

Attached is what I was able to catch. I also had similar problems after 
rebooting withoud doing anything.

On an ext3 partition or a reiserfs partition formated with a 4096 block 
size and it worked fine.

Regards

--------------020501020706000607010006
Content-Type: text/plain;
 name="oops.txt"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="oops.txt"

Initializing cgroup subsys cpuset
Initializing cgroup subsys cpu
Linux version 2.6.27-gentoo-r5 (root@shadow) (gcc version 4.3.2 (Gentoo 4.3.2 p1.2) ) #5 SMP Mon Dec 15 19:50:28 ARST 2008
Command line: root=/dev/sda6 video=uvesafb:mtrr:3,ywrap,1680x1050-32@60
KERNEL supported cpus:
  Intel GenuineIntel
  AMD AuthenticAMD
  Centaur CentaurHauls
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009c000 (usable)
 BIOS-e820: 000000000009c000 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000e0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000007ebc1000 (usable)
 BIOS-e820: 000000007ebc1000 - 000000007ec44000 (ACPI NVS)
 BIOS-e820: 000000007ec44000 - 000000007fdd8000 (usable)
 BIOS-e820: 000000007fdd8000 - 000000007fdda000 (reserved)
 BIOS-e820: 000000007fdda000 - 000000007fe90000 (usable)
 BIOS-e820: 000000007fe90000 - 000000007fee5000 (ACPI NVS)
 BIOS-e820: 000000007fee5000 - 000000007fee6000 (usable)
 BIOS-e820: 000000007fee6000 - 000000007fef2000 (ACPI data)
 BIOS-e820: 000000007fef2000 - 000000007fef3000 (usable)
 BIOS-e820: 000000007fef3000 - 000000007feff000 (ACPI data)
 BIOS-e820: 000000007feff000 - 000000007ff00000 (usable)
 BIOS-e820: 000000007ff00000 - 0000000080000000 (reserved)
 BIOS-e820: 00000000f0000000 - 00000000f8000000 (reserved)
 BIOS-e820: 00000000ffe00000 - 0000000100000000 (reserved)
DMI 2.4 present.
last_pfn = 0x7ff00 max_arch_pfn = 0x3ffffffff
init_memory_mapping
 0000000000 - 007fe00000 page 2M
 007fe00000 - 007ff00000 page 4k
kernel direct mapping tables up to 7ff00000 @ 8000-c000
last_map_addr: 7ff00000 end: 7ff00000
ACPI: RSDP 000FE020, 0014 (r0 INTEL )
ACPI: RSDT 7FEFD038, 0068 (r1 INTEL  DX38BT        5F1       1000013)
ACPI: FACP 7FEFC000, 0074 (r1 INTEL  DX38BT        5F1 MSFT  1000013)
ACPI: DSDT 7FEF7000, 4076 (r1 INTEL  DX38BT        5F1 MSFT  1000013)
ACPI: FACS 7FE9F000, 0040
ACPI: APIC 7FEF6000, 0078 (r1 INTEL  DX38BT        5F1 MSFT  1000013)
ACPI: WDDT 7FEF5000, 0040 (r1 INTEL  DX38BT        5F1 MSFT  1000013)
ACPI: MCFG 7FEF4000, 003C (r1 INTEL  DX38BT        5F1 MSFT  1000013)
ACPI: ASF! 7FEF3000, 00A6 (r32 INTEL  DX38BT        5F1 MSFT  1000013)
ACPI: DMAR 7FEF1000, 0120 (r1 INTEL  DX38BT        5F1 MSFT  1000013)
ACPI: SSDT 7FEEE000, 0204 (r1 INTEL     CpuPm      5F1 MSFT  1000013)
ACPI: SSDT 7FEED000, 01F9 (r1 INTEL   Cpu0Ist      5F1 MSFT  1000013)
ACPI: SSDT 7FEEC000, 01F9 (r1 INTEL   Cpu1Ist      5F1 MSFT  1000013)
ACPI: SSDT 7FEEB000, 01F9 (r1 INTEL   Cpu2Ist      5F1 MSFT  1000013)
ACPI: SSDT 7FEEA000, 01F9 (r1 INTEL   Cpu3Ist      5F1 MSFT  1000013)
ACPI: SSDT 7FEE9000, 01CF (r1 INTEL   Cpu0Cst      5F1 MSFT  1000013)
ACPI: SSDT 7FEE8000, 01CF (r1 INTEL   Cpu1Cst      5F1 MSFT  1000013)
ACPI: SSDT 7FEE7000, 01CF (r1 INTEL   Cpu2Cst      5F1 MSFT  1000013)
ACPI: SSDT 7FEE6000, 01CF (r1 INTEL   Cpu3Cst      5F1 MSFT  1000013)
ACPI: WDTT 7FEEF000, 02CC (r1 INTEL  DX38BT        5F1 MSFT  1000013)
ACPI: ASPT 7FEF0000, 002C (r1 INTEL  PerfTune      5F1 MSFT  1000013)
No NUMA configuration found
Faking a node at 0000000000000000-000000007ff00000
Bootmem setup node 0 0000000000000000-000000007ff00000
  NODE_DATA [0000000000001000 - 0000000000004fff]
  bootmap [000000000000a000 -  0000000000019fdf] pages 10
(5 early reservations) ==> bootmem [0000000000 - 007ff00000]
  #0 [0000000000 - 0000001000]   BIOS data page ==> [0000000000 - 0000001000]
  #1 [0000006000 - 0000008000]       TRAMPOLINE ==> [0000006000 - 0000008000]
  #2 [0000200000 - 000074fcbc]    TEXT DATA BSS ==> [0000200000 - 000074fcbc]
  #3 [000009c000 - 0000100000]    BIOS reserved ==> [000009c000 - 0000100000]
  #4 [0000008000 - 000000a000]          PGTABLE ==> [0000008000 - 000000a000]
 [ffffe20000000000-ffffe20001bfffff] PMD -> [ffff880001200000-ffff880002dfffff] on node 0
Zone PFN ranges:
  DMA      0x00000000 -> 0x00001000
  DMA32    0x00001000 -> 0x00100000
  Normal   0x00100000 -> 0x00100000
Movable zone start PFN for each node
early_node_map[7] active PFN ranges
    0: 0x00000000 -> 0x0000009c
    0: 0x00000100 -> 0x0007ebc1
    0: 0x0007ec44 -> 0x0007fdd8
    0: 0x0007fdda -> 0x0007fe90
    0: 0x0007fee5 -> 0x0007fee6
    0: 0x0007fef2 -> 0x0007fef3
    0: 0x0007feff -> 0x0007ff00
On node 0 totalpages: 523690
  DMA zone: 2476 pages, LIFO batch:0
  DMA32 zone: 512585 pages, LIFO batch:31
ACPI: PM-Timer IO Port: 0x408
ACPI: Local APIC address 0xfee00000
ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
ACPI: LAPIC (acpi_id[0x03] lapic_id[0x02] enabled)
ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
ACPI: LAPIC (acpi_id[0x04] lapic_id[0x03] enabled)
ACPI: LAPIC_NMI (acpi_id[0x01] dfl dfl lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x02] dfl dfl lint[0x1])
ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
IOAPIC[0]: apic_id 2, version 0, address 0xfec00000, GSI 0-23
ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
ACPI: IRQ0 used by override.
ACPI: IRQ2 used by override.
ACPI: IRQ9 used by override.
Setting APIC routing to flat
SMP: Allowing 4 CPUs, 0 hotplug CPUs
PM: Registered nosave memory: 000000000009c000 - 00000000000a0000
PM: Registered nosave memory: 00000000000a0000 - 00000000000e0000
PM: Registered nosave memory: 00000000000e0000 - 0000000000100000
PM: Registered nosave memory: 000000007ebc1000 - 000000007ec44000
PM: Registered nosave memory: 000000007fdd8000 - 000000007fdda000
PM: Registered nosave memory: 000000007fe90000 - 000000007fee5000
PM: Registered nosave memory: 000000007fee6000 - 000000007fef2000
PM: Registered nosave memory: 000000007fef3000 - 000000007feff000
Allocating PCI resources starting at 88000000 (gap: 80000000:70000000)
PERCPU: Allocating 45536 bytes of per cpu data
NR_CPUS: 4, nr_cpu_ids: 4, nr_node_ids 1
Built 1 zonelists in Node order, mobility grouping on.  Total pages: 515061
Policy zone: DMA32
Kernel command line: root=/dev/sda6 video=uvesafb:mtrr:3,ywrap,1680x1050-32@60
Initializing CPU#0
PID hash table entries: 4096 (order: 12, 32768 bytes)
TSC: PIT calibration confirmed by PMTIMER.
TSC: using PMTIMER calibration value
Detected 2400.078 MHz processor.
Console: colour VGA+ 80x25
console [tty0] enabled
Checking aperture...
No AGP bridge found
Calgary: detecting Calgary via BIOS EBDA area
Calgary: Unable to locate Rio Grande table in EBDA - bailing!
Memory: 2060160k/2096128k available (3130k kernel code, 34600k reserved, 1393k data, 380k init)
CPA: page pool initialized 1 of 1 pages preallocated
SLUB: Genslabs=13, HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
Calibrating delay loop (skipped), value calculated using timer frequency.. 4800.15 BogoMIPS (lpj=2400078)
Security Framework initialized
Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
Mount-cache hash table entries: 256
Initializing cgroup subsys ns
Initializing cgroup subsys cpuacct
CPU: L1 I cache: 32K, L1 D cache: 32K
CPU: L2 cache: 4096K
CPU 0/0 -> Node 0
CPU: Physical Processor ID: 0
CPU: Processor Core ID: 0
CPU0: Thermal monitoring enabled (TM2)
using mwait in idle threads.
ACPI: Core revision 20080609
..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
CPU0: Intel(R) Core(TM)2 Quad CPU    Q6600  @ 2.40GHz stepping 0b
Using local APIC timer interrupts.
APIC timer calibration result 16667211
Detected 16.667 MHz APIC timer.
Booting processor 1/2 ip 6000
Initializing CPU#1
Calibrating delay using timer specific routine.. 4800.17 BogoMIPS (lpj=2400085)
CPU: L1 I cache: 32K, L1 D cache: 32K
CPU: L2 cache: 4096K
CPU 1/2 -> Node 0
CPU: Physical Processor ID: 0
CPU: Processor Core ID: 2
CPU1: Thermal monitoring enabled (TM2)
CPU1: Intel(R) Core(TM)2 Quad CPU    Q6600  @ 2.40GHz stepping 0b
checking TSC synchronization [CPU#0 -> CPU#1]: passed.
Booting processor 2/1 ip 6000
Initializing CPU#2
Calibrating delay using timer specific routine.. 4800.15 BogoMIPS (lpj=2400079)
CPU: L1 I cache: 32K, L1 D cache: 32K
CPU: L2 cache: 4096K
CPU 2/1 -> Node 0
CPU: Physical Processor ID: 0
CPU: Processor Core ID: 1
CPU2: Thermal monitoring enabled (TM2)
CPU2: Intel(R) Core(TM)2 Quad CPU    Q6600  @ 2.40GHz stepping 0b
checking TSC synchronization [CPU#0 -> CPU#2]: passed.
Booting processor 3/3 ip 6000
Initializing CPU#3
Calibrating delay using timer specific routine.. 4800.16 BogoMIPS (lpj=2400081)
CPU: L1 I cache: 32K, L1 D cache: 32K
CPU: L2 cache: 4096K
CPU 3/3 -> Node 0
CPU: Physical Processor ID: 0
CPU: Processor Core ID: 3
CPU3: Thermal monitoring enabled (TM2)
CPU3: Intel(R) Core(TM)2 Quad CPU    Q6600  @ 2.40GHz stepping 0b
checking TSC synchronization [CPU#0 -> CPU#3]: passed.
Brought up 4 CPUs
Total of 4 processors activated (19200.64 BogoMIPS).
net_namespace: 1160 bytes
Time: 17:47:14  Date: 12/19/08
NET: Registered protocol family 16
No dock devices found.
ACPI: bus type pci registered
PCI: MCFG configuration 0: base f0000000 segment 0 buses 0 - 127
PCI: MCFG area at f0000000 reserved in E820
PCI: Using MMCONFIG at f0000000 - f7ffffff
PCI: Using configuration type 1 for base access
ACPI: EC: Look up EC in DSDT
ACPI: Interpreter enabled
ACPI: (supports S0 S1 S3 S4 S5)
ACPI: Using IOAPIC for interrupt routing
ACPI: PCI Root Bridge [PCI0] (0000:00)
pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
pci 0000:00:01.0: PME# disabled
PCI: 0000:00:19.0 reg 10 32bit mmio: [90300000, 9031ffff]
PCI: 0000:00:19.0 reg 14 32bit mmio: [90324000, 90324fff]
PCI: 0000:00:19.0 reg 18 io port: [4400, 441f]
pci 0000:00:19.0: PME# supported from D0 D3hot D3cold
pci 0000:00:19.0: PME# disabled
PCI: 0000:00:1a.0 reg 20 io port: [40e0, 40ff]
PCI: 0000:00:1a.1 reg 20 io port: [40c0, 40df]
PCI: 0000:00:1a.2 reg 20 io port: [40a0, 40bf]
PCI: 0000:00:1a.7 reg 10 32bit mmio: [90325c00, 90325fff]
pci 0000:00:1a.7: PME# supported from D0 D3hot D3cold
pci 0000:00:1a.7: PME# disabled
PCI: 0000:00:1b.0 reg 10 64bit mmio: [90320000, 90323fff]
pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
pci 0000:00:1b.0: PME# disabled
pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.0: PME# disabled
pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.4: PME# disabled
PCI: 0000:00:1d.0 reg 20 io port: [4080, 409f]
PCI: 0000:00:1d.1 reg 20 io port: [4060, 407f]
PCI: 0000:00:1d.2 reg 20 io port: [4040, 405f]
PCI: 0000:00:1d.7 reg 10 32bit mmio: [90325800, 90325bff]
pci 0000:00:1d.7: PME# supported from D0 D3hot D3cold
pci 0000:00:1d.7: PME# disabled
pci 0000:00:1f.0: Force enabled HPET at 0xfed00000
pci 0000:00:1f.0: quirk: region 0400-047f claimed by ICH6 ACPI/GPIO/TCO
pci 0000:00:1f.0: quirk: region 0500-053f claimed by ICH6 GPIO
PCI: 0000:00:1f.2 reg 10 io port: [4428, 442f]
PCI: 0000:00:1f.2 reg 14 io port: [4434, 4437]
PCI: 0000:00:1f.2 reg 18 io port: [4420, 4427]
PCI: 0000:00:1f.2 reg 1c io port: [4430, 4433]
PCI: 0000:00:1f.2 reg 20 io port: [4020, 403f]
PCI: 0000:00:1f.2 reg 24 32bit mmio: [90325000, 903257ff]
pci 0000:00:1f.2: PME# supported from D3hot
pci 0000:00:1f.2: PME# disabled
PCI: 0000:00:1f.3 reg 10 64bit mmio: [90326000, 903260ff]
PCI: 0000:00:1f.3 reg 20 io port: [4000, 401f]
PCI: 0000:01:00.0 reg 10 64bit mmio: [80000000, 8fffffff]
PCI: 0000:01:00.0 reg 18 64bit mmio: [90200000, 9020ffff]
PCI: 0000:01:00.0 reg 20 io port: [3000, 30ff]
PCI: 0000:01:00.0 reg 30 32bit mmio: [fffe0000, ffffffff]
pci 0000:01:00.0: supports D1
pci 0000:01:00.0: supports D2
PCI: 0000:01:00.1 reg 10 64bit mmio: [90210000, 90213fff]
pci 0000:01:00.1: supports D1
pci 0000:01:00.1: supports D2
PCI: bridge 0000:00:01.0 io port: [3000, 3fff]
PCI: bridge 0000:00:01.0 32bit mmio: [90200000, 902fffff]
PCI: bridge 0000:00:01.0 64bit mmio pref: [80000000, 8fffffff]
PCI: bridge 0000:00:1c.0 32bit mmio: [90400000, 904fffff]
PCI: 0000:03:00.0 reg 10 io port: [2018, 201f]
PCI: 0000:03:00.0 reg 14 io port: [2024, 2027]
PCI: 0000:03:00.0 reg 18 io port: [2010, 2017]
PCI: 0000:03:00.0 reg 1c io port: [2020, 2023]
PCI: 0000:03:00.0 reg 20 io port: [2000, 200f]
PCI: 0000:03:00.0 reg 24 32bit mmio: [90100000, 901003ff]
pci 0000:03:00.0: supports D1
pci 0000:03:00.0: PME# supported from D0 D1 D3hot
pci 0000:03:00.0: PME# disabled
PCI: bridge 0000:00:1c.4 io port: [2000, 2fff]
PCI: bridge 0000:00:1c.4 32bit mmio: [90100000, 901fffff]
PCI: 0000:04:02.0 reg 10 io port: [1000, 10ff]
PCI: 0000:04:02.0 reg 14 32bit mmio: [90004800, 900048ff]
pci 0000:04:02.0: supports D1
pci 0000:04:02.0: supports D2
pci 0000:04:02.0: PME# supported from D1 D2 D3hot D3cold
pci 0000:04:02.0: PME# disabled
PCI: 0000:04:03.0 reg 10 32bit mmio: [90004000, 900047ff]
PCI: 0000:04:03.0 reg 14 32bit mmio: [90000000, 90003fff]
pci 0000:04:03.0: supports D1
pci 0000:04:03.0: supports D2
pci 0000:04:03.0: PME# supported from D0 D1 D2 D3hot
pci 0000:04:03.0: PME# disabled
pci 0000:00:1e.0: transparent bridge
PCI: bridge 0000:00:1e.0 io port: [1000, 1fff]
PCI: bridge 0000:00:1e.0 32bit mmio: [90000000, 900fffff]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P32_._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEX0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEX4._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 7 9 10 *11 12)
ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 7 *9 10 11 12)
ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 7 9 10 *11 12)
ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 7 9 10 *11 12)
ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 7 9 *10 11 12)
ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 7 *9 10 11 12)
ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 7 9 *10 11 12)
ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 7 9 10 *11 12)
Linux Plug and Play Support v0.97 (c) Adam Belay
pnp: PnP ACPI init
ACPI: bus type pnp registered
pnp: PnP ACPI: found 9 devices
ACPI: ACPI bus type pnp unregistered
SCSI subsystem initialized
libata version 3.00 loaded.
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
PCI: Using ACPI for IRQ routing
NetLabel: Initializing
NetLabel:  domain hash size = 128
NetLabel:  protocols = UNLABELED CIPSOv4
NetLabel:  unlabeled traffic allowed by default
DMAR:Host address width 36
DMAR:DRHD (flags: 0x00000000)base: 0x00000000feb00000
DMAR:DRHD (flags: 0x00000000)base: 0x00000000feb01000
DMAR:Device scope device [0000:00:02.00] not found
DMAR:Device scope device [0000:00:02.00] not found
DMAR:Device scope device [0000:00:02.01] not found
DMAR:Device scope device [0000:00:02.01] not found
DMAR:DRHD (flags: 0x00000000)base: 0x00000000feb02000
DMAR:Device scope device [0000:00:03.00] not found
DMAR:Device scope device [0000:00:03.00] not found
DMAR:Device scope device [0000:00:03.02] not found
DMAR:Device scope device [0000:00:03.02] not found
DMAR:Device scope device [0000:00:03.03] not found
DMAR:Device scope device [0000:00:03.03] not found
DMAR:DRHD (flags: 0x00000001)base: 0x00000000feb03000
DMAR:RMRR base: 0x00000000000e0000 end: 0x00000000000effff
DMAR:RMRR base: 0x0000000080000000 end: 0x000000007fffffff
DMAR:Device scope device [0000:00:02.00] not found
DMAR:Device scope device [0000:00:02.00] not found
DMAR:Device scope device [0000:00:02.01] not found
DMAR:Device scope device [0000:00:02.01] not found
IOMMU: Setting identity map for device 0000:00:1d.0 [0xe0000 - 0xf0000]
IOMMU: Setting identity map for device 0000:00:1d.1 [0xe0000 - 0xf0000]
IOMMU: Setting identity map for device 0000:00:1d.2 [0xe0000 - 0xf0000]
IOMMU: Setting identity map for device 0000:00:1d.7 [0xe0000 - 0xf0000]
IOMMU: Setting identity map for device 0000:00:1a.0 [0xe0000 - 0xf0000]
IOMMU: Setting identity map for device 0000:00:1a.1 [0xe0000 - 0xf0000]
IOMMU: Setting identity map for device 0000:00:1a.2 [0xe0000 - 0xf0000]
IOMMU: Setting identity map for device 0000:00:1a.7 [0xe0000 - 0xf0000]
IOMMU: gfx device 0000:01:00.0 1-1 mapping
IOMMU: Setting identity map for device 0000:01:00.0 [0x0 - 0x9c000]
IOMMU: Setting identity map for device 0000:01:00.0 [0x100000 - 0x7ebc1000]
IOMMU: Setting identity map for device 0000:01:00.0 [0x7ec44000 - 0x7fdd8000]
IOMMU: Setting identity map for device 0000:01:00.0 [0x7fdda000 - 0x7fe90000]
IOMMU: Setting identity map for device 0000:01:00.0 [0x7fee5000 - 0x7fee6000]
IOMMU: Setting identity map for device 0000:01:00.0 [0x7fef2000 - 0x7fef3000]
IOMMU: Setting identity map for device 0000:01:00.0 [0x7feff000 - 0x7ff00000]
IOMMU: Prepare 0-16M unity mapping for LPC
IOMMU: Setting identity map for device 0000:00:1f.0 [0x0 - 0x1000000]
PCI-DMA: Intel(R) Virtualization Technology for Directed I/O
PCI-GART: No AMD northbridge found.
hpet clockevent registered
hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0
hpet0: 4 64-bit timers, 14318180 Hz
ACPI: RTC can wake from S4
system 00:01: iomem range 0xf0000000-0xf7ffffff could not be reserved
system 00:01: iomem range 0xfeb00000-0xfeb03fff has been reserved
system 00:01: iomem range 0xfed13000-0xfed13fff has been reserved
system 00:01: iomem range 0xfed14000-0xfed17fff has been reserved
system 00:01: iomem range 0xfed18000-0xfed18fff has been reserved
system 00:01: iomem range 0xfed19000-0xfed19fff has been reserved
system 00:01: iomem range 0xfed1c000-0xfed1ffff has been reserved
system 00:01: iomem range 0xfed20000-0xfed3ffff has been reserved
system 00:01: iomem range 0xfed45000-0xfed99fff has been reserved
system 00:01: iomem range 0xc0000-0xdffff has been reserved
system 00:01: iomem range 0xe0000-0xfffff could not be reserved
system 00:01: iomem range 0xffc00000-0xffffffff could not be reserved
system 00:06: ioport range 0x500-0x53f has been reserved
system 00:06: ioport range 0x400-0x47f has been reserved
system 00:06: ioport range 0x680-0x6ff has been reserved
pci 0000:00:01.0: PCI bridge, secondary bus 0000:01
pci 0000:00:01.0:   IO window: 0x3000-0x3fff
pci 0000:00:01.0:   MEM window: 0x90200000-0x902fffff
pci 0000:00:01.0:   PREFETCH window: 0x00000080000000-0x0000008fffffff
pci 0000:00:1c.0: PCI bridge, secondary bus 0000:02
pci 0000:00:1c.0:   IO window: disabled
pci 0000:00:1c.0:   MEM window: 0x90400000-0x904fffff
pci 0000:00:1c.0:   PREFETCH window: disabled
pci 0000:00:1c.4: PCI bridge, secondary bus 0000:03
pci 0000:00:1c.4:   IO window: 0x2000-0x2fff
pci 0000:00:1c.4:   MEM window: 0x90100000-0x901fffff
pci 0000:00:1c.4:   PREFETCH window: disabled
pci 0000:00:1e.0: PCI bridge, secondary bus 0000:04
pci 0000:00:1e.0:   IO window: 0x1000-0x1fff
pci 0000:00:1e.0:   MEM window: 0x90000000-0x900fffff
pci 0000:00:1e.0:   PREFETCH window: disabled
pci 0000:00:01.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
pci 0000:00:01.0: setting latency timer to 64
pci 0000:00:1c.0: enabling device (0000 -> 0002)
pci 0000:00:1c.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
pci 0000:00:1c.0: setting latency timer to 64
pci 0000:00:1c.4: PCI INT A -> GSI 17 (level, low) -> IRQ 17
pci 0000:00:1c.4: setting latency timer to 64
pci 0000:00:1e.0: setting latency timer to 64
bus: 00 index 0 io port: [0, ffff]
bus: 00 index 1 mmio: [0, ffffffffffffffff]
bus: 01 index 0 io port: [3000, 3fff]
bus: 01 index 1 mmio: [90200000, 902fffff]
bus: 01 index 2 mmio: [80000000, 8fffffff]
bus: 01 index 3 mmio: [0, 0]
bus: 02 index 0 mmio: [0, 0]
bus: 02 index 1 mmio: [90400000, 904fffff]
bus: 02 index 2 mmio: [0, 0]
bus: 02 index 3 mmio: [0, 0]
bus: 03 index 0 io port: [2000, 2fff]
bus: 03 index 1 mmio: [90100000, 901fffff]
bus: 03 index 2 mmio: [0, 0]
bus: 03 index 3 mmio: [0, 0]
bus: 04 index 0 io port: [1000, 1fff]
bus: 04 index 1 mmio: [90000000, 900fffff]
bus: 04 index 2 mmio: [0, 0]
bus: 04 index 3 io port: [0, ffff]
bus: 04 index 4 mmio: [0, ffffffffffffffff]
NET: Registered protocol family 2
IP route cache hash table entries: 65536 (order: 7, 524288 bytes)
TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP reno registered
NET: Registered protocol family 1
audit: initializing netlink socket (disabled)
type=2000 audit(1229708834.444:1): initialized
msgmni has been set to 4023
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
pci 0000:01:00.0: Boot video device
pcieport-driver 0000:00:01.0: setting latency timer to 64
pcieport-driver 0000:00:01.0: found MSI capability
pci_express 0000:00:01.0:pcie00: allocate port service
pci_express 0000:00:01.0:pcie03: allocate port service
pcieport-driver 0000:00:1c.0: setting latency timer to 64
pcieport-driver 0000:00:1c.0: found MSI capability
pci_express 0000:00:1c.0:pcie00: allocate port service
pci_express 0000:00:1c.0:pcie02: allocate port service
pci_express 0000:00:1c.0:pcie03: allocate port service
pcieport-driver 0000:00:1c.4: setting latency timer to 64
pcieport-driver 0000:00:1c.4: found MSI capability
pci_express 0000:00:1c.4:pcie00: allocate port service
pci_express 0000:00:1c.4:pcie02: allocate port service
pci_express 0000:00:1c.4:pcie03: allocate port service
Non-volatile memory driver v1.2
Linux agpgart interface v0.103
uvesafb: failed to execute /sbin/v86d
uvesafb: make sure that the v86d helper is installed and executable
uvesafb: Getting VBE info block failed (eax=0x4f00, err=-2)
uvesafb: vbe_init() failed with -22
uvesafb: probe of uvesafb.0 failed with error -22
input: Power Button (FF) as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
ACPI: Power Button (FF) [PWRF]
input: Sleep Button (CM) as /devices/LNXSYSTM:00/device:00/PNP0C0E:00/input/input1
ACPI: Sleep Button (CM) [SLPB]
Monitor-Mwait will be used to enter C-1 state
processor ACPI0007:00: registered as cooling_device0
ACPI: Processor [CPU0] (supports 8 throttling states)
processor ACPI0007:01: registered as cooling_device1
ACPI: Processor [CPU1] (supports 8 throttling states)
processor ACPI0007:02: registered as cooling_device2
ACPI: Processor [CPU2] (supports 8 throttling states)
processor ACPI0007:03: registered as cooling_device3
ACPI: Processor [CPU3] (supports 8 throttling states)
loop: module loaded
Loading iSCSI transport class v2.0-870.
Driver 'sd' needs updating - please use bus_type methods
Driver 'sr' needs updating - please use bus_type methods
ahci 0000:00:1f.2: version 3.0
ahci 0000:00:1f.2: PCI INT A -> GSI 21 (level, low) -> IRQ 21
ahci 0000:00:1f.2: AHCI 0001.0200 32 slots 6 ports 3 Gbps 0x3f impl SATA mode
ahci 0000:00:1f.2: flags: 64bit ncq sntf led clo pio slum part ems 
ahci 0000:00:1f.2: setting latency timer to 64
scsi0 : ahci
scsi1 : ahci
scsi2 : ahci
scsi3 : ahci
scsi4 : ahci
scsi5 : ahci
ata1: SATA max UDMA/133 abar m2048@0x90325000 port 0x90325100 irq 378
ata2: SATA max UDMA/133 abar m2048@0x90325000 port 0x90325180 irq 378
ata3: SATA max UDMA/133 abar m2048@0x90325000 port 0x90325200 irq 378
ata4: SATA max UDMA/133 abar m2048@0x90325000 port 0x90325280 irq 378
ata5: SATA max UDMA/133 abar m2048@0x90325000 port 0x90325300 irq 378
ata6: SATA max UDMA/133 abar m2048@0x90325000 port 0x90325380 irq 378
ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
ata1.00: ATA-7: MAXTOR STM3160215AS, 4.AAB, max UDMA/133
ata1.00: 312581808 sectors, multi 16: LBA48 NCQ (depth 31/32)
ata1.00: configured for UDMA/133
Switched to high resolution mode on CPU 3
Switched to high resolution mode on CPU 2
Switched to high resolution mode on CPU 1
Switched to high resolution mode on CPU 0
ata2: SATA link down (SStatus 0 SControl 300)
ata3: SATA link down (SStatus 0 SControl 300)
ata4: SATA link down (SStatus 0 SControl 300)
ata5: SATA link down (SStatus 0 SControl 300)
ata6: SATA link down (SStatus 0 SControl 300)
scsi 0:0:0:0: Direct-Access     ATA      MAXTOR STM316021 4.AA PQ: 0 ANSI: 5
sd 0:0:0:0: [sda] 312581808 512-byte hardware sectors (160042 MB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
sd 0:0:0:0: [sda] 312581808 512-byte hardware sectors (160042 MB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 sda9 sda10 >
sd 0:0:0:0: [sda] Attached SCSI disk
sd 0:0:0:0: Attached scsi generic sg0 type 0
pata_marvell 0000:03:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
pata_marvell 0000:03:00.0: setting latency timer to 64
scsi6 : pata_marvell
scsi7 : pata_marvell
ata7: PATA max UDMA/100 cmd 0x2018 ctl 0x2024 bmdma 0x2000 irq 16
ata8: PATA max UDMA/133 cmd 0x2010 ctl 0x2020 bmdma 0x2008 irq 16
ata7.00: ATA-7: HDS728080PLAT20, PF2OA21B, max UDMA/133
ata7.00: 160836480 sectors, multi 16: LBA48 
ata7.01: ATA-5: WDC WD400EB-00CPF0, 06.04G06, max UDMA/100
ata7.01: 78165360 sectors, multi 16: LBA 
ata7.00: configured for UDMA/100
ata7.01: configured for UDMA/100
scsi 6:0:0:0: Direct-Access     ATA      HDS728080PLAT20  PF2O PQ: 0 ANSI: 5
sd 6:0:0:0: [sdb] 160836480 512-byte hardware sectors (82348 MB)
sd 6:0:0:0: [sdb] Write Protect is off
sd 6:0:0:0: [sdb] Mode Sense: 00 3a 00 00
sd 6:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
sd 6:0:0:0: [sdb] 160836480 512-byte hardware sectors (82348 MB)
sd 6:0:0:0: [sdb] Write Protect is off
sd 6:0:0:0: [sdb] Mode Sense: 00 3a 00 00
sd 6:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
 sdb: sdb1 sdb2 sdb3 sdb4 < sdb5 sdb6 sdb7 sdb8 sdb9 >
sd 6:0:0:0: [sdb] Attached SCSI disk
sd 6:0:0:0: Attached scsi generic sg1 type 0
scsi 6:0:1:0: Direct-Access     ATA      WDC WD400EB-00CP 06.0 PQ: 0 ANSI: 5
sd 6:0:1:0: [sdc] 78165360 512-byte hardware sectors (40021 MB)
sd 6:0:1:0: [sdc] Write Protect is off
sd 6:0:1:0: [sdc] Mode Sense: 00 3a 00 00
sd 6:0:1:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
sd 6:0:1:0: [sdc] 78165360 512-byte hardware sectors (40021 MB)
sd 6:0:1:0: [sdc] Write Protect is off
sd 6:0:1:0: [sdc] Mode Sense: 00 3a 00 00
sd 6:0:1:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
 sdc: sdc1 sdc2 sdc3 sdc4 < sdc5 sdc6 sdc7 sdc8 sdc9 sdc10 >
sd 6:0:1:0: [sdc] Attached SCSI disk
sd 6:0:1:0: Attached scsi generic sg2 type 0
ehci_hcd 0000:00:1a.7: PCI INT C -> GSI 17 (level, low) -> IRQ 17
ehci_hcd 0000:00:1a.7: setting latency timer to 64
ehci_hcd 0000:00:1a.7: EHCI Host Controller
ehci_hcd 0000:00:1a.7: new USB bus registered, assigned bus number 1
ehci_hcd 0000:00:1a.7: debug port 1
ehci_hcd 0000:00:1a.7: cache line size of 32 is not supported
ehci_hcd 0000:00:1a.7: irq 17, io mem 0x90325c00
ehci_hcd 0000:00:1a.7: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 6 ports detected
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: EHCI Host Controller
usb usb1: Manufacturer: Linux 2.6.27-gentoo-r5 ehci_hcd
usb usb1: SerialNumber: 0000:00:1a.7
ehci_hcd 0000:00:1d.7: PCI INT A -> GSI 23 (level, low) -> IRQ 23
ehci_hcd 0000:00:1d.7: setting latency timer to 64
ehci_hcd 0000:00:1d.7: EHCI Host Controller
ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 2
ehci_hcd 0000:00:1d.7: debug port 1
ehci_hcd 0000:00:1d.7: cache line size of 32 is not supported
ehci_hcd 0000:00:1d.7: irq 23, io mem 0x90325800
ehci_hcd 0000:00:1d.7: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 6 ports detected
usb usb2: New USB device found, idVendor=1d6b, idProduct=0002
usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb2: Product: EHCI Host Controller
usb usb2: Manufacturer: Linux 2.6.27-gentoo-r5 ehci_hcd
usb usb2: SerialNumber: 0000:00:1d.7
ohci_hcd: 2006 August 04 USB 1.1 'Open' Host Controller (OHCI) Driver
USB Universal Host Controller Interface driver v3.0
uhci_hcd 0000:00:1a.0: PCI INT A -> GSI 18 (level, low) -> IRQ 18
uhci_hcd 0000:00:1a.0: setting latency timer to 64
uhci_hcd 0000:00:1a.0: UHCI Host Controller
uhci_hcd 0000:00:1a.0: new USB bus registered, assigned bus number 3
uhci_hcd 0000:00:1a.0: irq 18, io base 0x000040e0
usb usb3: configuration #1 chosen from 1 choice
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb3: Product: UHCI Host Controller
usb usb3: Manufacturer: Linux 2.6.27-gentoo-r5 uhci_hcd
usb usb3: SerialNumber: 0000:00:1a.0
uhci_hcd 0000:00:1a.1: PCI INT B -> GSI 21 (level, low) -> IRQ 21
uhci_hcd 0000:00:1a.1: setting latency timer to 64
uhci_hcd 0000:00:1a.1: UHCI Host Controller
uhci_hcd 0000:00:1a.1: new USB bus registered, assigned bus number 4
uhci_hcd 0000:00:1a.1: irq 21, io base 0x000040c0
usb usb4: configuration #1 chosen from 1 choice
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 2 ports detected
usb 3-2: new low speed USB device using uhci_hcd and address 2
usb usb4: New USB device found, idVendor=1d6b, idProduct=0001
usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb4: Product: UHCI Host Controller
usb usb4: Manufacturer: Linux 2.6.27-gentoo-r5 uhci_hcd
usb usb4: SerialNumber: 0000:00:1a.1
uhci_hcd 0000:00:1a.2: PCI INT C -> GSI 17 (level, low) -> IRQ 17
uhci_hcd 0000:00:1a.2: setting latency timer to 64
uhci_hcd 0000:00:1a.2: UHCI Host Controller
uhci_hcd 0000:00:1a.2: new USB bus registered, assigned bus number 5
uhci_hcd 0000:00:1a.2: irq 17, io base 0x000040a0
usb usb5: configuration #1 chosen from 1 choice
hub 5-0:1.0: USB hub found
hub 5-0:1.0: 2 ports detected
usb usb5: New USB device found, idVendor=1d6b, idProduct=0001
usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb5: Product: UHCI Host Controller
usb usb5: Manufacturer: Linux 2.6.27-gentoo-r5 uhci_hcd
usb usb5: SerialNumber: 0000:00:1a.2
uhci_hcd 0000:00:1d.0: PCI INT A -> GSI 23 (level, low) -> IRQ 23
uhci_hcd 0000:00:1d.0: setting latency timer to 64
uhci_hcd 0000:00:1d.0: UHCI Host Controller
uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 6
uhci_hcd 0000:00:1d.0: irq 23, io base 0x00004080
usb usb6: configuration #1 chosen from 1 choice
hub 6-0:1.0: USB hub found
hub 6-0:1.0: 2 ports detected
usb 3-2: configuration #1 chosen from 1 choice
usb 3-2: New USB device found, idVendor=045e, idProduct=00e3
usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
usb 3-2: Product: Microsoft Wireless Optical Desktop��� 2.20
usb 3-2: Manufacturer: Microsft
usb usb6: New USB device found, idVendor=1d6b, idProduct=0001
usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb6: Product: UHCI Host Controller
usb usb6: Manufacturer: Linux 2.6.27-gentoo-r5 uhci_hcd
usb usb6: SerialNumber: 0000:00:1d.0
uhci_hcd 0000:00:1d.1: PCI INT B -> GSI 19 (level, low) -> IRQ 19
uhci_hcd 0000:00:1d.1: setting latency timer to 64
uhci_hcd 0000:00:1d.1: UHCI Host Controller
uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 7
uhci_hcd 0000:00:1d.1: irq 19, io base 0x00004060
usb usb7: configuration #1 chosen from 1 choice
hub 7-0:1.0: USB hub found
hub 7-0:1.0: 2 ports detected
usb usb7: New USB device found, idVendor=1d6b, idProduct=0001
usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb7: Product: UHCI Host Controller
usb usb7: Manufacturer: Linux 2.6.27-gentoo-r5 uhci_hcd
usb usb7: SerialNumber: 0000:00:1d.1
uhci_hcd 0000:00:1d.2: PCI INT C -> GSI 18 (level, low) -> IRQ 18
uhci_hcd 0000:00:1d.2: setting latency timer to 64
uhci_hcd 0000:00:1d.2: UHCI Host Controller
uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 8
uhci_hcd 0000:00:1d.2: irq 18, io base 0x00004040
usb usb8: configuration #1 chosen from 1 choice
hub 8-0:1.0: USB hub found
hub 8-0:1.0: 2 ports detected
usb usb8: New USB device found, idVendor=1d6b, idProduct=0001
usb usb8: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb8: Product: UHCI Host Controller
usb usb8: Manufacturer: Linux 2.6.27-gentoo-r5 uhci_hcd
usb usb8: SerialNumber: 0000:00:1d.2
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
usbcore: registered new interface driver libusual
PNP: No PS/2 controller found. Probing ports directly.
serio: i8042 KBD port at 0x60,0x64 irq 1
serio: i8042 AUX port at 0x60,0x64 irq 12
mice: PS/2 mouse device common for all mice
input: PC Speaker as /devices/platform/pcspkr/input/input2
rtc_cmos 00:03: rtc core: registered rtc_cmos as rtc0
rtc0: alarms up to one month, hpet irqs
device-mapper: ioctl: 4.14.0-ioctl (2008-04-23) initialised: dm-devel@redhat.com
cpuidle: using governor ladder
cpuidle: using governor menu
usbcore: registered new interface driver hiddev
input: Microsft Microsoft Wireless Optical Desktop��� 2.20 as /devices/pci0000:00/0000:00:1a.0/usb3/3-2/3-2:1.0/input/input3
input,hidraw0: USB HID v1.11 Keyboard [Microsft Microsoft Wireless Optical Desktop��� 2.20] on usb-0000:00:1a.0-2
input: Microsft Microsoft Wireless Optical Desktop��� 2.20 as /devices/pci0000:00/0000:00:1a.0/usb3/3-2/3-2:1.1/input/input4
input,hidraw1: USB HID v1.11 Mouse [Microsft Microsoft Wireless Optical Desktop��� 2.20] on usb-0000:00:1a.0-2
usbcore: registered new interface driver usbhid
usbhid: v2.6:USB HID core driver
Netfilter messages via NETLINK v0.30.
nf_conntrack version 0.5.0 (16384 buckets, 65536 max)
ctnetlink v0.93: registering with nfnetlink.
ip_tables: (C) 2000-2006 Netfilter Core Team
TCP cubic registered
NET: Registered protocol family 17
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
registered taskstats version 1
  Magic number: 4:504:795
ReiserFS: sda6: found reiserfs format "3.6" with standard journal
ReiserFS: sda6: using ordered data mode
ReiserFS: sda6: journal params: device sda6, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
ReiserFS: sda6: checking transaction log (sda6)
ReiserFS: sda6: Using r5 hash to sort names
VFS: Mounted root (reiserfs filesystem) readonly.
Freeing unused kernel memory: 380k freed
i801_smbus 0000:00:1f.3: PCI INT B -> GSI 18 (level, low) -> IRQ 18
8139too Fast Ethernet driver 0.9.28
8139too 0000:04:02.0: PCI INT A -> GSI 18 (level, low) -> IRQ 18
eth0: RealTek RTL8139 at 0x1000, 00:40:f4:2d:78:cb, IRQ 18
eth0:  Identified 8139 chip type 'RTL-8139C'
udev: renamed network interface eth0 to eth1
e1000e: Intel(R) PRO/1000 Network Driver - 0.3.3.3-k6
e1000e: Copyright (c) 1999-2008 Intel Corporation.
e1000e 0000:00:19.0: PCI INT A -> GSI 20 (level, low) -> IRQ 20
e1000e 0000:00:19.0: setting latency timer to 64
0000:00:19.0: eth0: (PCI Express:2.5GB/s:Width x1) 00:1c:c0:26:4d:96
0000:00:19.0: eth0: Intel(R) PRO/1000 Network Connection
0000:00:19.0: eth0: MAC: 5, PHY: 6, PBA No: ffffff-0ff
HDA Intel 0000:00:1b.0: PCI INT A -> GSI 22 (level, low) -> IRQ 22
HDA Intel 0000:00:1b.0: setting latency timer to 64
HDA Intel 0000:01:00.1: PCI INT B -> GSI 17 (level, low) -> IRQ 17
HDA Intel 0000:01:00.1: setting latency timer to 64
fglrx: module license 'Proprietary. (C) 2002 - ATI Technologies, Starnberg, GERMANY' taints kernel.
[fglrx] Maximum main memory to use for locked dma buffers: 1885 MBytes.
[fglrx]   vendor: 1002 device: 9501 count: 1
[fglrx] ioport: bar 4, base 0x3000, size: 0x100
pci 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
pci 0000:01:00.0: setting latency timer to 64
[fglrx] Driver built-in PAT support is enabled successfully
[fglrx] module loaded - fglrx 8.56.4 [Dec  1 2008] with 1 minors
i2c /dev entries driver
coretemp coretemp.0: Using relative temperature scale!
coretemp coretemp.1: Using relative temperature scale!
coretemp coretemp.2: Using relative temperature scale!
coretemp coretemp.3: Using relative temperature scale!
ReiserFS: sda5: found reiserfs format "3.6" with standard journal
ReiserFS: sda5: using ordered data mode
ReiserFS: sda5: journal params: device sda5, size 3965, journal first block 130, max trans len 128, max batch 112, max commit age 30, max trans age 30
ReiserFS: sda5: checking transaction log (sda5)
ReiserFS: sda5: Using r5 hash to sort names
ReiserFS: sda5: Removing [1119081 1119083 0x0 SD]..done
ReiserFS: sda5: There were 1 uncompleted unlinks/truncates. Completed
ReiserFS: sda8: found reiserfs format "3.6" with standard journal
ReiserFS: sda8: using ordered data mode
ReiserFS: sda8: journal params: device sda8, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
ReiserFS: sda8: checking transaction log (sda8)
ReiserFS: sda8: replayed 1 transactions in 0 seconds
ReiserFS: sda8: Using r5 hash to sort names
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda9, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
fuse init (API version 7.9)
ReiserFS: dm-0: found reiserfs format "3.6" with standard journal
ReiserFS: dm-0: using ordered data mode
ReiserFS: dm-0: journal params: device dm-0, size 8125, journal first block 66, max trans len 256, max batch 225, max commit age 30, max trans age 30
ReiserFS: dm-0: checking transaction log (dm-0)
ReiserFS: dm-0: Using r5 hash to sort names
ReiserFS: dm-1: found reiserfs format "3.6" with standard journal
ReiserFS: dm-1: using ordered data mode
ReiserFS: dm-1: journal params: device dm-1, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
ReiserFS: dm-1: checking transaction log (dm-1)
ReiserFS: dm-1: Using r5 hash to sort names
kjournald starting.  Commit interval 5 seconds
EXT3 FS on dm-2, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
Adding 2096472k swap on /dev/sda2.  Priority:-1 extents:1 across:2096472k
eth1: link up, 100Mbps, full-duplex, lpa 0x45E1
[fglrx] Gart USWC size:192 M.
[fglrx] Gart cacheable size:60 M.
[fglrx] Reserved FB block: Shared offset:0, size:1000000 
[fglrx] Reserved FB block: Unshared offset:ff76000, size:8a000 
[fglrx] Reserved FB block: Unshared offset:1fffc000, size:4000 
BUG: unable to handle kernel paging request at ffff87f5a7ad9cd0
IP: [<ffffffff802f1644>] leaf_copy_items_entirely+0xaf/0x20f
PGD 0 
Oops: 0000 [1] SMP 
CPU 3 
Modules linked in: snd_pcm_oss snd_mixer_oss snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq snd_seq_device fuse ext3 jbd mbcache coretemp hwmon slhc realtek i2c_dev fglrx(P) snd_hda_intel snd_pcm snd_timer snd_page_alloc snd_hwdep snd e1000e 8139too soundcore i2c_i801
Pid: 24078, comm: conftest Tainted: P          2.6.27-gentoo-r5 #5
RIP: 0010:[<ffffffff802f1644>]  [<ffffffff802f1644>] leaf_copy_items_entirely+0xaf/0x20f
RSP: 0018:ffff880071e33328  EFLAGS: 00010246
RAX: ffff880b024855c0 RBX: 0000000052b2a640 RCX: 0000000aad4d5ba8
RDX: ffff8800545d1b60 RSI: ffff87f5a7ad9cd0 RDI: ffff880054fafa18
RBP: ffff880054fafa18 R08: ffff880b024855c0 R09: ffff880b024855c0
R10: 0000000000000004 R11: 0000000004040404 R12: 0000000000000000
R13: 0000000aad4d5ba8 R14: ffff880071e333d8 R15: 0000000000000000
FS:  00007fd1953886f0(0000) GS:ffff88007fb1f880(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
CR2: ffff87f5a7ad9cd0 CR3: 0000000075719000 CR4: 00000000000006e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
Process conftest (pid: 24078, threadinfo ffff880071e32000, task ffff88007d811350)
Stack:  00000000803d94bd 8e1cc6dd71e33927 ffff8800545d1b60 ffff880071e333d8
 ffff880054fafa00 00040000802b9866 ffff8800545d1af0 000000008e1cc6dc
 0000000000000000 ffff8800545d1b60 0000000000000001 ffff880071e333d8
Call Trace:
 [<ffffffff802f31e4>] ? leaf_move_items+0x2ed/0x34e
 [<ffffffff802e2e94>] ? do_balance+0x2126/0x27d6
 [<ffffffff802431e1>] ? wake_up_bit+0x11/0x22
 [<ffffffff802f8462>] ? reiserfs_prepare_for_journal+0x5d/0x64
 [<ffffffff802ed6b4>] ? fix_nodes+0xe0d/0x1071
 [<ffffffff8050a2f3>] ? __wait_on_bit+0x62/0x70
 [<ffffffff803dd7ff>] ? scsi_request_fn+0x0/0x395
 [<ffffffff802f637c>] ? reiserfs_paste_into_item+0x101/0x13c
 [<ffffffff802e8f11>] ? reiserfs_get_block+0xd4f/0xf0f
 [<ffffffff802bb27e>] ? __block_prepare_write+0x1b3/0x3af
 [<ffffffff802e81c2>] ? reiserfs_get_block+0x0/0xf0f
 [<ffffffff802bb5cb>] ? block_write_begin+0x77/0xc5
 [<ffffffff802e641f>] ? reiserfs_write_begin+0x145/0x1c7
 [<ffffffff802e81c2>] ? reiserfs_get_block+0x0/0xf0f
 [<ffffffff80270d33>] ? generic_file_buffered_write+0x146/0x65d
 [<ffffffff802355fa>] ? current_fs_time+0x1e/0x24
 [<ffffffff8026f8c9>] ? file_remove_suid+0x1c/0x4f
 [<ffffffff80271747>] ? __generic_file_aio_write_nolock+0x349/0x37d
 [<ffffffff80271ea6>] ? generic_file_aio_write+0x64/0xc4
 [<ffffffff80299851>] ? do_sync_write+0xce/0x113
 [<ffffffff80220a41>] ? do_page_fault+0x467/0x81a
 [<ffffffff802431f2>] ? autoremove_wake_function+0x0/0x2e
 [<ffffffff8029a126>] ? vfs_write+0xad/0x156
 [<ffffffff8029a226>] ? sys_pwrite64+0x57/0x77
 [<ffffffff8050b609>] ? error_exit+0x0/0x51
 [<ffffffff8020b34b>] ? system_call_fastpath+0x16/0x1b


Code: 44 29 eb 4a 8d 7c 2d 00 e8 5e b8 05 00 48 63 74 24 0c 48 8b 54 24 10 48 ff c6 48 89 ef 48 6b f6 18 4c 89 e9 48 03 72 28 45 85 e4 <f3> a4 66 89 5c 24 2e 48 8b 44 24 20 66 89 58 04 75 0b 48 8b 54 
RIP  [<ffffffff802f1644>] leaf_copy_items_entirely+0xaf/0x20f
 RSP <ffff880071e33328>
CR2: ffff87f5a7ad9cd0
---[ end trace 16236b432a58e107 ]---
------------[ cut here ]------------
WARNING: at kernel/exit.c:1001 do_exit+0x3c/0x807()
Modules linked in: snd_pcm_oss snd_mixer_oss snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq snd_seq_device fuse ext3 jbd mbcache coretemp hwmon slhc realtek i2c_dev fglrx(P) snd_hda_intel snd_pcm snd_timer snd_page_alloc snd_hwdep snd e1000e 8139too soundcore i2c_i801
Pid: 24078, comm: conftest Tainted: P      D   2.6.27-gentoo-r5 #5

Call Trace:
 [<ffffffff802314dd>] warn_on_slowpath+0x51/0x77
 [<ffffffff80227f36>] enqueue_task_fair+0x22/0x74
 [<ffffffff805092ee>] printk+0x4e/0x58
 [<ffffffff805092ee>] printk+0x4e/0x58
 [<ffffffff80234454>] do_exit+0x3c/0x807
 [<ffffffff802275b8>] __wake_up+0x38/0x4e
 [<ffffffff8020c919>] oops_begin+0x0/0x86
 [<ffffffff80220d28>] do_page_fault+0x74e/0x81a
 [<ffffffff8027bb78>] zone_statistics+0x3c/0x5f
 [<ffffffff80273b95>] __rmqueue+0x1d/0x1fb
 [<ffffffff802b9cd5>] __find_get_block+0x14c/0x15c
 [<ffffffff8050b609>] error_exit+0x0/0x51
 [<ffffffff802f1644>] leaf_copy_items_entirely+0xaf/0x20f
 [<ffffffff802f1626>] leaf_copy_items_entirely+0x91/0x20f
 [<ffffffff802f31e4>] leaf_move_items+0x2ed/0x34e
 [<ffffffff802e2e94>] do_balance+0x2126/0x27d6
 [<ffffffff802431e1>] wake_up_bit+0x11/0x22
 [<ffffffff802f8462>] reiserfs_prepare_for_journal+0x5d/0x64
 [<ffffffff802ed6b4>] fix_nodes+0xe0d/0x1071
 [<ffffffff8050a2f3>] __wait_on_bit+0x62/0x70
 [<ffffffff803dd7ff>] scsi_request_fn+0x0/0x395
 [<ffffffff802f637c>] reiserfs_paste_into_item+0x101/0x13c
 [<ffffffff802e8f11>] reiserfs_get_block+0xd4f/0xf0f
 [<ffffffff802bb27e>] __block_prepare_write+0x1b3/0x3af
 [<ffffffff802e81c2>] reiserfs_get_block+0x0/0xf0f
 [<ffffffff802bb5cb>] block_write_begin+0x77/0xc5
 [<ffffffff802e641f>] reiserfs_write_begin+0x145/0x1c7
 [<ffffffff802e81c2>] reiserfs_get_block+0x0/0xf0f
 [<ffffffff80270d33>] generic_file_buffered_write+0x146/0x65d
 [<ffffffff802355fa>] current_fs_time+0x1e/0x24
 [<ffffffff8026f8c9>] file_remove_suid+0x1c/0x4f
 [<ffffffff80271747>] __generic_file_aio_write_nolock+0x349/0x37d
 [<ffffffff80271ea6>] generic_file_aio_write+0x64/0xc4
 [<ffffffff80299851>] do_sync_write+0xce/0x113
 [<ffffffff80220a41>] do_page_fault+0x467/0x81a
 [<ffffffff802431f2>] autoremove_wake_function+0x0/0x2e
 [<ffffffff8029a126>] vfs_write+0xad/0x156
 [<ffffffff8029a226>] sys_pwrite64+0x57/0x77
 [<ffffffff8050b609>] error_exit+0x0/0x51
 [<ffffffff8020b34b>] system_call_fastpath+0x16/0x1b

---[ end trace 16236b432a58e107 ]---

--------------020501020706000607010006--
