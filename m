From: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: kernel BUG at fs/reiserfs/prints.c:LINE!
Date: Mon, 11 Jan 2021 12:15:31 +0100
Message-ID: <CACT4Y+b0ZwjFXBe5woU+eNzkbuWNgE37i3vU2vFk0PGNjVHiZw@mail.gmail.com>
References: <000000000000eba11705afd3d759@google.com> <000000000000ac50ae05b862040d@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=07jVVaRVyq5aozxWNXLFWFjmN6KjLrqrOzqL/0QRu9w=;
        b=W+q+OmcQ/0EhY8lol5ozzXnDL4vttxLXTvCiOGZ0RVIXgIsKazQ9nb1lH7pg6A9Kys
         cPbKquKsKFllOelUMfGU4wjWjlXfj30uqaR72Y8MXxNQ5cokRc9HBPhpV8TUXQh/wD3+
         BqzFQPDhv0jcjaBngCg7gF9hR/snQp64NDE1XMoqrwgmZf/UudK3XZNFFb6csUAL+g+h
         uaY6/mlwpItvCmpbaC6lBySHizGAzlBSUczX4rQ7wyL81V6zxxL0yo8fmqIKvkQR1o3x
         s3O4vmgYChOGKxaMI/Mh1HcW1H7S/HdNJaO6qyw1sFoav8uOv2pVU+cau2IMAL/5X7Al
         ln7w==
In-Reply-To: <000000000000ac50ae05b862040d@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: syzbot <syzbot+1541a3226994c0781b29@syzkaller.appspotmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>, LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, rkovhaev@gmail.com, syzkaller-bugs <syzkaller-bugs@googlegroups.com>, zhengbin13@huawei.com

On Fri, Jan 8, 2021 at 12:40 PM syzbot
<syzbot+1541a3226994c0781b29@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit d24396c5290ba8ab04ba505176874c4e04a2d53c
> Author: Rustam Kovhaev <rkovhaev@gmail.com>
> Date:   Sun Nov 1 14:09:58 2020 +0000
>
>     reiserfs: add check for an invalid ih_entry_count
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1731e8f7500000
> start commit:   521b619a Merge tag 'linux-kselftest-kunit-fixes-5.10-rc3' ..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4e93228e2f17fb12
> dashboard link: https://syzkaller.appspot.com/bug?extid=1541a3226994c0781b29
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1446e7a8500000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15c56f5c500000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: reiserfs: add check for an invalid ih_entry_count
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Looks realistic

#syz fix: reiserfs: add check for an invalid ih_entry_count
