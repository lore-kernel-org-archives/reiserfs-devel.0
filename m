From: "Trenton D. Adams" <trenton.d.adams@gmail.com>
Subject: Re: [PATCH 1/2] kill-the-bkl/reiserfs: acquire the inode mutex safely
Date: Fri, 5 Jun 2009 13:06:56 -0600
Message-ID: <9b1675090906051206we136e88k6a14194963726709@mail.gmail.com>
References: <1242496922-6330-1-git-send-email-fweisbec@gmail.com>
	 <1242496922-6330-2-git-send-email-fweisbec@gmail.com>
	 <9b1675090905292005p2b53de7dy9e36f84368d76f01@mail.gmail.com>
	 <4A296343.4050005@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=dIQqAM/4h6xBZIsK7XB+O8kBkPnyvhFYrRPwtX/z298=;
        b=wd5x/J2G3zcXKFH5+vMmhhXWwQ8tf4xhAmmgumdBqBiTqs0Y99XaRnCo3O4saDJvw2
         iBK5fxZxKUkq+JD1DuyoFNhJUu7sZnhsh/Wl9jq0Xdldi2KHqOrC4YdZG2jcq+4+tqHN
         6KWYz8jZqZMCuORxQHdKUyaW7etF1UGp4Xb7g=
In-Reply-To: <4A296343.4050005@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, Reiserfs <reiserfs-devel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Chris Mason <chris.mason@oracle.com>, Ingo Molnar <mingo@elte.hu>, Alexander Beregalov <a.beregalov@gmail.com>

On Fri, Jun 5, 2009 at 12:26 PM, Jeff Mahoney<jeffm@suse.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Trenton D. Adams wrote:
>> On Sat, May 16, 2009 at 12:02 PM, Frederic Weisbecker
>> <fweisbec@gmail.com> wrote:
>>> While searching a pathname, an inode mutex can be acquired
>>> in do_lookup() which calls reiserfs_lookup() which in turn
>>> acquires the write lock.
>>>
>>> On the other side reiserfs_fill_super() can acquire the write_lock
>>> and then call reiserfs_lookup_privroot() which can acquire an
>>> inode mutex (the root of the mount point).
>>>
>>> So we theoretically risk an AB - BA lock inversion that could lead
>>> to a deadlock.
>>>
>>> As for other lock dependencies found since the bkl to mutex
>>> conversion, the fix is to use reiserfs_mutex_lock_safe() which
>>> drops the lock dependency to the write lock.
>>>
>>
>> I'm curious, did this get applied, and is it related to the followin=
g?
>> =A0I was having these in 2.6.30-rc3. =A0I am now on 2.6.30-rc7 as of
>> today. =A0I haven't seen them today. =A0But then again, I only seen =
this
>> happen one time.
>>
>> May 27 01:56:12 tdamac INFO: task pdflush:15370 blocked for more tha=
n
>> 120 seconds.
>> May 27 01:56:12 tdamac "echo 0 >
>> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> May 27 01:56:12 tdamac pdflush =A0 =A0 =A0 D ffff8800518a0000 =A0 =A0=
 0 15370 =A0 =A0 =A02
>> May 27 01:56:12 tdamac ffff880025023b50 0000000000000046
>> 0000000025023a90 000000000000d7a0
>> May 27 01:56:12 tdamac 0000000000004000 0000000000011440
>> 000000000000ca78 ffff880045e71568
>> May 27 01:56:12 tdamac ffff880045e7156c ffff8800518a0000
>> ffff880067f54230 ffff8800518a0380
>> May 27 01:56:12 tdamac Call Trace:
>> May 27 01:56:12 tdamac [<ffffffff80687d1b>] ? __mutex_lock_slowpath+=
0xe2/0x124
>> May 27 01:56:12 tdamac [<ffffffff80687d13>] __mutex_lock_slowpath+0x=
da/0x124
>> May 27 01:56:12 tdamac [<ffffffff8068809e>] mutex_lock+0x1e/0x36
>> May 27 01:56:12 tdamac [<ffffffff803087ae>] flush_commit_list+0x150/=
0x689
>> May 27 01:56:12 tdamac [<ffffffff8022f8e5>] ? __wake_up+0x43/0x50
>> May 27 01:56:12 tdamac [<ffffffff8030ad8a>] do_journal_end+0xb4a/0xd=
6c
>> May 27 01:56:12 tdamac [<ffffffff8023053d>] ? dequeue_entity+0x1b/0x=
1df
>> May 27 01:56:12 tdamac [<ffffffff8030b020>] journal_end_sync+0x74/0x=
7d
>> May 27 01:56:12 tdamac [<ffffffff802fd2fd>] reiserfs_sync_fs+0x41/0x=
67
>> May 27 01:56:12 tdamac [<ffffffff80688091>] ? mutex_lock+0x11/0x36
>> May 27 01:56:12 tdamac [<ffffffff802fd331>] reiserfs_write_super+0xe=
/0x10
>> May 27 01:56:12 tdamac [<ffffffff802a532a>] sync_supers+0x61/0xa6
>> May 27 01:56:12 tdamac [<ffffffff8027e140>] wb_kupdate+0x32/0x128
>> May 27 01:56:12 tdamac [<ffffffff8027ee7c>] pdflush+0x140/0x21f
>> May 27 01:56:12 tdamac [<ffffffff8027e10e>] ? wb_kupdate+0x0/0x128
>> May 27 01:56:12 tdamac [<ffffffff8027ed3c>] ? pdflush+0x0/0x21f
>> May 27 01:56:12 tdamac [<ffffffff8024fb26>] kthread+0x56/0x83
>> May 27 01:56:12 tdamac [<ffffffff8020beba>] child_rip+0xa/0x20
>> May 27 01:56:12 tdamac [<ffffffff8024fad0>] ? kthread+0x0/0x83
>> May 27 01:56:12 tdamac [<ffffffff8020beb0>] ? child_rip+0x0/0x20
>
> Can you capture a sysrq+t when this happens? The lock is properly
> released, but I have a hunch that another thread is doing ordered
> writeback that's taking a while. That happens under the j_commit_mute=
x.

=46YI: I never did anything specific that I knew of, so I didn't
actually notice a delay.  I was rsyncing to a USB key at the time.
And seeing it took over an hour, I walked away, so I wouldn't have
noticed it.  But, I could fiddle around a little to see if I could get
some sort of delay going on.  Any ideas on what I should try?  Then I
can do the sysreq+t for you if I can reproduce.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
