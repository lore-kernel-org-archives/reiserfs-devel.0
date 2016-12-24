From: Jose R Rodriguez <jose@metztli-it.com>
Subject: installation-reports: Jessie-backported Reiser4-patched Linux 4.8.15-1 on
 UpCloud 8-core/48Gig RAM KVM Cloud infrastructure successful installation
Date: Sat, 24 Dec 2016 05:22:37 -0800
Message-ID: <20161224132237.2467.40254.reportbug@cohuatlicue.metztli-it.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1482585758; h=Date: Message-ID: Cc: Subject: To: From:
 Content-Transfer-Encoding: MIME-Version: Content-Type: Sender;
 bh=/lYG3gAy57RoQDoh6C/j4LaFMLp5H6QtzJtQCQj1jpw=; b=deoLaBtqPILxjspCVTSz6vPBfy7AEf02CiBd8UVMMdcvw6N6e+Cpx6WODxst26/lDeuS/zZi
 c1lGAzEEHQGGTE2eUxZGSSjW3XCxln291OOb+QbY0N1DzAIkcwOxgjqBJQQ1Vds4bzx1dMR7
 afZMjkhdbTQ6C3gvSpCmFn233DM=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
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

Boot method: netboot ISO image 'dd' /dev/vdb
Image version: https://sourceforge.net/projects/debian-reiser4/ built on 12-23-2016
Date: 12-24-2016 01:56 AM PST

Machine: https://www.upcloud.com KVM Cloud infrastructure
Partitions:
udev           devtmpfs     10240       0     10240   0% /dev
tmpfs          tmpfs      9893140    8976   9884164   1% /run
/dev/vda6      reiser4   20423272 4523220  15900052  23% /
tmpfs          tmpfs     24732840     144  24732696   1% /dev/shm
tmpfs          tmpfs         5120       0      5120   0% /run/lock
tmpfs          tmpfs     24732840       0  24732840   0% /sys/fs/cgroup
/dev/vda5      jfs        9725448   10252   9715196   1% /home
/dev/vda1      ext2        188403   22408    156267  13% /boot
tmpfs          tmpfs      4946572      20   4946552   1% /run/user/1000


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
Analyzing the 'various bugfixes and fixed vulnerabilities' in Sid kernel 4.8.15-1
I realized I had to do a Jessie-backports for Reiser4 (SFRN) 4.0.1 AND test neboot
installation in massive KVM Cloud instance of 12-cores / 48 Gig RAM.

"We also encourage installation reports to be sent even if the installation is successful,
so that we can get as much information as possible on the largest number of hardware configurations"
< https://www.debian.org/releases/stable/amd64/ch05s04.html.en#submit-bug >

Smooth installation of Reiser4-enabled kernel 4.8.15-1 & reiser4progs built/fetched for Jessie
netboot installer.

Only conflict is with nfs-commmon -- which hangs the newly installed Reiser4 Linux OS upon boot.
Accordingly this particular Debian netboot installer will purge nfs-common at end of installation
so that GNU/Linux Debian Jessie OS boots without issues from its initial ext2 boot ~150MB partition
into Reiser4 root file system.

https://metztli.it/readOnlyEphemeral/Cohuatlicue_UpCloud.png

Notice below - netboot installer UDEB kernel only differs in name 'Cohuatlicue' from kernel 4.8.15-1
downloaded via SSL from meztli.it

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
DISTRIB_RELEASE="8 (jessie) - installer build 20161224-05:26"
X_INSTALLATION_MEDIUM=netboot

==============================================
Installer hardware-summary:
==============================================
uname -a: Linux cohuatlicue 4.8.0-2+cohuatlicue-amd64 #1 SMP Debian 4.8.15-1+cohuatlicue (2016-12-22) x86_64 Xonecuiltzin
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
usb-list:    Manufacturer: Linux 4.8.0-2+cohuatlicue-amd64 uhci_hcd
usb-list:    Interface 00: Class 09(hub  ) Subclass 00 Protocol 00 Driver hub
usb-list: 
usb-list: Bus 01 Device 02: QEMU USB Tablet [0627:0001]
usb-list:    Level 01 Parent 01 Port 00  Class 00(>ifc ) Subclass 00 Protocol 00
usb-list:    Manufacturer: QEMU
usb-list:    Interface 00: Class 03(HID  ) Subclass 00 Protocol 02 Driver usbhid
lsmod: Module                  Size  Used by
lsmod: nls_utf8               16384  1 
lsmod: dm_mod                114688  0 
lsmod: md_mod                131072  0 
lsmod: xfs                  1052672  0 
lsmod: libcrc32c              16384  1 xfs
lsmod: reiser4               446464  1 
lsmod: jfs                   176128  1 
lsmod: btrfs                1048576  0 
lsmod: xor                    24576  1 btrfs
lsmod: raid6_pq              102400  1 btrfs
lsmod: ntfs                  106496  0 
lsmod: vfat                   20480  0 
lsmod: fat                    69632  1 vfat
lsmod: ext4                  593920  1 
lsmod: crc16                  16384  1 ext4
lsmod: jbd2                  110592  1 ext4
lsmod: crc32c_generic         16384  4 
lsmod: fscrypto               28672  1 ext4
lsmod: ecb                    16384  0 
lsmod: mbcache                16384  2 ext4
lsmod: usb_storage            73728  0 
lsmod: hid_generic            16384  0 
lsmod: usbhid                 53248  0 
lsmod: hid                   118784  2 hid_generic,usbhid
lsmod: sg                     32768  0 
lsmod: sr_mod                 24576  0 
lsmod: cdrom                  61440  1 sr_mod
lsmod: ata_generic            16384  0 
lsmod: virtio_net             28672  0 
lsmod: virtio_blk             20480  4 
lsmod: ata_piix               36864  0 
lsmod: uhci_hcd               45056  0 
lsmod: libata                249856  2 ata_piix,ata_generic
lsmod: ehci_hcd               81920  0 
lsmod: virtio_pci             24576  0 
lsmod: virtio_ring            24576  3 virtio_blk,virtio_net,virtio_pci
lsmod: usbcore               249856  4 usbhid,usb_storage,ehci_hcd,uhci_hcd
lsmod: scsi_mod              225280  4 usb_storage,libata,sr_mod,sg
lsmod: virtio                 16384  3 virtio_blk,virtio_net,virtio_pci
lsmod: usb_common             16384  1 usbcore
df: Filesystem           1K-blocks      Used Available Use% Mounted on
df: none                   4946572        72   4946500   0% /run
df: devtmpfs              24718608         0  24718608   0% /dev
df: /dev/vda6             20423272    910520  19512752   4% /target
df: /dev/vda1               188403     22050    156625  12% /target/boot
df: /dev/vda5              9725448      1348   9724100   0% /target/home
df: /dev/vda6             20423272    910520  19512752   4% /dev/.static/dev
df: devtmpfs              24718608         0  24718608   0% /target/dev
free:              total       used       free     shared    buffers     cached
free: Mem:      49465696    1420892   48044804     115044       3496    1100584
free: -/+ buffers/cache:     316812   49148884
free: Swap:            0          0          0
/proc/cmdline: BOOT_IMAGE=linux priority=low vga=788 initrd=initrd.gz --- 
/proc/cpuinfo: processor	: 0
/proc/cpuinfo: vendor_id	: GenuineIntel
/proc/cpuinfo: cpu family	: 6
/proc/cpuinfo: model		: 63
/proc/cpuinfo: model name	: Intel(R) Xeon(R) CPU E5-2687W v3 @ 3.10GHz
/proc/cpuinfo: stepping	: 2
/proc/cpuinfo: microcode	: 0x1
/proc/cpuinfo: cpu MHz		: 3099.996
/proc/cpuinfo: cache size	: 25600 KB
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
/proc/cpuinfo: flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt arat
/proc/cpuinfo: bugs		:
/proc/cpuinfo: bogomips	: 6199.99
/proc/cpuinfo: clflush size	: 64
/proc/cpuinfo: cache_alignment	: 64
/proc/cpuinfo: address sizes	: 40 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo: 
/proc/cpuinfo: processor	: 1
/proc/cpuinfo: vendor_id	: GenuineIntel
/proc/cpuinfo: cpu family	: 6
/proc/cpuinfo: model		: 63
/proc/cpuinfo: model name	: Intel(R) Xeon(R) CPU E5-2687W v3 @ 3.10GHz
/proc/cpuinfo: stepping	: 2
/proc/cpuinfo: microcode	: 0x1
/proc/cpuinfo: cpu MHz		: 3099.996
/proc/cpuinfo: cache size	: 25600 KB
/proc/cpuinfo: physical id	: 1
/proc/cpuinfo: siblings	: 1
/proc/cpuinfo: core id		: 0
/proc/cpuinfo: cpu cores	: 1
/proc/cpuinfo: apicid		: 1
/proc/cpuinfo: initial apicid	: 1
/proc/cpuinfo: fpu		: yes
/proc/cpuinfo: fpu_exception	: yes
/proc/cpuinfo: cpuid level	: 13
/proc/cpuinfo: wp		: yes
/proc/cpuinfo: flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt arat
/proc/cpuinfo: bugs		:
/proc/cpuinfo: bogomips	: 6199.99
/proc/cpuinfo: clflush size	: 64
/proc/cpuinfo: cache_alignment	: 64
/proc/cpuinfo: address sizes	: 40 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo: 
/proc/cpuinfo: processor	: 2
/proc/cpuinfo: vendor_id	: GenuineIntel
/proc/cpuinfo: cpu family	: 6
/proc/cpuinfo: model		: 63
/proc/cpuinfo: model name	: Intel(R) Xeon(R) CPU E5-2687W v3 @ 3.10GHz
/proc/cpuinfo: stepping	: 2
/proc/cpuinfo: microcode	: 0x1
/proc/cpuinfo: cpu MHz		: 3099.996
/proc/cpuinfo: cache size	: 25600 KB
/proc/cpuinfo: physical id	: 2
/proc/cpuinfo: siblings	: 1
/proc/cpuinfo: core id		: 0
/proc/cpuinfo: cpu cores	: 1
/proc/cpuinfo: apicid		: 2
/proc/cpuinfo: initial apicid	: 2
/proc/cpuinfo: fpu		: yes
/proc/cpuinfo: fpu_exception	: yes
/proc/cpuinfo: cpuid level	: 13
/proc/cpuinfo: wp		: yes
/proc/cpuinfo: flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt arat
/proc/cpuinfo: bugs		:
/proc/cpuinfo: bogomips	: 6199.99
/proc/cpuinfo: clflush size	: 64
/proc/cpuinfo: cache_alignment	: 64
/proc/cpuinfo: address sizes	: 40 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo: 
/proc/cpuinfo: processor	: 3
/proc/cpuinfo: vendor_id	: GenuineIntel
/proc/cpuinfo: cpu family	: 6
/proc/cpuinfo: model		: 63
/proc/cpuinfo: model name	: Intel(R) Xeon(R) CPU E5-2687W v3 @ 3.10GHz
/proc/cpuinfo: stepping	: 2
/proc/cpuinfo: microcode	: 0x1
/proc/cpuinfo: cpu MHz		: 3099.996
/proc/cpuinfo: cache size	: 25600 KB
/proc/cpuinfo: physical id	: 3
/proc/cpuinfo: siblings	: 1
/proc/cpuinfo: core id		: 0
/proc/cpuinfo: cpu cores	: 1
/proc/cpuinfo: apicid		: 3
/proc/cpuinfo: initial apicid	: 3
/proc/cpuinfo: fpu		: yes
/proc/cpuinfo: fpu_exception	: yes
/proc/cpuinfo: cpuid level	: 13
/proc/cpuinfo: wp		: yes
/proc/cpuinfo: flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt arat
/proc/cpuinfo: bugs		:
/proc/cpuinfo: bogomips	: 6199.99
/proc/cpuinfo: clflush size	: 64
/proc/cpuinfo: cache_alignment	: 64
/proc/cpuinfo: address sizes	: 40 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo: 
/proc/cpuinfo: processor	: 4
/proc/cpuinfo: vendor_id	: GenuineIntel
/proc/cpuinfo: cpu family	: 6
/proc/cpuinfo: model		: 63
/proc/cpuinfo: model name	: Intel(R) Xeon(R) CPU E5-2687W v3 @ 3.10GHz
/proc/cpuinfo: stepping	: 2
/proc/cpuinfo: microcode	: 0x1
/proc/cpuinfo: cpu MHz		: 3099.996
/proc/cpuinfo: cache size	: 25600 KB
/proc/cpuinfo: physical id	: 4
/proc/cpuinfo: siblings	: 1
/proc/cpuinfo: core id		: 0
/proc/cpuinfo: cpu cores	: 1
/proc/cpuinfo: apicid		: 4
/proc/cpuinfo: initial apicid	: 4
/proc/cpuinfo: fpu		: yes
/proc/cpuinfo: fpu_exception	: yes
/proc/cpuinfo: cpuid level	: 13
/proc/cpuinfo: wp		: yes
/proc/cpuinfo: flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt arat
/proc/cpuinfo: bugs		:
/proc/cpuinfo: bogomips	: 6199.99
/proc/cpuinfo: clflush size	: 64
/proc/cpuinfo: cache_alignment	: 64
/proc/cpuinfo: address sizes	: 40 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo: 
/proc/cpuinfo: processor	: 5
/proc/cpuinfo: vendor_id	: GenuineIntel
/proc/cpuinfo: cpu family	: 6
/proc/cpuinfo: model		: 63
/proc/cpuinfo: model name	: Intel(R) Xeon(R) CPU E5-2687W v3 @ 3.10GHz
/proc/cpuinfo: stepping	: 2
/proc/cpuinfo: microcode	: 0x1
/proc/cpuinfo: cpu MHz		: 3099.996
/proc/cpuinfo: cache size	: 25600 KB
/proc/cpuinfo: physical id	: 5
/proc/cpuinfo: siblings	: 1
/proc/cpuinfo: core id		: 0
/proc/cpuinfo: cpu cores	: 1
/proc/cpuinfo: apicid		: 5
/proc/cpuinfo: initial apicid	: 5
/proc/cpuinfo: fpu		: yes
/proc/cpuinfo: fpu_exception	: yes
/proc/cpuinfo: cpuid level	: 13
/proc/cpuinfo: wp		: yes
/proc/cpuinfo: flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt arat
/proc/cpuinfo: bugs		:
/proc/cpuinfo: bogomips	: 6199.99
/proc/cpuinfo: clflush size	: 64
/proc/cpuinfo: cache_alignment	: 64
/proc/cpuinfo: address sizes	: 40 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo: 
/proc/cpuinfo: processor	: 6
/proc/cpuinfo: vendor_id	: GenuineIntel
/proc/cpuinfo: cpu family	: 6
/proc/cpuinfo: model		: 63
/proc/cpuinfo: model name	: Intel(R) Xeon(R) CPU E5-2687W v3 @ 3.10GHz
/proc/cpuinfo: stepping	: 2
/proc/cpuinfo: microcode	: 0x1
/proc/cpuinfo: cpu MHz		: 3099.996
/proc/cpuinfo: cache size	: 25600 KB
/proc/cpuinfo: physical id	: 6
/proc/cpuinfo: siblings	: 1
/proc/cpuinfo: core id		: 0
/proc/cpuinfo: cpu cores	: 1
/proc/cpuinfo: apicid		: 6
/proc/cpuinfo: initial apicid	: 6
/proc/cpuinfo: fpu		: yes
/proc/cpuinfo: fpu_exception	: yes
/proc/cpuinfo: cpuid level	: 13
/proc/cpuinfo: wp		: yes
/proc/cpuinfo: flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt arat
/proc/cpuinfo: bugs		:
/proc/cpuinfo: bogomips	: 6199.99
/proc/cpuinfo: clflush size	: 64
/proc/cpuinfo: cache_alignment	: 64
/proc/cpuinfo: address sizes	: 40 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo: 
/proc/cpuinfo: processor	: 7
/proc/cpuinfo: vendor_id	: GenuineIntel
/proc/cpuinfo: cpu family	: 6
/proc/cpuinfo: model		: 63
/proc/cpuinfo: model name	: Intel(R) Xeon(R) CPU E5-2687W v3 @ 3.10GHz
/proc/cpuinfo: stepping	: 2
/proc/cpuinfo: microcode	: 0x1
/proc/cpuinfo: cpu MHz		: 3099.996
/proc/cpuinfo: cache size	: 25600 KB
/proc/cpuinfo: physical id	: 7
/proc/cpuinfo: siblings	: 1
/proc/cpuinfo: core id		: 0
/proc/cpuinfo: cpu cores	: 1
/proc/cpuinfo: apicid		: 7
/proc/cpuinfo: initial apicid	: 7
/proc/cpuinfo: fpu		: yes
/proc/cpuinfo: fpu_exception	: yes
/proc/cpuinfo: cpuid level	: 13
/proc/cpuinfo: wp		: yes
/proc/cpuinfo: flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt arat
/proc/cpuinfo: bugs		:
/proc/cpuinfo: bogomips	: 6199.99
/proc/cpuinfo: clflush size	: 64
/proc/cpuinfo: cache_alignment	: 64
/proc/cpuinfo: address sizes	: 40 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo: 
/proc/cpuinfo: processor	: 8
/proc/cpuinfo: vendor_id	: GenuineIntel
/proc/cpuinfo: cpu family	: 6
/proc/cpuinfo: model		: 63
/proc/cpuinfo: model name	: Intel(R) Xeon(R) CPU E5-2687W v3 @ 3.10GHz
/proc/cpuinfo: stepping	: 2
/proc/cpuinfo: microcode	: 0x1
/proc/cpuinfo: cpu MHz		: 3099.996
/proc/cpuinfo: cache size	: 25600 KB
/proc/cpuinfo: physical id	: 8
/proc/cpuinfo: siblings	: 1
/proc/cpuinfo: core id		: 0
/proc/cpuinfo: cpu cores	: 1
/proc/cpuinfo: apicid		: 8
/proc/cpuinfo: initial apicid	: 8
/proc/cpuinfo: fpu		: yes
/proc/cpuinfo: fpu_exception	: yes
/proc/cpuinfo: cpuid level	: 13
/proc/cpuinfo: wp		: yes
/proc/cpuinfo: flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt arat
/proc/cpuinfo: bugs		:
/proc/cpuinfo: bogomips	: 6199.99
/proc/cpuinfo: clflush size	: 64
/proc/cpuinfo: cache_alignment	: 64
/proc/cpuinfo: address sizes	: 40 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo: 
/proc/cpuinfo: processor	: 9
/proc/cpuinfo: vendor_id	: GenuineIntel
/proc/cpuinfo: cpu family	: 6
/proc/cpuinfo: model		: 63
/proc/cpuinfo: model name	: Intel(R) Xeon(R) CPU E5-2687W v3 @ 3.10GHz
/proc/cpuinfo: stepping	: 2
/proc/cpuinfo: microcode	: 0x1
/proc/cpuinfo: cpu MHz		: 3099.996
/proc/cpuinfo: cache size	: 25600 KB
/proc/cpuinfo: physical id	: 9
/proc/cpuinfo: siblings	: 1
/proc/cpuinfo: core id		: 0
/proc/cpuinfo: cpu cores	: 1
/proc/cpuinfo: apicid		: 9
/proc/cpuinfo: initial apicid	: 9
/proc/cpuinfo: fpu		: yes
/proc/cpuinfo: fpu_exception	: yes
/proc/cpuinfo: cpuid level	: 13
/proc/cpuinfo: wp		: yes
/proc/cpuinfo: flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt arat
/proc/cpuinfo: bugs		:
/proc/cpuinfo: bogomips	: 6199.99
/proc/cpuinfo: clflush size	: 64
/proc/cpuinfo: cache_alignment	: 64
/proc/cpuinfo: address sizes	: 40 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo: 
/proc/cpuinfo: processor	: 10
/proc/cpuinfo: vendor_id	: GenuineIntel
/proc/cpuinfo: cpu family	: 6
/proc/cpuinfo: model		: 63
/proc/cpuinfo: model name	: Intel(R) Xeon(R) CPU E5-2687W v3 @ 3.10GHz
/proc/cpuinfo: stepping	: 2
/proc/cpuinfo: microcode	: 0x1
/proc/cpuinfo: cpu MHz		: 3099.996
/proc/cpuinfo: cache size	: 25600 KB
/proc/cpuinfo: physical id	: 10
/proc/cpuinfo: siblings	: 1
/proc/cpuinfo: core id		: 0
/proc/cpuinfo: cpu cores	: 1
/proc/cpuinfo: apicid		: 10
/proc/cpuinfo: initial apicid	: 10
/proc/cpuinfo: fpu		: yes
/proc/cpuinfo: fpu_exception	: yes
/proc/cpuinfo: cpuid level	: 13
/proc/cpuinfo: wp		: yes
/proc/cpuinfo: flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt arat
/proc/cpuinfo: bugs		:
/proc/cpuinfo: bogomips	: 6199.99
/proc/cpuinfo: clflush size	: 64
/proc/cpuinfo: cache_alignment	: 64
/proc/cpuinfo: address sizes	: 40 bits physical, 48 bits virtual
/proc/cpuinfo: power management:
/proc/cpuinfo: 
/proc/cpuinfo: processor	: 11
/proc/cpuinfo: vendor_id	: GenuineIntel
/proc/cpuinfo: cpu family	: 6
/proc/cpuinfo: model		: 63
/proc/cpuinfo: model name	: Intel(R) Xeon(R) CPU E5-2687W v3 @ 3.10GHz
/proc/cpuinfo: stepping	: 2
/proc/cpuinfo: microcode	: 0x1
/proc/cpuinfo: cpu MHz		: 3099.996
/proc/cpuinfo: cache size	: 25600 KB
/proc/cpuinfo: physical id	: 11
/proc/cpuinfo: siblings	: 1
/proc/cpuinfo: core id		: 0
/proc/cpuinfo: cpu cores	: 1
/proc/cpuinfo: apicid		: 11
/proc/cpuinfo: initial apicid	: 11
/proc/cpuinfo: fpu		: yes
/proc/cpuinfo: fpu_exception	: yes
/proc/cpuinfo: cpuid level	: 13
/proc/cpuinfo: wp		: yes
/proc/cpuinfo: flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt arat
/proc/cpuinfo: bugs		:
/proc/cpuinfo: bogomips	: 6199.99
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
/proc/ioports:   03c0-03df : vesafb
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
/proc/iomem: 00100000-dfff9fff : System RAM
/proc/iomem: dfffa000-dfffffff : reserved
/proc/iomem: e0000000-febfffff : PCI Bus 0000:00
/proc/iomem:   fc000000-fdffffff : 0000:00:02.0
/proc/iomem:     fc000000-fc3fffff : vesafb
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
/proc/iomem: 100000000-c1fffffff : System RAM
/proc/iomem:   680a00000-680fe9d3e : Kernel code
/proc/iomem:   680fe9d3f-6815326bf : Kernel data
/proc/iomem:   681693000-68175cfff : Kernel bss
/proc/interrupts:            CPU0       CPU1       CPU2       CPU3       CPU4       CPU5       CPU6       CPU7       CPU8       CPU9       CPU10      CPU11      
/proc/interrupts:   0:         12          0          0          0          0          0          0          0          0          0          0          0   IO-APIC   2-edge      timer
/proc/interrupts:   1:       2299          0          0          0          0          0          0          0          0          0          0          0   IO-APIC   1-edge      i8042
/proc/interrupts:   8:          7          0          0          0          0          0          0          0          0          0          0          0   IO-APIC   8-edge      rtc0
/proc/interrupts:   9:          0          0          0          0          0          0          0          0          0          0          0          0   IO-APIC   9-fasteoi   acpi
/proc/interrupts:  11:         32          0          0          0          0          0          0          0          0          0          0          0   IO-APIC  11-fasteoi   uhci_hcd:usb1
/proc/interrupts:  12:          3          0          0          0          0          0          0          0          0          0          0          0   IO-APIC  12-edge      i8042
/proc/interrupts:  14:       1582          0          0          0          0          0          0          0          0          0          0          0   IO-APIC  14-edge      ata_piix
/proc/interrupts:  15:          0          0          0          0          0          0          0          0          0          0          0          0   IO-APIC  15-edge      ata_piix
/proc/interrupts:  24:          0          0          0          0          0          0          0          0          0          0          0          0   PCI-MSI 49152-edge      virtio0-config
/proc/interrupts:  25:     370521          0          0          0          0          0          0          0          0          0          0          0   PCI-MSI 49153-edge      virtio0-req.0
/proc/interrupts:  26:          0          0          0          0          0          0          0          0          0          0          0          0   PCI-MSI 262144-edge      virtio1-config
/proc/interrupts:  27:      20709          0          0          0          0          0          0          0          0          0          0          0   PCI-MSI 262145-edge      virtio1-input.0
/proc/interrupts:  28:          1          0          0          0          0          0          0          0          0          0          0          0   PCI-MSI 262146-edge      virtio1-output.0
/proc/interrupts:  29:          0          0          0          0          0          0          0          0          0          0          0          0   PCI-MSI 278528-edge      virtio2-config
/proc/interrupts:  30:          1          0          0          0          0          0          0          0          0          0          0          0   PCI-MSI 278529-edge      virtio2-input.0
/proc/interrupts:  31:          0          0          0          0          0          0          0          0          0          0          0          0   PCI-MSI 278530-edge      virtio2-output.0
/proc/interrupts:  32:          0          0          0          0          0          0          0          0          0          0          0          0   PCI-MSI 294912-edge      virtio3-config
/proc/interrupts:  33:          2          0          0          0          0          0          0          0          0          0          0          0   PCI-MSI 294913-edge      virtio3-input.0
/proc/interrupts:  34:          0          0          0          0          0          0          0          0          0          0          0          0   PCI-MSI 294914-edge      virtio3-output.0
/proc/interrupts: NMI:          0          0          0          0          0          0          0          0          0          0          0          0   Non-maskable interrupts
/proc/interrupts: LOC:      32834      21056      19331      16498      22746      24922      29302      23075      48760      23901      23419      62564   Local timer interrupts
/proc/interrupts: SPU:          0          0          0          0          0          0          0          0          0          0          0          0   Spurious interrupts
/proc/interrupts: PMI:          0          0          0          0          0          0          0          0          0          0          0          0   Performance monitoring interrupts
/proc/interrupts: IWI:          5          0          0          0          0          0          0          0          0          0          0          0   IRQ work interrupts
/proc/interrupts: RTR:          0          0          0          0          0          0          0          0          0          0          0          0   APIC ICR read retries
/proc/interrupts: RES:      29327      27168      25523      21173      29072      88296      23869      37114      38197      38354      27607      45361   Rescheduling interrupts
/proc/interrupts: CAL:       3041      11142      10596       5671      10113     130857       7304      29910      89802      56610      29432      14093   Function call interrupts
/proc/interrupts: TLB:       2585       2574       2233       1988       2115       2047       2657       2486       2123       2324       3033       2751   TLB shootdowns
/proc/interrupts: TRM:          0          0          0          0          0          0          0          0          0          0          0          0   Thermal event interrupts
/proc/interrupts: THR:          0          0          0          0          0          0          0          0          0          0          0          0   Threshold APIC interrupts
/proc/interrupts: DFR:          0          0          0          0          0          0          0          0          0          0          0          0   Deferred Error APIC interrupts
/proc/interrupts: MCE:          0          0          0          0          0          0          0          0          0          0          0          0   Machine check exceptions
/proc/interrupts: MCP:          4          4          4          4          4          4          4          4          4          4          4          4   Machine check polls
/proc/interrupts: ERR:          0
/proc/interrupts: MIS:          0
/proc/interrupts: PIN:          0          0          0          0          0          0          0          0          0          0          0          0   Posted-interrupt notification event
/proc/interrupts: PIW:          0          0          0          0          0          0          0          0          0          0          0          0   Posted-interrupt wakeup event
/proc/meminfo: MemTotal:       49465696 kB
/proc/meminfo: MemFree:        48044532 kB
/proc/meminfo: MemAvailable:   48625312 kB
/proc/meminfo: Buffers:            3496 kB
/proc/meminfo: Cached:          1100584 kB
/proc/meminfo: SwapCached:            0 kB
/proc/meminfo: Active:          1042072 kB
/proc/meminfo: Inactive:          83972 kB
/proc/meminfo: Active(anon):      91412 kB
/proc/meminfo: Inactive(anon):    45432 kB
/proc/meminfo: Active(file):     950660 kB
/proc/meminfo: Inactive(file):    38540 kB
/proc/meminfo: Unevictable:           0 kB
/proc/meminfo: Mlocked:               0 kB
/proc/meminfo: SwapTotal:             0 kB
/proc/meminfo: SwapFree:              0 kB
/proc/meminfo: Dirty:               552 kB
/proc/meminfo: Writeback:             0 kB
/proc/meminfo: AnonPages:         22236 kB
/proc/meminfo: Mapped:             5504 kB
/proc/meminfo: Shmem:            115044 kB
/proc/meminfo: Slab:             157124 kB
/proc/meminfo: SReclaimable:     140044 kB
/proc/meminfo: SUnreclaim:        17080 kB
/proc/meminfo: KernelStack:        4000 kB
/proc/meminfo: PageTables:          948 kB
/proc/meminfo: NFS_Unstable:          0 kB
/proc/meminfo: Bounce:                0 kB
/proc/meminfo: WritebackTmp:          0 kB
/proc/meminfo: CommitLimit:    24732848 kB
/proc/meminfo: Committed_AS:     148104 kB
/proc/meminfo: VmallocTotal:   34359738367 kB
/proc/meminfo: VmallocUsed:           0 kB
/proc/meminfo: VmallocChunk:          0 kB
/proc/meminfo: HardwareCorrupted:     0 kB
/proc/meminfo: AnonHugePages:         0 kB
/proc/meminfo: ShmemHugePages:        0 kB
/proc/meminfo: ShmemPmdMapped:        0 kB
/proc/meminfo: HugePages_Total:       0
/proc/meminfo: HugePages_Free:        0
/proc/meminfo: HugePages_Rsvd:        0
/proc/meminfo: HugePages_Surp:        0
/proc/meminfo: Hugepagesize:       2048 kB
/proc/meminfo: DirectMap4k:       55272 kB
/proc/meminfo: DirectMap2M:     5187584 kB
/proc/meminfo: DirectMap1G:    45088768 kB
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

Kernel: Linux 4.8.0-2+reiser4.0.1-amd64 (SMP w/12 CPU cores)
Locale: LANG=en_US.UTF-8, LC_CTYPE=en_US.UTF-8 (charmap=UTF-8)
Shell: /bin/sh linked to /bin/dash
Init: systemd (via /run/systemd/system)
