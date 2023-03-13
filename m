From: syzbot <syzbot+55b82aea13452e3d128f@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [reiserfs?] KASAN: use-after-free Read in leaf_paste_in_buffer
Date: Mon, 13 Mar 2023 15:42:19 -0700
Message-ID: <000000000000d7988d05f6cfd256@google.com>
References: <000000000000e3af1a05eec2e287@google.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <000000000000e3af1a05eec2e287@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com

syzbot suspects this issue was fixed by commit:

commit 26388a7c353f7b1d3fd8a6df6452fa9773193155
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Thu Jan 12 19:44:03 2023 +0000

    cpuidle,arch: Mark all regular cpuidle_state:: Enter methods __cpuidle

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16fc20aac80000
start commit:   420b2d431d18 Merge tag 'clk-fixes-for-linus' of git://git...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=6bb1911ff9919df0
dashboard link: https://syzkaller.appspot.com/bug?extid=55b82aea13452e3d128f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17249347480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14281c1b480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: cpuidle,arch: Mark all regular cpuidle_state:: Enter methods __cpuidle

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
