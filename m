From: Chris Mason <mason@suse.com>
Subject: Re: power loss -> corruption
Date: 08 May 2003 09:24:17 -0400
Message-ID: <1052400256.14612.485.camel@tiny.suse.com>
References: <93F527C91A6ED411AFE10050040665D007AA853B@corpusmx1.us.dg.com>
	 <545657241.20030508143414@tnonline.net>  <200305081437.59362.m.c.p@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14016-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305081437.59362.m.c.p@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc-Christian Petersen <m.c.p@gmx.net>
Cc: Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

On Thu, 2003-05-08 at 08:39, Marc-Christian Petersen wrote:
> On Thursday 08 May 2003 14:34, Anders Widman wrote:
> 
> Hi Anders,
> 
> > > "data=journal" will also work. You'll need to use the data logging
> > > patches that Chris Mason has put together.
> >   When will data logging be included in stock kernels?
> I am pretty sure, never in 2.4 timeframe. 2.5/2.6 will have it (not yet).

I expect to submit for 2.4.22-preX once it starts, the latest data
logging update removes the VFS changes that held up inclusion in the
past.

-chris


