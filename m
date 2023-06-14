From: syzbot <syzbot+b23c4c9d3d228ba328d7@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [reiserfs?] general protection fault in rcu_core (2)
Date: Wed, 14 Jun 2023 15:20:35 -0700
Message-ID: <000000000000556d9605fe1e5c40@google.com>
References: <0000000000009dc57505fd85ceb9@google.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <0000000000009dc57505fd85ceb9@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jack@suse.cz, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, luto@kernel.org, peterz@infradead.org, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, yukuai3@huawei.com

syzbot has bisected this issue to:

commit 2acf15b94d5b8ea8392c4b6753a6ffac3135cd78
Author: Yu Kuai <yukuai3@huawei.com>
Date:   Fri Jul 2 04:07:43 2021 +0000

    reiserfs: add check for root_inode in reiserfs_fill_super

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1715ffdd280000
start commit:   f8dba31b0a82 Merge tag 'asym-keys-fix-for-linus-v6.4-rc5' ..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1495ffdd280000
console output: https://syzkaller.appspot.com/x/log.txt?x=1095ffdd280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3c980bfe8b399968
dashboard link: https://syzkaller.appspot.com/bug?extid=b23c4c9d3d228ba328d7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1680f7d1280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12fad50d280000

Reported-by: syzbot+b23c4c9d3d228ba328d7@syzkaller.appspotmail.com
Fixes: 2acf15b94d5b ("reiserfs: add check for root_inode in reiserfs_fill_super")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
