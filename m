From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] reiserfs: kill-the-BKL
Date: Thu, 9 Apr 2009 23:17:33 +0200
Message-ID: <20090409211733.GA23233@elte.hu>
References: <1239070789-13354-1-git-send-email-fweisbec@gmail.com> <87tz4x97uq.fsf@basil.nowhere.org> <alpine.LFD.2.00.0904090831000.4583@localhost.localdomain> <20090409184022.GA2665@elte.hu> <20090409193635.GO14687@one.firstfloor.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090409193635.GO14687@one.firstfloor.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <andi@firstfloor.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Bron Gondwana <brong@fastmail.fm>, Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>


* Andi Kleen <andi@firstfloor.org> wrote:

> > Using a mutex seems like the sane choice here. I'd advocate spinlocks 
> > for a new filesystem any day (but even there it's a fine choice to have 
> > a mutex, if top of the line scalability is not an issue).
> > 
> > But for a legacy filesystem like reiser3, which depended on the BKL 
> 
> reiser3 is much more widely used in the user base than a lot of 
> "non legacy" file systems. It's very likely it has significantly 
> more users than ext4 for example. Remember that it was the default 
> file system for a major distribution until very recently. [...]

( Drop the condescending tone please - i very much know that SuSE 
  installed reiser3 by default for years. It is still a legacy 
  filesystem and no new development has gone into it for years. )

> [...] I also got a few reiser3 fs still around, it tended to 
> perform very well on kernel hacker workloads.

Then i am sure you must like this patch: it introduces a per 
superblock lock, splitting up the big BKL serialization. You
totally failed to even acknowledge that advantage, maybe you
missed that aspect?

For example, if you have /home and / on separate reiser3 
filesystems, you could see as much as a 200% jump in performance 
straight away on certain workloads, on a dual-core box.

That big BKL overhead is a real reiser3 scalability problem - 
especially on reiser3 using servers which are likely to have several 
filesystems on the same box.

Frederic reported a slight drop in single-threaded performance,
to be expected from a work in progress patch.

	Ingo
