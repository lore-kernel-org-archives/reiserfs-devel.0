From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: How to build a big file server
Date: 05 Jun 2003 11:30:32 +0200
Message-ID: <1054805431.1995.42.camel@wusel.schnulli.de>
References: <1054800852.1997.15.camel@wusel.schnulli.de>
	 <20030605083301.GB4849@vestdata.no>
	 <1054802574.1995.26.camel@wusel.schnulli.de>
	 <200306051045.53677.m.c.p@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14417-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306051045.53677.m.c.p@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc-Christian Petersen <m.c.p@gmx.net>
Cc: reiserfs-list@namesys.com

Am Don, 2003-06-05 um 10.45 schrieb Marc-Christian Petersen:
> On Thursday 05 June 2003 10:42, Heinz-Josef Claes wrote:
> 
> Hi Heinz,
> 
> > We used a cheap 3Com IDE RAID controler (sorry, don't know which one)
> > one and a half year ago (without writeback-cache, in another company).
> > It was terribly slow when writing with hardware RAID. With software
> > RAID, it was much faster - that's the reason for my question. Do you
> > know a useful IDE RAID controler which runs with linux? (For your
> > information: the machines are not mission critical, only for having an
> > (additional) online backup for about 5000 users).
> 3ware Controller. Works perfect.
Do you think about serial or parallel ATA? Unfortunately I have no
experience with serial ATA. Are these as good and cheap as 3ware writes
on there home page? 

