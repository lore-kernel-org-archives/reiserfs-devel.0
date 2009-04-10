From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] reiserfs: kill-the-BKL
Date: Fri, 10 Apr 2009 15:07:35 +0200
Message-ID: <20090410130735.GC31307@elte.hu>
References: <1239070789-13354-1-git-send-email-fweisbec@gmail.com> <87tz4x97uq.fsf@basil.nowhere.org> <alpine.LFD.2.00.0904090831000.4583@localhost.localdomain> <20090409184022.GA2665@elte.hu> <20090409193635.GO14687@one.firstfloor.org> <20090409211733.GA23233@elte.hu> <20090410003947.GA21681@brong.net>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090410003947.GA21681@brong.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bron Gondwana <brong@fastmail.fm>
Cc: Andi Kleen <andi@firstfloor.org>, Linus Torvalds <torvalds@linux-foundation.org>, Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>


* Bron Gondwana <brong@fastmail.fm> wrote:

> > For example, if you have /home and / on separate reiser3 
> > filesystems, you could see as much as a 200% jump in performance 
> > straight away on certain workloads, on a dual-core box.
> > 
> > That big BKL overhead is a real reiser3 scalability problem - 
> > especially on reiser3 using servers which are likely to have 
> > several filesystems on the same box.
> 
> Yes - I'm certainly interested in that.
> 
> That said, we have a box with 83 reiserfs partitions on it, and 
> which is constrained by IO (main servers really don't need much 
> CPU).  Performance is pretty good even now.
> 
> So - I'm interested in this patch series, but not at the expense 
> of making reiserfs any less stable.  Our customers, funnily 
> enough, like it when our service is stable!

Definitely so :-)

	Ingo
