From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] various allocator optimizations
Date: 11 Mar 2003 12:32:48 -0500
Message-ID: <1047403968.8219.337.camel@tiny.suse.com>
References: <1047400482.8215.312.camel@tiny.suse.com>
	 <20030311194205.A4493@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13189-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030311194205.A4493@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Tue, 2003-03-11 at 11:42, Oleg Drokin wrote:
> Hello!
> 
> On Tue, Mar 11, 2003 at 11:34:43AM -0500, Chris Mason wrote:
> 
> > changes blocknrs_and_prealloc_arrays_from_search_start into three
> > passes.  pass1 goes from the hint to the end of the disk, pass2 goes
> > from the border to the hint, and pass3 goes from the start of the disk
> > to the border.
> 
> As you probably remember, we decided to drop border stiff all together
> because of all the extra seeking it incurrs.
> 

The border does do extra seeks for some cases (search_reada helps), but
no border at all spreads tree blocks all over.  That too does a lot of
seeks, since leaves and the formatted nodes that point to them might be
on entirely different areas of the disk.
  
> > Overall, I believe this will significantly improve fragmentation over
> > time.  oid_groups should only be used if your FS has a small number of
> 
> I hope we won't have read-access speed degradation with these.

It does, but so does skip_busy alone.  You don't see the problem with
skip_busy during a mongo run, but run stress.sh -n 1 <data set that uses
50% of the disk> for a few hours and then run mongo again without
deleting the stress.sh data set.

The 2.4.20 default is great on a clean FS but breaks down over time,
just like the 2.4.19 allocator did.  Various people have demonstrated it
with benchmarks.

-chris


