From: syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
Date: Thu, 01 Jun 2023 13:38:39 -0700
Message-ID: <000000000000dbb63805fd176bc6@google.com>
References: <8a48ede1-3a45-7c3c-39e9-36001ac09283@huaweicloud.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <8a48ede1-3a45-7c3c-39e9-36001ac09283@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hdanton@sina.com, jack@suse.cz, jeffm@suse.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, paul@paul-moore.com, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, roberto.sassu@huaweicloud.com, syzkaller-bugs@googlegroups.com

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file fs/reiserfs/namei.c
patch: **** unexpected end of file in patch



Tested on:

commit:         929ed21d Merge tag '6.4-rc4-smb3-client-fixes' of git:..
git tree:       upstream
dashboard link: https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10efc079280000

