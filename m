From: Clay Barnes <clay.barnes@gmail.com>
Subject: Re: reiser4: first impression (vs xfs and jfs)
Date: Tue, 6 Jun 2006 17:13:23 -0700
Message-ID: <20060607001323.GG10672@HAL_5000D>
References: <20060523155102.GB25889@zero> <20060606134459.GA18513@zero>
	<1149604706.6389.40.camel@tribesman.namesys.com>
	<20060606153035.GF10672@HAL_5000D> <4485D69B.1090608@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28753-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4485D69B.1090608@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

On 12:25 Tue 06 Jun     , Hans Reiser wrote:
> Clay Barnes wrote:
> 
> >On 18:38 Tue 06 Jun     , Vladimir V. Saveliev wrote:
> >  
> >
> >>Hello
> >>
> >>On Tue, 2006-06-06 at 09:44 -0400, Tom Vier wrote:
> >>    
> >>
> >>>On Tue, May 23, 2006 at 11:51:02AM -0400, Tom Vier wrote:
> >>>      
> >>>
> >>>>It seems that both r4 and xfs allow a large number of pages to be dirtied,
> >>>>before queuing them for writeback, and this has a negative effect on
> >>>>throughput. In my test (rsync'ing ~50gigs of flacs), r4 and xfs are almost
> >>>>10 minutes slower than jfs.
> >>>>        
> >>>>
> >>>Just to follow up on this (i've been too busy lately), that's how delayed
> >>>allocation works. It waits til the vm forces writeouts.
> >>>
> >>>In my case of copying large files from a slower drive, the delayed allocation
> >>>of r4 and xfs is stalling reads from the source, since neither will write
> >>>until the vw forces it.
> >>>
> >>>Is there a way in r4 to force sync a mount every so often, ala flushd? 
> >>>      
> >>>
> >>reiser4 has an option for that.
> >>mount -o tmgr.atom_max_age=N
> >>N is decimal number of seconds. Changes older than N will be forced to
> >>commit.
> >>    
> >>
> >This may have been mentioned before, but perhaps there could be a
> >"trickle-out" option along the lines of "if the hard drive is idle (and
> >optionally only if it's spun up), slowly write out the changes to the
> >disk structure." 
> >
> Yes, I will take a patch to do the above as it would be good, but I am
I wish I had the skills to do so.  Perhaps after a few more C classes
and my next degree. :-/
> not convinced it explains the problem described.  I don't really
Well, very possibly (likely) not, but it just happened to bring to mind
the particular thought I had had several times before.
> understand how writes to a fast drive can slow reads from a slow drive. 
> I am missing something.
> 
> Maybe I should ask the following: is the slow drive using reiser4?  If
> reiser4, was the slow drive image created by copying from a reiser4
> image or an ext3 image?   (Standard benchmarking mistake: creating an
> image for a test from a filesystem not the one that is being tested. 
> readdir order matters.)
> 
> > This could also be paired with keeping as much of the
> >data in memory as necessary to mantain the speed boost that r4 gets from
> >temporal locality of reference, possibly just giving it to the system
> >cache.
> >  
> >
> >>>ext3
> >>>has the commit option. Does r4 have a hard coded sync timer already? If not,
> >>>i think it's an important feature that should be added (and made a mount
> >>>option). Otherwise, a lot of data can be lost. Does the kernel do a system
> >>>wide sync every 30sec, like it used to?
> >>>
> >>>      
> >>>
> >
> >
> >  
> >
