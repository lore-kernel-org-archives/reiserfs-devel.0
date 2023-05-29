From: syzbot <syzbot+ada12d2d935bbc82aa7f@syzkaller.appspotmail.com>
Subject: [syzbot] [reiserfs?] possible deadlock in do_unlinkat
Date: Mon, 29 May 2023 10:13:52 -0700
Message-ID: <000000000000fa007305fcd83579@google.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com

Hello,

syzbot found the following issue on:

HEAD commit:    933174ae28ba Merge tag 'spi-fix-v6.4-rc3' of git://git.ker..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=167d464d280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d8067683055e3f5
dashboard link: https://syzkaller.appspot.com/bug?extid=ada12d2d935bbc82aa7f
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=106e6d19280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13cf84e5280000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/189d556c105e/disk-933174ae.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/498458304963/vmlinux-933174ae.xz
kernel image: https://storage.googleapis.com/syzbot-assets/68bcd9d7c04c/bzImage-933174ae.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/a89e85025777/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ada12d2d935bbc82aa7f@syzkaller.appspotmail.com

REISERFS (device loop0): Created .reiserfs_priv - reserved for xattr storage.
======================================================
WARNING: possible circular locking dependency detected
6.4.0-rc3-syzkaller-00032-g933174ae28ba #0 Not tainted
------------------------------------------------------
syz-executor392/4995 is trying to acquire lock:
ffff888022309090 (&sbi->lock){+.+.}-{3:3}, at: reiserfs_write_lock+0x7a/0xd0 fs/reiserfs/lock.c:27

but task is already holding lock:
ffff8880759902e0 (&type->i_mutex_dir_key#6/1){+.+.}-{3:3}, at: inode_lock_nested include/linux/fs.h:810 [inline]
ffff8880759902e0 (&type->i_mutex_dir_key#6/1){+.+.}-{3:3}, at: do_unlinkat+0x26a/0x950 fs/namei.c:4378

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&type->i_mutex_dir_key#6/1){+.+.}-{3:3}:
       lock_acquire+0x1e3/0x520 kernel/locking/lockdep.c:5691
       down_write_nested+0x3d/0x50 kernel/locking/rwsem.c:1689
       inode_lock_nested include/linux/fs.h:810 [inline]
       do_unlinkat+0x26a/0x950 fs/namei.c:4378
       __do_sys_unlinkat fs/namei.c:4436 [inline]
       __se_sys_unlinkat fs/namei.c:4429 [inline]
       __x64_sys_unlinkat+0xce/0xf0 fs/namei.c:4429
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #1 (sb_writers#9){.+.+}-{0:0}:
       lock_acquire+0x1e3/0x520 kernel/locking/lockdep.c:5691
       percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
       __sb_start_write include/linux/fs.h:1494 [inline]
       sb_start_write+0x4d/0x1c0 include/linux/fs.h:1569
       mnt_want_write_file+0x5e/0x1f0 fs/namespace.c:438
       reiserfs_ioctl+0x174/0x340 fs/reiserfs/ioctl.c:103
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:870 [inline]
       __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:856
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #0 (&sbi->lock){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3108 [inline]
       check_prevs_add kernel/locking/lockdep.c:3227 [inline]
       validate_chain+0x166b/0x58e0 kernel/locking/lockdep.c:3842
       __lock_acquire+0x1295/0x2000 kernel/locking/lockdep.c:5074
       lock_acquire+0x1e3/0x520 kernel/locking/lockdep.c:5691
       __mutex_lock_common+0x1d8/0x2530 kernel/locking/mutex.c:603
       __mutex_lock kernel/locking/mutex.c:747 [inline]
       mutex_lock_nested+0x1b/0x20 kernel/locking/mutex.c:799
       reiserfs_write_lock+0x7a/0xd0 fs/reiserfs/lock.c:27
       reiserfs_lookup+0x162/0x580 fs/reiserfs/namei.c:364
       lookup_one_qstr_excl+0x11b/0x250 fs/namei.c:1605
       do_unlinkat+0x298/0x950 fs/namei.c:4379
       __do_sys_unlinkat fs/namei.c:4436 [inline]
       __se_sys_unlinkat fs/namei.c:4429 [inline]
       __x64_sys_unlinkat+0xce/0xf0 fs/namei.c:4429
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

other info that might help us debug this:

Chain exists of:
  &sbi->lock --> sb_writers#9 --> &type->i_mutex_dir_key#6/1

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&type->i_mutex_dir_key#6/1);
                               lock(sb_writers#9);
                               lock(&type->i_mutex_dir_key#6/1);
  lock(&sbi->lock);

 *** DEADLOCK ***

2 locks held by syz-executor392/4995:
 #0: ffff88807d18c460 (sb_writers#9){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:394
 #1: ffff8880759902e0 (&type->i_mutex_dir_key#6/1){+.+.}-{3:3}, at: inode_lock_nested include/linux/fs.h:810 [inline]
 #1: ffff8880759902e0 (&type->i_mutex_dir_key#6/1){+.+.}-{3:3}, at: do_unlinkat+0x26a/0x950 fs/namei.c:4378

stack backtrace:
CPU: 0 PID: 4995 Comm: syz-executor392 Not tainted 6.4.0-rc3-syzkaller-00032-g933174ae28ba #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/16/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
 check_noncircular+0x2fe/0x3b0 kernel/locking/lockdep.c:2188
 check_prev_add kernel/locking/lockdep.c:3108 [inline]
 check_prevs_add kernel/locking/lockdep.c:3227 [inline]
 validate_chain+0x166b/0x58e0 kernel/locking/lockdep.c:3842
 __lock_acquire+0x1295/0x2000 kernel/locking/lockdep.c:5074
 lock_acquire+0x1e3/0x520 kernel/locking/lockdep.c:5691
 __mutex_lock_common+0x1d8/0x2530 kernel/locking/mutex.c:603
 __mutex_lock kernel/locking/mutex.c:747 [inline]
 mutex_lock_nested+0x1b/0x20 kernel/locking/mutex.c:799
 reiserfs_write_lock+0x7a/0xd0 fs/reiserfs/lock.c:27
 reiserfs_lookup+0x162/0x580 fs/reiserfs/namei.c:364
 lookup_one_qstr_excl+0x11b/0x250 fs/namei.c:1605
 do_unlinkat+0x298/0x950 fs/namei.c:4379
 __do_sys_unlinkat fs/namei.c:4436 [inline]
 __se_sys_unlinkat fs/namei.c:4429 [inline]
 __x64_sys_unlinkat+0xce/0xf0 fs/namei.c:4429
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7ffa0fa838f9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
