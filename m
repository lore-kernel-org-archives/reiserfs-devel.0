From: Chris Mason <mason@suse.com>
Subject: Re: Odd Block allocation behavior on Reiser3
Date: Tue, 10 Aug 2004 16:29:51 -0400
Message-ID: <1092169790.10651.443.camel@watt.suse.com>
References: <20040809201939.GA55683@kevlar.burdell.org>
	 <1092083451.10651.218.camel@watt.suse.com>
	 <20040809220459.GA57121@kevlar.burdell.org> <41187657.7030709@namesys.com>
	 <20040810154514.GA67591@kevlar.burdell.org> <41190B5A.7070503@namesys.com>
		 <1092162318.10651.365.camel@watt.suse.com>
	 <1092163813.10651.372.camel@watt.suse.com>  <4119253B.1030807@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20151-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4119253B.1030807@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Sonny Rao <sonny@burdell.org>, reiserfs-list@namesys.com

On Tue, 2004-08-10 at 15:42, Hans Reiser wrote:

> >Hmpf, that's what I get for expecting filefrag to work properly on
> >amd64.  The actual number of extents is 199, which is still better then
> >268.  Using fibmap, the fragmentation percentage is still the same as
> >ext3 (99.99% unfragmented) meaning the length between the extents is
> >quite small.
> >
> >If you mount with:
> >
> >mount -o alloc=skip_busy:oid_groups
> >
> >You get 8 extents on a 1GB file.
> >
> >This is because the oid grouping tries much harder to isolate the file
> >data from data from other files and metadata.  It is far from optimal
> >for normal usage, but for huge files it works nicely.

> For an empty filesystem there should be no fragmentation at all for big 
> dds one after another, except at bitmap block boundaries.  Any other 
> result indicates flawed code.  Remember, a hint of flawed code often 
> leads to more than a trivial flaw when fully understood.

Grin, you're welcome to overhaul the v3 allocator once again ;)  I made
a number of trade-offs under the restriction of the disk format and size
of the changes that were reasonable to make to the v3 code base.  For
every workload I tried, it scored as well or better then the old
allocator in fragmentation and performance.

The only reason I passed on the 1 extent number was that I assumed
filefrag had some fuzziness built in.  I believe that fibmap is a better
measurement overall, since it calculates not only the number of extents
but the total distance between the extents.  I feel the latter is a
better indication of the performance you'll get when you try to read a
given file.

If you examine the actual layout achieved by the new allocator, most of
the fragments are 1023 or so blocks long (jeff did some quick double
checks of this), which is what you can fit in a single leaf.  

In other words, the leaves are mixed in with the file data they point
to, which makes it quite likely they will be in cache (drive or OS) and
not need any seeks during the read.

-chris


