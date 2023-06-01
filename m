From: syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
Date: Thu, 01 Jun 2023 13:57:27 -0700
Message-ID: <0000000000001faca405fd17af1b@google.com>
References: <ffde7908-be73-cc56-2646-72f4f94cb51b@huaweicloud.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <ffde7908-be73-cc56-2646-72f4f94cb51b@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hdanton@sina.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, paul@paul-moore.com, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, roberto.sassu@huaweicloud.com, syzkaller-bugs@googlegroups.com

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com

Tested on:

commit:         929ed21d Merge tag '6.4-rc4-smb3-client-fixes' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16c69fed280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=162cf2103e4a7453
dashboard link: https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1159c149280000

Note: testing is done by a robot and is best-effort only.
