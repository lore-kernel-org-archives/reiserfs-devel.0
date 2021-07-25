From: syzbot <syzbot+fcdd69a8426baab36109@syzkaller.appspotmail.com>
Subject: Re: [syzbot] WARNING in reiserfs_put_super
Date: Sun, 25 Jul 2021 12:50:09 -0700
Message-ID: <000000000000ba466405c7f7f1c7@google.com>
References: <000000000000ebd6da05b00bcea6@google.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <000000000000ebd6da05b00bcea6@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: axboe@kernel.dk, ground_handling@unex-aviation.co.id, hare@suse.de, hch@lst.de, jack@suse.cz, jeffm@suse.com, linux-kernel@vger.kernel.org, mszeredi@redhat.com, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, yukuai3@huawei.com

syzbot has bisected this issue to:

commit f902b02600028dfc0c9df811eb711ac7d7fca09f
Author: Christoph Hellwig <hch@lst.de>
Date:   Thu Nov 14 14:34:32 2019 +0000

    block: refactor rescan_partitions

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=166889b2300000
start commit:   90d856e71443 Add linux-next specific files for 20210723
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=156889b2300000
console output: https://syzkaller.appspot.com/x/log.txt?x=116889b2300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=298516715f6ad5cd
dashboard link: https://syzkaller.appspot.com/bug?extid=fcdd69a8426baab36109
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=146b2066300000

Reported-by: syzbot+fcdd69a8426baab36109@syzkaller.appspotmail.com
Fixes: f902b0260002 ("block: refactor rescan_partitions")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
