From: camis <camis@mweb.co.za>
Subject: Re: reiserfs v3 patches updated
Date: Tue, 06 Apr 2004 20:29:05 +0200
Message-ID: <4072F6F1.3090806@mweb.co.za>
References: <1081210239.4994.69.camel@watt.suse.com> <200404061838.05099.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17754-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404061838.05099.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

> Seem to run fine so far with
> rw,noatime,nodiratime,acl,user_xattr,data=ordered,alloc=skip_busy:dirid_groups,packing_groups

Has anyone done any throughput/benchmarks for the various
new patches/code?

>The block allocator improvements is our attempt to reduce
>fragmentation.  The patch defaults to the regular 2.6.5 block allocator,
>but has options documented at the top of the patch that allow grouping
>of blocks by packing locality or object id.  It also has an option to
>inherit lightly used packing localities across multiple subdirs, which
>keeps things closer together in the tree if you have a bunch of subdirs
>without much in them.

Any of these new features documented anywhere? ;)

Cami
