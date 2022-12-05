From: syzbot <syzbot+d43f346675e449548021@syzkaller.appspotmail.com>
Subject: Re: [syzbot] WARNING in journal_end
Date: Sun, 04 Dec 2022 23:50:43 -0800
Message-ID: <000000000000c84ac205ef0ff19f@google.com>
References: <00000000000043463e05ee9c4277@google.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <00000000000043463e05ee9c4277@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, axboe@kernel.dk, bvanassche@acm.org, damien.lemoal@opensource.wdc.com, jlayton@kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, song@kernel.org, syzkaller-bugs@googlegroups.com, willy@infradead.org, yi.zhang@huawei.com

syzbot has found a reproducer for the following issue on:

HEAD commit:    0ba09b173387 Revert "mm: align larger anonymous mappings o..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1779c10f880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2325e409a9a893e1
dashboard link: https://syzkaller.appspot.com/bug?extid=d43f346675e449548021
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13b00acb880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1396ef7b880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9758ec2c06f4/disk-0ba09b17.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/06781dbfd581/vmlinux-0ba09b17.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3d44a22d15fa/bzImage-0ba09b17.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/e9d1a791a8cb/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d43f346675e449548021@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 3658 at fs/reiserfs/journal.c:3395 journal_end+0x210/0x2d0
Modules linked in:
CPU: 0 PID: 3658 Comm: syz-executor289 Not tainted 6.1.0-rc7-syzkaller-00211-g0ba09b173387 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:journal_end+0x210/0x2d0 fs/reiserfs/journal.c:3395
Code: 89 f6 e8 a3 f5 b2 ff 48 b8 00 00 00 00 00 fc ff df 41 8a 04 07 84 c0 0f 85 a0 00 00 00 c7 03 00 00 00 00 eb 30 e8 a0 ce 5e ff <0f> 0b b8 fb ff ff ff eb 24 e8 92 ce 5e ff 4c 89 f7 31 f6 48 83 c4
RSP: 0018:ffffc90003cefa38 EFLAGS: 00010293
RAX: ffffffff822bcb90 RBX: 0000000000000000 RCX: ffff888019f31d40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90003cefaf4 R08: ffffffff822bca8b R09: ffffc90003cefae8
R10: fffff5200079df63 R11: 1ffff9200079df5d R12: ffff888019f32f18
R13: 1ffff110033e65e3 R14: ffffc90003cefae0 R15: 1ffff9200079df5e
FS:  00007f92d6306700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f92ce2e5718 CR3: 0000000028214000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 reiserfs_truncate_file+0x47c/0x790 fs/reiserfs/inode.c:2311
 reiserfs_setattr+0xc4d/0x11a0 fs/reiserfs/inode.c:3395
 notify_change+0xe38/0x10f0 fs/attr.c:420
 do_truncate+0x1fb/0x2e0 fs/open.c:65
 do_sys_ftruncate+0x2eb/0x380 fs/open.c:193
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f92d635b2b9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 31 16 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f92d63062f8 EFLAGS: 00000246 ORIG_RAX: 000000000000004d
RAX: ffffffffffffffda RBX: 00007f92d63e7540 RCX: 00007f92d635b2b9
RDX: 00007f92d635b2b9 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007f92d63ae2f8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0030656c69662f2e
R13: 7366726573696572 R14: 0031656c69662f2e R15: 00007f92d63e7548
 </TASK>

