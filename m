From: Lorenzo Allegrucci <l.allegrucci@tiscali.it>
Subject: 2.6.0-test4 reiserfs oops
Date: Mon, 25 Aug 2003 20:47:36 +0000
Message-ID: <200308252047.36054.l.allegrucci@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15408-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


I have got this oops running fsstress and fsx-linux
on a 20Gb reiserfs partition.  Fully reproducible.

kernel BUG at mm/filemap.c:336!
invalid operand: 0000 [#1]
CPU:    0
EIP:    0060:[end_page_writeback+89/128]    Not tainted
EFLAGS: 00010246
EIP is at end_page_writeback+0x59/0x80
eax: 00000000   ebx: c1420950   ecx: 00000017   edx: c15001c0
esi: c15003d0   edi: da825d3c   ebp: d9855ddc   esp: d9855dd0
ds: 007b   es: 007b   ss: 0068
Process fsstress (pid: 588, threadinfo=d9854000 task=d9815280)
Stack: c1420950 0000003f da825d3c d9855e08 c01d3568 c1420950 d9855ee0 d9855ee0
       00000000 00000000 dc46d1f8 c1420950 dc46d284 d9855ee0 d9855e58 c016833a
       c1420950 d9855ee0 d9855e58 c023a24e dfe2cdc0 db7b2440 dc46d2ac dc46d2a4
Call Trace:
 [reiserfs_write_full_page+200/800] reiserfs_write_full_page+0xc8/0x320
 [mpage_writepages+538/736] mpage_writepages+0x21a/0x2e0
 [__make_request+622/1216] __make_request+0x26e/0x4c0
 [reiserfs_writepage+0/64] reiserfs_writepage+0x0/0x40
 [do_writepages+53/64] do_writepages+0x35/0x40
 [__sync_single_inode+169/496] __sync_single_inode+0xa9/0x1f0
 [sync_sb_inodes+387/544] sync_sb_inodes+0x183/0x220
 [sync_inodes_sb+126/144] sync_inodes_sb+0x7e/0x90
 [sync_inodes+46/160] sync_inodes+0x2e/0xa0
 [do_sync+69/96] do_sync+0x45/0x60
 [sys_sync+18/32] sys_sync+0x12/0x20
 [syscall_call+7/11] syscall_call+0x7/0xb

Code: 0f 0b 50 01 a6 e1 2d c0 eb d5 89 1c 24 e8 45 81 00 00 85 c0


