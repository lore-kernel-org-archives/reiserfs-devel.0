From: =?ISO-8859-1?Q?Xu=E2n_Baldauf?=
 <xuan--2004.09.03--reiserfs-list--namesys.com@baldauf.org>
Subject: BUG|crash
Date: Sat, 04 Sep 2004 00:57:29 +0200
Message-ID: <4138F6D9.6060606@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21448-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs List <reiserfs-list@namesys.com>

Hello,

when connecting a digital camera using usb-storage in order to download 
photos, there is a good chance to lock-up the machine with a stack trace 
where reiserfs is involved. I first suspected bad memory, but the 
problem persists after removing slower memory and still running with 
conservative memory timings. memtest does not show any errors. Kernel is 
2.6.8.1. This is such a stack trace:


Sep  4 00:28:13 router kernel: usb 1-2: new full speed USB device using 
address 2
Sep  4 00:28:13 router kernel: usb 1-2: Product: USB Mass Storage
Sep  4 00:28:13 router kernel: usb 1-2: SerialNumber: 
Y-558^^^^^031106XFPX0009029074
Sep  4 00:28:14 router /etc/hotplug/usb.agent[7248]: need a device for 
this command
Sep  4 00:28:20 router kernel: Initializing USB Mass Storage driver...
Sep  4 00:28:20 router kernel: scsi0 : SCSI emulation for USB Mass 
Storage devices
Sep  4 00:28:20 router kernel:   Vendor: FUJIFILM  Model: 
USB-DRIVEUNIT     Rev: 1.00
Sep  4 00:28:20 router kernel:   Type:   
Direct-Access                      ANSI SCSI revision: 02
Sep  4 00:28:20 router kernel: SCSI device sda: 256000 512-byte hdwr 
sectors (131 MB)
Sep  4 00:28:20 router kernel: sda: assuming Write Enabled
Sep  4 00:28:20 router kernel: sda: assuming drive cache: write through
Sep  4 00:28:20 router kernel:  /dev/scsi/host0/bus0/target0/lun0: p1
Sep  4 00:28:20 router /etc/hotplug/block.agent[7334]: try 1 while 
waiting for /block/sda's bus_id 0:0:0:0
Sep  4 00:28:20 router kernel: Attached scsi removable disk sda at 
scsi0, channel 0, id 0, lun 0
Sep  4 00:28:20 router kernel: Attached scsi generic sg0 at scsi0, 
channel 0, id 0, lun 0,  type 0
Sep  4 00:28:20 router kernel: usbcore: registered new driver usb-storage
Sep  4 00:28:20 router kernel: USB Mass Storage support registered.
Sep  4 00:28:21 router /etc/hotplug/block.agent[7350]: new block device 
/block/sda/sda1
Sep  4 00:28:21 router /etc/hotplug/block.agent[7334]: waiting for 
/var/lock/block.agent.lock, process 7350 holds it
Sep  4 00:28:30 router /etc/hotplug/block.agent[7350]: mount 
by-path/usb-storage-Y558^^^^^031106XFPX0009029074:0:0:0p1
Sep  4 00:28:30 router kernel: subfs 0.9
Sep  4 00:28:30 router /etc/hotplug/block.agent[7334]: new block device 
/block/sda
Sep  4 00:30:00 router /USR/SBIN/CRON[7660]: (root) CMD ( test -x 
/usr/lib/cron/run-crons && /usr/lib/cron/run-crons )
Sep  4 00:35:41 router kernel: ------------[ cut here ]------------
Sep  4 00:35:41 router kernel: kernel BUG at fs/reiserfs/journal.c:1455!
Sep  4 00:35:41 router kernel: invalid operand: 0000 [#1]
Sep  4 00:35:41 router kernel: PREEMPT
Sep  4 00:35:41 router kernel: Modules linked in: snd_mixer_oss snd 
soundcore nls_iso8859_15 nls_cp437 vfat fat subfs usb_storage lp 
ethertap joydev sg sr_mod ide_cd cdrom floppy nvram ipt_MASQUERADE 
ipt_TCPMSS ipt_TOS ipt_length iptable_mangle ip_nat_ftp ip_conntrack_ftp 
ipt_REJECT iptable_filter iptable_nat nls_cp850 ip_conntrack 
nls_iso8859_1 ip_tables smbfs freq_table pppoe pppox parport_pc via_agp 
uhci_hcd parport agpgart af_packet ppp_generic 8139too mii usbcore crc32 
hisax isdn slhc sd_mod scsi_mod softdog evdev rtc capability commoncap 
psmouse pcips2 md5 ipv6 8250 serial_core unix
Sep  4 00:35:41 router kernel: CPU:    0
Sep  4 00:35:41 router kernel: EIP:    
0060:[dirty_one_transaction+71/128]    Not tainted
Sep  4 00:35:41 router kernel: EIP:    0060:[<c01b7947>]    Not tainted
Sep  4 00:35:41 router kernel: EFLAGS: 00010246   (2.6.8.1)
Sep  4 00:35:41 router kernel: EIP is at dirty_one_transaction+0x47/0x80
Sep  4 00:35:41 router kernel: eax: 00000000   ebx: c822e120   ecx: 
3d646967   edx: c822e240
Sep  4 00:35:41 router kernel: esi: c5c602e0   edi: 00000001   ebp: 
c11a9e30   esp: c11a9e2c
Sep  4 00:35:41 router kernel: ds: 007b   es: 007b   ss: 0068
Sep  4 00:35:41 router kernel: Process pdflush (pid: 44, 
threadinfo=c11a8000 task=c776cb70)
Sep  4 00:35:41 router kernel: Stack: c80f3000 c11a9e64 c01b6e53 
c63ed000 c6643000 00000282 c6643000 c5c602f8
Sep  4 00:35:41 router kernel:        00000001 c111c600 c4858b74 
00000000 00000000 c111c600 c11a9ed4 c01bba0c
Sep  4 00:35:41 router kernel:        c5c603e0 00002012 c6643000 
c62b42b8 c5c602f8 c11a8000 000003fa 000022a3
Sep  4 00:35:41 router kernel: Call Trace:
Sep  4 00:35:41 router kernel:  [show_stack+155/176] show_stack+0x9b/0xb0
Sep  4 00:35:41 router kernel:  [<c01061db>] show_stack+0x9b/0xb0
Sep  4 00:35:41 router kernel:  [show_registers+277/368] 
show_registers+0x115/0x170
Sep  4 00:35:41 router kernel:  [<c0106325>] show_registers+0x115/0x170
Sep  4 00:35:41 router kernel:  [die+130/240] die+0x82/0xf0
Sep  4 00:35:41 router kernel:  [<c0106492>] die+0x82/0xf0
Sep  4 00:35:41 router kernel:  [do_invalid_op+156/160] 
do_invalid_op+0x9c/0xa0
Sep  4 00:35:41 router kernel:  [<c01067dc>] do_invalid_op+0x9c/0xa0
Sep  4 00:35:41 router kernel:  [error_code+45/64] error_code+0x2d/0x40
Sep  4 00:35:41 router kernel:  [<c0105e2d>] error_code+0x2d/0x40
Sep  4 00:35:41 router kernel:  [flush_commit_list+547/1008] 
flush_commit_list+0x223/0x3f0
Sep  4 00:35:41 router kernel:  [<c01b6e53>] flush_commit_list+0x223/0x3f0
Sep  4 00:35:41 router kernel:  [do_journal_end+2796/2864] 
do_journal_end+0xaec/0xb30
Sep  4 00:35:41 router kernel:  [<c01bba0c>] do_journal_end+0xaec/0xb30
Sep  4 00:35:41 router kernel:  [journal_end_sync+55/128] 
journal_end_sync+0x37/0x80
Sep  4 00:35:41 router kernel:  [<c01ba597>] journal_end_sync+0x37/0x80
Sep  4 00:35:41 router kernel:  [reiserfs_sync_fs+75/144] 
reiserfs_sync_fs+0x4b/0x90
Sep  4 00:35:41 router kernel:  [<c01a3c2b>] reiserfs_sync_fs+0x4b/0x90
Sep  4 00:35:41 router kernel:  [sync_supers+206/224] sync_supers+0xce/0xe0
Sep  4 00:35:41 router kernel:  [<c015a45e>] sync_supers+0xce/0xe0
Sep  4 00:35:41 router kernel:  [wb_kupdate+49/272] wb_kupdate+0x31/0x110
Sep  4 00:35:41 router kernel:  [<c013d041>] wb_kupdate+0x31/0x110
Sep  4 00:35:41 router kernel:  [__pdflush+236/528] __pdflush+0xec/0x210
Sep  4 00:35:41 router kernel:  [<c013da9c>] __pdflush+0xec/0x210
Sep  4 00:35:41 router kernel:  [pdflush+30/32] pdflush+0x1e/0x20
Sep  4 00:35:41 router kernel:  [<c013dbde>] pdflush+0x1e/0x20
Sep  4 00:35:41 router kernel:  [kthread+133/176] kthread+0x85/0xb0
Sep  4 00:35:41 router kernel:  [<c012c985>] kthread+0x85/0xb0
Sep  4 00:35:41 router kernel:  [kernel_thread_helper+5/16] 
kernel_thread_helper+0x5/0x10
Sep  4 00:35:41 router kernel:  [<c0103265>] kernel_thread_helper+0x5/0x10
Sep  4 00:35:41 router kernel: Code: 0f 0b af 05 5e b9 30 c0 8b 13 85 d2 
74 06 0f ba 32 0d 8b 13

