From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH] reiserfs: kill-the-BKL
Date: Thu, 09 Apr 2009 17:15:09 +0200
Message-ID: <87tz4x97uq.fsf@basil.nowhere.org>
References: <1239070789-13354-1-git-send-email-fweisbec@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1239070789-13354-1-git-send-email-fweisbec@gmail.com> (Frederic Weisbecker's message of "Tue,  7 Apr 2009 04:19:49 +0200")
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Bron Gondwana <brong@fastmail.fm>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Alexander Viro <viro@zeniv.linux.org.uk>

Frederic Weisbecker <fweisbec@gmail.com> writes:
>
> So the new lock that replaces the bkl here is a per superblock mutex 

You have to be very careful with this. Mutexes can be slower than
spinlocks (and the new BKL is a spinlock) in some situations, they
typically schedule much more etc., which can be costly. So this might
have actually made it slower if you're unlucky.  There were some
experimental changes recently to make mutexes more behave like
spinlocks, but I don't think they're fully performance equivalent.

Better would be to use spinlocks if possible. I guess you just would
need to find all sleep points and wrap them with lock dropping?

> After this patch, reiserfs suffers from a slight performance regression (for now).

That might be related to the scheduling  behaviour. Watch the reschedule
counters in vmstat 1

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
