From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: Re: [Bug] possible circular locking in reiserfs_unpack
Date: Thu, 9 Sep 2010 17:34:10 +0200
Message-ID: <20100909153408.GA7838@nowhere>
References: <20100905113121.GA1876@del.dom.local> <20100908153730.5ad13f71.akpm@linux-foundation.org> <20100909015346.GA5999@nowhere> <4C88F566.7080600@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=OwkIqn+rsu0f4pUz/3mfwjiYUqUxsMzaxlh3oIcoArI=;
        b=hPD1By0uGW1ytN3vh1EwKNRd8Mlb8yfP69DtP2LmKbqbSAJLGxSaXlq5/jN2K904D0
         xDbtYd8N5sja0TeM/CGtJNbGyX2QdICxTIXCPuSQmrtSaRhc7PnH+T2CMLenZqR3wJ1H
         v+3JBZngX62L7ztj/PW63DvCIfOe/aaOK9kMw=
Content-Disposition: inline
In-Reply-To: <4C88F566.7080600@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jarek Poplawski <jarkao2@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>

On Thu, Sep 09, 2010 at 04:55:34PM +0200, Jarek Poplawski wrote:
> Frederic Weisbecker wrote, On 12/23/-28158 08:59 PM:
> 
> > On Wed, Sep 08, 2010 at 03:37:30PM -0700, Andrew Morton wrote:
> >> On Sun, 5 Sep 2010 13:31:21 +0200
> >> Jarek Poplawski <jarkao2@gmail.com> wrote:
> >>
> >>> Hi,
> >>> I get this warning on every lilo write with 2.6.35.4 and a bit/git
> >>> later too.
> >>>
> >> Can you tell us the latest kernel version which did *not* have this
> >> bug?  That way we can narrow the problem down a bit.
> >>
> >> Thanks.
> > 
> > 
> > 
> > Ah, when you see &REISERFS_SB(s)->lock in a bug report, don't hesitate to blame me :-)
> > 
> > This is a problem resulting from the bkl conversion to a mutex that introduced
> > a lot of new locking dependencies. Most of them have been fixed, but for less
> > tested paths like ioctl, we hear about it later.
> > 
> > Does the following patch fixes the issue?
> > If so, I'll make a proper changelog and put the appropriate 2.6.33-35 stable
> > tags for the backport.
> > 
> > Thnaks!
> > 
> > 
> > diff --git a/fs/reiserfs/ioctl.c b/fs/reiserfs/ioctl.c
> > index f53505d..679d502 100644
> > --- a/fs/reiserfs/ioctl.c
> > +++ b/fs/reiserfs/ioctl.c
> > @@ -188,7 +188,7 @@ int reiserfs_unpack(struct inode *inode, struct file *filp)
> >  	/* we need to make sure nobody is changing the file size beneath
> >  	 ** us
> >  	 */
> > -	mutex_lock(&inode->i_mutex);
> > +	reiserfs_mutex_lock_safe(&inode->i_mutex, inode->i_sb);
> >  	reiserfs_write_lock(inode->i_sb);
> >  
> >  	write_from = inode->i_size & (blocksize - 1);
> > 
> 
> 
> So, there is still a warning but a bit different now.
> 
> Jarek P.



That's another bug, due to the fact we sometimes recursively acquire
the reiserfs big lock.

Anyway, will have a look this evening.

Thanks.


 
> [   67.110273] =======================================================
> [   67.110313] [ INFO: possible circular locking dependency detected ]
> [   67.110313] 2.6.35.4.4a #3
> [   67.110313] -------------------------------------------------------
> [   67.110313] lilo/1620 is trying to acquire lock:
> [   67.110313]  (&journal->j_mutex){+.+...}, at: [<d0325bff>] do_journal_begin_r+0x7f/0x340 [reiserfs]
> [   67.110313] 
> [   67.110313] but task is already holding lock:
> [   67.110313]  (&REISERFS_SB(s)->lock){+.+.+.}, at: [<d032a278>] reiserfs_write_lock+0x28/0x40 [reiserfs]
> [   67.110313] 
> [   67.110313] which lock already depends on the new lock.
> [   67.110313] 
> [   67.110313] 
> [   67.110313] the existing dependency chain (in reverse order) is:
> [   67.110313] 
> [   67.110313] -> #1 (&REISERFS_SB(s)->lock){+.+.+.}:
> [   67.110313]        [<c10562b7>] lock_acquire+0x67/0x80
> [   67.110313]        [<c12facad>] __mutex_lock_common+0x4d/0x410
> [   67.110313]        [<c12fb0c8>] mutex_lock_nested+0x18/0x20
> [   67.110313]        [<d032a278>] reiserfs_write_lock+0x28/0x40 [reiserfs]
> [   67.110313]        [<d0325c06>] do_journal_begin_r+0x86/0x340 [reiserfs]
> [   67.110313]        [<d0325f77>] journal_begin+0x77/0x140 [reiserfs]
> [   67.110313]        [<d0315be4>] reiserfs_remount+0x224/0x530 [reiserfs]
> [   67.110313]        [<c10b6a20>] do_remount_sb+0x60/0x110
> [   67.110313]        [<c10cee25>] do_mount+0x625/0x790
> [   67.110313]        [<c10cf014>] sys_mount+0x84/0xb0
> [   67.110313]        [<c12fca3d>] syscall_call+0x7/0xb
> [   67.110313] 
> [   67.110313] -> #0 (&journal->j_mutex){+.+...}:
> [   67.110313]        [<c10560f6>] __lock_acquire+0x1026/0x1180
> [   67.110313]        [<c10562b7>] lock_acquire+0x67/0x80
> [   67.110313]        [<c12facad>] __mutex_lock_common+0x4d/0x410
> [   67.110313]        [<c12fb0c8>] mutex_lock_nested+0x18/0x20
> [   67.110313]        [<d0325bff>] do_journal_begin_r+0x7f/0x340 [reiserfs]
> [   67.110313]        [<d0325f77>] journal_begin+0x77/0x140 [reiserfs]
> [   67.110313]        [<d0326271>] reiserfs_persistent_transaction+0x41/0x90 [reiserfs]
> [   67.110313]        [<d030d06c>] reiserfs_get_block+0x22c/0x1530 [reiserfs]
> [   67.110313]        [<c10db9db>] __block_prepare_write+0x1bb/0x3a0
> [   67.110313]        [<c10dbbe6>] block_prepare_write+0x26/0x40
> [   67.110313]        [<d030b738>] reiserfs_prepare_write+0x88/0x170 [reiserfs]
> [   67.110313]        [<d03294d6>] reiserfs_unpack+0xe6/0x120 [reiserfs]
> [   67.110313]        [<d0329782>] reiserfs_ioctl+0x272/0x320 [reiserfs]
> [   67.110313]        [<c10c3188>] vfs_ioctl+0x28/0xa0
> [   67.110313]        [<c10c3bbd>] do_vfs_ioctl+0x32d/0x5c0
> [   67.110313]        [<c10c3eb3>] sys_ioctl+0x63/0x70
> [   67.110313]        [<c12fca3d>] syscall_call+0x7/0xb
> [   67.110313] 
> [   67.110313] other info that might help us debug this:
> [   67.110313] 
> [   67.110313] 2 locks held by lilo/1620:
> [   67.110313]  #0:  (&sb->s_type->i_mutex_key#8){+.+.+.}, at: [<d032945a>] reiserfs_unpack+0x6a/0x120 [reiserfs]
> [   67.110313]  #1:  (&REISERFS_SB(s)->lock){+.+.+.}, at: [<d032a278>] reiserfs_write_lock+0x28/0x40 [reiserfs]
> [   67.110313] 
> [   67.110313] stack backtrace:
> [   67.110313] Pid: 1620, comm: lilo Not tainted 2.6.35.4.4a #3
> [   67.110313] Call Trace:
> [   67.110313]  [<c12f9aba>] ? printk+0x18/0x1e
> [   67.110313]  [<c1054182>] print_circular_bug+0xd2/0xe0
> [   67.110313]  [<c10560f6>] __lock_acquire+0x1026/0x1180
> [   67.110313]  [<c10562b7>] lock_acquire+0x67/0x80
> [   67.110313]  [<d0325bff>] ? do_journal_begin_r+0x7f/0x340 [reiserfs]
> [   67.110313]  [<c12facad>] __mutex_lock_common+0x4d/0x410
> [   67.110313]  [<d0325bff>] ? do_journal_begin_r+0x7f/0x340 [reiserfs]
> [   67.110313]  [<c1055275>] ? __lock_acquire+0x1a5/0x1180
> [   67.110313]  [<c10897ae>] ? mempool_alloc_slab+0xe/0x10
> [   67.110313]  [<c12fb0c8>] mutex_lock_nested+0x18/0x20
> [   67.110313]  [<d0325bff>] ? do_journal_begin_r+0x7f/0x340 [reiserfs]
> [   67.110313]  [<d0325bff>] do_journal_begin_r+0x7f/0x340 [reiserfs]
> [   67.110313]  [<c1054bd2>] ? mark_held_locks+0x62/0x80
> [   67.110313]  [<c10b163d>] ? kmem_cache_alloc+0x7d/0xb0
> [   67.110313]  [<c1054e5c>] ? trace_hardirqs_on_caller+0x11c/0x160
> [   67.110313]  [<d0325f77>] journal_begin+0x77/0x140 [reiserfs]
> [   67.110313]  [<d0326262>] ? reiserfs_persistent_transaction+0x32/0x90 [reiserfs]
> [   67.110313]  [<d0326271>] reiserfs_persistent_transaction+0x41/0x90 [reiserfs]
> [   67.110313]  [<d030d06c>] reiserfs_get_block+0x22c/0x1530 [reiserfs]
> [   67.110313]  [<c1055275>] ? __lock_acquire+0x1a5/0x1180
> [   67.110313]  [<c12fc672>] ? _raw_spin_unlock_irq+0x22/0x50
> [   67.110313]  [<c10b163d>] ? kmem_cache_alloc+0x7d/0xb0
> [   67.110313]  [<c1054e5c>] ? trace_hardirqs_on_caller+0x11c/0x160
> [   67.110313]  [<c102789b>] ? sub_preempt_count+0x7b/0xb0
> [   67.110313]  [<c12fc457>] ? _raw_spin_unlock+0x27/0x40
> [   67.110313]  [<c10db9db>] __block_prepare_write+0x1bb/0x3a0
> [   67.110313]  [<c10dbbe6>] block_prepare_write+0x26/0x40
> [   67.110313]  [<d030ce40>] ? reiserfs_get_block+0x0/0x1530 [reiserfs]
> [   67.110313]  [<d030b738>] reiserfs_prepare_write+0x88/0x170 [reiserfs]
> [   67.110313]  [<d030ce40>] ? reiserfs_get_block+0x0/0x1530 [reiserfs]
> [   67.110313]  [<d03294d6>] reiserfs_unpack+0xe6/0x120 [reiserfs]
> [   67.110313]  [<d0329782>] reiserfs_ioctl+0x272/0x320 [reiserfs]
> [   67.110313]  [<d0329510>] ? reiserfs_ioctl+0x0/0x320 [reiserfs]
> [   67.110313]  [<c10c3188>] vfs_ioctl+0x28/0xa0
> [   67.110313]  [<c10c3bbd>] do_vfs_ioctl+0x32d/0x5c0
> [   67.110313]  [<c109a228>] ? might_fault+0x88/0x90
> [   67.110313]  [<c109a1e2>] ? might_fault+0x42/0x90
> [   67.110313]  [<c10b6588>] ? fget_light+0xf8/0x2f0
> [   67.110313]  [<c10c3eb3>] sys_ioctl+0x63/0x70
> [   67.110313]  [<c12fca3d>] syscall_call+0x7/0xb
> [   67.110313]  [<c12f007b>] ? cookie_v6_check+0x44b/0x630
> 

