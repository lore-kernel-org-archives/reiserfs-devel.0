From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: What Filesystem?
Date: Wed, 29 Jan 2003 20:43:38 +0100
Message-ID: <200301292043.38367.Dieter.Nuetzel@hamburg.de>
References: <3E38378A.8030406@jtmstudio.fsbusiness.co.uk> <200301291816.h0TIGJ4K006262@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12548-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200301291816.h0TIGJ4K006262@turing-police.cc.vt.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Valdis.Kletnieks@vt.edu, james@jtmstudio.fsbusiness.co.uk
Cc: reiserfs-list@namesys.com

Am Mittwoch, 29. Januar 2003 19:16 schrieb Valdis.Kletnieks@vt.edu:
> On Wed, 29 Jan 2003 15:20:26 EST, James Thompson=20
<james@jtmstudio.fsbusiness.co.uk>  said:
> > ... I have done much research in the field of computer /hardware/
> > suitable for commercial Digital Content Creation (P4 Xeon; Wildcat
> > graphics; ART's "PURE" raytracing PCI render board, etc. ...) and now
>
> Hmm.. so we're looking at high-end rendering, which is usually a CPU hog.
>
> >      1. Kernel Patches - pre-empt and low latency;
>
> so I'm not clear on why you're worried about low latency?  Remember that
> it *does* come with an overhead

What? --- Sorry, quantify it. I can't.
All low latency and pre-emption tests have showed _improved_ throughput (Ye=
s)=20
and much better "multi media" (video/audio) "experience" ;-)
No measurable overhead an single and SMP systems (both Athlon).
That's why it is in 2.5/2.6.

> - the low-latency stuff is good if you're
> more concerned about fast response than total system load (for instance,
> on my laptop I'm willing to give up 5% of the CPU if it makes the X server
> run perceivably  faster.  If I was doing a lot of rendering, I'd want that
> 5% for user cycles.

But you want to have the much better "task switching behavior" together wit=
h=20
the "brand new" O(1) scheduler.

> Could you be more specific regarding what sort of content you are making?
> (i.e. single frame images suitable for monitor display (1600x1200 and
> smaller), or large-format for high-resolution printing (posters, etc), or
> video, etc..) The resources needed to produce a 10-minute video clip are
> different from the things you'll need to produce a 4 foot x 5 foot poster
> at 600DPI.

You mean single vs 2-/4-/8-/etc. (NUMA) SMP systems or even clusters? ;-)

Greetings,
	Dieter

=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)

