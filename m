From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: extended attributes
Date: Wed, 23 Oct 2002 19:45:23 -0600
Message-ID: <20021024014522.GD28822@clusterfs.com>
References: <200210231916.18976.bofh@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11746-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200210231916.18976.bofh@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell Coker <bofh@coker.com.au>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Oct 23, 2002  19:16 +0200, Russell Coker wrote:
> Extended attribute support is apparently in 2.5.x kernels now and will be in 
> 2.4.20.
> 
> When will ReiserFS support extended attributes?
> 
> Currently there is discussion about the possibility of using extended 
> attributes for SE Linux security context labels, if that goes ahead then I 
> will be forced to cease using any file system that lacks such support.
> 
> I would like to continue using ReiserFS...

I would think that it would be practical to just store the EA data as a
separate file internally, if you are using tail packing.  That avoids
the need to have a separate data format for EAs entirely.

What I would probably do is have an EA pointer from each inode.  It
would just point to a directory and the EAs would be files with the
filename == attribute name.  You can probably do special packing so
that this is stored efficiently...

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

