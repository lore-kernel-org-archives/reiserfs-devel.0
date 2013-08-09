From: Jan Kara <jack@suse.cz>
Subject: Re: [patch v4 0/3] reiserfs locking patchset v4
Date: Fri, 9 Aug 2013 23:31:27 +0200
Message-ID: <20130809213127.GA4100@quack.suse.cz>
References: <20130808213606.396768830@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130808213606.396768830@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org, jack@suse.cz

On Thu 08-08-13 17:36:06, Jeff Mahoney wrote:
> This patchset untangles some of the locking in reiserfs. It has seen more
> testing as part of the maintenance cycle in SLE 11 SP2.
> 
> - We push the write lock out of the xattr code. It doesn't need it and
>   we can simplify locking by releasing and reacquiring the locks around
>   the xattr calls.
> 
> - Handle nested locks properly. There's confusion on when a lock is nested,
>   when it's not, and how to drop it across schedules like the BKL it is
>   modeled after. We make the distinction between taking/releasing the lock
>   and when to drop it for schedules and simplify the logic. This fixes
>   a number of deadlocks that happen because the intention was to drop
>   the write lock but it really only decremented the use count.
> 
> - Fix the deadlocks with the quota code. This involves dropping the write
>   lock before quota calls and reacquring it afterwards. Without this patch
>   reiserfs quotas are essentially unusable.
> 
> Previous postings of this patchset were mismerged.
> 
> This revision integrates Jan's advice about search_by_key_reada returning
> the depth instead of a bool.
> 
> Jan - This series is in the for-3.12 branch of
> git.kernel.org:/pub/scm/linux/kernel/git/jeffm/linux-reiserfs.git
  Thanks! I've pulled this series to my tree.

							Honza

-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
