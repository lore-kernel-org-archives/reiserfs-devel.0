From: syzbot <syzbot+1541a3226994c0781b29@syzkaller.appspotmail.com>
Subject: Re: kernel BUG at fs/reiserfs/prints.c:LINE!
Date: Fri, 08 Jan 2021 03:40:08 -0800
Message-ID: <000000000000ac50ae05b862040d@google.com>
References: <000000000000eba11705afd3d759@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <000000000000eba11705afd3d759@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, jack@suse.cz, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, rkovhaev@gmail.com, syzkaller-bugs@googlegroups.com, zhengbin13@huawei.com

syzbot suspects this issue was fixed by commit:

commit d24396c5290ba8ab04ba505176874c4e04a2d53c
Author: Rustam Kovhaev <rkovhaev@gmail.com>
Date:   Sun Nov 1 14:09:58 2020 +0000

    reiserfs: add check for an invalid ih_entry_count

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1731e8f7500000
start commit:   521b619a Merge tag 'linux-kselftest-kunit-fixes-5.10-rc3' ..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e93228e2f17fb12
dashboard link: https://syzkaller.appspot.com/bug?extid=1541a3226994c0781b29
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1446e7a8500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15c56f5c500000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: reiserfs: add check for an invalid ih_entry_count

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
