From: Vince <fuzzy77@free.fr>
Subject: snapshot 19.01.2004-fixed : oops+corruption
Date: Wed, 28 Jan 2004 20:17:40 +0100
Message-ID: <40180AD4.7040409@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-16637-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: reiserfs-list@namesys.com

Hi, I got the following oops while moving a kernel tree from a reiser4 
partition (to a reiser3 partition):

Unable to handle kernel paging request at virtual address 000f0a3c
  printing eip:
c01ff3c9
*pde = 00000000
Oops: 0000 [#1]
PREEMPT
CPU:    0
EIP:    0060:[<c01ff3c9>]    Tainted: P   VLI
EFLAGS: 00010202
EIP is at cond_add_to_overwrite_set+0x19/0x50
eax: 000f0a10   ebx: ce2e8000   ecx: ce465d40   edx: d323bec0
esi: ce2e9dd8   edi: 00000000   ebp: 00000000   esp: ce2e9d54
ds: 007b   es: 007b   ss: 0068
Process ktxnmgrd:timed (pid: 2917, threadinfo=ce2e8000 task=d0e826b0)
Stack: ce465d40 ce2e9dd8 ce465d40 c01ff474 d323bec0 000f0a10 ce2e9d78 
0001a2ea
        00000000 00006890 cb379f78 00000005 cb379f40 c01d25a2 d323bec0 
cb379f78
        00000000 ce2e9dd8 d23f20c0 ce1211e0 00000a13 ce6b0000 d323bf10 
c01ff588
Call Trace:
  [<c01ff474>] apply_dset_to_commit_bmap+0x74/0xe0
  [<c01d25a2>] blocknr_set_iterator+0x52/0xe0
  [<c01ff588>] pre_commit_hook_bitmap+0xa8/0x1d0
  [<c01ff400>] apply_dset_to_commit_bmap+0x0/0xe0
  [<c01c3e35>] pre_commit_hook+0x5/0x10
  [<c01cc7b9>] reiser4_write_logs+0x29/0x2b0
  [<c010a3cc>] __down_failed+0x8/0xc
  [<c01d11ea>] finish_fq+0x4a/0x50
  [<c01d1258>] finish_all_fq+0x68/0xa0
  [<c01d12b4>] current_atom_finish_all_fq+0x24/0x70
  [<c01c4b1c>] commit_current_atom+0x12c/0x210
  [<c011d01e>] recalc_task_prio+0x8e/0x1b0
  [<c01c53ea>] try_commit_txnh+0x11a/0x1b0
  [<c01c54ad>] commit_txnh+0x2d/0xb0
  [<c01c46fa>] atom_should_commit+0x5a/0x60
  [<c01c4269>] txn_end+0x39/0x40
  [<c01c4f21>] commit_some_atoms+0xd1/0x170
  [<c01d1e86>] scan_mgr+0x36/0x70
  [<c01d1b2c>] ktxnmgrd+0x16c/0x230
  [<c01d19c0>] ktxnmgrd+0x0/0x230
  [<c0109289>] kernel_thread_helper+0x5/0xc

Code: 76 00 c3 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90 90 83 ec 0c 89 
5c 24 08 8b 54 24 10 8b 44 24 14 bb 00 e0 ff ff 21 e3 ff 43 14 <8b> 48 
2c 85 c9 74 1e 8b 43 08 ff 4b 14 a8 08 75 08 8b 5c 24 08
  <6>note: ktxnmgrd:timed[2917] exited with preempt_count 1


It then happened that several files have been corrupted in the move...
I give the differences between the original files and the corrupt ones, 
each time it looks like 4 bytes have been modified (I can mail the 
corrupt files if necessary):

<                       if ((!other->rb_lTÙ||
---
 >                       if ((!other->rb_left ||


 >       p->stats.bytes += skb->len;
<       p->stats.bytes += skbÐsÉn;
