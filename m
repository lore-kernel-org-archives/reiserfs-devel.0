From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: power loss -> corruption
Date: Thu, 8 May 2003 15:01:24 +0200
Message-ID: <200305081501.24357.Dieter.Nuetzel@hamburg.de>
References: <93F527C91A6ED411AFE10050040665D007AA853B@corpusmx1.us.dg.com> <545657241.20030508143414@tnonline.net> <200305081437.59362.m.c.p@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14012-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305081437.59362.m.c.p@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc-Christian Petersen <m.c.p@gmx.net>, Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

Am Donnerstag, 8. Mai 2003 14:39 schrieb Marc-Christian Petersen:
> On Thursday 08 May 2003 14:34, Anders Widman wrote:
>
> Hi Anders,
>
> > > "data=journal" will also work. You'll need to use the data logging
> > > patches that Chris Mason has put together.
> >
> >   When will data logging be included in stock kernels?
>
> I am pretty sure, never in 2.4 timeframe. 2.5/2.6 will have it (not yet).

Why do you think?

It _is_ more than a usefull addition (fix) for 2.4 and 2.4.22-preX is a very 
good starting point. Chris et. al. are working more than a few days on it.

2.4 is more than a few months in production.
2.4 plus data-logging is in production as well.

Regards,
	Dieter
