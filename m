From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] new data logging and quota patches available
Date: 23 Feb 2003 14:33:35 -0500
Message-ID: <1046028815.16048.417.camel@tiny.suse.com>
References: <1045870331.16048.325.camel@tiny.suse.com>
	 <1046020695.16048.409.camel@tiny.suse.com>
	 <200302231837.37418.m.c.p@gmx.net>  <200302231938.55920.m.c.p@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12878-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302231938.55920.m.c.p@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc-Christian Petersen <m.c.p@gmx.net>
Cc: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, Chris Mason <mason@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>

On Sun, 2003-02-23 at 13:39, Marc-Christian Petersen wrote:
> On Sunday 23 February 2003 18:37, Marc-Christian Petersen wrote:
> 
> Hi again,
> 
> > > I've attached a new kinoded-9.diff.gz, it will apply to both -aa and
> > > vanilla.  Please give it a try.
> > do you consider telling us the changes? ;)
> _hopefully_ an SMP deadlock while massive disk I/O. :)

No, the new kinoded-9.diff just changes how kinoded gets woken up, to do
a better job of limiting the number of unused inodes (but still
allocated) on the box.

So, which set of patches were you using when you saw the deadlock?  If
you can reproduce, could you please capture and decode the output of
sysrq-t?

-chris




