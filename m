From: John Dalbec <jpdalbec@ysu.edu>
Subject: Re: Trying to port data-logging to RH 2.4.18-19.7.x kernel
Date: Fri, 31 Jan 2003 10:43:29 -0500
Message-ID: <3E3A99A1.2010600@ysu.edu>
References: <3E3A8B15.80300@ysu.edu> <1044024906.15685.206.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12595-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Chris Mason wrote:
> On Fri, 2003-01-31 at 09:41, John Dalbec wrote:
> 
>>I'm trying to port Chris's data-logging patches to the Red Hat 
>>2.4.18-19.7.x kernel.  My first effort works fine on my workstation with 
>>ReiserFS and NFS, but not on the production server:
>>
>>
>>>Jan 31 05:47:28 mail03 kernel: search_by_key called without kernel lock held
>>
> 
> This is a debugging check that shows our search_by_key function was
> called without first taking the big kernel lock, and the trace below
> shows it happened during a call to reiserfs_read_inode2.  So, what you
> need to do is put lock_kernel() calls into reiserfs_read_inode2, or more
> likely into reiserfs_lookup.

I don't see reiserfs_lookup in the stack trace, and it already calls 
reiserfs_check_lock_depth.  Why would I need lock_kernel there?
Red Hat's low-latency patch puts a conditional_schedule at the top of 
search_by_key.  Would that cause the kernel lock to be dropped?  I see
/* The function is NOT SCHEDULE-SAFE! */

> 
> But, as new kernels come out, I don't usually back port data logging
> fixes to the old kernels.  So the 2.4.18 data logging code is missing a
> number of fixes the later code has.  Which version of the data logging
> code are you running on?
> 
> -chris
> 
> 
> 

I started from your 2.4.20 patches and modified them to fit.  The kernel 
RPM I'm using starts from 2.4.19-rc1-ac1 and adds patches on top of 
that.  I've applied ReiserFS-pending patches 1-6 and 13 and your quota 
patch for 2.4.19, followed by the data logging.
Thanks,
John



