From: Clay Barnes <clay.barnes@gmail.com>
Subject: Re: create very large file system
Date: Thu, 20 Jul 2006 00:11:18 -0700
Message-ID: <20060720071118.GA6553@HAL_5000D.tc.ph.cox.net>
References: <e9l7bh$134$1@sea.gmane.org> <200607191657.38644.zam@namesys.com>
	<20060720062646.GA6174@schatzie.adilger.int>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29082-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060720062646.GA6174@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com, Mark F <mfaine@knology.net>

On 02:26 Thu 20 Jul     , Andreas Dilger wrote:
> On Jul 19, 2006  16:57 +0400, Alexander Zarochentsev wrote:
> > On Wednesday 19 July 2006 16:10, Mark F wrote:
> > > I've tried to create a large 5TB file system using both reiserfs and
> > > ext3 and both have failed.
> > 
> > you might need to convert the partition table to GPT format for 
> > supporting 2TB+ partitions.  it can be done by the gnu parted tool.
> 
> Or, for that matter, don't use a partition table at all, since this
> adds an unhelpful offset to all the filesystem structures and can
> hurt performance on RAID where the filesystem is trying to align IO
> to RAID stripe boundaries.
Well, damn.  Too late for that to help me.  I've a 700GB that's...
rather too full to put on DVDs or my other drives to fix that.  There
isn't some "safe" way to remove a partition table from a SW RAID array,
is there?

--Clay
> 
> Cheers, Andreas
> --
> Andreas Dilger
> Principal Software Engineer
> Cluster File Systems, Inc.
