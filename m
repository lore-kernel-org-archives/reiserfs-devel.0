From: Michael Barry <jabbera@gmail.com>
Subject: Re: reiser4 and reiserfs co-existence?
Date: Tue, 9 Nov 2004 12:47:07 -0500
Message-ID: <662c77ee04110909473d0f6dd3@mail.gmail.com>
References: <b28a886104110808555d3f59dc@mail.gmail.com>
	 <1099933755.13138.4.camel@localhost>
	 <b28a886104110823161fe3a30d@mail.gmail.com>
	 <1099997754.1373.72.camel@tribesman.namesys.com>
	 <b28a886104110907416476fb50@mail.gmail.com>
Reply-To: Michael Barry <jabbera@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22323-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b28a886104110907416476fb50@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeremy West <jkwest@gmail.com>
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

This is the exact same problem I am having. I just bumped the thread
actually. If you enable debig mode instead of your system freezing you
will get a stack trace. That trace is available in my thread labeled
possible bug: clog 0.

Mike


On Tue, 9 Nov 2004 10:41:25 -0500, Jeremy West <jkwest@gmail.com> wrote:
> Yes, I have a source code tarball that can't be built correctly.  You
> can get this file from other places, but it might be best to test
> exactly what I'm using.  I'm building php, and applying this patch.
> 
> www.jeremysplace.org/php-4.3.9.tar.bz2
> http://www.jeremysplace.org/php-4.3.6-includepath.diff
> 
> To answer Markus's question.  I'm not having any bus errors .... yet.
> At least I hope I don't get any.  I like to deal with one problem at a
> time.  I will reboot my machine into a LiveCD, and debug some reiser4
> for you.  How's best to do this anyway.  The debug script that you
> referenced won't find anything unless something odd happens, right?
> What does the script do?  I guess this is a stupid question, huh?
> 
> 
> 
> On Tue, 09 Nov 2004 13:55:54 +0300, Vladimir Saveliev <vs@namesys.com> wrote:
> > Hello
> >
> > On Tue, 2004-11-09 at 10:16, Jeremy West wrote:
> > > Ok.  I think I may have found a glitch in reiser4.  It seems that my
> > > freezing coincidentally happened every time I tried installing php.
> > > Each time my system froze, the php build would crap out at the same
> > > point.  Basically the bulid would say that it was running the
> > > pear-installer program, then give me a segmentation fault.
> >
> > Do i understand correctly that you have a source code tar ball which can
> > not be built in reiser4 filesystem? Where can i find it?
> >
> >
> >
> > >
> > > So ... it seems to me that reiser4 is having some issues handling
> > > segfault events.  I'm not sure how to tell what caused the segfault.
> > > I don't think it's memory, because it happens in the same spot of the
> > > build every time.  I've done this 4 times now.  That is not random.
> > >
> > >
> > > On Mon, 08 Nov 2004 18:09:15 +0100, Redeeman <redeeman@metanurb.dk> wrote:
> > > > On Mon, 2004-11-08 at 11:55 -0500, Jeremy West wrote:
> > > >
> > > >
> > > > > HI,
> > > > >
> > > > > I'm new to the list.  I've taken the plunge and tasted the speed of
> > > > > reiser4.  Excellent work.  I think I've stumbled upon a bug though.  I
> > > > > have another partition formatted as reiserfs 3.6.  When I mount this
> > > > > partition and listen to music from it, my reiser4 / partition stops
> > > > > responding.  I mean every command I issue to the kernel results in a
> > > > > segmentation fault.  Has anyone else had this problem?
> > > > >
> > > > > I'm using redeeman-sources, based on mm-sources patch set.
> > > > how old would this happen to be? i mean.. give a uname -a
> > > > --
> > > > Redeeman <redeeman@metanurb.dk>
> > > >
> > > >
> > >
> >
> >
> 
> --
> Jeremy West
> //---------------------------
> "I had a life once... now I have a computer and DSL"
>
