From: Oleg Drokin <green@namesys.com>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: Sat, 18 May 2002 20:29:02 +0400
Message-ID: <20020518202902.A6913@namesys.com>
References: <200205171736.50971.Dieter.Nuetzel@hamburg.de> <200205172144.21544.Dieter.Nuetzel@hamburg.de> <20020518094440.A4435@namesys.com> <200205181518.24245.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10380-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200205181518.24245.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Chris Mason <mason@suse.com>, Manuel Krause <manuelkrause@netscape.net>, ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Sat, May 18, 2002 at 03:18:23PM +0200, Dieter N?tzel wrote:
> > > I can reproduce it with some "new" page coloring stuff (only).
> > > When I modprobe the page coloring module (it is under development) the
> > > system lookup from time to time during heavy (parallel) compilation for
> > > example. Then I get the broken files.
> > Well, sounds like page colouring stuff mistakenly writes some pages in
> > wrong location, no?
> Yes, that could be the case.
> > If you cannot reproduce without page colouring patch, that would be the
> > most probably theory, I'd say.
> That isn't what I've said. I only said I can "reproduce" the kernel crash with 
> page coloring the easiest way.

Sorry, I misinterpreted it, then. Perhaps I was confused by "only" word in sentence above.

> > > > BTW, I have a feeling that datalogging patches would help to get rid of
> > > > garbage in the files, but files still will remain (may be of zero
> > > > length).
> > > Yes, Chris said this, too.
> >
> > He said it will help your problem, I think. But zero length .o files will
> > still confuse linker.
> So what's your advice then? Mounting all FSs with "noatime"?

noatime have nothing to do with wrong content of recently created files after
crash.
It was only my guess that atime updates might have caused corruptions on file
read. But you are not using IDE. Anyway, you can try and tell us.

Bye,
    Oleg
