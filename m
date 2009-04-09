From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH] reiserfs: kill-the-BKL
Date: Thu, 9 Apr 2009 21:36:35 +0200
Message-ID: <20090409193635.GO14687@one.firstfloor.org>
References: <1239070789-13354-1-git-send-email-fweisbec@gmail.com> <87tz4x97uq.fsf@basil.nowhere.org> <alpine.LFD.2.00.0904090831000.4583@localhost.localdomain> <20090409184022.GA2665@elte.hu>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090409184022.GA2665@elte.hu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andi Kleen <andi@firstfloor.org>, Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Bron Gondwana <brong@fastmail.fm>, Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>

> Using a mutex seems like the sane choice here. I'd advocate spinlocks 
> for a new filesystem any day (but even there it's a fine choice to have 
> a mutex, if top of the line scalability is not an issue).
> 
> But for a legacy filesystem like reiser3, which depended on the BKL 

reiser3 is much more widely used in the user base than a lot of "non 
legacy" file systems. It's very likely it has significantly
more users than ext4 for example. Remember that it was the default file system
for a major distribution until very recently. I also got a few
reiser3 fs still around, it tended to perform very well
on kernel hacker workloads.

Given all that I think the current performance penalties Frederic reports
are not acceptable. Dropping BKL is not a cause in itself, but should
just improve performance.

> auto-dropping on schedule() it would be rather fragile to use spinlocks, 
> and it would take forever to validate the result. 

Not convinced it would be that hard. It could be probably done with some 
straight forward static code analysis. And after that since there's
not much development going anymore it's unlikely to break again.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
