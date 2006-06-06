From: Clay Barnes <clay.barnes@gmail.com>
Subject: Re: reiser4: first impression (vs xfs and jfs)
Date: Tue, 6 Jun 2006 08:30:35 -0700
Message-ID: <20060606153035.GF10672@HAL_5000D>
References: <20060523155102.GB25889@zero> <20060606134459.GA18513@zero>
	<1149604706.6389.40.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28745-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1149604706.6389.40.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On 18:38 Tue 06 Jun     , Vladimir V. Saveliev wrote:
> Hello
> 
> On Tue, 2006-06-06 at 09:44 -0400, Tom Vier wrote:
> > On Tue, May 23, 2006 at 11:51:02AM -0400, Tom Vier wrote:
> > > It seems that both r4 and xfs allow a large number of pages to be dirtied,
> > > before queuing them for writeback, and this has a negative effect on
> > > throughput. In my test (rsync'ing ~50gigs of flacs), r4 and xfs are almost
> > > 10 minutes slower than jfs.
> > 
> > Just to follow up on this (i've been too busy lately), that's how delayed
> > allocation works. It waits til the vm forces writeouts.
> > 
> > In my case of copying large files from a slower drive, the delayed allocation
> > of r4 and xfs is stalling reads from the source, since neither will write
> > until the vw forces it.
> > 
> > Is there a way in r4 to force sync a mount every so often, ala flushd? 
> 
> reiser4 has an option for that.
> mount -o tmgr.atom_max_age=N
> N is decimal number of seconds. Changes older than N will be forced to
> commit.
This may have been mentioned before, but perhaps there could be a
"trickle-out" option along the lines of "if the hard drive is idle (and
optionally only if it's spun up), slowly write out the changes to the
disk structure."  This could also be paired with keeping as much of the
data in memory as necessary to mantain the speed boost that r4 gets from
temporal locality of reference, possibly just giving it to the system
cache.
> 
> > ext3
> > has the commit option. Does r4 have a hard coded sync timer already? If not,
> > i think it's an important feature that should be added (and made a mount
> > option). Otherwise, a lot of data can be lost. Does the kernel do a system
> > wide sync every 30sec, like it used to?
> > 
