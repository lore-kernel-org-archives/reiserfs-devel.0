From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: 2.6.8.1-mm4 oops
Date: Sat, 28 Aug 2004 22:27:32 +0400
Message-ID: <20040828182731.GH5108@backtop.namesys.com>
References: <20040828170721.23774956@rayanne>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21007-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040828170721.23774956@rayanne>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Etchemaite <petchema@concept-micro.com>
Cc: reiserfs-list@namesys.com

On Sat, Aug 28, 2004 at 05:07:21PM +0200, Pierre Etchemaite wrote:
> 
> 	Hi all,
> 
> Just gave kernel 2.6.8.1-mm4's Reiserfs4 support a try on my home box :)
> 
> As a test, I tried to import Linux kernel 2.6.0 source tree into a brand new
> Subversion repository (Just in case you don't
> know about Subversion yet, try http://subversion.tigris.org/, it's a
> very nice revision control system).
> 
> Importing was much slower than expected, so I straced svn. The problem was
> easy to understand: being based on BerkeleyDB4 transactions, it was doing
> fsync() all around, and I remember reading in this list that Reiserfs4's
> fsync()s [well, was it sync() ?] was currently exiting synchronously, which
> is not the traditional behavior of this call.
> 
> Ok, nevermind if this was a bad speed test ;) I ^C'ed strace (during a
> fsync() I think, since most of svn's time was spent there), and all
> the sudden OOPses started scrolling in logs' window. After a few seconds, I
> had to reset the system.

did you enable reiser4 debugging options?

> 
> Too bad I couldn't find anything in the logs after reboot, but the problem
> occured on first try, so I suspect it will be easy to reproduce.
> 
> Good luck!
> Pierre.

thanks for the report.


-- 
Alex.
