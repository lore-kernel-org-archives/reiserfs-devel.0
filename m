From: jose@metztli-it.com
Subject: Reiser4(SFRN 4.0.1) kernel 4.6.0-1+reiser4.0.1-amd64 [4.6.3-1+reiser4.0.1(2016-07-15)] d-i on Jessie successful install on HP Pavilion
Date: Sun, 17 Jul 2016 17:36:24 +0000 (UTC)
Message-ID: <20160717173624.CCC003DFB2@tlahuizcalpanteuctli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1468776984; h=From: Date: Message-Id: Subject: To: Sender;
 bh=vb1rQxrBFUMbDeTorAelkGWzA6RGRGSm6TggU/j3L9k=; b=KGO9Up56Qud/Wsb6NxRz1tLBV8l7RDpslNX2ScLq+2FOuZusWDrDgnnTOb3JpJvSaStSGeld
 pdj5b1AF2J1FU/sxl6BQQhJBKykD2zM5P98OqFtZlqIFc+UpHnkxbXluMNFkb3O1xRETOF/j
 0cQNQae9U5d4F7ej90dvwqpe3Ms=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

---------- Forwarded message ----------
From: <jose@metztli-it.com>
Date: Sun, Jul 17, 2016 at 5:27 PM
Subject: Bug#831604: installation-reports: Reiser4(SFRN 4.0.1) kernel 4.6.0-1+reiser4.0.1-amd64 [4.6.3-1+reiser4.0.1(2016-07-15)] d-i on Jessie successful install on HP Pavilion
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

Boot method: USB
Image version: https://metztli.it/readOnlyEphemeral/metztli-jessie_4.6.3-1.iso
               https://metztli.it/readOnlyEphemeral/metztli-jessie_4.6.3-1.SHA256SUM
Date: Sun Jul 17 17:09:59 UTC 2016

Machine: HP Pavilion dv6 laptop
Partitions:
Filesystem     Type     1K-blocks    Used Available Use% Mounted on
udev           devtmpfs     10240       0     10240   0% /dev
tmpfs          tmpfs      3276608    9280   3267328   1% /run
/dev/sda2      reiser4   20432028 3803900  16628128  19% /
tmpfs          tmpfs      8191512     216   8191296   1% /dev/shm
tmpfs          tmpfs         5120       4      5116   1% /run/lock
tmpfs          tmpfs      8191512       0   8191512   0% /sys/fs/cgroup
/dev/sda9      ext2        136269   57670     71329  45% /boot
tmpfs          tmpfs      1638304       8   1638296   1% /run/user/118
tmpfs          tmpfs      1638304      24   1638280   1% /run/user/1000
/dev/sda5      reiser4   18557056 4103488  14453568  23% /mnt


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

Comments/Problems: Smooth installation: https://metztli.it/readOnlyEphemeral/tlahuizcalpanteuctli.png
Reiser4 [Software Format Release Number (SFRN) 4.0.1]-enabled d-i on USB[*], implemented expert install with Debian Desktop Environment GUI.
Custom kernel[**] embedded as UDEB in Debian-Installer (d-i), automatically downloaded kernel & matching reiser4progs from metztli.it.
d-i also fetched required linux-base 4.3 dependency from Jessie backports and last d-i phase removed nfs-common.

[*]
dd if=metztli-jessie_4.6.3-1.iso of=/dev/sdb bs=4M; sync
(where, of course, /dev/sdb represents [your] USB device)

[**]
Debian source packaging for Sid was modified to remove references to xserver-xorg-input-vmmouse & d-i modified/built appropriately:
debian/config/amd64/defines
debian/config/i386/defines
debian/config/kernelarch-x86/config (i.e., disabled CONFIG_MOUSE_PS2_VMMOUSE=y)

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
DISTRIB_RELEASE="8 (jessie) - installer build 20160716-13:43"
X_INSTALLATION_MEDIUM=netboot

==============================================
Installer hardware-summary:
==============================================
uname -a: Linux tlahuizcalpanteuctli 4.6.0-1+reiser4.0.1-amd64 #1 SMP Debian 4.6.3-1+reiser4.0.1 (2016-07-15) x86_64 Xonecuiltzin
lspci -knn: 00:00.0 Host bridge [0600]: Intel Corporation 2nd Generation Core Processor Family DRAM Controller [8086:0104] (rev 09)
lspci -knn:     Subsystem: Hewlett-Packard Company Device [103c:1658]
lspci -knn: 00:02.0 VGA compatible controller [0300]: Intel Corporation 2nd Generation Core Processor Family Integrated Graphics Controller [8086:0116] (rev 09)
lspci -knn:     Subsystem: Hewlett-Packard Company Device [103c:1658]
lspci -knn: 00:16.0 Communication controller [0780]: Intel Corporation 6 Series/C200 Series Chipset Family MEI Controller #1 [8086:1c3a] (rev 04)
lspci -knn:     Subsystem: Hewlett-Packard Company Device [103c:1658]
lspci -knn: 00:1a.0 USB controller [0c03]: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #2 [8086:1c2d] (rev 05)
lspci -knn:     Subsystem: Hewlett-Packard Company Device [103c:1658]
lspci -knn:     Kernel driver in use: ehci-pci
lspci -knn: 00:1b.0 Audio device [0403]: Intel Corporation 6 Series/C200 Series Chipset Family High Definition Audio Controller [8086:1c20] (rev 05)
lspci -knn:     Subsystem: Hewlett-Packard Company Device [103c:1658]
lspci -knn: 00:1c.0 PCI bridge [0604]: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 1 [8086:1c10] (rev b5)
lspci -knn:     Kernel driver in use: pcieport
lspci -knn: 00:1c.1 PCI bridge [0604]: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 2 [8086:1c12] (rev b5)
lspci -knn:     Kernel driver in use: pcieport
lspci -knn: 00:1c.2 PCI bridge [0604]: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 3 [8086:1c14] (rev b5)
lspci -knn:     Kernel driver in use: pcieport
lspci -knn: 00:1c.3 PCI bridge [0604]: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 4 [8086:1c16] (rev b5)
lspci -knn:     Kernel driver in use: pcieport
lspci -knn: 00:1d.0 USB controller [0c03]: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #1 [8086:1c26] (rev 05)
lspci -knn:     Subsystem: Hewlett-Packard Company Device [103c:1658]
lspci -knn:     Kernel driver in use: ehci-pci
lspci -knn: 00:1f.0 ISA bridge [0601]: Intel Corporation HM65 Express Chipset Family LPC Controller [8086:1c49] (rev 05)
lspci -knn:     Subsystem: Hewlett-Packard Company Device [103c:1658]
lspci -knn: 00:1f.2 SATA controller [0106]: Intel Corporation 6 Series/C200 Series Chipset Family 6 port SATA AHCI Controller [8086:1c03] (rev 05)
lspci -knn:     Subsystem: Hewlett-Packard Company Device [103c:1658]
lspci -knn:     Kernel driver in use: ahci
lspci -knn: 00:1f.3 SMBus [0c05]: Intel Corporation 6 Series/C200 Series Chipset Family SMBus Controller [8086:1c22] (rev 05)
lspci -knn:     Subsystem: Hewlett-Packard Company Device [103c:1658]
lspci -knn: 01:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev 06)
lspci -knn:     Subsystem: Hewlett-Packard Company Device [103c:1658]
lspci -knn:     Kernel driver in use: r8169
lspci -knn: 07:00.0 Network controller [0280]: Intel Corporation Centrino Wireless-N 1030 [Rainbow Peak] [8086:008b] (rev 34)
lspci -knn:     Subsystem: Intel Corporation Device [8086:5315]
lspci -knn: 0d:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS5209 PCI Express Card Reader [10ec:5209] (rev 01)
lspci -knn:     Subsystem: Hewlett-Packard Company Device [103c:1658]
lspci -knn:     Kernel driver in use: rtsx_pci
lspci -knn: 0d:00.1 SD Host controller [0805]: Realtek Semiconductor Co., Ltd. RTS5209 PCI Express Card Reader [10ec:5209] (rev 01)
lspci -knn:     Subsystem: Hewlett-Packard Company Device [103c:1658]
lspci -knn:     Kernel driver in use: sdhci-pci
lspci -knn: 13:00.0 USB controller [0c03]: NEC Corporation uPD720200 USB 3.0 Host Controller [1033:0194] (rev 04)
lspci -knn:     Subsystem: Hewlett-Packard Company Device [103c:1658]
lspci -knn:     Kernel driver in use: xhci_hcd
usb-list:
usb-list: Bus 01 Device 01: EHCI Host Controller [1d6b:0002]
usb-list:    Level 00 Parent 00 Port 00  Class 09(hub  ) Subclass 00 Protocol 00
usb-list:    Manufacturer: Linux 4.6.0-1+reiser4.0.1-amd64 ehci_hcd
usb-list:    Interface 00: Class 09(hub  ) Subclass 00 Protocol 00 Driver hub
usb-list:
usb-list: Bus 01 Device 02: EHCI Host Controller [8087:0024]
usb-list:    Level 01 Parent 01 Port 00  Class 09(hub  ) Subclass 00 Protocol 01
usb-list:    Interface 00: Class 09(hub  ) Subclass 00 Protocol 00 Driver hub
usb-list:
usb-list: Bus 02 Device 01: xHCI Host Controller [1d6b:0002]
usb-list:    Level 00 Parent 00 Port 00  Class 09(hub  ) Subclass 00 Protocol 01
usb-list:    Manufacturer: Linux 4.6.0-1+reiser4.0.1-amd64 xhci-hcd
usb-list:    Interface 00: Class 09(hub  ) Subclass 00 Protocol 00 Driver hub
usb-list:
usb-list: Bus 02 Device 02: USB Flash Disk                 [8644:800b]
usb-list:    Level 01 Parent 01 Port 01  Class 00(>ifc ) Subclass 00 Protocol 00
usb-list:    Manufacturer: General
usb-list:    Interface 00: Class 08(mstor) Subclass 06 Protocol 50 Driver usb-storage
usb-list:
usb-list: Bus 03 Device 01: EHCI Host Controller [1d6b:0002]
usb-list:    Level 00 Parent 00 Port 00  Class 09(hub  ) Subclass 00 Protocol 00
usb-list:    Manufacturer: Linux 4.6.0-1+reiser4.0.1-amd64 ehci_hcd
usb-list:    Interface 00: Class 09(hub  ) Subclass 00 Protocol 00 Driver hub
usb-list:
usb-list: Bus 03 Device 02: EHCI Host Controller [8087:0024]
usb-list:    Level 01 Parent 01 Port 00  Class 09(hub  ) Subclass 00 Protocol 01
usb-list:    Interface 00: Class 09(hub  ) Subclass 00 Protocol 00 Driver hub
usb-list:
usb-list: Bus 03 Device 03: 2.4G Keyboard Mouse [062a:4101]
usb-list:    Level 02 Parent 02 Port 00  Class 00(>ifc ) Subclass 00 Protocol 00
usb-list:    Manufacturer: MOSART Semi.
usb-list:    Interface 00: Class 03(HID  ) Subclass 01 Protocol 01 Driver usbhid
usb-list:    Interface 01: Class 03(HID  ) Subclass 01 Protocol 02 Driver usbhid
usb-list:
usb-list: Bus 03 Device 04: 2.4G Keyboard Mouse [8086:0189]
usb-list:    Level 02 Parent 02 Port 04  Class e0(wlcon) Subclass 01 Protocol 01
usb-list:    Interface 00: Class e0(wlcon) Subclass 01 Protocol 01 Driver <none>
usb-list:    Interface 01: Class e0(wlcon) Subclass 01 Protocol 01 Driver <none>
usb-list:
usb-list: Bus 04 Device 01: xHCI Host Controller [1d6b:0003]
usb-list:    Level 00 Parent 00 Port 00  Class 09(hub  ) Subclass 00 Protocol 03
usb-list:    Manufacturer: Linux 4.6.0-1+reiser4.0.1-amd64 xhci-hcd
usb-list:    Interface 00: Class 09(hub  ) Subclass 00 Protocol 00 Driver hub
lsmod: Module                  Size  Used by
lsmod: ufs                    73728  0
lsmod: qnx4                   16384  0
lsmod: hfsplus               102400  0
lsmod: hfs                    57344  0
lsmod: minix                  36864  0
lsmod: msdos                  20480  0
lsmod: fuse                   98304  0
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
lsmod: ext4                  593920  1
lsmod: ecb                    16384  0
lsmod: crc16                  16384  1 ext4
lsmod: jbd2                  106496  1 ext4
lsmod: crc32c_generic         16384  4
lsmod: mbcache                16384  2 ext4
lsmod: r8169                  81920  0
lsmod: mii                    16384  1 r8169
lsmod: iwlwifi               147456  0
lsmod: cfg80211              573440  1 iwlwifi
lsmod: rfkill                 24576  1 cfg80211
lsmod: nls_utf8               16384  2
lsmod: nls_cp437              20480  0
lsmod: vfat                   20480  0
lsmod: fat                    69632  2 vfat,msdos
lsmod: vga16fb                24576  0
lsmod: vgastate               20480  1 vga16fb
lsmod: hid_generic            16384  0
lsmod: usbhid                 49152  0
lsmod: hid                   118784  2 hid_generic,usbhid
lsmod: sg                     32768  0
lsmod: uas                    24576  0
lsmod: usb_storage            69632  1 uas
lsmod: sd_mod                 45056  4
lsmod: rtsx_pci_sdmmc         24576  0
lsmod: ahci                   36864  3
lsmod: xhci_pci               16384  0
lsmod: ehci_pci               16384  0
lsmod: libahci                32768  1 ahci
lsmod: xhci_hcd              180224  1 xhci_pci
lsmod: ehci_hcd               77824  1 ehci_pci
lsmod: libata                233472  2 ahci,libahci
lsmod: sdhci_pci              28672  0
lsmod: sdhci                  40960  1 sdhci_pci
lsmod: usbcore               241664  7 uas,usb_storage,ehci_hcd,ehci_pci,usbhid,xhci_hcd,xhci_pci
lsmod: scsi_mod              233472  5 sg,uas,usb_storage,libata,sd_mod
lsmod: rtsx_pci               53248  1 rtsx_pci_sdmmc
lsmod: mmc_core              126976  3 sdhci,rtsx_pci_sdmmc,sdhci_pci
lsmod: mfd_core               16384  1 rtsx_pci
lsmod: usb_common             16384  1 usbcore
lsmod: thermal                20480  0
df: Filesystem           1K-blocks      Used Available Use% Mounted on
df: none                   1638304       152   1638152   0% /run
df: devtmpfs               8177396         0   8177396   0% /dev
df: /dev/sda2             20432028   3628716  16803312  18% /target
df: /dev/sda2             20432028   3628716  16803312  18% /dev/.static/dev
df: devtmpfs               8177396         0   8177396   0% /target/dev
df: /dev/sda9               136269     57670     71329  45% /target/boot
free:              total       used       free     shared    buffers     cached
free: Mem:      16383024    4476956   11906068     114804       4572    3868784
free: -/+ buffers/cache:     603600   15779424
free: Swap:      2931808          0    2931808
/proc/cmdline: BOOT_IMAGE=linux priority=low vga=788 initrd=initrd.gz ---
/proc/cpuinfo: processor        : 0
/proc/cpuinfo: vendor_id        : GenuineIntel
/proc/cpuinfo: cpu family       : 6
/proc/cpuinfo: model            : 42
/proc/cpuinfo: model name       : Intel(R) Core(TM) i7-2670QM CPU @ 2.20GHz
/proc/cpuinfo: stepping : 7
/proc/cpuinfo: microcode        : 0x25
/proc/cpuinfo: cpu MHz          : 1903.515
/proc/cpuinfo: cache size       : 6144 KB
/proc/cpuinfo: physical id      : 0
/proc/cpuinfo: siblings : 8
/proc/cpuinfo: core id          : 0
/proc/cpuinfo: cpu cores        : 4
/proc/cpuinfo: apicid           : 0
/proc/cpuinfo: initial apicid   : 0
/proc/cpuinfo: fpu              : yes
/proc/cpuinfo: fpu_exception    : yes
/proc/cpuinfo: cpuid level      : 13
/proc/cpuinfo: wp               : yes
/proc/cpuinfo: flags            : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts
/proc/cpuinfo: bugs             :
/proc/cpuinfo: bogomips : 4389.89
/proc/cpuinfo: clflush size     : 64
/proc/cpuinfo: cache_alignment  : 64
/proc/cpuinfo: address sizes    : 36 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo:
/proc/cpuinfo: processor        : 1
/proc/cpuinfo: vendor_id        : GenuineIntel
/proc/cpuinfo: cpu family       : 6
/proc/cpuinfo: model            : 42
/proc/cpuinfo: model name       : Intel(R) Core(TM) i7-2670QM CPU @ 2.20GHz
/proc/cpuinfo: stepping : 7
/proc/cpuinfo: microcode        : 0x25
/proc/cpuinfo: cpu MHz          : 1804.945
/proc/cpuinfo: cache size       : 6144 KB
/proc/cpuinfo: physical id      : 0
/proc/cpuinfo: siblings : 8
/proc/cpuinfo: core id          : 0
/proc/cpuinfo: cpu cores        : 4
/proc/cpuinfo: apicid           : 1
/proc/cpuinfo: initial apicid   : 1
/proc/cpuinfo: fpu              : yes
/proc/cpuinfo: fpu_exception    : yes
/proc/cpuinfo: cpuid level      : 13
/proc/cpuinfo: wp               : yes
/proc/cpuinfo: flags            : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts
/proc/cpuinfo: bugs             :
/proc/cpuinfo: bogomips : 4391.14
/proc/cpuinfo: clflush size     : 64
/proc/cpuinfo: cache_alignment  : 64
/proc/cpuinfo: address sizes    : 36 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo:
/proc/cpuinfo: processor        : 2
/proc/cpuinfo: vendor_id        : GenuineIntel
/proc/cpuinfo: cpu family       : 6
/proc/cpuinfo: model            : 42
/proc/cpuinfo: model name       : Intel(R) Core(TM) i7-2670QM CPU @ 2.20GHz
/proc/cpuinfo: stepping : 7
/proc/cpuinfo: microcode        : 0x25
/proc/cpuinfo: cpu MHz          : 1898.101
/proc/cpuinfo: cache size       : 6144 KB
/proc/cpuinfo: physical id      : 0
/proc/cpuinfo: siblings : 8
/proc/cpuinfo: core id          : 1
/proc/cpuinfo: cpu cores        : 4
/proc/cpuinfo: apicid           : 2
/proc/cpuinfo: initial apicid   : 2
/proc/cpuinfo: fpu              : yes
/proc/cpuinfo: fpu_exception    : yes
/proc/cpuinfo: cpuid level      : 13
/proc/cpuinfo: wp               : yes
/proc/cpuinfo: flags            : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts
/proc/cpuinfo: bugs             :
/proc/cpuinfo: bogomips : 4390.87
/proc/cpuinfo: clflush size     : 64
/proc/cpuinfo: cache_alignment  : 64
/proc/cpuinfo: address sizes    : 36 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo:
/proc/cpuinfo: processor        : 3
/proc/cpuinfo: vendor_id        : GenuineIntel
/proc/cpuinfo: cpu family       : 6
/proc/cpuinfo: model            : 42
/proc/cpuinfo: model name       : Intel(R) Core(TM) i7-2670QM CPU @ 2.20GHz
/proc/cpuinfo: stepping : 7
/proc/cpuinfo: microcode        : 0x25
/proc/cpuinfo: cpu MHz          : 1628.601
/proc/cpuinfo: cache size       : 6144 KB
/proc/cpuinfo: physical id      : 0
/proc/cpuinfo: siblings : 8
/proc/cpuinfo: core id          : 1
/proc/cpuinfo: cpu cores        : 4
/proc/cpuinfo: apicid           : 3
/proc/cpuinfo: initial apicid   : 3
/proc/cpuinfo: fpu              : yes
/proc/cpuinfo: fpu_exception    : yes
/proc/cpuinfo: cpuid level      : 13
/proc/cpuinfo: wp               : yes
/proc/cpuinfo: flags            : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts
/proc/cpuinfo: bugs             :
/proc/cpuinfo: bogomips : 4390.89
/proc/cpuinfo: clflush size     : 64
/proc/cpuinfo: cache_alignment  : 64
/proc/cpuinfo: address sizes    : 36 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo:
/proc/cpuinfo: processor        : 4
/proc/cpuinfo: vendor_id        : GenuineIntel
/proc/cpuinfo: cpu family       : 6
/proc/cpuinfo: model            : 42
/proc/cpuinfo: model name       : Intel(R) Core(TM) i7-2670QM CPU @ 2.20GHz
/proc/cpuinfo: stepping : 7
/proc/cpuinfo: microcode        : 0x25
/proc/cpuinfo: cpu MHz          : 1813.882
/proc/cpuinfo: cache size       : 6144 KB
/proc/cpuinfo: physical id      : 0
/proc/cpuinfo: siblings : 8
/proc/cpuinfo: core id          : 2
/proc/cpuinfo: cpu cores        : 4
/proc/cpuinfo: apicid           : 4
/proc/cpuinfo: initial apicid   : 4
/proc/cpuinfo: fpu              : yes
/proc/cpuinfo: fpu_exception    : yes
/proc/cpuinfo: cpuid level      : 13
/proc/cpuinfo: wp               : yes
/proc/cpuinfo: flags            : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts
/proc/cpuinfo: bugs             :
/proc/cpuinfo: bogomips : 4390.87
/proc/cpuinfo: clflush size     : 64
/proc/cpuinfo: cache_alignment  : 64
/proc/cpuinfo: address sizes    : 36 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo:
/proc/cpuinfo: processor        : 5
/proc/cpuinfo: vendor_id        : GenuineIntel
/proc/cpuinfo: cpu family       : 6
/proc/cpuinfo: model            : 42
/proc/cpuinfo: model name       : Intel(R) Core(TM) i7-2670QM CPU @ 2.20GHz
/proc/cpuinfo: stepping : 7
/proc/cpuinfo: microcode        : 0x25
/proc/cpuinfo: cpu MHz          : 1809.843
/proc/cpuinfo: cache size       : 6144 KB
/proc/cpuinfo: physical id      : 0
/proc/cpuinfo: siblings : 8
/proc/cpuinfo: core id          : 2
/proc/cpuinfo: cpu cores        : 4
/proc/cpuinfo: apicid           : 5
/proc/cpuinfo: initial apicid   : 5
/proc/cpuinfo: fpu              : yes
/proc/cpuinfo: fpu_exception    : yes
/proc/cpuinfo: cpuid level      : 13
/proc/cpuinfo: wp               : yes
/proc/cpuinfo: flags            : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts
/proc/cpuinfo: bugs             :
/proc/cpuinfo: bogomips : 4390.89
/proc/cpuinfo: clflush size     : 64
/proc/cpuinfo: cache_alignment  : 64
/proc/cpuinfo: address sizes    : 36 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo:
/proc/cpuinfo: processor        : 6
/proc/cpuinfo: vendor_id        : GenuineIntel
/proc/cpuinfo: cpu family       : 6
/proc/cpuinfo: model            : 42
/proc/cpuinfo: model name       : Intel(R) Core(TM) i7-2670QM CPU @ 2.20GHz
/proc/cpuinfo: stepping : 7
/proc/cpuinfo: microcode        : 0x25
/proc/cpuinfo: cpu MHz          : 1892.859
/proc/cpuinfo: cache size       : 6144 KB
/proc/cpuinfo: physical id      : 0
/proc/cpuinfo: siblings : 8
/proc/cpuinfo: core id          : 3
/proc/cpuinfo: cpu cores        : 4
/proc/cpuinfo: apicid           : 6
/proc/cpuinfo: initial apicid   : 6
/proc/cpuinfo: fpu              : yes
/proc/cpuinfo: fpu_exception    : yes
/proc/cpuinfo: cpuid level      : 13
/proc/cpuinfo: wp               : yes
/proc/cpuinfo: flags            : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts
/proc/cpuinfo: bugs             :
/proc/cpuinfo: bogomips : 4390.87
/proc/cpuinfo: clflush size     : 64
/proc/cpuinfo: cache_alignment  : 64
/proc/cpuinfo: address sizes    : 36 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo:
/proc/cpuinfo: processor        : 7
/proc/cpuinfo: vendor_id        : GenuineIntel
/proc/cpuinfo: cpu family       : 6
/proc/cpuinfo: model            : 42
/proc/cpuinfo: model name       : Intel(R) Core(TM) i7-2670QM CPU @ 2.20GHz
/proc/cpuinfo: stepping : 7
/proc/cpuinfo: microcode        : 0x25
/proc/cpuinfo: cpu MHz          : 1893.632
/proc/cpuinfo: cache size       : 6144 KB
/proc/cpuinfo: physical id      : 0
/proc/cpuinfo: siblings : 8
/proc/cpuinfo: core id          : 3
/proc/cpuinfo: cpu cores        : 4
/proc/cpuinfo: apicid           : 7
/proc/cpuinfo: initial apicid   : 7
/proc/cpuinfo: fpu              : yes
/proc/cpuinfo: fpu_exception    : yes
/proc/cpuinfo: cpuid level      : 13
/proc/cpuinfo: wp               : yes
/proc/cpuinfo: flags            : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts
/proc/cpuinfo: bugs             :
/proc/cpuinfo: bogomips : 4390.92
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
/proc/ioports:   0062-0062 : PNP0C09:00
/proc/ioports:     0062-0062 : EC data
/proc/ioports:   0064-0064 : keyboard
/proc/ioports:   0066-0066 : PNP0C09:00
/proc/ioports:     0066-0066 : EC cmd
/proc/ioports:   0070-0077 : rtc0
/proc/ioports:   0080-008f : dma page reg
/proc/ioports:   00a0-00a1 : pic2
/proc/ioports:   00c0-00df : dma2
/proc/ioports:   00f0-00ff : fpu
/proc/ioports:     00f0-00f0 : PNP0C04:00
/proc/ioports:   0400-0403 : ACPI PM1a_EVT_BLK
/proc/ioports:   0404-0405 : ACPI PM1a_CNT_BLK
/proc/ioports:   0408-040b : ACPI PM_TMR
/proc/ioports:   0410-0415 : ACPI CPU throttle
/proc/ioports:   0420-042f : ACPI GPE0_BLK
/proc/ioports:   0450-0450 : ACPI PM2_CNT_BLK
/proc/ioports:   0454-0457 : pnp 00:02
/proc/ioports:   0458-047f : pnp 00:00
/proc/ioports:   0500-057f : pnp 00:00
/proc/ioports:   0680-069f : pnp 00:00
/proc/ioports: 0cf8-0cff : PCI conf1
/proc/ioports: 0d00-ffff : PCI Bus 0000:00
/proc/ioports:   1000-100f : pnp 00:00
/proc/ioports:   1010-1013 : pnp 00:00
/proc/ioports:   164e-164f : pnp 00:00
/proc/ioports:   2000-2fff : PCI Bus 0000:0d
/proc/ioports:   3000-3fff : PCI Bus 0000:07
/proc/ioports:   4000-4fff : PCI Bus 0000:01
/proc/ioports:     4000-40ff : 0000:01:00.0
/proc/ioports:       4000-40ff : r8169
/proc/ioports:   5000-503f : 0000:00:02.0
/proc/ioports:   5040-505f : 0000:00:1f.3
/proc/ioports:   5060-507f : 0000:00:1f.2
/proc/ioports:     5060-507f : ahci
/proc/ioports:   5090-5097 : 0000:00:1f.2
/proc/ioports:     5090-5097 : ahci
/proc/ioports:   5098-509f : 0000:00:1f.2
/proc/ioports:     5098-509f : ahci
/proc/ioports:   50b8-50bb : 0000:00:1f.2
/proc/ioports:     50b8-50bb : ahci
/proc/ioports:   50bc-50bf : 0000:00:1f.2
/proc/ioports:     50bc-50bf : ahci
/proc/ioports:   ffff-ffff : pnp 00:00
/proc/iomem: 00000000-00000fff : reserved
/proc/iomem: 00001000-0009d7ff : System RAM
/proc/iomem: 0009d800-0009ffff : reserved
/proc/iomem: 000a0000-000bffff : PCI Bus 0000:00
/proc/iomem: 000c0000-000cf1ff : Video ROM
/proc/iomem: 000e0000-000fffff : reserved
/proc/iomem:   000f0000-000fffff : System ROM
/proc/iomem: 00100000-ace3efff : System RAM
/proc/iomem:   01000000-015cb794 : Kernel code
/proc/iomem:   015cb795-01b10aff : Kernel data
/proc/iomem:   01c67000-01d34fff : Kernel bss
/proc/iomem: ace3f000-acebefff : reserved
/proc/iomem: acebf000-acfbefff : ACPI Non-volatile Storage
/proc/iomem: acfbf000-acffefff : ACPI Tables
/proc/iomem: acfff000-acffffff : System RAM
/proc/iomem: ad000000-af9fffff : reserved
/proc/iomem: afa00000-feafffff : PCI Bus 0000:00
/proc/iomem:   afa00000-afa00fff : pnp 00:05
/proc/iomem:   b0000000-bfffffff : 0000:00:02.0
/proc/iomem:     b0000000-b00eafff : BOOTFB
/proc/iomem:   c0000000-c03fffff : 0000:00:02.0
/proc/iomem:   c0400000-c13fffff : PCI Bus 0000:01
/proc/iomem:     c0400000-c0403fff : 0000:01:00.0
/proc/iomem:       c0400000-c0403fff : r8169
/proc/iomem:     c0404000-c0404fff : 0000:01:00.0
/proc/iomem:       c0404000-c0404fff : r8169
/proc/iomem:   c1400000-c23fffff : PCI Bus 0000:07
/proc/iomem:   c2400000-c33fffff : PCI Bus 0000:0d
/proc/iomem:   c3400000-c34fffff : PCI Bus 0000:13
/proc/iomem:     c3400000-c3401fff : 0000:13:00.0
/proc/iomem:       c3400000-c3401fff : xhci-hcd
/proc/iomem:   c3500000-c44fffff : PCI Bus 0000:0d
/proc/iomem:     c3500000-c35000ff : 0000:0d:00.1
/proc/iomem:       c3500000-c35000ff : mmc0
/proc/iomem:     c3501000-c3501fff : 0000:0d:00.0
/proc/iomem:       c3501000-c3501fff : rtsx_pci
/proc/iomem:     c3510000-c351ffff : 0000:0d:00.0
/proc/iomem:   c4500000-c54fffff : PCI Bus 0000:07
/proc/iomem:     c4500000-c4501fff : 0000:07:00.0
/proc/iomem:   c5500000-c64fffff : PCI Bus 0000:01
/proc/iomem:   c6500000-c6503fff : 0000:00:1b.0
/proc/iomem:   c6504000-c650400f : 0000:00:16.0
/proc/iomem:   c6506000-c65060ff : 0000:00:1f.3
/proc/iomem:   c6508000-c65087ff : 0000:00:1f.2
/proc/iomem:     c6508000-c65087ff : ahci
/proc/iomem:   c6509000-c65093ff : 0000:00:1d.0
/proc/iomem:     c6509000-c65093ff : ehci_hcd
/proc/iomem:   c650a000-c650a3ff : 0000:00:1a.0
/proc/iomem:     c650a000-c650a3ff : ehci_hcd
/proc/iomem:   e0000000-efffffff : PCI MMCONFIG 0000 [bus 00-ff]
/proc/iomem:     e0000000-efffffff : reserved
/proc/iomem:       e0000000-efffffff : pnp 00:05
/proc/iomem: feb00000-feb03fff : reserved
/proc/iomem: fec00000-fec00fff : reserved
/proc/iomem:   fec00000-fec003ff : IOAPIC 0
/proc/iomem: fed00000-fed003ff : HPET 0
/proc/iomem:   fed00000-fed003ff : PNP0103:00
/proc/iomem: fed10000-fed19fff : reserved
/proc/iomem:   fed10000-fed17fff : pnp 00:05
/proc/iomem:   fed18000-fed18fff : pnp 00:05
/proc/iomem:   fed19000-fed19fff : pnp 00:05
/proc/iomem: fed1c000-fed1ffff : reserved
/proc/iomem:   fed1c000-fed1ffff : pnp 00:05
/proc/iomem: fed20000-fed3ffff : pnp 00:05
/proc/iomem: fed90000-fed93fff : pnp 00:05
/proc/iomem: fee00000-fee00fff : Local APIC
/proc/iomem:   fee00000-fee00fff : reserved
/proc/iomem: ff000000-ffffffff : INT0800:00
/proc/iomem:   ffd80000-ffffffff : reserved
/proc/iomem: 100000000-44fdfffff : System RAM
/proc/iomem: 44fe00000-44fffffff : RAM buffer
/proc/interrupts:            CPU0       CPU1       CPU2       CPU3       CPU4       CPU5       CPU6       CPU7
/proc/interrupts:   0:         20          0          0          0          0          0          0          0   IO-APIC   2-edge      timer
/proc/interrupts:   1:       6388          0          0          0          0          0          0          0   IO-APIC   1-edge      i8042
/proc/interrupts:   8:         35          0          0          0          0          0          0          0   IO-APIC   8-edge      rtc0
/proc/interrupts:   9:        114          0          0          0          0          0          0          0   IO-APIC   9-fasteoi   acpi
/proc/interrupts:  12:          2          0          0          0          0          0          0          0   IO-APIC  12-edge      i8042
/proc/interrupts:  16:         53          0          0          0          0          0          0          0   IO-APIC  16-fasteoi   ehci_hcd:usb1
/proc/interrupts:  19:          0          0          0          0          0          0          0          0   IO-APIC  19-fasteoi   mmc0
/proc/interrupts:  20:        106          0          0          0          0          0          0          0   IO-APIC  20-fasteoi   ehci_hcd:usb3
/proc/interrupts:  24:          8          0          0          0          0          0          0          0   PCI-MSI 6815744-edge      rtsx_pci
/proc/interrupts:  25:    1251557          0          0          0          0          0          0          0   PCI-MSI 524288-edge      eth0
/proc/interrupts:  26:      36316          0          0          0          0          0          0          0   PCI-MSI 9961472-edge      xhci_hcd
/proc/interrupts:  27:          0          0          0          0          0          0          0          0   PCI-MSI 9961473-edge      xhci_hcd
/proc/interrupts:  28:          0          0          0          0          0          0          0          0   PCI-MSI 9961474-edge      xhci_hcd
/proc/interrupts:  29:          0          0          0          0          0          0          0          0   PCI-MSI 9961475-edge      xhci_hcd
/proc/interrupts:  30:          0          0          0          0          0          0          0          0   PCI-MSI 9961476-edge      xhci_hcd
/proc/interrupts:  31:          0          0          0          0          0          0          0          0   PCI-MSI 9961477-edge      xhci_hcd
/proc/interrupts:  32:          0          0          0          0          0          0          0          0   PCI-MSI 9961478-edge      xhci_hcd
/proc/interrupts:  33:          0          0          0          0          0          0          0          0   PCI-MSI 9961479-edge      xhci_hcd
/proc/interrupts:  34:    1904381          0          0          0          0          0          0          0   PCI-MSI 512000-edge      ahci[0000:00:1f.2]
/proc/interrupts: NMI:         34          9         19          4         17          8         19          6   Non-maskable interrupts
/proc/interrupts: LOC:    1730617     193035    7887572     727150    8395146     780491    9158455     447720   Local timer interrupts
/proc/interrupts: SPU:          0          0          0          0          0          0          0          0   Spurious interrupts
/proc/interrupts: PMI:         34          9         19          4         17          8         19          6   Performance monitoring interrupts
/proc/interrupts: IWI:          0          0          0          0          0          0          0          0   IRQ work interrupts
/proc/interrupts: RTR:          0          0          0          0          0          0          0          0   APIC ICR read retries
/proc/interrupts: RES:      10697       5801      10974       1540       8532       2007       6907       1671   Rescheduling interrupts
/proc/interrupts: CAL:        716        840        770        737        671        796        767        826   Function call interrupts
/proc/interrupts: TLB:        965        396        804        371        837        373        754        344   TLB shootdowns
/proc/interrupts: TRM:          0          0          0          0          0          0          0          0   Thermal event interrupts
/proc/interrupts: THR:          0          0          0          0          0          0          0          0   Threshold APIC interrupts
/proc/interrupts: DFR:          0          0          0          0          0          0          0          0   Deferred Error APIC interrupts
/proc/interrupts: MCE:          0          0          0          0          0          0          0          0   Machine check exceptions
/proc/interrupts: MCP:        103        103        103        103        103        103        103        103   Machine check polls
/proc/interrupts: ERR:          0
/proc/interrupts: MIS:          0
/proc/interrupts: PIN:          0          0          0          0          0          0          0          0   Posted-interrupt notification event
/proc/interrupts: PIW:          0          0          0          0          0          0          0          0   Posted-interrupt wakeup event
/proc/meminfo: MemTotal:       16383024 kB
/proc/meminfo: MemFree:        11905932 kB
/proc/meminfo: MemAvailable:   15818332 kB
/proc/meminfo: Buffers:            4572 kB
/proc/meminfo: Cached:          3868784 kB
/proc/meminfo: SwapCached:            0 kB
/proc/meminfo: Active:          3784740 kB
/proc/meminfo: Inactive:         118444 kB
/proc/meminfo: Active(anon):     100640 kB
/proc/meminfo: Inactive(anon):    44112 kB
/proc/meminfo: Active(file):    3684100 kB
/proc/meminfo: Inactive(file):    74332 kB
/proc/meminfo: Unevictable:           0 kB
/proc/meminfo: Mlocked:               0 kB
/proc/meminfo: SwapTotal:       2931808 kB
/proc/meminfo: SwapFree:        2931808 kB
/proc/meminfo: Dirty:              1888 kB
/proc/meminfo: Writeback:             0 kB
/proc/meminfo: AnonPages:         29164 kB
/proc/meminfo: Mapped:             4984 kB
/proc/meminfo: Shmem:            114804 kB
/proc/meminfo: Slab:             515584 kB
/proc/meminfo: SReclaimable:     492756 kB
/proc/meminfo: SUnreclaim:        22828 kB
/proc/meminfo: KernelStack:        2560 kB
/proc/meminfo: PageTables:          188 kB
/proc/meminfo: NFS_Unstable:          0 kB
/proc/meminfo: Bounce:                0 kB
/proc/meminfo: WritebackTmp:          0 kB
/proc/meminfo: CommitLimit:    11123320 kB
/proc/meminfo: Committed_AS:     158272 kB
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
/proc/meminfo: DirectMap4k:      143616 kB
/proc/meminfo: DirectMap2M:    16580608 kB
/proc/bus/input/devices: I: Bus=0011 Vendor=0001 Product=0001 Version=ab83
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
/proc/bus/input/devices: I: Bus=0003 Vendor=062a Product=4101 Version=0110
/proc/bus/input/devices: N: Name="MOSART Semi. 2.4G Keyboard Mouse"
/proc/bus/input/devices: P: Phys=usb-0000:00:1d.0-1.1/input0
/proc/bus/input/devices: S: Sysfs=/devices/pci0000:00/0000:00:1d.0/usb3/3-1/3-1.1/3-1.1:1.0/0003:062A:4101.0001/input/input2
/proc/bus/input/devices: U: Uniq=
/proc/bus/input/devices: H: Handlers=sysrq kbd leds
/proc/bus/input/devices: B: PROP=0
/proc/bus/input/devices: B: EV=120013
/proc/bus/input/devices: B: KEY=1000000000007 ff9f207ac14057ff febeffdfffefffff fffffffffffffffe
/proc/bus/input/devices: B: MSC=10
/proc/bus/input/devices: B: LED=7
/proc/bus/input/devices:
/proc/bus/input/devices: I: Bus=0003 Vendor=062a Product=4101 Version=0110
/proc/bus/input/devices: N: Name="MOSART Semi. 2.4G Keyboard Mouse"
/proc/bus/input/devices: P: Phys=usb-0000:00:1d.0-1.1/input1
/proc/bus/input/devices: S: Sysfs=/devices/pci0000:00/0000:00:1d.0/usb3/3-1/3-1.1/3-1.1:1.1/0003:062A:4101.0002/input/input3
/proc/bus/input/devices: U: Uniq=
/proc/bus/input/devices: H: Handlers=kbd mouse0
/proc/bus/input/devices: B: PROP=0
/proc/bus/input/devices: B: EV=1f
/proc/bus/input/devices: B: KEY=3f0003007f 0 0 483ffff17aff32d bf54444600000000 1f0001 130f938b17c000 677bfad941dfed 9ed68000004400 10000002
/proc/bus/input/devices: B: REL=1c3
/proc/bus/input/devices: B: ABS=1f0100000000
/proc/bus/input/devices: B: MSC=10
/proc/bus/input/devices:

-- System Information:
Debian Release: 8.5
  APT prefers stable-updates
  APT policy: (500, 'stable-updates'), (500, 'stable')
Architecture: amd64 (x86_64)

Kernel: Linux 4.6.0-1+reiser4.0.1-amd64 (SMP w/8 CPU cores)
Locale: LANG=en_US.UTF-8, LC_CTYPE=en_US.UTF-8 (charmap=UTF-8)
Shell: /bin/sh linked to /bin/dash
Init: systemd (via /run/systemd/system)
