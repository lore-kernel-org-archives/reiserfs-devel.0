From: John Dalbec <jpdalbec@ysu.edu>
Subject: Re: Trying to port data-logging to RH 2.4.18-19.7.x kernel
Date: Fri, 31 Jan 2003 16:28:19 -0500
Message-ID: <3E3AEA73.1090607@ysu.edu>
References: <3E3A8B15.80300@ysu.edu>	 <1044024906.15685.206.camel@tiny.suse.com>  <3E3A99A1.2010600@ysu.edu> <1044029165.15685.226.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12601-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Chris Mason wrote:
> On Fri, 2003-01-31 at 10:43, John Dalbec wrote:
> 
>>Chris Mason wrote:
>>
>>>On Fri, 2003-01-31 at 09:41, John Dalbec wrote:
>>>
>>>
>>>>I'm trying to port Chris's data-logging patches to the Red Hat 
>>>>2.4.18-19.7.x kernel.  My first effort works fine on my workstation with 
>>>>ReiserFS and NFS, but not on the production server:
>>>>
>>>>
>>>>
>>>>>Jan 31 05:47:28 mail03 kernel: search_by_key called without kernel lock held
>>>>
>>>This is a debugging check that shows our search_by_key function was
>>>called without first taking the big kernel lock, and the trace below
>>>shows it happened during a call to reiserfs_read_inode2.  So, what you
>>>need to do is put lock_kernel() calls into reiserfs_read_inode2, or more
>>>likely into reiserfs_lookup.
>>
>>I don't see reiserfs_lookup in the stack trace, and it already calls 
>>reiserfs_check_lock_depth.  Why would I need lock_kernel there?
>>Red Hat's low-latency patch puts a conditional_schedule at the top of 
>>search_by_key.  Would that cause the kernel lock to be dropped?  I see
>>/* The function is NOT SCHEDULE-SAFE! */
>>
> 
> 
> Must be the iget4 path then, probably triggered by nfs.  The locking
> rules say the BKL is supposed to be held when you call read_inode.  The
> fix would either to be finding the caller or just adding lock_kernel
> calls to reiserfs_read_inode2.  It is safe to nest them, so adding them
> won't cause problems.
> 
> The BKL is dropped during a schedule, but taken again before returning
> control to the calling function, so that low latency patch probably
> isn't causing problems.  I'm assuming they are using Andrew Morton's low
> latency patch, which doesn't cause problems.
> 
> -chris
> 
> 
> 

The immediate caller is the "ReiserFS specific hack" in 
fs/inode.c:get_inode signed <mason@suse.com>.  Is the BKL supposed to be 
held when get_inode is called?  I don't see it documented either way in 
Documentation/filesystems/Locking.  It looks easier to add lock_kernel 
calls there than in read_inode2 (assuming they're supposed to last 
through the entire function call).
John

