From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH 0/3] kill-the-BKL/reiserfs: reiserfs fixes
Date: Tue, 14 Apr 2009 08:51:09 +0400
Message-ID: <20090414045109.GA26908@orion>
References: <1239680065-25013-1-git-send-email-fweisbec@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=CV77Q5dshfSZIey/f9MQcjM5NvA/NcTvRoM0I7l6T/s=;
        b=HTbLlYPkxxAiy7+rXoPYTtlNpX0yPsjml3KuULDjnS4zUMzJgH0uwIV0roCtnQefO+
         iuFgJr80aKJG2EkKaHz10EVeZ0wAkjR7rM9f6bwmRJ5sb0f6UIVzPFXnyjMVUvqN7JIH
         BPP4JBZGVc9dLlHfe5lbWZEFMreaXS2IHWbGg=
Content-Disposition: inline
In-Reply-To: <1239680065-25013-1-git-send-email-fweisbec@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, LKML <linux-kernel@vger.kernel.org>, Alessio Igor Bogani <abogani@texware.it>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>

On Tue, Apr 14, 2009 at 05:34:22AM +0200, Frederic Weisbecker wrote:
> Ingo,
> 
> This small patchset fixes some deadlocks I've faced after trying
> some pressures with dbench on a reiserfs partition.
> 
> There is still some work pending such as adding some checks to ensure we
> _always_ release the lock before sleeping, as you suggested.
> Also I have to fix a lockdep warning reported by Alessio Igor Bogani.
> And also some optimizations....
> 
> Thanks,
> Frederic.
> 
> Frederic Weisbecker (3):
>   kill-the-BKL/reiserfs: provide a tool to lock only once the write lock
>   kill-the-BKL/reiserfs: lock only once in reiserfs_truncate_file
>   kill-the-BKL/reiserfs: only acquire the write lock once in
>     reiserfs_dirty_inode
> 
>  fs/reiserfs/inode.c         |   10 +++++++---
>  fs/reiserfs/lock.c          |   26 ++++++++++++++++++++++++++
>  fs/reiserfs/super.c         |   15 +++++++++------
>  include/linux/reiserfs_fs.h |    2 ++
>  4 files changed, 44 insertions(+), 9 deletions(-)
> 

Hi

The same test - dbench on reiserfs on loop on sparc64.

[ INFO: possible circular locking dependency detected ]
2.6.30-rc1-00457-gb21597d-dirty #2
-------------------------------------------------------
dbench/2493 is trying to acquire lock:
 (&REISERFS_SB(s)->lock){+.+.+.}, at: [<000000001003f7a8>] reiserfs_write_lock+0x24/0x44 [reiserfs]

but task is already holding lock:
 (&journal->j_flush_mutex){+.+...}, at: [<0000000010036770>] flush_journal_list+0xa0/0x830 [reiserfs]

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&journal->j_flush_mutex){+.+...}:
       [<00000000004775c8>] lock_acquire+0x5c/0x74
       [<00000000006fa73c>] mutex_lock_nested+0x48/0x380
       [<0000000010037314>] kupdate_transactions+0x30/0x328 [reiserfs]
       [<00000000100376d8>] flush_used_journal_lists+0xcc/0xf0 [reiserfs]
       [<0000000010038508>] do_journal_end+0xe0c/0x127c [reiserfs]
       [<0000000010038a00>] journal_end_sync+0x88/0x9c [reiserfs]
       [<0000000010039370>] reiserfs_commit_for_inode+0x180/0x208 [reiserfs]
       [<0000000010013d2c>] reiserfs_sync_file+0x54/0xb8 [reiserfs]
       [<00000000004d5d64>] vfs_fsync+0x6c/0xa0
       [<00000000004d5dc0>] do_fsync+0x28/0x44
       [<00000000004d5e18>] SyS_fsync+0x14/0x28
       [<0000000000406154>] linux_sparc_syscall32+0x34/0x40

-> #0 (&REISERFS_SB(s)->lock){+.+.+.}:
       [<00000000004775c8>] lock_acquire+0x5c/0x74
       [<00000000006fa73c>] mutex_lock_nested+0x48/0x380
       [<000000001003f7a8>] reiserfs_write_lock+0x24/0x44 [reiserfs]
       [<0000000010036b10>] flush_journal_list+0x440/0x830 [reiserfs]
       [<0000000010036c1c>] flush_journal_list+0x54c/0x830 [reiserfs]
       [<00000000100376ec>] flush_used_journal_lists+0xe0/0xf0 [reiserfs]
       [<0000000010038508>] do_journal_end+0xe0c/0x127c [reiserfs]
       [<0000000010038a00>] journal_end_sync+0x88/0x9c [reiserfs]
       [<0000000010039370>] reiserfs_commit_for_inode+0x180/0x208 [reiserfs]
       [<0000000010013d2c>] reiserfs_sync_file+0x54/0xb8 [reiserfs]
       [<00000000004d5d64>] vfs_fsync+0x6c/0xa0
       [<00000000004d5dc0>] do_fsync+0x28/0x44
       [<00000000004d5e18>] SyS_fsync+0x14/0x28
       [<0000000000406154>] linux_sparc_syscall32+0x34/0x40

other info that might help us debug this:

3 locks held by dbench/2493:
 #0:  (&sb->s_type->i_mutex_key#12){+.+.+.}, at: [<00000000004d5d50>] vfs_fsync+0x58/0xa0
 #1:  (&journal->j_mutex){+.+...}, at: [<00000000100377d4>] do_journal_end+0xd8/0x127c [reiserfs]
 #2:  (&journal->j_flush_mutex){+.+...}, at: [<0000000010036770>] flush_journal_list+0xa0/0x830 [reiserfs]

stack backtrace:
Call Trace:
 [00000000004754a4] print_circular_bug_tail+0xfc/0x10c
 [0000000000476d1c] __lock_acquire+0x12f0/0x1b40
 [00000000004775c8] lock_acquire+0x5c/0x74
 [00000000006fa73c] mutex_lock_nested+0x48/0x380
 [000000001003f7a8] reiserfs_write_lock+0x24/0x44 [reiserfs]
 [0000000010036b10] flush_journal_list+0x440/0x830 [reiserfs]
 [0000000010036c1c] flush_journal_list+0x54c/0x830 [reiserfs]
 [00000000100376ec] flush_used_journal_lists+0xe0/0xf0 [reiserfs]
 [0000000010038508] do_journal_end+0xe0c/0x127c [reiserfs]
 [0000000010038a00] journal_end_sync+0x88/0x9c [reiserfs]
 [0000000010039370] reiserfs_commit_for_inode+0x180/0x208 [reiserfs]
 [0000000010013d2c] reiserfs_sync_file+0x54/0xb8 [reiserfs]
 [00000000004d5d64] vfs_fsync+0x6c/0xa0
 [00000000004d5dc0] do_fsync+0x28/0x44
 [00000000004d5e18] SyS_fsync+0x14/0x28
 [0000000000406154] linux_sparc_syscall32+0x34/0x40
