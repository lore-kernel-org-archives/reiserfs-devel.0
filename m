From: Bret Towe <btowe@gbis.com>
Subject: raid0 and rfs4
Date: Mon, 12 Jan 2004 21:00:28 -0800
Message-ID: <1073970028.20855.18.camel@www.vox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16469-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

i recently tried reiser4 on a raid0 setup and well it didnt go so well
:\

what i got from dmesg was the following
dmesg was full up when i finally looked of the raid_make_request
all of those lines looked about the same cept the last 2 numbers

raid0_make_request bug: can't convert block across chunks or bigger than
512k 356200 124
raid0_make_request bug: can't convert block across chunks or bigger than 512k 357352 124
raid0_make_request bug: can't convert block across chunks or bigger than 512k 358344 60
Unable to handle kernel NULL pointer dereference at virtual address 00000004
 printing eip:
c021706f
*pde = 00000000
Oops: 0000 [#1]
CPU:    0
EIP:    0060:[<c021706f>]    Not tainted
EFLAGS: 00010246
EIP is at reiser4_status_write+0xef/0x250
eax: 00000000   ebx: d3f4e000   ecx: c0425640   edx: 13fc5000
esi: 00000000   edi: 00000000   ebp: d3f4fe04   esp: d3f4fdd8
ds: 007b   es: 007b   ss: 0068
Process ktxnmgrd:run (pid: 993, threadinfo=d3f4e000 task=d4761310)
Stack: d1aa7ed8 d1aa7ba4 d5dd9580 d3f5ce00 00000000 00000000 00000002 00000000
       d3f5ce00 d3f5de80 00000000 d3f4e000 c0211034 00000002 00000000 00000000
       00000000 c03dd57e d42e24c0 d42e24c0 c020a965 d42e24c0 d3f4fe50 d3f5de80
Call Trace:
 [<c0211034>] reiser4_handle_error+0x44/0xe0
 [<c020a965>] finish_all_fq+0xa5/0xb0
 [<c020a993>] current_atom_finish_all_fq+0x23/0x70
 [<c01fc74e>] current_atom_complete_writes+0xe/0x30
 [<c01fc885>] commit_current_atom+0x115/0x250
 [<c010b8ba>] apic_timer_interrupt+0x1a/0x20
 [<c01fd33a>] try_commit_txnh+0x12a/0x1c0
 [<c01fd408>] commit_txnh+0x38/0xd0
 [<c01fbbdf>] txn_end+0x3f/0x50
 [<c01fcdd4>] commit_some_atoms+0x184/0x210
 [<c020b736>] scan_mgr+0x36/0x57
 [<c020b388>] ktxnmgrd+0x1a8/0x290
 [<c020b1e0>] ktxnmgrd+0x0/0x290
 [<c0108c29>] kernel_thread_helper+0x5/0xc

Code: 8b 48 04 31 c0 89 82 3c 00 00 c0 89 8a 38 00 00 c0 8b 45 00
 <6>note: ktxnmgrd:run[993] exited with preempt_count 1


the system is a dual pentium pro 200mhz (feel the speed! ;)
the devices md is using is 2 network block devices which are 2 hard drive partitions
on another computer
i have tested the same setup before its working on a solo system with reiserfs3
and the ppro also works fine with reiser3
im using kernel 2.6.1 only extra item it has is the 12-23 'all' patch
if you need more info or somethin do tell



