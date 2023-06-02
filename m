From: syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
Date: Fri, 02 Jun 2023 02:17:28 -0700
Message-ID: <0000000000009d322605fd22054a@google.com>
References: <6bb51cd9afb95f2a5bd9bd2a5113f6dcbf4aea07.camel@huaweicloud.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <6bb51cd9afb95f2a5bd9bd2a5113f6dcbf4aea07.camel@huaweicloud.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=166c541d280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=38526bf24c8d961b
dashboard link: https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1095cd79280000

Note: testing is done by a robot and is best-effort only.
