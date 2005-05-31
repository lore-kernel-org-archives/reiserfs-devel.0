From: Hans Reiser <reiser@namesys.com>
Subject: Re: File as a directory - VFS Changes
Date: Tue, 31 May 2005 11:32:04 -0700
Message-ID: <429CADA4.4070600@namesys.com>
References: <17050.62052.318426.711322@gargle.gargle.HOWL>	<75229416615-BeMail@cr593174-a>	<17052.12223.708707.757538@gargle.gargle.HOWL>	<429C7D0A.6040200@namesys.com>	<200505311630.j4VGUeIt007432@turing-police.cc.vt.edu>	<1117558515.13252.21.camel@localhost> <17052.43941.64870.716568@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24244-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17052.43941.64870.716568@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Jonathan Briggs <jbriggs@esoft.com>, Valdis.Kletnieks@vt.edu, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com

What about if we have it that only the first name a directory is created
with counts towards its reference count, and that if the directory is
moved if it is moved from its first name, the new name becomes the one
that counts towards the reference count?   A bit of a hack, but would work.

Hans

Nikita Danilov wrote:

>Jonathan Briggs writes:
> > On Tue, 2005-05-31 at 12:30 -0400, Valdis.Kletnieks@vt.edu wrote:
> > > On Tue, 31 May 2005 08:04:42 PDT, Hans Reiser said:
> > > 
> > > > >Cycle may consists of more graph nodes than fits into memory. 
> > > > >
> > > > There are pathname length restrictions already in the kernel that should
> > > > prevent that, yes?
> > > 
> > > The problem is that although a *single* pathname can't be longer than some
> > > length, you can still create a cycle.  Consider for instance a pathname restriction
> > > of 1024 chars.  Filenames A, B, and C are all 400 characters long.  A points at B,
> > > B points at C - and C points back to A.
> > > 
> > > Also, although the set of inodes *in the cycle* fits in memory, the set of
> > > inodes *in the entire graph* that has to be searched to verify the presence of
> > > a cycle may not (in general, you have to be ready to examine *all* the inodes
> > > unless you can do some pruning (unallocated, provably un-cycleable, and so
> > > on)).  THis is the sort of thing that you can afford to do in userspace during
> > > an fsck, but certainly can't do in the kernel on every syscall that might
> > > create a cycle...
> > 
> > You can avoid cycles by redefining the problem.
> > 
> > Every file or "data object" has one single True Name which is their
> > inode or OID.  Each data object then has one or more "names" as
> > properties.  Names are either single strings with slash separators for
> > directories, or each directory element is a unique object in an object
> > list.  Directories then become queries that return the set of objects
> > holding that directory name.  The query results are of course cached and
> > updated whenever a name property changes.
> > 
> > Now there are no cycles, although a naive Unix "find" program could get
> > stuck in a loop.
>
>Huh? Cycles are still here.
>
>Query D0 returns D1, query D1 returns D2, ... query DN returns D0. The
>problem is not in the mechanism used to encode tree/graph structure. The
>problem is in the limitations imposed by required semantics:
>
>   (R) every object except some selected root is Reachable. (No leaks.)
>
>   (G) unused objects are sooner or later discarded. (Garbage
>   collection.)
>
>Neither requirement is compatible with cycles in the directory
>structure:
>
> - from (R) it follows that object can be discarded only if it empty (as
> a directory). All nodes in a cycle are not empty (because each of them
> contains at least a reference to the next one), and hence none of them
> can be ever removed;
>
> - if garbage collection is implemented through the reference counting
> (which is the only known way tractable for a file system), then cycles
> are never collected.
>
>Unless you are talking about a two-level naming scheme, where "One True
>Names" are visible to the user. In that case reachability problem
>evaporates, because manipulations with normal directory structure never
>make node unreachable---it is always accessible through its True
>Name.
>
>But the garbage collection problem is still there. You are more than
>welcome to solve it by implementing generation mark-and-sweep GC on file
>system scale. :-)
>
>Nikita.
>
>
>  
>

