From: Vince <fuzzy77@free.fr>
Subject: Yet another oops with reiser4...
Date: Thu, 05 Feb 2004 02:03:09 +0100
Message-ID: <4021964D.3030707@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16701-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

This oops came during a compilation on my reiser4 partition.
Is a new snapshot planned ? The current "2004.01.19-fixed" snapshot has 
been quite unstable for me so far (and the -bk tree is still unreachable)...
Please let me know if more information is needed.

loading reiser4 bitmap......done (5014 jiffies)
attempt to access beyond end of device
hdc3: rw=0, want=2315589128, limit=182610855
attempt to access beyond end of device
hdc3: rw=0, want=2315589128, limit=182610855
Unable to handle kernel NULL pointer dereference at virtual address 00000024
  printing eip:
c01fbe69
*pde = 00000000
Oops: 0000 [#1]
PREEMPT
CPU:    0
EIP:    0060:[<c01fbe69>]    Tainted: P   VLI
EFLAGS: 00010282
EIP is at dealloc_blocks_bitmap+0x69/0xa0
eax: 00000000   ebx: d6a8dd40   ecx: 00000293   edx: 00006890
esi: 00000001   edi: d8578000   ebp: 00000001   esp: de5efd6c
ds: 007b   es: 007b   ss: 0068
Process ktxnmgrd:run (pid: 3223, threadinfo=de5ee000 task=de10e1c0)
Stack: d6a8dd40 de5efd80 de5efd88 d1410b50 00000000 0001a2ea 00000000 
00006890
        00000001 00000000 d8578000 c01c095f d8578010 d1410b50 00000000 
00000001
        00000000 d338f378 00000005 d338f340 c01cf0a2 cc515e80 d338f378 
00000000
Call Trace:
  [<c01c095f>] apply_dset+0x5f/0x90
  [<c01cf0a2>] blocknr_set_iterator+0x52/0xe0
  [<c01c09d6>] post_commit_hook+0x46/0x60
  [<c01c0900>] apply_dset+0x0/0x90
  [<c01c940e>] reiser4_write_logs+0x1be/0x2b0
  [<c01c15dc>] commit_current_atom+0x12c/0x210
  [<c011cfde>] recalc_task_prio+0x8e/0x1b0
  [<c01c1eaa>] try_commit_txnh+0x11a/0x1b0
  [<c01c1f6d>] commit_txnh+0x2d/0xb0
  [<c01c11ba>] atom_should_commit+0x5a/0x60
  [<c01c0d29>] txn_end+0x39/0x40
  [<c01c19e1>] commit_some_atoms+0xd1/0x170
  [<c01ce986>] scan_mgr+0x36/0x70
  [<c01ce62c>] ktxnmgrd+0x16c/0x230
  [<c01ce4c0>] ktxnmgrd+0x0/0x230
  [<c0109289>] kernel_thread_helper+0x5/0xc

Code: 24 0c 89 04 24 e8 08 f2 ff ff 8b 83 6c 01 00 00 8b 5c 24 14 8b 40 
10 c1 e3 05 03 18 89 1c 24 e8 0e f6 ff ff 8b 54 24 1c 8b 43 10 <8b> 48 
24 89 54 24 04 8d 04 16 89 44 24 08 83 c1 04 89 0c 24 e8

