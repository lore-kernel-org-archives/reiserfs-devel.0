From: Jose R R <jose.r.r@metztli.com>
Subject: installation-reports: Succesful Reiser4 SFRN 4.0.1 Jessie d-i/ kernel
 4.6.2-2 (backports) success installation on VirtualBox
Date: Sat, 2 Jul 2016 09:48:32 -0700
Message-ID: <CAM12Q5Rk7-MOX++O6qobSpVEXC_viVk2-F9cjh7ZJMfpyUZw1Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=7NR6x+BbtEoXp88m/c2G0DGllsUDWfevcdTAdSjeRbk=;
        b=tT1+xqCRAgwQGfQ/31brcsslJuqlrls66mTAUXPT6Z/t03QNPnQyCsOVfjBfH44vkm
         UNfN6fl0EF/VYUM0qEOKkMIPqG3+rlGxCOLfRg8HhThnketkz9lZZwxQKScxSQhliIso
         dVPM2s48I/3M35JNcPAwBSUfYnJgsqZM1W6fGlXOztS70VNDxJeYf8HpjrKm4wOHKB3K
         rbRq1mQnN+tR7aW7A47aB159sSztjS2M1vmLJJz/s8aku0cElQHUMZgiZYXcQ22ZfDRt
         gFBUhkbzSftqSPHXRa4KUsiB7PO0ZhGQKLzYduQBLWupabkbbaoJLCjiZ0bAKeOinx/l
         dEmg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

---------- Forwarded message ----------
From: Jose R Rodriguez <jose@metztli-it.com>
Date: Sat, Jul 2, 2016 at 9:28 AM
Subject: Bug#829349: installation-reports: Succesful Reiser4 SFRN
4.0.1 Jessie d-i/ kernel 4.6.2-2 (backports) success installation on
VirtualBox
To: Debian Bug Tracking System <submit@bugs.debian.org>


Package: installation-reports
Severity: normal

Dear Maintainer,

*** Reporter, please consider answering these questions, where appropriate ***

   * What led up to the situation?
   * What exactly did you do (or not do) that was effective (or
     ineffective)?
   * What was the outcome of this action?
   * What outcome did you expect instead?

*** End of the template - remove these template lines ***


-- Package-specific info:

Boot method: CD
Image version: https://metztli.it/readOnlyEphemeral/metztli-bp.iso
https://metztli.it/readOnlyEphemeral/metztli-bp.SHA256SUM
Date: 07-02-2016

Machine: VirtualBox 5.0.20
Partitions:
Filesystem     Type     1K-blocks   Used Available Use% Mounted on
udev           devtmpfs     10240      0     10240   0% /dev
tmpfs          tmpfs       204124   4436    199688   3% /run
/dev/sda5      reiser4    9822436 973080   8849356  10% /
tmpfs          tmpfs       510304      0    510304   0% /dev/shm
tmpfs          tmpfs         5120      0      5120   0% /run/lock
tmpfs          tmpfs       510304      0    510304   0% /sys/fs/cgroup
/dev/sda1      ext2        140805  34235     99300  26% /boot

Base System Installation Checklist:
[O] = OK, [E] = Error (please elaborate below), [ ] = didn't try it

Initial boot:           [O]
Detect network card:    [O]
Configure network:      [O]
Detect CD:              [O]
Load installer modules: [O]
Clock/timezone setup:   [O]
User/password setup:    [O]
Detect hard drives:     [O]
Partition hard drives:  [O]
Install base system:    [O]
Install tasks:          [O]
Install boot loader:    [O]
Overall install:        [O]

Comments/Problems:

Reiser4 [Software Format Release Number (SFRN) 4.0.1]-enabled
Debian-Installer and kernel 4.6.2-2
for Jessie on AMD64 installed smoothly via expert option. Updated
reiser4progs reiser4progs_1.1.0-1.x
Automatically downloaded linux-base 4.x dependency from backports.

--

Please make sure that the hardware-summary log file, and any other
installation logs that you think would be useful are attached to this
report. Please compress large files using gzip.

Once you have filled out this report, mail it to submit@bugs.debian.org.

==============================================
Installer lsb-release:
==============================================
DISTRIB_ID=Debian
DISTRIB_DESCRIPTION="Debian GNU/Linux installer"
DISTRIB_RELEASE="8 (jessie) - installer build 20160702-09:32"
X_INSTALLATION_MEDIUM=netboot

==============================================
Installer hardware-summary:
==============================================
uname -a: Linux xipetotec 4.6.0-1+reiser4.0.1-amd64 #1 SMP Debian
4.6.2-2+reiser4.0.1 (2016-06-26) x86_64 Xonecuiltzin
lspci -knn: 00:00.0 Host bridge [0600]: Intel Corporation 440FX -
82441FX PMC [Natoma] [8086:1237] (rev 02)
lspci -knn: 00:01.0 ISA bridge [0601]: Intel Corporation 82371SB PIIX3
ISA [Natoma/Triton II] [8086:7000]
lspci -knn: 00:01.1 IDE interface [0101]: Intel Corporation
82371AB/EB/MB PIIX4 IDE [8086:7111] (rev 01)
lspci -knn:     Kernel driver in use: ata_piix
lspci -knn: 00:02.0 VGA compatible controller [0300]: InnoTek
Systemberatung GmbH VirtualBox Graphics Adapter [80ee:beef]
lspci -knn: 00:03.0 Ethernet controller [0200]: Intel Corporation
82540EM Gigabit Ethernet Controller [8086:100e] (rev 02)
lspci -knn:     Subsystem: Intel Corporation Device [8086:001e]
lspci -knn:     Kernel driver in use: e1000
lspci -knn: 00:04.0 System peripheral [0880]: InnoTek Systemberatung
GmbH VirtualBox Guest Service [80ee:cafe]
lspci -knn: 00:06.0 USB controller [0c03]: Apple Inc.
KeyLargo/Intrepid USB [106b:003f]
lspci -knn:     Kernel driver in use: ohci-pci
lspci -knn: 00:07.0 Bridge [0680]: Intel Corporation 82371AB/EB/MB
PIIX4 ACPI [8086:7113] (rev 08)
lspci -knn: 00:0d.0 SATA controller [0106]: Intel Corporation
82801HM/HEM (ICH8M/ICH8M-E) SATA Controller [AHCI mode] [8086:2829]
(rev 02)
lspci -knn:     Kernel driver in use: ahci
usb-list:
usb-list: Bus 01 Device 01: OHCI PCI host controller [1d6b:0001]
usb-list:    Level 00 Parent 00 Port 00  Class 09(hub  ) Subclass 00 Protocol 00
usb-list:    Manufacturer: Linux 4.6.0-1+reiser4.0.1-amd64 ohci_hcd
usb-list:    Interface 00: Class 09(hub  ) Subclass 00 Protocol 00 Driver hub
usb-list:
usb-list: Bus 01 Device 02: USB Tablet [80ee:0021]
usb-list:    Level 01 Parent 01 Port 00  Class 00(>ifc ) Subclass 00 Protocol 00
usb-list:    Manufacturer: VirtualBox
usb-list:    Interface 00: Class 03(HID  ) Subclass 00 Protocol 00 Driver usbhid
lsmod: Module                  Size  Used by
lsmod: fuse                   98304  0
lsmod: ufs                    73728  0
lsmod: qnx4                   16384  0
lsmod: hfsplus               102400  0
lsmod: hfs                    57344  0
lsmod: minix                  36864  0
lsmod: msdos                  20480  0
lsmod: nls_utf8               16384  1
lsmod: battery                16384  0
lsmod: dm_mod                106496  0
lsmod: md_mod                131072  0
lsmod: xfs                   958464  0
lsmod: libcrc32c              16384  1 xfs
lsmod: reiser4               442368  1
lsmod: jfs                   176128  0
lsmod: btrfs                1007616  0
lsmod: xor                    24576  1 btrfs
lsmod: raid6_pq              102400  1 btrfs
lsmod: ntfs                   98304  0
lsmod: vfat                   20480  0
lsmod: fat                    69632  2 vfat,msdos
lsmod: ext4                  593920  1
lsmod: ecb                    16384  0
lsmod: crc16                  16384  1 ext4
lsmod: jbd2                  106496  1 ext4
lsmod: crc32c_generic         16384  4
lsmod: mbcache                16384  2 ext4
lsmod: usb_storage            69632  0
lsmod: vga16fb                24576  0
lsmod: vgastate               20480  1 vga16fb
lsmod: hid_generic            16384  0
lsmod: usbhid                 49152  0
lsmod: hid                   118784  2 hid_generic,usbhid
lsmod: sg                     32768  0
lsmod: sd_mod                 45056  3
lsmod: sr_mod                 24576  0
lsmod: cdrom                  57344  1 sr_mod
lsmod: ata_generic            16384  0
lsmod: ahci                   36864  2
lsmod: libahci                32768  1 ahci
lsmod: ata_piix               36864  0
lsmod: ohci_pci               16384  0
lsmod: ehci_pci               16384  0
lsmod: ohci_hcd               49152  1 ohci_pci
lsmod: ehci_hcd               77824  1 ehci_pci
lsmod: usbcore               241664  6
usb_storage,ohci_hcd,ohci_pci,ehci_hcd,ehci_pci,usbhid
lsmod: usb_common             16384  1 usbcore
lsmod: e1000                 135168  0
lsmod: libata                233472  4 ahci,libahci,ata_generic,ata_piix
lsmod: scsi_mod              229376  5 sg,usb_storage,libata,sd_mod,sr_mod
df: Filesystem           1K-blocks      Used Available Use% Mounted on
df: none                    102064        60    102004   0% /run
df: devtmpfs                496188         0    496188   0% /dev
df: /dev/sda5              9822436    937512   8884924  10% /target
df: /dev/sda1               140805     34235     99300  26% /target/boot
df: /dev/sda5              9822436    937512   8884924  10% /dev/.static/dev
df: devtmpfs                496188         0    496188   0% /target/dev
free:              total       used       free     shared    buffers     cached
free: Mem:       1020608     649456     371152     114548       2960     488628
free: -/+ buffers/cache:     157868     862740
free: Swap:            0          0          0
/proc/cmdline: BOOT_IMAGE=linux priority=low vga=788 initrd=initrd.gz ---
/proc/cpuinfo: processor        : 0
/proc/cpuinfo: vendor_id        : GenuineIntel
/proc/cpuinfo: cpu family       : 6
/proc/cpuinfo: model            : 42
/proc/cpuinfo: model name       : Intel(R) Core(TM) i7-2670QM CPU @ 2.20GHz
/proc/cpuinfo: stepping : 7
/proc/cpuinfo: cpu MHz          : 2195.016
/proc/cpuinfo: cache size       : 6144 KB
/proc/cpuinfo: physical id      : 0
/proc/cpuinfo: siblings : 1
/proc/cpuinfo: core id          : 0
/proc/cpuinfo: cpu cores        : 1
/proc/cpuinfo: apicid           : 0
/proc/cpuinfo: initial apicid   : 0
/proc/cpuinfo: fpu              : yes
/proc/cpuinfo: fpu_exception    : yes
/proc/cpuinfo: cpuid level      : 13
/proc/cpuinfo: wp               : yes
/proc/cpuinfo: flags            : fpu vme de pse tsc msr pae mce cx8
apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall
nx rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc eagerfpu
pni pclmulqdq monitor ssse3 cx16 sse4_1 sse4_2 popcnt aes xsave avx
hypervisor lahf_lm
/proc/cpuinfo: bugs             :
/proc/cpuinfo: bogomips : 4390.03
/proc/cpuinfo: clflush size     : 64
/proc/cpuinfo: cache_alignment  : 64
/proc/cpuinfo: address sizes    : 36 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo:
/proc/ioports: 0000-0cf7 : PCI Bus 0000:00
/proc/ioports:   0000-001f : dma1
/proc/ioports:   0020-0021 : pic1
/proc/ioports:   0040-0043 : timer0
/proc/ioports:   0050-0053 : timer1
/proc/ioports:   0060-0060 : keyboard
/proc/ioports:   0064-0064 : keyboard
/proc/ioports:   0070-0071 : rtc_cmos
/proc/ioports:     0070-0071 : rtc0
/proc/ioports:   0080-008f : dma page reg
/proc/ioports:   00a0-00a1 : pic2
/proc/ioports:   00c0-00df : dma2
/proc/ioports:   00f0-00ff : fpu
/proc/ioports:   0170-0177 : 0000:00:01.1
/proc/ioports:     0170-0177 : ata_piix
/proc/ioports:   01f0-01f7 : 0000:00:01.1
/proc/ioports:     01f0-01f7 : ata_piix
/proc/ioports:   0376-0376 : 0000:00:01.1
/proc/ioports:     0376-0376 : ata_piix
/proc/ioports:   03f6-03f6 : 0000:00:01.1
/proc/ioports:     03f6-03f6 : ata_piix
/proc/ioports: 0cf8-0cff : PCI conf1
/proc/ioports: 0d00-ffff : PCI Bus 0000:00
/proc/ioports:   4000-4003 : ACPI PM1a_EVT_BLK
/proc/ioports:   4004-4005 : ACPI PM1a_CNT_BLK
/proc/ioports:   4008-400b : ACPI PM_TMR
/proc/ioports:   4020-4021 : ACPI GPE0_BLK
/proc/ioports:   d000-d00f : 0000:00:01.1
/proc/ioports:     d000-d00f : ata_piix
/proc/ioports:   d010-d017 : 0000:00:03.0
/proc/ioports:     d010-d017 : e1000
/proc/ioports:   d020-d03f : 0000:00:04.0
/proc/ioports:   d040-d047 : 0000:00:0d.0
/proc/ioports:     d040-d047 : ahci
/proc/ioports:   d050-d057 : 0000:00:0d.0
/proc/ioports:     d050-d057 : ahci
/proc/ioports:   d060-d06f : 0000:00:0d.0
/proc/ioports:     d060-d06f : ahci
/proc/iomem: 00000000-00000fff : reserved
/proc/iomem: 00001000-0009fbff : System RAM
/proc/iomem: 0009fc00-0009ffff : reserved
/proc/iomem: 000a0000-000bffff : PCI Bus 0000:00
/proc/iomem: 000c0000-000c7fff : Video ROM
/proc/iomem: 000e2000-000ef3ff : Adapter ROM
/proc/iomem: 000f0000-000fffff : reserved
/proc/iomem:   000f0000-000fffff : System ROM
/proc/iomem: 00100000-3ffeffff : System RAM
/proc/iomem:   01000000-015cb794 : Kernel code
/proc/iomem:   015cb795-01b10aff : Kernel data
/proc/iomem:   01c67000-01d34fff : Kernel bss
/proc/iomem: 3fff0000-3fffffff : ACPI Tables
/proc/iomem: 40000000-ffdfffff : PCI Bus 0000:00
/proc/iomem:   e0000000-e0ffffff : 0000:00:02.0
/proc/iomem:     e0000000-e00eafff : BOOTFB
/proc/iomem:   f0000000-f001ffff : 0000:00:03.0
/proc/iomem:     f0000000-f001ffff : e1000
/proc/iomem:   f0400000-f07fffff : 0000:00:04.0
/proc/iomem:   f0800000-f0803fff : 0000:00:04.0
/proc/iomem:   f0804000-f0804fff : 0000:00:06.0
/proc/iomem:     f0804000-f0804fff : ohci_hcd
/proc/iomem:   f0806000-f0807fff : 0000:00:0d.0
/proc/iomem:     f0806000-f0807fff : ahci
/proc/iomem:   fec00000-fec003ff : IOAPIC 0
/proc/iomem:   fee00000-fee00fff : Local APIC
/proc/iomem: fffc0000-ffffffff : reserved
/proc/interrupts:            CPU0
/proc/interrupts:   0:         39   IO-APIC   2-edge      timer
/proc/interrupts:   1:       1769   IO-APIC   1-edge      i8042
/proc/interrupts:   8:          1   IO-APIC   8-edge      rtc0
/proc/interrupts:   9:          0   IO-APIC   9-fasteoi   acpi
/proc/interrupts:  12:          3   IO-APIC  12-edge      i8042
/proc/interrupts:  14:          0   IO-APIC  14-edge      ata_piix
/proc/interrupts:  15:      14989   IO-APIC  15-edge      ata_piix
/proc/interrupts:  19:     289963   IO-APIC  19-fasteoi   eth0
/proc/interrupts:  21:     492641   IO-APIC  21-fasteoi   ahci[0000:00:0d.0]
/proc/interrupts:  22:         25   IO-APIC  22-fasteoi   ohci_hcd:usb1
/proc/interrupts: NMI:          0   Non-maskable interrupts
/proc/interrupts: LOC:    8910974   Local timer interrupts
/proc/interrupts: SPU:          0   Spurious interrupts
/proc/interrupts: PMI:          0   Performance monitoring interrupts
/proc/interrupts: IWI:         20   IRQ work interrupts
/proc/interrupts: RTR:          0   APIC ICR read retries
/proc/interrupts: RES:          0   Rescheduling interrupts
/proc/interrupts: CAL:          0   Function call interrupts
/proc/interrupts: TLB:          0   TLB shootdowns
/proc/interrupts: TRM:          0   Thermal event interrupts
/proc/interrupts: THR:          0   Threshold APIC interrupts
/proc/interrupts: DFR:          0   Deferred Error APIC interrupts
/proc/interrupts: MCE:          0   Machine check exceptions
/proc/interrupts: MCP:         50   Machine check polls
/proc/interrupts: ERR:          0
/proc/interrupts: MIS:          0
/proc/interrupts: PIN:          0   Posted-interrupt notification event
/proc/interrupts: PIW:          0   Posted-interrupt wakeup event
/proc/meminfo: MemTotal:        1020608 kB
/proc/meminfo: MemFree:          370768 kB
/proc/meminfo: MemAvailable:     665748 kB
/proc/meminfo: Buffers:            2960 kB
/proc/meminfo: Cached:           488628 kB
/proc/meminfo: SwapCached:            0 kB
/proc/meminfo: Active:           297424 kB
/proc/meminfo: Inactive:         232904 kB
/proc/meminfo: Active(anon):     108928 kB
/proc/meminfo: Inactive(anon):    44336 kB
/proc/meminfo: Active(file):     188496 kB
/proc/meminfo: Inactive(file):   188568 kB
/proc/meminfo: Unevictable:           0 kB
/proc/meminfo: Mlocked:               0 kB
/proc/meminfo: SwapTotal:             0 kB
/proc/meminfo: SwapFree:              0 kB
/proc/meminfo: Dirty:               784 kB
/proc/meminfo: Writeback:             0 kB
/proc/meminfo: AnonPages:         38744 kB
/proc/meminfo: Mapped:             7640 kB
/proc/meminfo: Shmem:            114548 kB
/proc/meminfo: Slab:              99852 kB
/proc/meminfo: SReclaimable:      91224 kB
/proc/meminfo: SUnreclaim:         8628 kB
/proc/meminfo: KernelStack:        1792 kB
/proc/meminfo: PageTables:         1092 kB
/proc/meminfo: NFS_Unstable:          0 kB
/proc/meminfo: Bounce:                0 kB
/proc/meminfo: WritebackTmp:          0 kB
/proc/meminfo: CommitLimit:      510304 kB
/proc/meminfo: Committed_AS:     158836 kB
/proc/meminfo: VmallocTotal:   34359738367 kB
/proc/meminfo: VmallocUsed:           0 kB
/proc/meminfo: VmallocChunk:          0 kB
/proc/meminfo: HardwareCorrupted:     0 kB
/proc/meminfo: AnonHugePages:         0 kB
/proc/meminfo: HugePages_Total:       0
/proc/meminfo: HugePages_Free:        0
/proc/meminfo: HugePages_Rsvd:        0
/proc/meminfo: HugePages_Surp:        0
/proc/meminfo: Hugepagesize:       2048 kB
/proc/meminfo: DirectMap4k:       81856 kB
/proc/meminfo: DirectMap2M:      966656 kB
/proc/bus/input/devices: I: Bus=0011 Vendor=0001 Product=0001 Version=ab41
/proc/bus/input/devices: N: Name="AT Translated Set 2 keyboard"
/proc/bus/input/devices: P: Phys=isa0060/serio0/input0
/proc/bus/input/devices: S: Sysfs=/devices/platform/i8042/serio0/input/input0
/proc/bus/input/devices: U: Uniq=
/proc/bus/input/devices: H: Handlers=sysrq kbd leds
/proc/bus/input/devices: B: PROP=0
/proc/bus/input/devices: B: EV=120013
/proc/bus/input/devices: B: KEY=402000000 3803078f800d001
feffffdfffefffff fffffffffffffffe
/proc/bus/input/devices: B: MSC=10
/proc/bus/input/devices: B: LED=7
/proc/bus/input/devices:
/proc/bus/input/devices: I: Bus=0003 Vendor=80ee Product=0021 Version=0110
/proc/bus/input/devices: N: Name="VirtualBox USB Tablet"
/proc/bus/input/devices: P: Phys=usb-0000:00:06.0-1/input0
/proc/bus/input/devices: S:
Sysfs=/devices/pci0000:00/0000:00:06.0/usb1/1-1/1-1:1.0/0003:80EE:0021.0001/input/input2
/proc/bus/input/devices: U: Uniq=
/proc/bus/input/devices: H: Handlers=mouse0
/proc/bus/input/devices: B: PROP=0
/proc/bus/input/devices: B: EV=1f
/proc/bus/input/devices: B: KEY=1f0000 0 0 0 0
/proc/bus/input/devices: B: REL=140
/proc/bus/input/devices: B: ABS=3
/proc/bus/input/devices: B: MSC=10
/proc/bus/input/devices:

-- System Information:
Debian Release: 8.5
  APT prefers stable-updates
  APT policy: (500, 'stable-updates'), (500, 'stable')
Architecture: amd64 (x86_64)

Kernel: Linux 4.6.0-1+reiser4.0.1-amd64 (SMP w/1 CPU core)
Locale: LANG=en_US.UTF-8, LC_CTYPE=en_US.UTF-8 (charmap=UTF-8)
Shell: /bin/sh linked to /bin/dash
Init: systemd (via /run/systemd/system)



-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
