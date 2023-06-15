From: Yu Kuai <yukuai1@huaweicloud.com>
Subject: Re: [syzbot] [reiserfs?] general protection fault in rcu_core (2)
Date: Thu, 15 Jun 2023 10:15:04 +0800
Message-ID: <1cb93e56-f3e3-c972-1232-bbb67ad4f672@huaweicloud.com>
References: <000000000000556d9605fe1e5c40@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <000000000000556d9605fe1e5c40@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: syzbot <syzbot+b23c4c9d3d228ba328d7@syzkaller.appspotmail.com>, jack@suse.cz, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, luto@kernel.org, peterz@infradead.org, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, "yukuai (C)" <yukuai3@huawei.com>

Hi,

在 2023/06/15 6:20, syzbot 写道:
> syzbot has bisected this issue to:
> 
> commit 2acf15b94d5b8ea8392c4b6753a6ffac3135cd78
> Author: Yu Kuai <yukuai3@huawei.com>
> Date:   Fri Jul 2 04:07:43 2021 +0000
> 
>      reiserfs: add check for root_inode in reiserfs_fill_super
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1715ffdd280000

git log:

13d257503c09 reiserfs: check directory items on read from disk
2acf15b94d5b reiserfs: add check for root_inode in reiserfs_fill_super

The bisect log shows that with commit 13d257503c09:
testing commit 13d257503c0930010ef9eed78b689cec417ab741 gcc
compiler: gcc (GCC) 10.2.1 20210217, GNU ld (GNU Binutils for Debian) 2.35.2
kernel signature: 
fc456e669984fb9704d9e1d3cb7be68af3b83de4bb55124257ae28bb39a14dc7
run #0: basic kernel testing failed: possible deadlock in fs_reclaim_acquire
run #1: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer
run #2: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer
run #3: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer
run #4: crashed: KASAN: use-after-free Read in leaf_insert_into_buf
run #5: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer
run #6: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer
run #7: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer
run #8: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer
run #9: crashed: KASAN: out-of-bounds Read in leaf_paste_in_buffer

and think this is bad, then bisect to the last commit:
testing commit 2acf15b94d5b8ea8392c4b6753a6ffac3135cd78 gcc
compiler: gcc (GCC) 10.2.1 20210217, GNU ld (GNU Binutils for Debian) 2.35.2
kernel signature: 
6d0d5f26a4c0e15188c923383ecfb873ae57ca6a79f592493d6e9ca507949985
run #0: crashed: possible deadlock in fs_reclaim_acquire
run #1: OK
run #2: OK
run #3: OK
run #4: OK
run #5: OK
run #6: OK
run #7: OK
run #8: OK
run #9: OK
reproducer seems to be flaky
# git bisect bad 2acf15b94d5b8ea8392c4b6753a6ffac3135cd78

It seems to me the orignal crash general protection fault is not related
to this commit. Please kindly correct me if I'm wrong.

For the problem of lockdep warning, it first appeared in bisect log:
testing commit 406254918b232db198ed60f5bf1f8b84d96bca00 gcc
compiler: gcc (GCC) 10.2.1 20210217, GNU ld (GNU Binutils for Debian) 2.35.2
kernel signature: 
1c83f3c8b090a4702817c527e741a35506bc06911c71962d4c5fcef577de2fd3
run #0: basic kernel testing failed: BUG: sleeping function called from 
invalid context in stack_depot_save
run #1: basic kernel testing failed: possible deadlock in fs_reclaim_acquire
run #2: OK
run #3: OK
run #4: OK
run #5: OK
run #6: OK
run #7: OK
run #8: OK
run #9: OK
# git bisect good 406254918b232db198ed60f5bf1f8b84d96bca00

And I don't understand why syzbot thinks this is good, and later for the
same result, syzbot thinks 2acf15b94d5b is bad.

Thanks,
Kuai
> start commit:   f8dba31b0a82 Merge tag 'asym-keys-fix-for-linus-v6.4-rc5' ..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=1495ffdd280000
> console output: https://syzkaller.appspot.com/x/log.txt?x=1095ffdd280000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3c980bfe8b399968
> dashboard link: https://syzkaller.appspot.com/bug?extid=b23c4c9d3d228ba328d7
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1680f7d1280000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12fad50d280000
> 
> Reported-by: syzbot+b23c4c9d3d228ba328d7@syzkaller.appspotmail.com
> Fixes: 2acf15b94d5b ("reiserfs: add check for root_inode in reiserfs_fill_super")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> .
> 

