From: Oleg Drokin <green@namesys.com>
Subject: Re: Catastrophe with mailboxes on ReiserFS
Date: Wed, 9 Oct 2002 18:09:35 +0400
Message-ID: <20021009180935.A4618@namesys.com>
References: <20021009094215.B11954@namesys.com> <Pine.LNX.4.44.0210091041350.880-100000@fii.fi.tartu.ee> <20021009121811.A22948@namesys.com> <200210091602.34904.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11628-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200210091602.34904.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Wed, Oct 09, 2002 at 04:02:34PM +0200, Dieter N?tzel wrote:

> > prevented system from putting new content in there), but since you've got
> > other file's data in the middle of file, this is not the case.
> Oleg, I "see" it from time to time during kernel and DRI development (X server 
> crashes), too. This times without Chris's stuff. 2.4.19-ck5 (latest ReiserFS 
> patches for 2.4.19) and now with 2.5.40-ac3.

What's "it"? Is it means what I describe, or "it" means wrong stuff in the
middle of files?
> 
> Most times "messages", "localmessages", kernel .o.*, dep files, etc. are 
> broken (wrong stuff or mixed stuff).

These are recently modified stuff.

> Latest my ".q3a/baseq3/q3key" file (DRI SMP tests) was broken (completely 
> other stuff in it) even though it only should opened for reading.

ls -la .q3a/baseq3/q3key?

> PS I send you a compressed copy of my "messages" file in private.

It only confirms my version, note how whole block of zeroes
was inserted after emergency sync (perhaps during crash).

Bye,
    Oleg
