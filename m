From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [Fwd: Re: [alg] reiserfs and filesystem labels]
Date: Sun, 16 Mar 2003 15:58:56 -0700
Message-ID: <20030316155856.F12806@schatzie.adilger.int>
References: <1047846988.2691.12.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13287-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1047846988.2691.12.camel@localhost.localdomain>; from newton@hammet.net on Sun, Mar 16, 2003 at 02:36:23PM -0600
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Newton Hammet <newton@hammet.net>
Cc: reiserfs-list@namesys.com

On Mar 16, 2003  14:36 -0600, Newton Hammet wrote:
> However when I create a reiserfs filesystem in the following manner:
> 
> /sbin/mkreiserfs --label bigfs_0035 /dev/hdg8
> 
> and attempt a mount in the following manner:mount: no such partition
> found
> 
> 
> mount -L bigfs_0035 /mnt/bkup
> 				-or-
> mount LABEL=bigfs_0035 /mnt/bkup
> 
> I get the following message:
> 
> mount: no such partition found

The "mount" command doesn't understand labels for reiserfs.  A while ago,
I managed to get labels and UUIDs added to the reiserfs superblock, but
I never followed through with adding support for reading these in "mount".
You can simply add support directly to mount for reading the UUID and
LABEL fields from the reiserfs superblock.

Alternately, the current e2fsprogs work-in-progress (WIP) release _finally_
has the libblkid library included in it, and it should be pretty easy to
change mount over to using this library, which has support for identifying
all sorts of LABEL/UUID identifiers (this is what fsck will now use for
doing fsck-by-label).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

