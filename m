From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: [PATCH] data logging patches available for 2.4.21-preX
Date: Mon, 27 Jan 2003 19:49:57 +0100
Message-ID: <200301271949.57132.Dieter.Nuetzel@hamburg.de>
References: <200301271914.26312.Dieter.Nuetzel@hamburg.de> <1043692402.15680.58.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12513-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1043692402.15680.58.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: Linux Kernel List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Manuel Krause <manuel.krause@mb.tu-ilmenau.de>

Am Montag, 27. Januar 2003 19:33 schrieb Chris Mason:
> On Mon, 2003-01-27 at 13:14, Dieter N=FCtzel wrote:
> > Hello Chris,
> >
> > as always very nice work!
> > I have it now running fine on top of 2.4.21-pre3-jam3 (2.4.21-pre3aa1).
> > Some fiddling was necessary but went smooth after all.
> > My /home partition is mounted with -o data=3Dordered and the performanc=
e is
> > great. Sorry, no real benchmarks, yet.
>
> Thanks for trying them out.
>
> > But some question stay open:
> > Where is 01-akpm-sync_fs-fix-2.diff
>
> 01-akpm-sync_fs-fix-2.diff is in the 2.4.21 data logging directory you
> linked to below.

It was and I have it but it isn't any longer...
Both 01- are missing, now

> >  and 01-iput-deadlock-fix.diff?
>
> This is in the namesys pending directory, but doesn't apply cleanly
> yet.

OK, you moved it;-)

> I'm rediffing both the quota code and the data logging code on top
> of 01-iput-deadlock-fix (or I might just steal Manuel's rediff, which is
> still in my linuxworld backlog).

Manuel's version (33b) had some trouble with -pre3aa1 (-pre3-jam3), too.

> > Isn't it needed anylonger 'cause you merged them and SuSE's ftp isn't
> > updated yet? All files are the "old" one's from 15. January.
> > ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21
> >
> > What about patch-2.4.20.rfs.06.05-transaction-overflow-fix-0.diff?
> > Should I put it on top, too?
>
> That is included in 05-data-logging-33.

Nice, no recompile needed then ;-)

I'll do some "normal" vs data=3Djournal/ordered "time synctest -F -f -n 1 -=
t 100=20
dir_name" tests, now.

Maybe I integrate preemption...

=2DDieter
