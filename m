From: Sandro Souza <escovadordebits@gmail.com>
Subject: Re: Help please
Date: Wed, 9 May 2012 15:24:45 -0300
Message-ID: <CANish_nX=_XLJgALwLrMV-WjMsBSsPQMXOJG4jTVZBnxbFY23g@mail.gmail.com>
References: <CANish_k+TucLHQQCkx5kHaqN6e7kJOFqKG4fsey18BhWBs=BWA@mail.gmail.com>
	<20120507201208.5eec936a@Ulf.tvoe.tv>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=lUTOqbYZvjl37Q0DUIJYn9+AUTTa8TuENZmF//P5flI=;
        b=qXH5IHPGJz1ohAnATgkjJ4GjNYfbEsQgWc+A8GAloHMWZohVXuhfpW7jCgxx/9yO8X
         er/ziCeDV7X+0utF4xosMhIcEL8MGf/s0LqUG/Gquzc9dmj2dN/khAIEdYThRu1LqJD0
         lpwGBZ3uhiuZ3JsfNrPx5WO9AwcRMt08gxm+QCms8ELhGCgh7Qc/QZHhf+z0ODs2oPiq
         V/y4pCR7WZVfUYiHspaekqrOKsjxElQ/FdN6/4nxLn9GfTXcOHrGIcWdVQxsEJNJY1jX
         OnRzGluz4ZDz9r1ValypLrVPL4x8dpr/aUGk/viE4BXLNnt9YQzUmfmWlJVPDDY7NQDL
         3wsQ==
In-Reply-To: <20120507201208.5eec936a@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dimas000@ya.ru, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Thanks Dimas for your answer.

Following your advice, here is the first part of syslog content (sorry
for the big text):

May  9 17:58:01 localhost kernel: imklog 4.6.4, log source = /proc/kmsg started.
May  9 17:58:01 localhost rsyslogd: [origin software="rsyslogd"
swVersion="4.6.4" x-pid="1363" x-info="http://www.rsyslog.com"]
(re)start
May  9 17:58:01 localhost kernel: [    0.000000] Initializing cgroup
subsys cpuset
May  9 17:58:01 localhost kernel: [    0.000000] Initializing cgroup subsys cpu
May  9 17:58:01 localhost kernel: [    0.000000] Linux version
2.6.32-reiser4 (2.6.32) (root@debian-virtual) (gcc version 4.4.5
(Debian 4.4.5-8) ) #1 SMP Tue Apr 24 17:55:14 BRT 2012
May  9 17:58:01 localhost kernel: [    0.000000] Command line:
initrd=/live/initrd.img boot=live config   quiet splash
BOOT_IMAGE=/live/vmlinuz
May  9 17:58:01 localhost kernel: [    0.000000] KERNEL supported cpus:
May  9 17:58:01 localhost kernel: [    0.000000]   Intel GenuineIntel
May  9 17:58:01 localhost kernel: [    0.000000]   AMD AuthenticAMD
May  9 17:58:01 localhost kernel: [    0.000000]   Centaur CentaurHauls
May  9 17:58:01 localhost kernel: [    0.000000] BIOS-provided physical RAM map:
May  9 17:58:01 localhost kernel: [    0.000000]  BIOS-e820:
0000000000000000 - 000000000009fc00 (usable)
May  9 17:58:01 localhost kernel: [    0.000000]  BIOS-e820:
000000000009fc00 - 00000000000a0000 (reserved)
May  9 17:58:01 localhost kernel: [    0.000000]  BIOS-e820:
00000000000f0000 - 0000000000100000 (reserved)
May  9 17:58:01 localhost kernel: [    0.000000]  BIOS-e820:
0000000000100000 - 000000003fff0000 (usable)
May  9 17:58:01 localhost kernel: [    0.000000]  BIOS-e820:
000000003fff0000 - 0000000040000000 (ACPI data)
May  9 17:58:01 localhost kernel: [    0.000000]  BIOS-e820:
00000000fffc0000 - 0000000100000000 (reserved)
May  9 17:58:01 localhost kernel: [    0.000000] DMI 2.5 present.
May  9 17:58:01 localhost kernel: [    0.000000] last_pfn = 0x3fff0
max_arch_pfn = 0x400000000
May  9 17:58:01 localhost kernel: [    0.000000] MTRR default type: uncachable
May  9 17:58:01 localhost kernel: [    0.000000] MTRR variable ranges disabled:
May  9 17:58:01 localhost kernel: [    0.000000] x86 PAT enabled: cpu
0, old 0x7040600070406, new 0x7010600070106
May  9 17:58:01 localhost kernel: [    0.000000] CPU MTRRs all blank -
virtualized system.
May  9 17:58:01 localhost kernel: [    0.000000] initial memory mapped
: 0 - 20000000
May  9 17:58:01 localhost kernel: [    0.000000] init_memory_mapping:
0000000000000000-000000003fff0000
May  9 17:58:01 localhost kernel: [    0.000000]  0000000000 -
003fe00000 page 2M
May  9 17:58:01 localhost kernel: [    0.000000]  003fe00000 -
003fff0000 page 4k
May  9 17:58:01 localhost kernel: [    0.000000] kernel direct mapping
tables up to 3fff0000 @ 8000-b000
May  9 17:58:01 localhost kernel: [    0.000000] RAMDISK: 3f517000 - 3ffce7eb
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: RSDP
00000000000e0000 00024 (v02 VBOX  )
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: XSDT
000000003fff0030 0003C (v01 VBOX   VBOXXSDT 00000001 ASL  00000061)
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: FACP
000000003fff00f0 000F4 (v04 VBOX   VBOXFACP 00000001 ASL  00000061)
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: DSDT
000000003fff0470 01B96 (v01 VBOX   VBOXBIOS 00000002 INTL 20100528)
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: FACS
000000003fff0200 00040
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: APIC
000000003fff0240 00054 (v02 VBOX   VBOXAPIC 00000001 ASL  00000061)
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: SSDT
000000003fff02a0 001CC (v01 VBOX   VBOXCPUT 00000002 INTL 20100528)
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: Local APIC
address 0xfee00000
May  9 17:58:01 localhost kernel: [    0.000000] No NUMA configuration found
May  9 17:58:01 localhost kernel: [    0.000000] Faking a node at
0000000000000000-000000003fff0000
May  9 17:58:01 localhost kernel: [    0.000000] Bootmem setup node 0
0000000000000000-000000003fff0000
May  9 17:58:01 localhost kernel: [    0.000000]   NODE_DATA
[0000000000009000 - 0000000000010fff]
May  9 17:58:01 localhost kernel: [    0.000000]   bootmap
[0000000000011000 -  0000000000018fff] pages 8
May  9 17:58:01 localhost kernel: [    0.000000] (7 early
reservations) ==> bootmem [0000000000 - 003fff0000]
May  9 17:58:01 localhost kernel: [    0.000000]   #0 [0000000000 -
0000001000]   BIOS data page ==> [0000000000 - 0000001000]
May  9 17:58:01 localhost kernel: [    0.000000]   #1 [0000006000 -
0000008000]       TRAMPOLINE ==> [0000006000 - 0000008000]
May  9 17:58:01 localhost kernel: [    0.000000]   #2 [0001000000 -
00017478c4]    TEXT DATA BSS ==> [0001000000 - 00017478c4]
May  9 17:58:01 localhost kernel: [    0.000000]   #3 [003f517000 -
003ffce7eb]          RAMDISK ==> [003f517000 - 003ffce7eb]
May  9 17:58:01 localhost kernel: [    0.000000]   #4 [000009fc00 -
0000100000]    BIOS reserved ==> [000009fc00 - 0000100000]
May  9 17:58:01 localhost kernel: [    0.000000]   #5 [0001748000 -
0001748071]              BRK ==> [0001748000 - 0001748071]
May  9 17:58:01 localhost kernel: [    0.000000]   #6 [0000008000 -
0000009000]          PGTABLE ==> [0000008000 - 0000009000]
May  9 17:58:01 localhost kernel: [    0.000000] found SMP MP-table at
[ffff88000009fff0] 9fff0
May  9 17:58:01 localhost kernel: [    0.000000]
[ffffea0000000000-ffffea0000dfffff] PMD ->
[ffff880001c00000-ffff8800029fffff] on node 0
May  9 17:58:01 localhost kernel: [    0.000000] Zone PFN ranges:
May  9 17:58:01 localhost kernel: [    0.000000]   DMA      0x00000000
-> 0x00001000
May  9 17:58:01 localhost kernel: [    0.000000]   DMA32    0x00001000
-> 0x00100000
May  9 17:58:01 localhost kernel: [    0.000000]   Normal   0x00100000
-> 0x00100000
May  9 17:58:01 localhost kernel: [    0.000000] Movable zone start
PFN for each node
May  9 17:58:01 localhost kernel: [    0.000000] early_node_map[2]
active PFN ranges
May  9 17:58:01 localhost kernel: [    0.000000]     0: 0x00000000 -> 0x0000009f
May  9 17:58:01 localhost kernel: [    0.000000]     0: 0x00000100 -> 0x0003fff0
May  9 17:58:01 localhost kernel: [    0.000000] On node 0 totalpages: 262031
May  9 17:58:01 localhost kernel: [    0.000000]   DMA zone: 56 pages
used for memmap
May  9 17:58:01 localhost kernel: [    0.000000]   DMA zone: 100 pages reserved
May  9 17:58:01 localhost kernel: [    0.000000]   DMA zone: 3843
pages, LIFO batch:0
May  9 17:58:01 localhost kernel: [    0.000000]   DMA32 zone: 3528
pages used for memmap
May  9 17:58:01 localhost kernel: [    0.000000]   DMA32 zone: 254504
pages, LIFO batch:31
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: PM-Timer IO Port: 0x4008
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: Local APIC
address 0xfee00000
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: LAPIC
(acpi_id[0x00] lapic_id[0x00] enabled)
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: IOAPIC
(id[0x01] address[0xfec00000] gsi_base[0])
May  9 17:58:01 localhost kernel: [    0.000000] IOAPIC[0]: apic_id 1,
version 17, address 0xfec00000, GSI 0-23
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: INT_SRC_OVR
(bus 0 bus_irq 0 global_irq 2 dfl dfl)
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: INT_SRC_OVR
(bus 0 bus_irq 9 global_irq 9 high level)
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: IRQ0 used by override.
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: IRQ2 used by override.
May  9 17:58:01 localhost kernel: [    0.000000] ACPI: IRQ9 used by override.
May  9 17:58:01 localhost kernel: [    0.000000] Using ACPI (MADT) for
SMP configuration information
May  9 17:58:01 localhost kernel: [    0.000000] SMP: Allowing 1 CPUs,
0 hotplug CPUs
May  9 17:58:01 localhost kernel: [    0.000000] nr_irqs_gsi: 24
May  9 17:58:01 localhost kernel: [    0.000000] PM: Registered nosave
memory: 000000000009f000 - 00000000000a0000
May  9 17:58:01 localhost kernel: [    0.000000] PM: Registered nosave
memory: 00000000000a0000 - 00000000000f0000
May  9 17:58:01 localhost kernel: [    0.000000] PM: Registered nosave
memory: 00000000000f0000 - 0000000000100000
May  9 17:58:01 localhost kernel: [    0.000000] Allocating PCI
resources starting at 40000000 (gap: 40000000:bffc0000)
May  9 17:58:01 localhost kernel: [    0.000000] Booting
paravirtualized kernel on bare hardware
May  9 17:58:01 localhost kernel: [    0.000000] NR_CPUS:512
nr_cpumask_bits:512 nr_cpu_ids:1 nr_node_ids:1
May  9 17:58:01 localhost kernel: [    0.000000] PERCPU: Embedded 30
pages/cpu @ffff880001800000 s90328 r8192 d24360 u2097152
May  9 17:58:01 localhost kernel: [    0.000000] pcpu-alloc: s90328
r8192 d24360 u2097152 alloc=1*2097152
May  9 17:58:01 localhost kernel: [    0.000000] pcpu-alloc: [0] 0
May  9 17:58:01 localhost kernel: [    0.000000] Built 1 zonelists in
Node order, mobility grouping on.  Total pages: 258347
May  9 17:58:01 localhost kernel: [    0.000000] Policy zone: DMA32
May  9 17:58:01 localhost kernel: [    0.000000] Kernel command line:
initrd=/live/initrd.img boot=live config   quiet splash
BOOT_IMAGE=/live/vmlinuz
May  9 17:58:01 localhost kernel: [    0.000000] PID hash table
entries: 4096 (order: 3, 32768 bytes)
May  9 17:58:01 localhost kernel: [    0.000000] Initializing CPU#0
May  9 17:58:01 localhost kernel: [    0.000000] Checking aperture...
May  9 17:58:01 localhost kernel: [    0.000000] No AGP bridge found
May  9 17:58:01 localhost kernel: [    0.000000] Calgary: detecting
Calgary via BIOS EBDA area
May  9 17:58:01 localhost kernel: [    0.000000] Calgary: Unable to
locate Rio Grande table in EBDA - bailing!
May  9 17:58:01 localhost kernel: [    0.000000] Memory:
1014908k/1048512k available (3442k kernel code, 388k absent, 33216k
reserved, 2118k data, 592k init)
May  9 17:58:01 localhost kernel: [    0.000000] SLUB: Genslabs=14,
HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
May  9 17:58:01 localhost kernel: [    0.000000] Hierarchical RCU
implementation.
May  9 17:58:01 localhost kernel: [    0.000000] NR_IRQS:4352 nr_irqs:256
May  9 17:58:01 localhost kernel: [    0.000000] Console: colour VGA+ 80x25
May  9 17:58:01 localhost kernel: [    0.000000] console [tty0] enabled
May  9 17:58:01 localhost kernel: [    0.000000] Fast TSC calibration failed
May  9 17:58:01 localhost kernel: [    0.000000] TSC: Unable to
calibrate against PIT
May  9 17:58:01 localhost kernel: [    0.000000] TSC: using PMTIMER
reference calibration
May  9 17:58:01 localhost kernel: [    0.000000] Detected 3079.950 MHz
processor.
May  9 17:58:01 localhost kernel: [    0.016004] Calibrating delay
loop (skipped), value calculated using timer frequency.. 6159.90
BogoMIPS (lpj=12319800)
May  9 17:58:01 localhost kernel: [    0.016027] Security Framework initialized
May  9 17:58:01 localhost kernel: [    0.016030] SELinux:  Disabled at boot.
May  9 17:58:01 localhost kernel: [    0.016102] Dentry cache hash
table entries: 131072 (order: 8, 1048576 bytes)
May  9 17:58:01 localhost kernel: [    0.016279] Inode-cache hash
table entries: 65536 (order: 7, 524288 bytes)
May  9 17:58:01 localhost kernel: [    0.016355] Mount-cache hash
table entries: 256
May  9 17:58:01 localhost kernel: [    0.020077] Initializing cgroup subsys ns
May  9 17:58:01 localhost kernel: [    0.020080] Initializing cgroup
subsys cpuacct
May  9 17:58:01 localhost kernel: [    0.020082] Initializing cgroup
subsys devices
May  9 17:58:01 localhost kernel: [    0.020084] Initializing cgroup
subsys freezer
May  9 17:58:01 localhost kernel: [    0.020085] Initializing cgroup
subsys net_cls
May  9 17:58:01 localhost kernel: [    0.020165] , L1 D cache: 32K
May  9 17:58:01 localhost kernel: [    0.020166] CPU: L2 cache: 6144K
May  9 17:58:01 localhost kernel: [    0.020178] CPU 0/0x0 -> Node 0
May  9 17:58:01 localhost kernel: [    0.020221] mce: CPU supports 0 MCE banks
May  9 17:58:01 localhost kernel: [    0.020286] using mwait in idle threads.
May  9 17:58:01 localhost kernel: [    0.020288] Performance Events:
unsupported p6 CPU model 42 no PMU driver, software events only.
May  9 17:58:01 localhost kernel: [    0.020340] SMP alternatives:
switching to UP code
May  9 17:58:01 localhost kernel: [    0.045715] Freeing SMP
alternatives: 32k freed
May  9 17:58:01 localhost kernel: [    0.045744] ACPI: Core revision 20090903
May  9 17:58:01 localhost kernel: [    0.046360] Setting APIC routing to flat
May  9 17:58:01 localhost kernel: [    0.052321] ..TIMER: vector=0x30
apic1=0 pin1=2 apic2=-1 pin2=-1
May  9 17:58:01 localhost kernel: [    0.092455] CPU0: Intel(R)
Core(TM) i3-2100 CPU @ 3.10GHz stepping 07
May  9 17:58:01 localhost kernel: [    0.096001] Brought up 1 CPUs
May  9 17:58:01 localhost kernel: [    0.096001] Total of 1 processors
activated (6159.90 BogoMIPS).
May  9 17:58:01 localhost kernel: [    0.096001] CPU0 attaching NULL
sched-domain.
May  9 17:58:01 localhost kernel: [    0.096001] devtmpfs: initialized
May  9 17:58:01 localhost kernel: [    0.096001] regulator: core version 0.5
May  9 17:58:01 localhost kernel: [    0.096001] NET: Registered
protocol family 16
May  9 17:58:01 localhost kernel: [    0.096001] ACPI: bus type pci registered
May  9 17:58:01 localhost kernel: [    0.096001] PCI: Using
configuration type 1 for base access
May  9 17:58:01 localhost kernel: [    0.096001] bio: create slab <bio-0> at 0
May  9 17:58:01 localhost kernel: [    0.096145] ACPI: EC: Look up EC in DSDT
May  9 17:58:01 localhost kernel: [    0.096854] ACPI: Executed 1
blocks of module-level executable AML code
May  9 17:58:01 localhost kernel: [    0.098945] ACPI: Interpreter enabled
May  9 17:58:01 localhost kernel: [    0.098947] ACPI: (supports S0 S5)
May  9 17:58:01 localhost kernel: [    0.098955] ACPI: Using IOAPIC
for interrupt routing
May  9 17:58:01 localhost kernel: [    0.100208] ACPI: No dock devices found.
May  9 17:58:01 localhost kernel: [    0.100253] ACPI: PCI Root Bridge
[PCI0] (0000:00)
May  9 17:58:01 localhost kernel: [    0.101287] pci 0000:00:01.1: reg
20 io port: [0xd000-0xd00f]
May  9 17:58:01 localhost kernel: [    0.102505] pci 0000:00:02.0: reg
10 32bit mmio pref: [0xe0000000-0xe0ffffff]
May  9 17:58:01 localhost kernel: [    0.103664] pci 0000:00:03.0: reg
10 32bit mmio: [0xf0000000-0xf001ffff]
May  9 17:58:01 localhost kernel: [    0.103762] pci 0000:00:03.0: reg
18 io port: [0xd010-0xd017]
May  9 17:58:01 localhost kernel: [    0.104517] pci 0000:00:04.0: reg
10 io port: [0xd020-0xd03f]
May  9 17:58:01 localhost kernel: [    0.105122] pci 0000:00:04.0: reg
14 32bit mmio: [0xf0400000-0xf07fffff]
May  9 17:58:01 localhost kernel: [    0.105711] pci 0000:00:04.0: reg
18 32bit mmio pref: [0xf0800000-0xf0803fff]
May  9 17:58:01 localhost kernel: [    0.106082] pci 0000:00:05.0: reg
10 io port: [0xd100-0xd1ff]
May  9 17:58:01 localhost kernel: [    0.106122] pci 0000:00:05.0: reg
14 io port: [0xd200-0xd23f]
May  9 17:58:01 localhost kernel: [    0.107069] pci 0000:00:06.0: reg
10 32bit mmio: [0xf0804000-0xf0804fff]
May  9 17:58:01 localhost kernel: [    0.108689] pci 0000:00:0b.0: reg
10 32bit mmio: [0xf0805000-0xf0805fff]
May  9 17:58:01 localhost kernel: [    0.109270] pci 0000:00:0d.0: reg
10 io port: [0xd240-0xd247]
May  9 17:58:01 localhost kernel: [    0.109352] pci 0000:00:0d.0: reg
18 io port: [0xd250-0xd257]
May  9 17:58:01 localhost kernel: [    0.109433] pci 0000:00:0d.0: reg
20 io port: [0xd260-0xd26f]
May  9 17:58:01 localhost kernel: [    0.110109] pci 0000:00:0d.0: reg
24 32bit mmio: [0xf0806000-0xf0807fff]
May  9 17:58:01 localhost kernel: [    0.110649] ACPI: PCI Interrupt
Routing Table [\_SB_.PCI0._PRT]
May  9 17:58:01 localhost kernel: [    0.115540] ACPI: PCI Interrupt
Link [LNKA] (IRQs *5 9 10 11)
May  9 17:58:01 localhost kernel: [    0.115758] ACPI: PCI Interrupt
Link [LNKB] (IRQs 5 9 10 *11)
May  9 17:58:01 localhost kernel: [    0.115831] ACPI: PCI Interrupt
Link [LNKC] (IRQs 5 9 *10 11)
May  9 17:58:01 localhost kernel: [    0.115920] ACPI: PCI Interrupt
Link [LNKD] (IRQs 5 *9 10 11)
May  9 17:58:01 localhost kernel: [    0.116001] vgaarb: device added:
PCI:0000:00:02.0,decodes=io+mem,owns=io+mem,locks=none
May  9 17:58:01 localhost kernel: [    0.116001] vgaarb: loaded
May  9 17:58:01 localhost kernel: [    0.116076] PCI: Using ACPI for IRQ routing
May  9 17:58:01 localhost kernel: [    0.116384] Switching to clocksource tsc
May  9 17:58:01 localhost kernel: [    0.117103] pnp: PnP ACPI init
May  9 17:58:01 localhost kernel: [    0.117109] ACPI: bus type pnp registered
May  9 17:58:01 localhost kernel: [    0.117789] pnp: PnP ACPI: found 5 devices
May  9 17:58:01 localhost kernel: [    0.117790] ACPI: ACPI bus type
pnp unregistered
May  9 17:58:01 localhost kernel: [    0.122042] pci_bus 0000:00:
resource 0 io:  [0x00-0xffff]
May  9 17:58:01 localhost kernel: [    0.122047] pci_bus 0000:00:
resource 1 mem: [0x000000-0xffffffffffffffff]
May  9 17:58:01 localhost kernel: [    0.122074] NET: Registered
protocol family 2
May  9 17:58:01 localhost kernel: [    0.122135] IP route cache hash
table entries: 32768 (order: 6, 262144 bytes)
May  9 17:58:01 localhost kernel: [    0.122854] TCP established hash
table entries: 131072 (order: 9, 2097152 bytes)
May  9 17:58:01 localhost kernel: [    0.123209] TCP bind hash table
entries: 65536 (order: 8, 1048576 bytes)
May  9 17:58:01 localhost kernel: [    0.123604] TCP: Hash tables
configured (established 131072 bind 65536)
May  9 17:58:01 localhost kernel: [    0.123606] TCP reno registered
May  9 17:58:01 localhost kernel: [    0.123661] NET: Registered
protocol family 1
May  9 17:58:01 localhost kernel: [    0.123671] pci 0000:00:00.0:
Limiting direct PCI/PCI transfers
May  9 17:58:01 localhost kernel: [    0.123690] pci 0000:00:01.0:
Activating ISA DMA hang workarounds
May  9 17:58:01 localhost kernel: [    0.123702] pci 0000:00:02.0:
Boot video device
May  9 17:58:01 localhost kernel: [    0.123720]   alloc irq_desc for
22 on node -1
May  9 17:58:01 localhost kernel: [    0.123722]   alloc kstat_irqs on node -1
May  9 17:58:01 localhost kernel: [    0.123745] pci 0000:00:06.0: PCI
INT A -> GSI 22 (level, low) -> IRQ 22
May  9 17:58:01 localhost kernel: [    0.123821] pci 0000:00:06.0: PCI
INT A disabled
May  9 17:58:01 localhost kernel: [    0.123837]   alloc irq_desc for
19 on node -1
May  9 17:58:01 localhost kernel: [    0.123838]   alloc kstat_irqs on node -1
May  9 17:58:01 localhost kernel: [    0.123857] pci 0000:00:0b.0: PCI
INT A -> GSI 19 (level, low) -> IRQ 19
May  9 17:58:01 localhost kernel: [    0.123910] pci 0000:00:0b.0: PCI
INT A disabled
May  9 17:58:01 localhost kernel: [    0.123947] Unpacking initramfs...
May  9 17:58:01 localhost kernel: [    0.306714] Freeing initrd
memory: 10973k freed
May  9 17:58:01 localhost kernel: [    0.307942] platform rtc_cmos:
registered platform RTC device (no PNP device found)
May  9 17:58:01 localhost kernel: [    0.308104] audit: initializing
netlink socket (disabled)
May  9 17:58:01 localhost kernel: [    0.308112] type=2000
audit(1336586274.307:1): initialized
May  9 17:58:01 localhost kernel: [    0.311496] HugeTLB registered 2
MB page size, pre-allocated 0 pages
May  9 17:58:01 localhost kernel: [    0.312647] VFS: Disk quotas dquot_6.5.2
May  9 17:58:01 localhost kernel: [    0.312706] Dquot-cache hash
table entries: 512 (order 0, 4096 bytes)
May  9 17:58:01 localhost kernel: [    0.312776] Loading Reiser4. See
www.namesys.com for a description of Reiser4.
May  9 17:58:01 localhost kernel: [    0.312983] msgmni has been set to 2003
May  9 17:58:01 localhost kernel: [    0.313355] alg: No test for stdrng (krng)
May  9 17:58:01 localhost kernel: [    0.313400] Block layer SCSI
generic (bsg) driver version 0.4 loaded (major 253)
May  9 17:58:01 localhost kernel: [    0.313405] io scheduler noop registered
May  9 17:58:01 localhost kernel: [    0.313409] io scheduler
anticipatory registered
May  9 17:58:01 localhost kernel: [    0.313414] io scheduler deadline
registered
May  9 17:58:01 localhost kernel: [    0.313456] io scheduler cfq
registered (default)
May  9 17:58:01 localhost kernel: [    0.314368] Linux agpgart interface v0.103
May  9 17:58:01 localhost kernel: [    0.314387] Serial: 8250/16550
driver, 4 ports, IRQ sharing enabled
May  9 17:58:01 localhost kernel: [    0.314600] input: Macintosh
mouse button emulation as /devices/virtual/input/input0
May  9 17:58:01 localhost kernel: [    0.314626] PNP: PS/2 Controller
[PNP0303:PS2K,PNP0f03:PS2M] at 0x60,0x64 irq 1,12
May  9 17:58:01 localhost kernel: [    0.315273] serio: i8042 KBD port
at 0x60,0x64 irq 1
May  9 17:58:01 localhost kernel: [    0.315277] serio: i8042 AUX port
at 0x60,0x64 irq 12
May  9 17:58:01 localhost kernel: [    0.315345] mice: PS/2 mouse
device common for all mice
May  9 17:58:01 localhost kernel: [    0.315731] input: AT Translated
Set 2 keyboard as /devices/platform/i8042/serio0/input/input1
May  9 17:58:01 localhost kernel: [    0.315984] rtc_cmos rtc_cmos:
rtc core: registered rtc_cmos as rtc0
May  9 17:58:01 localhost kernel: [    0.316068] rtc0: alarms up to
one day, 114 bytes nvram
May  9 17:58:01 localhost kernel: [    0.316073] cpuidle: using governor ladder
May  9 17:58:01 localhost kernel: [    0.316074] cpuidle: using governor menu
May  9 17:58:01 localhost kernel: [    0.316077] No iBFT detected.
May  9 17:58:01 localhost kernel: [    0.316232] TCP cubic registered
May  9 17:58:01 localhost kernel: [    0.316300] NET: Registered
protocol family 10
May  9 17:58:01 localhost kernel: [    0.316664] Mobile IPv6
May  9 17:58:01 localhost kernel: [    0.316666] NET: Registered
protocol family 17
May  9 17:58:01 localhost kernel: [    0.316711] PM: Resume from disk failed.
May  9 17:58:01 localhost kernel: [    0.316716] registered taskstats version 1
May  9 17:58:01 localhost kernel: [    0.317233] rtc_cmos rtc_cmos:
setting system clock to 2012-05-09 17:57:54 UTC (1336586274)
May  9 17:58:01 localhost kernel: [    0.317253] Initalizing network
drop monitor service
May  9 17:58:01 localhost kernel: [    0.317269] Freeing unused kernel
memory: 592k freed
May  9 17:58:01 localhost kernel: [    0.317331] Write protecting the
kernel read-only data: 4656k
May  9 17:58:01 localhost kernel: [    0.330882] udev[46]: starting version 164
May  9 17:58:01 localhost kernel: [    0.396701] Intel(R) PRO/1000
Network Driver - version 7.3.21-k5-NAPI
May  9 17:58:01 localhost kernel: [    0.396709] Copyright (c)
1999-2006 Intel Corporation.
May  9 17:58:01 localhost kernel: [    0.396788] e1000 0000:00:03.0:
PCI INT A -> GSI 19 (level, low) -> IRQ 19
May  9 17:58:01 localhost kernel: [    0.396820] e1000 0000:00:03.0:
setting latency timer to 64
May  9 17:58:01 localhost kernel: [    0.397001] Uniform
Multi-Platform E-IDE driver
May  9 17:58:01 localhost kernel: [    0.404202] SCSI subsystem initialized
May  9 17:58:01 localhost kernel: [    0.413723] usbcore: registered
new interface driver usbfs
May  9 17:58:01 localhost kernel: [    0.413796] usbcore: registered
new interface driver hub
May  9 17:58:01 localhost kernel: [    0.413865] usbcore: registered
new device driver usb
May  9 17:58:01 localhost kernel: [    0.415630] ehci_hcd: USB 2.0
'Enhanced' Host Controller (EHCI) Driver
May  9 17:58:01 localhost kernel: [    0.416850] libata version 3.00 loaded.
May  9 17:58:01 localhost kernel: [    0.779372] e1000: 0000:00:03.0:
e1000_probe: (PCI:33MHz:32-bit) 08:00:27:cd:d4:38
May  9 17:58:01 localhost kernel: [    0.819761] e1000: eth0:
e1000_probe: Intel(R) PRO/1000 Network Connection
May  9 17:58:01 localhost kernel: [    0.821157] ehci_hcd
0000:00:0b.0: PCI INT A -> GSI 19 (level, low) -> IRQ 19
May  9 17:58:01 localhost kernel: [    0.821192] ehci_hcd
0000:00:0b.0: setting latency timer to 64
May  9 17:58:01 localhost kernel: [    0.821202] ehci_hcd
0000:00:0b.0: EHCI Host Controller
May  9 17:58:01 localhost kernel: [    0.821220] ehci_hcd
0000:00:0b.0: new USB bus registered, assigned bus number 1
May  9 17:58:01 localhost kernel: [    0.821432] ehci_hcd
0000:00:0b.0: irq 19, io mem 0xf0805000
May  9 17:58:01 localhost kernel: [    0.831882] ehci_hcd
0000:00:0b.0: USB 2.0 started, EHCI 1.00
May  9 17:58:01 localhost kernel: [    0.831902] usb usb1: New USB
device found, idVendor=1d6b, idProduct=0002
May  9 17:58:01 localhost kernel: [    0.831904] usb usb1: New USB
device strings: Mfr=3, Product=2, SerialNumber=1
May  9 17:58:01 localhost kernel: [    0.831905] usb usb1: Product:
EHCI Host Controller
May  9 17:58:01 localhost kernel: [    0.831906] usb usb1:
Manufacturer: Linux 2.6.32-reiser4 ehci_hcd
May  9 17:58:01 localhost kernel: [    0.831907] usb usb1:
SerialNumber: 0000:00:0b.0
May  9 17:58:01 localhost kernel: [    0.831956] usb usb1:
configuration #1 chosen from 1 choice
May  9 17:58:01 localhost kernel: [    0.831974] hub 1-0:1.0: USB hub found
May  9 17:58:01 localhost kernel: [    0.831978] hub 1-0:1.0: 8 ports detected
May  9 17:58:01 localhost kernel: [    0.832923] ohci_hcd: USB 1.1
'Open' Host Controller (OHCI) Driver
May  9 17:58:01 localhost kernel: [    0.832933] ahci 0000:00:0d.0: version 3.0
May  9 17:58:01 localhost kernel: [    0.832963]   alloc irq_desc for
21 on node -1
May  9 17:58:01 localhost kernel: [    0.832964]   alloc kstat_irqs on node -1
May  9 17:58:01 localhost kernel: [    0.832985] ahci 0000:00:0d.0:
PCI INT A -> GSI 21 (level, low) -> IRQ 21
May  9 17:58:01 localhost kernel: [    0.833072] ahci: SSS flag set,
parallel bus scan disabled
May  9 17:58:01 localhost kernel: [    0.833241] ahci 0000:00:0d.0:
AHCI 0001.0100 32 slots 1 ports 3 Gbps 0x1 impl SATA mode
May  9 17:58:01 localhost kernel: [    0.833243] ahci 0000:00:0d.0:
flags: 64bit ncq stag only ccc
May  9 17:58:01 localhost kernel: [    0.833261] ahci 0000:00:0d.0:
setting latency timer to 64
May  9 17:58:01 localhost kernel: [    0.833621] scsi0 : ahci
May  9 17:58:01 localhost kernel: [    0.833677] ata1: SATA max
UDMA/133 abar m8192@0xf0806000 port 0xf0806100 irq 21
May  9 17:58:01 localhost kernel: [    0.833735] ata_piix
0000:00:01.1: version 2.13
May  9 17:58:01 localhost kernel: [    0.833742] ata_piix
0000:00:01.1: setting latency timer to 64
May  9 17:58:01 localhost kernel: [    0.833831] scsi1 : ata_piix
May  9 17:58:01 localhost kernel: [    0.834026] scsi2 : ata_piix
May  9 17:58:01 localhost kernel: [    0.834053] ata2: PATA max
UDMA/33 cmd 0x1f0 ctl 0x3f6 bmdma 0xd000 irq 14
May  9 17:58:01 localhost kernel: [    0.834054] ata3: PATA max
UDMA/33 cmd 0x170 ctl 0x376 bmdma 0xd008 irq 15
May  9 17:58:01 localhost kernel: [    0.834132] ohci_hcd
0000:00:06.0: PCI INT A -> GSI 22 (level, low) -> IRQ 22
May  9 17:58:01 localhost kernel: [    0.834165] ohci_hcd
0000:00:06.0: setting latency timer to 64
May  9 17:58:01 localhost kernel: [    0.834174] ohci_hcd
0000:00:06.0: OHCI Host Controller
May  9 17:58:01 localhost kernel: [    0.834182] ohci_hcd
0000:00:06.0: new USB bus registered, assigned bus number 2
May  9 17:58:01 localhost kernel: [    0.834239] ohci_hcd
0000:00:06.0: irq 22, io mem 0xf0804000
May  9 17:58:01 localhost kernel: [    0.888071] usb usb2: New USB
device found, idVendor=1d6b, idProduct=0001
May  9 17:58:01 localhost kernel: [    0.888073] usb usb2: New USB
device strings: Mfr=3, Product=2, SerialNumber=1
May  9 17:58:01 localhost kernel: [    0.888075] usb usb2: Product:
OHCI Host Controller
May  9 17:58:01 localhost kernel: [    0.888076] usb usb2:
Manufacturer: Linux 2.6.32-reiser4 ohci_hcd
May  9 17:58:01 localhost kernel: [    0.888077] usb usb2:
SerialNumber: 0000:00:06.0
May  9 17:58:01 localhost kernel: [    0.888139] usb usb2:
configuration #1 chosen from 1 choice
May  9 17:58:01 localhost kernel: [    0.888158] hub 2-0:1.0: USB hub found
May  9 17:58:01 localhost kernel: [    0.888172] hub 2-0:1.0: 8 ports detected
May  9 17:58:01 localhost kernel: [    0.988930] ata3.00: ATAPI: VBOX
CD-ROM, 1.0, max UDMA/133
May  9 17:58:01 localhost kernel: [    0.989724] ata3.00: configured for UDMA/33
May  9 17:58:01 localhost kernel: [    1.152233] ata1: SATA link up
3.0 Gbps (SStatus 123 SControl 300)
May  9 17:58:01 localhost kernel: [    1.152391] ata1.00: ATA-6: VBOX
HARDDISK, 1.0, max UDMA/133
May  9 17:58:01 localhost kernel: [    1.152394] ata1.00: 104857600
sectors, multi 128: LBA48 NCQ (depth 31/32)
May  9 17:58:01 localhost kernel: [    1.152622] ata1.00: configured
for UDMA/133
May  9 17:58:01 localhost kernel: [    1.152753] scsi 0:0:0:0:
Direct-Access     ATA      VBOX HARDDISK    1.0  PQ: 0 ANSI: 5
May  9 17:58:01 localhost kernel: [    1.153498] scsi 2:0:0:0: CD-ROM
          VBOX     CD-ROM           1.0  PQ: 0 ANSI: 5
May  9 17:58:01 localhost kernel: [    1.164464] sd 0:0:0:0: [sda]
104857600 512-byte logical blocks: (53.6 GB/50.0 GiB)
May  9 17:58:01 localhost kernel: [    1.164493] sd 0:0:0:0: [sda]
Write Protect is off
May  9 17:58:01 localhost kernel: [    1.164495] sd 0:0:0:0: [sda]
Mode Sense: 00 3a 00 00
May  9 17:58:01 localhost kernel: [    1.164506] sd 0:0:0:0: [sda]
Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
May  9 17:58:01 localhost kernel: [    1.164580]  sda: sda1 sda2 sda3 sda4
May  9 17:58:01 localhost kernel: [    1.165583] sd 0:0:0:0: [sda]
Attached SCSI disk
May  9 17:58:01 localhost kernel: [    1.166829] sr0: scsi3-mmc drive:
32x/32x xa/form2 tray
May  9 17:58:01 localhost kernel: [    1.166831] Uniform CD-ROM driver
Revision: 3.20
May  9 17:58:01 localhost kernel: [    1.167007] sr 2:0:0:0: Attached
scsi CD-ROM sr0
May  9 17:58:01 localhost kernel: [    1.176125] sd 0:0:0:0: Attached
scsi generic sg0 type 0
May  9 17:58:01 localhost kernel: [    1.176125] sr 2:0:0:0: Attached
scsi generic sg1 type 5
May  9 17:58:01 localhost kernel: [    1.300163] usb 2-1: new full
speed USB device using ohci_hcd and address 2
May  9 17:58:01 localhost kernel: [    1.542879] usb 2-1: New USB
device found, idVendor=80ee, idProduct=0021
May  9 17:58:01 localhost kernel: [    1.542884] usb 2-1: New USB
device strings: Mfr=1, Product=3, SerialNumber=0
May  9 17:58:01 localhost kernel: [    1.542887] usb 2-1: Product: USB Tablet
May  9 17:58:01 localhost kernel: [    1.542889] usb 2-1:
Manufacturer: VirtualBox
May  9 17:58:01 localhost kernel: [    1.543126] usb 2-1:
configuration #1 chosen from 1 choice
May  9 17:58:01 localhost kernel: [    1.560259] usbcore: registered
new interface driver hiddev
May  9 17:58:01 localhost kernel: [    1.569461] input: VirtualBox USB
Tablet as /devices/pci0000:00/0000:00:06.0/usb2/2-1/2-1:1.0/input/input2
May  9 17:58:01 localhost kernel: [    1.569601] generic-usb
0003:80EE:0021.0001: input,hidraw0: USB HID v1.10 Mouse [VirtualBox
USB Tablet] on usb-0000:00:06.0-1/input0
May  9 17:58:01 localhost kernel: [    1.569624] usbcore: registered
new interface driver usbhid
May  9 17:58:01 localhost kernel: [    1.569759] usbhid: v2.6:USB HID
core driver
May  9 17:58:01 localhost kernel: [    1.620678] ide_generic: please
use "probe_mask=0x3f" module parameter for probing all legacy ISA IDE
ports
May  9 17:58:01 localhost kernel: [    1.652533] ISO 9660 Extensions:
Microsoft Joliet Level 3
May  9 17:58:01 localhost kernel: [    1.654510] ISO 9660 Extensions: RRIP_1991A
May  9 17:58:01 localhost kernel: [    1.662072] aufs: module is from
the staging directory, the quality is unknown, you have been warned.
May  9 17:58:01 localhost kernel: [    1.665388] aufs
2-standalone.tree-32-20100125
May  9 17:58:01 localhost kernel: [    1.677381] loop: module loaded
May  9 17:58:01 localhost kernel: [    1.688665] squashfs: version 4.0
(2009/01/31) Phillip Lougher
May  9 17:58:01 localhost kernel: [    4.759141] udev[655]: starting version 164
May  9 17:58:01 localhost kernel: [    4.947297] parport_pc 00:04:
reported by Plug and Play ACPI
May  9 17:58:01 localhost kernel: [    4.974516] processor LNXCPU:00:
registered as cooling_device0
May  9 17:58:01 localhost kernel: [    4.992197] input: Power Button
as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
May  9 17:58:01 localhost kernel: [    4.992201] ACPI: Power Button [PWRF]
May  9 17:58:01 localhost kernel: [    4.992268] input: Sleep Button
as /devices/LNXSYSTM:00/LNXSLPBN:00/input/input4
May  9 17:58:01 localhost kernel: [    4.992271] ACPI: Sleep Button [SLPF]
May  9 17:58:01 localhost kernel: [    4.997938] ACPI: AC Adapter [AC] (on-line)
May  9 17:58:01 localhost kernel: [    5.095393] input: ImExPS/2
Generic Explorer Mouse as /devices/platform/i8042/serio1/input/input5
May  9 17:58:01 localhost kernel: [    5.096393] input: PC Speaker as
/devices/platform/pcspkr/input/input6
May  9 17:58:01 localhost kernel: [    5.120796] piix4_smbus
0000:00:07.0: SMBus base address uninitialized - upgrade BIOS or use
force_addr=0xaddr
May  9 17:58:01 localhost kernel: [    5.349984] Intel ICH
0000:00:05.0: PCI INT A -> GSI 21 (level, low) -> IRQ 21
May  9 17:58:01 localhost kernel: [    5.350014] Intel ICH
0000:00:05.0: setting latency timer to 64
May  9 17:58:01 localhost kernel: [    5.676138]
intel8x0_measure_ac97_clock: measured 54202 usecs (11481 samples)
May  9 17:58:01 localhost kernel: [    5.676143] intel8x0: measured
clock 211818 rejected
May  9 17:58:01 localhost kernel: [    6.036200]
intel8x0_measure_ac97_clock: measured 55896 usecs (11352 samples)
May  9 17:58:01 localhost kernel: [    6.036204] intel8x0: measured
clock 203091 rejected
May  9 17:58:01 localhost kernel: [    6.396118]
intel8x0_measure_ac97_clock: measured 55872 usecs (11455 samples)
May  9 17:58:01 localhost kernel: [    6.396121] intel8x0: measured
clock 205022 rejected
May  9 17:58:01 localhost kernel: [    6.396122] intel8x0: clocking to 48000
May  9 17:58:01 localhost kernel: [    7.062171] fuse init (API version 7.13)
May  9 17:58:02 localhost acpid: starting up with netlink and the input layer
May  9 17:58:02 localhost acpid: 1 rule loaded
May  9 17:58:02 localhost acpid: waiting for events: event logging is off
May  9 17:58:02 localhost NetworkManager[1429]: <info> NetworkManager
(version 0.8.1) is starting...
May  9 17:58:02 localhost NetworkManager[1429]: <info> Read config
file /etc/NetworkManager/NetworkManager.conf
May  9 17:58:02 localhost NetworkManager[1429]: <info> trying to start
the modem manager...
May  9 17:58:02 localhost NetworkManager[1429]:    SCPlugin-Ifupdown: init!
May  9 17:58:02 localhost NetworkManager[1429]:    SCPlugin-Ifupdown:
update_system_hostname
May  9 17:58:02 localhost NetworkManager[1429]:    SCPluginIfupdown:
management mode: unmanaged
May  9 17:58:02 localhost NetworkManager[1429]:    SCPlugin-Ifupdown:
devices added (path: /sys/devices/pci0000:00/0000:00:03.0/net/eth0,
iface: eth0)
May  9 17:58:02 localhost NetworkManager[1429]:    SCPlugin-Ifupdown:
device added (path: /sys/devices/pci0000:00/0000:00:03.0/net/eth0,
iface: eth0): no ifupdown configuration found.
May  9 17:58:02 localhost NetworkManager[1429]:    SCPlugin-Ifupdown:
devices added (path: /sys/devices/virtual/net/lo, iface: lo)
May  9 17:58:02 localhost NetworkManager[1429]:    SCPlugin-Ifupdown:
device added (path: /sys/devices/virtual/net/lo, iface: lo): no
ifupdown configuration found.
May  9 17:58:02 localhost NetworkManager[1429]:    SCPlugin-Ifupdown: end _init.
May  9 17:58:02 localhost NetworkManager[1429]: <info> Loaded plugin
ifupdown: (C) 2008 Canonical Ltd.  To report bugs please use the
NetworkManager mailing list.
May  9 17:58:02 localhost NetworkManager[1429]: <info> Loaded plugin
keyfile: (c) 2007 - 2008 Red Hat, Inc.  To report bugs please use the
NetworkManager mailing list.
May  9 17:58:02 localhost NetworkManager[1429]:    Ifupdown: get
unmanaged devices count: 0
May  9 17:58:02 localhost NetworkManager[1429]:    SCPlugin-Ifupdown:
(36480352) ... get_connections.
May  9 17:58:02 localhost NetworkManager[1429]:    SCPlugin-Ifupdown:
(36480352) ... get_connections (managed=false): return empty list.
May  9 17:58:02 localhost modem-manager: ModemManager (version 0.4) starting...
May  9 17:58:02 localhost modem-manager: Loaded plugin AnyData
May  9 17:58:02 localhost modem-manager: Loaded plugin Generic
May  9 17:58:02 localhost modem-manager: Loaded plugin Gobi
May  9 17:58:02 localhost NetworkManager[1429]:    Ifupdown: get
unmanaged devices count: 0
May  9 17:58:02 localhost modem-manager: Loaded plugin Option High-Speed
May  9 17:58:02 localhost modem-manager: Loaded plugin Huawei
May  9 17:58:02 localhost modem-manager: Loaded plugin Longcheer
May  9 17:58:02 localhost NetworkManager[1429]: <info> WiFi enabled by
radio killswitch; enabled by state file
May  9 17:58:02 localhost NetworkManager[1429]: <info> WWAN enabled by
radio killswitch; enabled by state file
May  9 17:58:02 localhost NetworkManager[1429]: <info> WiMAX enabled
by radio killswitch; enabled by state file
May  9 17:58:02 localhost NetworkManager[1429]: <info> Networking is
enabled by state file
May  9 17:58:02 localhost modem-manager: Loaded plugin Ericsson MBM
May  9 17:58:02 localhost NetworkManager[1429]: <info> (eth0): carrier is OFF
May  9 17:58:02 localhost NetworkManager[1429]: <info> (eth0): new
Ethernet device (driver: 'e1000' ifindex: 2)
May  9 17:58:02 localhost NetworkManager[1429]: <info> (eth0):
exported as /org/freedesktop/NetworkManager/Devices/0
May  9 17:58:02 localhost NetworkManager[1429]: <info> (eth0): now managed
May  9 17:58:02 localhost NetworkManager[1429]: <info> (eth0): device
state change: 1 -> 2 (reason 2)
May  9 17:58:02 localhost NetworkManager[1429]: <info> (eth0):
bringing up device.
May  9 17:58:02 localhost modem-manager: Loaded plugin MotoC
May  9 17:58:02 localhost modem-manager: Loaded plugin Nokia
May  9 17:58:02 localhost modem-manager: Loaded plugin Novatel
May  9 17:58:02 localhost modem-manager: Loaded plugin Option
May  9 17:58:02 localhost modem-manager: Loaded plugin Sierra
May  9 17:58:02 localhost modem-manager: Loaded plugin SimTech
May  9 17:58:02 localhost modem-manager: Loaded plugin ZTE
May  9 17:58:02 localhost modem-manager: (tty/ttyS0): port's parent
platform driver is not whitelisted
May  9 17:58:02 localhost modem-manager: (tty/ttyS1): port's parent
platform driver is not whitelisted
May  9 17:58:02 localhost kernel: [    8.464700] e1000: eth0 NIC Link
is Up 1000 Mbps Full Duplex, Flow Control: RX
May  9 17:58:02 localhost modem-manager: (tty/ttyS2): port's parent
platform driver is not whitelisted
May  9 17:58:02 localhost modem-manager: (tty/ttyS3): port's parent
platform driver is not whitelisted
May  9 17:58:02 localhost NetworkManager[1429]: <info> (eth0): preparing device.
May  9 17:58:02 localhost NetworkManager[1429]: <info> (eth0):
deactivating device (reason: 2).
May  9 17:58:02 localhost NetworkManager[1429]: <info> Added default
wired connection 'Auto eth0' for
/sys/devices/pci0000:00/0000:00:03.0/net/eth0
May  9 17:58:02 localhost NetworkManager[1429]: <info> (eth0): carrier
now ON (device state 2)
May  9 17:58:02 localhost NetworkManager[1429]: <info> (eth0): device
state change: 2 -> 3 (reason 40)
May  9 17:58:02 localhost NetworkManager[1429]: <info> modem-manager
is now available
May  9 17:58:02 localhost NetworkManager[1429]: <warn> bluez error
getting default adapter: The name org.bluez was not provided by any
.service files
May  9 17:58:02 localhost NetworkManager[1429]: <info> Trying to start
the supplicant...
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) starting connection 'Auto eth0'
May  9 17:58:02 localhost NetworkManager[1429]: <info> (eth0): device
state change: 3 -> 4 (reason 0)
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 1 of 5 (Device Prepare) scheduled...
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 1 of 5 (Device Prepare) started...
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 2 of 5 (Device Configure) scheduled...
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 1 of 5 (Device Prepare) complete.
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 2 of 5 (Device Configure) starting...
May  9 17:58:02 localhost NetworkManager[1429]: <info> (eth0): device
state change: 4 -> 5 (reason 0)
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 2 of 5 (Device Configure) successful.
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 3 of 5 (IP Configure Start) scheduled.
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 2 of 5 (Device Configure) complete.
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 3 of 5 (IP Configure Start) started...
May  9 17:58:02 localhost NetworkManager[1429]: <info> (eth0): device
state change: 5 -> 7 (reason 0)
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Beginning DHCPv4 transaction (timeout in 45 seconds)
May  9 17:58:02 localhost NetworkManager[1429]: <info> dhclient
started with pid 1449
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 3 of 5 (IP Configure Start) complete.
May  9 17:58:02 localhost dhclient: Internet Systems Consortium DHCP
Client 4.1.1-P1
May  9 17:58:02 localhost dhclient: Copyright 2004-2010 Internet
Systems Consortium.
May  9 17:58:02 localhost dhclient: All rights reserved.
May  9 17:58:02 localhost dhclient: For info, please visit
https://www.isc.org/software/dhcp/
May  9 17:58:02 localhost dhclient:
May  9 17:58:02 localhost NetworkManager[1429]: <info> (eth0): DHCPv4
state changed nbi -> preinit
May  9 17:58:02 localhost dhclient: Listening on LPF/eth0/08:00:27:cd:d4:38
May  9 17:58:02 localhost dhclient: Sending on   LPF/eth0/08:00:27:cd:d4:38
May  9 17:58:02 localhost dhclient: Sending on   Socket/fallback
May  9 17:58:02 localhost dhclient: DHCPDISCOVER on eth0 to
255.255.255.255 port 67 interval 5
May  9 17:58:02 localhost dhclient: DHCPOFFER from 10.0.2.2
May  9 17:58:02 localhost dhclient: DHCPREQUEST on eth0 to
255.255.255.255 port 67
May  9 17:58:02 localhost dhclient: DHCPACK from 10.0.2.2
May  9 17:58:02 localhost NetworkManager[1429]: <info> (eth0): DHCPv4
state changed preinit -> bound
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 4 of 5 (IP4 Configure Get) scheduled...
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 4 of 5 (IP4 Configure Get) started...
May  9 17:58:02 localhost NetworkManager[1429]: <info>   address 10.0.2.15
May  9 17:58:02 localhost NetworkManager[1429]: <info>   prefix 24
(255.255.255.0)
May  9 17:58:02 localhost NetworkManager[1429]: <info>   gateway 10.0.2.2
May  9 17:58:02 localhost NetworkManager[1429]: <info>   nameserver
'172.27.139.5'
May  9 17:58:02 localhost NetworkManager[1429]: <info>   nameserver
'172.27.139.8'
May  9 17:58:02 localhost NetworkManager[1429]: <info>   domain name
'pitang.intranet'
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 5 of 5 (IP Configure Commit) scheduled...
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 4 of 5 (IP4 Configure Get) complete.
May  9 17:58:02 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 5 of 5 (IP Configure Commit) started...
May  9 17:58:02 localhost dhclient: bound to 10.0.2.15 -- renewal in
35789 seconds.
May  9 17:58:03 localhost avahi-daemon[1483]: Found user 'avahi' (UID
104) and group 'avahi' (GID 107).
May  9 17:58:03 localhost avahi-daemon[1483]: Successfully dropped
root privileges.
May  9 17:58:03 localhost avahi-daemon[1483]: avahi-daemon 0.6.27 starting up.
May  9 17:58:03 localhost avahi-daemon[1483]: Successfully called chroot().
May  9 17:58:03 localhost avahi-daemon[1483]: Successfully dropped
remaining capabilities.
May  9 17:58:03 localhost avahi-daemon[1484]: chroot.c: open() failed:
No such file or directory
May  9 17:58:03 localhost avahi-daemon[1483]: Failed to open
/etc/resolv.conf: Invalid argument
May  9 17:58:03 localhost avahi-daemon[1483]: No service file found in
/etc/avahi/services.
May  9 17:58:03 localhost avahi-daemon[1483]: Joining mDNS multicast
group on interface eth0.IPv6 with address fe80::a00:27ff:fecd:d438.
May  9 17:58:03 localhost avahi-daemon[1483]: New relevant interface
eth0.IPv6 for mDNS.
May  9 17:58:03 localhost avahi-daemon[1483]: Joining mDNS multicast
group on interface eth0.IPv4 with address 10.0.2.15.
May  9 17:58:03 localhost avahi-daemon[1483]: New relevant interface
eth0.IPv4 for mDNS.
May  9 17:58:03 localhost avahi-daemon[1483]: Network interface
enumeration completed.
May  9 17:58:03 localhost avahi-daemon[1483]: Registering new address
record for fe80::a00:27ff:fecd:d438 on eth0.*.
May  9 17:58:03 localhost avahi-daemon[1483]: Registering new address
record for 10.0.2.15 on eth0.IPv4.
May  9 17:58:03 localhost avahi-daemon[1483]: Registering HINFO record
with values 'X86_64'/'LINUX'.
May  9 17:58:03 localhost bluetoothd[1493]: Bluetooth deamon 4.66
May  9 17:58:03 localhost bluetoothd[1493]: Starting SDP server
May  9 17:58:03 localhost NetworkManager[1429]: <info> (eth0): device
state change: 7 -> 8 (reason 0)
May  9 17:58:03 localhost NetworkManager[1429]: <info> Policy set
'Auto eth0' (eth0) as default for IPv4 routing and DNS.
May  9 17:58:03 localhost NetworkManager[1429]: <info> Activation
(eth0) successful, device activated.
May  9 17:58:03 localhost NetworkManager[1429]: <info> Activation
(eth0) Stage 5 of 5 (IP Configure Commit) complete.
May  9 17:58:03 localhost kernel: [    9.680424] Bluetooth: Core ver 2.15
May  9 17:58:03 localhost kernel: [    9.692671] NET: Registered
protocol family 31
May  9 17:58:03 localhost kernel: [    9.692673] Bluetooth: HCI device
and connection manager initialized
May  9 17:58:03 localhost kernel: [    9.692675] Bluetooth: HCI socket
layer initialized
May  9 17:58:03 localhost kernel: [    9.769775] Bluetooth: L2CAP ver 2.14
May  9 17:58:03 localhost kernel: [    9.769777] Bluetooth: L2CAP
socket layer initialized
May  9 17:58:03 localhost kernel: [    9.788249] Bluetooth: RFCOMM TTY
layer initialized
May  9 17:58:03 localhost kernel: [    9.788253] Bluetooth: RFCOMM
socket layer initialized
May  9 17:58:03 localhost kernel: [    9.788254] Bluetooth: RFCOMM ver 1.11
May  9 17:58:04 localhost bluetoothd[1493]: Starting experimental
netlink support
May  9 17:58:04 localhost bluetoothd[1493]: Failed to find Bluetooth
netlink family
May  9 17:58:04 localhost bluetoothd[1493]: Failed to init netlink plugin
May  9 17:58:04 localhost kernel: [    9.933635] Bluetooth: BNEP
(Ethernet Emulation) ver 1.3
May  9 17:58:04 localhost kernel: [    9.933637] Bluetooth: BNEP
filters: protocol multicast
May  9 17:58:04 localhost bluetoothd[1493]: bridge pan0 created
May  9 17:58:04 localhost kernel: [   10.046978] Bridge firewalling registered
May  9 17:58:04 localhost modem-manager: (net/pan0): could not get
port's parent device
May  9 17:58:04 localhost NetworkManager[1429]:    SCPlugin-Ifupdown:
devices added (path: /sys/devices/virtual/net/pan0, iface: pan0)
May  9 17:58:04 localhost NetworkManager[1429]:    SCPlugin-Ifupdown:
device added (path: /sys/devices/virtual/net/pan0, iface: pan0): no
ifupdown configuration found.
May  9 17:58:04 localhost NetworkManager[1429]: <warn>
/sys/devices/virtual/net/pan0: couldn't determine device driver;
ignoring...
May  9 17:58:04 localhost kernel: [   10.158197] Bluetooth: SCO (Voice
Link) ver 0.6
May  9 17:58:04 localhost kernel: [   10.158198] Bluetooth: SCO socket
layer initialized
May  9 17:58:04 localhost avahi-daemon[1483]: Server startup complete.
Host name is usuario.local. Local service cookie is 91817282.
May  9 17:58:04 localhost /usr/sbin/cron[1704]: (CRON) INFO (pidfile fd = 3)
May  9 17:58:04 localhost /usr/sbin/cron[1709]: (CRON) STARTUP (fork ok)
May  9 17:58:04 localhost /usr/sbin/cron[1709]: (CRON) INFO (Running
@reboot jobs)
May  9 17:58:04 localhost kernel: [   10.728943] lp: driver loaded but
no devices found
May  9 17:58:04 localhost kernel: [   10.769985] ppdev: user-space
parallel port driver
May  9 17:58:05 localhost udev-configure-printer: add /module/lp
May  9 17:58:05 localhost udev-configure-printer: Failed to get parent
May  9 17:58:05 localhost acpid: client connected from 1705[0:0]
May  9 17:58:05 localhost acpid: 1 client rule loaded
May  9 17:58:06 localhost acpid: client connected from 1819[109:117]
May  9 17:58:06 localhost acpid: 1 client rule loaded
May  9 17:58:08 localhost mysqld_safe: Starting mysqld daemon with
databases from /var/lib/mysql
May  9 17:58:08 localhost mysqld: 120509 17:58:08 [Note] Plugin
'FEDERATED' is disabled.
May  9 17:58:08 localhost mysqld: 120509 17:58:08  InnoDB:
Initializing buffer pool, size = 8.0M
May  9 17:58:08 localhost mysqld: 120509 17:58:08  InnoDB: Completed
initialization of buffer pool
May  9 17:58:08 localhost mysqld: 120509 17:58:08  InnoDB: Started;
log sequence number 0 44233
May  9 17:58:08 localhost mysqld: 120509 17:58:08 [Note] Event
Scheduler: Loaded 0 events
May  9 17:58:08 localhost mysqld: 120509 17:58:08 [Note]
/usr/sbin/mysqld: ready for connections.
May  9 17:58:08 localhost mysqld: Version: '5.1.61-0+squeeze1'
socket: '/var/run/mysqld/mysqld.sock'  port: 3306  (Debian)
May  9 17:58:08 localhost /etc/mysql/debian-start[2201]: Upgrading
MySQL tables if necessary.
May  9 17:58:08 localhost /etc/mysql/debian-start[2205]:
/usr/bin/mysql_upgrade: the '--basedir' option is always ignored
May  9 17:58:08 localhost /etc/mysql/debian-start[2205]: Looking for
'mysql' as: /usr/bin/mysql
May  9 17:58:08 localhost /etc/mysql/debian-start[2205]: Looking for
'mysqlcheck' as: /usr/bin/mysqlcheck
May  9 17:58:08 localhost /etc/mysql/debian-start[2205]: This
installation of MySQL is already upgraded to 5.1.61, use --force if
you still need to run mysql_upgrade
May  9 17:58:08 localhost /etc/mysql/debian-start[2217]: Checking for
insecure root accounts.
May  9 17:58:09 localhost /etc/mysql/debian-start[2222]: Triggering
myisam-recover for all MyISAM tables
May  9 17:58:11 localhost polkitd[2353]: started daemon version 0.96
using authority implementation `local' version `0.96'
May  9 17:58:13 localhost kernel: [   19.048902] eth0: no IPv6 routers present
May  9 17:58:17 localhost nautilus: [N-A] Nautilus-Actions Menu
Extender 2.30.2 initializing...
May  9 17:58:17 localhost nautilus: [N-A] Nautilus-Actions Tracker
2.30.2 initializing...
May  9 17:58:21 localhost AptDaemon: INFO: Initializing daemon
May  9 17:58:54 localhost kernel: [   60.059561] aufs
may_rename_srcdir:487:SystemToolsBack[2978]: renaming dir who has
child(ren) on multiple branches, is not supported
May  9 18:00:12 localhost acpid: client 1705[0:0] has disconnected
May  9 18:00:12 localhost acpid: client connected from 3584[0:0]
May  9 18:00:12 localhost acpid: 1 client rule loaded
May  9 18:00:14 localhost gdm-simple-greeter[3626]: Gtk-WARNING:
/scratch/build-area/gtk+2.0-2.20.1/gtk/gtkwidget.c:5628: widget not
within a GtkWindow
May  9 18:00:21 localhost nautilus: [N-A] Nautilus-Actions Menu
Extender 2.30.2 initializing...
May  9 18:00:22 localhost nautilus: [N-A] Nautilus-Actions Tracker
2.30.2 initializing...
May  9 18:01:18 localhost kernel: [  204.144086] usb 1-1: new high
speed USB device using ehci_hcd and address 2
May  9 18:01:18 localhost kernel: [  204.378396] usb 1-1: New USB
device found, idVendor=0bc2, idProduct=5021
May  9 18:01:18 localhost kernel: [  204.378403] usb 1-1: New USB
device strings: Mfr=1, Product=2, SerialNumber=3
May  9 18:01:18 localhost kernel: [  204.378408] usb 1-1: Product:
FreeAgent GoFlex
May  9 18:01:18 localhost kernel: [  204.378411] usb 1-1: Manufacturer: Seagate
May  9 18:01:18 localhost kernel: [  204.378414] usb 1-1: SerialNumber: NA0BLQK7
May  9 18:01:18 localhost kernel: [  204.379150] usb 1-1:
configuration #1 chosen from 1 choice
May  9 18:01:18 localhost kernel: [  204.443485] Initializing USB Mass
Storage driver...
May  9 18:01:18 localhost kernel: [  204.443540] scsi3 : SCSI
emulation for USB Mass Storage devices
May  9 18:01:18 localhost kernel: [  204.443619] usbcore: registered
new interface driver usb-storage
May  9 18:01:18 localhost kernel: [  204.443620] USB Mass Storage
support registered.
May  9 18:01:18 localhost kernel: [  204.445753] usb-storage: device found at 2
May  9 18:01:18 localhost kernel: [  204.445755] usb-storage: waiting
for device to settle before scanning
May  9 18:01:23 localhost kernel: [  209.480679] usb-storage: device
scan complete
May  9 18:01:23 localhost kernel: [  209.488744] scsi 3:0:0:0:
Direct-Access     Seagate  FreeAgent GoFlex 0148 PQ: 0 ANSI: 4
May  9 18:01:23 localhost kernel: [  209.490954] sd 3:0:0:0: Attached
scsi generic sg2 type 0
May  9 18:01:23 localhost kernel: [  209.506068] sd 3:0:0:0: [sdb]
1953525167 512-byte logical blocks: (1.00 TB/931 GiB)
May  9 18:01:23 localhost kernel: [  209.515019] sd 3:0:0:0: [sdb]
Write Protect is off
May  9 18:01:23 localhost kernel: [  209.515026] sd 3:0:0:0: [sdb]
Mode Sense: 1c 00 00 00
May  9 18:01:23 localhost kernel: [  209.515029] sd 3:0:0:0: [sdb]
Assuming drive cache: write through
May  9 18:01:23 localhost kernel: [  209.539078] sd 3:0:0:0: [sdb]
Assuming drive cache: write through
May  9 18:01:23 localhost kernel: [  209.539086]  sdb: sdb1 sdb2
May  9 18:01:23 localhost kernel: [  209.592416] sd 3:0:0:0: [sdb]
Assuming drive cache: write through
May  9 18:01:23 localhost kernel: [  209.592421] sd 3:0:0:0: [sdb]
Attached SCSI disk
May  9 18:01:25 localhost kernel: [  210.833852] reiser4: sdb2: found
disk format 4.0.0.
May  9 18:01:25 localhost kernel: [  211.488183] REISERFS (device
sdb1): found reiserfs format "3.6" with standard journal
May  9 18:01:25 localhost kernel: [  211.488208] REISERFS (device
sdb1): using ordered data mode
May  9 18:01:25 localhost kernel: [  211.523014] REISERFS (device
sdb1): journal params: device sdb1, size 8192, journal first block 18,
max trans len 1024, max batch 900, max commit age 30, max trans age 30
May  9 18:01:25 localhost kernel: [  211.523455] REISERFS (device
sdb1): checking transaction log (sdb1)
May  9 18:01:25 localhost kernel: [  211.731361] REISERFS (device
sdb1): replayed 1 transactions in 0 seconds
May  9 18:01:26 localhost kernel: [  211.979224] REISERFS (device
sdb1): Using r5 hash to sort names
May  9 18:02:54 localhost kernel: [  299.936169] nautilus: sending
ioctl 2285 to a partition!
May  9 18:02:54 localhost kernel: [  299.936408] nautilus: sending
ioctl 2285 to a partition!

At this moment, I mount my external harddisk as /dev/sdb (931Gb
(vendor says 1Tb)).

/dev/sdb1 has reiser3 format.
/dev/sdb2 has reiser4 format.

I formatted /dev/sdb2 with: mkfs.reiser4 -y -L Sandro_Ext_R4 -o
create=ccreg40,compress=gzip1,compressMode=ultim /dev/sdb2

When I tried to copy a folder from /dev/sdb1 (reiser3) to /dev/sdb2
(reiser4), I got the following messages:

May  9 18:03:13 localhost kernel: [  319.439885] BUG: unable to handle
kernel NULL pointer dereference at 0000000000000050
May  9 18:03:13 localhost kernel: [  319.439891] IP:
[<ffffffff81356a7d>] _spin_lock+0x5/0x1b
May  9 18:03:13 localhost kernel: [  319.439910] PGD c69b067 PUD 3d3fa067 PMD 0
May  9 18:03:13 localhost kernel: [  319.439913] Oops: 0002 [#1] SMP
May  9 18:03:13 localhost kernel: [  319.439916] last sysfs file:
/sys/devices/pci0000:00/0000:00:0b.0/usb1/1-1/1-1:1.0/host3/target3:0:0/3:0:0:0/block/sdb/sdb1/uevent
May  9 18:03:13 localhost kernel: [  319.439919] CPU 0
May  9 18:03:13 localhost kernel: [  319.439920] Modules linked in:
usb_storage cpufreq_userspace cpufreq_stats cpufreq_powersave
cpufreq_conservative ppdev lp sco bridge stp bnep rfcomm l2cap crc16
bluetooth rfkill binfmt_misc fuse snd_intel8x0 snd_ac97_codec ac97_bus
snd_pcm snd_seq snd_timer snd_seq_device snd i2c_piix4 pcspkr psmouse
serio_raw i2c_core joydev soundcore evdev ac button processor
parport_pc parport snd_page_alloc squashfs loop aufs(C) nls_utf8 isofs
ide_generic usbhid hid sg sr_mod cdrom sd_mod crc_t10dif ata_generic
pata_acpi ohci_hcd ata_piix ahci ehci_hcd thermal libata
ide_pci_generic thermal_sys usbcore nls_base scsi_mod e1000 ide_core
[last unloaded: scsi_wait_scan]
May  9 18:03:13 localhost kernel: [  319.439957] Pid: 3953, comm:
nautilus Tainted: G         C 2.6.32-reiser4 #1 VirtualBox
May  9 18:03:13 localhost kernel: [  319.439959] RIP:
0010:[<ffffffff81356a7d>]  [<ffffffff81356a7d>] _spin_lock+0x5/0x1b
May  9 18:03:13 localhost kernel: [  319.439963] RSP:
0018:ffff88003a67fc00  EFLAGS: 00010292
May  9 18:03:13 localhost kernel: [  319.439965] RAX: 0000000000010000
RBX: ffff88003a67fcc8 RCX: 0000000000000010
May  9 18:03:13 localhost kernel: [  319.439967] RDX: 0000000000000000
RSI: ffff880001b0b988 RDI: 0000000000000050
May  9 18:03:13 localhost kernel: [  319.439969] RBP: ffff880001b0b988
R08: ffff880001b0b988 R09: ffff8800159eb910
May  9 18:03:13 localhost kernel: [  319.439971] R10: 0000000000001000
R11: 0000000000000202 R12: ffffea0000bf7590
May  9 18:03:13 localhost kernel: [  319.439973] R13: 0000000000000000
R14: 0000000000000000 R15: 0000000000000000
May  9 18:03:13 localhost kernel: [  319.439975] FS:
00007fb817849700(0000) GS:ffff880001800000(0000)
knlGS:0000000000000000
May  9 18:03:13 localhost kernel: [  319.439978] CS:  0010 DS: 0000
ES: 0000 CR0: 0000000080050033
May  9 18:03:13 localhost kernel: [  319.439979] CR2: 0000000000000050
CR3: 0000000007eb1000 CR4: 00000000000006f0
May  9 18:03:13 localhost kernel: [  319.439986] DR0: 0000000000000000
DR1: 0000000000000000 DR2: 0000000000000000
May  9 18:03:13 localhost kernel: [  319.439989] DR3: 0000000000000000
DR6: 00000000ffff0ff0 DR7: 0000000000000400
May  9 18:03:13 localhost kernel: [  319.439991] Process nautilus
(pid: 3953, threadinfo ffff88003a67e000, task ffff880001b04e20)
May  9 18:03:13 localhost kernel: [  319.439992] Stack:
May  9 18:03:13 localhost kernel: [  319.439994]  ffffffff81187ac9
0000000000000080 0000000000000000 00000000000080d0
May  9 18:03:13 localhost kernel: [  319.439997] <0> ffff88003a67fcc8
ffff880001b0b988 ffffea0000bf7590 0000000000000000
May  9 18:03:13 localhost kernel: [  319.439999] <0> 0000000000000000
0000000000000000 ffffffff81189698 0000000000000010
May  9 18:03:13 localhost kernel: [  319.440003] Call Trace:
May  9 18:03:13 localhost kernel: [  319.440007]  [<ffffffff81187ac9>]
? checkin_logical_cluster+0x21/0x1ba
May  9 18:03:13 localhost kernel: [  319.440011]  [<ffffffff81189698>]
? capture_page_cluster+0xa6/0xe0
May  9 18:03:13 localhost kernel: [  319.440014]  [<ffffffff81189e03>]
? write_end_cryptcompress+0xd8/0x158
May  9 18:03:13 localhost kernel: [  319.440017]  [<ffffffff81186893>]
? reiser4_write_end_careful+0x10d/0x194
May  9 18:03:13 localhost kernel: [  319.440022]  [<ffffffff81109622>]
? pipe_to_file+0x13f/0x14e
May  9 18:03:13 localhost kernel: [  319.440026]  [<ffffffff8117949b>]
? reiser4_dirty_inode+0xd/0x70
May  9 18:03:13 localhost kernel: [  319.440029]  [<ffffffff811094e3>]
? pipe_to_file+0x0/0x14e
May  9 18:03:13 localhost kernel: [  319.440032]  [<ffffffff81108487>]
? splice_from_pipe_feed+0x4c/0xd0
May  9 18:03:13 localhost kernel: [  319.440035]  [<ffffffff81109465>]
? generic_file_splice_write+0xb8/0x136
May  9 18:03:13 localhost kernel: [  319.440038]  [<ffffffff811091e1>]
? sys_splice+0x369/0x477
May  9 18:03:13 localhost kernel: [  319.440042]  [<ffffffff81010a82>]
? system_call_fastpath+0x16/0x1b
May  9 18:03:13 localhost kernel: [  319.440043] Code: 2f 00 00 00 01
74 05 e8 62 76 e9 ff 48 89 d0 c3 fa 66 0f 1f 44 00 00 3e 81 2f 00 00
00 01 74 05 e8 49 76 e9 ff c3 b8 00 00 01 00 <3e> 0f c1 07 0f b7 d0 c1
e8 10 39 c2 74 07 f3 90 0f b7 17 eb f5
May  9 18:03:13 localhost kernel: [  319.440064] RIP
[<ffffffff81356a7d>] _spin_lock+0x5/0x1b
May  9 18:03:13 localhost kernel: [  319.440067]  RSP <ffff88003a67fc00>
May  9 18:03:13 localhost kernel: [  319.440069] CR2: 0000000000000050
May  9 18:03:13 localhost kernel: [  319.440071] ---[ end trace
291a4085ba950956 ]---
May  9 18:03:22 localhost AptDaemon: INFO: Quiting due to inactivity
May  9 18:03:22 localhost AptDaemon: INFO: Shutdown was requested

Any help is wellcome. :)

2012/5/7 dimas <dimas000@ya.ru>:
>> I made 3 videos (by XVidCap without sound) with these tests.
>> They're available in http://www.smartsolutionfactory.com.br/reiser4
> screencasts? for what reason?
>
>> After reboot the VM, no problem. But after it, I've tried to copy a
>> folder from a reiser3 partition to a reiser4 partition, and
>> unfortunally it has failed. :(
>> I need to know what I'm doing wrong.
> simply show output of smth like "cp -av /mnt/reiser3/folder /mnt/reiser4"
> and maybe following dmesg/syslog messages, if copying triggers some oops/warning
