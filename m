From: Serkan Kaba <serkan@gentoo.org>
Subject: Re: Reiser4 and mount times
Date: Mon, 17 Jan 2011 06:35:30 +0200
Message-ID: <4D33C712.9090206@gentoo.org>
References: <4D2BE02E.6040207@gentoo.org> <4D2C3143.7050008@gmail.com> <4D2D28D1.5010306@gentoo.org> <4D2E12AD.6030508@gmail.com> <4D31376F.1080903@gentoo.org> <4D31B1BB.7000906@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D31B1BB.7000906@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Here's the new dmesg errors.
Pid: 4697, comm: pidgin Tainted: P            2.6.36-gentoo-r3 #24
P5B/System Product Name
RIP: 0010:[<ffffffff8111ff71>]  [<ffffffff8111ff71>] T.637+0x5d/0x1c4
RSP: 0018:ffff880157c09a78  EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffffc90000058030 RCX: ffff880155f20c80
RDX: 0000000000000000 RSI: ffffea00049e2c78 RDI: ffffea00049e2c78
RBP: ffff880157c09ad8 R08: 63c0000000000000 R09: 0000000000000041
R10: ffff8801790ca3a0 R11: ffffc90000058030 R12: 0000000000007fe0
R13: ffff880157c09b04 R14: 0000000000000004 R15: ffff880157c09b04
FS:  00007fc66f144740(0000) GS:ffff880001600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000040 CR3: 00000001667f9000 CR4: 00000000000006f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
Process pidgin (pid: 4697, threadinfo ffff880157c08000, task
ffff88017fd48d90)
Stack:
 ffff880100000020 ffffffff00000000 0000000400000000 0000000000008000
<0> 0000000000000020 ffff880175488004 ffff88017901c280 ffff880157c09b68
<0> 0000000000007fe0 ffff880157c09b04 0000000000000004 ffff880157c09b60
Call Trace:
 [<ffffffff81120153>] T.635+0x7b/0xc2
 [<ffffffff81120305>] reiser4_alloc_blocks_bitmap+0x16b/0x1ca
 [<ffffffff810ef1ed>] ? update_blocknr_hint_default+0x99/0xa2
 [<ffffffff8106b4e9>] ? unlock_page+0x25/0x29
 [<ffffffff810ef334>] reiser4_alloc_blocks+0x8f/0x22b
 [<ffffffff810f74ae>] commit_tx+0xa7/0x670
 [<ffffffff81025378>] ? __wake_up_common+0x49/0x7f
 [<ffffffff81025adb>] ? __wake_up+0x3f/0x48
 [<ffffffff810f7ea4>] reiser4_write_logs+0x42d/0x67d
 [<ffffffff810f023f>] ? get_current_atom_locked_nocheck+0x40/0x4b
 [<ffffffff810f1fb0>] reiser4_txn_end+0x3d1/0x57b
 [<ffffffff810f216b>] reiser4_txn_restart+0x11/0x22
 [<ffffffff810f270d>] reiser4_txn_restart_current+0x19/0x1b
 [<ffffffff810f2976>] force_commit_atom+0x63/0x69
 [<ffffffff811044e7>] reiser4_sync_file_common+0x73/0x82
 [<ffffffff810b5599>] vfs_fsync_range+0x50/0x7b
 [<ffffffff810b561f>] vfs_fsync+0x17/0x19
 [<ffffffff810b564a>] do_fsync+0x29/0x3e
 [<ffffffff810b567c>] sys_fsync+0xb/0xf
 [<ffffffff81001eab>] system_call_fastpath+0x16/0x1b
Code: 00 00 00 48 8b 80 70 02 00 00 48 8b 40 18 48 03 18 48 89 df e8 07
f5 ff ff 89 45 c4 85 c0 0f 85 5c 01 00 00 48 8b 43 20 41 8b 17 <48> 8b
40 40 31 c9 48 83 c0 04 48 89 45 c8 8b 43 30 39 d0 72 04
RIP  [<ffffffff8111ff71>] T.637+0x5d/0x1c4
 RSP <ffff880157c09a78>
CR2: 0000000000000040
- ---[ end trace 0221e593a51fc43d ]---
reiser4[pidgin(4697)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2327)[vs-44]:
WARNING: out of memory?
reiser4[pidgin(4697)]: release_unix_file
(fs/reiser4/plugin/file/file.c:2327)[vs-44]:
WARNING: out of memory?

This time pidgin just halted and Thunderbird froze. It's just
Thunderbird freezing you can move on, your mous works etc. But as soon
as I restart X, X freezes somewhere where a cursor exists. I can do
anything on virtual consoles by the way. There doesn't seem to be
serious disk activity afterwards, but I wasn't able to capture the
moment pidgin crashed. It might be some pressure issue I suppose.

- -- 
Sincerely,
Serkan KABA
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk0zxxIACgkQRh6X64ivZaLXDgCeP1wav6AJK8n+VHDzPEYrfAFH
9CUAnRT1tI+48QAcjtdD5QUIb/IvYRl/
=Th35
-----END PGP SIGNATURE-----
