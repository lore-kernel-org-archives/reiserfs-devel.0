From: Oleg Drokin <green@namesys.com>
Subject: Re: [PATCH] various allocator optimizations
Date: Tue, 11 Mar 2003 21:04:00 +0300
Message-ID: <20030311210400.A4859@namesys.com>
References: <1047400482.8215.312.camel@tiny.suse.com> <20030311194205.A4493@namesys.com> <1047403968.8219.337.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13190-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1047403968.8219.337.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Mar 11, 2003 at 12:32:48PM -0500, Chris Mason wrote:
> > > changes blocknrs_and_prealloc_arrays_from_search_start into three
> > > passes.  pass1 goes from the hint to the end of the disk, pass2 goes
> > > from the border to the hint, and pass3 goes from the start of the disk
> > > to the border.
> > As you probably remember, we decided to drop border stiff all together
> > because of all the extra seeking it incurrs.
> The border does do extra seeks for some cases (search_reada helps), but
> no border at all spreads tree blocks all over.  That too does a lot of

I'd say that no border makes tree blocks to appear near file data locations
(at least at file time creation, items might be shifted away later).

> seeks, since leaves and the formatted nodes that point to them might be
> on entirely different areas of the disk.

Well, leaves _are_ formatted nodes after all ;)

> > > Overall, I believe this will significantly improve fragmentation over
> > > time.  oid_groups should only be used if your FS has a small number of
> > I hope we won't have read-access speed degradation with these.
> It does, but so does skip_busy alone.  You don't see the problem with

But we save on cpu here, I think. No?
I am surprised this is noticeable at all.

> skip_busy during a mongo run, but run stress.sh -n 1 <data set that uses
> 50% of the disk> for a few hours and then run mongo again without
> deleting the stress.sh data set.

Hm.

> The 2.4.20 default is great on a clean FS but breaks down over time,
> just like the 2.4.19 allocator did.  Various people have demonstrated it
> with benchmarks.

Yes, and this is sad. But it appars that almost every FS suffers this problem ;)

Bye,
    Oleg
