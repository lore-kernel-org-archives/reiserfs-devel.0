From: Chris Mason <mason@suse.com>
Subject: Re: Large Partition Performance Test
Date: 12 Apr 2002 09:21:22 -0400
Message-ID: <1018617682.14429.119.camel@tiny>
References: <20020411181459.69516.qmail@web10002.mail.yahoo.com>
	<20020411234316.A3749@namesys.com> <20020411202856.GA26083@matrix.wg>
	<1018563083.14483.100.camel@tiny>  <20020412134116.B21820@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10058-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020412134116.B21820@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Dirk Mueller <dmuell@gmx.net>, reiserfs-list@namesys.com

On Fri, 2002-04-12 at 05:41, Oleg Drokin wrote:
> Hello!
> 
> On Thu, Apr 11, 2002 at 06:11:23PM -0400, Chris Mason wrote:
> 
> > Then I would expect the new allocator in busy_skip mode to fix it.  But,
> > having profiling on would tell us for sure.
> 
> Even withoyt skip_busy mode it will work much better.
> The problem is on each file creation we start to look for a free block almost
> from the beginning of disk. using no_unhashed_relocation mount option,
> we make initial block allocation to be more random and cause less overhead
> (verified).
> And in this test we create a lot of 15k files.

Ok, I'll buy that.  The only way to know for sure is to give it a try or
profile the run, but I think it is very likely to be allocator related.

-chris


