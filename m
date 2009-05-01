From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 0/6] kill-the-BKL/reiserfs3: performance improvements,
 faster than Bkl based scheme
Date: Fri, 1 May 2009 14:11:31 -0700 (PDT)
Message-ID: <alpine.LFD.2.00.0905011350500.5379@localhost.localdomain>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com> <alpine.LFD.2.00.0905011236530.5379@localhost.localdomain> <20090501203309.GA6243@elte.hu> <20090501203639.GA9396@elte.hu>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090501203639.GA9396@elte.hu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>


On Fri, 1 May 2009, Ingo Molnar wrote:
> * Ingo Molnar <mingo@elte.hu> wrote:
> 
> > The BKL is clearly removed at a faster reate with such debugging 
> > measures in place. With such measures the BKL _really_ hurts, and 
> > very visibly so - and that results in active removal.
> 
> Btw., if you can think of any way to create a cleaner debug tool 
> here i'd be glad to start a new tree that adds only _that_ tool - 
> and that could perhaps be dealt with independently and possibly 
> pulled upstream too, if clean enough.

Quite frankly, for something as clearly defined as as a filesystem, I 
would literally suggest starting out with a few trivial stages:

 Stage 1:
 - raw search-and-replace of [un]lock_kernel()

	sed 's/unlock_kernel()/reiserfs_unlock(sb)/g'
	sed 's/lock_kernel()/reiserfs_lock(sb)/g'

   and then obviously fix it up so that 'sb' always exists (ie you would 
   need to add a a few

	struct super_block *sb = inode->i_sb;

   lines manually to make the end result work.

 - add that 'reiserfs_[un]lock()' pair around every single VFS entry-point 
   that currently gets called with lock_kernel(). They'd _still_ get 
   called with lock-kernel too (you're not fixing that), but now they'd 
   _also_ take the new lock.

 - make reiserfs_unlock(sb) just do [un]lock_kernel(), and use that as a 
   known good starting point. Nothing has really changed (and you in fact 
   _increased_ the nesting on the BKL, since now the BKL is gotten twice 
   in those areas that were called from the VFS with the BKL held), but 
   you now have a mindless and pretty trivial conversion where you still 
   have a working system, and nothing really changed - except you now have 
   the beginnings of a nice abstraction.

IOW, "stage 1" is all totally mindless, and never breaks anything. It's 
very much designed to be "obviously correct".

 Stage 2:
 - switch over reiserfs_[un]lock() to a per-superblock mutex, and enable 
   lockdep, and start looking for nesting problems.

IOW, "stage 2" is when you make a _minimal_ change to now enable all the 
good lockdep infrastructure. But it's also designed to just do _one_ 
thing: look at nesting. Nothing else.

 Stage 3:
 - once you've fixed all nesting problems (well, most of them - enable a 
   swapfile on that filesystem and I bet you'll find a few more), you 
   might want to look at performance issues. In particular, you want to 
   drop the lock over at least the most _common_ blocking operations, if 
   at all possible.

And stage 3 is where it would make absolutely _tons_ of sense to just add 
some very simple infrastructure for having a per-thread "IO warning 
counter", and then simply increment/decrement that counter in 
reiserfs_[un]lock().

But exactly because we do NOT want to get warnings about BKL use in all 
the _other_ subsystems, we don't want to mix this up with the BKL counter 
that we already have. You could probably even use the tracing 
infrastructure to do this: enable tracing in reiserfs_lock(), disable it 
in reiserfs_unlock(), and look at what you catch in between.

I dunno. That's how I would go about it if I just wanted to clean up a 
specific subsystem, and didn't want to tie it together with getting 
everything else right too.

			Linus
