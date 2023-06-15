From: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [syzbot] [reiserfs?] general protection fault in rcu_core (2)
Date: Thu, 15 Jun 2023 09:33:11 +0200
Message-ID: <CACT4Y+b3r+UeY6PDTBFYqqZ3pNuG9hbCvRa6BY-b2CHhC7A7OQ@mail.gmail.com>
References: <000000000000556d9605fe1e5c40@google.com> <1cb93e56-f3e3-c972-1232-bbb67ad4f672@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686814405; x=1689406405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnmSwoYifJPcQDBqiLLFdZccmtskHS5NVMFEKw/IWo0=;
        b=i2Y9h/xwBSasa+hIBJZUVgljLZv+3PHOYHTVuQGEqWPqmEZLUGu8D5KVjhqkUyp5h+
         Gfa+42dFu2UUr6Dr5jnvhYEUrx+T0sL36Bhw2yNrO2GdeC7Oisf4FPHWwvN/Tq5OlUKH
         wz2/DAvidQSK5QcfHinNhJ9TLyVG5t5r+TEnb9+0sQ0qRFj5mSOLNy7HrQrfICzBmkck
         cKosEWmUqiML4AUHMeIxYZyoewhhu5A3/oEl8/B3YGF3aK0YMAA2J20Yaxcf8FfgSCFx
         nZkogijqYgZRATYNDQe/KZkCuGNGIvv1zYGuH+Gaegx1x9gueR7UB4J7lAPBrdr0nv9T
         b6Rg==
In-Reply-To: <1cb93e56-f3e3-c972-1232-bbb67ad4f672@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: syzbot <syzbot+b23c4c9d3d228ba328d7@syzkaller.appspotmail.com>, jack@suse.cz, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, luto@kernel.org, peterz@infradead.org, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, "yukuai (C)" <yukuai3@huawei.com>

On Thu, 15 Jun 2023 at 04:15, Yu Kuai <yukuai1@huaweicloud.com> wrote:
>
> Hi,
>
> =E5=9C=A8 2023/06/15 6:20, syzbot =E5=86=99=E9=81=93:
> > syzbot has bisected this issue to:
> >
> > commit 2acf15b94d5b8ea8392c4b6753a6ffac3135cd78
> > Author: Yu Kuai <yukuai3@huawei.com>
> > Date:   Fri Jul 2 04:07:43 2021 +0000
> >
> >      reiserfs: add check for root_inode in reiserfs_fill_super
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D1715ffdd=
280000
>
> git log:
>
> 13d257503c09 reiserfs: check directory items on read from disk
> 2acf15b94d5b reiserfs: add check for root_inode in reiserfs_fill_super
>
> The bisect log shows that with commit 13d257503c09:
> testing commit 13d257503c0930010ef9eed78b689cec417ab741 gcc
> compiler: gcc (GCC) 10.2.1 20210217, GNU ld (GNU Binutils for Debian) 2.3=
5.2
> kernel signature:
> fc456e669984fb9704d9e1d3cb7be68af3b83de4bb55124257ae28bb39a14dc7
> run #0: basic kernel testing failed: possible deadlock in fs_reclaim_acqu=
ire
> run #1: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer
> run #2: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer
> run #3: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer
> run #4: crashed: KASAN: use-after-free Read in leaf_insert_into_buf
> run #5: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer
> run #6: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer
> run #7: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer
> run #8: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer
> run #9: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer
>
> and think this is bad, then bisect to the last commit:
> testing commit 2acf15b94d5b8ea8392c4b6753a6ffac3135cd78 gcc
> compiler: gcc (GCC) 10.2.1 20210217, GNU ld (GNU Binutils for Debian) 2.3=
5.2
> kernel signature:
> 6d0d5f26a4c0e15188c923383ecfb873ae57ca6a79f592493d6e9ca507949985
> run #0: crashed: possible deadlock in fs_reclaim_acquire
> run #1: OK
> run #2: OK
> run #3: OK
> run #4: OK
> run #5: OK
> run #6: OK
> run #7: OK
> run #8: OK
> run #9: OK
> reproducer seems to be flaky
> # git bisect bad 2acf15b94d5b8ea8392c4b6753a6ffac3135cd78
>
> It seems to me the orignal crash general protection fault is not related
> to this commit. Please kindly correct me if I'm wrong.
>
> For the problem of lockdep warning, it first appeared in bisect log:
> testing commit 406254918b232db198ed60f5bf1f8b84d96bca00 gcc
> compiler: gcc (GCC) 10.2.1 20210217, GNU ld (GNU Binutils for Debian) 2.3=
5.2
> kernel signature:
> 1c83f3c8b090a4702817c527e741a35506bc06911c71962d4c5fcef577de2fd3
> run #0: basic kernel testing failed: BUG: sleeping function called from
> invalid context in stack_depot_save
> run #1: basic kernel testing failed: possible deadlock in fs_reclaim_acqu=
ire
> run #2: OK
> run #3: OK
> run #4: OK
> run #5: OK
> run #6: OK
> run #7: OK
> run #8: OK
> run #9: OK
> # git bisect good 406254918b232db198ed60f5bf1f8b84d96bca00
>
> And I don't understand why syzbot thinks this is good, and later for the
> same result, syzbot thinks 2acf15b94d5b is bad.

I think the difference is "basic kernel testing failed", so that
happened even before the reproducer for the bug was executed.
So for all runs where the reproducer was executed, the result was "OK".



> Thanks,
> Kuai
> > start commit:   f8dba31b0a82 Merge tag 'asym-keys-fix-for-linus-v6.4-rc=
5' ..
> > git tree:       upstream
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D1495ffdd=
280000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D1095ffdd280=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D3c980bfe8b3=
99968
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3Db23c4c9d3d228=
ba328d7
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1680f7d12=
80000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D12fad50d280=
000
> >
> > Reported-by: syzbot+b23c4c9d3d228ba328d7@syzkaller.appspotmail.com
> > Fixes: 2acf15b94d5b ("reiserfs: add check for root_inode in reiserfs_fi=
ll_super")
> >
> > For information about bisection process see: https://goo.gl/tpsmEJ#bise=
ction
> >
> > .
> >
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/syzkaller-bugs/1cb93e56-f3e3-c972-1232-bbb67ad4f672%40huaweicloud.com.
