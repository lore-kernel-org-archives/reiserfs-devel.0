From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Linux-2.6.9-rc2-bk7 Oops - ReiserFS: warning: vs-500: unknown
	uniqueness 126844928
Date: Fri, 24 Sep 2004 12:33:44 +0400
Message-ID: <1096014823.1446.49.camel@tribesman.namesys.com>
References: <20040922225859.GA12833@m.safari.iki.fi>
	 <1095947803.6378.31.camel@tribesman.namesys.com>
	 <20040923140633.GA23617@m.safari.iki.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21899-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040923140633.GA23617@m.safari.iki.fi>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sami Farin <7atbggg02@sneakemail.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

Hello

On Thu, 2004-09-23 at 18:06, Sami Farin wrote:
> On Thu, Sep 23, 2004 at 05:56:43PM +0400, Vladimir Saveliev wrote:
> > Hello
> > 
> > On Thu, 2004-09-23 at 02:58, Sami Farin wrote:
> > > I got no replies for messages <20040713110437.GA4571@m.safari.iki.fi>
> > > and <20040714214146.GA23531@m.safari.iki.fi> to LKML,
> > > so I try again with latest releases.  Now using 2.6.9-rc2-bk7, and I
> > > guess reiserfs might be related somehow so you folks got Cc'ed. 
> > > reiserfsck 3.6.18 found no problems for the partition
> > > (/var, 1G) after reboot, I can access every file in there and I don't
> > > have hardware problems, memtest+ runs happily for 24 hours without
> > > errors and 2.4 series have also worked without too much
> > > unexplained Oopsings with the same hardware.  Besides, there's
> > > always the same 14000030 addresss...
> > > 
> > > Linux safari.finland.fbi 2.6.9-rc2-bk7 #4 SMP Wed Sep 22 15:25:34 EEST 2004 i686 i686 i386 GNU/Linux
> > >  
> > > Gnu C                  3.4.2
> > 
> > May I ask you to compile kernel with 2.95.3 and try to reproduce the
> > problem?
> 
> Sure.
> Do you know are there known bugs in gcc 3.x series which cause
> incorrect code to be produced when compiling Linux kernel 2.6 series?
> 

No, but kernel documentation (Documentation/Changes) recommends to use
this compiler for stability.

> ...
> > > I got this oops when I was doing rpmbuild --rebuild ... 
> > > 
> > 
> > Does it crash on each rpmbuild --rebuild?
> 
> No.  It crashes every 1-12 hours and I don't need to do
> anything special.  This time I happened to be doing rpmbuild...

