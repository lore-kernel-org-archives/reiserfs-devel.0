From: Oleg Drokin <green@namesys.com>
Subject: Re: How to build a big file server
Date: Thu, 5 Jun 2003 13:04:35 +0400
Message-ID: <20030605090435.GE7950@namesys.com>
References: <1054800852.1997.15.camel@wusel.schnulli.de> <20030605083301.GB4849@vestdata.no> <20030605084643.GA5869@namesys.com> <1054803014.1995.31.camel@wusel.schnulli.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14415-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1054803014.1995.31.camel@wusel.schnulli.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz-Josef Claes <hjclaes@web.de>
Cc: Ragnar Kj?rstad <reiserfs@ragnark.vestdata.no>, reiserfs-list@namesys.com

Hello!

On Thu, Jun 05, 2003 at 10:50:15AM +0200, Heinz-Josef Claes wrote:
> > > My guess is that the writes to the journal _would_ be a problem, and
> > > that writing them to a seperate (RAID1)-device would help significantly.
> > And with journal on battery-backed RAM it would be even faster ;)
> The target is to have a cheep solution :/

The cheapest solution to get speed is to put journal and all data on ramdisk
(or even into ramfs).
This is not the safest one, though.

Bye,
    Oleg
