From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Bug] possible circular locking in reiserfs_unpack
Date: Wed, 8 Sep 2010 15:37:30 -0700
Message-ID: <20100908153730.5ad13f71.akpm@linux-foundation.org>
References: <20100905113121.GA1876@del.dom.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20100905113121.GA1876@del.dom.local>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jarek Poplawski <jarkao2@gmail.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>

On Sun, 5 Sep 2010 13:31:21 +0200
Jarek Poplawski <jarkao2@gmail.com> wrote:

> Hi,
> I get this warning on every lilo write with 2.6.35.4 and a bit/git
> later too.
> 

Can you tell us the latest kernel version which did *not* have this
bug?  That way we can narrow the problem down a bit.

Thanks.

> 
> [   92.766639] =======================================================
> [   92.767222] [ INFO: possible circular locking dependency detected ]
> [   92.767222] 2.6.35c #13
> [   92.767222] -------------------------------------------------------
> [   92.767222] lilo/1606 is trying to acquire lock:
> [   92.767222]  (&sb->s_type->i_mutex_key#8){+.+.+.}, at: [<d0329450>] reiserfs_unpack+0x60/0x110 [reiserfs]
> [   92.767222] 
> [   92.767222] but task is already holding lock:
> [   92.767222]  (&REISERFS_SB(s)->lock){+.+.+.}, at: [<d032a268>] reiserfs_write_lock+0x28/0x40 [reiserfs]
> [   92.767222] 
> [   92.767222] which lock already depends on the new lock.
> [   92.767222] 
> [   92.767222] 
> [   92.767222] the existing dependency chain (in reverse order) is:
> [   92.767222] 
> [   92.767222] -> #1 (&REISERFS_SB(s)->lock){+.+.+.}:
> [   92.767222]        [<c1056347>] lock_acquire+0x67/0x80
> [   92.767222]        [<c12f083d>] __mutex_lock_common+0x4d/0x410
> [   92.767222]        [<c12f0c58>] mutex_lock_nested+0x18/0x20
> [   92.767222]        [<d032a268>] reiserfs_write_lock+0x28/0x40 [reiserfs]
> [   92.767222]        [<d0329e9a>] reiserfs_lookup_privroot+0x2a/0x90 [reiserfs]
> [   92.767222]        [<d0316b81>] reiserfs_fill_super+0x941/0xe60 [reiserfs]
> [   92.767222]        [<c10b7d17>] get_sb_bdev+0x117/0x170
> [   92.767222]        [<d0313e21>] get_super_block+0x21/0x30 [reiserfs]
> [   92.767222]        [<c10b74ba>] vfs_kern_mount+0x6a/0x1b0
> [   92.767222]        [<c10b7659>] do_kern_mount+0x39/0xe0
> [   92.767222]        [<c10cebe0>] do_mount+0x340/0x790
> [   92.767222]        [<c10cf0b4>] sys_mount+0x84/0xb0
> [   92.767222]        [<c12f25cd>] syscall_call+0x7/0xb
> [   92.767222] 
> [   92.767222] -> #0 (&sb->s_type->i_mutex_key#8){+.+.+.}:
> [   92.767222]        [<c1056186>] __lock_acquire+0x1026/0x1180
> [   92.767222]        [<c1056347>] lock_acquire+0x67/0x80
> [   92.767222]        [<c12f083d>] __mutex_lock_common+0x4d/0x410
> [   92.767222]        [<c12f0c58>] mutex_lock_nested+0x18/0x20
> [   92.767222]        [<d0329450>] reiserfs_unpack+0x60/0x110 [reiserfs]
> [   92.767222]        [<d0329772>] reiserfs_ioctl+0x272/0x320 [reiserfs]
> [   92.767222]        [<c10c3228>] vfs_ioctl+0x28/0xa0
> [   92.767222]        [<c10c3c5d>] do_vfs_ioctl+0x32d/0x5c0
> [   92.767222]        [<c10c3f53>] sys_ioctl+0x63/0x70
> [   92.767222]        [<c12f25cd>] syscall_call+0x7/0xb
> [   92.767222] 
> [   92.767222] other info that might help us debug this:
> [   92.767222] 
> [   92.767222] 1 lock held by lilo/1606:
> [   92.767222]  #0:  (&REISERFS_SB(s)->lock){+.+.+.}, at: [<d032a268>] reiserfs_write_lock+0x28/0x40 [reiserfs]
> [   92.767222] 
> [   92.767222] stack backtrace:
> [   92.767222] Pid: 1606, comm: lilo Not tainted 2.6.35c #13
> [   92.767222] Call Trace:
> [   92.767222]  [<c12ef64a>] ? printk+0x18/0x1e
> [   92.767222]  [<c1054212>] print_circular_bug+0xd2/0xe0
> [   92.767222]  [<c1056186>] __lock_acquire+0x1026/0x1180
> [   92.767222]  [<c1089489>] ? __generic_file_aio_write+0x1c9/0x550
> [   92.767222]  [<c1056347>] lock_acquire+0x67/0x80
> [   92.767222]  [<d0329450>] ? reiserfs_unpack+0x60/0x110 [reiserfs]
> [   92.767222]  [<c12f083d>] __mutex_lock_common+0x4d/0x410
> [   92.767222]  [<d0329450>] ? reiserfs_unpack+0x60/0x110 [reiserfs]
> [   92.767222]  [<c12f0b08>] ? __mutex_lock_common+0x318/0x410
> [   92.767222]  [<d032a268>] ? reiserfs_write_lock+0x28/0x40 [reiserfs]
> [   92.767222]  [<c12f0c58>] mutex_lock_nested+0x18/0x20
> [   92.767222]  [<d0329450>] ? reiserfs_unpack+0x60/0x110 [reiserfs]
> [   92.767222]  [<d0329450>] reiserfs_unpack+0x60/0x110 [reiserfs]
> [   92.767222]  [<c12f0c58>] ? mutex_lock_nested+0x18/0x20
> [   92.767222]  [<d0329772>] reiserfs_ioctl+0x272/0x320 [reiserfs]
> [   92.767222]  [<d0329500>] ? reiserfs_ioctl+0x0/0x320 [reiserfs]
> [   92.767222]  [<c10c3228>] vfs_ioctl+0x28/0xa0
> [   92.767222]  [<c10c3c5d>] do_vfs_ioctl+0x32d/0x5c0
> [   92.767222]  [<c109a428>] ? might_fault+0x88/0x90
> [   92.767222]  [<c109a3e2>] ? might_fault+0x42/0x90
> [   92.767222]  [<c10b6638>] ? fget_light+0xf8/0x2f0
> [   92.767222]  [<c10c3f53>] sys_ioctl+0x63/0x70
> [   92.767222]  [<c12f25cd>] syscall_call+0x7/0xb

