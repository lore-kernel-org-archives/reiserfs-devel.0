From: Christoph Hellwig <hch@lst.de>
Subject: Re: [xfs-masters] [-mm PATCH 2/32] fs: fix-up schedule_timeout() usage
Date: Mon, 15 Aug 2005 20:17:52 +0200
Message-ID: <20050815181752.GA23701@lst.de>
References: <20050815180514.GC2854@us.ibm.com> <20050815180804.GE2854@us.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25491-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050815180804.GE2854@us.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xfs-masters@oss.sgi.com
Cc: sfrench@samba.org, sct@redhat.com, okir@monad.swb.de.sgi.com, trond.myklebust@fys.uio.no, reiserfs-dev@namesys.com, urban@teststation.com, nathans@sgi.com, akpm@osdl.org, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, samba@samba.org, linux-xfs@oss.sgi.com

On Mon, Aug 15, 2005 at 11:08:04AM -0700, Nishanth Aravamudan wrote:
> Description: Use schedule_timeout_{,un}interruptible() instead of
> set_current_state()/schedule_timeout() to reduce kernel size. Also use
> helper functions to convert between human time units and jiffies rather
> than constant HZ division to avoid rounding errors.

The XFS changes are still wrong for the same rason as last time,
we actually do want the daemons to do work if they're woken earlier
using wake_up_process.

