From: Ookhoi <ookhoi@humilis.net>
Subject: Re: reiser4 and 2.5.60
Date: Tue, 18 Feb 2003 11:08:50 +0100
Message-ID: <20030218110850.F20771@humilis>
References: <20030215160033.A3570@humilis> <20030218121257.A27125@namesys.com> <20030218103151.B19634@humilis> <20030218124236.A31148@namesys.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12807-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030218124236.A31148@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Ookhoi <ookhoi@humilis.net>, reiserfs-list@namesys.com

Oleg Drokin wrote (ao):
> Well, it should not, but if you can test it not on loop device just to
> be sure, that would be nice.

That also gives me a Segmentation fault when I want to untar the kernel
source.

I did mkfs.reiser4 on a 2.2GB partition, mounted it, cd'ed into it, and
untarred the source (it is not zipped).

After this oops, another came when I did dmesg. It is below this one.

(mkfs.reiser4 is 0.3.0)

Hope this helps!


 reiser4[mount(15619)]: reiser4_fill_super (fs/reiser4/vfs_ops.c:2116)[nikita-2372]:
WARNING: Debugging is on. Benchmarking is invalid.
readahead options: max=32209, flags=0x0
================ fs info (mount ok) =================
root block: 21
tree height: 2
reiser40 default oid manager: next free objectid 65536, oids in use 0
Block counters:
	block count	556242
	free blocks	556203
	used blocks	39
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
eax: 00000000   ebx: 00000000   ecx: cd25fbc0   edx: 00000000
esi: 00010003   edi: 00000000   ebp: 00000000   esp: c7423b18
ds: 007b   es: 007b   ss: 0068
Process tar (pid: 15623, threadinfo=c7422000 task=c6c0c7e0)
Stack: df8e9244 00010003 d0f4d840 c103fb38 c7423ba8 c7423b88 c02153e8 da646678 
       c7423ba8 c7423b88 d0f4d840 c103fb38 fffffffe c103fb38 c7423ba8 c02192c0 
       c7423ba8 c7423b88 c103fb38 00000005 00100024 00000000 00010003 00000000 
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
 

dmesg made this happen:
Message from syslogd@fujita at Tue Feb 18 11:01:30 2003 ...
fujita kernel: reiser4 panicked cowardly: assertion failed: context_list_link_invariant (_link)


  reiser4[ktxnmgrd:timed(15620)]: context_list_link_ok (fs/reiser4/context.h:102)[nikita-1054]:
reiser4 panicked cowardly: assertion failed: context_list_link_invariant (_link)
pins held: jnode: 0, tree: 0 (0:0), dk: 0, txnh: 0, atom: 0, stack: 0, txnmgr: 0, ktxnmgrd: 0, fq: 0, reiser4_sb: 0, inode: 0, spin: 0, long: 0
d: 0, x: 0, t: 0
context: trace_flags: c6c0d9e0
	tid: 262145
	locks: jnode: -1073745920, tree: 0 (8:8), dk: 4096, txnh: 4096, atom: -1073741824, stack: -1073741824, txnmgr: -1073741824, ktxnmgrd: -1072469514, fq: -1069353404, reiser4_sb: -598384992, inode: -1073745920, spin: -1073741824, long: -951967744
d: 582, x: -1069962996, t: -855524352
pid: 1936026977, comm: 
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
eax: 0000191a   ebx: 0000191a   ecx: c8679df0   edx: c039819c
esi: c011791a   edi: c7423e8c   ebp: c7423e84   esp: c8679e64
ds: 007b   es: 007b   ss: 0068
Process ktxnmgrd:timed (pid: 15620, threadinfo=c8678000 task=c6c0c1e0)
Stack: 00001926 c7423e80 c04568cc c8679f48 c8679ed0 c01b0f17 c033d64c c7423e84 
       c7423e80 c01b0f71 c033d670 c7423e80 c7423ef8 c7423ef8 c0194d09 c033b374 
       c8679f50 c7423ef8 c01b07ed c03517a0 df8e9220 df8e92c8 c8679ed0 c8678000 
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
  reiser4[pdflush(4)]: context_list_link_ok (fs/reiser4/context.h:102)[nikita-1054]:
reiser4 panicked cowardly: assertion failed: context_list_link_invariant (_link)
pins held: jnode: 0, tree: 0 (0:0), dk: 0, txnh: 0, atom: 0, stack: 0, txnmgr: 0, ktxnmgrd: 0, fq: 0, reiser4_sb: 0, inode: 0, spin: 0, long: 0
d: 0, x: 0, t: 0
context: trace_flags: c6c0d9e0
	tid: 262145
	locks: jnode: -1073745920, tree: 0 (8:8), dk: 4096, txnh: 4096, atom: -1073741824, stack: -1073741824, txnmgr: -1073741824, ktxnmgrd: -1072469514, fq: -1069353404, reiser4_sb: -598384992, inode: -1073745920, spin: -1073741824, long: -951967744
d: 582, x: -1069962996, t: -855524352
pid: 1936026977, comm: 
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
eax: 0000191a   ebx: 0000191a   ecx: dfdf1c88   edx: c039819c
esi: c011791a   edi: c7423e8c   ebp: c7423e84   esp: dfdf1cfc
ds: 007b   es: 007b   ss: 0068
Process pdflush (pid: 4, threadinfo=dfdf0000 task=c153f240)
Stack: 00001926 c7423e80 c04568cc dfdf1dec dfdf1d74 c01b0f17 c033d64c c7423e84 
       c7423e80 c01b0f71 c033d670 c7423e80 c7423ef8 c7423ef8 c0194d09 c033b374 
       dfdf1df4 c7423ef8 c01b07ed c03517a0 da646e84 da646e84 dfdb7c00 dfdf1d74 
Call Trace:
 [<c01b0f17>] print_context+0x67/0xa0
 [<c01b0f71>] print_contexts+0x21/0x30
 [<c0194d09>] reiser4_do_panic+0x69/0x1c0
 [<c01b07ed>] init_context+0x23d/0x380
 [<c01e69b2>] reiser4_writepages+0x32/0x1a0
 [<c02a8b6a>] ahc_linux_run_device_queue+0x4ca/0x9a0
 [<c0131106>] do_writepages+0x16/0x30
 [<c015d206>] __sync_single_inode+0xa6/0x1f0
 [<c015d53d>] sync_sb_inodes+0x15d/0x210
 [<c015d61b>] writeback_inodes+0x2b/0x50
 [<c0130ffe>] wb_kupdate+0x9e/0x100
 [<c0131556>] __pdflush+0xb6/0x170
 [<c0131610>] pdflush+0x0/0x10
 [<c013161b>] pdflush+0xb/0x10
 [<c0130f60>] wb_kupdate+0x0/0x100
 [<c0108cf4>] kernel_thread_helper+0x0/0xc
 [<c0108cf9>] kernel_thread_helper+0x5/0xc

Code: 8b 58 60 b8 26 d0 33 c0 85 db 7e 0a 50 e8 6f 72 02 00 5a 59 
