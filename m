From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: What Filesystem?
Date: Wed, 29 Jan 2003 21:16:28 +0100
Message-ID: <200301292116.28540.Dieter.Nuetzel@hamburg.de>
References: <3E38378A.8030406@jtmstudio.fsbusiness.co.uk> <200301292043.38367.Dieter.Nuetzel@hamburg.de> <200301292009.h0TK9c4K008318@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12550-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200301292009.h0TK9c4K008318@turing-police.cc.vt.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Valdis.Kletnieks@vt.edu
Cc: james@jtmstudio.fsbusiness.co.uk, reiserfs-list@namesys.com

Am Mittwoch, 29. Januar 2003 21:09 schrieb Valdis.Kletnieks@vt.edu:
> On Wed, 29 Jan 2003 20:43:38 +0100, Dieter =3D?iso-8859-1?q?N=3DFCtzel?=
=3D said:
> > All low latency and pre-emption tests have showed _improved_ throughput
> > (Yes)
> >
> > and much better "multi media" (video/audio) "experience" ;-)
> > No measurable overhead an single and SMP systems (both Athlon).
> > That's why it is in 2.5/2.6.
>
> Yes, but my *point* was that if the box is busy doing a 5-hour rendering
> job, the low-latency *wont make a difference*.  If you're doing audio work
> or video captures, yes the low-latency/preempt stuff will help.  If you're
> in a single thread that's CPU-bound, there's no need to go installing 2.5
> to get it.
>
> > But you want to have the much better "task switching behavior" together
> > with the "brand new" O(1) scheduler.
>
> You want that *if* the actual load will benefit from it.  See my comment
> above about rendering...

I am all with you.

> > You mean single vs 2-/4-/8-/etc. (NUMA) SMP systems or even clusters? ;=
=2D)
>
> Some things are doable with a single CPU, some things need the NUMA stuff,
> other things can use a Beowulf.  Thus the need to quantify what the actual
> requirements are.  Video editing will bottleneck on different things than
> photorealistic rendering of graphics.

Very true.

Regards,
	Dieter

=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)

