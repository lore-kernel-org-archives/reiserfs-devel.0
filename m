From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: power loss -> corruption
Date: Thu, 8 May 2003 15:36:29 +0200
Message-ID: <200305081536.29471.Dieter.Nuetzel@hamburg.de>
References: <93F527C91A6ED411AFE10050040665D007AA853B@corpusmx1.us.dg.com> <200305081437.59362.m.c.p@gmx.net> <1052400256.14612.485.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14018-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1052400256.14612.485.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>, Marc-Christian Petersen <m.c.p@gmx.net>
Cc: Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

Am Donnerstag, 8. Mai 2003 15:24 schrieb Chris Mason:
> On Thu, 2003-05-08 at 08:39, Marc-Christian Petersen wrote:
> > On Thursday 08 May 2003 14:34, Anders Widman wrote:
> >
> > Hi Anders,
> >
> > > > "data=journal" will also work. You'll need to use the data logging
> > > > patches that Chris Mason has put together.
> > >
> > >   When will data logging be included in stock kernels?
> >
> > I am pretty sure, never in 2.4 timeframe. 2.5/2.6 will have it (not yet).
>
> I expect to submit for 2.4.22-preX once it starts, the latest data
> logging update removes the VFS changes that held up inclusion in the
> past.

He, he, that's what I've expected...;-)

Good work, Chris!

I'll compiling,now.
Does it work on-top of -aa (-jam) or do I have to do some handwork as always?

Regards,
	Dieter
