From: Jeremy West <jkwest@gmail.com>
Subject: Re: reiser4 and reiserfs co-existence?
Date: Tue, 9 Nov 2004 02:16:46 -0500
Message-ID: <b28a886104110823161fe3a30d@mail.gmail.com>
References: <b28a886104110808555d3f59dc@mail.gmail.com>
	 <1099933755.13138.4.camel@localhost>
Reply-To: Jeremy West <jkwest@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22310-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1099933755.13138.4.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Ok.  I think I may have found a glitch in reiser4.  It seems that my
freezing coincidentally happened every time I tried installing php. 
Each time my system froze, the php build would crap out at the same
point.  Basically the bulid would say that it was running the
pear-installer program, then give me a segmentation fault.

So ... it seems to me that reiser4 is having some issues handling
segfault events.  I'm not sure how to tell what caused the segfault. 
I don't think it's memory, because it happens in the same spot of the
build every time.  I've done this 4 times now.  That is not random.


On Mon, 08 Nov 2004 18:09:15 +0100, Redeeman <redeeman@metanurb.dk> wrote:
> On Mon, 2004-11-08 at 11:55 -0500, Jeremy West wrote:
> 
> 
> > HI,
> >
> > I'm new to the list.  I've taken the plunge and tasted the speed of
> > reiser4.  Excellent work.  I think I've stumbled upon a bug though.  I
> > have another partition formatted as reiserfs 3.6.  When I mount this
> > partition and listen to music from it, my reiser4 / partition stops
> > responding.  I mean every command I issue to the kernel results in a
> > segmentation fault.  Has anyone else had this problem?
> >
> > I'm using redeeman-sources, based on mm-sources patch set.
> how old would this happen to be? i mean.. give a uname -a
> --
> Redeeman <redeeman@metanurb.dk>
> 
> 


-- 
Jeremy West
//---------------------------
"I had a life once... now I have a computer and DSL"
