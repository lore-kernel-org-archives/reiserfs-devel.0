From: Mike Benoit <mikeb@netnation.com>
Subject: Reiser4 oopses...
Date: Wed, 05 Nov 2003 09:21:46 -0800
Message-ID: <1068052906.12783.443.camel@mikeb.staff.netnation.com>
Reply-To: mikeb@netnation.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15990-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

While playing with pseudo files, doing things like creating "..uid" and
"..gid" files on a ext3 partition, then trying to copy them to a reiser4
partition, (using cp,mv, and tar) it seemed oopses were quite a common
occurance. 

Kernel Version: 2.6.0-test9 ... and latest Reiser4 snapshot.

Nov  3 16:00:04 fsbench kernel: Unable to handle kernel NULL pointer
dereference at virtual address 00000000
Nov  3 16:00:04 fsbench kernel:  printing eip:
Nov  3 16:00:04 fsbench kernel: 00000000
Nov  3 16:00:04 fsbench kernel: *pde = 00000000
Nov  3 16:00:04 fsbench kernel: Oops: 0000 [#1]
Nov  3 16:00:04 fsbench kernel: CPU:    0
Nov  3 16:00:04 fsbench kernel: EIP:    0060:[<00000000>]    Not tainted
Nov  3 16:00:04 fsbench kernel: EFLAGS: 00010282
Nov  3 16:00:04 fsbench kernel: EIP is at 0x0
Nov  3 16:00:04 fsbench kernel: eax: d1132c70   ebx: 00000020   ecx:
c0452570   edx: df78c6c0
Nov  3 16:00:04 fsbench kernel: esi: 00000000   edi: df78c6c0   ebp:
c0452570   esp: c5c77c34
Nov  3 16:00:04 fsbench kernel: ds: 007b   es: 007b   ss: 0068
Nov  3 16:00:04 fsbench kernel: Process mv (pid: 17933,
threadinfo=c5c76000 task=d3241360)
Nov  3 16:00:05 fsbench kernel: Stack: c0227301 d1132c70 c0452570
c0452200 c0453260 c0453260 df64c4d0 c3507130
Nov  3 16:00:05 fsbench kernel:        df78c6c0 d1132c70 c02274c7
c3507130 df5ae200 c3507130 df78c6c0 c022759e
Nov  3 16:00:05 fsbench kernel:        c3507130 df5ae200 c3507130
df78c6c0 00000000 0000000c c0453260 df64c4c0
Nov  3 16:00:05 fsbench kernel: Call Trace:
Nov  3 16:00:05 fsbench kernel:  [hashed_estimate_rename+145/560]
hashed_estimate_rename+0x91/0x230
Nov  3 16:00:05 fsbench kernel:  [<c0227301>]
hashed_estimate_rename+0x91/0x230
Nov  3 16:00:05 fsbench kernel:  [hashed_rename_estimate_and_grab+39/80]
hashed_rename_estimate_and_grab+0x27/0x50
Nov  3 16:00:05 fsbench kernel:  [<c02274c7>]
hashed_rename_estimate_and_grab+0x27/0x50
Nov  3 16:00:05 fsbench kernel:  [rename_hashed+174/1312]
rename_hashed+0xae/0x520
Nov  3 16:00:05 fsbench kernel:  [<c022759e>] rename_hashed+0xae/0x520
Nov  3 16:00:05 fsbench kernel:  [recalc_task_prio+180/496]
recalc_task_prio+0xb4/0x1f0
Nov  3 16:00:05 fsbench kernel:  [<c0113f64>]
recalc_task_prio+0xb4/0x1f0
Nov  3 16:00:05 fsbench kernel:  [buffered_rmqueue+158/272]
buffered_rmqueue+0x9e/0x110
Nov  3 16:00:05 fsbench kernel:  [<c013168e>]
buffered_rmqueue+0x9e/0x110
Nov  3 16:00:05 fsbench kernel:  [__alloc_pages+175/848]
__alloc_pages+0xaf/0x350
Nov  3 16:00:05 fsbench kernel:  [<c01317af>] __alloc_pages+0xaf/0x350
Nov  3 16:00:05 fsbench kernel:  [do_anonymous_page+242/416]
do_anonymous_page+0xf2/0x1a0
Nov  3 16:00:05 fsbench kernel:  [<c013a132>]
do_anonymous_page+0xf2/0x1a0
Nov  3 16:00:05 fsbench kernel:  [handle_mm_fault+240/352]
handle_mm_fault+0xf0/0x160
Nov  3 16:00:05 fsbench kernel:  [<c013a700>] handle_mm_fault+0xf0/0x160
Nov  3 16:00:05 fsbench kernel:  [do_page_fault+300/1314]
do_page_fault+0x12c/0x522
Nov  3 16:00:05 fsbench kernel:  [<c01130dc>] do_page_fault+0x12c/0x522
Nov  3 16:00:05 fsbench kernel:  [recalc_task_prio+180/496]
recalc_task_prio+0xb4/0x1f0
Nov  3 16:00:05 fsbench kernel:  [<c0113f64>]
recalc_task_prio+0xb4/0x1f0
Nov  3 16:00:05 fsbench kernel:  [txn_begin+29/48] txn_begin+0x1d/0x30
Nov  3 16:00:05 fsbench kernel:  [<c01f911d>] txn_begin+0x1d/0x30
Nov  3 16:00:05 fsbench kernel:  [init_context+181/240]
init_context+0xb5/0xf0
Nov  3 16:00:05 fsbench kernel:  [<c01f61e5>] init_context+0xb5/0xf0
Nov  3 16:00:05 fsbench kernel:  [reiser4_rename+212/256]
reiser4_rename+0xd4/0x100
Nov  3 16:00:05 fsbench kernel:  [<c020a7e4>] reiser4_rename+0xd4/0x100
Nov  3 16:00:05 fsbench kernel:  [vfs_rename_other+178/192]
vfs_rename_other+0xb2/0xc0
Nov  3 16:00:05 fsbench kernel:  [<c0155d22>] vfs_rename_other+0xb2/0xc0
Nov  3 16:00:05 fsbench kernel:  [vfs_rename+336/976]
vfs_rename+0x150/0x3d0
Nov  3 16:00:05 fsbench kernel:  [<c0155e80>] vfs_rename+0x150/0x3d0
Nov  3 16:00:05 fsbench kernel:  [sys_rename+498/560]
sys_rename+0x1f2/0x230
Nov  3 16:00:05 fsbench kernel:  [<c01562f2>] sys_rename+0x1f2/0x230
Nov  3 16:00:05 fsbench kernel:  [vfs_read+215/304] vfs_read+0xd7/0x130
Nov  3 16:00:05 fsbench kernel:  [<c0146fb7>] vfs_read+0xd7/0x130
Nov  3 16:00:05 fsbench kernel:  [sys_read+66/112] sys_read+0x42/0x70
Nov  3 16:00:05 fsbench kernel:  [<c0147242>] sys_read+0x42/0x70
Nov  3 16:00:05 fsbench kernel:  [syscall_call+7/11]
syscall_call+0x7/0xb
Nov  3 16:00:05 fsbench kernel:  [<c010aa8f>] syscall_call+0x7/0xb
Nov  3 16:00:05 fsbench kernel:
Nov  3 16:00:05 fsbench kernel: Code:  Bad EIP value.



Nov  3 16:18:30 fsbench kernel: Unable to handle kernel NULL pointer
dereference at virtual address 00000000
Nov  3 16:18:30 fsbench kernel:  printing eip:
Nov  3 16:18:30 fsbench kernel: 00000000
Nov  3 16:18:30 fsbench kernel: *pde = 00000000
Nov  3 16:18:30 fsbench kernel: Oops: 0000 [#1]
Nov  3 16:18:30 fsbench kernel: CPU:    0
Nov  3 16:18:30 fsbench kernel: EIP:    0060:[<00000000>]    Not tainted
Nov  3 16:18:30 fsbench kernel: EFLAGS: 00010296
Nov  3 16:18:30 fsbench kernel: EIP is at 0x0
Nov  3 16:18:30 fsbench kernel: eax: 0000000f   ebx: 0000000f   ecx:
c0210f40   edx: 00000000
Nov  3 16:18:30 fsbench kernel: esi: 00000000   edi: c0452570   ebp:
de96b130   esp: dd103e30
Nov  3 16:18:30 fsbench kernel: ds: 007b   es: 007b   ss: 0068
Nov  3 16:18:30 fsbench kernel: Process tar (pid: 1206,
threadinfo=dd102000 task=d81038c0)
Nov  3 16:18:30 fsbench kernel: Stack: c0228748 de96b130 0000000a
de96b130 d5f6b500 00000000 c0452570 c022882a
Nov  3 16:18:30 fsbench kernel:        de96b5b0 de96b130 dfcd519c
c103ad18 de96b5b0 de96b130 c0452570 d5f6b500
Nov  3 16:18:30 fsbench kernel:        c02288b4 de96b5b0 d5f6b500
de9f6ec0 d14e4400 00000002 d5bf4534 00000002
Nov  3 16:18:30 fsbench kernel: Call Trace:
Nov  3 16:18:30 fsbench kernel:  [common_estimate_unlink+56/128]
common_estimate_unlink+0x38/0x80
Nov  3 16:18:30 fsbench kernel:  [<c0228748>]
common_estimate_unlink+0x38/0x80
Nov  3 16:18:30 fsbench kernel:  [unlink_check_and_grab+154/240]
unlink_check_and_grab+0x9a/0xf0
Nov  3 16:18:30 fsbench kernel:  [<c022882a>]
unlink_check_and_grab+0x9a/0xf0
Nov  3 16:18:30 fsbench kernel:  [unlink_common+52/240]
unlink_common+0x34/0xf0
Nov  3 16:18:30 fsbench kernel:  [<c02288b4>] unlink_common+0x34/0xf0
Nov  3 16:18:30 fsbench kernel:  [txn_begin+29/48] txn_begin+0x1d/0x30
Nov  3 16:18:30 fsbench kernel:  [<c01f911d>] txn_begin+0x1d/0x30
Nov  3 16:18:30 fsbench kernel:  [init_context+181/240]
init_context+0xb5/0xf0
Nov  3 16:18:30 fsbench kernel:  [<c01f61e5>] init_context+0xb5/0xf0
Nov  3 16:18:30 fsbench kernel:  [unlink_file+129/144]
unlink_file+0x81/0x90
Nov  3 16:18:30 fsbench kernel:  [<c020adb1>] unlink_file+0x81/0x90
Nov  3 16:18:30 fsbench kernel:  [vfs_unlink+192/480]
vfs_unlink+0xc0/0x1e0
Nov  3 16:18:30 fsbench kernel:  [<c0155500>] vfs_unlink+0xc0/0x1e0
Nov  3 16:18:30 fsbench kernel:  [sys_unlink+235/320]
sys_unlink+0xeb/0x140
Nov  3 16:18:30 fsbench kernel:  [<c015570b>] sys_unlink+0xeb/0x140
Nov  3 16:18:30 fsbench kernel:  [syscall_call+7/11]
syscall_call+0x7/0xb
Nov  3 16:18:30 fsbench kernel:  [<c010aa8f>] syscall_call+0x7/0xb
Nov  3 16:18:30 fsbench kernel:
Nov  3 16:18:30 fsbench kernel: Code:  Bad EIP value.



-- 
Best Regards,
 
Mike Benoit
NetNation Communications Inc.
Systems Engineer
Tel: 604-684-6892 or 888-983-6600
 ---------------------------------------
 
 Disclaimer: Opinions expressed here are my own and not 
 necessarily those of my employer

