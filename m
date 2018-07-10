From: syzbot <syzbot+66d2c2155ece8b6d3fc0@syzkaller.appspotmail.com>
Subject: kernel BUG at fs/reiserfs/lock.c:LINE!
Date: Tue, 10 Jul 2018 12:25:02 -0700
Message-ID: <0000000000002bd65e0570aa16f2@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org, pombredanne@nexb.com, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tglx@linutronix.de

Hello,

syzbot found the following crash on:

HEAD commit:    3951bd9fe3e2 Add linux-next specific files for 20180710
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1495050c400000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b6e8479ba596271a
dashboard link: https://syzkaller.appspot.com/bug?extid=66d2c2155ece8b6d3fc0
compiler:       gcc (GCC) 8.0.1 20180413 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+66d2c2155ece8b6d3fc0@syzkaller.appspotmail.com

R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000014
R13: 0000000000000000 R14: 00000000004d3fb8 R15: 0000000000000048
REISERFS warning (device loop2):  reiserfs_fill_super: Cannot allocate  
memory for journal device name
loop6: rw=1, want=32877, limit=112
------------[ cut here ]------------
kernel BUG at fs/reiserfs/lock.c:44!
invalid opcode: 0000 [#1] SMP KASAN
CPU: 1 PID: 12313 Comm: syz-executor2 Not tainted 4.18.0-rc4-next-20180710+  
#3
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:reiserfs_write_unlock+0xeb/0x110 fs/reiserfs/lock.c:44
Code: 5d c3 e8 88 42 76 ff 48 8d 7b 28 48 c7 83 a8 00 00 00 00 00 00 00 e8  
c4 b8 96 05 e8 6f 42 76 ff 5b 41 5c 5d c3 e8 65 42 76 ff <0f> 0b e8 fe c2  
b4 ff eb a1 e8 17 c3 b4 ff e9 33 ff ff ff e8 0d c3
RSP: 0018:ffff8801956e77e0 EFLAGS: 00010246
RAX: 0000000000040000 RBX: ffff8801ba2e16c0 RCX: ffffc9000b8a9000
RDX: 0000000000040000 RSI: ffffffff8206390b RDI: ffff8801ba2e1768
RBP: ffff8801956e77f0 R08: ffffed0032adcf25 R09: 0000000000000000
R10: fffffbfff11f1224 R11: ffffffff88f89123 R12: ffff8801956e7ac8
R13: ffffed0032adcf3d R14: ffffed0032adcf2d R15: ffff8801c9f20800
FS:  00007f1c6ce16700(0000) GS:ffff8801daf00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000004c2643 CR3: 00000001cda4f000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  reiserfs_fill_super+0xfac/0x3930 fs/reiserfs/super.c:2222
  mount_bdev+0x314/0x3e0 fs/super.c:1344
  get_super_block+0x3c/0x50 fs/reiserfs/super.c:2608
  legacy_get_tree+0x118/0x440 fs/fs_context.c:659
  vfs_get_tree+0x1cb/0x5c0 fs/super.c:1743
  do_new_mount fs/namespace.c:2567 [inline]
  do_mount+0x6c1/0x1fb0 fs/namespace.c:2889
  ksys_mount+0x12d/0x140 fs/namespace.c:3105
  __do_sys_mount fs/namespace.c:3119 [inline]
  __se_sys_mount fs/namespace.c:3116 [inline]
  __x64_sys_mount+0xbe/0x150 fs/namespace.c:3116
  do_syscall_64+0x1b9/0x820 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45885a
Code: b8 a6 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 dd 8f fb ff c3 66 2e 0f  
1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 ba 8f fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007f1c6ce15a88 EFLAGS: 00000206 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f1c6ce15b30 RCX: 000000000045885a
RDX: 00007f1c6ce15ad0 RSI: 0000000020000140 RDI: 00007f1c6ce15af0
RBP: 0000000020000140 R08: 00007f1c6ce15b30 R09: 00007f1c6ce15ad0
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000014
R13: 0000000000000000 R14: 00000000004d3fb8 R15: 0000000000000048
Modules linked in:
Dumping ftrace buffer:
    (ftrace buffer empty)
---[ end trace 3d34f3558efcb4e7 ]---
RIP: 0010:reiserfs_write_unlock+0xeb/0x110 fs/reiserfs/lock.c:44
Code: 5d c3 e8 88 42 76 ff 48 8d 7b 28 48 c7 83 a8 00 00 00 00 00 00 00 e8  
c4 b8 96 05 e8 6f 42 76 ff 5b 41 5c 5d c3 e8 65 42 76 ff <0f> 0b e8 fe c2  
b4 ff eb a1 e8 17 c3 b4 ff e9 33 ff ff ff e8 0d c3
RSP: 0018:ffff8801956e77e0 EFLAGS: 00010246
RAX: 0000000000040000 RBX: ffff8801ba2e16c0 RCX: ffffc9000b8a9000
RDX: 0000000000040000 RSI: ffffffff8206390b RDI: ffff8801ba2e1768
RBP: ffff8801956e77f0 R08: ffffed0032adcf25 R09: 0000000000000000
R10: fffffbfff11f1224 R11: ffffffff88f89123 R12: ffff8801956e7ac8
R13: ffffed0032adcf3d R14: ffffed0032adcf2d R15: ffff8801c9f20800
FS:  00007f1c6ce16700(0000) GS:ffff8801daf00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000004c2643 CR3: 00000001cda4f000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#bug-status-tracking for how to communicate with  
syzbot.
