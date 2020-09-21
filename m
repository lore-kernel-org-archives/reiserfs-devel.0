From: syzbot <syzbot+690cb1e51970435f9775@syzkaller.appspotmail.com>
Subject: Re: general protection fault in reiserfs_security_init
Date: Mon, 21 Sep 2020 12:58:08 -0700
Message-ID: <000000000000fd18b405afd84475@google.com>
References: <000000000000f5be7f05afcf862a@google.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <000000000000f5be7f05afcf862a@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: baolin.wang7@gmail.com, gregkh@linuxfoundation.org, linhua.xu@unisoc.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, rafael@kernel.org, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com

syzbot has bisected this issue to:

commit 1592c4b9935fa8a3b7c297955bb872a357e5a3b6
Author: Linhua Xu <linhua.xu@unisoc.com>
Date:   Wed Mar 25 08:25:28 2020 +0000

    pinctrl: sprd: Add pin high impedance mode support

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=111050d3900000
start commit:   325d0eab Merge branch 'akpm' (patches from Andrew)
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=131050d3900000
console output: https://syzkaller.appspot.com/x/log.txt?x=151050d3900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b12e84189082991c
dashboard link: https://syzkaller.appspot.com/bug?extid=690cb1e51970435f9775
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15705a3d900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=117b3281900000

Reported-by: syzbot+690cb1e51970435f9775@syzkaller.appspotmail.com
Fixes: 1592c4b9935f ("pinctrl: sprd: Add pin high impedance mode support")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
