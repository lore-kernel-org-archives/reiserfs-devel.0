From: syzbot <syzbot+845cd8e5c47f2a125683@syzkaller.appspotmail.com>
Subject: Re: [syzbot] KASAN: null-ptr-deref Read in do_journal_end (2)
Date: Wed, 30 Nov 2022 07:59:36 -0800
Message-ID: <000000000000f7610f05eeb23004@google.com>
References: <00000000000034d16305e50acc8d@google.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <00000000000034d16305e50acc8d@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, axboe@kernel.dk, bvanassche@acm.org, damien.lemoal@opensource.wdc.com, jack@suse.cz, jlayton@kernel.org, linux-kernel@vger.kernel.org, neilb@suse.de, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, willy@infradead.org, yi.zhang@huawei.com

syzbot has found a reproducer for the following issue on:

HEAD commit:    01f856ae6d0c Merge tag 'net-6.1-rc8-2' of git://git.kernel..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1461a85b880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2325e409a9a893e1
dashboard link: https://syzkaller.appspot.com/bug?extid=845cd8e5c47f2a125683
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=109da15b880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11639425880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5428d604f56a/disk-01f856ae.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e953d290d254/vmlinux-01f856ae.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3f71610a4904/bzImage-01f856ae.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/2ea230629718/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+845cd8e5c47f2a125683@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: null-ptr-deref in instrument_atomic_read include/linux/instrumented.h:72 [inline]
BUG: KASAN: null-ptr-deref in _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
BUG: KASAN: null-ptr-deref in set_buffer_uptodate include/linux/buffer_head.h:148 [inline]
BUG: KASAN: null-ptr-deref in do_journal_end+0x155f/0x4a30 fs/reiserfs/journal.c:4081
Read of size 8 at addr 0000000000000000 by task syz-executor603/3632

CPU: 0 PID: 3632 Comm: syz-executor603 Not tainted 6.1.0-rc7-syzkaller-00101-g01f856ae6d0c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x28e lib/dump_stack.c:106
 print_report+0xed/0x1f0 mm/kasan/report.c:398
 kasan_report+0xcd/0x100 mm/kasan/report.c:495
 kasan_check_range+0x2a7/0x2e0 mm/kasan/generic.c:189
 instrument_atomic_read include/linux/instrumented.h:72 [inline]
 _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
 set_buffer_uptodate include/linux/buffer_head.h:148 [inline]
 do_journal_end+0x155f/0x4a30 fs/reiserfs/journal.c:4081
 reiserfs_sync_fs+0xbb/0x130 fs/reiserfs/super.c:78
 sync_filesystem+0xe8/0x220 fs/sync.c:56
 generic_shutdown_super+0x6b/0x310 fs/super.c:474
 kill_block_super+0x79/0xd0 fs/super.c:1428
 deactivate_locked_super+0xa7/0xf0 fs/super.c:332
 cleanup_mnt+0x494/0x520 fs/namespace.c:1186
 task_work_run+0x243/0x300 kernel/task_work.c:179
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0x664/0x2070 kernel/exit.c:820
 do_group_exit+0x1fd/0x2b0 kernel/exit.c:950
 __do_sys_exit_group kernel/exit.c:961 [inline]
 __se_sys_exit_group kernel/exit.c:959 [inline]
 __x64_sys_exit_group+0x3b/0x40 kernel/exit.c:959
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f745e18eac9
Code: Unable to access opcode bytes at 0x7f745e18ea9f.
RSP: 002b:00007ffd72d53218 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f745e205350 RCX: 00007f745e18eac9
RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000001
RBP: 0000000000000001 R08: ffffffffffffffc0 R09: 00007f745e1ffe40
R10: 000080001d00c0d0 R11: 0000000000000246 R12: 00007f745e205350
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
 </TASK>
==================================================================

