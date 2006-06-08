From: "Nate Diller" <nate.diller@gmail.com>
Subject: Re: reiser4: first impression (vs xfs and jfs)
Date: Wed, 7 Jun 2006 17:55:25 -0700
Message-ID: <5c49b0ed0606071755w3412e2eave2e3449361cd8b42@mail.gmail.com>
References: <20060523155102.GB25889@zero> <20060606134459.GA18513@zero>
	 <1149604706.6389.40.camel@tribesman.namesys.com>
	 <20060606153035.GF10672@HAL_5000D> <4485D69B.1090608@namesys.com>
	 <20060607001323.GG10672@HAL_5000D>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28760-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060607001323.GG10672@HAL_5000D>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Clay Barnes <clay.barnes@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

On 6/6/06, Clay Barnes <clay.barnes@gmail.com> wrote:
> On 12:25 Tue 06 Jun     , Hans Reiser wrote:
> > Clay Barnes wrote:
> >
> > >On 18:38 Tue 06 Jun     , Vladimir V. Saveliev wrote:
> > >
> > >
> > >>Hello
> > >>
> > >>On Tue, 2006-06-06 at 09:44 -0400, Tom Vier wrote:
> > >>
> > >>
> > >>>On Tue, May 23, 2006 at 11:51:02AM -0400, Tom Vier wrote:
> > >>>
> > >>>
> > >>>>It seems that both r4 and xfs allow a large number of pages to be dirtied,
> > >>>>before queuing them for writeback, and this has a negative effect on
> > >>>>throughput. In my test (rsync'ing ~50gigs of flacs), r4 and xfs are almost
> > >>>>10 minutes slower than jfs.
> > >>>>
> > >>>>
> > >>>Just to follow up on this (i've been too busy lately), that's how delayed
> > >>>allocation works. It waits til the vm forces writeouts.
> > >>>
> > >>>In my case of copying large files from a slower drive, the delayed allocation
> > >>>of r4 and xfs is stalling reads from the source, since neither will write
> > >>>until the vw forces it.
> > >>>
> > >>>Is there a way in r4 to force sync a mount every so often, ala flushd?
> > >>>
> > >>>
> > >>reiser4 has an option for that.
> > >>mount -o tmgr.atom_max_age=N
> > >>N is decimal number of seconds. Changes older than N will be forced to
> > >>commit.
> > >>
> > >>
> > >This may have been mentioned before, but perhaps there could be a
> > >"trickle-out" option along the lines of "if the hard drive is idle (and
> > >optionally only if it's spun up), slowly write out the changes to the
> > >disk structure."
> > >
> > Yes, I will take a patch to do the above as it would be good, but I am
> I wish I had the skills to do so.  Perhaps after a few more C classes
> and my next degree. :-/
> > not convinced it explains the problem described.  I don't really
> Well, very possibly (likely) not, but it just happened to bring to mind
> the particular thought I had had several times before.

this is something i've been wanting to address for a while now.  at
the moment, the VM starts to flush pages when
/proc/sys/vm/dirty_background_ratio is exceeded, and it flushes pages
without regard to which process dirtied them or which file they are
in.  it begins to throttle processes (make them wait for some dirty
pages to be cleaned before they can dirty more of them) when
dirty_ratio is exceeded.

PFC <lists@peufeu.com> said (forgive me for cross-quoting):

        Consider the two following scenarios :

       - A database is doing an UPDATE query on a table. It will issue a lot of
reads and writes, probably in random order. In this case, if the working
set fits in RAM, it pays big time to flush as late as possible, ideally
when the query is finished, because some pages may be written to multiple
times. Also, delayed allocation will reduce fragmentation of the files.
       It's the same thing for doing a Make, unzipping an archive, copying many
small files, etc.

       - A process acquires audio or video in realtime and streams it to disk,
or copies files from one disk to another. In this case it is better to
stream the data directly to disk, especially if the files are large.

       Guessing is a pain in the ass. How can the application inform the
filesystem of its intentions ?

---

the real problem is, what if both of those processes are running at
once?  the correct behaviour would be to leave the database pages
dirty in memory, and sequentially clean the streaming ones.
furthermore, the database shouldn't be throttled unless its working
set it bigger than available memory, but the stream should always be.

i've been pondering this problem for the past year, and haven't found
the silver bullet yet.  i am still resolved to re-write the throttling
and congestion code at some point, because it's fundamentally broken

but i bet hans is right, these pauses you're seeing could probably be
alleviated by fixing something simple in reiser4.

NATE
