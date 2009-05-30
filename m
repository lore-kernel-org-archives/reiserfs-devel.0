From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 1/2] kill-the-bkl/reiserfs: acquire the inode mutex
	safely
Date: Sat, 30 May 2009 05:22:54 +0200
Message-ID: <20090530032253.GA5999@nowhere>
References: <1242496922-6330-1-git-send-email-fweisbec@gmail.com> <1242496922-6330-2-git-send-email-fweisbec@gmail.com> <9b1675090905292005p2b53de7dy9e36f84368d76f01@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=K/VXhFpddWQVevGjbuIRmcQjihjcALaoQn/MKKDbmYU=;
        b=qMl8jMwrUx7rajXWbDU/nCzcZqBcd1aDMf/uvIGp4fqVfH03i1dfhzzSINifRFymCS
         LGGTVQKk28lilWmcUwnkI2UlkTx/AZ2/x0qveFTyR4/KNbDsrJgnb3H/IqJ6CBEEx+6b
         HyPol2xSM9tU4Q6GpXPyW9Fm2xJ3NeRmvm97k=
Content-Disposition: inline
In-Reply-To: <9b1675090905292005p2b53de7dy9e36f84368d76f01@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Trenton D. Adams" <trenton.d.adams@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Reiserfs <reiserfs-devel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Jeff Mahoney <jeffm@suse.com>, Chris Mason <chris.mason@oracle.com>, Ingo Molnar <mingo@elte.hu>, Alexander Beregalov <a.beregalov@gmail.com>

On Fri, May 29, 2009 at 09:05:31PM -0600, Trenton D. Adams wrote:
> On Sat, May 16, 2009 at 12:02 PM, Frederic Weisbecker
> <fweisbec@gmail.com> wrote:
> > While searching a pathname, an inode mutex can be acquired
> > in do_lookup() which calls reiserfs_lookup() which in turn
> > acquires the write lock.
> >
> > On the other side reiserfs_fill_super() can acquire the write_lock
> > and then call reiserfs_lookup_privroot() which can acquire an
> > inode mutex (the root of the mount point).
> >
> > So we theoretically risk an AB - BA lock inversion that could lead
> > to a deadlock.
> >
> > As for other lock dependencies found since the bkl to mutex
> > conversion, the fix is to use reiserfs_mutex_lock_safe() which
> > drops the lock dependency to the write lock.
> >
> 
> I'm curious, did this get applied, and is it related to the following?
>  I was having these in 2.6.30-rc3.  I am now on 2.6.30-rc7 as of
> today.  I haven't seen them today.  But then again, I only seen this
> happen one time.


Hi,

No, may be it will come for 2.6.31 but for now it is not merged so
it's not related.

If you see such warning anymore, don't hesitate to tell about
it!

Thanks!


 
> May 27 01:56:12 tdamac INFO: task pdflush:15370 blocked for more than
> 120 seconds.
> May 27 01:56:12 tdamac "echo 0 >
> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> May 27 01:56:12 tdamac pdflush       D ffff8800518a0000     0 15370      2
> May 27 01:56:12 tdamac ffff880025023b50 0000000000000046
> 0000000025023a90 000000000000d7a0
> May 27 01:56:12 tdamac 0000000000004000 0000000000011440
> 000000000000ca78 ffff880045e71568
> May 27 01:56:12 tdamac ffff880045e7156c ffff8800518a0000
> ffff880067f54230 ffff8800518a0380
> May 27 01:56:12 tdamac Call Trace:
> May 27 01:56:12 tdamac [<ffffffff80687d1b>] ? __mutex_lock_slowpath+0xe2/0x124
> May 27 01:56:12 tdamac [<ffffffff80687d13>] __mutex_lock_slowpath+0xda/0x124
> May 27 01:56:12 tdamac [<ffffffff8068809e>] mutex_lock+0x1e/0x36
> May 27 01:56:12 tdamac [<ffffffff803087ae>] flush_commit_list+0x150/0x689
> May 27 01:56:12 tdamac [<ffffffff8022f8e5>] ? __wake_up+0x43/0x50
> May 27 01:56:12 tdamac [<ffffffff8030ad8a>] do_journal_end+0xb4a/0xd6c
> May 27 01:56:12 tdamac [<ffffffff8023053d>] ? dequeue_entity+0x1b/0x1df
> May 27 01:56:12 tdamac [<ffffffff8030b020>] journal_end_sync+0x74/0x7d
> May 27 01:56:12 tdamac [<ffffffff802fd2fd>] reiserfs_sync_fs+0x41/0x67
> May 27 01:56:12 tdamac [<ffffffff80688091>] ? mutex_lock+0x11/0x36
> May 27 01:56:12 tdamac [<ffffffff802fd331>] reiserfs_write_super+0xe/0x10
> May 27 01:56:12 tdamac [<ffffffff802a532a>] sync_supers+0x61/0xa6
> May 27 01:56:12 tdamac [<ffffffff8027e140>] wb_kupdate+0x32/0x128
> May 27 01:56:12 tdamac [<ffffffff8027ee7c>] pdflush+0x140/0x21f
> May 27 01:56:12 tdamac [<ffffffff8027e10e>] ? wb_kupdate+0x0/0x128
> May 27 01:56:12 tdamac [<ffffffff8027ed3c>] ? pdflush+0x0/0x21f
> May 27 01:56:12 tdamac [<ffffffff8024fb26>] kthread+0x56/0x83
> May 27 01:56:12 tdamac [<ffffffff8020beba>] child_rip+0xa/0x20
> May 27 01:56:12 tdamac [<ffffffff8024fad0>] ? kthread+0x0/0x83
> May 27 01:56:12 tdamac [<ffffffff8020beb0>] ? child_rip+0x0/0x20

