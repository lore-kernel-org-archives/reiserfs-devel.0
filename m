From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 4/6] kill-the-BKL/reiserfs: release the write lock
	inside get_neighbors()
Date: Fri, 1 May 2009 15:31:30 +0200
Message-ID: <20090501133130.GA31856@elte.hu>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com> <1241145862-21700-5-git-send-email-fweisbec@gmail.com> <20090501055135.GF5983@elte.hu> <20090501132506.GD6011@nowhere> <1241184543.13084.13.camel@think.oraclecorp.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1241184543.13084.13.camel@think.oraclecorp.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@oracle.com>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>


* Chris Mason <chris.mason@oracle.com> wrote:

> On Fri, 2009-05-01 at 15:25 +0200, Frederic Weisbecker wrote:
> > On Fri, May 01, 2009 at 07:51:35AM +0200, Ingo Molnar wrote:
> > > 
> > > * Frederic Weisbecker <fweisbec@gmail.com> wrote:
> > > 
> > > > get_neighbors() is used to get the left and/or right blocks 
> > > > against a given one in order to balance a tree.
> > > > 
> > > > sb_bread() is used to read the buffer of these neighors blocks and 
> > > > while it waits for this operation, it might sleep.
> > > > 
> > > > The bkl was released at this point, and then we can also release 
> > > > the write lock before calling sb_bread().
> > > > 
> > > > This is safe because if the filesystem is changed after this lock 
> > > > release, the function returns REPEAT_SEARCH (aka SCHEDULE_OCCURRED 
> > > > in the function header comments) in order to repeat the neighbhor 
> > > > research.
> > > > 
> > > > [ Impact: release the reiserfs write lock when it is not needed ]
> > > 
> > > This should also be safe because under the BKL we _already_ dropped 
> > > the lock when sb_bread() blocked (which it really would in the 
> > > normal case).
> > > 
> > > There's one special case to consider though: sb_read() maps to 
> > > __bread() which can return without sleeping if the bh is already 
> > > uptodate. So if the filesystem _knows_ that the bh is already 
> > > uptodate and holds a reference to it (this is common pattern in 
> > > filesystems), it can have a locking assumption on that.
> > > 
> 
> sb_bread calls __bread which calls __getblk which always calls 
> might_sleep() before returning. So, the unlock isn't adding a 
> schedule that wasn't there before.

ah, and might_sleep() can schedule under CONFIG_PREEMPT_VOLUNTARY=y. 
Good point.

	Ingo
