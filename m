From: Chris Mason <mason@suse.com>
Subject: Re: Large Partition Performance Test
Date: 11 Apr 2002 18:11:23 -0400
Message-ID: <1018563083.14483.100.camel@tiny>
References: <20020411181459.69516.qmail@web10002.mail.yahoo.com>
	<20020411234316.A3749@namesys.com>  <20020411202856.GA26083@matrix.wg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10051-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020411202856.GA26083@matrix.wg>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Mueller <dmuell@gmx.net>
Cc: reiserfs-list@namesys.com

On Thu, 2002-04-11 at 16:28, Dirk Mueller wrote:
> On Don, 11 Apr 2002, Oleg Drokin wrote:
> 
> > 4 minutes 20 seconds to write 1.6G of data even in the beginning?!
> > This sounds too slow to me. Though RAID5 certainly can slow things down.
> 
> Its not the RAID,I can reproduce it: 
> 
> day/hour 00 00 seconds = 691
> day/hour 00 01 seconds = 720
> 
> this seems to be highly CPU bound, because it hardly ever accessed the 
> harddisk. it spends 60% in kernel space cpu though. 

Then I would expect the new allocator in busy_skip mode to fix it.  But,
having profiling on would tell us for sure.

-chris


