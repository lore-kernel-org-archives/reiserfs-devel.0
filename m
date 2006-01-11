From: Diego Pinheiro <diego.pinheiro@safe-mail.net>
Subject: Forced sync bug
Date: Wed, 11 Jan 2006 17:41:55 -0200
Message-ID: <1137008516.3338.3.camel@asgard.underworld.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-LHLHuAsIuA2wpwiYcbG/"
Return-path: <reiserfs-list-return-27668-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs-List@namesys.com

--=-LHLHuAsIuA2wpwiYcbG/
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi guys,
        
        I'm not quite sure of what's happening, but I'll try to be as
simple and clear as possible.
        My system has a reiser4 root filesystem that was working fine
until a decided to do a complete update (with yum). I started to get
oops related to the filesystem (a /var/log/messages is attached) for
operations that were previously working fine.
        I guess that is something related with the forced (synchronous)
sync operations, because (i) I get the oops in the following conditions:

        1. Boot the system in any runlevel, mount a filesystem (cd, usb
pendrive, vfat partition, even a reiser4 fs on a loopback device) and
immediately umount it;
        2. Boot in single user mode, and immediately shutdown the system
(will get the oops for the swap unmount operation);

(ii) If I wait enough for the low-overhead asynchronous sync, that
system appears to work fine:

        1. Boot the system in any runlevel and do (at the same time) -
it should be more than enough to stress the filesystem
                a. recompile the whole kernel directory;
                b. do a rpm -V at every single package of the system
(with a bash for loop)
                c. prelink every library and binary of the system
        2. After everything is finished, wait a little bit (about a
minute) close every xterm, shutdown X, logout, wait a little bit (about
a minute) and shutdown the system - it works fine (no oops at all)!

Note: At first I didn't update the kernel. They started to happen with
the same  2.6.14 kernel. Just did the packages update.
        Then I tried to update the kernel (2.6.15-rc5-mm3) but the
problems remain the same.

Note 2: From my point of view, the only significant thing it was updated
was the glibc. Previously it was version 2.3.5-10 and now: 2.3.5-10.3
        
        Specifications
        Distribution: Fedora Core 4 (Stentz)
        Kernel version: 2.6.15-rc5-mm3
        glibc version: 2.3.5-10.3
        liball version: 1.0.5
        reiser4progs version: 1.0.5


--=-LHLHuAsIuA2wpwiYcbG/
Content-Disposition: attachment; filename=reiser4_kernel_panic.txt
Content-Type: text/plain; name=reiser4_kernel_panic.txt; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dec 21 14:15:25 asgard syslogd 1.4.1: restart.
Dec 21 14:15:26 asgard kernel: klogd 1.4.1, log source = /proc/kmsg started.
Dec 21 14:15:26 asgard kernel: Linux version 2.6.15-rc5-mm3 (root@asgard.underworld.org) (gcc version 4.0.2 20051125 (Red Hat 4.0.2-8)) #1 Wed Dec 21 12:13:26 BRST 2005
Dec 21 14:15:26 asgard kernel: BIOS-provided physical RAM map:
Dec 21 14:15:26 asgard kernel:  BIOS-e820: 0000000000000000 - 000000000009f800 (usable)
Dec 21 14:15:26 asgard kernel:  BIOS-e820: 000000000009f800 - 00000000000a0000 (reserved)
Dec 21 14:15:26 asgard kernel:  BIOS-e820: 00000000000ec000 - 0000000000100000 (reserved)
Dec 21 14:15:26 asgard kernel:  BIOS-e820: 0000000000100000 - 000000000bbf0000 (usable)
Dec 21 14:15:26 asgard kernel:  BIOS-e820: 000000000bbf0000 - 000000000bbffc00 (ACPI data)
Dec 21 14:15:26 asgard kernel:  BIOS-e820: 000000000bbffc00 - 000000000bc00000 (ACPI NVS)
Dec 21 14:15:26 asgard kernel:  BIOS-e820: 00000000fffe0000 - 0000000100000000 (reserved)
Dec 21 14:15:26 asgard kernel: 187MB LOWMEM available.
Dec 21 14:15:27 asgard kernel: DMI 2.2 present.
Dec 21 14:15:27 asgard kernel: Allocating PCI resources starting at 10000000 (gap: 0bc00000:f43e0000)
Dec 21 14:15:27 asgard kernel: Built 1 zonelists
Dec 21 14:15:27 asgard kernel: Initializing CPU#0
Dec 21 14:15:28 asgard kernel: Kernel command line: 3 ro root=/dev/hda2 ide0=ata66 ide1=ata66 pci=usepirqmask quiet
Dec 21 14:15:28 asgard kernel: ide_setup: ide0=ata66 -- OBSOLETE OPTION, WILL BE REMOVED SOON!
Dec 21 14:15:28 asgard kernel: ide_setup: ide1=ata66 -- OBSOLETE OPTION, WILL BE REMOVED SOON!
Dec 21 14:15:28 asgard kernel: PID hash table entries: 1024 (order: 10, 16384 bytes)
Dec 21 14:15:28 asgard kernel: Detected 448.430 MHz processor.
Dec 21 14:15:28 asgard kernel: Using tsc for high-res timesource
Dec 21 14:15:28 asgard kernel: Console: colour VGA+ 80x25
Dec 21 14:15:28 asgard kernel: Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Dec 21 14:15:28 asgard kernel: Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Dec 21 14:15:28 asgard kernel: Memory: 186180k/192448k available (2104k kernel code, 5740k reserved, 614k data, 136k init, 0k highmem)
Dec 21 14:15:28 asgard kernel: Checking if this processor honours the WP bit even in supervisor mode... Ok.
Dec 21 14:15:29 asgard kernel: Calibrating delay using timer specific routine.. 901.32 BogoMIPS (lpj=1802655)
Dec 21 14:15:29 asgard kernel: Security Framework v1.0.0 initialized
Dec 21 14:15:29 asgard kernel: SELinux:  Disabled at boot.
Dec 21 14:15:29 asgard kernel: Capability LSM initialized
Dec 21 14:15:29 asgard kernel: Mount-cache hash table entries: 512
Dec 21 14:15:30 asgard kernel: CPU: L1 I Cache: 32K (32 bytes/line), D cache 32K (32 bytes/line)
Dec 21 14:15:30 asgard kernel: mtrr: v2.0 (20020519)
Dec 21 14:15:31 asgard kernel: CPU: AMD-K6(tm) 3D processor stepping 0c
Dec 21 14:15:31 asgard kernel: Checking 'hlt' instruction... OK.
Dec 21 14:15:31 asgard kernel: checking if image is initramfs... it is
Dec 21 14:15:31 asgard kernel: Freeing initrd memory: 985k freed
Dec 21 14:15:32 asgard kernel: NET: Registered protocol family 16
Dec 21 14:15:32 asgard kernel: PCI: PCI BIOS revision 2.10 entry at 0xfd83e, last bus=1
Dec 21 14:15:32 asgard kernel: PCI: Using configuration type 1
Dec 21 14:15:32 asgard kernel: usbcore: registered new driver usbfs
Dec 21 14:15:32 asgard kernel: usbcore: registered new driver hub
Dec 21 14:15:33 asgard kernel: PCI: Probing PCI hardware
Dec 21 14:15:33 asgard kernel: PCI quirk: region 8080-808f claimed by vt82c686 SMB
Dec 21 14:15:33 asgard kernel: PCI: Using IRQ router VIA [1106/0686] at 0000:00:07.0
Dec 21 14:15:33 asgard kernel: PCI: Bridge: 0000:00:01.0
Dec 21 14:15:34 asgard kernel:   IO window: disabled.
Dec 21 14:15:34 asgard kernel:   MEM window: f4100000-f57fffff
Dec 21 14:15:34 asgard kernel:   PREFETCH window: 14000000-140fffff
Dec 21 14:15:34 asgard kernel: PCI: Bus 2, cardbus bridge: 0000:00:0a.0
Dec 21 14:15:34 asgard kernel:   IO window: 00001c00-00001cff
Dec 21 14:15:35 asgard kernel:   IO window: 00002000-000020ff
Dec 21 14:15:35 asgard kernel:   PREFETCH window: 10000000-11ffffff
Dec 21 14:15:35 asgard kernel:   MEM window: 12000000-13ffffff
Dec 21 14:15:35 asgard kernel: PCI: Assigned IRQ 9 for device 0000:00:0a.0
Dec 21 14:15:35 asgard kernel: audit: initializing netlink socket (disabled)
Dec 21 14:15:35 asgard kernel: audit(1135174495.368:1): initialized
Dec 21 14:15:36 asgard kernel: Loading Reiser4. See www.namesys.com for a description of Reiser4.
Dec 21 14:15:36 asgard kernel: Initializing Cryptographic API
Dec 21 14:15:36 asgard kernel: io scheduler noop registered
Dec 21 14:15:37 asgard kernel: io scheduler anticipatory registered
Dec 21 14:15:37 asgard gpm[760]: *** info [startup.c(95)]: 
Dec 21 14:15:37 asgard kernel: io scheduler cfq registered
Dec 21 14:15:37 asgard gpm[760]: Started gpm successfully. Entered daemon mode.
Dec 21 14:15:37 asgard kernel: pci_hotplug: PCI Hot Plug PCI Core version: 0.5
Dec 21 14:15:38 asgard gpm[760]: *** info [mice.c(1766)]: 
Dec 21 14:15:38 asgard kernel: cpqphp: Compaq Hot Plug PCI Controller Driver version: 0.9.8
Dec 21 14:15:38 asgard gpm[760]: imps2: Auto-detected intellimouse PS/2
Dec 21 14:15:38 asgard kernel: Linux agpgart interface v0.101 (c) Dave Jones
Dec 21 14:15:39 asgard kernel: agpgart: Detected VIA Apollo MVP4 chipset
Dec 21 14:15:39 asgard kernel: agpgart: AGP aperture is 64M @ 0xf8000000
Dec 21 14:15:40 asgard kernel: serio: i8042 AUX port at 0x60,0x64 irq 12
Dec 21 14:15:41 asgard kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
Dec 21 14:15:41 asgard kernel: Serial: 8250/16550 driver $Revision: 1.90 $ 16 ports, IRQ sharing disabled
Dec 21 14:15:41 asgard kernel: serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
Dec 21 14:15:41 asgard kernel: mice: PS/2 mouse device common for all mice
Dec 21 14:15:42 asgard kernel: RAMDISK driver initialized: 1 RAM disks of 3072K size 1024 blocksize
Dec 21 14:15:42 asgard kernel: Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
Dec 21 14:15:43 asgard kernel: ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
Dec 21 14:15:43 asgard kernel: VP_IDE: IDE controller at PCI slot 0000:00:07.1
Dec 21 14:15:43 asgard kernel: VP_IDE: chipset revision 6
Dec 21 14:15:43 asgard kernel: VP_IDE: not 100% native mode: will probe irqs later
Dec 21 14:15:44 asgard kernel: VP_IDE: VIA vt82c686a (rev 19) IDE UDMA66 controller on pci0000:00:07.1
Dec 21 14:15:44 asgard kernel:     ide0: BM-DMA at 0x1820-0x1827, BIOS settings: hda:DMA, hdb:pio
Dec 21 14:15:44 asgard kernel:     ide1: BM-DMA at 0x1828-0x182f, BIOS settings: hdc:DMA, hdd:pio
Dec 21 14:15:44 asgard kernel: input: AT Translated Set 2 keyboard as /class/input/input0
Dec 21 14:15:44 asgard kernel: hda: SAMSUNG MP0402H, ATA DISK drive
Dec 21 14:15:44 asgard kernel: Synaptics Touchpad, model: 1, fw: 4.6, id: 0xf42a1, caps: 0x80471b/0x0
Dec 21 14:15:44 asgard kernel: input: SynPS/2 Synaptics TouchPad as /class/input/input1
Dec 21 14:15:45 asgard kernel: ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
Dec 21 14:15:45 asgard kernel: hdc: TOSHIBA DVD-ROM SD-C2302, ATAPI CD/DVD-ROM drive
Dec 21 14:15:45 asgard kernel: ide1 at 0x170-0x177,0x376 on irq 15
Dec 21 14:15:45 asgard xinetd[752]: xinetd Version 2.3.13 started with libwrap loadavg options compiled in.
Dec 21 14:15:45 asgard xinetd[752]: Started working: 0 available services
Dec 21 14:15:45 asgard kernel: hda: max request size: 1024KiB
Dec 21 14:15:45 asgard kernel: hda: 78242976 sectors (40060 MB) w/8192KiB Cache, CHS=16383/255/63, UDMA(66)
Dec 21 14:15:46 asgard kernel: hda: cache flushes supported
Dec 21 14:15:46 asgard kernel:  hda: hda1 hda2 hda3 hda4
Dec 21 14:15:46 asgard kernel: PCI: Found IRQ 9 for device 0000:00:0a.0
Dec 21 14:15:46 asgard kernel: Yenta: CardBus bridge found at 0000:00:0a.0 [0e11:b103]
Dec 21 14:15:46 asgard kernel: Yenta: Using CSCINT to route CSC interrupts to PCI
Dec 21 14:15:46 asgard kernel: Yenta: Routing CardBus interrupts to PCI
Dec 21 14:15:46 asgard kernel: Yenta TI: socket 0000:00:0a.0, mfunc 0x01001002, devctl 0x64
Dec 21 14:15:46 asgard kernel: Yenta: ISA IRQ mask 0x0008, PCI irq 9
Dec 21 14:15:46 asgard kernel: Socket status: 30000020
Dec 21 14:15:46 asgard kernel: USB Universal Host Controller Interface driver v2.3
Dec 21 14:15:46 asgard kernel: PCI: Found IRQ 11 for device 0000:00:07.2
Dec 21 14:15:46 asgard kernel: uhci_hcd 0000:00:07.2: UHCI Host Controller
Dec 21 14:15:47 asgard kernel: uhci_hcd 0000:00:07.2: new USB bus registered, assigned bus number 1
Dec 21 14:15:47 asgard kernel: uhci_hcd 0000:00:07.2: irq 11, io base 0x00001800
Dec 21 14:15:47 asgard kernel: usb usb1: configuration #1 chosen from 1 choice
Dec 21 14:15:47 asgard kernel: hub 1-0:1.0: USB hub found
Dec 21 14:15:48 asgard kernel: hub 1-0:1.0: 2 ports detected
Dec 21 14:15:48 asgard kernel: Advanced Linux Sound Architecture Driver Version 1.0.10rc3 (Mon Nov 07 13:30:21 2005 UTC).
Dec 21 14:15:48 asgard kernel: specify port
Dec 21 14:15:48 asgard kernel: snd_mpu401: probe of snd_mpu401.0 failed with error -22
Dec 21 14:15:48 asgard kernel: PCI: Found IRQ 11 for device 0000:00:07.5
Dec 21 14:15:48 asgard kernel: pccard: CardBus card inserted into slot 0
Dec 21 14:15:49 asgard kernel: ALSA device list:
Dec 21 14:15:49 asgard kernel:   #0: VIA 82C686A/B rev21 with AD1881 at 0x1000, irq 11
Dec 21 14:15:49 asgard kernel: NET: Registered protocol family 2
Dec 21 14:15:49 asgard kernel: IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
Dec 21 14:15:49 asgard kernel: TCP established hash table entries: 8192 (order: 3, 32768 bytes)
Dec 21 14:15:49 asgard kernel: TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
Dec 21 14:15:49 asgard kernel: TCP: Hash tables configured (established 8192 bind 8192)
Dec 21 14:15:50 asgard kernel: TCP reno registered
Dec 21 14:15:50 asgard kernel: TCP bic registered
Dec 21 14:15:50 asgard kernel: Initializing IPsec netlink socket
Dec 21 14:15:50 asgard kernel: NET: Registered protocol family 1
Dec 21 14:15:50 asgard kernel: NET: Registered protocol family 15
Dec 21 14:15:50 asgard kernel: Using IPI Shortcut mode
Dec 21 14:15:50 asgard kernel: Freeing unused kernel memory: 136k freed
Dec 21 14:15:51 asgard kernel: hdc: ATAPI 24X DVD-ROM drive, 128kB Cache, UDMA(33)
Dec 21 14:15:51 asgard kernel: Uniform CD-ROM driver Revision: 3.20
Dec 21 14:15:51 asgard kernel: 8139too Fast Ethernet driver 0.9.27
Dec 21 14:15:51 asgard kernel: PCI: Enabling device 0000:02:00.0 (0000 -> 0003)
Dec 21 14:15:51 asgard kernel: eth0: RealTek RTL8139 at 0xcc878000, 00:02:44:96:c1:e2, IRQ 9
Dec 21 14:15:52 asgard login(pam_unix)[789]: session opened for user root by (uid=0)
Dec 21 14:15:52 asgard kernel: parport0: PC-style at 0x378 (0x778), irq 7 [PCSPP(,...)]
Dec 21 14:15:53 asgard  -- root[789]: ROOT LOGIN ON tty1
Dec 21 14:15:53 asgard kernel: parport_pc: VIA parallel port: io=0x378, irq=7
Dec 21 14:15:53 asgard kernel: Adding 400640k swap on /dev/hda1.  Priority:-1 extents:1 across:400640k
Dec 21 14:15:53 asgard kernel: NET: Registered protocol family 10
Dec 21 14:15:53 asgard kernel: lo: Disabled Privacy Extensions
Dec 21 14:15:53 asgard kernel: IPv6 over IPv4 tunneling driver
Dec 21 14:16:29 asgard kernel: ------------[ cut here ]------------
Dec 21 14:16:29 asgard kernel: kernel BUG at fs/inode.c:253!
Dec 21 14:16:29 asgard kernel: invalid operand: 0000 [#1]
Dec 21 14:16:29 asgard kernel: last sysfs file: /class/vc/vcs2/dev
Dec 21 14:16:29 asgard kernel: Modules linked in: nls_ascii nls_cp437 vfat fat nls_base md5 ipv6 binfmt_misc parport_pc parport 8139too crc32 ide_cd cdrom
Dec 21 14:16:29 asgard kernel: CPU:    0
Dec 21 14:16:29 asgard kernel: EIP:    0060:[<c0165f1a>]    Not tainted VLI
Dec 21 14:16:29 asgard kernel: EFLAGS: 00010202   (2.6.15-rc5-mm3) 
Dec 21 14:16:29 asgard kernel: EIP is at clear_inode+0x1a/0xc0
Dec 21 14:16:29 asgard kernel: eax: 00000001   ebx: cb11a38c   ecx: 00000001   edx: cb11a468
Dec 21 14:16:29 asgard kernel: esi: cb135200   edi: cb11a38c   ebp: 00000000   esp: c4f05ec4
Dec 21 14:16:29 asgard kernel: ds: 007b   es: 007b   ss: 0068
Dec 21 14:16:29 asgard kernel: Process umount (pid: 886, threadinfo=c4f04000 task=c126ea70)
Dec 21 14:16:29 asgard kernel: Stack: <0>cb11a38c cb135200 c019a947 cb11a38c c019a8e0 c0166bcb cb11a38c cb70da94 
Dec 21 14:16:29 asgard kernel:        <0>c0166dfc ca92a2b4 c0164347 cb6f7294 cb6f7294 cb70da94 00000000 cb3c9000 
Dec 21 14:16:29 asgard kernel:        <0>cb3a2000 c4f05f64 c015ebcc cb70da94 cb70da94 c71f2834 ca92a2b4 cb70da94 
Dec 21 14:16:30 asgard kernel: Call Trace:
Dec 21 14:16:30 asgard kernel:  [<c019a947>] reiser4_delete_inode+0x67/0xc0
Dec 21 14:16:30 asgard kernel:  [<c019a8e0>] reiser4_delete_inode+0x0/0xc0
Dec 21 14:16:30 asgard kernel:  [<c0166bcb>] generic_delete_inode+0x6b/0xe0
Dec 21 14:16:30 asgard kernel:  [<c0166dfc>] iput+0x5c/0x80
Dec 21 14:16:30 asgard kernel:  [<c0164347>] dput_recursive+0x167/0x240
Dec 21 14:16:30 asgard kernel:  [<c015ebcc>] sys_rename+0x16c/0x1c0
Dec 21 14:16:30 asgard kernel:  [<c0164213>] dput_recursive+0x33/0x240
Dec 21 14:16:31 asgard kernel:  [<c0168853>] mntput_no_expire+0x13/0x60
Dec 21 14:16:31 asgard kernel:  [<c0102a39>] syscall_call+0x7/0xb
Dec 21 14:16:31 asgard kernel: Code: eb d0 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90 90 56 53 89 c3 e8 57 6e 1a 00 89 d8 e8 50 b1 fe ff 8b 83 c8 00 00 00 85 c0 74 08 <0f> 0b fd 00 e2 20 32 c0 8b 83 24 01 00 00 a8 10 75 08 0f 0b ff 
Dec 21 14:16:31 asgard kernel:  <4><4>reiser4[umount(886)]: release_unix_file (fs/reiser4/plugin/file/file.c:2804)[vs-44]:
Dec 21 14:16:31 asgard kernel: WARNING: out of memory?
Dec 21 14:16:31 asgard kernel: <4>reiser4[umount(886)]: release_unix_file (fs/reiser4/plugin/file/file.c:2804)[vs-44]:
Dec 21 14:16:31 asgard kernel: WARNING: out of memory?
Dec 21 14:16:31 asgard kernel: <4>reiser4[umount(886)]: release_unix_file (fs/reiser4/plugin/file/file.c:2804)[vs-44]:
Dec 21 14:16:32 asgard kernel: WARNING: out of memory?
Dec 21 14:16:32 asgard kernel: <4>reiser4[umount(886)]: release_unix_file (fs/reiser4/plugin/file/file.c:2804)[vs-44]:
Dec 21 14:16:32 asgard kernel: WARNING: out of memory?
Dec 21 14:16:32 asgard kernel: <4>reiser4[umount(886)]: release_unix_file (fs/reiser4/plugin/file/file.c:2804)[vs-44]:
Dec 21 14:16:32 asgard kernel: WARNING: out of memory?
Dec 21 14:16:32 asgard kernel: <4>reiser4[umount(886)]: release_unix_file (fs/reiser4/plugin/file/file.c:2804)[vs-44]:
Dec 21 14:16:32 asgard kernel: WARNING: out of memory?
Dec 21 14:16:32 asgard kernel: <4>reiser4[umount(886)]: release_unix_file (fs/reiser4/plugin/file/file.c:2804)[vs-44]:
Dec 21 14:16:33 asgard kernel: WARNING: out of memory?

--=-LHLHuAsIuA2wpwiYcbG/--

