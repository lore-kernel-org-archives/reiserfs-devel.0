From: Ookhoi <ookhoi@humilis.net>
Subject: Re: Hard disk crash and solution
Date: Thu, 23 Jan 2003 08:00:30 +0100
Message-ID: <20030123080030.C2442@humilis>
References: <IKENJBHCILNPNAGHKCHFOEDMCCAA.Art@chello.nl> <3E2F13BE.8040407@namesys.com> <20030123074357.A2442@humilis> <20030123095201.A12043@namesys.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12462-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030123095201.A12043@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Ookhoi <ookhoi@humilis.net>, Hans Reiser <reiser@namesys.com>, Niek <Art@chello.nl>, reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>, mason <mason@namesys.com>

Oleg Drokin wrote (ao):
> Hello!
> 
> On Thu, Jan 23, 2003 at 07:43:57AM +0100, Ookhoi wrote:
> > > I think we should have fsck ask the user to check and see if they
> > > are using the latest fsck.
> > > "You really want to be using the very latest stable version of
> > > fsck when you run it. Please go to www.namesys.com, click on the
> > > download button, and see if you have the latest version before you
> > > continue."
> >
> > If XFree86 crashes, it says something like, 
> > "This is release foo, date bar. If it is more than six months old,
> > or if your video card is newer than this release, please see if a
> > newer release fixes it before you report a bug"
> 
> I think it does already. Along with suggesting on where to send
> bugreports if this is the latest release.
> 
> > Maybe fsck should say the same. It could very well be that you don't
> > have access to the internet when you have to perform a fsck :-)  And
> > then you still would like to know how old your tools are. If you
> > release new tools at least every two months, you can say two months.
> > You can also point to the -pre releases (with the usual warning).
> 
> main.c:  ** If you are using the latest reiserfsprogs and  it fails **\n\
> main.c-  ** please  email bug reports to reiserfs-list@namesys.com, **\n\
> main.c-  ** providing  as  much  information  as  possible --  your **\n\
> 
> Though this warning is printed at the beginning.

What I mean is that it should print the release date also. Now it says:

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.5-pre1

or

fsck.reiser4 0.2.0
Copyright (C) 2001, 2002 by Hans Reiser, licensing governed by
reiser4progs/COPYING.

It doesn't say when it is released so you can't determine if these tools
are old or not. This can be a problem if you don't have access to the
internet because you need to fsck your one and only computer. If you
notice that you have (very) old tools, you might want to do some extra
effort and go to a place where you do have internet access to fetch
newer tools. 
And it doesn't say that you shouldn't use fsck if it is older than, say,
two months.
