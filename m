From: syzbot <syzbot+7a278bf8bfa794494110@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in delete_one_xattr (2)
Date: Sun, 24 Sep 2023 23:04:35 -0700
Message-ID: <0000000000008a3693060628bb0b@google.com>
References: <000000000000964cb905f5e876ff@google.com>
Mime-Version: 1.0
Return-path: <linux-unionfs-owner@vger.kernel.org>
In-Reply-To: <000000000000964cb905f5e876ff@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: amir73il@gmail.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org, miklos@szeredi.hu, mszeredi@redhat.com, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com

syzbot has bisected this issue to:

commit 9df085f3c9a2d4658a9fe323d70c200aa00ede93
Author: Amir Goldstein <amir73il@gmail.com>
Date:   Mon Sep 3 06:12:09 2018 +0000

    ovl: relax requirement for non null uuid of lower fs

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1711e75a680000
start commit:   ac9a78681b92 Linux 6.4-rc1
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1491e75a680000
console output: https://syzkaller.appspot.com/x/log.txt?x=1091e75a680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bc832f563d8bf38
dashboard link: https://syzkaller.appspot.com/bug?extid=7a278bf8bfa794494110
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1295e4b8280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=140af20a280000

Reported-by: syzbot+7a278bf8bfa794494110@syzkaller.appspotmail.com
Fixes: 9df085f3c9a2 ("ovl: relax requirement for non null uuid of lower fs")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
