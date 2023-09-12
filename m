From: Sanan Hasanov <Sanan.Hasanov@ucf.edu>
Subject: kernel BUG in do_journal_end
Date: Tue, 12 Sep 2023 23:03:14 +0000
Message-ID: <BL0PR11MB310674FAB1189B6D9CB0B50DE1EEA@BL0PR11MB3106.namprd11.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucf.onmicrosoft.com;
 s=selector2-ucf-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAitSeQGvbuf+HrTf9hE/ELjNYbu1vPGpfZVJNvfNfc=;
 b=edUlFH8XOTQtmftnnLRjPybcy/ArNWZ9CXFY2PRyH73ZpFQBdwnhNsx+jo9QxU4GBkJguRNbdH/Y7ldjwkaal8Pep3DzVqBQkwVSVdGtiLi4KOMx2n8XW6aRXoITUAk0V2+Ogy9K3+mVmdaG19ni+t6yWSXrOJ/l+uZwVg3fsJg=
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "syzkaller@googlegroups.com" <syzkaller@googlegroups.com>, "contact@pgazz.com" <contact@pgazz.com>

Good day, dear maintainers,=0A=
=0A=
We found a bug using a modified kernel configuration file used by syzbot.=
=0A=
=0A=
We enhanced the coverage of the configuration file using our tool, klocaliz=
er.=0A=
=0A=
Kernel Branch: 6.3.0-next-20230426=0A=
Kernel Config: https://drive.google.com/file/d/1-RlEeQ2ltqar6W2DptSUYYmrZzB=
jjcQI/view?usp=3Dsharing=0A=
Reproducer: https://drive.google.com/file/d/1xezJdfFWY-Q0Djh6x5LQqNq-9c_ru8=
c5/view?usp=3Dsharing=0A=
Thank you!=0A=
=0A=
Best regards,=0A=
Sanan Hasanov=0A=
=0A=
------------[ cut here ]------------=0A=
kernel BUG at fs/reiserfs/prints.c:390!=0A=
invalid opcode: 0000 [#1] PREEMPT SMP KASAN=0A=
CPU: 1 PID: 7350 Comm: syz-executor.2 Not tainted 6.3.0-next-20230426 #1=0A=
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/=
2014=0A=
RIP: 0010:__reiserfs_panic+0xf7/0x150 fs/reiserfs/prints.c:390=0A=
Code: 68 ff 4d 89 e8 4c 89 f1 4c 89 e2 48 8d b3 a8 06 00 00 49 c7 c1 60 5f =
92 90 48 c7 c7 00 55 e1 89 e8 0e 51 4d ff e8 89 ff 68 ff <0f> 0b 49 c7 c6 a=
0 53 e1 89 4d 89 f4 eb c5 e8 76 ff 68 ff 4d 85 e4=0A=
RSP: 0018:ffffc9000f1ffa00 EFLAGS: 00010293=0A=
RAX: 0000000000000000 RBX: ffff8880ad15a000 RCX: 0000000000000000=0A=
RDX: ffff88810cfd9dc0 RSI: ffffffff821888a7 RDI: 0000000000000005=0A=
RBP: ffffc9000f1ffad0 R08: 0000000000000005 R09: 0000000000000000=0A=
R10: 0000000080000000 R11: 00000000014aed60 R12: ffffffff89e1bee0=0A=
R13: ffffffff89e1c700 R14: ffffffff89e15360 R15: 0000000000007b1a=0A=
FS:  0000555557345980(0000) GS:ffff888119c80000(0000) knlGS:000000000000000=
0=0A=
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
CR2: 000055555734edc8 CR3: 000000005f30a000 CR4: 0000000000350ee0=0A=
Call Trace:=0A=
 <TASK>=0A=
 do_journal_end+0x3f22/0x4ad0 fs/reiserfs/journal.c:4149=0A=
 reiserfs_sync_fs+0xfc/0x130 fs/reiserfs/super.c:78=0A=
 sync_filesystem fs/sync.c:56 [inline]=0A=
 sync_filesystem+0x109/0x290 fs/sync.c:30=0A=
 generic_shutdown_super+0x74/0x480 fs/super.c:473=0A=
 kill_block_super+0xa1/0x100 fs/super.c:1407=0A=
 deactivate_locked_super+0x98/0x160 fs/super.c:331=0A=
 deactivate_super+0xb1/0xd0 fs/super.c:362=0A=
 cleanup_mnt+0x2ae/0x3d0 fs/namespace.c:1177=0A=
 task_work_run+0x168/0x260 kernel/task_work.c:179=0A=
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]=0A=
 exit_to_user_mode_loop kernel/entry/common.c:171 [inline]=0A=
 exit_to_user_mode_prepare+0x210/0x240 kernel/entry/common.c:204=0A=
 __syscall_exit_to_user_mode_work kernel/entry/common.c:286 [inline]=0A=
 syscall_exit_to_user_mode+0x1d/0x50 kernel/entry/common.c:297=0A=
 do_syscall_64+0x46/0x80 arch/x86/entry/common.c:86=0A=
 entry_SYSCALL_64_after_hwframe+0x63/0xcd=0A=
RIP: 0033:0x7fdd95e9173b=0A=
Code: ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 90 f3 0f 1e fa 31 f6 e9 05 =
00 00 00 0f 1f 44 00 00 f3 0f 1e fa b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48=0A=
RSP: 002b:00007ffcbd482888 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6=0A=
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007fdd95e9173b=0A=
RDX: 00007fdd95e28c20 RSI: 000000000000000a RDI: 00007ffcbd482950=0A=
RBP: 00007ffcbd482950 R08: 00007fdd95efb54e R09: 00007ffcbd482710=0A=
R10: 00000000fffffffb R11: 0000000000000246 R12: 00007fdd95efb527=0A=
R13: 00007ffcbd4839f0 R14: 0000555557346d90 R15: 0000000000000032=0A=
 </TASK>=0A=
Modules linked in:=0A=
---[ end trace 0000000000000000 ]---=0A=
RIP: 0010:__reiserfs_panic+0xf7/0x150 fs/reiserfs/prints.c:390=0A=
Code: 68 ff 4d 89 e8 4c 89 f1 4c 89 e2 48 8d b3 a8 06 00 00 49 c7 c1 60 5f =
92 90 48 c7 c7 00 55 e1 89 e8 0e 51 4d ff e8 89 ff 68 ff <0f> 0b 49 c7 c6 a=
0 53 e1 89 4d 89 f4 eb c5 e8 76 ff 68 ff 4d 85 e4=0A=
RSP: 0018:ffffc9000f1ffa00 EFLAGS: 00010293=0A=
RAX: 0000000000000000 RBX: ffff8880ad15a000 RCX: 0000000000000000=0A=
RDX: ffff88810cfd9dc0 RSI: ffffffff821888a7 RDI: 0000000000000005=0A=
RBP: ffffc9000f1ffad0 R08: 0000000000000005 R09: 0000000000000000=0A=
R10: 0000000080000000 R11: 00000000014aed60 R12: ffffffff89e1bee0=0A=
R13: ffffffff89e1c700 R14: ffffffff89e15360 R15: 0000000000007b1a=0A=
FS:  0000555557345980(0000) GS:ffff888119c80000(0000) knlGS:000000000000000=
0=0A=
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
CR2: 00007fe5d85c0000 CR3: 000000005f30a000 CR4: 0000000000350ee0=0A=
