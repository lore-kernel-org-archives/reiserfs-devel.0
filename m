From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Tue, 10 Aug 2004 13:20:22 +0400
Message-ID: <20040810092022.GN9811@backtop.namesys.com>
References: <20040807065039.5BF4E15CBC@mail03.powweb.com> <41148997.4070404@namesys.com> <200408100321.i7A3LHxu027087@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20118-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408100321.i7A3LHxu027087@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: Hans Reiser <reiser@namesys.com>, David Dabbs <david@dabbs.net>, 'ReiserFS List' <reiserfs-list@namesys.com>

On Mon, Aug 09, 2004 at 11:21:17PM -0400, Valdis.Kletnieks@vt.edu wrote:
> On Sat, 07 Aug 2004 00:49:43 PDT, Hans Reiser said:
> 
> > >I think I have discovered the problem - unless there was a reason mongo was
> > >issuing mount/unmount commands at the start/end of a mongo 'run' as well as
> > >before/after _each phase_.
> 
> > Probably someone wanted to separate the measurement of the phases.  It 
> > has been a while since I read mongo.....
> 
> Note that an unmount/mount pair will force a flush of all dirtied pages in the
> in-memory file cache, and *really* not return until it's really done and really
> out on disk.  In addition, sync() will force stuff to disk, but *not* invalidate
> in-cache pages - more drastic measures are needed if you want to benchmark
> with a cold cache (which is almost a must if you're doing actual filesystem
> benchmarking, as otherwise you're benching the in-core cache instead).

That was designed to have result in each phase as independent as we can.  For
example, if we have read slowdown in mongo, we will analyze only reads and,
probably, fs fragmentation, we won't deal with unmeasurable cache state before
the read phase. Known and persistent "cold cache effect" is better than unknown
hot cache one :)  And, mongo phases are designed to be long and keep the cold
cache effect at minimum.

> As an aside, although the Linux fs/buffer:do_sync() won't return until it's
> all really done, there is no mandate that the sync() syscall wait (and in fact,
> is the source of the old "type 'sync' three times, then 'halt'" - the second
> and third times you typed sync and hit return hopefully gave the I/O scheduled
> by the *first* sync time to complete.  At least one 'Unix for Dummies' book
> proved their lack of depth of understanding when they recommended:
> 
> # sync;sync;sync;halt
> 

-- 
Alex.
