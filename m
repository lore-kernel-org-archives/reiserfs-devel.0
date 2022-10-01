From: syzbot <syzbot+5e385bfa7d505b075d9f@syzkaller.appspotmail.com>
Subject: [syzbot] possible deadlock in do_journal_begin_r
Date: Sat, 01 Oct 2022 06:48:39 -0700
Message-ID: <00000000000025378505e9f95e4e@google.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bvanassche@acm.org, damien.lemoal@opensource.wdc.com, jlayton@kernel.org, linux-kernel@vger.kernel.org, neilb@suse.de, reiserfs-devel@vger.kernel.org, song@kernel.org, syzkaller-bugs@googlegroups.com, willy@infradead.org

Hello,

syzbot found the following issue on:

HEAD commit:    c194837ebb57 Merge branch 'for-next/core', remote-tracking..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1593ce6c880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=15a770deac0c935a
dashboard link: https://syzkaller.appspot.com/bug?extid=5e385bfa7d505b075d9f
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=122b7298880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10565740880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8d8ae425e7fa/disk-c194837e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c540d501ebe7/vmlinux-c194837e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5e385bfa7d505b075d9f@syzkaller.appspotmail.com

REISERFS warning (device loop0): jdm-20006 create_privroot: xattrs/ACLs enabled and couldn't find/create .reiserfs_priv. Failing mount.
======================================================
WARNING: possible circular locking dependency detected
6.0.0-rc6-syzkaller-17742-gc194837ebb57 #0 Not tainted
------------------------------------------------------
syz-executor305/3030 is trying to acquire lock:
ffff8000126e50f0 (&journal->j_mutex){+.+.}-{3:3}, at: reiserfs_mutex_lock_safe fs/reiserfs/reiserfs.h:814 [inline]
ffff8000126e50f0 (&journal->j_mutex){+.+.}-{3:3}, at: lock_journal fs/reiserfs/journal.c:534 [inline]
ffff8000126e50f0 (&journal->j_mutex){+.+.}-{3:3}, at: do_journal_begin_r+0x148/0x598 fs/reiserfs/journal.c:3046

but task is already holding lock:
ffff0000cb639460 (sb_writers#8){.+.+}-{0:0}, at: mnt_want_write_file+0x28/0xd8 fs/namespace.c:437

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (sb_writers#8){.+.+}-{0:0}:
       percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
       __sb_start_write include/linux/fs.h:1826 [inline]
       sb_start_write+0x78/0x1e4 include/linux/fs.h:1901
       mnt_want_write_file+0x28/0xd8 fs/namespace.c:437
       reiserfs_ioctl+0x118/0x2a0 fs/reiserfs/ioctl.c:103
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:870 [inline]
       __se_sys_ioctl fs/ioctl.c:856 [inline]
       __arm64_sys_ioctl+0xd0/0x140 fs/ioctl.c:856
       __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
       invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
       el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
       do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
       el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:636
       el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
       el0t_64_sync+0x18c/0x190

-> #1 (&sbi->lock){+.+.}-{3:3}:
       __mutex_lock_common+0xd4/0xca8 kernel/locking/mutex.c:603
       __mutex_lock kernel/locking/mutex.c:747 [inline]
       mutex_lock_nested+0x38/0x44 kernel/locking/mutex.c:799
       reiserfs_write_lock_nested+0x44/0x68 fs/reiserfs/lock.c:78
       reiserfs_mutex_lock_safe fs/reiserfs/reiserfs.h:815 [inline]
       lock_journal fs/reiserfs/journal.c:534 [inline]
       do_journal_begin_r+0x154/0x598 fs/reiserfs/journal.c:3046
       journal_begin+0x90/0x190 fs/reiserfs/journal.c:3254
       reiserfs_remount+0x5e4/0x788 fs/reiserfs/super.c:1559
       legacy_reconfigure+0x68/0x7c fs/fs_context.c:633
       reconfigure_super+0x1b0/0x33c fs/super.c:934
       do_remount fs/namespace.c:2702 [inline]
       path_mount+0x7e4/0x914 fs/namespace.c:3362
       do_mount fs/namespace.c:3383 [inline]
       __do_sys_mount fs/namespace.c:3591 [inline]
       __se_sys_mount fs/namespace.c:3568 [inline]
       __arm64_sys_mount+0x2c4/0x3c4 fs/namespace.c:3568
       __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
       invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
       el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
       do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
       el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:636
       el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
       el0t_64_sync+0x18c/0x190

-> #0 (&journal->j_mutex){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3095 [inline]
       check_prevs_add kernel/locking/lockdep.c:3214 [inline]
       validate_chain kernel/locking/lockdep.c:3829 [inline]
       __lock_acquire+0x1530/0x30a4 kernel/locking/lockdep.c:5053
       lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5666
       __mutex_lock_common+0xd4/0xca8 kernel/locking/mutex.c:603
       __mutex_lock kernel/locking/mutex.c:747 [inline]
       mutex_lock_nested+0x38/0x44 kernel/locking/mutex.c:799
       reiserfs_mutex_lock_safe fs/reiserfs/reiserfs.h:814 [inline]
       lock_journal fs/reiserfs/journal.c:534 [inline]
       do_journal_begin_r+0x148/0x598 fs/reiserfs/journal.c:3046
       journal_begin+0x90/0x190 fs/reiserfs/journal.c:3254
       reiserfs_dirty_inode+0x6c/0x108 fs/reiserfs/super.c:710
       __mark_inode_dirty+0x74/0x348 fs/fs-writeback.c:2381
       mark_inode_dirty include/linux/fs.h:2462 [inline]
       reiserfs_ioctl+0x270/0x2a0 fs/reiserfs/ioctl.c:111
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:870 [inline]
       __se_sys_ioctl fs/ioctl.c:856 [inline]
       __arm64_sys_ioctl+0xd0/0x140 fs/ioctl.c:856
       __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
       invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
       el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
       do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
       el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:636
       el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
       el0t_64_sync+0x18c/0x190

other info that might help us debug this:

Chain exists of:
  &journal->j_mutex --> &sbi->lock --> sb_writers#8

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(sb_writers#8);
                               lock(&sbi->lock);
                               lock(sb_writers#8);
  lock(&journal->j_mutex);

 *** DEADLOCK ***

1 lock held by syz-executor305/3030:
 #0: ffff0000cb639460 (sb_writers#8){.+.+}-{0:0}, at: mnt_want_write_file+0x28/0xd8 fs/namespace.c:437

stack backtrace:
CPU: 1 PID: 3030 Comm: syz-executor305 Not tainted 6.0.0-rc6-syzkaller-17742-gc194837ebb57 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2022
Call trace:
 dump_backtrace+0x1c4/0x1f0 arch/arm64/kernel/stacktrace.c:156
 show_stack+0x2c/0x54 arch/arm64/kernel/stacktrace.c:163
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x104/0x16c lib/dump_stack.c:106
 dump_stack+0x1c/0x58 lib/dump_stack.c:113
 print_circular_bug+0x2c4/0x2c8 kernel/locking/lockdep.c:2053
 check_noncircular+0x14c/0x154 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3095 [inline]
 check_prevs_add kernel/locking/lockdep.c:3214 [inline]
 validate_chain kernel/locking/lockdep.c:3829 [inline]
 __lock_acquire+0x1530/0x30a4 kernel/locking/lockdep.c:5053
 lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5666
 __mutex_lock_common+0xd4/0xca8 kernel/locking/mutex.c:603
 __mutex_lock kernel/locking/mutex.c:747 [inline]
 mutex_lock_nested+0x38/0x44 kernel/locking/mutex.c:799
 reiserfs_mutex_lock_safe fs/reiserfs/reiserfs.h:814 [inline]
 lock_journal fs/reiserfs/journal.c:534 [inline]
 do_journal_begin_r+0x148/0x598 fs/reiserfs/journal.c:3046
 journal_begin+0x90/0x190 fs/reiserfs/journal.c:3254
 reiserfs_dirty_inode+0x6c/0x108 fs/reiserfs/super.c:710
 __mark_inode_dirty+0x74/0x348 fs/fs-writeback.c:2381
 mark_inode_dirty include/linux/fs.h:2462 [inline]
 reiserfs_ioctl+0x270/0x2a0 fs/reiserfs/ioctl.c:111
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __arm64_sys_ioctl+0xd0/0x140 fs/ioctl.c:856
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:636
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
 el0t_64_sync+0x18c/0x190


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
