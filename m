From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] various allocator optimizations
Date: 11 Mar 2003 14:00:35 -0500
Message-ID: <1047409234.8218.375.camel@tiny.suse.com>
References: <1047400482.8215.312.camel@tiny.suse.com>
	 <20030311194205.A4493@namesys.com>
	 <1047403968.8219.337.camel@tiny.suse.com>
	 <20030311210400.A4859@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13192-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030311210400.A4859@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Tue, 2003-03-11 at 13:04, Oleg Drokin wrote:
> Hello!
> 
> On Tue, Mar 11, 2003 at 12:32:48PM -0500, Chris Mason wrote:
> > > > changes blocknrs_and_prealloc_arrays_from_search_start into three
> > > > passes.  pass1 goes from the hint to the end of the disk, pass2 goes
> > > > from the border to the hint, and pass3 goes from the start of the disk
> > > > to the border.
> > > As you probably remember, we decided to drop border stiff all together
> > > because of all the extra seeking it incurrs.
> > The border does do extra seeks for some cases (search_reada helps), but
> > no border at all spreads tree blocks all over.  That too does a lot of
> 
> I'd say that no border makes tree blocks to appear near file data locations
> (at least at file time creation, items might be shifted away later).
> 

Well, we know it puts them near some file, but many tree nodes point to
more than one file (especially as you go higher in the tree).  I'm not
really sure if there is a good spot on the disk for them, it seems like
the leaves would benefit the most from being next to the file data they
point to, except for directory item leaves, which should be near the
stat data they point to.

But, my sense is that spreading them over the disk usually puts tree
nodes far apart from other tree nodes, and the extra seeking is why you
can see the performance difference from debugreiserfs.

> > > > Overall, I believe this will significantly improve fragmentation over
> > > > time.  oid_groups should only be used if your FS has a small number of
> > > I hope we won't have read-access speed degradation with these.
> > It does, but so does skip_busy alone.  You don't see the problem with
> 
> But we save on cpu here, I think. No?
> I am surprised this is noticeable at all.
> 

It really depends on the working data set.  If the new things you are
creating are roughly the same size as the holes from stuff you've
deleted, things tend to work out and skip_busy doesn't do too badly. 

This is especially true when your dataset includes lots of files < 64k
or so, since you tend to get a somewhat fragmented first 16k, followed
by two or three chunks of 9 blocks thanks to preallocation.  The fibmap
histogram shows this kind of thing nicely.

As a test, I did a stress.sh -n 20 -s and let it run for a few
iterations.  This filled my disk roughly 20%.

Then I created two 500MB files with dd and measured the fragmentation on
those files.  With skip_busy the 500MB files were 30% fragmented.  With
dirid_groups the 500MB files were 2% fragmented.

> > skip_busy during a mongo run, but run stress.sh -n 1 <data set that uses
> > 50% of the disk> for a few hours and then run mongo again without
> > deleting the stress.sh data set.
> 
> Hm.
> 

Sorry, that should be stress.sh -n 2 or higher.

> > The 2.4.20 default is great on a clean FS but breaks down over time,
> > just like the 2.4.19 allocator did.  Various people have demonstrated it
> > with benchmarks.
> 
> Yes, and this is sad. But it appars that almost every FS suffers this problem ;)

Very true.  I'm hoping we can improve things slightly though ;-)

-chris




