From: Naveen Nathan <naveen@cox.net>
Subject: Re: Large Filesystem Support?
Date: Thu, 17 Mar 2005 05:44:56 -0800
Message-ID: <20050317134456.GA20133@naveen-osx.lan>
References: <20050313091306.GB4160@naveen-osx.lan> <200503161236.24270.vitaly@namesys.com> <20050317003207.GA3246@naveen-osx.lan> <200503171600.45179.vitaly@namesys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200503171600.45179.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

On Thu, Mar 17, 2005 at 04:00:45PM +0300, Vitaly Fertman wrote:
> On Thursday 17 March 2005 03:32, Naveen Nathan wrote:
> > > the patches change cofigure.in, so you need to run autoconf before 
> > > running confgure.
> > 
> > I ran autoconf after applying the patch, and compiled libaal.
> > I'm still receiving for both libaal & reiser4utils:
> > 
> > checking for _FILE_OFFSET_BITS value needed for large files... no
> > checking for _LARGE_FILES value needed for large files... no
> > 
> > I've included a log for just for libaal.
> 
> would you apply this patch instead of the previous one to libaal.

I've applied the patch, and I still get:
checking for _FILE_OFFSET_BITS value needed for large files... no
checking for _LARGE_FILES value needed for large files... no

Although I haven't said this earlier, this may help find the problem,
especially if these work on your development boxes. We're running
Redhat ES4 and we took the stock kernel config, added the reiser options
and recompiled against 2.6.11.2 kernel. I've always known stock redhat
to be difficult about anything that is not within the vendor limitations.
Well like most commercial software anyways.

I've attached the compile log.

Thanks,
Naveen Nathan
