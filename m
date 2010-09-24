From: Christophe Saout <christophe@saout.de>
Subject: another possible reiserfs xattr deadlock issue in 2.6.35
Date: Fri, 24 Sep 2010 12:32:51 +0200
Message-ID: <1285324371.4298.9.camel@leto.intern.saout.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saout.de; s=default;
	t=1285324367; bh=vJ58mdcSx5ia9CMN1GGwWQKt6HWbZvZL+UEPy+v4mjI=;
	h=Subject:From:Date:Message-ID;
	b=YVAl94p53ROT2lfY3plMP5rx69h99Lc5slCjKOC1V95SvgR9YNnHvsVwKX6BM2hws
	 xD03GQV586hgZGmkwtkq0oFZaSxv9kPYJKks33HE66U6ctqmEeErbBC0ajdcLOCxdm
	 f/VgrsVoSEO/S1vN4kRbwUoeBjbucriHLXr8Fddw=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hi,

I have tried updating the kernel on an old machine to a 2.6.35 based on.
The /home has a huge number of files with many ACLs.  This machine has
now repeatedly deadlocked.  An "echo t > /proc/sysrq-trigger" showed
that every time some processes got stuck somewhere in some reiserfs acl
-> xattr code path.  This happens almost instantly after starting an
ACL-enabled rsync (on a directory tree with ACLs) while having another
process read files with ACLs on them.

The kernel output after the deadlock is appended below.  Is there a way
I can help to resolve this issue as quickly as possible?

Thanks,
	Christophe

INFO: task cat:3993 blocked for more than 120 seconds.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
cat           D ffffffff81404940     0  3993   2971 0x00000000
 ffff8800007495b8 0000000000000246 0000000000000000 0000000000015280
 ffff880000749fd8 ffff880000749fd8 ffff880000749fd8 ffff880000749fd8
 ffff88000a60acd0 0000000000015280 0000000000015280 ffff880000749fd8
Call Trace:
 [<ffffffff813c2372>] mutex_lock_nested+0x182/0x3a0
 [<ffffffff811a38b5>] ? reiserfs_write_lock+0x35/0x50
 [<ffffffff81069230>] ? wake_bit_function+0x0/0x40
 [<ffffffff811a38b5>] reiserfs_write_lock+0x35/0x50
 [<ffffffff81195470>] search_by_key+0x290/0xf80
 [<ffffffff8107dfec>] ? lock_release+0xec/0x250
 [<ffffffff81201f3e>] ? do_raw_spin_unlock+0x5e/0xb0
 [<ffffffff811a38b5>] ? reiserfs_write_lock+0x35/0x50
 [<ffffffff810076dd>] ? xen_force_evtchn_callback+0xd/0x10
 [<ffffffff81007ec2>] ? check_events+0x12/0x20
 [<ffffffff811a38b5>] ? reiserfs_write_lock+0x35/0x50
 [<ffffffff8102cd55>] ? pvclock_clocksource_read+0x55/0xe0
 [<ffffffff810076dd>] ? xen_force_evtchn_callback+0xd/0x10
 [<ffffffff81182a8c>] reiserfs_read_locked_inode+0x7c/0x5c0
 [<ffffffff813c7fa5>] ? sub_preempt_count+0x95/0xd0
 [<ffffffff8118308b>] reiserfs_iget+0xbb/0xe0
 [<ffffffff8117f519>] reiserfs_lookup+0x109/0x160
 [<ffffffff81007ec2>] ? check_events+0x12/0x20
 [<ffffffff813c4303>] ? _raw_spin_unlock_irqrestore+0x53/0x80
 [<ffffffff81117ccd>] __lookup_hash+0xed/0x150
 [<ffffffff8111919e>] lookup_one_len+0xce/0x110
 [<ffffffff811a20f6>] open_xa_dir+0x126/0x230
 [<ffffffff811a43f7>] ? reiserfs_get_acl+0x77/0x420
 [<ffffffff81007ec2>] ? check_events+0x12/0x20
 [<ffffffff811a43f7>] ? reiserfs_get_acl+0x77/0x420
 [<ffffffff811a2228>] xattr_lookup+0x28/0x150
 [<ffffffff811a2ee1>] reiserfs_xattr_get+0x71/0x2f0
 [<ffffffff811a444e>] reiserfs_get_acl+0xce/0x420
 [<ffffffff810076dd>] ? xen_force_evtchn_callback+0xd/0x10
 [<ffffffff81007ec2>] ? check_events+0x12/0x20
 [<ffffffff811a1a44>] reiserfs_check_acl+0x24/0x90
 [<ffffffff81007ec2>] ? check_events+0x12/0x20
 [<ffffffff811173fb>] acl_permission_check+0x9b/0xb0
 [<ffffffff811174ae>] generic_permission+0x1e/0xb0
 [<ffffffff811a3524>] reiserfs_permission+0x34/0x40
 [<ffffffff811175a8>] inode_permission+0x68/0x80
 [<ffffffff8111a9d8>] may_open+0x98/0x140
 [<ffffffff8111ab3d>] do_last+0xbd/0x730
 [<ffffffff81201d06>] ? __raw_spin_lock_init+0x36/0x60
 [<ffffffff8111b39d>] do_filp_open+0x1ed/0x660
 [<ffffffff81007ec2>] ? check_events+0x12/0x20
 [<ffffffff81126dd6>] ? alloc_fd+0x36/0x130
 [<ffffffff810401b1>] ? get_parent_ip+0x11/0x50
 [<ffffffff813c7fa5>] ? sub_preempt_count+0x95/0xd0
 [<ffffffff81126e84>] ? alloc_fd+0xe4/0x130
 [<ffffffff8110d174>] do_sys_open+0x64/0x130
 [<ffffffff813c3742>] ? trace_hardirqs_on_thunk+0x3a/0x3f
 [<ffffffff8110d25b>] sys_open+0x1b/0x20
 [<ffffffff8100be02>] system_call_fastpath+0x16/0x1b
INFO: lockdep is turned off.
INFO: task rsync:4000 blocked for more than 120 seconds.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
rsync         D ffffffff81404940     0  4000   1835 0x00000000
 ffff880009599a48 0000000000000246 0000000000000000 0000000000015280
 ffff880009599fd8 ffff880009599fd8 ffff880009599fd8 ffff880009599fd8
 ffff88000a609de0 0000000000015280 0000000000015280 ffff880009599fd8
Call Trace:
 [<ffffffff813c2372>] mutex_lock_nested+0x182/0x3a0
 [<ffffffff811a3955>] ? reiserfs_write_lock_once+0x35/0x70
 [<ffffffff811229e0>] ? __d_lookup+0x0/0x1b0
 [<ffffffff811a3955>] reiserfs_write_lock_once+0x35/0x70
 [<ffffffff8117f494>] reiserfs_lookup+0x84/0x160
 [<ffffffff81007ec2>] ? check_events+0x12/0x20
 [<ffffffff81122678>] ? d_alloc+0x148/0x1f0
 [<ffffffff810401b1>] ? get_parent_ip+0x11/0x50
 [<ffffffff813c7fa5>] ? sub_preempt_count+0x95/0xd0
 [<ffffffff813c4360>] ? _raw_spin_unlock+0x30/0x60
 [<ffffffff81117b43>] do_lookup+0x1d3/0x270
 [<ffffffff81119a63>] link_path_walk+0x413/0xad0
 [<ffffffff813c7fa5>] ? sub_preempt_count+0x95/0xd0
 [<ffffffff8111a258>] path_walk+0x58/0xc0
 [<ffffffff8111a313>] do_path_lookup+0x53/0xa0
 [<ffffffff8111a773>] user_path_at+0x53/0xa0
 [<ffffffff810076dd>] ? xen_force_evtchn_callback+0xd/0x10
 [<ffffffff810e1d82>] ? might_fault+0x72/0xd0
 [<ffffffff810076dd>] ? xen_force_evtchn_callback+0xd/0x10
 [<ffffffff81007ec2>] ? check_events+0x12/0x20
 [<ffffffff810e1d82>] ? might_fault+0x72/0xd0
 [<ffffffff810076dd>] ? xen_force_evtchn_callback+0xd/0x10
 [<ffffffff81007ec2>] ? check_events+0x12/0x20
 [<ffffffff81111ca4>] vfs_fstatat+0x34/0x70
 [<ffffffff81111cf9>] vfs_lstat+0x19/0x20
 [<ffffffff811120ef>] sys_newlstat+0x1f/0x40
 [<ffffffff810e1dcb>] ? might_fault+0xbb/0xd0
 [<ffffffff813c3742>] ? trace_hardirqs_on_thunk+0x3a/0x3f
 [<ffffffff8100be02>] system_call_fastpath+0x16/0x1b
INFO: lockdep is turned off.
INFO: task rsync:4037 blocked for more than 120 seconds.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
rsync         D 0000000000000000     0  4037   4000 0x00000000
 ffff88000019bac8 0000000000000246 00000000ffffffff 0000000000015280
 ffff88000019bfd8 ffff88000019bfd8 ffff88000019bfd8 ffff88000019bfd8
 ffff880008db1de0 0000000000015280 0000000000015280 ffff88000019bfd8
Call Trace:
 [<ffffffff810401b1>] ? get_parent_ip+0x11/0x50
 [<ffffffff813c2372>] mutex_lock_nested+0x182/0x3a0
 [<ffffffff811a20b3>] ? open_xa_dir+0xe3/0x230
 [<ffffffff811a20b3>] open_xa_dir+0xe3/0x230
 [<ffffffff810076dd>] ? xen_force_evtchn_callback+0xd/0x10
 [<ffffffff811a2228>] xattr_lookup+0x28/0x150
 [<ffffffff811a2842>] reiserfs_xattr_set_handle+0x92/0x550
 [<ffffffff810076dd>] ? xen_force_evtchn_callback+0xd/0x10
 [<ffffffff810076dd>] ? xen_force_evtchn_callback+0xd/0x10
 [<ffffffff81007eaf>] ? xen_restore_fl_direct_end+0x0/0x1
 [<ffffffff811056df>] ? __kmalloc+0xbf/0x280
 [<ffffffff811a3ef0>] ? reiserfs_set_acl+0xe0/0x350
 [<ffffffff811a3fbd>] reiserfs_set_acl+0x1ad/0x350
 [<ffffffff811a4cfb>] reiserfs_acl_chmod+0x1cb/0x1f0
 [<ffffffff81186712>] reiserfs_setattr+0x262/0x370
 [<ffffffff810401b1>] ? get_parent_ip+0x11/0x50
 [<ffffffff8104eec1>] ? current_fs_time+0x11/0x50
 [<ffffffff81125e58>] notify_change+0x128/0x380
 [<ffffffff8110ccd2>] sys_fchmod+0xf2/0x130
 [<ffffffff8100be02>] system_call_fastpath+0x16/0x1b
INFO: lockdep is turned off.


