From: syzbot <syzbot+c319bb5b1014113a92cf@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in reiserfs_dirty_inode
Date: Wed, 12 Jul 2023 19:00:55 -0700
Message-ID: <000000000000e6a390060054b370@google.com>
References: <000000000000cfe6f305ee84ff1f@google.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <000000000000cfe6f305ee84ff1f@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com

syzbot has found a reproducer for the following issue on:

HEAD commit:    e40939bbfc68 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1070f4bca80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c84f463eb74eab24
dashboard link: https://syzkaller.appspot.com/bug?extid=c319bb5b1014113a92cf
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=112c37e2a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12e4c2daa80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/257596b75aaf/disk-e40939bb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9c75b8d61081/vmlinux-e40939bb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8f0233129f4f/Image-e40939bb.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/05e314af739c/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c319bb5b1014113a92cf@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.4.0-rc7-syzkaller-ge40939bbfc68 #0 Not tainted
------------------------------------------------------
syz-executor365/5984 is trying to acquire lock:
ffff0000db0d17d8 (&mm->mmap_lock
){++++}-{3:3}, at: __might_fault+0x9c/0x124 mm/memory.c:5731

but task is already holding lock:
ffff0000c2367090 (&sbi->lock){+.+.}-{3:3}, at: reiserfs_write_lock+0x7c/0xe8 fs/reiserfs/lock.c:27

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&sbi->lock){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:603
       __mutex_lock kernel/locking/mutex.c:747 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:799
       reiserfs_write_lock+0x7c/0xe8 fs/reiserfs/lock.c:27
       reiserfs_dirty_inode+0xe4/0x204 fs/reiserfs/super.c:704
       __mark_inode_dirty+0x2b0/0x10f4 fs/fs-writeback.c:2424
       generic_update_time fs/inode.c:1859 [inline]
       inode_update_time fs/inode.c:1872 [inline]
       touch_atime+0x5d8/0x8d4 fs/inode.c:1944
       file_accessed include/linux/fs.h:2198 [inline]
       generic_file_mmap+0xb0/0x11c mm/filemap.c:3606
       call_mmap include/linux/fs.h:1873 [inline]
       mmap_region+0xc00/0x1aa4 mm/mmap.c:2649
       do_mmap+0xa00/0x1108 mm/mmap.c:1394
       vm_mmap_pgoff+0x198/0x3b8 mm/util.c:543
       ksys_mmap_pgoff+0x3c8/0x5b0 mm/mmap.c:1440
       __do_sys_mmap arch/arm64/kernel/sys.c:28 [inline]
       __se_sys_mmap arch/arm64/kernel/sys.c:21 [inline]
       __arm64_sys_mmap+0xf8/0x110 arch/arm64/kernel/sys.c:21
       __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
       invoke_syscall+0x98/0x2c0 arch/arm64/kernel/syscall.c:52
       el0_svc_common+0x138/0x244 arch/arm64/kernel/syscall.c:142
       do_el0_svc+0x64/0x198 arch/arm64/kernel/syscall.c:191
       el0_svc+0x4c/0x160 arch/arm64/kernel/entry-common.c:647
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:665
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:591

-> #0 (&mm->mmap_lock){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3113 [inline]
       check_prevs_add kernel/locking/lockdep.c:3232 [inline]
       validate_chain kernel/locking/lockdep.c:3847 [inline]
       __lock_acquire+0x3308/0x7604 kernel/locking/lockdep.c:5088
       lock_acquire+0x23c/0x71c kernel/locking/lockdep.c:5705
       __might_fault+0xc4/0x124 mm/memory.c:5732
       reiserfs_ioctl+0x10c/0x454 fs/reiserfs/ioctl.c:96
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:870 [inline]
       __se_sys_ioctl fs/ioctl.c:856 [inline]
       __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:856
       __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
       invoke_syscall+0x98/0x2c0 arch/arm64/kernel/syscall.c:52
       el0_svc_common+0x138/0x244 arch/arm64/kernel/syscall.c:142
       do_el0_svc+0x64/0x198 arch/arm64/kernel/syscall.c:191
       el0_svc+0x4c/0x160 arch/arm64/kernel/entry-common.c:647
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:665
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:591

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&sbi->lock);
                               lock(&mm->mmap_lock);
                               lock(&sbi->lock);
  rlock(&mm->mmap_lock);

 *** DEADLOCK ***

1 lock held by syz-executor365/5984:
 #0: ffff0000c2367090 (&sbi->lock){+.+.}-{3:3}, at: reiserfs_write_lock+0x7c/0xe8 fs/reiserfs/lock.c:27

stack backtrace:
CPU: 1 PID: 5984 Comm: syz-executor365 Not tainted 6.4.0-rc7-syzkaller-ge40939bbfc68 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/27/2023
Call trace:
 dump_backtrace+0x1b8/0x1e4 arch/arm64/kernel/stacktrace.c:233
 show_stack+0x2c/0x44 arch/arm64/kernel/stacktrace.c:240
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd0/0x124 lib/dump_stack.c:106
 dump_stack+0x1c/0x28 lib/dump_stack.c:113
 print_circular_bug+0x150/0x1b8 kernel/locking/lockdep.c:2066
 check_noncircular+0x2cc/0x378 kernel/locking/lockdep.c:2188
 check_prev_add kernel/locking/lockdep.c:3113 [inline]
 check_prevs_add kernel/locking/lockdep.c:3232 [inline]
 validate_chain kernel/locking/lockdep.c:3847 [inline]
 __lock_acquire+0x3308/0x7604 kernel/locking/lockdep.c:5088
 lock_acquire+0x23c/0x71c kernel/locking/lockdep.c:5705
 __might_fault+0xc4/0x124 mm/memory.c:5732
 reiserfs_ioctl+0x10c/0x454 fs/reiserfs/ioctl.c:96
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:856
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall+0x98/0x2c0 arch/arm64/kernel/syscall.c:52
 el0_svc_common+0x138/0x244 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x64/0x198 arch/arm64/kernel/syscall.c:191
 el0_svc+0x4c/0x160 arch/arm64/kernel/entry-common.c:647
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:665
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:591


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
