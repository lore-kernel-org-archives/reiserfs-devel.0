From: Chris Mason <mason@suse.com>
Subject: Re: 2.4.19-pending is pending
Date: 05 Aug 2002 20:40:33 -0400
Message-ID: <1028594433.2121.341.camel@tiny>
References: <3D4F0A0A.4050603@mb.tu-ilmenau.de>
	<1028592182.1759.300.camel@tiny>  <3D4F16F4.9060802@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11128-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D4F16F4.9060802@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Mon, 2002-08-05 at 20:23, Manuel Krause wrote:
> > 
> > Step one was getting the commit_super patch into the kernel, I sent that
> > this morning.  All of the data logging stuff depends on it, and we
> > wanted to get the major changes in first.
> 
> Seems you have priority on Marcelos task list? ;-) Very nice! Push them 
> all!!!

That would be nice, but I only sent it this morning it hasn't been
accepted yet.  It is going through the same approval process everything
else does.

> 
> But, err,  I wanted the old
>    ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.19-pre7.pending
> things to be actualized and also Olegs previously mentioned "hidden" 
> ones to appear at least on the namesys server...

Right, Hans' idea was to get the biggest change (which is most likely to
break) in first, then get the trivial stuff in later.  I think it's a
good idea.

> 
> Olegs messages made me think of hundreds kB of namesys patches to come 
> additionally to yours and the old ones...

Well, the namesys guys don't sit around playing cards all day ;-)  Most
of their big patches are features (blocksize < 4k) or performance
improvements.

> 
> Dunno, why we shouldn't have tried "them" until now, on rational base...

2.4.19 needed to get out, not have more patches added ;-)

-chris


