From: Chris Mason <mason@suse.com>
Subject: Re: Re: [STUPID TESTCASE] ext3 htree vs. reiserfs
	on 2.5.40-mm1
Date: 07 Oct 2002 09:12:21 -0400
Message-ID: <1033996342.13900.383.camel@tiny>
References: <200210042254.23978.Dieter.Nuetzel@hamburg.de> 
	<20021004220126.GB3000@clusterfs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11618-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021004220126.GB3000@clusterfs.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>, ReiserFS List <reiserfs-list@namesys.com>, Paul P Komkoff Jr <i@stingr.net>, Manuel Krause <manuel.krause@mb.tu-ilmenau.de>

On Fri, 2002-10-04 at 18:01, Andreas Dilger wrote:
> On Oct 04, 2002  22:54 +0200, Dieter N?tzel wrote:
> > Am Mittwoch, 2. Oktober 2002 10:48 schrieb Paul P Komkoff Jr:
> > > Replying to Andreas Dilger:
> > > > Why do you think data=writeback is better than data=journal?  If the
> > > > files have no data then it should not make a difference.
> > >
> > > It is better than default data=ordered I think :)
> > > Reiserfs worked fine because it don't have such kind of limit ...
> > 
> > Orange and apples, again?
> > 
> > Try with latest ReiserFS data-logging and see what we get?
> > Chris do you have something for 2.5.40+ ready?
> 
> I don't think it will make much difference - the files being created
> are zero-length files so the journaling mode is irrelevant.

The data logging patches have a bunch of other metadata writeback
optimizations.  It helps most for small transactions, but improves
things for all metadata workloads.  Updated 2.4.20-preX patches should
finally go out today, and then I'll start on 2.5

-chris


