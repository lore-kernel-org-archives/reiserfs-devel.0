From: "Abhijeet Anant Sane" <abhijeet_sane@persistent.co.in>
Subject: kernel dumps error messages  after heavy use and repeated mount unmount sequences
Date: Tue, 25 Oct 2005 15:48:33 +0530
Message-ID: <000e01c5d94d$75752d90$7ac44d0a@persistent.co.in>
Reply-To: "Abhijeet Anant Sane" <abhijeet_sane@persistent.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26626-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

ReiserFS 4.0 dumping a error message.


    ------------[ cut here ]------------
kernel BUG at fs/reiser4/debug.c:141!
invalid operand: 0000 [#5]
Modules linked in: reiser4
CPU:    0
EIP:    0060:[<f8b972f7>]    Not tainted VLI
EFLAGS: 00010202   (2.6.12)
EIP is at reiser4_do_panic+0x2f7/0x320 [reiser4]
eax: 00000000   ebx: 00000001   ecx: 0000000e   edx: f49efe70
esi: d830dea8   edi: f49eff94   ebp: f49efeec   esp: f49efe08
ds: 007b   es: 007b   ss: 0068
Process ktxnmgrd:cciss/ (pid: 2477, threadinfo=f49ee000 task=c23ca520)
Stack: f8d3a86f f8b98068 f8d3a89a 00000001 f49efe70 d830dea8 f49efe70
d830dea8
       f8bc8b01 f8d3a884 f8d1e3c0 f8d3a89a f8cd4f5d f8d3a86f 000000a1
f223b8e8
       f49efe70 e4671f80 f55a0140 f8c1a587 f49efe70 f55a0000 c21e2fe0
c21e2140
Call Trace:
 [<f8b98068>] report_err+0x8/0xc0 [reiser4]
 [<f8bc8b01>] init_context+0x241/0x440 [reiser4]
 [<f8c1a587>] scan_mgr+0x47/0x160 [reiser4]
 [<c023a27c>] __freed_request+0x8c/0xa0
 [<c01fa2f7>] snprintf+0x27/0x30
 [<f8c1a33c>] ktxnmgrd+0x16c/0x1d0 [reiser4]
 [<f8c1a1d0>] ktxnmgrd+0x0/0x1d0 [reiser4]
 [<c0100de5>] kernel_thread_helper+0x5/0x10
Code: d3 f8 c7 44 24 14 61 01 00 00 e8 45 00 00 00 c7 04 24 3b 64 d3 f8 c7
44 24
 04 8c 64 d3 f8 e9 71 ff ff ff 90 31 c0 e9 db fd ff ff <0f> 0b 8d 00 9a 64
d3 f8
 c7 04 24 ad 64 d3 f8 c7 44 24 04 40 0d
 <6>kjournald starting.  Commit interval 5 seconds




------------[ cut here ]------------
kernel BUG at fs/reiser4/debug.c:141!
invalid operand: 0000 [#6]
Modules linked in: reiser4
CPU:    0
EIP:    0060:[<f8b972f7>]    Not tainted VLI
EFLAGS: 00010202   (2.6.12)
EIP is at reiser4_do_panic+0x2f7/0x320 [reiser4]
eax: 00000000   ebx: 00000001   ecx: c00ba800   edx: c8301d78
esi: d830dea8   edi: c8301e9c   ebp: c8301df4   esp: c8301d10
ds: 007b   es: 007b   ss: 0068
Process df (pid: 4088, threadinfo=c8300000 task=c8246a20)
Stack: f8d3a86f f8b98068 f8d3a89a 00000001 c8301d78 d830dea8 c8301d78
d830dea8
       f8bc8b01 f8d3a884 f8d1e3c0 f8d3a89a f8cd4f5d f8d3a86f 000000a1
00000000
       c8301ed4 c8301f14 f55a0000 f8c28888 c8301d78 f55a0000 d1aa293c
c8301d90
Call Trace:
 [<f8b98068>] report_err+0x8/0xc0 [reiser4]
 [<f8bc8b01>] init_context+0x241/0x440 [reiser4]
 [<f8c28888>] reiser4_statfs+0x38/0x1f0 [reiser4]
 [<c0111b61>] __wake_up_common+0x41/0x60
 [<c014e2fe>] vfs_statfs+0x4e/0x70
 [<c014e343>] vfs_statfs_native+0x23/0x60
 [<c014e4b3>] sys_statfs+0x73/0xb0
 [<c0220b80>] write_chan+0x0/0x240
 [<c0110fd8>] recalc_task_prio+0x78/0x120
 [<c01046d4>] math_state_restore+0x24/0x40
 [<c0102ac9>] syscall_call+0x7/0xb
Code: d3 f8 c7 44 24 14 61 01 00 00 e8 45 00 00 00 c7 04 24 3b 64 d3 f8 c7
44 24 04 8c 64 d3 f8 e9 71 ff ff ff 90 31 c0 e9 db fd ff ff <0f> 0b 8d 00 9a
64 d3 f8 c7 04 24 ad 64 d3 f8 c7 44 24 04 40 0d
 reiser4[df(4094)]: context_list_link_ok
(fs/reiser4/context.h:161)[nikita-1054]:
------------[ cut here ]------------
kernel BUG at fs/reiser4/debug.c:141!
invalid operand: 0000 [#7]
Modules linked in: reiser4
CPU:    0
EIP:    0060:[<f8b972f7>]    Not tainted VLI
EFLAGS: 00010202   (2.6.12)
EIP is at reiser4_do_panic+0x2f7/0x320 [reiser4]
eax: 00000000   ebx: 00000001   ecx: 0000000e   edx: d94d9d78
esi: d830dea8   edi: d94d9e9c   ebp: d94d9df4   esp: d94d9d10
ds: 007b   es: 007b   ss: 0068
Process df (pid: 4094, threadinfo=d94d8000 task=d9828a20)
Stack: f8d3a86f f8b98068 f8d3a89a 00000001 d94d9d78 d830dea8 d94d9d78
d830dea8
       f8bc8b01 f8d3a884 f8d1e3c0 f8d3a89a f8cd4f5d f8d3a86f 000000a1
00000000
       d94d9ed4 d94d9f14 f55a0000 f8c28888 d94d9d78 f55a0000 d1aa293c
d94d9d90
Call Trace:
 [<f8b98068>] report_err+0x8/0xc0 [reiser4]
 [<f8bc8b01>] init_context+0x241/0x440 [reiser4]
 [<f8c28888>] reiser4_statfs+0x38/0x1f0 [reiser4]
 [<c0111b61>] __wake_up_common+0x41/0x60
 [<c014e2fe>] vfs_statfs+0x4e/0x70
 [<c014e343>] vfs_statfs_native+0x23/0x60
 [<c014e4b3>] sys_statfs+0x73/0xb0
 [<c0220b80>] write_chan+0x0/0x240
 [<c01508b1>] sys_write+0x51/0x80
 [<c0102ac9>] syscall_call+0x7/0xb
Code: d3 f8 c7 44 24 14 61 01 00 00 e8 45 00 00 00 c7 04 24 3b 64 d3 f8 c7
44 24 04 8c 64 d3 f8 e9 71 ff ff ff 90 31 c0 e9 db fd ff ff <0f> 0b 8d 00 9a
64 d3 f8 c7 04 24 ad 64 d3 f8 c7 44 24 04 40 0d
 reiser4[bash(3975)]: context_list_link_ok
(fs/reiser4/context.h:161)[nikita-1054]:
------------[ cut here ]------------
kernel BUG at fs/reiser4/debug.c:141!
invalid operand: 0000 [#8]
Modules linked in: reiser4
CPU:    0
EIP:    0060:[<f8b972f7>]    Not tainted VLI
EFLAGS: 00010202   (2.6.12)
EIP is at reiser4_do_panic+0x2f7/0x320 [reiser4]
eax: 00000000   ebx: 00000001   ecx: 0000000e   edx: d1ae5da4
esi: d830dea8   edi: d1ae5ec8   ebp: d1ae5e20   esp: d1ae5d3c
ds: 007b   es: 007b   ss: 0068
Process bash (pid: 3975, threadinfo=d1ae4000 task=eeb38520)
Stack: f8d3a86f f8b98068 f8d3a89a 00000001 d1ae5da4 d830dea8 d1ae5da4
d830dea8
       f8bc8b01 f8d3a884 f8d1e3c0 f8d3a89a f8cd4f5d f8d3a86f 000000a1
e5b0ee20
       e5b0ee20 f15e4b7c d1ae5da4 f8c2d1b2 d1ae5da4 f55a0000 00000000
00000296
Call Trace:
 [<f8b98068>] report_err+0x8/0xc0 [reiser4]
 [<f8bc8b01>] init_context+0x241/0x440 [reiser4]
 [<f8c2d1b2>] reiser4_getattr+0x42/0x190 [reiser4]
 [<f8c2d170>] reiser4_getattr+0x0/0x190 [reiser4]
 [<c0159959>] vfs_getattr+0x39/0xb0
 [<c0159a1f>] vfs_stat+0x4f/0x60
 [<c016a514>] update_atime+0x74/0x110
 [<c015a12b>] sys_stat64+0x1b/0x40
 [<c0151575>] __fput+0xa5/0x110
 [<c014fcf9>] filp_close+0x59/0x90
 [<c014fd80>] sys_close+0x50/0x60
 [<c0102ac9>] syscall_call+0x7/0xb
Code: d3 f8 c7 44 24 14 61 01 00 00 e8 45 00 00 00 c7 04 24 3b 64 d3 f8 c7
44 24 04 8c 64 d3 f8 e9 71 ff ff ff 90 31 c0 e9 db fd ff ff <0f> 0b 8d 00 9a
64 d3 f8 c7 04 24 ad 64 d3 f8 c7 44 24 04 40 0d





Dmesg output showing machine details is as follows
--------------------------------------------------------------

linux kernel = 2.6.12

inux version 2.6.12 (root@chandra) (gcc version 3.2 20020903 (Red Hat Linux
8.0 3.2-7)) #6 Mon Oct 17 15:39:08 EDT 2005
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009f400 (usable)
 BIOS-e820: 000000000009f400 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000007fffa000 (usable)
 BIOS-e820: 000000007fffa000 - 0000000080000000 (ACPI data)
 BIOS-e820: 00000000fec00000 - 00000000fec10000 (reserved)
 BIOS-e820: 00000000fee00000 - 00000000fee10000 (reserved)
 BIOS-e820: 00000000ffc00000 - 0000000100000000 (reserved)
1151MB HIGHMEM available.
896MB LOWMEM available.
On node 0 totalpages: 524282
  DMA zone: 4096 pages, LIFO batch:1
  Normal zone: 225280 pages, LIFO batch:31
  HighMem zone: 294906 pages, LIFO batch:31
DMI 2.3 present.
Allocating PCI resources starting at 80000000 (gap: 80000000:7ec00000)
Built 1 zonelists
Kernel command line: ro root=LABEL=/
Initializing CPU#0
PID hash table entries: 4096 (order: 12, 65536 bytes)
Detected 3199.242 MHz processor.
Using tsc for high-res timesource
Console: colour VGA+ 80x25
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 2074736k/2097128k available (2260k kernel code, 21160k reserved,
986k data, 252k init, 1179624k highmem)
Checking if this processor honours the WP bit even in supervisor mode... Ok.
Calibrating delay loop... 6324.22 BogoMIPS (lpj=3162112)
Mount-cache hash table entries: 512
CPU: After generic identify, caps: bfebf9ff 00000000 00000000 00000000
00004400 00000000 00000000
CPU: After vendor identify, caps: bfebf9ff 00000000 00000000 00000000
00004400 00000000 00000000
CPU: Trace cache: 12K uops, L1 D cache: 8K
CPU: L2 cache: 512K
CPU: L3 cache: 2048K
CPU: After all inits, caps: bfebf9ff 00000000 00000000 00000080 00004400
00000000 00000000
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
CPU0: Intel P4/Xeon Extended MCE MSRs (12) available
CPU: Intel(R) Xeon(TM) CPU 3.20GHz stepping 05
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Checking 'hlt' instruction... OK.
checking if image is initramfs...it isn't (no cpio magic); looks like an
initrd
Freeing initrd memory: 220k freed
NET: Registered protocol family 16
EISA bus registered
PCI: PCI BIOS revision 2.10 entry at 0xf0094, last bus=6
PCI: Using configuration type 1
mtrr: v2.0 (20020519)
Linux Plug and Play Support v0.97 (c) Adam Belay
SCSI subsystem initialized
PCI: Probing PCI hardware
PCI: Probing PCI hardware (bus 00)
Boot video device is 0000:00:03.0
PCI: Ignoring BAR0-3 of IDE controller 0000:00:0f.1
PCI: Discovered peer bus 01
PCI: Discovered peer bus 04
PCI: Device 0000:00:00.0 not found by BIOS
PCI: Device 0000:00:00.1 not found by BIOS
PCI: Device 0000:00:00.2 not found by BIOS
PCI: Device 0000:00:0f.0 not found by BIOS
PCI: Device 0000:00:0f.3 not found by BIOS
PCI: Device 0000:00:11.0 not found by BIOS
PCI: Device 0000:00:11.2 not found by BIOS
apm: BIOS not found.
highmem bounce pool size: 64 pages
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
Initializing Cryptographic API
isapnp: Scanning for PnP cards...
isapnp: No Plug & Play device found
Real Time Clock Driver v1.12
PNP: No PS/2 controller found. Probing ports directly.
serio: i8042 AUX port at 0x60,0x64 irq 12
serio: i8042 KBD port at 0x60,0x64 irq 1
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
Floppy drive(s): fd0 is 1.44M
FDC 0 is a National Semiconductor PC87306
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
HP CISS Driver (v 2.6.6)
cciss: Device 0xb178 has been found at bus 0 dev 4 func 0
cciss: using DAC cycles
      blocks= 71119755 block_size= 512
      heads= 255, sectors= 63, cylinders= 4427

      blocks= 71119755 block_size= 512
      heads= 255, sectors= 63, cylinders= 4427

 cciss/c0d0: p1 p2 p3 p4 < p5 p6 p7 p8 p9 p10 >
tg3.c:v3.31 (June 8, 2005)
eth0: Tigon3 [partno(N/A) rev 1002 PHY(5703)] (PCIX:100MHz:64-bit)
10/100/1000BaseT Ethernet 00:0f:20:d0:8d:b9
eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] Split[0] WireSpeed[1]
TSOcap[1]
eth0: dma_rwctrl[769f4000]
eth1: Tigon3 [partno(N/A) rev 1002 PHY(5703)] (PCIX:100MHz:64-bit)
10/100/1000BaseT Ethernet 00:0f:20:d0:8d:aa
eth1: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] Split[0] WireSpeed[1]
TSOcap[1]
eth1: dma_rwctrl[769f4000]
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
SvrWks CSB5: IDE controller at PCI slot 0000:00:0f.1
SvrWks CSB5: chipset revision 147
SvrWks CSB5: not 100% native mode: will probe irqs later
SvrWks CSB5: simplex device: DMA forced
    ide0: BM-DMA at 0x2000-0x2007, BIOS settings: hda:pio, hdb:pio
SvrWks CSB5: simplex device: DMA forced
    ide1: BM-DMA at 0x2008-0x200f, BIOS settings: hdc:pio, hdd:pio
Probing IDE interface ide0...
hda: CRN-8245B, ATAPI CD/DVD-ROM drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
Probing IDE interface ide1...
Probing IDE interface ide1...
Probing IDE interface ide2...
Probing IDE interface ide3...
Probing IDE interface ide4...
Probing IDE interface ide5...
ide-floppy driver 0.99.newide
st: Version 20050312, fixed bufsize 32768, s/g segs 256
osst :I: Tape driver with OnStream support version 0.99.3
osst :I: $Id: osst.c,v 1.73 2005/01/01 21:13:34 wriede Exp $
mice: PS/2 mouse device common for all mice
md: md driver 0.90.1 MAX_MD_DEVS=256, MD_SB_DISKS=27
EISA: Probing bus 0 at eisa.0
EISA: Mainboard CPQ0733 detected.
Cannot allocate resource for EISA slot 1
Cannot allocate resource for EISA slot 2
EISA: Detected 0 cards.
NET: Registered protocol family 2
IP: routing cache hash table of 16384 buckets, 128Kbytes
TCP established hash table entries: 524288 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
TCP: Hash tables configured (established 524288 bind 65536)
NET: Registered protocol family 1
NET: Registered protocol family 17
NET: Registered protocol family 8
NET: Registered protocol family 20
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
RAMDISK: Compressed image found at block 0
VFS: Mounted root (ext2 filesystem).
input: AT Translated Set 2 keyboard on isa0060/serio0








Please tell me if i have done something wrong in the kernel compilation or
something else is wrong.

