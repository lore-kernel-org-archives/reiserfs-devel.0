From: Eric Sesterhenn <snakebyte@gmx.de>
Subject: Softlookup using corrupted reiserfs image
Date: Wed, 21 Jan 2009 09:53:22 +0100
Message-ID: <20090121085322.GA24169@alice>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: robm@fastmail.fm, carlos@fisica.ufpr.br

hi,

when i mount the corrupted image at
http://www.cccmz.de/~snakebyte/reiserfs.25.img.bck.bz2
I get the following softlookup warning:

[ 2163.590033] BUG: soft lockup - CPU#0 stuck for 61s! [mount:6198]
[ 2163.590033] Modules linked in:
[ 2163.590033] irq event stamp: 132955914
[ 2163.590033] hardirqs last  enabled at (132955913): [<c0102fc4>]
restore_nocheck_notrace+0x0/0xe
[ 2163.590033] hardirqs last disabled at (132955914): [<c01034e5>]
common_interrupt+0x25/0x34
[ 2163.590033] softirqs last  enabled at (132953852): [<c0127ec0>]
__do_softirq+0xee/0xf6
[ 2163.590033] softirqs last disabled at (132953847): [<c0104172>]
do_softirq+0x67/0xc1
[ 2163.590033] 
[ 2163.590033] Pid: 6198, comm: mount Not tainted
(2.6.29-rc2-00021-gd84d31c #216) System Name
[ 2163.590033] EIP: 0060:[<c01e6622>] EFLAGS: 00010246 CPU: 0
[ 2163.590033] EIP is at search_by_entry_key+0xef/0x21c
[ 2163.590033] EAX: c1df87a4 EBX: 000000f2 ECX: 00000b60 EDX: 00000000
[ 2163.590033] ESI: cc306ccc EDI: 000000b6 EBP: cc306c20 ESP: cc306bec
[ 2163.590033]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
[ 2163.590033] CR0: 8005003b CR2: c1df9304 CR3: 0c34b000 CR4: 000006d0
[ 2163.590033] DR0: c0122f08 DR1: 00000000 DR2: 00000000 DR3: 00000000
[ 2163.590033] DR6: ffff0ff0 DR7: 00000400
[ 2163.590033] Call Trace:
[ 2163.590033]  [<c01e67ba>] reiserfs_find_entry+0x6b/0x2c6
[ 2163.590033]  [<c01e6e9b>] reiserfs_lookup+0x60/0x10f
[ 2163.590033]  [<c01415cc>] ? debug_check_no_locks_freed+0xfb/0x115
[ 2163.590033]  [<c0107084>] ? native_sched_clock+0x41/0x68
[ 2163.590033]  [<c019d599>] ? d_alloc+0x183/0x18e
[ 2163.590033]  [<c01964f6>] __lookup_hash+0xcd/0xe8
[ 2163.590033]  [<c01978ab>] lookup_one_len+0x3d/0x44
[ 2163.590033]  [<c020421c>] reiserfs_xattr_init+0x83/0x1d4
[ 2163.590033]  [<c01f382d>] reiserfs_fill_super+0xac5/0xc58
[ 2163.590033]  [<c0142c7a>] ? __lock_acquire+0x6a8/0x6fe
[ 2163.590033]  [<c04f831f>] ? snprintf+0x1b/0x1d
[ 2163.590033]  [<c01919c5>] get_sb_bdev+0xf1/0x13f
[ 2163.590033]  [<c0178896>] ? kstrdup+0x2f/0x51
[ 2163.590033]  [<c01f0c8b>] get_super_block+0x18/0x1a
[ 2163.590033]  [<c01f2d68>] ? reiserfs_fill_super+0x0/0xc58
[ 2163.590033]  [<c019159c>] vfs_kern_mount+0x40/0x7b
[ 2163.590033]  [<c0191625>] do_kern_mount+0x37/0xbf
[ 2163.590033]  [<c01a2cb0>] do_mount+0x5cc/0x609
[ 2163.590033]  [<c07b087b>] ? lock_kernel+0x19/0x8c
[ 2163.590033]  [<c01a2d43>] ? sys_mount+0x56/0xa0
[ 2163.590033]  [<c01a2d56>] sys_mount+0x69/0xa0
[ 2163.590033]  [<c0102ea1>] sysenter_do_call+0x12/0x31
[ 2229.088033] BUG: soft lockup - CPU#0 stuck for 61s! [mount:6198]
[ 2229.088033] Modules linked in:
[ 2229.088033] irq event stamp: 268594020
[ 2229.088033] hardirqs last  enabled at (268594019): [<c0102fc4>]
restore_nocheck_notrace+0x0/0xe
[ 2229.088033] hardirqs last disabled at (268594020): [<c01034e5>]
common_interrupt+0x25/0x34
[ 2229.088033] softirqs last  enabled at (268591960): [<c0127ec0>]
__do_softirq+0xee/0xf6
[ 2229.088033] softirqs last disabled at (268591955): [<c0104172>]
do_softirq+0x67/0xc1
[ 2229.088033] 
[ 2229.088033] Pid: 6198, comm: mount Not tainted
(2.6.29-rc2-00021-gd84d31c #216) System Name
[ 2229.088033] EIP: 0060:[<c01e6622>] EFLAGS: 00010246 CPU: 0
[ 2229.088033] EIP is at search_by_entry_key+0xef/0x21c
[ 2229.088033] EAX: c1df87a4 EBX: 000000f2 ECX: 00000b60 EDX: 00000000
[ 2229.088033] ESI: cc306ccc EDI: 000000b6 EBP: cc306c20 ESP: cc306bec
[ 2229.088033]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
[ 2229.088033] CR0: 8005003b CR2: c1df9304 CR3: 0c34b000 CR4: 000006d0
[ 2229.088033] DR0: c0122f08 DR1: 00000000 DR2: 00000000 DR3: 00000000
[ 2229.088033] DR6: ffff0ff0 DR7: 00000400
[ 2229.088033] Call Trace:
[ 2229.088033]  [<c01e67ba>] reiserfs_find_entry+0x6b/0x2c6
[ 2229.088033]  [<c01e6e9b>] reiserfs_lookup+0x60/0x10f
[ 2229.088033]  [<c01415cc>] ? debug_check_no_locks_freed+0xfb/0x115
[ 2229.088033]  [<c0107084>] ? native_sched_clock+0x41/0x68
[ 2229.088033]  [<c019d599>] ? d_alloc+0x183/0x18e
[ 2229.088033]  [<c01964f6>] __lookup_hash+0xcd/0xe8
[ 2229.088033]  [<c01978ab>] lookup_one_len+0x3d/0x44
[ 2229.088033]  [<c020421c>] reiserfs_xattr_init+0x83/0x1d4
[ 2229.088033]  [<c01f382d>] reiserfs_fill_super+0xac5/0xc58
[ 2229.088033]  [<c0142c7a>] ? __lock_acquire+0x6a8/0x6fe
[ 2229.088033]  [<c04f831f>] ? snprintf+0x1b/0x1d
[ 2229.088033]  [<c01919c5>] get_sb_bdev+0xf1/0x13f
[ 2229.088033]  [<c0178896>] ? kstrdup+0x2f/0x51
[ 2229.088033]  [<c01f0c8b>] get_super_block+0x18/0x1a
[ 2229.088033]  [<c01f2d68>] ? reiserfs_fill_super+0x0/0xc58
[ 2229.088033]  [<c019159c>] vfs_kern_mount+0x40/0x7b
[ 2229.088033]  [<c0191625>] do_kern_mount+0x37/0xbf
[ 2229.088033]  [<c01a2cb0>] do_mount+0x5cc/0x609
[ 2229.088033]  [<c07b087b>] ? lock_kernel+0x19/0x8c
[ 2229.088033]  [<c01a2d43>] ? sys_mount+0x56/0xa0
[ 2229.088033]  [<c01a2d56>] sys_mount+0x69/0xa0
[ 2229.088033]  [<c0102ea1>] sysenter_do_call+0x12/0x31

(gdb) l *(search_by_entry_key+0xef)
0xc01e6622 is in search_by_entry_key (fs/reiserfs/namei.c:37).
32		lbound = 0;
33		rbound = I_ENTRY_COUNT(ih) - 1;
34	
35		for (j = (rbound + lbound) / 2; lbound <= rbound;
36		     j = (rbound + lbound) / 2) {
37			if (off < deh_offset(deh + j)) {
38				rbound = j - 1;
39				continue;
40			}
41			if (off > deh_offset(deh + j)) {
(gdb) l *(reiserfs_find_entry+0x6b)
0xc01e67ba is in reiserfs_find_entry (fs/reiserfs/namei.c:299).
294		make_cpu_key(&key_to_search, dir,
295			     get_third_component(dir->i_sb, name,
namelen),
296			     TYPE_DIRENTRY, 3);
297	
298		while (1) {
299			retval =
300			    search_by_entry_key(dir->i_sb,
&key_to_search,
301						path_to_entry, de);
302			if (retval == IO_ERROR) {
303				reiserfs_warning(dir->i_sb, "zam-7001:
io error in %s",

Greetings, Eric
