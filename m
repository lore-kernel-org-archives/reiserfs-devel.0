From: Nishanth Aravamudan <nacc@us.ibm.com>
Subject: Re: [xfs-masters] [-mm PATCH 2/32] fs: fix-up schedule_timeout() usage
Date: Mon, 15 Aug 2005 11:40:13 -0700
Message-ID: <20050815184013.GJ2854@us.ibm.com>
References: <20050815180514.GC2854@us.ibm.com> <20050815180804.GE2854@us.ibm.com> <20050815181752.GA23701@lst.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25493-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050815181752.GA23701@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: xfs-masters@oss.sgi.com, sfrench@samba.org, sct@redhat.com, okir@monad.swb.de.sgi.com, trond.myklebust@fys.uio.no, reiserfs-dev@namesys.com, urban@teststation.com, nathans@sgi.com, akpm@osdl.org, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, samba@samba.org, linux-xfs@oss.sgi.com

On 15.08.2005 [20:17:52 +0200], Christoph Hellwig wrote:
> On Mon, Aug 15, 2005 at 11:08:04AM -0700, Nishanth Aravamudan wrote:
> > Description: Use schedule_timeout_{,un}interruptible() instead of
> > set_current_state()/schedule_timeout() to reduce kernel size. Also use
> > helper functions to convert between human time units and jiffies rather
> > than constant HZ division to avoid rounding errors.
> 
> The XFS changes are still wrong for the same rason as last time,
> we actually do want the daemons to do work if they're woken earlier
> using wake_up_process.

Hrm, I got dropped from the Cc list...? No worries, I'm subscribed in
two places :)

I think your reference to "last time" is the KJ patches which probably
used msleep{,_interruptible}() instead of schedule_timeout(). This
patchset, in contrast, should result in *no* functional changes (beyond
some more precisie conversions, where appropriate).
schedule_timeout_interruptible(some_value), for instance is nothing more than:

	set_current_state(TASK_INTERRUPTIBLE);
	schedule_timeout(some_value);

Just in the form of a combine function call. No loops like msleep() &
co.

Is the patch still a problem?

Thanks,
Nish
