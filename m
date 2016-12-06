From: Jose R Rodriguez <jose@metztli-it.com>
Subject: Bug#847230: installation-reports: Reiser4 successfull remote install on Cloud provider KVM infrastructure via netboot image
Date: Tue, 06 Dec 2016 08:49:52 -0800
Message-ID: <20161206164952.5454.37630.reportbug@tlaloccitlalli.metztli-it.com>
Reply-To: Jose R Rodriguez <jose@metztli-it.com>, 847230@bugs.debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-bugs-dist=glddb-debian-bugs-dist=m.gmane.org@lists.debian.org>
Sender: jose=metztli-it.com@mixtli.metztli.it
Resent-To: debian-bugs-dist@lists.debian.org
Resent-Message-ID: <handler.847230.B.14810433233388@bugs.debian.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1481043310; h=Date: Message-ID: Cc: Subject: To: From:
 Content-Transfer-Encoding: MIME-Version: Content-Type: Sender;
 bh=LpLXTznMoXTF08exEN4bpqA26Ib7H41VIuD8ko0ZsIA=; b=K9NYLLFycnYPWh35pgzoImwheTQrHmJlOBFtAm2jXrbDLJZwcyrgD7AKoi3S7uza8BO5breD
 iUpWdWZwMWlvr/CkDSLd6RXEI6UQVRcwa9qQ3MAPuvqC6zvajv5VBJRgnP3VUyKfOfnX0HCw
 Bd+1MjSiES5wQR3UGF4CexWC6Y4=
Sender: jose=metztli-it.com@mixtli.metztli.it
List-Id: <reiserfs-devel.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-bugs-dist/>
List-Post: <mailto:debian-bugs-dist@lists.debian.org>
List-Help: <mailto:debian-bugs-dist-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=unsubscribe>
To: Debian Bug Tracking System <submit@bugs.debian.org>
Cc: reiserfs-devel@vger.kernel.org

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

Boot method: netboot/virtual-disk
Image version: Debian-Reiser4 Jessie https://sourceforge.net/projects/debian-reiser4/
Date:  Dec 06, 2016 03:09 am, Pacific Standard Time (PST)

Machine: upCloud Provider https://www.upcloud.com/ QEMU/KVM cloud Infrastructure-as-a-Service (IaaS)
Partitions: 
Filesystem     Type     1K-blocks    Used Available Use% Mounted on
udev           devtmpfs     10240       0     10240   0% /dev
tmpfs          tmpfs       204100    4468    199632   3% /run
/dev/vda5      reiser4   18650464 1003996  17646468   6% /
tmpfs          tmpfs       510244       0    510244   0% /dev/shm
tmpfs          tmpfs         5120       0      5120   0% /run/lock
tmpfs          tmpfs       510244       0    510244   0% /sys/fs/cgroup
/dev/vda6      jfs       11633104    1944  11631160   1% /home
/dev/vda1      ext2        140805   34447     99088  26% /boot


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

Comments/Problems: netbooted off a 10Gb virtual-disk where Reiser4-enabled netboot installer
was transfered thus:
dd if=~/metztli.iso of=/dev/vdb bs=16M oflag=direct
< https://www.upcloud.com/support/using-own-installation-media/ >

Smooth Reiser4-enabled Jessie installer with newer relevant 
jessiena links to linux-image-4.7.0-1+reiser4.0.1-amd64_4.7.8-1+reiser4.0.1_amd64.deb
< https://metztli.it/readOnlyEphemeral/shot-2016-12-06_02-57-27.jpg >

Detected and carved from a 30 Gb existing virtual disk, partitioned, and formatted
its root file system in Reiser4 (SFRN) 4.0.1.

Debian-Reiser4 netboot detected remote network *beautifully* as I have no issues when
submitting this report:
< https://metztli.it/readOnlyEphemeral/tlaloccitlalli-2016-12-06_08-42-39.jpg  >

-------fragment of /var/log/syslog----------------
Dec  6 03:41:56 tlaloccitlalli rsyslogd: [origin software="rsyslogd" swVersion="8.4.2" x-pid="517" x-info="http://www.rsyslog.com"] start
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] Linux version 4.7.0-1+reiser4.0.1-amd64 (debian-kernel@lists.debian.org) (gcc version 4.9.2 (Debian 4.9.2-10) ) #1 SMP Debian 4.7.8-1+reiser4.0.1 (2016-10-26)
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] Command line: BOOT_IMAGE=/vmlinuz-4.7.0-1+reiser4.0.1-amd64 root=/dev/vda5 ro quiet
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] x86/fpu: Using 'eager' FPU context switches.
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] e820: BIOS-provided physical RAM map:
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000003fff8fff] usable
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] BIOS-e820: [mem 0x000000003fff9000-0x000000003fffffff] reserved
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] NX (Execute Disable) protection: active
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] SMBIOS 2.4 present.
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] DMI: UpCloud Cloud Server, BIOS Bochs 01/01/2011
Dec  6 03:41:56 tlaloccitlalli kernel: [    0.000000] Hypervisor detected: KVM
[...]

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
DISTRIB_RELEASE="8 (jessie) - installer build 20161026-10:50"
X_INSTALLATION_MEDIUM=netboot

==============================================
Installer hardware-summary:
==============================================
uname -a: Linux tlaloccitlalli 4.7.0-1+reiser4.0.1-amd64 #1 SMP Debian 4.7.8-1+reiser4.0.1 (2016-10-26) x86_64 Xonecuiltzin
lspci -knn: 00:00.0 Host bridge [0600]: Intel Corporation 440FX - 82441FX PMC [Natoma] [8086:1237] (rev 02)
lspci -knn: 	Subsystem: Red Hat, Inc Device [1af4:1100]
lspci -knn: 00:01.0 ISA bridge [0601]: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II] [8086:7000]
lspci -knn: 	Subsystem: Red Hat, Inc Device [1af4:1100]
lspci -knn: 00:01.1 IDE interface [0101]: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton II] [8086:7010]
lspci -knn: 	Subsystem: Red Hat, Inc Device [1af4:1100]
lspci -knn: 	Kernel driver in use: ata_piix
lspci -knn: 00:01.2 USB controller [0c03]: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton II] [8086:7020] (rev 01)
lspci -knn: 	Subsystem: Red Hat, Inc Device [1af4:1100]
lspci -knn: 	Kernel driver in use: uhci_hcd
lspci -knn: 00:01.3 Bridge [0680]: Intel Corporation 82371AB/EB/MB PIIX4 ACPI [8086:7113] (rev 03)
lspci -knn: 	Subsystem: Red Hat, Inc Device [1af4:1100]
lspci -knn: 00:02.0 VGA compatible controller [0300]: Cirrus Logic GD 5446 [1013:00b8]
lspci -knn: 	Subsystem: Red Hat, Inc Device [1af4:1100]
lspci -knn: 00:03.0 SCSI storage controller [0100]: Red Hat, Inc Virtio block device [1af4:1001]
lspci -knn: 	Subsystem: Red Hat, Inc Device [1af4:0002]
lspci -knn: 	Kernel driver in use: virtio-pci
lspci -knn: 00:10.0 Ethernet controller [0200]: Red Hat, Inc Virtio network device [1af4:1000]
lspci -knn: 	Subsystem: Red Hat, Inc Device [1af4:0001]
lspci -knn: 	Kernel driver in use: virtio-pci
lspci -knn: 00:11.0 Ethernet controller [0200]: Red Hat, Inc Virtio network device [1af4:1000]
lspci -knn: 	Subsystem: Red Hat, Inc Device [1af4:0001]
lspci -knn: 	Kernel driver in use: virtio-pci
lspci -knn: 00:12.0 Ethernet controller [0200]: Red Hat, Inc Virtio network device [1af4:1000]
lspci -knn: 	Subsystem: Red Hat, Inc Device [1af4:0001]
lspci -knn: 	Kernel driver in use: virtio-pci
usb-list: 
usb-list: Bus 01 Device 01: UHCI Host Controller [1d6b:0001]
usb-list:    Level 00 Parent 00 Port 00  Class 09(hub  ) Subclass 00 Protocol 00
usb-list:    Manufacturer: Linux 4.7.0-1+reiser4.0.1-amd64 uhci_hcd
usb-list:    Interface 00: Class 09(hub  ) Subclass 00 Protocol 00 Driver hub
usb-list: 
usb-list: Bus 01 Device 02: QEMU USB Tablet [0627:0001]
usb-list:    Level 01 Parent 01 Port 00  Class 00(>ifc ) Subclass 00 Protocol 00
usb-list:    Manufacturer: QEMU
usb-list:    Interface 00: Class 03(HID  ) Subclass 00 Protocol 02 Driver usbhid
lsmod: Module                  Size  Used by
lsmod: fuse                   98304  0 
lsmod: ufs                    73728  0 
lsmod: qnx4                   16384  0 
lsmod: hfsplus               102400  0 
lsmod: hfs                    57344  0 
lsmod: minix                  40960  0 
lsmod: msdos                  20480  0 
lsmod: nls_utf8               16384  4 
lsmod: battery                16384  0 
lsmod: dm_mod                106496  0 
lsmod: md_mod                131072  0 
lsmod: xfs                   978944  0 
lsmod: libcrc32c              16384  1 xfs
lsmod: reiser4               442368  1 
lsmod: jfs                   176128  1 
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
lsmod: crc32c_generic         16384  7 
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
lsmod: ata_generic            16384  0 
lsmod: virtio_net             28672  0 
lsmod: virtio_blk             20480  4 
lsmod: ata_piix               36864  0 
lsmod: uhci_hcd               45056  0 
lsmod: ehci_hcd               77824  0 
lsmod: virtio_pci             24576  0 
lsmod: virtio_ring            24576  3 virtio_blk,virtio_net,virtio_pci
lsmod: virtio                 16384  3 virtio_blk,virtio_net,virtio_pci
lsmod: libata                245760  2 ata_generic,ata_piix
lsmod: usbcore               241664  4 uhci_hcd,usb_storage,ehci_hcd,usbhid
lsmod: usb_common             16384  1 usbcore
lsmod: scsi_mod              225280  4 sg,usb_storage,libata,sr_mod
df: Filesystem           1K-blocks      Used Available Use% Mounted on
df: none                    102052        72    101980   0% /run
df: devtmpfs                496056         0    496056   0% /dev
df: /dev/vda5             18650464    906068  17744396   5% /target
df: /dev/vda1               140805     34447     99088  26% /target/boot
df: /dev/vda6             11633104      1588  11631516   0% /target/home
df: /dev/vda5             18650464    906068  17744396   5% /dev/.static/dev
df: devtmpfs                496056         0    496056   0% /target/dev
free:              total       used       free     shared    buffers     cached
free: Mem:       1020496     704768     315728     115460       3544     550500
free: -/+ buffers/cache:     150724     869772
free: Swap:            0          0          0
/proc/cmdline: BOOT_IMAGE=linux priority=low vga=788 initrd=initrd.gz --- 
/proc/cpuinfo: processor	: 0
/proc/cpuinfo: vendor_id	: GenuineIntel
/proc/cpuinfo: cpu family	: 6
/proc/cpuinfo: model		: 79
/proc/cpuinfo: model name	: Intel(R) Xeon(R) CPU E5-2687W v4 @ 3.00GHz
/proc/cpuinfo: stepping	: 1
/proc/cpuinfo: microcode	: 0x1
/proc/cpuinfo: cpu MHz		: 2999.996
/proc/cpuinfo: cache size	: 30720 KB
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
/proc/cpuinfo: flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm rdseed adx smap xsaveopt arat
/proc/cpuinfo: bugs		:
/proc/cpuinfo: bogomips	: 5999.99
/proc/cpuinfo: clflush size	: 64
/proc/cpuinfo: cache_alignment	: 64
/proc/cpuinfo: address sizes	: 40 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo: 
/proc/ioports: 0000-0cf7 : PCI Bus 0000:00
/proc/ioports:   0000-001f : dma1
/proc/ioports:   0020-0021 : pic1
/proc/ioports:   0040-0043 : timer0
/proc/ioports:   0050-0053 : timer1
/proc/ioports:   0060-0060 : keyboard
/proc/ioports:   0064-0064 : keyboard
/proc/ioports:   0070-0071 : rtc0
/proc/ioports:   0080-008f : dma page reg
/proc/ioports:   00a0-00a1 : pic2
/proc/ioports:   00c0-00df : dma2
/proc/ioports:   00f0-00ff : fpu
/proc/ioports:   0170-0177 : 0000:00:01.1
/proc/ioports:     0170-0177 : ata_piix
/proc/ioports:   01f0-01f7 : 0000:00:01.1
/proc/ioports:     01f0-01f7 : ata_piix
/proc/ioports:   02f8-02ff : serial
/proc/ioports:   0376-0376 : 0000:00:01.1
/proc/ioports:     0376-0376 : ata_piix
/proc/ioports:   03f6-03f6 : 0000:00:01.1
/proc/ioports:     03f6-03f6 : ata_piix
/proc/ioports:   03f8-03ff : serial
/proc/ioports: 0cf8-0cff : PCI conf1
/proc/ioports: 0d00-ffff : PCI Bus 0000:00
/proc/ioports:   afe0-afe3 : ACPI GPE0_BLK
/proc/ioports:   b000-b03f : 0000:00:01.3
/proc/ioports:     b000-b003 : ACPI PM1a_EVT_BLK
/proc/ioports:     b004-b005 : ACPI PM1a_CNT_BLK
/proc/ioports:     b008-b00b : ACPI PM_TMR
/proc/ioports:   b100-b10f : 0000:00:01.3
/proc/ioports:   c000-c03f : 0000:00:03.0
/proc/ioports:     c000-c03f : virtio-pci-legacy
/proc/ioports:   c040-c05f : 0000:00:01.2
/proc/ioports:     c040-c05f : uhci_hcd
/proc/ioports:   c060-c07f : 0000:00:10.0
/proc/ioports:     c060-c07f : virtio-pci-legacy
/proc/ioports:   c080-c09f : 0000:00:11.0
/proc/ioports:     c080-c09f : virtio-pci-legacy
/proc/ioports:   c0a0-c0bf : 0000:00:12.0
/proc/ioports:     c0a0-c0bf : virtio-pci-legacy
/proc/ioports:   c0c0-c0cf : 0000:00:01.1
/proc/ioports:     c0c0-c0cf : ata_piix
/proc/iomem: 00000000-00000fff : reserved
/proc/iomem: 00001000-0009fbff : System RAM
/proc/iomem: 0009fc00-0009ffff : reserved
/proc/iomem: 000a0000-000bffff : PCI Bus 0000:00
/proc/iomem: 000c0000-000c95ff : Video ROM
/proc/iomem: 000c9800-000ca1ff : Adapter ROM
/proc/iomem: 000ca800-000cb1ff : Adapter ROM
/proc/iomem: 000cb800-000cc1ff : Adapter ROM
/proc/iomem: 000cc800-000cebff : Adapter ROM
/proc/iomem: 000f0000-000fffff : reserved
/proc/iomem:   000f0000-000fffff : System ROM
/proc/iomem: 00100000-3fffafff : System RAM
/proc/iomem:   2ee00000-2f3d45fa : Kernel code
/proc/iomem:   2f3d45fb-2f92307f : Kernel data
/proc/iomem:   2fa81000-2fb4afff : Kernel bss
/proc/iomem: 3fffb000-3fffffff : reserved
/proc/iomem: 80000000-febfffff : PCI Bus 0000:00
/proc/iomem:   fc000000-fdffffff : 0000:00:02.0
/proc/iomem:     fc000000-fc0eafff : BOOTFB
/proc/iomem:   febc0000-febcffff : 0000:00:10.0
/proc/iomem:   febd0000-febdffff : 0000:00:11.0
/proc/iomem:   febe0000-febeffff : 0000:00:12.0
/proc/iomem:   febf0000-febf0fff : 0000:00:02.0
/proc/iomem:   febf1000-febf1fff : 0000:00:03.0
/proc/iomem:   febf2000-febf2fff : 0000:00:10.0
/proc/iomem:   febf3000-febf3fff : 0000:00:11.0
/proc/iomem:   febf4000-febf4fff : 0000:00:12.0
/proc/iomem: fec00000-fec003ff : IOAPIC 0
/proc/iomem: fed00000-fed003ff : HPET 0
/proc/iomem:   fed00000-fed003ff : PNP0103:00
/proc/iomem: fee00000-fee00fff : Local APIC
/proc/iomem: feffc000-feffffff : reserved
/proc/iomem: fffc0000-ffffffff : reserved
/proc/interrupts:            CPU0       
/proc/interrupts:   0:          7   IO-APIC   2-edge      timer
/proc/interrupts:   1:       2666   IO-APIC   1-edge      i8042
/proc/interrupts:   8:         25   IO-APIC   8-edge      rtc0
/proc/interrupts:   9:          0   IO-APIC   9-fasteoi   acpi
/proc/interrupts:  11:         32   IO-APIC  11-fasteoi   uhci_hcd:usb1
/proc/interrupts:  12:          3   IO-APIC  12-edge      i8042
/proc/interrupts:  14:       3343   IO-APIC  14-edge      ata_piix
/proc/interrupts:  15:          0   IO-APIC  15-edge      ata_piix
/proc/interrupts:  24:          0   PCI-MSI 49152-edge      virtio0-config
/proc/interrupts:  25:     361615   PCI-MSI 49153-edge      virtio0-req.0
/proc/interrupts:  26:          0   PCI-MSI 262144-edge      virtio1-config
/proc/interrupts:  27:      38269   PCI-MSI 262145-edge      virtio1-input.0
/proc/interrupts:  28:          1   PCI-MSI 262146-edge      virtio1-output.0
/proc/interrupts:  29:          0   PCI-MSI 278528-edge      virtio2-config
/proc/interrupts:  30:          1   PCI-MSI 278529-edge      virtio2-input.0
/proc/interrupts:  31:          0   PCI-MSI 278530-edge      virtio2-output.0
/proc/interrupts:  32:          0   PCI-MSI 294912-edge      virtio3-config
/proc/interrupts:  33:          2   PCI-MSI 294913-edge      virtio3-input.0
/proc/interrupts:  34:          0   PCI-MSI 294914-edge      virtio3-output.0
/proc/interrupts: NMI:          0   Non-maskable interrupts
/proc/interrupts: LOC:     206668   Local timer interrupts
/proc/interrupts: SPU:          0   Spurious interrupts
/proc/interrupts: PMI:          0   Performance monitoring interrupts
/proc/interrupts: IWI:          4   IRQ work interrupts
/proc/interrupts: RTR:          0   APIC ICR read retries
/proc/interrupts: RES:          0   Rescheduling interrupts
/proc/interrupts: CAL:          0   Function call interrupts
/proc/interrupts: TLB:          0   TLB shootdowns
/proc/interrupts: TRM:          0   Thermal event interrupts
/proc/interrupts: THR:          0   Threshold APIC interrupts
/proc/interrupts: DFR:          0   Deferred Error APIC interrupts
/proc/interrupts: MCE:          0   Machine check exceptions
/proc/interrupts: MCP:         11   Machine check polls
/proc/interrupts: ERR:          0
/proc/interrupts: MIS:          0
/proc/interrupts: PIN:          0   Posted-interrupt notification event
/proc/interrupts: PIW:          0   Posted-interrupt wakeup event
/proc/meminfo: MemTotal:        1020496 kB
/proc/meminfo: MemFree:          315664 kB
/proc/meminfo: MemAvailable:     676080 kB
/proc/meminfo: Buffers:            3544 kB
/proc/meminfo: Cached:           550500 kB
/proc/meminfo: SwapCached:            0 kB
/proc/meminfo: Active:           337112 kB
/proc/meminfo: Inactive:         239228 kB
/proc/meminfo: Active(anon):      93460 kB
/proc/meminfo: Inactive(anon):    44292 kB
/proc/meminfo: Active(file):     243652 kB
/proc/meminfo: Inactive(file):   194936 kB
/proc/meminfo: Unevictable:           0 kB
/proc/meminfo: Mlocked:               0 kB
/proc/meminfo: SwapTotal:             0 kB
/proc/meminfo: SwapFree:              0 kB
/proc/meminfo: Dirty:              1024 kB
/proc/meminfo: Writeback:             0 kB
/proc/meminfo: AnonPages:         22332 kB
/proc/meminfo: Mapped:             5868 kB
/proc/meminfo: Shmem:            115460 kB
/proc/meminfo: Slab:             107756 kB
/proc/meminfo: SReclaimable:      99048 kB
/proc/meminfo: SUnreclaim:         8708 kB
/proc/meminfo: KernelStack:        1536 kB
/proc/meminfo: PageTables:          704 kB
/proc/meminfo: NFS_Unstable:          0 kB
/proc/meminfo: Bounce:                0 kB
/proc/meminfo: WritebackTmp:          0 kB
/proc/meminfo: CommitLimit:      510248 kB
/proc/meminfo: Committed_AS:     141476 kB
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
/proc/meminfo: DirectMap4k:      147436 kB
/proc/meminfo: DirectMap2M:      901120 kB
/proc/meminfo: DirectMap1G:           0 kB
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
/proc/bus/input/devices: I: Bus=0003 Vendor=0627 Product=0001 Version=0001
/proc/bus/input/devices: N: Name="QEMU QEMU USB Tablet"
/proc/bus/input/devices: P: Phys=usb-0000:00:01.2-1/input0
/proc/bus/input/devices: S: Sysfs=/devices/pci0000:00/0000:00:01.2/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input2
/proc/bus/input/devices: U: Uniq=42
/proc/bus/input/devices: H: Handlers=mouse0 
/proc/bus/input/devices: B: PROP=0
/proc/bus/input/devices: B: EV=1f
/proc/bus/input/devices: B: KEY=70000 0 0 0 0
/proc/bus/input/devices: B: REL=100
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

