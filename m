From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: Sat, 18 May 2002 15:18:23 +0200
Message-ID: <200205181518.24245.Dieter.Nuetzel@hamburg.de>
References: <200205171736.50971.Dieter.Nuetzel@hamburg.de> <200205172144.21544.Dieter.Nuetzel@hamburg.de> <20020518094440.A4435@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10379-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020518094440.A4435@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Chris Mason <mason@suse.com>, Manuel Krause <manuelkrause@netscape.net>, ReiserFS List <reiserfs-list@namesys.com>

On Saturday 18 May 2002 07:44, Oleg Drokin wrote:
> Hello!
>
> On Fri, May 17, 2002 at 09:44:21PM +0200, Dieter N?tzel wrote:
> > > BTW, Was that you with a kernel with lot of patches applied, or
> > > you do not use anything strange on your workstations?
> >
> > Yes, but it happen with and without data logging, preemption, aa_VM, etc.
> > I can reproduce it with some "new" page coloring stuff (only).
> > When I modprobe the page coloring module (it is under development) the
> > system lookup from time to time during heavy (parallel) compilation for
> > example. Then I get the broken files.
>
> Well, sounds like page colouring stuff mistakenly writes some pages in
> wrong location, no?

Yes, that could be the case.

> If you cannot reproduce without page colouring patch, that would be the
> most probably theory, I'd say.

That isn't what I've said. I only said I can "reproduce" the kernel crash with 
page coloring the easiest way.

The problem of broken files appear during "any" kernel crash which I get from 
time to time during devel kernel stuff testing/developing.

> > > File was created, written into. So file appears after reboot (if
> > > transaction in which it was created was commited).
> >
> > Maybe the FS should have some knowledge "build in" to "decide" that *.o
> > files are "temper?r" and should be removed during replay?
>
> No, there is absolutely no way for such kludges to go into the FS, I think.
> And it even may be the case where .o file was created, commited, and then
> journal record obsoletted, because metadata got it's way to the disk,
> so file is already in place (without the body, or with garbage instead
> of the body), but it have nothing to do with journal.

I understand this very well, but "all" talking about making computer systems 
and FSs more "intelligent"...;-)

> > > BTW, I have a feeling that datalogging patches would help to get rid of
> > > garbage in the files, but files still will remain (may be of zero
> > > length).
> >
> > Yes, Chris said this, too.
>
> He said it will help your problem, I think. But zero length .o files will
> still confuse linker.

So what's your advice then? Mounting all FSs with "noatime"?

Thanks,
	Dieter
