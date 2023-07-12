From: syzbot <syzbot+21f2b8753d8bfc6bb816@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [reiserfs] general protection fault in timerqueue_add (4)
Date: Wed, 12 Jul 2023 04:15:27 -0700
Message-ID: <000000000000368623060048550c@google.com>
References: <000000000000d7894b05f5924787@google.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <000000000000d7894b05f5924787@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, miklos@szeredi.hu, nogikh@google.com, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, willy@infradead.org

syzbot suspects this issue was fixed by commit:

commit d685c668b0695dff927c85e27ef27d4f404f16a3
Author: Matthew Wilcox (Oracle) <willy@infradead.org>
Date:   Thu Dec 15 21:43:51 2022 +0000

    buffer: add b_folio as an alias of b_page

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13d6c9caa80000
start commit:   4a7d37e824f5 Merge tag 'hardening-v6.3-rc1' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=8b969c5af147d31c
dashboard link: https://syzkaller.appspot.com/bug?extid=21f2b8753d8bfc6bb816
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17c64f20c80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13734ba0c80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: buffer: add b_folio as an alias of b_page

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
