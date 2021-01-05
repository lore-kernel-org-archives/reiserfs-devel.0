From: syzbot <syzbot+2b5c012223e37b7c2a88@syzkaller.appspotmail.com>
Subject: Re: KASAN: use-after-free Read in reiserfs_fill_super
Date: Tue, 05 Jan 2021 00:00:05 -0800
Message-ID: <0000000000003ad7db05b8229802@google.com>
References: <000000000000b51b6b05b5dc833b@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <000000000000b51b6b05b5dc833b@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ebiggers@google.com, jack@suse.cz, jhubbard@nvidia.com, junxiao.bi@oracle.com, liao.pingfang@zte.com.cn, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, rkovhaev@gmail.com, syzkaller-bugs@googlegroups.com, william.kucharski@oracle.com, willy@infradead.org

syzbot suspects this issue was fixed by commit:

commit d24396c5290ba8ab04ba505176874c4e04a2d53c
Author: Rustam Kovhaev <rkovhaev@gmail.com>
Date:   Sun Nov 1 14:09:58 2020 +0000

    reiserfs: add check for an invalid ih_entry_count

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=113a2d57500000
start commit:   b3298500 Merge tag 'for-5.10/dm-fixes' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=e49433cfed49b7d9
dashboard link: https://syzkaller.appspot.com/bug?extid=2b5c012223e37b7c2a88
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12ad719b500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11193117500000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: reiserfs: add check for an invalid ih_entry_count

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
