From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: New reiser4 snapshot (2003.09.12) is out
Date: Sun, 14 Sep 2003 08:51:03 +0400
Message-ID: <20030914045103.GK2123@backtop.namesys.com>
References: <20030913063124.GJ2123@backtop.namesys.com> <3F632446.30004@namesys.com> <20030913192123.GA24770@namesys.com> <200309140004.57447.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15666-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200309140004.57447.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Hans Reiser <reiser@namesys.com>, "Robert P. J. Day" <rpjday@mindspring.com>, Mike Benoit <mikeb@netnation.com>, reiserfs-list@namesys.com

On Sun, Sep 14, 2003 at 12:04:57AM +0400, Vitaly Fertman wrote:
> Hi, 
> 
> I hope this patch for configure.in will solve the problem.
> Try it please and tell us about your results.
> 

What about making --disable-werror working?

Or, which is better, I think, remove -Werror from CFLAGS ?  
It is second time when small warning breaks reiser4progs compilation. 


> On Saturday 13 September 2003 23:21, Oleg Drokin wrote:
> > Hello!
> >
> > On Sat, Sep 13, 2003 at 06:05:58PM +0400, Hans Reiser wrote:
> > > >>my system definitely has readline installed, and i get the same error.
> > > >
> > > >On the other hand, you need not only readline itself, but also its
> > > > header files.
> > > >Lots of distributions (e.g. redhat-alike) form another package called
> > > >(usuaully) readline-devel,
> > > >that contains this necessary stuff.
> > >
> > > did you adjust our headers to be redhat compatible?  If not, please do.
> >
> > The problem turned out to be that RedHat's readline was compiled with
> > ncurses dynamically, so when you link in readline, you need to link ncurses
> > too.
> >
> > Vitaly will release the fix to configure script shortly, I believe.
> >
> > Bye,
> >     Oleg
> 
> -- 
> Thanks,
> Vitaly Fertman


-- 
Alex.
