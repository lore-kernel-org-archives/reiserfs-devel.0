From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Need Warm Fuzzies, ReiserFS (3)
Date: Mon, 20 Dec 2004 21:04:16 +0100
Message-ID: <200412202104.16534.christian.mayrhuber@gmx.net>
References: <41C66615.5010206@simutronics.com> <200412201725.03216.christian.mayrhuber@gmx.net> <20041220192325.GB12169@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22858-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041220192325.GB12169@zero>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 20 December 2004 20:23, Tom Vier wrote:
> I was under the impression that they were on by default. I wish this was
> documented somewhere; it's very important and i bet a LOT of sysadmins don't
> even consider the problems of having write-back caching enabled. At least
> most scsi drives come with it disabled by default. There's only wb support
> for ata and sata, fwih, too.
> 
> A quick grep didn't help me find if there's any other barrier mode other
> than flush. It looked like reiserfs had support specifically for flush mode.
> I would have thought it'd be done just as a call to something like blkwb().
> 
> 
> 
> What about software raid? Are the barriers pushed through the raid layer?

It seems so. Have a look at the kernel 2.6.9 changelog.

-- 
lg, Chris

