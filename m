From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] various allocator optimizations
Date: 11 Mar 2003 20:48:59 -0500
Message-ID: <1047433739.8215.487.camel@tiny.suse.com>
References: <1047400482.8215.312.camel@tiny.suse.com>
	 <20030311194205.A4493@namesys.com>
	 <1047403968.8219.337.camel@tiny.suse.com>  <3E6E584D.4080809@namesys.com>
	 <1047421551.8219.448.camel@tiny.suse.com>  <3E6E674E.4040305@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13205-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E6E674E.4040305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

On Tue, 2003-03-11 at 17:46, Hans Reiser wrote:
> Chris Mason wrote:
> 
> >On Tue, 2003-03-11 at 16:42, Hans Reiser wrote:
> >
> >  
> >
> >>Chris, don't you think the right answer would be to take zam's resizer 
> >>and make a defragmenter out of it?
> >>    
> >>
> >
> >Yes and no, for a defrag program to fix things we'd have to agree on an
> >optimal layout ;-)  Also it assumes the machine has idle time when a
> >defragment cycle is possible. 
> >
> No, it assumes that 80% of files don't move during the course of a week, 
> so if defrag takes a week, it still adds value.
> 
I ran a number of systems where this wasn't true.  Spool files are
constantly appended to or deleted by pop/imap servers.  Idle time is
important, between normal operations and backups it is almost impossible
to find a time when big servers have disk bandwidth to spare.

I like the idea of a dynamic in-kernel fragmentation tool though, you
mark a file as being in need of reallocation, and it happens before io
or something (hand waving is fun).

> > For many servers this is entirely
> >untrue...the oracle boxes I ran didn't have a spare second for something
> >like a defrag.
> >
> >We can all agree that fragmentation is bad, but the real question is how
> >do we group the blocks.  Lets pretend for a minute that fragmentation
> >isn't an issue at all, and our allocator is perfect.
> >
> >The optimal grouping for reading/writing files is to have the files you
> >are going to read/write together in the same area of the disk.
> >
> >The current default uses the start of the disk as a starting point for
> >each new file.
> >
> No, it uses the left neighbor in the tree.  Please correct me if I am 
> wrong, because if I am wrong we have a bug.
> 

It uses the left neighbor in the tree once the file has a starting
block.  But the first starting block comes by searching from block #0.

> In 1994, we realized that putting the grandparent directory into the key 
> was infeasible, and decided we would just leave it for some future 
> repacker to try to locate subdirectories of the same directory 
> together.  We decided that locating files within the same directory near 
> each other was good enough.  I still think this is correct.

I agree, the grandparent alone doesn't help...it's a recursive problem.

-chris


