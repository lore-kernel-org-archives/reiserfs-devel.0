From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs v3 patches updated
Date: Tue, 06 Apr 2004 14:47:26 -0400
Message-ID: <1081277245.30813.81.camel@watt.suse.com>
References: <1081210239.4994.69.camel@watt.suse.com>
	 <200404061838.05099.christian.mayrhuber@gmx.net>
	 <4072F6F1.3090806@mweb.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17755-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4072F6F1.3090806@mweb.co.za>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: camis <camis@mweb.co.za>
Cc: reiserfs-list@namesys.com

On Tue, 2004-04-06 at 14:29, camis wrote:
> > Seem to run fine so far with
> > rw,noatime,nodiratime,acl,user_xattr,data=ordered,alloc=skip_busy:dirid_groups,packing_groups
> 
> Has anyone done any throughput/benchmarks for the various
> new patches/code?
> 
The block allocator stuff is fresh from the oven and still warm inside. 
I'll be posting benchmarks for it as the week goes on.

> >The block allocator improvements is our attempt to reduce
> >fragmentation.  The patch defaults to the regular 2.6.5 block allocator,
> >but has options documented at the top of the patch that allow grouping
> >of blocks by packing locality or object id.  It also has an option to
> >inherit lightly used packing localities across multiple subdirs, which
> >keeps things closer together in the tree if you have a bunch of subdirs
> >without much in them.
> 
> Any of these new features documented anywhere? ;)

I'm writing up a mount option summary, the block allocator stuff is all
documented at the top of the patch.

-chris


