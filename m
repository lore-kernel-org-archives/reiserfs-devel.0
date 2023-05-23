From: syzbot <syzbot+b8d61a58b7c7ebd2c8e0@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [block?] [reiserfs?] KASAN: user-memory-access Write in zram_slot_lock
Date: Tue, 23 May 2023 02:34:31 -0700
Message-ID: <00000000000026bdd305fc5918a5@google.com>
References: <00000000000066a94205fc488445@google.com>
Mime-Version: 1.0
Return-path: <linux-block-owner@vger.kernel.org>
In-Reply-To: <00000000000066a94205fc488445@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, axboe@kernel.dk, hch@lst.de, linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, minchan@kernel.org, reiserfs-devel@vger.kernel.org, senozhatsky@chromium.org, syzkaller-bugs@googlegroups.com

syzbot has bisected this issue to:

commit 9fe95babc7420722d39a1ded379027a1e1825d3a
Author: Christoph Hellwig <hch@lst.de>
Date:   Tue Apr 11 17:14:44 2023 +0000

    zram: remove valid_io_request

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=132fa586280000
start commit:   44c026a73be8 Linux 6.4-rc3
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10afa586280000
console output: https://syzkaller.appspot.com/x/log.txt?x=172fa586280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d8067683055e3f5
dashboard link: https://syzkaller.appspot.com/bug?extid=b8d61a58b7c7ebd2c8e0
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1223f7d9280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1245326a280000

Reported-by: syzbot+b8d61a58b7c7ebd2c8e0@syzkaller.appspotmail.com
Fixes: 9fe95babc742 ("zram: remove valid_io_request")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
