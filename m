From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: How to build a big file server
Date: 05 Jun 2003 11:17:04 +0200
Message-ID: <1054804624.1997.39.camel@wusel.schnulli.de>
References: <1054800852.1997.15.camel@wusel.schnulli.de>
	 <20030605083301.GB4849@vestdata.no> <20030605084643.GA5869@namesys.com>
	 <1054803014.1995.31.camel@wusel.schnulli.de>
	 <20030605090435.GE7950@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14416-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030605090435.GE7950@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Am Don, 2003-06-05 um 11.04 schrieb Oleg Drokin:
> Hello!
> 
> On Thu, Jun 05, 2003 at 10:50:15AM +0200, Heinz-Josef Claes wrote:
> > > > My guess is that the writes to the journal _would_ be a problem, and
> > > > that writing them to a seperate (RAID1)-device would help significantly.
> > > And with journal on battery-backed RAM it would be even faster ;)
> > The target is to have a cheep solution :/
> 
> The cheapest solution to get speed is to put journal and all data on ramdisk
> (or even into ramfs).
> This is not the safest one, though.
> 
Perhaps this is a good idea. I'll try to test the performance. Since the
servers are only used for an (additional) online backup (like
snapshots), there will not be really critical data on them. I'll see if
the performance win is worth the risk :-)

BTW: Some weeks ago there where questions about the performance of
NetApp. I think I will have the possibility to repeat the tests with a
filer. I'll post the results to the list, if somebody is interested.
> Bye,
>     Oleg
> 

