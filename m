From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] new data logging and quota patches available
Date: 24 Feb 2003 13:08:26 -0500
Message-ID: <1046110105.16042.515.camel@tiny.suse.com>
References: <1045870331.16048.325.camel@tiny.suse.com>
	 <1046020695.16048.409.camel@tiny.suse.com>
	 <3E59787F.2030009@mb.tu-ilmenau.de>  <200302241859.16343.m.c.p@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12895-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302241859.16343.m.c.p@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc-Christian Petersen <m.c.p@gmx.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>, Manuel Krause <manuel.krause@mb.tu-ilmenau.de>

On Mon, 2003-02-24 at 12:59, Marc-Christian Petersen wrote:
> On Monday 24 February 2003 02:42, Manuel Krause wrote:
> 
> Hi Manuel,
> 
> > I see a performance decrease with my copies in data=ordered mode by
> > about 7.5% compared to the 2.4.20-pre10-data-logging (it's about 19%
> > decrease for 2.4.21-pre4 since 2.4.19-data-logging). What is causing
> > this? Partly I can blame it on the disk content distribution that
> > changed. If I removed the kinoded related patches would the throughput
> > rate increase?
> I can confirm that this is also true for me. I am using the -aa data-logging 
> 36.

Sorry, you confirm that with kinoded related patches removed (and the
dirty_inode patch) things get faster?

Also, are you using kinoded-8 or kinoded-9?

-chris


