From: Palash Oswal <oswalpalash@gmail.com>
Subject: KFENCE: invalid read in leaf_paste_entries
Date: Wed, 12 Apr 2023 21:49:46 -0700
Message-ID: <CAGyP=7cJAUf=LTEPW9QLgd-6bJDMKCuqssPH=yyuKLE5=CKB_w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681361397; x=1683953397;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qxfJCrU5YVF9Evn+9KJ8ErZ046XRLXEj9u/cbdxTNrE=;
        b=bVtS+MxJg6ti0qu414OEYKGt960niKv7REhOQrsejpeHtWW7EyZ7TsrGLOYWwMucu/
         ley1VgYIzgaz8by+ZMQn56pinoO5aVNs6nMP0Jt3clVsDA6Plbgi2BVS8zwd2Pje4pCX
         T6ECaRgFg+a3E/IFYkfQtjjMsWi40aLJMc0Gc9YJW+q/k2qVNq++yw37I/MSPhD4AeW9
         OtqxiQ3rDQYEboVI6fbFNWHtSnJvwgF1RaWb92XQkYedMaSNz6nVApXWt/OCY658NWUB
         9Ja+K4V4s/rVemO+HZ33GIxhAmgkHj5JrfxbqEC/1IaSK98iOcb1tD8JpCqj0+WOy+vH
         /bWA==
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>

Hello,
I found the following issue using syzkaller with enriched corpus on:
HEAD commit : 0bcc4025550403ae28d2984bddacafbca0a2f112
git tree: linux

C Reproducer : https://gist.github.com/oswalpalash/c2589138be95e1c5da52f908=
ad80c041
Kernel .config :
https://gist.github.com/oswalpalash/d9580b0bfce202b37445fa5fd426e41f

syz-repro :
syz_mount_image$reiserfs(&(0x7f0000000000),
&(0x7f0000000100)=3D'./file0\x00', 0x4000000, 0x5,
&(0x7f0000000200)=3D[{&(0x7f0000010000)=3D"0040000068020000973d000012000000=
00000000843d00000004000073564d38840300001e000000000000000010cc0302000100526=
54973457233467300000001000000020001000200853d000000000100000012312312123312=
33123112341341241273797a6b616c6c65720000000000000001001e003bc1655f004eed00"=
,
0x80, 0x10000},
{&(0x7f0000010100)=3D"000000000000000000000000010000000300"/32, 0x20,
0x100c0}, {&(0x7f0000011200)=3D"0000000000000000000000001200000000000000843=
d00000004000073564d38840300001e00"/64,
0x40, 0x3d96000},
{&(0x7f0000011300)=3D"010002005c0f00000000000000000000000000000000000001000=
00002000000000000000000000000002c00d40f0100010000000200000001000000f4010000=
02003000a40f00"/96,
0x60, 0x3d97000},
{&(0x7f0000000080)=3D"0000000001000000010e000002000000280004000200000000008=
cee00000000000004002e2e0000000000002e00000000000000ed4100000300000030000000=
000000005cf90100535f01003bc165f354dffa32ec94ed23bb5568cfa05f3bc1655f3bc1655=
f010000290000000000",
0x6f, 0x3d97fa0}], 0x0, &(0x7f00000003c0)=3DANY=3D[@ANYBLOB], 0x0)

Console log :

REISERFS (device loop1): Using tea hash to sort names
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KFENCE: invalid read in memmove+0x4b/0x1b0

Invalid read at 0xffff888135a00000:
 memmove+0x4b/0x1b0
 leaf_paste_entries+0x44d/0x910
 balance_leaf+0x9853/0xddb0
 do_balance+0x319/0x810
 reiserfs_paste_into_item+0x74b/0x8d0
 reiserfs_add_entry+0x8cb/0xcf0
 reiserfs_mkdir+0x683/0x990
 reiserfs_xattr_init+0x57e/0xc30
 reiserfs_fill_super+0x2127/0x2ea0
 mount_bdev+0x351/0x410
 legacy_get_tree+0x109/0x220
 vfs_get_tree+0x8d/0x350
 path_mount+0x1342/0x1e40
 __x64_sys_mount+0x283/0x300
 do_syscall_64+0x39/0xb0
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

CPU: 0 PID: 5167 Comm: syz-executor.1 Not tainted
6.3.0-rc6-pasta-00035-g0bcc40255504 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:memmove+0x4b/0x1b0
Code: 01 01 00 00 0f 1f 44 00 00 48 81 fa a8 02 00 00 72 05 40 38 fe
74 48 48 83 ea 20 48 83 ea 20 4c 8b 1e 4c 8b 56 08 4c 8b 4e 10 <4c> 8b
46 18 48 8d 76 20 4c 89 1f 4c 89 57 08 4c 89 4f 10 4c 89 47
RSP: 0018:ffffc9000312efb0 EFLAGS: 00010286
RAX: ffff888128a45fb4 RBX: 0000000000000002 RCX: 0000000000000000
RDX: fffffffff3045f60 RSI: ffff8881359fffe4 RDI: ffff8881359ffff4
RBP: 0000000000000020 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000000 R14: ffff888128a45fa4 R15: 0000000000000010
FS:  00007fb847280700(0000) GS:ffff888063a00000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff888135a00000 CR3: 000000011e331000 CR4: 00000000000006f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 leaf_paste_entries+0x44d/0x910
 balance_leaf+0x9853/0xddb0
 do_balance+0x319/0x810
 reiserfs_paste_into_item+0x74b/0x8d0
 reiserfs_add_entry+0x8cb/0xcf0
 reiserfs_mkdir+0x683/0x990
 reiserfs_xattr_init+0x57e/0xc30
 reiserfs_fill_super+0x2127/0x2ea0
 mount_bdev+0x351/0x410
 legacy_get_tree+0x109/0x220
 vfs_get_tree+0x8d/0x350
 path_mount+0x1342/0x1e40
 __x64_sys_mount+0x283/0x300
 do_syscall_64+0x39/0xb0
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fb84649146e
Code: 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f
84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb84727fa08 EFLAGS: 00000206 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 00007fb84649146e
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007fb84727fa60
RBP: 00007fb84727faa0 R08: 00007fb84727faa0 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000020000000
R13: 0000000020000100 R14: 00007fb84727fa60 R15: 00000000200003c0
 </TASK>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
----------------
Code disassembly (best guess):
   0: 01 01                 add    %eax,(%rcx)
   2: 00 00                 add    %al,(%rax)
   4: 0f 1f 44 00 00       nopl   0x0(%rax,%rax,1)
   9: 48 81 fa a8 02 00 00 cmp    $0x2a8,%rdx
  10: 72 05                 jb     0x17
  12: 40 38 fe             cmp    %dil,%sil
  15: 74 48                 je     0x5f
  17: 48 83 ea 20           sub    $0x20,%rdx
  1b: 48 83 ea 20           sub    $0x20,%rdx
  1f: 4c 8b 1e             mov    (%rsi),%r11
  22: 4c 8b 56 08           mov    0x8(%rsi),%r10
  26: 4c 8b 4e 10           mov    0x10(%rsi),%r9
* 2a: 4c 8b 46 18           mov    0x18(%rsi),%r8 <-- trapping instruction
  2e: 48 8d 76 20           lea    0x20(%rsi),%rsi
  32: 4c 89 1f             mov    %r11,(%rdi)
  35: 4c 89 57 08           mov    %r10,0x8(%rdi)
  39: 4c 89 4f 10           mov    %r9,0x10(%rdi)
  3d: 4c                   rex.WR
  3e: 89                   .byte 0x89
  3f: 47                   rex.RXB
