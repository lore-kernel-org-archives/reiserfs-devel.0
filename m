From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: How to build a big file server
Date: 05 Jun 2003 10:50:15 +0200
Message-ID: <1054803014.1995.31.camel@wusel.schnulli.de>
References: <1054800852.1997.15.camel@wusel.schnulli.de>
	 <20030605083301.GB4849@vestdata.no>  <20030605084643.GA5869@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14413-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030605084643.GA5869@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Ragnar Kj?rstad <reiserfs@ragnark.vestdata.no>, reiserfs-list@namesys.com

Am Don, 2003-06-05 um 10.46 schrieb Oleg Drokin:
> Hello!
> 
> On Thu, Jun 05, 2003 at 10:33:01AM +0200, Ragnar Kj?rstad wrote:
>  
> > My guess is that the writes to the journal _would_ be a problem, and
> > that writing them to a seperate (RAID1)-device would help significantly.
> 
> And with journal on battery-backed RAM it would be even faster ;)
The target is to have a cheep solution :/

Thanks,
Heinz-Josef

> 
> Bye,
>     Oleg
> 

