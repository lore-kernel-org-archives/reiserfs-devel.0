From: syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
Date: Fri, 02 Jun 2023 09:39:32 -0700
Message-ID: <00000000000093d48c05fd2832a7@google.com>
References: <4aa799a0b87d4e2ecf3fa74079402074dc42b3c5.camel@huaweicloud.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4aa799a0b87d4e2ecf3fa74079402074dc42b3c5.camel@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hdanton@sina.com, jack@suse.cz, jeffm@suse.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, paul@paul-moore.com, peterz@infradead.org, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, roberto.sassu@huaweicloud.com, syzkaller-bugs@googlegroups.com, will@kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com

Tested on:

commit:         4432b507 lsm: fix a number of misspellings
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git next
console output: https://syzkaller.appspot.com/x/log.txt?x=16b47dd1280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=178a8c28652084e1
dashboard link: https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=102f6ab6280000

Note: testing is done by a robot and is best-effort only.
