From: Jan Kara <jack@suse.cz>
Subject: Re: [syzbot] WARNING in reiserfs_put_super
Date: Mon, 26 Jul 2021 20:20:39 +0200
Message-ID: <20210726182039.GP20621@quack2.suse.cz>
References: <000000000000ebd6da05b00bcea6@google.com>
 <000000000000ba466405c7f7f1c7@google.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1627323646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zvcca5rVCR4CoCExSBTtbcM2L1tcOj4RbRxvRtxzheU=;
        b=YvSRhrfwP2WTwokqIt9aSq5KQEOnDfqpq9pBO5ksujDwYmhn+0Mj/6aQJALg8hMiH1Z7PX
        27Etyy8H6Z2K4y3dE8SSSor2UuK+cqmPoqjcpBt98WfFbtsIF9rHSXweJ7afDg2VeEFdrV
        qE3zgKhExx83r8B0zecZwKCxK7uTeOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1627323646;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zvcca5rVCR4CoCExSBTtbcM2L1tcOj4RbRxvRtxzheU=;
        b=gYUJmRUPS4hazKGJc8CitKYRTmfV4FjJ8TZ1OgdpyniMCi8oHPt0HSNhtsEmU42PlwGqgB
        ICj2LdVkT66gTYBQ==
Content-Disposition: inline
In-Reply-To: <000000000000ba466405c7f7f1c7@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: syzbot <syzbot+fcdd69a8426baab36109@syzkaller.appspotmail.com>
Cc: axboe@kernel.dk, ground_handling@unex-aviation.co.id, hare@suse.de, hch@lst.de, jack@suse.cz, jeffm@suse.com, linux-kernel@vger.kernel.org, mszeredi@redhat.com, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, yukuai3@huawei.com

On Sun 25-07-21 12:50:09, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit f902b02600028dfc0c9df811eb711ac7d7fca09f
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Thu Nov 14 14:34:32 2019 +0000
> 
>     block: refactor rescan_partitions

Looks unlikely. Also because the first report of this problem was 307 days
ago - i.e., before this commit landed. I rather think the reproducer isn't
quite reliable...

								Honza

> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=166889b2300000
> start commit:   90d856e71443 Add linux-next specific files for 20210723
> git tree:       linux-next
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=156889b2300000
> console output: https://syzkaller.appspot.com/x/log.txt?x=116889b2300000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=298516715f6ad5cd
> dashboard link: https://syzkaller.appspot.com/bug?extid=fcdd69a8426baab36109
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=146b2066300000
> 
> Reported-by: syzbot+fcdd69a8426baab36109@syzkaller.appspotmail.com
> Fixes: f902b0260002 ("block: refactor rescan_partitions")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
