From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: New reiser4 snapshot (2003.09.12) is out
Date: Sat, 13 Sep 2003 05:22:50 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0309130520370.29171-100000@localhost.localdomain>
References: <20030913085201.GA13272@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15644-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030913085201.GA13272@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Alex Zarochentsev <zam@namesys.com>, Mike Benoit <mikeb@netnation.com>, reiserfs-list@namesys.com

On Sat, 13 Sep 2003, Oleg Drokin wrote:

> Hello!
> 
> On Sat, Sep 13, 2003 at 04:38:01AM -0400, Robert P. J. Day wrote:
> 
> > > It is because of paranoid -Werror flag.  
> > > ./configure --disable-werror will help you.
> > > However, if your system will have readline (as on systems which are used by
> > > reiser4progs developers :-) headers that warning disappear.

> > my system definitely has readline installed, and i get the same error.
> 
> On the other hand, you need not only readline itself, but also its
> header files. Lots of distributions (e.g. redhat-alike) form another
> package called (usuaully) readline-devel, that contains this necessary
> stuff.

i *have* the readline-devel RPM installed (this is a red hat beta system
that had an *everything* install, so it's unlikely it's missing anything.)

in addition, i tried the "./configure --disable-werror" suggestion and,
while the configure worked, the make produced the same error as before.

still open to suggestions.

rday

