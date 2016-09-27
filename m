From: jose@mictlantecuhtli.metztli-it.com (Jose R Rodriguez)
Subject: Reiser4 -enabled Jessie (stable) Debian-Installer now with elvis-tiny text editor
Date: Tue, 27 Sep 2016 02:04:47 -0700 (PDT)
Message-ID: <20160927090447.B16A2FE4AE@mictlantecuhtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1474967083; h=From: Date: Message-Id: To: Subject: Sender;
 bh=/7hiLRrvqU7tqjOx6OpYxGZ6qHQk92Gyf/QvaoWEdrI=; b=e3jycl0W2UBTIV3SpRQLJY16mA9q8zOQLAHr1LlpkjN2m3xuafh40WHY1o5PppPkKfndAb5A
 bF9U/kBt8PbQWORd3badnwH/sgJGxsz9h3AhidGqs6ypHlRWfUTObuKVO7IeKzcVjmOyXyuR
 Xz//BJHzi1Ns/Efn7p3ONZ0XkFM=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org


Debian Bug report logs - #838345
installation-reports: Successful Reiser4 Jessie 4.7.0-1+reiser4.0.1-amd64_4.7.4-1 kernel on VirtualBox 5.1.6

Package: installation-reports; Maintainer for installation-reports is Debian Install Team <debian-boot@lists.debian.org>;

Reported by: Jose R Rodriguez <jose@metztli-it.com>

Date: Tue, 20 Sep 2016 07:39:02 UTC

Severity: normal

Reply or subscribe to this bug.

Toggle useless messages

View this report as an mbox folder, status mbox, maintainer mbox

Message #5 received at submit@bugs.debian.org (full text, mbox, reply):
From: Jose R Rodriguez <jose@metztli-it.com>
To: Debian Bug Tracking System <submit@bugs.debian.org>
Subject: installation-reports: Successful Reiser4 Jessie 4.7.0-1+reiser4.0.1-amd64_4.7.4-1 kernel on VirtualBox 5.1.6
Date: Tue, 20 Sep 2016 00:37:35 -0700

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

Boot method: netboot image
Image version: https://sourceforge.net/projects/debian-reiser4/
Date: September 19, 20:35:31 PDT

Machine: VirtualBox 5.1.6
Partitions:
Filesystem     Type     1K-blocks    Used Available Use% Mounted on
udev           devtmpfs     10240       0     10240   0% /dev
tmpfs          tmpfs       410504    5916    404588   2% /run
/dev/sda5      reiser4    9822436 3798668   6023768  39% /
tmpfs          tmpfs      1026260    1108   1025152   1% /dev/shm
tmpfs          tmpfs         5120       4      5116   1% /run/lock
tmpfs          tmpfs      1026260       0   1026260   0% /sys/fs/cgroup
/dev/sda1      ext2        140805   55482     78053  42% /boot
tmpfs          tmpfs       205252       8    205244   1% /run/user/1000


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

Smooth Reiser4-enabled Jessie Debian-Installer in non-expert mode.
elvis-tiny has been integrated into this d-i -- since I found nano awful;
I wish I had elvis-tiny available as I was intially working on Reiser4 hack.

SSL-enabled Busybox in d-i automatically downloaded Reiser4-patched Linux kernel 4.7.0-1
-- modified for Jessie's GCC 4.9 -- as well as reiser4progs 1.1.0-1.x built for Debian Jessie AMD64. 

d-i also fetches linux-base from backports to satisfy recent kernel requirements.
Overall flawless installation for a non expert.

Node: payinalcitlalli
http://www.enlightenment.org/ss/e-57e0df154a3995.47690147.jpg

(as usual Xonecuiltzin is d-i BusyBox environment.)
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
DISTRIB_RELEASE="8 (jessie) - installer build 20160919-14:55"
X_INSTALLATION_MEDIUM=netboot

==============================================
Installer hardware-summary:
==============================================
uname -a: Linux payinalcitlalli 4.7.0-1+reiser4.0.1-amd64 #1 SMP Debian 4.7.4-1+reiser4.0.1 (2016-09-19) x86_64 Xonecuiltzin
lspci -knn: 00:00.0 Host bridge [0600]: Intel Corporation 440FX - 82441FX PMC [Natoma] [8086:1237] (rev 02)
lspci -knn: 00:01.0 ISA bridge [0601]: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II] [8086:7000]
lspci -knn: 00:01.1 IDE interface [0101]: Intel Corporation 82371AB/EB/MB PIIX4 IDE [8086:7111] (rev 01)
lspci -knn: 	Kernel driver in use: ata_piix
lspci -knn: 00:02.0 VGA compatible controller [0300]: InnoTek Systemberatung GmbH VirtualBox Graphics Adapter [80ee:beef]
lspci -knn: 00:03.0 Ethernet controller [0200]: Intel Corporation 82540EM Gigabit Ethernet Controller [8086:100e] (rev 02)
lspci -knn: 	Subsystem: Intel Corporation Device [8086:001e]
lspci -knn: 	Kernel driver in use: e1000
lspci -knn: 00:04.0 System peripheral [0880]: InnoTek Systemberatung GmbH VirtualBox Guest Service [80ee:cafe]
lspci -knn: 00:05.0 Multimedia audio controller [0401]: Intel Corporation 82801AA AC'97 Audio Controller [8086:2415] (rev 01)
lspci -knn: 	Subsystem: Dell Device [1028:0177]
lspci -knn: 00:06.0 USB controller [0c03]: Apple Inc. KeyLargo/Intrepid USB [106b:003f]
lspci -knn: 	Kernel driver in use: ohci-pci
lspci -knn: 00:07.0 Bridge [0680]: Intel Corporation 82371AB/EB/MB PIIX4 ACPI [8086:7113] (rev 08)
lspci -knn: 00:0d.0 SATA controller [0106]: Intel Corporation 82801HM/HEM (ICH8M/ICH8M-E) SATA Controller [AHCI mode] [8086:2829] (rev 02)
lspci -knn: 	Kernel driver in use: ahci
usb-list: 
usb-list: Bus 01 Device 01: OHCI PCI host controller [1d6b:0001]
usb-list:    Level 00 Parent 00 Port 00  Class 09(hub  ) Subclass 00 Protocol 00
usb-list:    Manufacturer: Linux 4.7.0-1+reiser4.0.1-amd64 ohci_hcd
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
lsmod: minix                  40960  0 
lsmod: msdos                  20480  0 
lsmod: nls_utf8               16384  1 
lsmod: dm_mod                106496  0 
lsmod: md_mod                131072  0 
lsmod: xfs                   978944  0 
lsmod: libcrc32c              16384  1 xfs
lsmod: reiser4               442368  1 
lsmod: jfs                   176128  0 
lsmod: btrfs                1024000  0 
lsmod: xor                    24576  1 btrfs
lsmod: raid6_pq              102400  1 btrfs
lsmod: ntfs                  106496  0 
lsmod: vfat                   20480  0 
lsmod: fat                    69632  2 vfat,msdos
lsmod: ext4                  602112  1 
lsmod: ecb                    16384  0 
lsmod: crc16                  16384  1 ext4
lsmod: jbd2                  110592  1 ext4
lsmod: crc32c_generic         16384  4 
lsmod: mbcache                16384  2 ext4
lsmod: usb_storage            69632  0 
lsmod: vga16fb                24576  0 
lsmod: vgastate               20480  1 vga16fb
lsmod: hid_generic            16384  0 
lsmod: usbhid                 49152  0 
lsmod: hid                   118784  2 hid_generic,usbhid
lsmod: sg                     32768  0 
lsmod: sr_mod                 24576  0 
lsmod: cdrom                  57344  1 sr_mod
lsmod: sd_mod                 49152  3 
lsmod: ata_generic            16384  0 
lsmod: ata_piix               36864  0 
lsmod: ahci                   36864  2 
lsmod: libahci                32768  1 ahci
lsmod: ohci_pci               16384  0 
lsmod: ehci_pci               16384  0 
lsmod: ohci_hcd               49152  1 ohci_pci
lsmod: ehci_hcd               77824  1 ehci_pci
lsmod: usbcore               241664  6 usb_storage,ohci_hcd,ohci_pci,ehci_hcd,ehci_pci,usbhid
lsmod: usb_common             16384  1 usbcore
lsmod: e1000                 139264  0 
lsmod: libata                245760  4 ahci,libahci,ata_generic,ata_piix
lsmod: scsi_mod              225280  5 sg,usb_storage,libata,sd_mod,sr_mod
df: Filesystem           1K-blocks      Used Available Use% Mounted on
df: none                    205252        60    205192   0% /run
df: devtmpfs               1012068         0   1012068   0% /dev
df: /dev/sda5              9822436   3739308   6083128  38% /target
df: /dev/sda1               140805     55482     78053  42% /target/boot
df: /dev/sda5              9822436   3739308   6083128  38% /dev/.static/dev
df: devtmpfs               1012068         0   1012068   0% /target/dev
free:              total       used       free     shared    buffers     cached
free: Mem:       2052520    1700656     351864     113684       3172    1389960
free: -/+ buffers/cache:     307524    1744996
free: Swap:            0          0          0
/proc/cmdline: BOOT_IMAGE=linux vga=788 initrd=initrd.gz --- quiet 
/proc/cpuinfo: processor	: 0
/proc/cpuinfo: vendor_id	: GenuineIntel
/proc/cpuinfo: cpu family	: 6
/proc/cpuinfo: model		: 42
/proc/cpuinfo: model name	: Intel(R) Core(TM) i7-2670QM CPU @ 2.20GHz
/proc/cpuinfo: stepping	: 7
/proc/cpuinfo: cpu MHz		: 2195.012
/proc/cpuinfo: cache size	: 6144 KB
/proc/cpuinfo: physical id	: 0
/proc/cpuinfo: siblings	: 1
/proc/cpuinfo: core id		: 0
/proc/cpuinfo: cpu cores	: 1
/proc/cpuinfo: apicid		: 0
/proc/cpuinfo: initial apicid	: 0
/proc/cpuinfo: fpu		: yes
/proc/cpuinfo: fpu_exception	: yes
/proc/cpuinfo: cpuid level	: 13
/proc/cpuinfo: wp		: yes
/proc/cpuinfo: flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc eagerfpu pni pclmulqdq monitor ssse3 cx16 sse4_1 sse4_2 x2apic popcnt aes xsave avx hypervisor lahf_lm
/proc/cpuinfo: bugs		:
/proc/cpuinfo: bogomips	: 4390.02
/proc/cpuinfo: clflush size	: 64
/proc/cpuinfo: cache_alignment	: 64
/proc/cpuinfo: address sizes	: 36 bits physical, 48 bits virtual
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
/proc/ioports:   4000-403f : 0000:00:07.0
/proc/ioports:     4000-4003 : ACPI PM1a_EVT_BLK
/proc/ioports:     4004-4005 : ACPI PM1a_CNT_BLK
/proc/ioports:     4008-400b : ACPI PM_TMR
/proc/ioports:     4020-4021 : ACPI GPE0_BLK
/proc/ioports:   4100-410f : 0000:00:07.0
/proc/ioports:   d000-d00f : 0000:00:01.1
/proc/ioports:     d000-d00f : ata_piix
/proc/ioports:   d010-d017 : 0000:00:03.0
/proc/ioports:     d010-d017 : e1000
/proc/ioports:   d020-d03f : 0000:00:04.0
/proc/ioports:   d100-d1ff : 0000:00:05.0
/proc/ioports:   d200-d23f : 0000:00:05.0
/proc/ioports:   d240-d247 : 0000:00:0d.0
/proc/ioports:     d240-d247 : ahci
/proc/ioports:   d250-d257 : 0000:00:0d.0
/proc/ioports:     d250-d257 : ahci
/proc/ioports:   d260-d26f : 0000:00:0d.0
/proc/ioports:     d260-d26f : ahci
/proc/iomem: 00000000-00000fff : reserved
/proc/iomem: 00001000-0009fbff : System RAM
/proc/iomem: 0009fc00-0009ffff : reserved
/proc/iomem: 000a0000-000bffff : PCI Bus 0000:00
/proc/iomem: 000c0000-000c7fff : Video ROM
/proc/iomem: 000e2000-000ef3ff : Adapter ROM
/proc/iomem: 000f0000-000fffff : reserved
/proc/iomem:   000f0000-000fffff : System ROM
/proc/iomem: 00100000-7ffeffff : System RAM
/proc/iomem:   2cc00000-2d1d4642 : Kernel code
/proc/iomem:   2d1d4643-2d722c3f : Kernel data
/proc/iomem:   2d880000-2d969fff : Kernel bss
/proc/iomem: 7fff0000-7fffffff : ACPI Tables
/proc/iomem: 80000000-ffdfffff : PCI Bus 0000:00
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
/proc/iomem:   fec00000-fec00fff : reserved
/proc/iomem:     fec00000-fec003ff : IOAPIC 0
/proc/iomem:   fee00000-fee00fff : Local APIC
/proc/iomem:     fee00000-fee00fff : reserved
/proc/iomem: fffc0000-ffffffff : reserved
/proc/interrupts:            CPU0       
/proc/interrupts:   0:         39   IO-APIC   2-edge      timer
/proc/interrupts:   1:       1306   IO-APIC   1-edge      i8042
/proc/interrupts:   8:          1   IO-APIC   8-edge      rtc0
/proc/interrupts:   9:          0   IO-APIC   9-fasteoi   acpi
/proc/interrupts:  12:          3   IO-APIC  12-edge      i8042
/proc/interrupts:  14:          0   IO-APIC  14-edge      ata_piix
/proc/interrupts:  15:      18794   IO-APIC  15-edge      ata_piix
/proc/interrupts:  19:    1145296   IO-APIC  19-fasteoi   eth0
/proc/interrupts:  21:    1471760   IO-APIC  21-fasteoi   ahci[0000:00:0d.0]
/proc/interrupts:  22:         25   IO-APIC  22-fasteoi   ohci_hcd:usb1
/proc/interrupts: NMI:          0   Non-maskable interrupts
/proc/interrupts: LOC:    8423375   Local timer interrupts
/proc/interrupts: SPU:          0   Spurious interrupts
/proc/interrupts: PMI:          0   Performance monitoring interrupts
/proc/interrupts: IWI:          1   IRQ work interrupts
/proc/interrupts: RTR:          0   APIC ICR read retries
/proc/interrupts: RES:          0   Rescheduling interrupts
/proc/interrupts: CAL:          0   Function call interrupts
/proc/interrupts: TLB:          0   TLB shootdowns
/proc/interrupts: TRM:          0   Thermal event interrupts
/proc/interrupts: THR:          0   Threshold APIC interrupts
/proc/interrupts: DFR:          0   Deferred Error APIC interrupts
/proc/interrupts: MCE:          0   Machine check exceptions
/proc/interrupts: MCP:         63   Machine check polls
/proc/interrupts: ERR:          0
/proc/interrupts: MIS:          0
/proc/interrupts: PIN:          0   Posted-interrupt notification event
/proc/interrupts: PIW:          0   Posted-interrupt wakeup event
/proc/meminfo: MemTotal:        2052520 kB
/proc/meminfo: MemFree:          351956 kB
/proc/meminfo: MemAvailable:    1690508 kB
/proc/meminfo: Buffers:            3172 kB
/proc/meminfo: Cached:          1389960 kB
/proc/meminfo: SwapCached:            0 kB
/proc/meminfo: Active:          1034008 kB
/proc/meminfo: Inactive:         388212 kB
/proc/meminfo: Active(anon):      98188 kB
/proc/meminfo: Inactive(anon):    44528 kB
/proc/meminfo: Active(file):     935820 kB
/proc/meminfo: Inactive(file):   343684 kB
/proc/meminfo: Unevictable:           0 kB
/proc/meminfo: Mlocked:               0 kB
/proc/meminfo: SwapTotal:             0 kB
/proc/meminfo: SwapFree:              0 kB
/proc/meminfo: Dirty:              1524 kB
/proc/meminfo: Writeback:             0 kB
/proc/meminfo: AnonPages:         29084 kB
/proc/meminfo: Mapped:             4744 kB
/proc/meminfo: Shmem:            113684 kB
/proc/meminfo: Slab:             257336 kB
/proc/meminfo: SReclaimable:     247088 kB
/proc/meminfo: SUnreclaim:        10248 kB
/proc/meminfo: KernelStack:        1840 kB
/proc/meminfo: PageTables:          644 kB
/proc/meminfo: NFS_Unstable:          0 kB
/proc/meminfo: Bounce:                0 kB
/proc/meminfo: WritebackTmp:          0 kB
/proc/meminfo: CommitLimit:     1026260 kB
/proc/meminfo: Committed_AS:     146016 kB
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
/proc/meminfo: DirectMap4k:      116672 kB
/proc/meminfo: DirectMap2M:     1980416 kB
/proc/bus/input/devices: I: Bus=0011 Vendor=0001 Product=0001 Version=ab41
/proc/bus/input/devices: N: Name="AT Translated Set 2 keyboard"
/proc/bus/input/devices: P: Phys=isa0060/serio0/input0
/proc/bus/input/devices: S: Sysfs=/devices/platform/i8042/serio0/input/input0
/proc/bus/input/devices: U: Uniq=
/proc/bus/input/devices: H: Handlers=sysrq kbd leds 
/proc/bus/input/devices: B: PROP=0
/proc/bus/input/devices: B: EV=120013
/proc/bus/input/devices: B: KEY=402000000 3803078f800d001 feffffdfffefffff fffffffffffffffe
/proc/bus/input/devices: B: MSC=10
/proc/bus/input/devices: B: LED=7
/proc/bus/input/devices: 
/proc/bus/input/devices: I: Bus=0003 Vendor=80ee Product=0021 Version=0110
/proc/bus/input/devices: N: Name="VirtualBox USB Tablet"
/proc/bus/input/devices: P: Phys=usb-0000:00:06.0-1/input0
/proc/bus/input/devices: S: Sysfs=/devices/pci0000:00/0000:00:06.0/usb1/1-1/1-1:1.0/0003:80EE:0021.0001/input/input2
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
Debian Release: 8.6
  APT prefers stable-updates
  APT policy: (500, 'stable-updates'), (500, 'stable')
Architecture: amd64 (x86_64)

Kernel: Linux 4.7.0-1+reiser4.0.1-amd64 (SMP w/1 CPU core)
Locale: LANG=en_US.UTF-8, LC_CTYPE=en_US.UTF-8 (charmap=UTF-8)
Shell: /bin/sh linked to /bin/dash
Init: systemd (via /run/systemd/system)


Send a report that this bug log contains spam.
Debian bug tracking system administrator <owner@bugs.debian.org>. Last modified: Tue Sep 27 08:57:19 2016; Machine Name: buxtehude

Debian Bug tracking system
Copyright (C) 1999 Darren O. Benham, 1997,2003 nCipher Corporation Ltd, 1994-97 Ian Jackson.
