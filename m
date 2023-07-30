From: syzbot <syzbot+90392eaed540afcc8fc3@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [reiserfs?] [overlayfs?] BUG: unable to handle kernel
 paging request in take_dentry_name_snapshot
Date: Sun, 30 Jul 2023 07:34:37 -0700
Message-ID: <000000000000a7178a0601b5366f@google.com>
References: <0000000000003b7fee05eec392a8@google.com>
Mime-Version: 1.0
Return-path: <linux-unionfs-owner@vger.kernel.org>
In-Reply-To: <0000000000003b7fee05eec392a8@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: amir73il@gmail.com, brauner@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org, miklos@szeredi.hu, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com

syzbot suspects this issue was fixed by commit:

commit 1784fbc2ed9c888ea4e895f30a53207ed7ee8208
Author: Christian Brauner <brauner@kernel.org>
Date:   Fri Jun 16 12:53:58 2023 +0000

    ovl: port to new mount api

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12561bd9a80000
start commit:   8395ae05cb5a Merge tag 'scsi-misc' of git://git.kernel.org..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=85327a149d5f50f
dashboard link: https://syzkaller.appspot.com/bug?extid=90392eaed540afcc8fc3
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16199460480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1797f274480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: ovl: port to new mount api

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
