From: Christoph Hellwig <hch@lst.de>
Subject: Re: [xfs-masters] [-mm PATCH 2/32] fs: fix-up schedule_timeout() usage
Date: Mon, 15 Aug 2005 22:36:20 +0200
Message-ID: <20050815203620.GA25822@lst.de>
References: <20050815180514.GC2854@us.ibm.com> <20050815180804.GE2854@us.ibm.com> <20050815181752.GA23701@lst.de> <20050815184013.GJ2854@us.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25499-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050815184013.GJ2854@us.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: Christoph Hellwig <hch@lst.de>, xfs-masters@oss.sgi.com, sfrench@samba.org, sct@redhat.com, okir@monad.swb.de.sgi.com, trond.myklebust@fys.uio.no, reiserfs-dev@namesys.com, urban@teststation.com, nathans@sgi.com, akpm@osdl.org, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, samba@samba.org, linux-xfs@oss.sgi.com

On Mon, Aug 15, 2005 at 11:40:13AM -0700, Nishanth Aravamudan wrote:
> Hrm, I got dropped from the Cc list...? No worries, I'm subscribed in
> two places :)

I didn't do that manually, must haven some mail header thing.

> I think your reference to "last time" is the KJ patches which probably
> used msleep{,_interruptible}() instead of schedule_timeout(). This
> patchset, in contrast, should result in *no* functional changes (beyond
> some more precisie conversions, where appropriate).
> schedule_timeout_interruptible(some_value), for instance is nothing more than:
> 
> 	set_current_state(TASK_INTERRUPTIBLE);
> 	schedule_timeout(some_value);
> 
> Just in the form of a combine function call. No loops like msleep() &
> co.
> 
> Is the patch still a problem?

No, it's fine.  Sorry for the noise.

