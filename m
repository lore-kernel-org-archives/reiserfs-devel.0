From: Redeeman <redeeman@redeeman.linux.dk>
Subject: Re: Reiser4 needs more testers
Date: Sat, 27 Mar 2004 01:47:25 +0100
Message-ID: <1080348445.32761.4.camel@redeeman.linux.dk>
References: <16484.24086.167505.94478@laputa.namesys.com>
	 <406462C1.5020507@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17519-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <406462C1.5020507@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Fri, 2004-03-26 at 18:05, Hans Reiser wrote:
> We have one NFS related bug remaining, and one mmap all of memory 
> related bug (and performance issue) that you can hit using iozone.  We 
> will fix both of these in next week's snapshot, they were both multi-day 
> bug fixes.  When they are fixed, unless users/distros find bugs next 
> week we will submit it for inclusion in the -mm and then the official 
> kernel.
> 
> We hope it is now fairly stable for average users if you avoid those two 
> issues (we need to get rid of those dire warnings about its 
> stability...., we will remember that next snapshot....;-) )
> 
i assume reiser4 will be proper to use for real soon? :>

> We need a lot more real user testers, because we have run out of scripts 
> that can crash it, and there are distros that would like to ship it 
> soon.  Please also complain to vitaly@namesys.com and ramon@namesys.com 
> about poor documentation, etc., ....
> 
> The new reiser4 snapshot (against 2.6.5-rc2) is available at
> 
> http://www.namesys.com/snapshots/2004.03.26/
-- 
Regards, Redeeman
redeeman@metanurb.dk

