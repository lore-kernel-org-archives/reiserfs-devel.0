From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: [PATCH] data logging patches available for 2.4.21-preX
Date: Mon, 27 Jan 2003 20:57:46 +0100
Message-ID: <200301272057.46923.Dieter.Nuetzel@hamburg.de>
References: <200301271914.26312.Dieter.Nuetzel@hamburg.de> <1043692402.15680.58.camel@tiny.suse.com> <3E358188.6060608@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12516-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E358188.6060608@mb.tu-ilmenau.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Am Montag, 27. Januar 2003 19:59 schrieb Manuel Krause:
> On 01/27/2003 07:33 PM, Chris Mason wrote:
> > On Mon, 2003-01-27 at 13:14, Dieter N=FCtzel wrote:
> >>Hello Chris,
> >>
> >>as always very nice work!
> >>I have it now running fine on top of 2.4.21-pre3-jam3 (2.4.21-pre3aa1).
> >>Some fiddling was necessary but went smooth after all.
> >>My /home partition is mounted with -o data=3Dordered and the performanc=
e is
> >>great. Sorry, no real benchmarks, yet.
> >
> > Thanks for trying them out.
> >
> >>But some question stay open:
> >>Where is 01-akpm-sync_fs-fix-2.diff
> >
> > 01-akpm-sync_fs-fix-2.diff is in the 2.4.21 data logging directory you
> > linked to below.
> >
> >> and 01-iput-deadlock-fix.diff?
> >
> > This is in the namesys pending directory, but doesn't apply cleanly
> > yet.  I'm rediffing both the quota code and the data logging code on top
> > of 01-iput-deadlock-fix (or I might just steal Manuel's rediff, which is
> > still in my linuxworld backlog).
>
> If they're o.k. just feel free to do so... :-))
>
>
> Dieter, you still aren't subscribed?

I am ;-)

> I (only) changed the rejected things so the patches would apply and put
> the files
>
> for 2.4.20 @
> http://manuel.krause.bei.t-online.de/downloads/2.4.20/03-data-logging-32b=
=2Ed
>iff.gz
>
> for 2.4.21-pre(3) @
> http://manuel.krause.bei.t-online.de/downloads/2.4.21-pre/05-data-logging=
=2D3
>3b.diff.gz
>
> on friday.
> ( First apply 01-iput-deadlock-fix, then Chris' patches with the one
> replaced from above. )

I've them running with some additional fiddling on top of 2.4.21-pre3-jam3 =
as=20
I wrote.

> Bye,
>
> Manuel
>
> P.S.: The data=3Dordered mode (of which Chris wrote we should be careful
> with) runs fine here since the patches came out! :-)

Here, too.

=2DDieter
