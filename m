From: syzbot <syzbot+5184326923f180b9d11a@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [reiserfs?] KASAN: null-ptr-deref Read in fix_nodes
Date: Sat, 23 Sep 2023 17:02:23 -0700
Message-ID: <00000000000061c35a06060f8eb3@google.com>
References: <0000000000007fcc9c05f909f7f3@google.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <0000000000007fcc9c05f909f7f3@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jack@suse.cz, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, rkovhaev@gmail.com, syzkaller-bugs@googlegroups.com

syzbot has bisected this issue to:

commit d24396c5290ba8ab04ba505176874c4e04a2d53c
Author: Rustam Kovhaev <rkovhaev@gmail.com>
Date:   Sun Nov 1 14:09:58 2020 +0000

    reiserfs: add check for an invalid ih_entry_count

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15244cfa680000
start commit:   b6dad5178cea Merge tag 'nios2_fix_v6.4' of git://git.kerne..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17244cfa680000
console output: https://syzkaller.appspot.com/x/log.txt?x=13244cfa680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ac246111fb601aec
dashboard link: https://syzkaller.appspot.com/bug?extid=5184326923f180b9d11a
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10bbc887280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15c9558b280000

Reported-by: syzbot+5184326923f180b9d11a@syzkaller.appspotmail.com
Fixes: d24396c5290b ("reiserfs: add check for an invalid ih_entry_count")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
