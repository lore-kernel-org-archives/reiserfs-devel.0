From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] Fix quota transaction size
Date: Fri, 20 May 2005 11:44:42 +0200
Message-ID: <20050520094442.GA8520@atrey.karlin.mff.cuni.cz>
References: <20050519094015.GC1871@atrey.karlin.mff.cuni.cz> <200505192020.00466.mason@suse.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200505192020.00466.mason@suse.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org, George Ronkin <gronkin@nerdvana.com>, akpm@osdl.org

  Hello,

> On Thursday 19 May 2005 05:40, Jan Kara wrote:
> >   Hello,
> >
> >   attached patch improves the estimates on the number of credits needed
> > for a quota operation. This is needed as currently quota overflows the
> > maximum size of a transaction if 1KB blocksize is used. Please apply.
> 
> Thanks Jan,
> 
> It would make more sense to only allocate for the quota if quotas are
> in use.  When you have 10 or more concurrent procs unlinking things,
> they end up waiting for each other because they are trying to reserve
> so many blocks in the transaction.  So, a smaller reservation allows
> for better concurrency when quotas are off.
  That's a good point. Checking whether the quota is enabled on a
transaction start is probably not a good option as quotas can be turned
on while some transaction is in progress. But we may check whether the
filesystem was mounted with some quota option (better set some
superblock flag when it is so) and reserve a space in a transaction for
quotas in that case. Mount options can be changed only on remounting
which nicely synchronizes everything anyway. And running a filesystem
with quota options but without quota turned on is probably a case
which can suffer some penalty. I'll write the patch for this.

								Honza
-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs
