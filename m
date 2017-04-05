From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: silence warning from dquot_writeback_dquots()
Date: Wed, 5 Apr 2017 12:09:04 +0200
Message-ID: <20170405100904.GB12153@quack2.suse.cz>
References: <58E3AFB5020000780014C9E7@prv-mh.provo.novell.com>
 <58E3AFB5020000780014C9E7@prv-mh.provo.novell.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <58E3AFB5020000780014C9E7@prv-mh.provo.novell.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Beulich <JBeulich@suse.com>
Cc: reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>

On Tue 04-04-17 06:37:41, Jan Beulich wrote:
> Following commit 9d1ccbe70e ("quota: Use s_umount protection for quota
> operations") I see on all systems having ReiserFS volumes
> 
> <4>WARNING: CPU: 4 PID: 77 at .../fs/quota/dquot.c:619 dquot_writeback_dquots+0x267/0x2b0
> <5>Modules linked in: ...
> <5>CPU: 4 PID: 77 Comm: kworker/4:1 Not tainted 4.10.1-2017-03-01-xen0 #1
> <5>Hardware name: ...
> <5>Workqueue: events_long flush_old_commits [reiserfs]
> <5>Call Trace:
> <5> dump_stack+0x50/0xa0
> <5> __warn+0x105/0x120
> <5> ? dquot_writeback_dquots+0x267/0x2b0
> <5> warn_slowpath_null+0x23/0x30
> <5> dquot_writeback_dquots+0x267/0x2b0
> <5> ? sched_clock_cpu+0x47/0x50
> <5> ? idle_balance+0x21c/0x3a0
> <5> reiserfs_sync_fs+0x11/0x70 [reiserfs]
> <5> flush_old_commits+0x47/0x60 [reiserfs]
> <5> process_one_work+0xfc/0x2f0
> <5> ? schedule+0x27/0x90
> <5> worker_thread+0xc5/0x290
> <5> ? schedule+0x27/0x90
> <5> kthread+0xfd/0x110
> <5> ? manage_workers+0x60/0x60
> <5> ? kthread_parkme+0x30/0x30
> <5> ret_from_fork+0x1c/0x28
> <4>---[ end trace e7e00754f5b3cec7 ]---
> 
> Acquire the semaphore expected to be held.

Thanks for report! So grabbing s_umount in flush_old_commits() has the
problem that cancel_old_flush() will wait for flush_old_commits() to
complete and cancel_old_flush() may be called with s_umount held thus
leading to deadlock. But I guess we can get away with down_read_trylock()
and requeue the work if it fails. I'll fix it.

> Looking over other users of dquot_writeback_dquots() I couldn't really
> convince myself that the semaphore is held in all cases by ext2, but I
> also didn't see any warnings so far.

Yeah. ext2_write_super() calls ext2_sync_fs() and may get called from inode
writeback - but in that case we should be calling ext2_sync_super() instead
anyway since we only want to write the superblock. I'll fix that as well.

								Honza

> 
> --- 4.11-rc5/fs/reiserfs/super.c
> +++ 4.11-rc5-reiserfs-dquot-warning/fs/reiserfs/super.c
> @@ -93,7 +93,9 @@ static void flush_old_commits(struct wor
>  	sbi->work_queued = 0;
>  	spin_unlock(&sbi->old_work_lock);
>  
> +	down_read(&s->s_umount);
>  	reiserfs_sync_fs(s, 1);
> +	up_read(&s->s_umount);
>  }
>  
>  void reiserfs_schedule_old_flush(struct super_block *s)
> 
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
