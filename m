From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Reiser4 hang -- bad sectors on disk
Date: Thu, 22 Sep 2005 12:45:39 +0300
Message-ID: <200509221245.39730.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26227-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

I experienced a Reiser4 lock-up this morning when I stopped an rdiff-backup
process.

My guess is that my hard disk has developed bad sectors. Am I correct?
To make sure I'm running badblocks now.

The kernel is 2.6.13-archck5 and here's the relevant syslog bit:

Sep 22 07:36:30 rmeijer-noc hddtemp[1831]: /dev/hdd: Maxtor 6B200P0: 40 C
Sep 22 07:36:35 rmeijer-noc smartd[2083]: Device: /dev/hdd, SMART Usage Att=
ribute: 202 TA_Increase_Count changed from 252 to 253
Sep 22 08:06:29 rmeijer-noc hddtemp[1831]: /dev/hdd: Maxtor 6B200P0: 41 C
Sep 22 08:36:30 rmeijer-noc hddtemp[1831]: /dev/hdd: Maxtor 6B200P0: 41 C
Sep 22 09:06:30 rmeijer-noc hddtemp[1831]: /dev/hdd: Maxtor 6B200P0: 41 C
Sep 22 09:36:30 rmeijer-noc hddtemp[1831]: /dev/hdd: Maxtor 6B200P0: 41 C
Sep 22 09:36:35 rmeijer-noc smartd[2083]: Device: /dev/hdd, SMART Usage Att=
ribute: 202 TA_Increase_Count changed from 253 to 252
Sep 22 10:06:30 rmeijer-noc hddtemp[1831]: /dev/hdd: Maxtor 6B200P0: 41 C
Sep 22 10:36:29 rmeijer-noc hddtemp[1831]: /dev/hdd: Maxtor 6B200P0: 42 C
Sep 22 10:36:36 rmeijer-noc smartd[2083]: Device: /dev/hdd, SMART Prefailur=
e Attribute: 8 Seek_Time_Performance changed from 251 to 250
Sep 22 10:36:36 rmeijer-noc smartd[2083]: Device: /dev/hdd, SMART Usage Att=
ribute: 202 TA_Increase_Count changed from 252 to 253
Sep 22 11:06:31 rmeijer-noc hddtemp[1831]: /dev/hdd: Maxtor 6B200P0: 43 C
Sep 22 11:07:59 rmeijer-noc kernel: hdd: dma_intr: status=3D0x51 { DriveRea=
dy SeekComplete Error }
Sep 22 11:07:59 rmeijer-noc kernel: hdd: dma_intr: error=3D0x01 { AddrMarkN=
otFound }, LBAsect=3D14116614, high=3D0, low=3D14116614, sector=3D14116559
Sep 22 11:07:59 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:08:07 rmeijer-noc kernel: hdd: dma_intr: status=3D0x51 { DriveRea=
dy SeekComplete Error }
Sep 22 11:08:07 rmeijer-noc kernel: hdd: dma_intr: error=3D0x40 { Uncorrect=
ableError }, LBAsect=3D14116614, high=3D0, low=3D14116614, sector=3D14116559
Sep 22 11:08:07 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:08:07 rmeijer-noc kernel: end_request: I/O error, dev hdd, sector=
 14116559
Sep 22 11:08:15 rmeijer-noc kernel: hdd: dma_intr: status=3D0x51 { DriveRea=
dy SeekComplete Error }
Sep 22 11:08:15 rmeijer-noc kernel: hdd: dma_intr: error=3D0x40 { Uncorrect=
ableError }, LBAsect=3D14116614, high=3D0, low=3D14116614, sector=3D14116567
Sep 22 11:08:15 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:08:15 rmeijer-noc kernel: end_request: I/O error, dev hdd, sector=
 14116567
Sep 22 11:08:23 rmeijer-noc kernel: hdd: dma_intr: status=3D0x51 { DriveRea=
dy SeekComplete Error }
Sep 22 11:08:23 rmeijer-noc kernel: hdd: dma_intr: error=3D0x40 { Uncorrect=
ableError }, LBAsect=3D14116614, high=3D0, low=3D14116614, sector=3D14116575
Sep 22 11:08:23 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:08:23 rmeijer-noc kernel: end_request: I/O error, dev hdd, sector=
 14116575
Sep 22 11:08:31 rmeijer-noc kernel: hdd: dma_intr: status=3D0x51 { DriveRea=
dy SeekComplete Error }
Sep 22 11:08:31 rmeijer-noc kernel: hdd: dma_intr: error=3D0x40 { Uncorrect=
ableError }, LBAsect=3D14116614, high=3D0, low=3D14116614, sector=3D14116583
Sep 22 11:08:31 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:08:31 rmeijer-noc kernel: end_request: I/O error, dev hdd, sector=
 14116583
Sep 22 11:08:40 rmeijer-noc kernel: hdd: dma_intr: status=3D0x51 { DriveRea=
dy SeekComplete Error }
Sep 22 11:08:40 rmeijer-noc kernel: hdd: dma_intr: error=3D0x40 { Uncorrect=
ableError }, LBAsect=3D14116614, high=3D0, low=3D14116614, sector=3D14116591
Sep 22 11:08:40 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:08:40 rmeijer-noc kernel: end_request: I/O error, dev hdd, sector=
 14116591
Sep 22 11:08:47 rmeijer-noc kernel: hdd: dma_intr: status=3D0x51 { DriveRea=
dy SeekComplete Error }
Sep 22 11:08:47 rmeijer-noc kernel: hdd: dma_intr: error=3D0x40 { Uncorrect=
ableError }, LBAsect=3D14116614, high=3D0, low=3D14116614, sector=3D14116599
Sep 22 11:08:47 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:08:47 rmeijer-noc kernel: end_request: I/O error, dev hdd, sector=
 14116599
Sep 22 11:08:55 rmeijer-noc kernel: hdd: dma_intr: status=3D0x51 { DriveRea=
dy SeekComplete Error }
Sep 22 11:08:55 rmeijer-noc kernel: hdd: dma_intr: error=3D0x40 { Uncorrect=
ableError }, LBAsect=3D14116614, high=3D0, low=3D14116614, sector=3D14116607
Sep 22 11:08:55 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:08:55 rmeijer-noc kernel: end_request: I/O error, dev hdd, sector=
 14116607
Sep 22 11:09:03 rmeijer-noc kernel: hdd: dma_intr: status=3D0x51 { DriveRea=
dy SeekComplete Error }
Sep 22 11:09:03 rmeijer-noc kernel: hdd: dma_intr: error=3D0x40 { Uncorrect=
ableError }, LBAsect=3D14116614, high=3D0, low=3D14116614, sector=3D14116607
Sep 22 11:09:03 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:09:03 rmeijer-noc kernel: end_request: I/O error, dev hdd, sector=
 14116607
Sep 22 11:09:03 rmeijer-noc kernel: reiser4[rdiff-backup(30258)]: call_read=
page (fs/reiser4/plugin/item/extent_file_ops.c:1278)[jmacd-97178]:
Sep 22 11:09:03 rmeijer-noc kernel: WARNING: page is not up to date
Sep 22 11:09:21 rmeijer-noc kernel: hdd: dma_intr: status=3D0x51 { DriveRea=
dy SeekComplete Error }
Sep 22 11:09:21 rmeijer-noc kernel: hdd: dma_intr: error=3D0x40 { Uncorrect=
ableError }, LBAsect=3D14116614, high=3D0, low=3D14116614, sector=3D14116607
Sep 22 11:09:21 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:09:21 rmeijer-noc kernel: end_request: I/O error, dev hdd, sector=
 14116607
Sep 22 11:09:21 rmeijer-noc kernel: reiser4[rdiff-backup(30258)]: call_read=
page (fs/reiser4/plugin/item/extent_file_ops.c:1278)[jmacd-97178]:
Sep 22 11:09:21 rmeijer-noc kernel: WARNING: page is not up to date
Sep 22 11:09:41 rmeijer-noc kernel: hdd: dma_timer_expiry: dma status =3D=
=3D 0x61
Sep 22 11:09:51 rmeijer-noc kernel: hdd: DMA timeout error
Sep 22 11:09:51 rmeijer-noc kernel: hdd: dma timeout error: status=3D0xd0 {=
 Busy }
Sep 22 11:09:51 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:09:51 rmeijer-noc kernel: hdc: DMA disabled
Sep 22 11:09:51 rmeijer-noc kernel: hdd: DMA disabled
Sep 22 11:09:52 rmeijer-noc kernel: ide1: reset: success
Sep 22 11:09:56 rmeijer-noc kernel: hdd: task_in_intr: status=3D0x59 { Driv=
eReady SeekComplete DataRequest Error }
Sep 22 11:09:56 rmeijer-noc kernel: hdd: task_in_intr: error=3D0x40 { Uncor=
rectableError }, LBAsect=3D14116615, high=3D0, low=3D14116615, sector=3D141=
16615
Sep 22 11:09:56 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:09:56 rmeijer-noc kernel: end_request: I/O error, dev hdd, sector=
 14116615
Sep 22 11:09:56 rmeijer-noc kernel: hdd: status error: status=3D0x59 { Driv=
eReady SeekComplete DataRequest Error }
Sep 22 11:09:56 rmeijer-noc kernel: hdd: status error: error=3D0x40 { Uncor=
rectableError }, LBAsect=3D34359742976, high=3D2048, low=3D4608, sector=3D1=
4116623
Sep 22 11:09:56 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:09:56 rmeijer-noc kernel: end_request: I/O error, dev hdd, sector=
 14116623
Sep 22 11:09:56 rmeijer-noc kernel: hdd: drive not ready for command
Sep 22 11:09:56 rmeijer-noc kernel: hdc: status error: status=3D0x50 { Driv=
eReady SeekComplete }
Sep 22 11:09:56 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:09:56 rmeijer-noc kernel: hdc: status error: status=3D0x50 { Driv=
eReady SeekComplete }
Sep 22 11:09:56 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:09:56 rmeijer-noc kernel: hdc: status error: status=3D0x50 { Driv=
eReady SeekComplete }
Sep 22 11:09:56 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:09:56 rmeijer-noc kernel: hdc: status error: status=3D0x50 { Driv=
eReady SeekComplete }
Sep 22 11:09:56 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:09:56 rmeijer-noc kernel: hdc: ATAPI reset complete
Sep 22 11:09:56 rmeijer-noc kernel: hdc: status error: status=3D0x00 { }
Sep 22 11:09:56 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:09:56 rmeijer-noc kernel: hdc: status error: status=3D0x00 { }
Sep 22 11:09:56 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:09:56 rmeijer-noc kernel: hdc: status error: status=3D0x00 { }
Sep 22 11:09:56 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:09:56 rmeijer-noc kernel: hdc: status error: status=3D0x00 { }
Sep 22 11:09:56 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:09:56 rmeijer-noc kernel: hdc: ATAPI reset complete
Sep 22 11:09:56 rmeijer-noc kernel: hdc: status error: status=3D0x00 { }
Sep 22 11:09:56 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:09:56 rmeijer-noc kernel: hdc: status error: status=3D0x08 { Data=
Request }
Sep 22 11:09:56 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:09:56 rmeijer-noc kernel: hdc: drive not ready for command
Sep 22 11:10:00 rmeijer-noc kernel: hdd: dma_intr: status=3D0x51 { DriveRea=
dy SeekComplete Error }
Sep 22 11:10:00 rmeijer-noc kernel: hdd: dma_intr: error=3D0x40 { Uncorrect=
ableError }, LBAsect=3D14116615, high=3D0, low=3D14116615, sector=3D14116615
Sep 22 11:10:00 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:10:00 rmeijer-noc kernel: end_request: I/O error, dev hdd, sector=
 14116615
Sep 22 11:10:00 rmeijer-noc kernel: hdc: status error: status=3D0x59 { Driv=
eReady SeekComplete DataRequest Error }
Sep 22 11:10:00 rmeijer-noc kernel: hdc: status error: error=3D0x04 { Abort=
edCommand }
Sep 22 11:10:00 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:10:00 rmeijer-noc kernel: hdc: drive not ready for command
Sep 22 11:10:00 rmeijer-noc kernel: hdc: status error: status=3D0x59 { Driv=
eReady SeekComplete DataRequest Error }
Sep 22 11:10:00 rmeijer-noc kernel: hdc: status error: error=3D0x04 { Abort=
edCommand }
Sep 22 11:10:00 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:10:00 rmeijer-noc kernel: hdc: drive not ready for command
Sep 22 11:10:00 rmeijer-noc kernel: hdc: status error: status=3D0x59 { Driv=
eReady SeekComplete DataRequest Error }
Sep 22 11:10:00 rmeijer-noc kernel: hdc: status error: error=3D0x04 { Abort=
edCommand }
Sep 22 11:10:00 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 11:10:00 rmeijer-noc kernel: hdc: drive not ready for command
Sep 22 11:10:00 rmeijer-noc kernel: reiser4[rdiff-backup(30258)]: call_read=
page (fs/reiser4/plugin/item/extent_file_ops.c:1278)[jmacd-97178]:
Sep 22 11:10:00 rmeijer-noc kernel: WARNING: page is not up to date
Sep 22 11:10:00 rmeijer-noc kernel: hdc: ATAPI reset complete
Sep 22 11:10:01 rmeijer-noc kernel: ------------[ cut here ]------------
Sep 22 11:10:01 rmeijer-noc kernel: PREEMPT
Sep 22 11:10:01 rmeijer-noc kernel: Modules linked in: binfmt_misc iptable_=
filter ip_tables thermal fan button processor ac battery ide_cd cdrom 8250_=
pnp 8250 serial_core i2c_viapro i2c_core
Sep 22 11:10:01 rmeijer-noc kernel: CPU:    0
Sep 22 11:10:01 rmeijer-noc kernel: EIP:    0060:[<c016b375>]    Not tainte=
d VLI
Sep 22 11:10:01 rmeijer-noc kernel: EFLAGS: 00010202   (2.6.13-archck5)
Sep 22 11:10:01 rmeijer-noc kernel: EIP is at clear_inode+0x16/0xb0
Sep 22 11:10:01 rmeijer-noc kernel: eax: 00000000   ebx: eed3a92c   ecx: 00=
000001   edx: eed3aa1c
Sep 22 11:10:01 rmeijer-noc kernel: esi: eed3a92c   edi: ecfc8000   ebp: ec=
fc9f20   esp: ecfc9ef8
Sep 22 11:10:01 rmeijer-noc kernel: ds: 007b   es: 007b   ss: 0068
Sep 22 11:10:01 rmeijer-noc kernel: Process umount (pid: 30614, threadinfo=
=3Decfc8000 task=3De2cf0020)
Sep 22 11:10:01 rmeijer-noc kernel: Stack: c0140ad6 eed3a934 eed3a92c c016b=
439 000030a6 00000001 ecfc8000 f2df89f8
Sep 22 11:10:01 rmeijer-noc kernel: ecfc8000 c016b5fa e6e645b4 e6e645b4 f44=
c3c04 e93aea00 f2df89f8 c0159db8
Sep 22 11:10:01 rmeijer-noc kernel: 080502b1 f5d00780 e93aea00 080502b1 c01=
5a917 e93aea00 c036fce0 c0159c8e
Sep 22 11:10:01 rmeijer-noc kernel: Call Trace:
Sep 22 11:10:01 rmeijer-noc kernel: [<c0140ad6>] truncate_inode_pages+0x17/=
0x1b
Sep 22 11:10:01 rmeijer-noc kernel: [<c016b439>] dispose_list+0x2a/0x102
Sep 22 11:10:01 rmeijer-noc kernel: [<c016b5fa>] invalidate_inodes+0x4d/0x69
Sep 22 11:10:01 rmeijer-noc kernel: [<c0159db8>] generic_shutdown_super+0x6=
3/0x142
Sep 22 11:10:01 rmeijer-noc kernel: [<c015a917>] kill_block_super+0x1d/0x2d
Sep 22 11:10:01 rmeijer-noc kernel: [<c0159c8e>] deactivate_super+0x4c/0x60
Sep 22 11:10:01 rmeijer-noc kernel: [<c016e04d>] sys_umount+0x33/0x75
Sep 22 11:10:01 rmeijer-noc kernel: [<c015cd70>] sys_stat64+0xf/0x28
Sep 22 11:10:01 rmeijer-noc kernel: [<c0148d63>] do_munmap+0xca/0xf9
Sep 22 11:10:01 rmeijer-noc kernel: [<c016e0a6>] sys_oldumount+0x17/0x1b
Sep 22 11:10:01 rmeijer-noc kernel: [<c0102dcf>] sysenter_past_esp+0x54/0x75
Sep 22 11:10:01 rmeijer-noc kernel: Code: 42 04 44 cd 36 c0 89 15 44 cd 36 =
c0 83 2d c8 79 44 c0 01 eb cf 56 53 83 ec 04 89 c3 e8 47 ad fe ff 8b 8b dc =
00 00 00 85 c9 74 08 <0f> 0b fc 00 63 c1 32 c0 8b 83 38 01 00 00 a8 10 75 0=
8 0f 0b fe
Sep 22 11:10:01 rmeijer-noc kernel: Badness in do_exit at kernel/exit.c:786
Sep 22 11:10:01 rmeijer-noc kernel: [<c011c039>] do_exit+0x32f/0x42b
Sep 22 11:10:01 rmeijer-noc kernel: [<c01040a5>] do_trap+0x0/0xb4
Sep 22 11:10:01 rmeijer-noc kernel: [<c010435d>] do_invalid_op+0x0/0xab
Sep 22 11:10:01 rmeijer-noc kernel: [<c01043ff>] do_invalid_op+0xa2/0xab
Sep 22 11:10:01 rmeijer-noc kernel: [<c016b375>] clear_inode+0x16/0xb0
Sep 22 11:10:01 rmeijer-noc kernel: [<c01fc6d5>] radix_tree_gang_lookup+0x4=
d/0x69
Sep 22 11:10:01 rmeijer-noc kernel: [<c013728a>] find_get_pages+0x26/0x61
Sep 22 11:10:01 rmeijer-noc kernel: [<c014064d>] pagevec_lookup+0x1c/0x24
Sep 22 11:10:01 rmeijer-noc kernel: [<c0140872>] truncate_inode_pages_range=
+0xa3/0x2f0
Sep 22 11:10:01 rmeijer-noc kernel: [<c01038d3>] error_code+0x4f/0x54
Sep 22 11:10:01 rmeijer-noc kernel: [<c016b375>] clear_inode+0x16/0xb0
Sep 22 11:10:01 rmeijer-noc kernel: [<c0140ad6>] truncate_inode_pages+0x17/=
0x1b
Sep 22 11:10:01 rmeijer-noc kernel: [<c016b439>] dispose_list+0x2a/0x102
Sep 22 11:10:01 rmeijer-noc kernel: [<c016b5fa>] invalidate_inodes+0x4d/0x69
Sep 22 11:10:01 rmeijer-noc kernel: [<c0159db8>] generic_shutdown_super+0x6=
3/0x142
Sep 22 11:10:01 rmeijer-noc kernel: [<c015a917>] kill_block_super+0x1d/0x2d
Sep 22 11:10:01 rmeijer-noc kernel: [<c0159c8e>] deactivate_super+0x4c/0x60
Sep 22 11:10:01 rmeijer-noc kernel: [<c016e04d>] sys_umount+0x33/0x75
Sep 22 11:10:01 rmeijer-noc kernel: [<c015cd70>] sys_stat64+0xf/0x28
Sep 22 11:10:01 rmeijer-noc kernel: [<c0148d63>] do_munmap+0xca/0xf9
Sep 22 11:10:01 rmeijer-noc kernel: [<c016e0a6>] sys_oldumount+0x17/0x1b
Sep 22 11:10:01 rmeijer-noc kernel: [<c0102dcf>] sysenter_past_esp+0x54/0x75

And just when I wanted to send this I noticed that badblocks had stopped
its output:

[root@rmeijer-noc ~] # badblocks -nsv /dev/hdd1
Checking for bad blocks in non-destructive read-write mode
=46rom block 0 to 199141708
Checking for bad blocks (non-destructive read-write test)
Testing with random pattern: 2013824 2013824/      199141708
                                                              =20
And more warnings in the syslog:

Sep 22 12:42:20 rmeijer-noc kernel: hdd: dma_intr: status=3D0x51 { DriveRea=
dy SeekComplete Error }
Sep 22 12:42:20 rmeijer-noc kernel: hdd: dma_intr: error=3D0x40 { Uncorrect=
ableError }, LBAsect=3D4027782, high=3D0, low=3D4027782, sector=3D4027711
Sep 22 12:42:20 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 12:42:20 rmeijer-noc kernel: end_request: I/O error, dev hdd, sector=
 4027711
Sep 22 12:42:28 rmeijer-noc kernel: hdd: dma_intr: status=3D0x51 { DriveRea=
dy SeekComplete Error }
Sep 22 12:42:28 rmeijer-noc kernel: hdd: dma_intr: error=3D0x40 { Uncorrect=
ableError }, LBAsect=3D4027782, high=3D0, low=3D4027782, sector=3D4027719
Sep 22 12:42:28 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 12:42:28 rmeijer-noc kernel: end_request: I/O error, dev hdd, sector=
 4027719
Sep 22 12:42:36 rmeijer-noc kernel: hdd: dma_intr: status=3D0x51 { DriveRea=
dy SeekComplete Error }
Sep 22 12:42:36 rmeijer-noc kernel: hdd: dma_intr: error=3D0x40 { Uncorrect=
ableError }, LBAsect=3D4027782, high=3D0, low=3D4027782, sector=3D4027727
Sep 22 12:42:36 rmeijer-noc kernel: ide: failed opcode was: unknown
Sep 22 12:42:36 rmeijer-noc kernel: end_request: I/O error, dev hdd, sector=
 4027727                                                        =20
[...]

Etcetera etcetera..

So my disk has bad sectors indeed and the lock-up is not Reiser4 related
after all.

So please forget that you ever received and read this message ;)


Cheers,

Ray
