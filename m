From: Ookhoi <ookhoi@humilis.net>
Subject: reiser4 and 2.5.60
Date: Sat, 15 Feb 2003 16:00:33 +0100
Message-ID: <20030215160033.A3570@humilis>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12779-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: green@namesys.com
Cc: reiserfs-list@namesys.com

Hi Oleg,

I builded a kernel with these options, like you told in your other mail
(which I lost, hence this new mail).

CONFIG_REISER4_FS=y
CONFIG_REISER4_CHECK=y
CONFIG_REISER4_DEBUG=y
CONFIG_REISER4_DEBUG_MODIFY=y
CONFIG_REISER4_DEBUG_MEMCPY=y
CONFIG_REISER4_DEBUG_NODE=y
CONFIG_REISER4_ZERO_NEW_NODE=y
CONFIG_REISER4_TRACE=y
CONFIG_REISER4_DEBUG_OUTPUT=y
CONFIG_REISERFS_FS=y

And disabled CONFIG_PREEMPT.

I still get a Segmentation fault when I want to untar a kernel source on
a fresh 512MB loop filesystem.

Does this help you?



 reiser4[mount(336)]: reiser4_fill_super (fs/reiser4/vfs_ops.c:2116)[nikita-2372]:
WARNING: Debugging is on. Benchmarking is invalid.
readahead options: max=32209, flags=0x0
================ fs info (mount ok) =================
root block: 21
tree height: 2
reiser40 default oid manager: next free objectid 65536, oids in use 0
Block counters:
	block count	131072
	free blocks	131045
	used blocks	27
	grabbed	0
	fake allocated formatted	0
	fake allocated unformatted	0
Root directory key: (29:1:0:2a:0)[stat data]
=========== disk format info (reiser40) =============
Unable to handle kernel NULL pointer dereference at virtual address 00000000
 printing eip:
00000000
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0060:[<00000000>]    Not tainted
EFLAGS: 00010282
EIP is at 0x0
eax: 00000000   ebx: 00000000   ecx: dbc8cbc0   edx: 00000000
esi: 00010003   edi: 00000000   ebp: 00000000   esp: dbe39b18
ds: 007b   es: 007b   ss: 0068
Process tar (pid: 356, threadinfo=dbe38000 task=df0ec100)
Stack: df8dc444 00010003 dbc8d840 c148b430 dbe39ba8 dbe39b88 c02153e8 dbc6d678 
       dbe39ba8 dbe39b88 dbc8d840 c148b430 fffffffe c148b430 dbe39ba8 c02192c0 
       dbe39ba8 dbe39b88 c148b430 00000005 00100024 00000000 00010003 00000000 
Call Trace:
 [<c02153e8>] extent_writepage+0x88/0x1d0
 [<c02192c0>] unix_file_writepage_nolock+0xb0/0x180
 [<c021c35d>] replace+0x9d/0x160
 [<c012caba>] unlock_page+0xa/0x40
 [<c021c826>] tail2extent+0x406/0x7c0
 [<c0194f22>] lock_counters+0x22/0x70
 [<c0194f22>] lock_counters+0x22/0x70
 [<c01ab0bd>] spin_unlock_jnode+0x2d/0xd0
 [<c01a9a3c>] longterm_unlock_znode+0x15c/0x530
 [<c021a20c>] append_and_or_overwrite+0x3ec/0x4e0
 [<c0210206>] extent_max_key+0x46/0x130
 [<c0210206>] extent_max_key+0x46/0x130
 [<c0210206>] extent_max_key+0x46/0x130
 [<c021a374>] write_flow+0x74/0x100
 [<c021b773>] ea_obtained+0x33/0xb0
 [<c021a74b>] write_file+0x13b/0x210
 [<c01aa8b2>] init_lock_stack+0x12/0x50
 [<c021a850>] unix_file_write+0x30/0x50
 [<c01e1c5e>] reiser4_write+0xbe/0x1f0
 [<c01b5629>] __reiser4_grab_space+0x79/0x1e0
 [<c0143842>] vfs_write+0x92/0xe0
 [<c01438fa>] sys_write+0x2a/0x40
 [<c010abd7>] syscall_call+0x7/0xb

Code:  Bad EIP value.
  reiser4[ktxnmgrd:timed(339)]: context_list_link_ok (fs/reiser4/context.h:102)[nikita-1054]:
reiser4 panicked cowardly: assertion failed: context_list_link_invariant (_link)
pins held: jnode: 0, tree: 0 (0:0), dk: 0, txnh: 0, atom: 0, stack: 0, txnmgr: 0, ktxnmgrd: 0, fq: 0, reiser4_sb: 0, inode: 0, spin: 0, long: 0
d: 0, x: 0, t: 0
context: trace_flags: df0ed300
	tid: 262145
	locks: jnode: -1073745920, tree: 0 (6:12), dk: 4096, txnh: 4096, atom: -1073741824, stack: -1073741824, txnmgr: -1073741824, ktxnmgrd: -1072469514, fq: -1069353404, reiser4_sb: -552755552, inode: -1073745920, spin: -1073741824, long: -605847552
d: 582, x: -1069962996, t: -570946560
pid: 0, comm: 
	lock stack:
.... nr_signaled 70
.... curpri high
.... current request: read: 0
.... current locks:
Unable to handle kernel paging request at virtual address 0000197a
 printing eip:
c01aadaf
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0060:[<c01aadaf>]    Not tainted
EFLAGS: 00010202
EIP is at print_lock_stack+0xdf/0x140
eax: 0000191a   ebx: 0000191a   ecx: dbe4fdf0   edx: c039819c
esi: c011791a   edi: dbe39e8c   ebp: dbe39e84   esp: dbe4fe64
ds: 007b   es: 007b   ss: 0068
Process ktxnmgrd:timed (pid: 339, threadinfo=dbe4e000 task=dd050d20)
Stack: 00001926 dbe39e80 c04568cc dbe4ff48 dbe4fed0 c01b0f17 c033d64c dbe39e84 
       dbe39e80 c01b0f71 c033d670 dbe39e80 dbe39ef8 dbe39ef8 c0194d09 c033b374 
       dbe4ff50 dbe39ef8 c01b07ed c03517a0 df8dc420 df8dc4c8 dbe4fed0 dbe4e000 
Call Trace:
 [<c01b0f17>] print_context+0x67/0xa0
 [<c01b0f71>] print_contexts+0x21/0x30
 [<c0194d09>] reiser4_do_panic+0x69/0x1c0
 [<c01b07ed>] init_context+0x23d/0x380
 [<c01da427>] scan_mgr+0x47/0x120
 [<c01d9f0d>] ktxnmgrd+0xfd/0x1a0
 [<c01d9f29>] ktxnmgrd+0x119/0x1a0
 [<c01d9e10>] ktxnmgrd+0x0/0x1a0
 [<c0108cf9>] kernel_thread_helper+0x5/0xc

Code: 8b 58 60 b8 26 d0 33 c0 85 db 7e 0a 50 e8 6f 72 02 00 5a 59 
 
