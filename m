From: "Chester R. Hosey" <chosey@nauticom.net>
Subject: Re: Less disk space with reiser4?
Date: Mon, 11 Apr 2005 16:43:28 -0400
Message-ID: <425AE170.7010806@nauticom.net>
References: <425A8A1D.9040206@siwnet.net> <20050411195253.GD6211@backtop.namesys.com> <425ADC6C.8090209@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23853-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <425ADC6C.8090209@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Many filesystems claim degraded performance as free space decreases 
beyond a certain threshold. However, they often allow the user to exceed 
this point and accept the decline in performance.

While Alex's explanation does well to explain why a certain amount of 
free space is required in the case of a commit depending on a certain 
amount of free space, it doesn't quite show that 45 gigs are required to 
cover this requirement on a terabyte of space. Is this a reasonable 
requirement?

Can we get a FAQ entry on namesys.com which addresses this additional 
overhead imposed by V4 (including whether this is a permanent thing, or 
whether future revisions will likely reduce the overhead)?

Hans Reiser wrote:
 > Alex Zarochentsev wrote:
 >
 >
 >>On Mon, Apr 11, 2005 at 04:30:53PM +0200, Stefan Andersson wrote:
 >>
 >>
 >>
 >>>Hi,
 >>>
 >>>I have a disk array wich I used reiserfs(v3) on, and got 932G.
 >>>Now I started to test reiser4 on it and get less space, 886G.
 >>>
 >>>Is it suppose to be like this or is there something wrong?
 >>>
 >>>
 >>
 >>reiser4 reserves 5% of disk space.
 >>
 >>That is so because of delayed block allocation impelented in reiser4. 
  Actual
 >>block allocation is done near the transaction commit, it means the 
allocation
 >>has to be reliable -- we can't return ENOSPC because the write(2) 
call when we
 >>could return an error was already completed successfully.
 >>
 >>The reserved space makes the allocation reliable because it covers 
possible
 >>insertions (and growing of the internal reiser4 tree) of new extent items
 >>insertions on a highly fragmented fs.
 >>
 >>
 >
 > It also improves performance to ensure that at least 5% is free.
 >
 >
 >>
 >>
 >>
 >>>I'am using linux 2.6.11.4 and default settings for mkfs.reiser4 and
 >>>mkfs.reiserfs,
 >>>and reiser4 patch from 2.6.11-mm3.
 >>>
 >>>//Stetan
 >>>
 >>>
 >>>
 >>
 >>
 >>
 >
 >

