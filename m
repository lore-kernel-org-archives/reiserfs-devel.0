From: syzbot <syzbot+4152c2c2c9ad88fc6159@syzkaller.appspotmail.com>
Subject: [syzbot] [reiserfs?] [fat?] WARNING: locking bug in remove_wait_queue
Date: Sat, 10 Jun 2023 07:59:54 -0700
Message-ID: <000000000000f5371205fdc7bc44@google.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: brauner@kernel.org, linkinjeon@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, sj1557.seo@samsung.com, syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk

Hello,

syzbot found the following issue on:

HEAD commit:    715abedee4cd Add linux-next specific files for 20230515
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17aab2a5280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6a2745d066dda0ec
dashboard link: https://syzkaller.appspot.com/bug?extid=4152c2c2c9ad88fc6159
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1264910d280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10aa8a1d280000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d4d1d06b34b8/disk-715abede.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3ef33a86fdc8/vmlinux-715abede.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e0006b413ed1/bzImage-715abede.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/392115368f88/mount_1.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/98193504359c/mount_3.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4152c2c2c9ad88fc6159@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(1)
WARNING: CPU: 0 PID: 5003 at kernel/locking/lockdep.c:232 hlock_class kernel/locking/lockdep.c:232 [inline]
WARNING: CPU: 0 PID: 5003 at kernel/locking/lockdep.c:232 hlock_class kernel/locking/lockdep.c:221 [inline]
WARNING: CPU: 0 PID: 5003 at kernel/locking/lockdep.c:232 check_wait_context kernel/locking/lockdep.c:4751 [inline]
WARNING: CPU: 0 PID: 5003 at kernel/locking/lockdep.c:232 __lock_acquire+0x192f/0x5f30 kernel/locking/lockdep.c:5038
Modules linked in:
CPU: 0 PID: 5003 Comm: udevd Not tainted 6.4.0-rc2-next-20230515-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/25/2023
RIP: 0010:hlock_class kernel/locking/lockdep.c:232 [inline]
RIP: 0010:hlock_class kernel/locking/lockdep.c:221 [inline]
RIP: 0010:check_wait_context kernel/locking/lockdep.c:4751 [inline]
RIP: 0010:__lock_acquire+0x192f/0x5f30 kernel/locking/lockdep.c:5038
Code: 08 84 d2 0f 85 6b 3e 00 00 8b 0d c8 b2 15 0d 85 c9 0f 85 a3 f8 ff ff 48 c7 c6 60 74 4c 8a 48 c7 c7 20 68 4c 8a e8 81 57 e6 ff <0f> 0b e9 89 f8 ff ff c7 44 24 40 fe ff ff ff 41 be 01 00 00 00 c7
RSP: 0018:ffffc9000390fac0 EFLAGS: 00010086

RAX: 0000000000000000 RBX: 1ffff92000721f88 RCX: 0000000000000000
RDX: ffff88801377bb80 RSI: ffffffff814bd247 RDI: 0000000000000001
RBP: ffff88801377bb80 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 284e4f5f4e524157 R12: ffff888073d30c58
R13: 0000000000000b14 R14: ffff88801377c670 R15: ffff88801377c698
FS:  00007f75968b2c80(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff26751008 CR3: 000000001879b000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 lock_acquire.part.0+0x11c/0x370 kernel/locking/lockdep.c:5705
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x3d/0x60 kernel/locking/spinlock.c:162
 remove_wait_queue+0x21/0x180 kernel/sched/wait.c:54
 ep_remove_wait_queue+0x87/0x1e0 fs/eventpoll.c:559
 ep_unregister_pollwait fs/eventpoll.c:574 [inline]
 ep_clear_and_put+0x176/0x380 fs/eventpoll.c:803
 ep_eventpoll_release+0x45/0x60 fs/eventpoll.c:834
 __fput+0x27c/0xa90 fs/file_table.c:321
 task_work_run+0x16f/0x270 kernel/task_work.c:179
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:171 [inline]
 exit_to_user_mode_prepare+0x210/0x240 kernel/entry/common.c:204
 __syscall_exit_to_user_mode_work kernel/entry/common.c:286 [inline]
 syscall_exit_to_user_mode+0x1d/0x50 kernel/entry/common.c:297
 do_syscall_64+0x46/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f75965170a8
Code: 48 8b 05 83 9d 0d 00 64 c7 00 16 00 00 00 83 c8 ff 48 83 c4 20 5b c3 64 8b 04 25 18 00 00 00 85 c0 75 20 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 76 5b 48 8b 15 51 9d 0d 00 f7 d8 64 89 02 48 83
RSP: 002b:00007fff26750b28 EFLAGS: 00000246
 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 00007f75968b2ae0 RCX: 00007f75965170a8
RDX: 0000000000000080 RSI: 00007fff26750c58 RDI: 0000000000000004
RBP: 0000000000000000 R08: 0000000000000007 R09: 8f45ebd50ebdce3c
R10: 00000000ffffffff R11: 0000000000000246 R12: 0000000000000000
R13: 00007fff26750ba8 R14: 0000000000000001 R15: 000055b5d7e3a910
 </TASK>


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
