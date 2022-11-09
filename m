From: syzbot <syzbot+95cb07e3840546a4827b@syzkaller.appspotmail.com>
Subject: [syzbot] possible deadlock in filename_create
Date: Wed, 09 Nov 2022 09:02:56 -0800
Message-ID: <000000000000cc15ee05ed0ca085@google.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com

Hello,

syzbot found the following issue on:

HEAD commit:    f141df371335 Merge tag 'audit-pr-20221107' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11802789880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=771b06c41e08f95b
dashboard link: https://syzkaller.appspot.com/bug?extid=95cb07e3840546a4827b
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/25bd3ddd1720/disk-f141df37.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e2a12f518443/vmlinux-f141df37.xz
kernel image: https://storage.googleapis.com/syzbot-assets/09ba7134ea9d/bzImage-f141df37.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+95cb07e3840546a4827b@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.1.0-rc4-syzkaller-00015-gf141df371335 #0 Not tainted
------------------------------------------------------
syz-executor.3/25735 is trying to acquire lock:
ffff88807a8a8090 (&sbi->lock){+.+.}-{3:3}, at: reiserfs_write_lock+0x77/0xd0 fs/reiserfs/lock.c:27

but task is already holding lock:
ffff8880361c0980 (&type->i_mutex_dir_key#19/1){+.+.}-{3:3}, at: inode_lock_nested include/linux/fs.h:791 [inline]
ffff8880361c0980 (&type->i_mutex_dir_key#19/1){+.+.}-{3:3}, at: filename_create+0x22a/0x4f0 fs/namei.c:3806

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&type->i_mutex_dir_key#19/1){+.+.}-{3:3}:
       lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
       down_write_nested+0xa2/0x280 kernel/locking/rwsem.c:1672
       inode_lock_nested include/linux/fs.h:791 [inline]
       filename_create+0x22a/0x4f0 fs/namei.c:3806
       do_symlinkat+0xe4/0x600 fs/namei.c:4419
       __do_sys_symlinkat fs/namei.c:4446 [inline]
       __se_sys_symlinkat fs/namei.c:4443 [inline]
       __x64_sys_symlinkat+0x95/0xa0 fs/namei.c:4443
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #1 (sb_writers#28){.+.+}-{0:0}:
       lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
       percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
       __sb_start_write include/linux/fs.h:1826 [inline]
       sb_start_write+0x4d/0x1a0 include/linux/fs.h:1901
       mnt_want_write_file+0x5a/0x1f0 fs/namespace.c:437
       reiserfs_ioctl+0x16e/0x340 fs/reiserfs/ioctl.c:103
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:870 [inline]
       __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:856
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #0 (&sbi->lock){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3097 [inline]
       check_prevs_add kernel/locking/lockdep.c:3216 [inline]
       validate_chain+0x1898/0x6ae0 kernel/locking/lockdep.c:3831
       __lock_acquire+0x1292/0x1f60 kernel/locking/lockdep.c:5055
       lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
       __mutex_lock_common+0x1bd/0x26e0 kernel/locking/mutex.c:603
       __mutex_lock kernel/locking/mutex.c:747 [inline]
       mutex_lock_nested+0x17/0x20 kernel/locking/mutex.c:799
       reiserfs_write_lock+0x77/0xd0 fs/reiserfs/lock.c:27
       reiserfs_lookup+0x147/0x490 fs/reiserfs/namei.c:364
       __lookup_hash+0x115/0x240 fs/namei.c:1601
       filename_create+0x25f/0x4f0 fs/namei.c:3807
       do_symlinkat+0xe4/0x600 fs/namei.c:4419
       __do_sys_symlinkat fs/namei.c:4446 [inline]
       __se_sys_symlinkat fs/namei.c:4443 [inline]
       __x64_sys_symlinkat+0x95/0xa0 fs/namei.c:4443
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

other info that might help us debug this:

Chain exists of:
  &sbi->lock --> sb_writers#28 --> &type->i_mutex_dir_key#19/1

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&type->i_mutex_dir_key#19/1);
                               lock(sb_writers#28);
                               lock(&type->i_mutex_dir_key#19/1);
  lock(&sbi->lock);

 *** DEADLOCK ***

2 locks held by syz-executor.3/25735:
 #0: ffff888075a1e460 (sb_writers#28){.+.+}-{0:0}, at: mnt_want_write+0x3b/0x80 fs/namespace.c:393
 #1: ffff8880361c0980 (&type->i_mutex_dir_key#19/1){+.+.}-{3:3}, at: inode_lock_nested include/linux/fs.h:791 [inline]
 #1: ffff8880361c0980 (&type->i_mutex_dir_key#19/1){+.+.}-{3:3}, at: filename_create+0x22a/0x4f0 fs/namei.c:3806

stack backtrace:
CPU: 0 PID: 25735 Comm: syz-executor.3 Not tainted 6.1.0-rc4-syzkaller-00015-gf141df371335 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x28e lib/dump_stack.c:106
 check_noncircular+0x2cc/0x390 kernel/locking/lockdep.c:2177
 check_prev_add kernel/locking/lockdep.c:3097 [inline]
 check_prevs_add kernel/locking/lockdep.c:3216 [inline]
 validate_chain+0x1898/0x6ae0 kernel/locking/lockdep.c:3831
 __lock_acquire+0x1292/0x1f60 kernel/locking/lockdep.c:5055
 lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
 __mutex_lock_common+0x1bd/0x26e0 kernel/locking/mutex.c:603
 __mutex_lock kernel/locking/mutex.c:747 [inline]
 mutex_lock_nested+0x17/0x20 kernel/locking/mutex.c:799
 reiserfs_write_lock+0x77/0xd0 fs/reiserfs/lock.c:27
 reiserfs_lookup+0x147/0x490 fs/reiserfs/namei.c:364
 __lookup_hash+0x115/0x240 fs/namei.c:1601
 filename_create+0x25f/0x4f0 fs/namei.c:3807
 do_symlinkat+0xe4/0x600 fs/namei.c:4419
 __do_sys_symlinkat fs/namei.c:4446 [inline]
 __se_sys_symlinkat fs/namei.c:4443 [inline]
 __x64_sys_symlinkat+0x95/0xa0 fs/namei.c:4443
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fb4f468b639
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb4f399c168 EFLAGS: 00000246 ORIG_RAX: 000000000000010a
RAX: ffffffffffffffda RBX: 00007fb4f47ac2c0 RCX: 00007fb4f468b639
RDX: 0000000020000980 RSI: 0000000000000007 RDI: 00000000200001c0
RBP: 00007fb4f46e67e1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffc2217a09f R14: 00007fb4f399c300 R15: 0000000000022000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
