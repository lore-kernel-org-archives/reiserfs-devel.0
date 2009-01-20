From: Jeff Mahoney <jeffm@suse.de>
Subject: Re: circular locking dependency check in reiserfs
Date: Tue, 20 Jan 2009 09:53:44 -0500
Message-ID: <4975E578.807@suse.de>
References: <200901201549.21540.oliver@neukum.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200901201549.21540.oliver@neukum.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oliver Neukum <oliver@neukum.org>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Oliver Neukum wrote:
> I was reading mail.
> 
> 	Regards
> 		Oliver

I know, I know.

The SUSE reiserfs patchset fixes this. I'm still tracking Novell bug
399966 before submitting. I'm still unable to reproduce it, and I'm not
sure if it occurs on the mainline kernel. I suspect it probably does,
but I want to be certain.

- -Jeff

> Jan 20 15:43:40 vanamonde kernel: =======================================================
> Jan 20 15:43:40 vanamonde kernel: [ INFO: possible circular locking dependency detected ]
> Jan 20 15:43:40 vanamonde kernel: 2.6.29-rc1-9-default #12
> Jan 20 15:43:40 vanamonde kernel: -------------------------------------------------------
> Jan 20 15:43:40 vanamonde kernel: kmail/6568 is trying to acquire lock:
> Jan 20 15:43:40 vanamonde kernel:  (&type->i_mutex_dir_key#5){--..}, at: [<ffffffff802b54d2>] vfs_rmdir+0x8c/0x108
> Jan 20 15:43:40 vanamonde kernel:
> Jan 20 15:43:40 vanamonde kernel: but task is already holding lock:
> Jan 20 15:43:40 vanamonde kernel:  (&REISERFS_SB(s)->xattr_dir_sem){----}, at: [<ffffffffa02896f1>] reiserfs_delete_xattrs+0xf8/0x15d [reiserfs]
> Jan 20 15:43:40 vanamonde kernel:
> Jan 20 15:43:40 vanamonde kernel: which lock already depends on the new lock.
> Jan 20 15:43:40 vanamonde kernel:
> Jan 20 15:43:40 vanamonde kernel:
> Jan 20 15:43:40 vanamonde kernel: the existing dependency chain (in reverse order) is:
> Jan 20 15:43:40 vanamonde kernel:
> Jan 20 15:43:40 vanamonde kernel: -> #2 (&REISERFS_SB(s)->xattr_dir_sem){----}:
> Jan 20 15:43:40 vanamonde kernel:        [<ffffffff802563b9>] add_lock_to_list+0x70/0xaf
> Jan 20 15:43:40 vanamonde kernel:        [<ffffffff80259638>] __lock_acquire+0x120d/0x1570
> Jan 20 15:43:40 vanamonde kernel:        [<ffffffffa028860e>] reiserfs_check_acl+0x37/0xb4 [reiserfs]
> Jan 20 15:43:40 vanamonde kernel:        [<ffffffff802599ed>] lock_acquire+0x52/0x6c
> Jan 20 15:43:40 vanamonde kernel:        [<ffffffffa028860e>] reiserfs_check_acl+0x37/0xb4 [reiserfs]
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff804a1ae7>] down_read+0x3d/0x4a
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffffa028860e>] reiserfs_check_acl+0x37/0xb4 [reiserfs]
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffffa028860e>] reiserfs_check_acl+0x37/0xb4 [reiserfs]
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802b4083>] generic_permission+0x4f/0xef
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802b4189>] inode_permission+0x66/0x92
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802b5f58>] __link_path_walk+0x130/0xdc0
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802b6dda>] path_walk+0x66/0xc9
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802b7059>] do_path_lookup+0x184/0x1db
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802b7156>] path_lookup_open+0x56/0x92
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802b7c24>] do_filp_open+0x9f/0x84d
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802a8935>] cache_alloc_refill+0x1a1/0x204
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff804a2b8e>] _spin_unlock+0x17/0x20
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802c05de>] alloc_fd+0x112/0x123
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802ab776>] do_sys_open+0x48/0xc5
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff8020bf5b>] system_call_fastpath+0x16/0x1b
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffffffffffff>] 0xffffffffffffffff
> Jan 20 15:43:41 vanamonde kernel:
> Jan 20 15:43:41 vanamonde kernel: -> #1 (&REISERFS_I(inode)->xattr_sem){----}:
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802563b9>] add_lock_to_list+0x70/0xaf
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff80259638>] __lock_acquire+0x120d/0x1570
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff80255d85>] static_obj+0x64/0x82
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffffa028ad02>] reiserfs_cache_default_acl+0x38/0xbc [reiserfs]
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802599ed>] lock_acquire+0x52/0x6c
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffffa028ad02>] reiserfs_cache_default_acl+0x38/0xbc [reiserfs]
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff804a1ae7>] down_read+0x3d/0x4a
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffffa028ad02>] reiserfs_cache_default_acl+0x38/0xbc [reiserfs]
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff804a2b8e>] _spin_unlock+0x17/0x20
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffffa028ad02>] reiserfs_cache_default_acl+0x38/0xbc [reiserfs]
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffffa026cf13>] reiserfs_create+0x7a/0x219 [reiserfs]
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802c149c>] mnt_want_write+0x25/0x85
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802b5b1e>] vfs_create+0xdc/0x151
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802b7dba>] do_filp_open+0x235/0x84d
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff804a2b8e>] _spin_unlock+0x17/0x20
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802c05de>] alloc_fd+0x112/0x123
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802ab776>] do_sys_open+0x48/0xc5
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff8020bf5b>] system_call_fastpath+0x16/0x1b
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffffffffffff>] 0xffffffffffffffff
> Jan 20 15:43:41 vanamonde kernel:
> Jan 20 15:43:41 vanamonde kernel: -> #0 (&type->i_mutex_dir_key#5){--..}:
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff80259310>] __lock_acquire+0xee5/0x1570
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802599ed>] lock_acquire+0x52/0x6c
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802b54d2>] vfs_rmdir+0x8c/0x108
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff804a109f>] mutex_lock_nested+0x10b/0x296
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802b54d2>] vfs_rmdir+0x8c/0x108
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802b54d2>] vfs_rmdir+0x8c/0x108
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffffa02896fd>] reiserfs_delete_xattrs+0x104/0x15d [reiserfs]
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffffa02721b6>] reiserfs_delete_inode+0x6a/0x11c [reiserfs]
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffffa027214c>] reiserfs_delete_inode+0x0/0x11c [reiserfs]
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802befed>] generic_delete_inode+0xc7/0x15b
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff802b74cb>] do_unlinkat+0xe7/0x139
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff80257b5a>] trace_hardirqs_on_caller+0x115/0x138
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff804a27a4>] trace_hardirqs_on_thunk+0x3a/0x3f
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffff8020bf5b>] system_call_fastpath+0x16/0x1b
> Jan 20 15:43:41 vanamonde kernel:        [<ffffffffffffffff>] 0xffffffffffffffff
> Jan 20 15:43:41 vanamonde kernel:
> Jan 20 15:43:41 vanamonde kernel: other info that might help us debug this:
> Jan 20 15:43:41 vanamonde kernel:
> Jan 20 15:43:41 vanamonde kernel: 1 lock held by kmail/6568:
> Jan 20 15:43:41 vanamonde kernel:  #0:  (&REISERFS_SB(s)->xattr_dir_sem){----}, at: [<ffffffffa02896f1>] reiserfs_delete_xattrs+0xf8/0x15d [reiserfs]
> Jan 20 15:43:41 vanamonde kernel:
> Jan 20 15:43:41 vanamonde kernel: stack backtrace:
> Jan 20 15:43:41 vanamonde kernel: Pid: 6568, comm: kmail Not tainted 2.6.29-rc1-9-default #12
> Jan 20 15:43:41 vanamonde kernel: Call Trace:
> Jan 20 15:43:41 vanamonde kernel:  [<ffffffff80258056>] print_circular_bug_tail+0xbe/0xc7
> Jan 20 15:43:41 vanamonde kernel:  [<ffffffff80259310>] __lock_acquire+0xee5/0x1570
> Jan 20 15:43:41 vanamonde kernel:  [<ffffffff802599ed>] lock_acquire+0x52/0x6c
> Jan 20 15:43:41 vanamonde kernel:  [<ffffffff802b54d2>] vfs_rmdir+0x8c/0x108
> Jan 20 15:43:41 vanamonde kernel:  [<ffffffff804a109f>] mutex_lock_nested+0x10b/0x296
> Jan 20 15:43:41 vanamonde kernel:  [<ffffffff802b54d2>] vfs_rmdir+0x8c/0x108
> Jan 20 15:43:41 vanamonde kernel:  [<ffffffff802b54d2>] vfs_rmdir+0x8c/0x108
> Jan 20 15:43:41 vanamonde kernel:  [<ffffffffa02896fd>] reiserfs_delete_xattrs+0x104/0x15d [reiserfs]
> Jan 20 15:43:41 vanamonde kernel:  [<ffffffffa02721b6>] reiserfs_delete_inode+0x6a/0x11c [reiserfs]
> Jan 20 15:43:41 vanamonde kernel:  [<ffffffffa027214c>] reiserfs_delete_inode+0x0/0x11c [reiserfs]
> Jan 20 15:43:41 vanamonde kernel:  [<ffffffff802befed>] generic_delete_inode+0xc7/0x15b
> Jan 20 15:43:41 vanamonde kernel:  [<ffffffff802b74cb>] do_unlinkat+0xe7/0x139
> Jan 20 15:43:41 vanamonde kernel:  [<ffffffff80257b5a>] trace_hardirqs_on_caller+0x115/0x138
> Jan 20 15:43:41 vanamonde kernel:  [<ffffffff804a27a4>] trace_hardirqs_on_thunk+0x3a/0x3f
> Jan 20 15:43:41 vanamonde kernel:  [<ffffffff8020bf5b>] system_call_fastpath+0x16/0x1b


- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkl15XgACgkQLPWxlyuTD7JnqwCeN2R4rtOzwmSrzhHPtCflk6U7
SQcAn37+8qXgbCx4lfVSsdZpg+muPM9e
=cRzS
-----END PGP SIGNATURE-----
