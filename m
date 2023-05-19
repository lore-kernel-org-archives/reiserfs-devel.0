From: syzbot <syzbot+5a195884ee3ad761db4e@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [reiserfs?] [overlayfs?] WARNING: locking bug in take_dentry_name_snapshot
Date: Fri, 19 May 2023 13:56:23 -0700
Message-ID: <00000000000058b12b05fc122703@google.com>
References: <0000000000001b987605f47b72d3@google.com>
Mime-Version: 1.0
Return-path: <linux-unionfs-owner@vger.kernel.org>
In-Reply-To: <0000000000001b987605f47b72d3@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: casey@schaufler-ca.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org, miklos@szeredi.hu, paul@paul-moore.com, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, syzkaller-bugs@googlegroups.com, zohar@linux.ibm.com

syzbot suspects this issue was fixed by commit:

commit 52ca4b6435a493e47aaa98e7345e19e1e8710b13
Author: Roberto Sassu <roberto.sassu@huawei.com>
Date:   Tue Mar 14 08:17:15 2023 +0000

    reiserfs: Switch to security_inode_init_security()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=121dea5a280000
start commit:   4bdec23f971b Merge tag 'hwmon-for-v6.3-rc4' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea09b0836073ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=5a195884ee3ad761db4e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1277fb1ec80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12543651c80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: reiserfs: Switch to security_inode_init_security()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
