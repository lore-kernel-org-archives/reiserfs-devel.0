From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: reiserfs v3 patches updated
Date: Tue, 6 Apr 2004 18:38:05 +0200
Message-ID: <200404061838.05099.christian.mayrhuber@gmx.net>
References: <1081210239.4994.69.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17749-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081210239.4994.69.camel@watt.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 06 April 2004 02:10, Chris Mason wrote:

Seem to run fine so far with
 rw,noatime,nodiratime,acl,user_xattr,data=ordered,alloc=skip_busy:dirid_groups,packing_groups

>
> The block allocator improvements is our attempt to reduce
> fragmentation.  The patch defaults to the regular 2.6.5 block allocator,
> but has options documented at the top of the patch that allow grouping
> of blocks by packing locality or object id.  It also has an option to
> inherit lightly used packing localities across multiple subdirs, which
> keeps things closer together in the tree if you have a bunch of subdirs
> without much in them.
>
> If anyone is interested in experimenting with the block allocator stuff,
> please let me know.
So it is the block allocator that makes ext3 preferable to oracle database 
load?
Are there any figures how "mount -o alloc=oid_groups" influences oracle 
performance?


-- 
lg, Chris
