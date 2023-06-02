From: syzbot <syzbot+5444b0cc48f4e1939d72@syzkaller.appspotmail.com>
Subject: [syzbot] [reiserfs?] general protection fault in account_system_index_time
 (3)
Date: Thu, 01 Jun 2023 20:38:48 -0700
Message-ID: <00000000000073d32c05fd1d4a6b@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: frederic@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@kernel.org, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tglx@linutronix.de

Hello,

syzbot found the following issue on:

HEAD commit:    715abedee4cd Add linux-next specific files for 20230515
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12ec7b85280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6a2745d066dda0ec
dashboard link: https://syzkaller.appspot.com/bug?extid=5444b0cc48f4e1939d72
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17956736280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=175da599280000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d4d1d06b34b8/disk-715abede.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3ef33a86fdc8/vmlinux-715abede.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e0006b413ed1/bzImage-715abede.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/525b69f4318a/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5444b0cc48f4e1939d72@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0040000033: 0000 [#1] PREEMPT SMP KASAN
KASAN: probably user-memory-access in range [0x0000000200000198-0x000000020000019f]
CPU: 1 PID: 262216 Comm:  Not tainted 6.4.0-rc2-next-20230515-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/25/2023
RIP: 0010:get_running_cputimer include/linux/sched/cputime.h:79 [inline]
RIP: 0010:account_group_system_time include/linux/sched/cputime.h:143 [inline]
RIP: 0010:account_system_index_time+0x86/0x2f0 kernel/sched/cputime.c:173
Code: 63 02 00 00 48 8b 9d f8 08 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bb 98 01 00 00 4c 8d b3 38 01 00 00 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e e7 01 00 00 8b 83 98 01 00 00
RSP: 0018:ffffc900001e0da0 EFLAGS: 00010006
RAX: dffffc0000000000 RBX: 0000000200000001 RCX: 1ffffffff1827d41
RDX: 0000000040000033 RSI: 000000000097fff6 RDI: 0000000200000199
RBP: ffff88807638bb80 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: ffffffffffffffff R12: 000000000097fff6
R13: 0000000000000002 R14: 0000000200000139 R15: ffffffff817770e0
FS:  00005555556c1300(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffca0efd000 CR3: 0000000019395000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 update_process_times+0x26/0x1a0 kernel/time/timer.c:2069
 tick_sched_handle+0x8e/0x170 kernel/time/tick-sched.c:243
 tick_sched_timer+0xee/0x110 kernel/time/tick-sched.c:1481
 __run_hrtimer kernel/time/hrtimer.c:1685 [inline]
 __hrtimer_run_queues+0x1c0/0xa30 kernel/time/hrtimer.c:1749
 hrtimer_interrupt+0x320/0x7b0 kernel/time/hrtimer.c:1811
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1095 [inline]
 __sysvec_apic_timer_interrupt+0x14a/0x430 arch/x86/kernel/apic/apic.c:1112
 sysvec_apic_timer_interrupt+0x92/0xc0 arch/x86/kernel/apic/apic.c:1106
 </IRQ>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:get_running_cputimer include/linux/sched/cputime.h:79 [inline]
RIP: 0010:account_group_system_time include/linux/sched/cputime.h:143 [inline]
RIP: 0010:account_system_index_time+0x86/0x2f0 kernel/sched/cputime.c:173
Code: 63 02 00 00 48 8b 9d f8 08 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bb 98 01 00 00 4c 8d b3 38 01 00 00 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e e7 01 00 00 8b 83 98 01 00 00
RSP: 0018:ffffc900001e0da0 EFLAGS: 00010006
RAX: dffffc0000000000 RBX: 0000000200000001 RCX: 1ffffffff1827d41
RDX: 0000000040000033 RSI: 000000000097fff6 RDI: 0000000200000199
RBP: ffff88807638bb80 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: ffffffffffffffff R12: 000000000097fff6
R13: 0000000000000002 R14: 0000000200000139 R15: ffffffff817770e0
FS:  00005555556c1300(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffca0efd000 CR3: 0000000019395000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	63 02                	movsxd (%rdx),%eax
   2:	00 00                	add    %al,(%rax)
   4:	48 8b 9d f8 08 00 00 	mov    0x8f8(%rbp),%rbx
   b:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  12:	fc ff df
  15:	48 8d bb 98 01 00 00 	lea    0x198(%rbx),%rdi
  1c:	4c 8d b3 38 01 00 00 	lea    0x138(%rbx),%r14
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax <-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	74 08                	je     0x3a
  32:	3c 03                	cmp    $0x3,%al
  34:	0f 8e e7 01 00 00    	jle    0x221
  3a:	8b 83 98 01 00 00    	mov    0x198(%rbx),%eax


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
