From: Jose R R <jose.r.r@metztli.com>
Subject: Bug#819470: installation-reports: Reiser4 Software Format Release Number 4.0.1 kernel successfully installed on Debian Stretch
Date: Tue, 29 Mar 2016 00:00:01 -0700
Message-ID: <CAM12Q5Sqq34+M=49=y406Lxpsu2fE956u5NpujWtSrsMO+hP-g@mail.gmail.com>
Reply-To: Jose R R <jose.r.r@metztli.com>, 819470@bugs.debian.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001a1137b4c0f78e46052f2a93cc
Return-path: <bounce-debian-bugs-dist=glddb-debian-bugs-dist=m.gmane.org@lists.debian.org>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-Message-ID: <handler.819470.B.145923480818381@bugs.debian.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:date:message-id:subject:from:to:cc;
        bh=K1wvZe9VwC+whHZeLcQQZj2rd9Biwa/iyfHuEPujMmA=;
        b=duTdTZXaw9dX+CAXzBupCttECLKVqLt4/3zZPT2MN5WSYlXW5GgOypqp+QNL/J4hhU
         b43LR6maDaZvCDtIHEiDNuVhXb5qQaWEZWtdhM0l+MV1H2iibJiWOYsUDvxFSi1xEFoX
         FnKuL/ENrZ1jdqPkkLjvDnxi5SBeGp5LwlljFxUWiOksakrr0MaU3VOmjIg1NMp5VuEo
         4MK/uWX5AlZeXrhVVSFJSBw8wiI0qWpVWqPGUSebgGWnd0p30O3OvENxBGfzITeR6Ft0
         8Ugm9+rNlmEYgEFstcNo8FiVwPbpueaZFdROHlFiGL9tfa3PbUnPzgrPlrk06E24TsAr
         EIjQ==
List-Id: <reiserfs-devel.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-bugs-dist/>
List-Post: <mailto:debian-bugs-dist@lists.debian.org>
List-Help: <mailto:debian-bugs-dist-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=unsubscribe>
To: Debian Bug Tracking System <submit@bugs.debian.org>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

--001a1137b4c0f78e46052f2a93cc
Content-Type: text/plain; charset=UTF-8

Package: installation-reports
Severity: normal

Dear Maintainer,

*** Reporter, please consider answering these questions, where appropriate
***

   * What led up to the situation?
   * What exactly did you do (or not do) that was effective (or
     ineffective)?
   * What was the outcome of this action?
   * What outcome did you expect instead?

*** End of the template - remove these template lines ***


-- Package-specific info:

Boot method: CD
Image version: Sid (Unstable) d-i
Date: 03-28-2016

Machine: VirtualBox
Partitions: Filesystem     Type     1K-blocks   Used Available Use% Mounted
on
udev           devtmpfs    371716      0    371716   0% /dev
tmpfs          tmpfs        76280   1356     74924   2% /run
/dev/sda5      reiser4    6123092 605608   5517484  10% /
tmpfs          tmpfs       381380      0    381380   0% /dev/shm
tmpfs          tmpfs         5120      0      5120   0% /run/lock
tmpfs          tmpfs       381380      0    381380   0% /sys/fs/cgroup
/dev/sda6      jfs        3876540 233852   3642688   7% /var
/dev/sda1      ext2        140805  32524    101011  25% /boot
tmpfs          tmpfs        76280      0     76280   0% /run/user/1000


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

      One to the smoothest Reiser4 installations I've ever done.


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
DISTRIB_RELEASE="9 (stretch) - installer build 20160325-08:35"
X_INSTALLATION_MEDIUM=netboot

==============================================
Installer hardware-summary:
==============================================
uname -a: Linux oyohualli 4.4.0-1-amd64 #1 SMP Debian 4.4.6-2 (2016-03-17)
x86_64 Xonecuiltzin
lspci -knn: 00:00.0 Host bridge [0600]: Intel Corporation 440FX - 82441FX
PMC [Natoma] [8086:1237] (rev 02)
lspci -knn: 00:01.0 ISA bridge [0601]: Intel Corporation 82371SB PIIX3 ISA
[Natoma/Triton II] [8086:7000]
lspci -knn: 00:01.1 IDE interface [0101]: Intel Corporation 82371AB/EB/MB
PIIX4 IDE [8086:7111] (rev 01)
lspci -knn: Kernel driver in use: ata_piix
lspci -knn: Kernel modules: ata_piix, ata_generic
lspci -knn: 00:02.0 VGA compatible controller [0300]: InnoTek
Systemberatung GmbH VirtualBox Graphics Adapter [80ee:beef]
lspci -knn: 00:03.0 Ethernet controller [0200]: Intel Corporation 82540EM
Gigabit Ethernet Controller [8086:100e] (rev 02)
lspci -knn: Subsystem: Intel Corporation Device [8086:001e]
lspci -knn: Kernel driver in use: e1000
lspci -knn: Kernel modules: e1000
lspci -knn: 00:04.0 System peripheral [0880]: InnoTek Systemberatung GmbH
VirtualBox Guest Service [80ee:cafe]
lspci -knn: 00:06.0 USB controller [0c03]: Apple Inc. KeyLargo/Intrepid USB
[106b:003f]
lspci -knn: Kernel driver in use: ohci-pci
lspci -knn: Kernel modules: ohci_pci
lspci -knn: 00:07.0 Bridge [0680]: Intel Corporation 82371AB/EB/MB PIIX4
ACPI [8086:7113] (rev 08)
lspci -knn: 00:0d.0 SATA controller [0106]: Intel Corporation 82801HM/HEM
(ICH8M/ICH8M-E) SATA Controller [AHCI mode] [8086:2829] (rev 02)
lspci -knn: Kernel driver in use: ahci
lspci -knn: Kernel modules: ahci
usb-list:
usb-list: Bus 01 Device 01: OHCI PCI host controller [1d6b:0001]
usb-list:    Level 00 Parent 00 Port 00  Class 09(hub  ) Subclass 00
Protocol 00
usb-list:    Manufacturer: Linux 4.4.0-1-amd64 ohci_hcd
usb-list:    Interface 00: Class 09(hub  ) Subclass 00 Protocol 00 Driver
hub
usb-list:
usb-list: Bus 01 Device 02: USB Tablet [80ee:0021]
usb-list:    Level 01 Parent 01 Port 00  Class 00(>ifc ) Subclass 00
Protocol 00
usb-list:    Manufacturer: VirtualBox
usb-list:    Interface 00: Class 03(HID  ) Subclass 00 Protocol 00 Driver
usbhid
lsmod: Module                  Size  Used by
lsmod: nls_utf8               16384  1
lsmod: dm_mod                110592  0
lsmod: md_mod                135168  0
lsmod: xfs                   954368  0
lsmod: libcrc32c              16384  1 xfs
lsmod: reiser4               434176  1
lsmod: jfs                   176128  1
lsmod: crc32c_generic         16384  4
lsmod: btrfs                 970752  0
lsmod: xor                    24576  1 btrfs
lsmod: raid6_pq              102400  1 btrfs
lsmod: ntfs                  200704  0
lsmod: vfat                   20480  0
lsmod: fat                    69632  1 vfat
lsmod: ext4                  581632  1
lsmod: crc16                  16384  1 ext4
lsmod: mbcache                20480  1 ext4
lsmod: jbd2                  110592  1 ext4
lsmod: usb_storage            69632  0
lsmod: vga16fb                24576  0
lsmod: vgastate               20480  1 vga16fb
lsmod: hid_generic            16384  0
lsmod: usbhid                 49152  0
lsmod: hid                   118784  2 hid_generic,usbhid
lsmod: sr_mod                 24576  0
lsmod: cdrom                  57344  1 sr_mod
lsmod: sd_mod                 45056  4
lsmod: ata_generic            16384  0
lsmod: ohci_pci               16384  0
lsmod: ehci_pci               16384  0
lsmod: ata_piix               36864  0
lsmod: ahci                   36864  3
lsmod: libahci                32768  1 ahci
lsmod: ohci_hcd               49152  1 ohci_pci
lsmod: ehci_hcd               77824  1 ehci_pci
lsmod: e1000                 135168  0
lsmod: usbcore               233472  6
usb_storage,ohci_hcd,ohci_pci,ehci_hcd,ehci_pci,usbhid
lsmod: usb_common             16384  1 usbcore
lsmod: libata                233472  4 ahci,libahci,ata_generic,ata_piix
lsmod: scsi_mod              229376  4 usb_storage,libata,sd_mod,sr_mod
df: Filesystem           1K-blocks      Used Available Use% Mounted on
df: none                     76280        68     76212   0% /run
df: devtmpfs                365728         0    365728   0% /dev
df: /dev/sda5              6123092    598624   5524468  10% /target
df: /dev/sda1               140805     32524    101011  24% /target/boot
df: /dev/sda6              3876540    166768   3709772   4% /target/var
df: /dev/sda5              6123092    598624   5524468  10% /dev/.static/dev
df: devtmpfs                365728         0    365728   0% /target/dev
free:              total       used       free     shared    buffers
cached
free: Mem:        762768     581284     181484     124580       3040
446144
free: -/+ buffers/cache:     132100     630668
free: Swap:            0          0          0
/proc/cmdline: BOOT_IMAGE=linux priority=low vga=788 initrd=initrd.gz ---
/proc/cpuinfo: processor : 0
/proc/cpuinfo: vendor_id : GenuineIntel
/proc/cpuinfo: cpu family : 6
/proc/cpuinfo: model : 42
/proc/cpuinfo: model name : Intel(R) Core(TM) i7-2670QM CPU @ 2.20GHz
/proc/cpuinfo: stepping : 7
/proc/cpuinfo: cpu MHz : 2195.112
/proc/cpuinfo: cache size : 6144 KB
/proc/cpuinfo: physical id : 0
/proc/cpuinfo: siblings : 1
/proc/cpuinfo: core id : 0
/proc/cpuinfo: cpu cores : 1
/proc/cpuinfo: apicid : 0
/proc/cpuinfo: initial apicid : 0
/proc/cpuinfo: fpu : yes
/proc/cpuinfo: fpu_exception : yes
/proc/cpuinfo: cpuid level : 13
/proc/cpuinfo: wp : yes
/proc/cpuinfo: flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx rdtscp lm
constant_tsc rep_good nopl xtopology nonstop_tsc pni pclmulqdq monitor
ssse3 cx16 sse4_1 sse4_2 popcnt aes xsave avx hypervisor lahf_lm
/proc/cpuinfo: bugs :
/proc/cpuinfo: bogomips : 4390.22
/proc/cpuinfo: clflush size : 64
/proc/cpuinfo: cache_alignment : 64
/proc/cpuinfo: address sizes : 36 bits physical, 48 bits virtual
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
/proc/iomem: 00100000-2ffeffff : System RAM
/proc/iomem:   01000000-01593b22 : Kernel code
/proc/iomem:   01593b23-01b0a53f : Kernel data
/proc/iomem:   01c59000-01d27fff : Kernel bss
/proc/iomem: 2fff0000-2fffffff : ACPI Tables
/proc/iomem: 30000000-ffdfffff : PCI Bus 0000:00
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
/proc/interrupts:   0:         42   IO-APIC   2-edge      timer
/proc/interrupts:   1:       1309   IO-APIC   1-edge      i8042
/proc/interrupts:   8:          1   IO-APIC   8-edge      rtc0
/proc/interrupts:   9:          0   IO-APIC   9-fasteoi   acpi
/proc/interrupts:  12:          3   IO-APIC  12-edge      i8042
/proc/interrupts:  14:          0   IO-APIC  14-edge      ata_piix
/proc/interrupts:  15:        402   IO-APIC  15-edge      ata_piix
/proc/interrupts:  19:     219979   IO-APIC  19-fasteoi   enp0s3
/proc/interrupts:  21:     136869   IO-APIC  21-fasteoi   0000:00:0d.0
/proc/interrupts:  22:         25   IO-APIC  22-fasteoi   ohci_hcd:usb1
/proc/interrupts: NMI:          0   Non-maskable interrupts
/proc/interrupts: LOC:     157384   Local timer interrupts
/proc/interrupts: SPU:          0   Spurious interrupts
/proc/interrupts: PMI:          0   Performance monitoring interrupts
/proc/interrupts: IWI:          5   IRQ work interrupts
/proc/interrupts: RTR:          0   APIC ICR read retries
/proc/interrupts: RES:          0   Rescheduling interrupts
/proc/interrupts: CAL:          0   Function call interrupts
/proc/interrupts: TLB:          0   TLB shootdowns
/proc/interrupts: TRM:          0   Thermal event interrupts
/proc/interrupts: THR:          0   Threshold APIC interrupts
/proc/interrupts: DFR:          0   Deferred Error APIC interrupts
/proc/interrupts: MCE:          0   Machine check exceptions
/proc/interrupts: MCP:         18   Machine check polls
/proc/interrupts: ERR:          0
/proc/interrupts: MIS:          0
/proc/interrupts: PIN:          0   Posted-interrupt notification event
/proc/interrupts: PIW:          0   Posted-interrupt wakeup event
/proc/meminfo: MemTotal:         762768 kB
/proc/meminfo: MemFree:          181196 kB
/proc/meminfo: MemAvailable:     561692 kB
/proc/meminfo: Buffers:            3040 kB
/proc/meminfo: Cached:           446144 kB
/proc/meminfo: SwapCached:            0 kB
/proc/meminfo: Active:           306520 kB
/proc/meminfo: Inactive:         180532 kB
/proc/meminfo: Active(anon):     114056 kB
/proc/meminfo: Inactive(anon):    48424 kB
/proc/meminfo: Active(file):     192464 kB
/proc/meminfo: Inactive(file):   132108 kB
/proc/meminfo: Unevictable:           0 kB
/proc/meminfo: Mlocked:               0 kB
/proc/meminfo: SwapTotal:             0 kB
/proc/meminfo: SwapFree:              0 kB
/proc/meminfo: Dirty:              1620 kB
/proc/meminfo: Writeback:             0 kB
/proc/meminfo: AnonPages:         37956 kB
/proc/meminfo: Mapped:             8728 kB
/proc/meminfo: Shmem:            124580 kB
/proc/meminfo: Slab:              77124 kB
/proc/meminfo: SReclaimable:      68704 kB
/proc/meminfo: SUnreclaim:         8420 kB
/proc/meminfo: KernelStack:        1744 kB
/proc/meminfo: PageTables:         1072 kB
/proc/meminfo: NFS_Unstable:          0 kB
/proc/meminfo: Bounce:                0 kB
/proc/meminfo: WritebackTmp:          0 kB
/proc/meminfo: CommitLimit:      381384 kB
/proc/meminfo: Committed_AS:     168192 kB
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
/proc/meminfo: DirectMap4k:       38848 kB
/proc/meminfo: DirectMap2M:      747520 kB
/proc/bus/input/devices: I: Bus=0011 Vendor=0001 Product=0001 Version=ab41
/proc/bus/input/devices: N: Name="AT Translated Set 2 keyboard"
/proc/bus/input/devices: P: Phys=isa0060/serio0/input0
/proc/bus/input/devices: S:
Sysfs=/devices/platform/i8042/serio0/input/input0
/proc/bus/input/devices: U: Uniq=
/proc/bus/input/devices: H: Handlers=sysrq kbd leds
/proc/bus/input/devices: B: PROP=0
/proc/bus/input/devices: B: EV=120013
/proc/bus/input/devices: B: KEY=402000000 3803078f800d001 feffffdfffefffff
fffffffffffffffe
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
Debian Release: stretch/sid
  APT prefers testing-updates
  APT policy: (500, 'testing-updates'), (500, 'testing')
Architecture: amd64 (x86_64)

Kernel: Linux 4.4.0-1+reiser4.0.1-amd64 (SMP w/1 CPU core)
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

--001a1137b4c0f78e46052f2a93cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Package: installation-reports</div><div>Severity: nor=
mal</div><div><br></div><div>Dear Maintainer,</div><div><br></div><div>*** =
Reporter, please consider answering these questions, where appropriate ***<=
/div><div><br></div><div>=C2=A0 =C2=A0* What led up to the situation?</div>=
<div>=C2=A0 =C2=A0* What exactly did you do (or not do) that was effective =
(or</div><div>=C2=A0 =C2=A0 =C2=A0ineffective)?</div><div>=C2=A0 =C2=A0* Wh=
at was the outcome of this action?</div><div>=C2=A0 =C2=A0* What outcome di=
d you expect instead?</div><div><br></div><div>*** End of the template - re=
move these template lines ***</div><div><br></div><div><br></div><div>-- Pa=
ckage-specific info:</div><div><br></div><div>Boot method: CD</div><div>Ima=
ge version: Sid (Unstable) d-i</div><div>Date: 03-28-2016</div><div><br></d=
iv><div>Machine: VirtualBox</div><div>Partitions: Filesystem =C2=A0 =C2=A0 =
Type =C2=A0 =C2=A0 1K-blocks =C2=A0 Used Available Use% Mounted on</div><di=
v>udev =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 devtmpfs =C2=A0 =C2=A0371716 =C2=
=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0371716 =C2=A0 0% /dev</div><div>tmpfs =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A076280 =C2=
=A0 1356 =C2=A0 =C2=A0 74924 =C2=A0 2% /run</div><div>/dev/sda5 =C2=A0 =C2=
=A0 =C2=A0reiser4 =C2=A0 =C2=A06123092 605608 =C2=A0 5517484 =C2=A010% /</d=
iv><div>tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs =C2=A0 =C2=A0 =C2=A0 =
381380 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0381380 =C2=A0 0% /dev/shm</div><d=
iv>tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 5120 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A05120 =C2=A0 0% /run/lock=
</div><div>tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs =C2=A0 =C2=A0 =C2=
=A0 381380 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0381380 =C2=A0 0% /sys/fs/cgro=
up</div><div>/dev/sda6 =C2=A0 =C2=A0 =C2=A0jfs =C2=A0 =C2=A0 =C2=A0 =C2=A03=
876540 233852 =C2=A0 3642688 =C2=A0 7% /var</div><div>/dev/sda1 =C2=A0 =C2=
=A0 =C2=A0ext2 =C2=A0 =C2=A0 =C2=A0 =C2=A0140805 =C2=A032524 =C2=A0 =C2=A01=
01011 =C2=A025% /boot</div><div>tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp=
fs =C2=A0 =C2=A0 =C2=A0 =C2=A076280 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 762=
80 =C2=A0 0% /run/user/1000</div><div><br></div><div><br></div><div>Base Sy=
stem Installation Checklist:</div><div>[O] =3D OK, [E] =3D Error (please el=
aborate below), [ ] =3D didn&#39;t try it</div><div><br></div><div>Initial =
boot: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [O]</div><div>Detect network card:=
 =C2=A0 =C2=A0[O]</div><div>Configure network: =C2=A0 =C2=A0 =C2=A0[O]</div=
><div>Detect CD: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[O]</div><=
div>Load installer modules: [O]</div><div>Clock/timezone setup: =C2=A0 [O]<=
/div><div>User/password setup: =C2=A0 =C2=A0[O]</div><div>Detect hard drive=
s: =C2=A0 =C2=A0 [O]</div><div>Partition hard drives: =C2=A0[O]</div><div>I=
nstall base system: =C2=A0 =C2=A0[O]</div><div>Install tasks: =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0[O]</div><div>Install boot loader: =C2=A0 =C2=A0[O]</d=
iv><div>Overall install: =C2=A0 =C2=A0 =C2=A0 =C2=A0[O]</div><div><br></div=
><div>Comments/Problems:</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 One =
to the smoothest Reiser4 installations I&#39;ve ever done.</div><div><br></=
div><div><br></div><div>--=C2=A0</div><div><br></div><div>Please make sure =
that the hardware-summary log file, and any other</div><div>installation lo=
gs that you think would be useful are attached to this</div><div>report. Pl=
ease compress large files using gzip.</div><div><br></div><div>Once you hav=
e filled out this report, mail it to <a href=3D"mailto:submit@bugs.debian.o=
rg">submit@bugs.debian.org</a>.</div><div><br></div><div>=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div>Installer lsb-relea=
se:</div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</div><div>DISTRIB_ID=3DDebian</div><div>DISTRIB_DESCRIPTION=3D&quot;Deb=
ian GNU/Linux installer&quot;</div><div>DISTRIB_RELEASE=3D&quot;9 (stretch)=
 - installer build 20160325-08:35&quot;</div><div>X_INSTALLATION_MEDIUM=3Dn=
etboot</div><div><br></div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D</div><div>Installer hardware-summary:</div><div>=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div>unam=
e -a: Linux oyohualli 4.4.0-1-amd64 #1 SMP Debian 4.4.6-2 (2016-03-17) x86_=
64 Xonecuiltzin</div><div>lspci -knn: 00:00.0 Host bridge [0600]: Intel Cor=
poration 440FX - 82441FX PMC [Natoma] [8086:1237] (rev 02)</div><div>lspci =
-knn: 00:01.0 ISA bridge [0601]: Intel Corporation 82371SB PIIX3 ISA [Natom=
a/Triton II] [8086:7000]</div><div>lspci -knn: 00:01.1 IDE interface [0101]=
: Intel Corporation 82371AB/EB/MB PIIX4 IDE [8086:7111] (rev 01)</div><div>=
lspci -knn: <span class=3D"Apple-tab-span" style=3D"white-space:pre">	</spa=
n>Kernel driver in use: ata_piix</div><div>lspci -knn: <span class=3D"Apple=
-tab-span" style=3D"white-space:pre">	</span>Kernel modules: ata_piix, ata_=
generic</div><div>lspci -knn: 00:02.0 VGA compatible controller [0300]: Inn=
oTek Systemberatung GmbH VirtualBox Graphics Adapter [80ee:beef]</div><div>=
lspci -knn: 00:03.0 Ethernet controller [0200]: Intel Corporation 82540EM G=
igabit Ethernet Controller [8086:100e] (rev 02)</div><div>lspci -knn: <span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>Subsystem: Inte=
l Corporation Device [8086:001e]</div><div>lspci -knn: <span class=3D"Apple=
-tab-span" style=3D"white-space:pre">	</span>Kernel driver in use: e1000</d=
iv><div>lspci -knn: <span class=3D"Apple-tab-span" style=3D"white-space:pre=
">	</span>Kernel modules: e1000</div><div>lspci -knn: 00:04.0 System periph=
eral [0880]: InnoTek Systemberatung GmbH VirtualBox Guest Service [80ee:caf=
e]</div><div>lspci -knn: 00:06.0 USB controller [0c03]: Apple Inc. KeyLargo=
/Intrepid USB [106b:003f]</div><div>lspci -knn: <span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre">	</span>Kernel driver in use: ohci-pci</div><=
div>lspci -knn: <span class=3D"Apple-tab-span" style=3D"white-space:pre">	<=
/span>Kernel modules: ohci_pci</div><div>lspci -knn: 00:07.0 Bridge [0680]:=
 Intel Corporation 82371AB/EB/MB PIIX4 ACPI [8086:7113] (rev 08)</div><div>=
lspci -knn: 00:0d.0 SATA controller [0106]: Intel Corporation 82801HM/HEM (=
ICH8M/ICH8M-E) SATA Controller [AHCI mode] [8086:2829] (rev 02)</div><div>l=
spci -knn: <span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span=
>Kernel driver in use: ahci</div><div>lspci -knn: <span class=3D"Apple-tab-=
span" style=3D"white-space:pre">	</span>Kernel modules: ahci</div><div>usb-=
list:=C2=A0</div><div>usb-list: Bus 01 Device 01: OHCI PCI host controller =
[1d6b:0001]</div><div>usb-list: =C2=A0 =C2=A0Level 00 Parent 00 Port 00 =C2=
=A0Class 09(hub =C2=A0) Subclass 00 Protocol 00</div><div>usb-list: =C2=A0 =
=C2=A0Manufacturer: Linux 4.4.0-1-amd64 ohci_hcd</div><div>usb-list: =C2=A0=
 =C2=A0Interface 00: Class 09(hub =C2=A0) Subclass 00 Protocol 00 Driver hu=
b</div><div>usb-list:=C2=A0</div><div>usb-list: Bus 01 Device 02: USB Table=
t [80ee:0021]</div><div>usb-list: =C2=A0 =C2=A0Level 01 Parent 01 Port 00 =
=C2=A0Class 00(&gt;ifc ) Subclass 00 Protocol 00</div><div>usb-list: =C2=A0=
 =C2=A0Manufacturer: VirtualBox</div><div>usb-list: =C2=A0 =C2=A0Interface =
00: Class 03(HID =C2=A0) Subclass 00 Protocol 00 Driver usbhid</div><div>ls=
mod: Module =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S=
ize =C2=A0Used by</div><div>lsmod: nls_utf8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 16384 =C2=A01</div><div>lsmod: dm_mod =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0110592 =C2=A00</div><div>lsmod: md_mo=
d =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0135168 =C2=A00</di=
v><div>lsmod: xfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 954368 =C2=A00</div><div>lsmod: libcrc32c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A016384 =C2=A01 xfs</div><div>lsmod: reiser4 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 434176 =C2=A01</div><div>lsmod: j=
fs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 176128 =
=C2=A01</div><div>lsmod: crc32c_generic =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384 =
=C2=A04</div><div>lsmod: btrfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 970752 =C2=A00</div><div>lsmod: xor =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A024576 =C2=A01 btrfs</div><div>=
lsmod: raid6_pq =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0102400 =C2=
=A01 btrfs</div><div>lsmod: ntfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0200704 =C2=A00</div><div>lsmod: vfat =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 20480 =C2=A00</div><div>lsmod=
: fat =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
69632 =C2=A01 vfat</div><div>lsmod: ext4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0581632 =C2=A01</div><div>lsmod: crc16 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016384 =C2=A01 ext4</=
div><div>lsmod: mbcache =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A020480 =C2=A01 ext4</div><div>lsmod: jbd2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0110592 =C2=A01 ext4</div><div>lsmod: usb_=
storage =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A069632 =C2=A00</div><div>ls=
mod: vga16fb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A024576 =
=C2=A00</div><div>lsmod: vgastate =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 20480 =C2=A01 vga16fb</div><div>lsmod: hid_generic =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A016384 =C2=A00</div><div>lsmod: usbhid =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 49152 =C2=A00</div><div>lsmod=
: hid =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 118784=
 =C2=A02 hid_generic,usbhid</div><div>lsmod: sr_mod =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 24576 =C2=A00</div><div>lsmod: cdrom =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A057344 =C2=A01 sr=
_mod</div><div>lsmod: sd_mod =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 45056 =C2=A04</div><div>lsmod: ata_generic =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A016384 =C2=A00</div><div>lsmod: ohci_pci =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384 =C2=A00</div><div>lsmod: ehci_pci =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384 =C2=A00</div><div>ls=
mod: ata_piix =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 36864 =C2=A0=
0</div><div>lsmod: ahci =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 36864 =C2=A03</div><div>lsmod: libahci =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A032768 =C2=A01 ahci</div><div>lsmod: ohci_=
hcd =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 49152 =C2=A01 ohci_pci=
</div><div>lsmod: ehci_hcd =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 77824 =C2=A01 ehci_pci</div><div>lsmod: e1000 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 135168 =C2=A00</div><div>lsmod: usbcore =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 233472 =C2=A06 usb_storage,ohci_h=
cd,ohci_pci,ehci_hcd,ehci_pci,usbhid</div><div>lsmod: usb_common =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16384 =C2=A01 usbcore</div><div>lsmod: liba=
ta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0233472 =C2=A04 ah=
ci,libahci,ata_generic,ata_piix</div><div>lsmod: scsi_mod =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0229376 =C2=A04 usb_storage,libata,sd_mod,sr_=
mod</div><div>df: Filesystem =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1K-blocks =
=C2=A0 =C2=A0 =C2=A0Used Available Use% Mounted on</div><div>df: none =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 76280 =
=C2=A0 =C2=A0 =C2=A0 =C2=A068 =C2=A0 =C2=A0 76212 =C2=A0 0% /run</div><div>=
df: devtmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0365728 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0365728 =C2=A0 0% /dev</div><div>=
df: /dev/sda5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06123092 =C2=
=A0 =C2=A0598624 =C2=A0 5524468 =C2=A010% /target</div><div>df: /dev/sda1 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 140805 =C2=A0 =C2=A0 32524=
 =C2=A0 =C2=A0101011 =C2=A024% /target/boot</div><div>df: /dev/sda6 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03876540 =C2=A0 =C2=A0166768 =C2=A0=
 3709772 =C2=A0 4% /target/var</div><div>df: /dev/sda5 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A06123092 =C2=A0 =C2=A0598624 =C2=A0 5524468 =C2=
=A010% /dev/.static/dev</div><div>df: devtmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0365728 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =C2=A0 =C2=
=A0365728 =C2=A0 0% /target/dev</div><div>free: =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0total =C2=A0 =C2=A0 =C2=A0 used =C2=A0 =C2=A0 =C2=A0 f=
ree =C2=A0 =C2=A0 shared =C2=A0 =C2=A0buffers =C2=A0 =C2=A0 cached</div><di=
v>free: Mem: =C2=A0 =C2=A0 =C2=A0 =C2=A0762768 =C2=A0 =C2=A0 581284 =C2=A0 =
=C2=A0 181484 =C2=A0 =C2=A0 124580 =C2=A0 =C2=A0 =C2=A0 3040 =C2=A0 =C2=A0 =
446144</div><div>free: -/+ buffers/cache: =C2=A0 =C2=A0 132100 =C2=A0 =C2=
=A0 630668</div><div>free: Swap: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00</d=
iv><div>/proc/cmdline: BOOT_IMAGE=3Dlinux priority=3Dlow vga=3D788 initrd=
=3Dinitrd.gz ---=C2=A0</div><div>/proc/cpuinfo: processor<span class=3D"App=
le-tab-span" style=3D"white-space:pre">	</span>: 0</div><div>/proc/cpuinfo:=
 vendor_id<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>=
: GenuineIntel</div><div>/proc/cpuinfo: cpu family<span class=3D"Apple-tab-=
span" style=3D"white-space:pre">	</span>: 6</div><div>/proc/cpuinfo: model<=
span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>: 42</div>=
<div>/proc/cpuinfo: model name<span class=3D"Apple-tab-span" style=3D"white=
-space:pre">	</span>: Intel(R) Core(TM) i7-2670QM CPU @ 2.20GHz</div><div>/=
proc/cpuinfo: stepping<span class=3D"Apple-tab-span" style=3D"white-space:p=
re">	</span>: 7</div><div>/proc/cpuinfo: cpu MHz<span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre">		</span>: 2195.112</div><div>/proc/cpuinfo: =
cache size<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>=
: 6144 KB</div><div>/proc/cpuinfo: physical id<span class=3D"Apple-tab-span=
" style=3D"white-space:pre">	</span>: 0</div><div>/proc/cpuinfo: siblings<s=
pan class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>: 1</div><di=
v>/proc/cpuinfo: core id<span class=3D"Apple-tab-span" style=3D"white-space=
:pre">		</span>: 0</div><div>/proc/cpuinfo: cpu cores<span class=3D"Apple-t=
ab-span" style=3D"white-space:pre">	</span>: 1</div><div>/proc/cpuinfo: api=
cid<span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>: 0</d=
iv><div>/proc/cpuinfo: initial apicid<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>: 0</div><div>/proc/cpuinfo: fpu<span class=3D=
"Apple-tab-span" style=3D"white-space:pre">		</span>: yes</div><div>/proc/c=
puinfo: fpu_exception<span class=3D"Apple-tab-span" style=3D"white-space:pr=
e">	</span>: yes</div><div>/proc/cpuinfo: cpuid level<span class=3D"Apple-t=
ab-span" style=3D"white-space:pre">	</span>: 13</div><div>/proc/cpuinfo: wp=
<span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>: yes</di=
v><div>/proc/cpuinfo: flags<span class=3D"Apple-tab-span" style=3D"white-sp=
ace:pre">		</span>: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mc=
a cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx rdtscp lm constant_ts=
c rep_good nopl xtopology nonstop_tsc pni pclmulqdq monitor ssse3 cx16 sse4=
_1 sse4_2 popcnt aes xsave avx hypervisor lahf_lm</div><div>/proc/cpuinfo: =
bugs<span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>:</di=
v><div>/proc/cpuinfo: bogomips<span class=3D"Apple-tab-span" style=3D"white=
-space:pre">	</span>: 4390.22</div><div>/proc/cpuinfo: clflush size<span cl=
ass=3D"Apple-tab-span" style=3D"white-space:pre">	</span>: 64</div><div>/pr=
oc/cpuinfo: cache_alignment<span class=3D"Apple-tab-span" style=3D"white-sp=
ace:pre">	</span>: 64</div><div>/proc/cpuinfo: address sizes<span class=3D"=
Apple-tab-span" style=3D"white-space:pre">	</span>: 36 bits physical, 48 bi=
ts virtual</div><div>/proc/cpuinfo: power management:</div><div>/proc/cpuin=
fo:=C2=A0</div><div>/proc/ioports: 0000-0cf7 : PCI Bus 0000:00</div><div>/p=
roc/ioports: =C2=A0 0000-001f : dma1</div><div>/proc/ioports: =C2=A0 0020-0=
021 : pic1</div><div>/proc/ioports: =C2=A0 0040-0043 : timer0</div><div>/pr=
oc/ioports: =C2=A0 0050-0053 : timer1</div><div>/proc/ioports: =C2=A0 0060-=
0060 : keyboard</div><div>/proc/ioports: =C2=A0 0064-0064 : keyboard</div><=
div>/proc/ioports: =C2=A0 0070-0071 : rtc_cmos</div><div>/proc/ioports: =C2=
=A0 =C2=A0 0070-0071 : rtc0</div><div>/proc/ioports: =C2=A0 0080-008f : dma=
 page reg</div><div>/proc/ioports: =C2=A0 00a0-00a1 : pic2</div><div>/proc/=
ioports: =C2=A0 00c0-00df : dma2</div><div>/proc/ioports: =C2=A0 00f0-00ff =
: fpu</div><div>/proc/ioports: =C2=A0 0170-0177 : 0000:00:01.1</div><div>/p=
roc/ioports: =C2=A0 =C2=A0 0170-0177 : ata_piix</div><div>/proc/ioports: =
=C2=A0 01f0-01f7 : 0000:00:01.1</div><div>/proc/ioports: =C2=A0 =C2=A0 01f0=
-01f7 : ata_piix</div><div>/proc/ioports: =C2=A0 0376-0376 : 0000:00:01.1</=
div><div>/proc/ioports: =C2=A0 =C2=A0 0376-0376 : ata_piix</div><div>/proc/=
ioports: =C2=A0 03f6-03f6 : 0000:00:01.1</div><div>/proc/ioports: =C2=A0 =
=C2=A0 03f6-03f6 : ata_piix</div><div>/proc/ioports: 0cf8-0cff : PCI conf1<=
/div><div>/proc/ioports: 0d00-ffff : PCI Bus 0000:00</div><div>/proc/ioport=
s: =C2=A0 4000-4003 : ACPI PM1a_EVT_BLK</div><div>/proc/ioports: =C2=A0 400=
4-4005 : ACPI PM1a_CNT_BLK</div><div>/proc/ioports: =C2=A0 4008-400b : ACPI=
 PM_TMR</div><div>/proc/ioports: =C2=A0 4020-4021 : ACPI GPE0_BLK</div><div=
>/proc/ioports: =C2=A0 d000-d00f : 0000:00:01.1</div><div>/proc/ioports: =
=C2=A0 =C2=A0 d000-d00f : ata_piix</div><div>/proc/ioports: =C2=A0 d010-d01=
7 : 0000:00:03.0</div><div>/proc/ioports: =C2=A0 =C2=A0 d010-d017 : e1000</=
div><div>/proc/ioports: =C2=A0 d020-d03f : 0000:00:04.0</div><div>/proc/iop=
orts: =C2=A0 d040-d047 : 0000:00:0d.0</div><div>/proc/ioports: =C2=A0 =C2=
=A0 d040-d047 : ahci</div><div>/proc/ioports: =C2=A0 d050-d057 : 0000:00:0d=
.0</div><div>/proc/ioports: =C2=A0 =C2=A0 d050-d057 : ahci</div><div>/proc/=
ioports: =C2=A0 d060-d06f : 0000:00:0d.0</div><div>/proc/ioports: =C2=A0 =
=C2=A0 d060-d06f : ahci</div><div>/proc/iomem: 00000000-00000fff : reserved=
</div><div>/proc/iomem: 00001000-0009fbff : System RAM</div><div>/proc/iome=
m: 0009fc00-0009ffff : reserved</div><div>/proc/iomem: 000a0000-000bffff : =
PCI Bus 0000:00</div><div>/proc/iomem: 000c0000-000c7fff : Video ROM</div><=
div>/proc/iomem: 000e2000-000ef3ff : Adapter ROM</div><div>/proc/iomem: 000=
f0000-000fffff : reserved</div><div>/proc/iomem: =C2=A0 000f0000-000fffff :=
 System ROM</div><div>/proc/iomem: 00100000-2ffeffff : System RAM</div><div=
>/proc/iomem: =C2=A0 01000000-01593b22 : Kernel code</div><div>/proc/iomem:=
 =C2=A0 01593b23-01b0a53f : Kernel data</div><div>/proc/iomem: =C2=A0 01c59=
000-01d27fff : Kernel bss</div><div>/proc/iomem: 2fff0000-2fffffff : ACPI T=
ables</div><div>/proc/iomem: 30000000-ffdfffff : PCI Bus 0000:00</div><div>=
/proc/iomem: =C2=A0 e0000000-e0ffffff : 0000:00:02.0</div><div>/proc/iomem:=
 =C2=A0 =C2=A0 e0000000-e00eafff : BOOTFB</div><div>/proc/iomem: =C2=A0 f00=
00000-f001ffff : 0000:00:03.0</div><div>/proc/iomem: =C2=A0 =C2=A0 f0000000=
-f001ffff : e1000</div><div>/proc/iomem: =C2=A0 f0400000-f07fffff : 0000:00=
:04.0</div><div>/proc/iomem: =C2=A0 f0800000-f0803fff : 0000:00:04.0</div><=
div>/proc/iomem: =C2=A0 f0804000-f0804fff : 0000:00:06.0</div><div>/proc/io=
mem: =C2=A0 =C2=A0 f0804000-f0804fff : ohci_hcd</div><div>/proc/iomem: =C2=
=A0 f0806000-f0807fff : 0000:00:0d.0</div><div>/proc/iomem: =C2=A0 =C2=A0 f=
0806000-f0807fff : ahci</div><div>/proc/iomem: =C2=A0 fec00000-fec003ff : I=
OAPIC 0</div><div>/proc/iomem: =C2=A0 fee00000-fee00fff : Local APIC</div><=
div>/proc/iomem: fffc0000-ffffffff : reserved</div><div>/proc/interrupts: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU0 =C2=A0 =C2=A0 =C2=A0=C2=A0</d=
iv><div>/proc/interrupts: =C2=A0 0: =C2=A0 =C2=A0 =C2=A0 =C2=A0 42 =C2=A0 I=
O-APIC =C2=A0 2-edge =C2=A0 =C2=A0 =C2=A0timer</div><div>/proc/interrupts: =
=C2=A0 1: =C2=A0 =C2=A0 =C2=A0 1309 =C2=A0 IO-APIC =C2=A0 1-edge =C2=A0 =C2=
=A0 =C2=A0i8042</div><div>/proc/interrupts: =C2=A0 8: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A01 =C2=A0 IO-APIC =C2=A0 8-edge =C2=A0 =C2=A0 =C2=A0rtc0</div><=
div>/proc/interrupts: =C2=A0 9: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =
IO-APIC =C2=A0 9-fasteoi =C2=A0 acpi</div><div>/proc/interrupts: =C2=A012: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03 =C2=A0 IO-APIC =C2=A012-edge =C2=A0 =C2=
=A0 =C2=A0i8042</div><div>/proc/interrupts: =C2=A014: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00 =C2=A0 IO-APIC =C2=A014-edge =C2=A0 =C2=A0 =C2=A0ata_piix</d=
iv><div>/proc/interrupts: =C2=A015: =C2=A0 =C2=A0 =C2=A0 =C2=A0402 =C2=A0 I=
O-APIC =C2=A015-edge =C2=A0 =C2=A0 =C2=A0ata_piix</div><div>/proc/interrupt=
s: =C2=A019: =C2=A0 =C2=A0 219979 =C2=A0 IO-APIC =C2=A019-fasteoi =C2=A0 en=
p0s3</div><div>/proc/interrupts: =C2=A021: =C2=A0 =C2=A0 136869 =C2=A0 IO-A=
PIC =C2=A021-fasteoi =C2=A0 0000:00:0d.0</div><div>/proc/interrupts: =C2=A0=
22: =C2=A0 =C2=A0 =C2=A0 =C2=A0 25 =C2=A0 IO-APIC =C2=A022-fasteoi =C2=A0 o=
hci_hcd:usb1</div><div>/proc/interrupts: NMI: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 =C2=A0 Non-maskable interrupts</div><div>/proc/interrupts: LOC: =C2=
=A0 =C2=A0 157384 =C2=A0 Local timer interrupts</div><div>/proc/interrupts:=
 SPU: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 Spurious interrupts</div><=
div>/proc/interrupts: PMI: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 Perfo=
rmance monitoring interrupts</div><div>/proc/interrupts: IWI: =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A05 =C2=A0 IRQ work interrupts</div><div>/proc/interrupt=
s: RTR: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 APIC ICR read retries</d=
iv><div>/proc/interrupts: RES: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 R=
escheduling interrupts</div><div>/proc/interrupts: CAL: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00 =C2=A0 Function call interrupts</div><div>/proc/interrup=
ts: TLB: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 TLB shootdowns</div><di=
v>/proc/interrupts: TRM: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 Thermal=
 event interrupts</div><div>/proc/interrupts: THR: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A0 Threshold APIC interrupts</div><div>/proc/interrupts: DF=
R: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 Deferred Error APIC interrupt=
s</div><div>/proc/interrupts: MCE: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=
=A0 Machine check exceptions</div><div>/proc/interrupts: MCP: =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 18 =C2=A0 Machine check polls</div><div>/proc/interrupts: ER=
R: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00</div><div>/proc/interrupts: MIS: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00</div><div>/proc/interrupts: PIN: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 Posted-interrupt notification event</di=
v><div>/proc/interrupts: PIW: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 Po=
sted-interrupt wakeup event</div><div>/proc/meminfo: MemTotal: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 762768 kB</div><div>/proc/meminfo: MemFree: =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0181196 kB</div><div>/proc/meminfo: MemAvailable: =C2=
=A0 =C2=A0 561692 kB</div><div>/proc/meminfo: Buffers: =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A03040 kB</div><div>/proc/meminfo: Cached: =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 446144 kB</div><div>/proc/meminfo: SwapCached: =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB</div><div>/proc/meminfo: Active: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 306520 kB</div><div>/proc/meminfo: Inact=
ive: =C2=A0 =C2=A0 =C2=A0 =C2=A0 180532 kB</div><div>/proc/meminfo: Active(=
anon): =C2=A0 =C2=A0 114056 kB</div><div>/proc/meminfo: Inactive(anon): =C2=
=A0 =C2=A048424 kB</div><div>/proc/meminfo: Active(file): =C2=A0 =C2=A0 192=
464 kB</div><div>/proc/meminfo: Inactive(file): =C2=A0 132108 kB</div><div>=
/proc/meminfo: Unevictable: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB</div><d=
iv>/proc/meminfo: Mlocked: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0 kB</div><div>/proc/meminfo: SwapTotal: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0 kB</div><div>/proc/meminfo: SwapFree: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00 kB</div><div>/proc/meminfo: Dirty: =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01620 kB</div><div>/proc/meminfo: Writebac=
k: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB</div><div>/proc/meminfo: =
AnonPages: =C2=A0 =C2=A0 =C2=A0 =C2=A0 37956 kB</div><div>/proc/meminfo: Ma=
pped: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8728 kB</div><div>/proc/mem=
info: Shmem: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0124580 kB</div><div>/=
proc/meminfo: Slab: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A077124 k=
B</div><div>/proc/meminfo: SReclaimable: =C2=A0 =C2=A0 =C2=A068704 kB</div>=
<div>/proc/meminfo: SUnreclaim: =C2=A0 =C2=A0 =C2=A0 =C2=A0 8420 kB</div><d=
iv>/proc/meminfo: KernelStack: =C2=A0 =C2=A0 =C2=A0 =C2=A01744 kB</div><div=
>/proc/meminfo: PageTables: =C2=A0 =C2=A0 =C2=A0 =C2=A0 1072 kB</div><div>/=
proc/meminfo: NFS_Unstable: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB</div><di=
v>/proc/meminfo: Bounce: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 kB</div><div>/proc/meminfo: WritebackTmp: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 kB</div><div>/proc/meminfo: CommitLimit: =C2=A0 =C2=A0 =C2=A038=
1384 kB</div><div>/proc/meminfo: Committed_AS: =C2=A0 =C2=A0 168192 kB</div=
><div>/proc/meminfo: VmallocTotal: =C2=A0 34359738367 kB</div><div>/proc/me=
minfo: VmallocUsed: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB</div><div>/proc=
/meminfo: VmallocChunk: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB</div><div>/p=
roc/meminfo: HardwareCorrupted: =C2=A0 =C2=A0 0 kB</div><div>/proc/meminfo:=
 AnonHugePages: =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB</div><div>/proc/meminfo: H=
ugePages_Total: =C2=A0 =C2=A0 =C2=A0 0</div><div>/proc/meminfo: HugePages_F=
ree: =C2=A0 =C2=A0 =C2=A0 =C2=A00</div><div>/proc/meminfo: HugePages_Rsvd: =
=C2=A0 =C2=A0 =C2=A0 =C2=A00</div><div>/proc/meminfo: HugePages_Surp: =C2=
=A0 =C2=A0 =C2=A0 =C2=A00</div><div>/proc/meminfo: Hugepagesize: =C2=A0 =C2=
=A0 =C2=A0 2048 kB</div><div>/proc/meminfo: DirectMap4k: =C2=A0 =C2=A0 =C2=
=A0 38848 kB</div><div>/proc/meminfo: DirectMap2M: =C2=A0 =C2=A0 =C2=A07475=
20 kB</div><div>/proc/bus/input/devices: I: Bus=3D0011 Vendor=3D0001 Produc=
t=3D0001 Version=3Dab41</div><div>/proc/bus/input/devices: N: Name=3D&quot;=
AT Translated Set 2 keyboard&quot;</div><div>/proc/bus/input/devices: P: Ph=
ys=3Disa0060/serio0/input0</div><div>/proc/bus/input/devices: S: Sysfs=3D/d=
evices/platform/i8042/serio0/input/input0</div><div>/proc/bus/input/devices=
: U: Uniq=3D</div><div>/proc/bus/input/devices: H: Handlers=3Dsysrq kbd led=
s=C2=A0</div><div>/proc/bus/input/devices: B: PROP=3D0</div><div>/proc/bus/=
input/devices: B: EV=3D120013</div><div>/proc/bus/input/devices: B: KEY=3D4=
02000000 3803078f800d001 feffffdfffefffff fffffffffffffffe</div><div>/proc/=
bus/input/devices: B: MSC=3D10</div><div>/proc/bus/input/devices: B: LED=3D=
7</div><div>/proc/bus/input/devices:=C2=A0</div><div>/proc/bus/input/device=
s: I: Bus=3D0003 Vendor=3D80ee Product=3D0021 Version=3D0110</div><div>/pro=
c/bus/input/devices: N: Name=3D&quot;VirtualBox USB Tablet&quot;</div><div>=
/proc/bus/input/devices: P: Phys=3Dusb-0000:00:06.0-1/input0</div><div>/pro=
c/bus/input/devices: S: Sysfs=3D/devices/pci0000:00/0000:00:06.0/usb1/1-1/1=
-1:1.0/0003:80EE:0021.0001/input/input2</div><div>/proc/bus/input/devices: =
U: Uniq=3D</div><div>/proc/bus/input/devices: H: Handlers=3Dmouse0=C2=A0</d=
iv><div>/proc/bus/input/devices: B: PROP=3D0</div><div>/proc/bus/input/devi=
ces: B: EV=3D1f</div><div>/proc/bus/input/devices: B: KEY=3D1f0000 0 0 0 0<=
/div><div>/proc/bus/input/devices: B: REL=3D140</div><div>/proc/bus/input/d=
evices: B: ABS=3D3</div><div>/proc/bus/input/devices: B: MSC=3D10</div><div=
>/proc/bus/input/devices:=C2=A0</div><div><br></div><div>-- System Informat=
ion:</div><div>Debian Release: stretch/sid</div><div>=C2=A0 APT prefers tes=
ting-updates</div><div>=C2=A0 APT policy: (500, &#39;testing-updates&#39;),=
 (500, &#39;testing&#39;)</div><div>Architecture: amd64 (x86_64)</div><div>=
<br></div><div>Kernel: Linux 4.4.0-1+reiser4.0.1-amd64 (SMP w/1 CPU core)</=
div><div>Locale: LANG=3Den_US.UTF-8, LC_CTYPE=3Den_US.UTF-8 (charmap=3DUTF-=
8)</div><div>Shell: /bin/sh linked to /bin/dash</div><div>Init: systemd (vi=
a /run/systemd/system)</div><div><br></div><br>-- <br>Jose R R<br><a href=
=3D"http://metztli.it">http://metztli.it</a><br>---------------------------=
------------------------------------------------------------------<br>Try a=
t no charge <a href=3D"http://b2evolution.net">http://b2evolution.net</a> f=
or <a href=3D"http://OpenShift.com">http://OpenShift.com</a> PaaS<br>------=
---------------------------------------------------------------------------=
------------<br>from our GitHub <a href=3D"http://Nepohualtzintzin.com">htt=
p://Nepohualtzintzin.com</a> repository. Cloud the easy way!</div>

--001a1137b4c0f78e46052f2a93cc--

