From: Simon <sur3@gmx.de>
Subject: Re: Reiser4 for Linux-2.6.36
Date: Tue, 30 Nov 2010 17:00:47 +0100
Message-ID: <4CF51FAF.4040904@gmx.de>
References: <4CE87674.4090909@gmail.com> <4CF4CD6E.4040305@gmx.de> <4CF4E224.2040203@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4CF4E224.2040203@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

> Are you sure that you have reiser4-for-2.6.36
> stuff applied? The problem has gone for me...

Yep, looked it up in my zsh-history, so i'm sure:
% patch -p1 < ../reiser4-for-2.6.36.patch

> Could you send kernel messages?

I wish i could, but as it seemes the messages from the crash aint saved,
probably because the kernel does crash completely and so not sync anymore.
Anyway i found some messages hours before the crash, probably the bug
depends on them or they have nothing to do with it, but they mention
ext3 and sda7, this is funny, as ext3 is my root-partition on sda1, and
sda7 is my home-partition with reiser4:

Nov 29 20:49:40 localhost kernel: [61364.033613] Pid: 1856, comm:
ent:sda7! Tainted: P            2.6.36-gentoo-r1 #1
Nov 29 20:49:40 localhost kernel: [61364.033617] Call Trace:
Nov 29 20:49:40 localhost kernel: [61364.033627]  [<ffffffff81167775>] ?
ext3_write_inode+0x45/0x50
Nov 29 20:49:40 localhost kernel: [61364.033633]  [<ffffffff810dfbf4>] ?
writeback_single_inode+0x214/0x2a0
Nov 29 20:49:40 localhost kernel: [61364.033637]  [<ffffffff810e0005>] ?
generic_writeback_sb_inodes+0xe5/0x170
Nov 29 20:49:40 localhost kernel: [61364.033640]  [<ffffffff810e09c0>] ?
writeback_inodes_wb+0x140/0x190
Nov 29 20:49:40 localhost kernel: [61364.033644]  [<ffffffff8113b432>] ?
entd_flush+0xa2/0xe0
Nov 29 20:49:40 localhost kernel: [61364.033647]  [<ffffffff8113b59d>] ?
entd+0x12d/0x280
Nov 29 20:49:40 localhost kernel: [61364.033652]  [<ffffffff810561d0>] ?
autoremove_wake_function+0x0/0x30
Nov 29 20:49:40 localhost kernel: [61364.033655]  [<ffffffff8113b470>] ?
entd+0x0/0x280
Nov 29 20:49:40 localhost kernel: [61364.033658]  [<ffffffff8113b470>] ?
entd+0x0/0x280
Nov 29 20:49:40 localhost kernel: [61364.033661]  [<ffffffff81055d56>] ?
kthread+0x96/0xa0
Nov 29 20:49:40 localhost kernel: [61364.033665]  [<ffffffff81003154>] ?
kernel_thread_helper+0x4/0x10
Nov 29 20:49:40 localhost kernel: [61364.033668]  [<ffffffff81055cc0>] ?
kthread+0x0/0xa0
Nov 29 20:49:40 localhost kernel: [61364.033671]  [<ffffffff81003150>] ?
kernel_thread_helper+0x0/0x10
