From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: getting UUID and label of a filesystem
Date: Thu, 6 Nov 2003 14:07:47 -0700
Message-ID: <20031106140747.Z10197@schatzie.adilger.int>
References: <3FAAB330.5040503@nrao.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16000-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3FAAB330.5040503@nrao.edu>; from bwaters+moz@nrao.edu on Thu, Nov 06, 2003 at 01:46:40PM -0700
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boyd Waters <bwaters+moz@nrao.edu>
Cc: reiserfs-list@namesys.com

On Nov 06, 2003  13:46 -0700, Boyd Waters wrote:
> Perhaps this is obvious, but I cannot find a way to print out the UUID
> or the label of a mounted reiser filesystem, in a manner similar to
> xfs_admin.
> 
> Best way to do this?
> 
> On a mounted filesystem?
> 
> As non-root user?

If you have a recent e2fsprogs (1.33+ I think), you can use "blkid" to dump
the UUID/LABEL of most filesystem types (including reiserfs, XFS, JFS, ext*).
If run as root it will create a cache of available block devices and
their UUID/LABEL that non-root users can access even if they can't read
the block device, so it doesn't need to be suid or anything.  You can also
use it to locate specific devices by LABEL/UUID/TYPE from scripts, etc.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

