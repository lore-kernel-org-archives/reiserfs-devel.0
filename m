From: Marc-Christian Petersen <m.c.p@gmx.net>
Subject: Re: How to build a big file server
Date: Thu, 5 Jun 2003 10:45:53 +0200
Message-ID: <200306051045.53677.m.c.p@gmx.net>
References: <1054800852.1997.15.camel@wusel.schnulli.de> <20030605083301.GB4849@vestdata.no> <1054802574.1995.26.camel@wusel.schnulli.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14410-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1054802574.1995.26.camel@wusel.schnulli.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Heinz-Josef Claes <hjclaes@web.de>, Ragnar =?iso-8859-15?q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Cc: reiserfs-list@namesys.com

On Thursday 05 June 2003 10:42, Heinz-Josef Claes wrote:

Hi Heinz,

> We used a cheap 3Com IDE RAID controler (sorry, don't know which one)
> one and a half year ago (without writeback-cache, in another company).
> It was terribly slow when writing with hardware RAID. With software
> RAID, it was much faster - that's the reason for my question. Do you
> know a useful IDE RAID controler which runs with linux? (For your
> information: the machines are not mission critical, only for having an
> (additional) online backup for about 5000 users).
3ware Controller. Works perfect.

-- 
ciao, Marc

