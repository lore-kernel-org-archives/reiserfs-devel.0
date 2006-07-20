From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: create very large file system
Date: Thu, 20 Jul 2006 11:02:09 -0400
Message-ID: <20060720150209.GA5299@schatzie.adilger.int>
References: <e9l7bh$134$1@sea.gmane.org> <200607191657.38644.zam@namesys.com> <20060720062646.GA6174@schatzie.adilger.int> <200607201317.54566.chrivers@iversen-net.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29092-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200607201317.54566.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Iversen <chrivers@iversen-net.dk>
Cc: Alexander Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com, Mark F <mfaine@knology.net>, Ext3-users@redhat.com

On Jul 20, 2006  13:17 +0200, Christian Iversen wrote:
> On Thursday 20 July 2006 08:26, Andreas Dilger wrote:
> > On Jul 19, 2006  16:57 +0400, Alexander Zarochentsev wrote:
> > > On Wednesday 19 July 2006 16:10, Mark F wrote:
> > > > I've tried to create a large 5TB file system using both reiserfs and
> > > > ext3 and both have failed.
> > >
> > > you might need to convert the partition table to GPT format for
> > > supporting 2TB+ partitions.  it can be done by the gnu parted tool.
> >
> > Or, for that matter, don't use a partition table at all, since this
> > adds an unhelpful offset to all the filesystem structures and can
> > hurt performance on RAID where the filesystem is trying to align IO
> > to RAID stripe boundaries.
> 
> Can linux still auto-detect raid volumes if there's no partition table?

Hmm, that I'm not sure of - we mostly deal with external RAID devices.

Cheers, Andreas
--
Andreas Dilger
Principal Software Engineer
Cluster File Systems, Inc.

