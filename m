From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] reiserfs: kill-the-BKL
Date: Thu, 9 Apr 2009 20:40:22 +0200
Message-ID: <20090409184022.GA2665@elte.hu>
References: <1239070789-13354-1-git-send-email-fweisbec@gmail.com> <87tz4x97uq.fsf@basil.nowhere.org> <alpine.LFD.2.00.0904090831000.4583@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.0904090831000.4583@localhost.localdomain>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andi Kleen <andi@firstfloor.org>, Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Bron Gondwana <brong@fastmail.fm>, Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> > Better would be to use spinlocks if possible. I guess you just would 
> > need to find all sleep points and wrap them with lock dropping?
> 
> I do agree that a filesystem should try to avoid sleeping locks if at 
> all possible, especially on the paths that the VM uses for writeback. 
> But on the other hand, I think the issue with reiserfs is just the bad 
> latencies that the BKL can cause, and then it doesn't matter.

The main motivator is the tip:core/kill-the-BKL tree: we are working on 
removing the BKL from all of the kernel, once and forever. We are 
actually quite close to that end goal: reiser3 was the last big 
stumbling block and it's great that Frederic is tackling that.

Using a mutex seems like the sane choice here. I'd advocate spinlocks 
for a new filesystem any day (but even there it's a fine choice to have 
a mutex, if top of the line scalability is not an issue).

But for a legacy filesystem like reiser3, which depended on the BKL 
auto-dropping on schedule() it would be rather fragile to use spinlocks, 
and it would take forever to validate the result. Just one codepath 
missed with having some rare scheduling possibility and we'd have a 
kernel crash down the road.

	Ingo
