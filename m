From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Tue, 10 Aug 2004 22:05:15 +0400
Message-ID: <20040810180515.GR9811@backtop.namesys.com>
References: <20040807065039.5BF4E15CBC@mail03.powweb.com> <41148997.4070404@namesys.com> <200408100321.i7A3LHxu027087@turing-police.cc.vt.edu> <20040810092022.GN9811@backtop.namesys.com> <4119077E.6070306@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4119077E.6070306@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Valdis.Kletnieks@vt.edu, David Dabbs <david@dabbs.net>, 'ReiserFS List' <reiserfs-list@namesys.com>

On Tue, Aug 10, 2004 at 10:35:58AM -0700, Hans Reiser wrote:
> Alex Zarochentsev wrote:
> 
> >On Mon, Aug 09, 2004 at 11:21:17PM -0400, Valdis.Kletnieks@vt.edu wrote:
> > 
> >
> >>On Sat, 07 Aug 2004 00:49:43 PDT, Hans Reiser said:
> >>
> >>   
> >>
> >>>>I think I have discovered the problem - unless there was a reason mongo 
> >>>>was
> >>>>issuing mount/unmount commands at the start/end of a mongo 'run' as 
> >>>>well as
> >>>>before/after _each phase_.
> >>>>       
> >>>>
> >>>Probably someone wanted to separate the measurement of the phases.  It 
> >>>has been a while since I read mongo.....
> >>>     
> >>>
> >>Note that an unmount/mount pair will force a flush of all dirtied pages 
> >>in the
> >>in-memory file cache, and *really* not return until it's really done and 
> >>really
> >>out on disk.  In addition, sync() will force stuff to disk, but *not* 
> >>invalidate
> >>in-cache pages - more drastic measures are needed if you want to benchmark
> >>with a cold cache (which is almost a must if you're doing actual 
> >>filesystem
> >>benchmarking, as otherwise you're benching the in-core cache instead).
> >>   
> >>
> >
> >That was designed to have result in each phase as independent as we can.  
> >For
> >example, if we have read slowdown in mongo, we will analyze only reads and,
> >probably, fs fragmentation, we won't deal with unmeasurable cache state 
> >before
> >the read phase. Known and persistent "cold cache effect" is better than 
> >unknown
> >hot cache one :)  And, mongo phases are designed to be long and keep the 
> >cold
> >cache effect at minimum.
> > 
> >
> 
> Let me be more precise here.  Is the time spent mounting and umounting 
> included in the time for the phase?

oops. sync time included. mount/umount time is not.


-- 
Alex.
