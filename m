From: Oliver Neukum <oliver@neukum.org>
Subject: Re: problems with xattr in 2.6.28 and 2.6.27
Date: Fri, 9 Jan 2009 23:50:14 +0100
Message-ID: <200901092350.14780.oliver@neukum.org>
References: <200901081104.40980.oliver@neukum.org> <4966C5F4.50409@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4966C5F4.50409@suse.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

Am Friday 09 January 2009 04:35:16 schrieb Jeff Mahoney:
> Oliver Neukum wrote:
> > Hi,
> >
> > I am getting entries like this in syslog, but reiserfsck finds no errors
> > in the filesystem.
> 
> Yeah, reiserfsck doesn't check them. If you run into these once in a

Strictly speaking, isn't it a bit fishy to not test something in fsck the
kernel has a run time test for?

> while, then setfattr -b is the answer. If you're seeing them en masse,
> something is wonky.
> 
> I saw a report on b.n.c indicating that someone ran into these while
> running a vanilla kernel, but the suse kernel doesn't exhibit the
> problem. This isn't really surprising since the suse kernel contains the
> "latest" reiser3 development. I know. I need to push it upstream.

Indeed. Only the vanilla kernel seems to be affected. Running with
additional debugging I get a circular dependency trace from 2.6.28.

	Regards
		Oliver

Jan  8 16:45:58 vanamonde kernel: =======================================================
Jan  8 16:45:58 vanamonde kernel: [ INFO: possible circular locking dependency detected ]
Jan  8 16:45:58 vanamonde kernel: 2.6.28-9-default #2
Jan  8 16:45:58 vanamonde kernel: -------------------------------------------------------
Jan  8 16:45:58 vanamonde kernel: kmail/6496 is trying to acquire lock:
Jan  8 16:45:58 vanamonde kernel:  (&type->i_mutex_dir_key#5){--..}, at: [<ffffffff802bb436>] vfs_rmdir+0x98/0x115
Jan  8 16:45:58 vanamonde kernel: 
Jan  8 16:45:58 vanamonde kernel: but task is already holding lock:
Jan  8 16:45:58 vanamonde kernel:  (&REISERFS_SB(s)->xattr_dir_sem){----}, at: [<ffffffffa01f7823>] reiserfs_delete_xattrs+0xff/0x16b [reiserfs]
Jan  8 16:45:58 vanamonde kernel: 
Jan  8 16:45:58 vanamonde kernel: which lock already depends on the new lock.
Jan  8 16:45:58 vanamonde kernel: 
Jan  8 16:45:58 vanamonde kernel: 
Jan  8 16:45:58 vanamonde kernel: the existing dependency chain (in reverse order) is:
Jan  8 16:45:58 vanamonde kernel: 
Jan  8 16:45:58 vanamonde kernel: -> #2 (&REISERFS_SB(s)->xattr_dir_sem){----}:
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff8025c34f>] __lock_acquire+0x12b0/0x161a
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff8025c70e>] lock_acquire+0x55/0x71
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff8047262f>] down_read+0x40/0x4d
Jan  8 16:45:58 vanamonde kernel:        [<ffffffffa01f666f>] reiserfs_check_acl+0x37/0xb6 [reiserfs]
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff802b9f20>] generic_permission+0x58/0x101
Jan  8 16:45:58 vanamonde kernel:        [<ffffffffa01f6636>] reiserfs_permission+0x26/0x28 [reiserfs]
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff802ba032>] inode_permission+0x69/0x97
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff802bbf20>] __link_path_walk+0x134/0xde0
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff802bcdd2>] path_walk+0x69/0xd4
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff802bd06b>] do_path_lookup+0x187/0x1df
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff802bd181>] path_lookup_open+0x5a/0x9b
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff802bdd68>] do_filp_open+0xb6/0x8a2
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff802b0f32>] do_sys_open+0x53/0xd3
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff802b0fdb>] sys_open+0x1b/0x1d
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff8020c0db>] system_call_fastpath+0x16/0x1b
Jan  8 16:45:58 vanamonde kernel:        [<ffffffffffffffff>] 0xffffffffffffffff
Jan  8 16:45:58 vanamonde kernel: 
Jan  8 16:45:58 vanamonde kernel: -> #1 (&REISERFS_I(inode)->xattr_sem){----}:
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff8025c34f>] __lock_acquire+0x12b0/0x161a
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff8025c70e>] lock_acquire+0x55/0x71
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff8047262f>] down_read+0x40/0x4d
Jan  8 16:45:58 vanamonde kernel:        [<ffffffffa01f8f50>] reiserfs_cache_default_acl+0x41/0xc8 [reiserfs]
Jan  8 16:45:58 vanamonde kernel:        [<ffffffffa01da250>] reiserfs_create+0x81/0x226 [reiserfs]
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff802bbab4>] vfs_create+0xea/0x161
Jan  8 16:45:58 vanamonde kernel:        [<ffffffff802bdf09>] do_filp_open+0x257/0x8a2
Jan  8 16:45:59 vanamonde kernel:        [<ffffffff802b0f32>] do_sys_open+0x53/0xd3
Jan  8 16:45:59 vanamonde kernel:        [<ffffffff802b0fdb>] sys_open+0x1b/0x1d
Jan  8 16:45:59 vanamonde kernel:        [<ffffffff8020c0db>] system_call_fastpath+0x16/0x1b
Jan  8 16:45:59 vanamonde kernel:        [<ffffffffffffffff>] 0xffffffffffffffff
Jan  8 16:45:59 vanamonde kernel: 
Jan  8 16:45:59 vanamonde kernel: -> #0 (&type->i_mutex_dir_key#5){--..}:
Jan  8 16:45:59 vanamonde kernel:        [<ffffffff8025c01e>] __lock_acquire+0xf7f/0x161a
Jan  8 16:45:59 vanamonde kernel:        [<ffffffff8025c70e>] lock_acquire+0x55/0x71
Jan  8 16:45:59 vanamonde kernel:        [<ffffffff80471bb3>] mutex_lock_nested+0x10c/0x2a9
Jan  8 16:45:59 vanamonde kernel:        [<ffffffff802bb436>] vfs_rmdir+0x98/0x115
Jan  8 16:45:59 vanamonde kernel:        [<ffffffffa01f782f>] reiserfs_delete_xattrs+0x10b/0x16b [reiserfs]
Jan  8 16:45:59 vanamonde kernel:        [<ffffffffa01df7df>] reiserfs_delete_inode+0x75/0x12a [reiserfs]
Jan  8 16:45:59 vanamonde kernel:        [<ffffffff802c5552>] generic_delete_inode+0xcb/0x165
Jan  8 16:45:59 vanamonde kernel:        [<ffffffff802c5603>] generic_drop_inode+0x17/0x17b
Jan  8 16:45:59 vanamonde kernel:        [<ffffffff802c471b>] iput+0x61/0x65
Jan  8 16:45:59 vanamonde kernel:        [<ffffffff802bd544>] do_unlinkat+0x107/0x15d
Jan  8 16:45:59 vanamonde kernel:        [<ffffffff802bd5ab>] sys_unlink+0x11/0x13
Jan  8 16:45:59 vanamonde kernel:        [<ffffffff8020c0db>] system_call_fastpath+0x16/0x1b
Jan  8 16:45:59 vanamonde kernel:        [<ffffffffffffffff>] 0xffffffffffffffff
Jan  8 16:45:59 vanamonde kernel: 
Jan  8 16:45:59 vanamonde kernel: other info that might help us debug this:
Jan  8 16:45:59 vanamonde kernel: 
Jan  8 16:45:59 vanamonde kernel: 1 lock held by kmail/6496:
Jan  8 16:45:59 vanamonde kernel:  #0:  (&REISERFS_SB(s)->xattr_dir_sem){----}, at: [<ffffffffa01f7823>] reiserfs_delete_xattrs+0xff/0x16b [reiserfs]
Jan  8 16:45:59 vanamonde kernel: 
Jan  8 16:45:59 vanamonde kernel: stack backtrace:
Jan  8 16:45:59 vanamonde kernel: Pid: 6496, comm: kmail Not tainted 2.6.28-9-default #2
Jan  8 16:45:59 vanamonde kernel: Call Trace:
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff8025acb9>] print_circular_bug_tail+0xc5/0xd0
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff8025c01e>] __lock_acquire+0xf7f/0x161a
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff8025c70e>] lock_acquire+0x55/0x71
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff802bb436>] ? vfs_rmdir+0x98/0x115
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff80471bb3>] mutex_lock_nested+0x10c/0x2a9
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff802bb436>] ? vfs_rmdir+0x98/0x115
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff802bb436>] ? vfs_rmdir+0x98/0x115
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff8047375c>] ? _spin_unlock_irq+0x2b/0x30
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff802ba9c7>] ? may_delete+0x65/0x144
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff802bb436>] vfs_rmdir+0x98/0x115
Jan  8 16:45:59 vanamonde kernel:  [<ffffffffa01f782f>] reiserfs_delete_xattrs+0x10b/0x16b [reiserfs]
Jan  8 16:45:59 vanamonde kernel:  [<ffffffffa01df7df>] reiserfs_delete_inode+0x75/0x12a [reiserfs]
Jan  8 16:45:59 vanamonde kernel:  [<ffffffffa01df76a>] ? reiserfs_delete_inode+0x0/0x12a [reiserfs]
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff802c5552>] generic_delete_inode+0xcb/0x165
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff802c5603>] generic_drop_inode+0x17/0x17b
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff802c471b>] iput+0x61/0x65
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff802bd544>] do_unlinkat+0x107/0x15d
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff8020c10c>] ? sysret_check+0x27/0x62
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff8025a77f>] ? trace_hardirqs_on_caller+0x114/0x138
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff80473383>] ? trace_hardirqs_on_thunk+0x3a/0x3f
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff802bcf2b>] ? do_path_lookup+0x47/0x1df
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff802bd5ab>] sys_unlink+0x11/0x13
Jan  8 16:45:59 vanamonde kernel:  [<ffffffff8020c0db>] system_call_fastpath+0x16/0x1b

