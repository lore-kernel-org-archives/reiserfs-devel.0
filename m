From: syzbot <syzbot+2da5e132dd0268a9c0e4@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [reiserfs?] kernel BUG in do_journal_begin_r
Date: Tue, 21 Mar 2023 14:26:23 -0700
Message-ID: <00000000000000f2d005f76fb25e@google.com>
References: <00000000000022a65705ec7f923c@google.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <00000000000022a65705ec7f923c@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, axboe@kernel.dk, bvanassche@acm.org, idosch@nvidia.com, jack@suse.cz, jacob.e.keller@intel.com, jiri@nvidia.com, jlayton@kernel.org, kuba@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, neilb@suse.de, pabeni@redhat.com, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, willy@infradead.org, yi.zhang@huawei.com

syzbot suspects this issue was fixed by commit:

commit b20b8aec6ffc07bb547966b356780cd344f20f5b
Author: Ido Schimmel <idosch@nvidia.com>
Date:   Wed Feb 15 07:31:39 2023 +0000

    devlink: Fix netdev notifier chain corruption

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=139af019c80000
start commit:   033c40a89f55 Merge tag 'apparmor-v6.2-rc9' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=fe56f7d193926860
dashboard link: https://syzkaller.appspot.com/bug?extid=2da5e132dd0268a9c0e4
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1264a8d7480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: devlink: Fix netdev notifier chain corruption

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
