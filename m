From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Benchmark : ext3 vs reiser4 and effects of fragmentation.
Date: Thu, 16 Sep 2004 12:52:49 +0400
Message-ID: <20040916085248.GI5137@backtop.namesys.com>
References: <4148BC0E.5010509@willsmith.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21806-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4148BC0E.5010509@willsmith.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Smith <will@willsmith.org>
Cc: reiserfs-list@namesys.com

On Thu, Sep 16, 2004 at 06:02:54AM +0800, Will Smith wrote:
> I've spent the last 2 days coding and running benchmarks
> on the effects of fragmentation on both ext3 and
> reiser4 performance.
> 
> Explanation and source code is at
> http://www.willsmith.org/opensource/reiser4/fragperf/
> 
> Results and graphs are at
> http://www.willsmith.org/opensource/reiser4/fragperf/test1/
> 
> Dataset is a kernel source (~200Mb) in a small 350Mb
> partition, with random deletes, copies and overwrites
> to cause fragmentation.
> 
> In conclusion:
> 
> 1) reiser4 is slightly faster than ext3 in some cases, but
>    much faster in others (no surprise).  However,
>    deletes are slightly slower.
> 
> 2) ext3 degrades badly from fragmentation when running
>    ordered (non-random) access patterns.  reiser4
>    also degrades but not as much.
> 
> 3) the repacker can bring performance of reiser4 back
>    to full speed, but only if run several times.

yes, we had similar results.  it is so cool that reiser4 repacker effect
is visible outside namesys :)

> 
> 4) the repacker is not yet stable - I had to run fsck
>    a few times after repacking, and once got a kernel
>    stack trace during repacking resulting in an
>    un-unmountable filesystem.

unmergable units shouldn't be problem for the reiser4 kernel code.

but what was the stack trace?  Was there "nikita-3532: Sibling nodes on the
different levels" message?

> I'll gladly rerun with different parameters and/or change
> the script if requested.
> 
> Will Smith

Thanks

-- 
Alex.
