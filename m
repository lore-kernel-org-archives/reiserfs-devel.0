From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs v3 patches updated
Date: Tue, 06 Apr 2004 12:48:02 -0400
Message-ID: <1081270081.30830.5.camel@watt.suse.com>
References: <1081210239.4994.69.camel@watt.suse.com>
	 <200404061838.05099.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17751-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404061838.05099.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

On Tue, 2004-04-06 at 12:38, Christian Mayrhuber wrote:
> On Tuesday 06 April 2004 02:10, Chris Mason wrote:
> 
> Seem to run fine so far with
>  rw,noatime,nodiratime,acl,user_xattr,data=ordered,alloc=skip_busy:dirid_groups,packing_groups
> 
Good to hear.

> >
> > The block allocator improvements is our attempt to reduce
> > fragmentation.  The patch defaults to the regular 2.6.5 block allocator,
> > but has options documented at the top of the patch that allow grouping
> > of blocks by packing locality or object id.  It also has an option to
> > inherit lightly used packing localities across multiple subdirs, which
> > keeps things closer together in the tree if you have a bunch of subdirs
> > without much in them.
> >
> > If anyone is interested in experimenting with the block allocator stuff,
> > please let me know.
> So it is the block allocator that makes ext3 preferable to oracle database 
> load?

Yes and no.  For databases you tend to preallocate the files one at a
time, and fragmentation isn't a huge issue.  If you have your tables set
to autoextend, and you frequently need to grow them, the block allocator
might be causing fragmentation.

> Are there any figures how "mount -o alloc=oid_groups" influences oracle 
> performance?
> 

None, this code is pretty new.  The benchmarks so far are from iozone
and tiobench.pl

-chris



