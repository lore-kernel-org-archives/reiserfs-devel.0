From: Chris Mason <mason@suse.com>
Subject: Re: extended attributes
Date: 24 Oct 2002 09:05:47 -0400
Message-ID: <1035464747.28715.92.camel@tiny>
References: <200210231916.18976.bofh@coker.com.au> 
	<20021024014522.GD28822@clusterfs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11751-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021024014522.GD28822@clusterfs.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Russell Coker <bofh@coker.com.au>, ReiserFS <reiserfs-list@namesys.com>

On Wed, 2002-10-23 at 21:45, Andreas Dilger wrote:
> On Oct 23, 2002  19:16 +0200, Russell Coker wrote:
> > Extended attribute support is apparently in 2.5.x kernels now and will be in 
> > 2.4.20.
> > 
> > When will ReiserFS support extended attributes?
> > 
> > Currently there is discussion about the possibility of using extended 
> > attributes for SE Linux security context labels, if that goes ahead then I 
> > will be forced to cease using any file system that lacks such support.
> > 
> > I would like to continue using ReiserFS...
> 
> I would think that it would be practical to just store the EA data as a
> separate file internally, if you are using tail packing.  That avoids
> the need to have a separate data format for EAs entirely.
> 
> What I would probably do is have an EA pointer from each inode.  It
> would just point to a directory and the EAs would be files with the
> filename == attribute name.  You can probably do special packing so
> that this is stored efficiently...
> 

The suse kernels include reiserfs extended attribute and acl support
(the bestbits.at interface, reiserfs part by Jeff Mahoney).

We did it without changing the metadata format at all, which means
putting each xattr into a file.  The patches are mired in dependencies
from other parts of the suse kernel, we're trying to pull it all out.  

Until then you can grab the kernels/source at
ftp.suse.com/pub/people/mantel/next (warning, these are the suse
bleeding edge kernels).

-chris


