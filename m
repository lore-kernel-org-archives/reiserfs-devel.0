From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 10:52:42 -0600
Message-ID: <20030806105242.F7752@schatzie.adilger.int>
References: <20030806182055.A28562@bitwizard.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15179-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030806182055.A28562@bitwizard.nl>; from R.E.Wolff@harddisk-recovery.nl on Wed, Aug 06, 2003 at 06:20:55PM +0200
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Cc: reiserfs-list@namesys.com, copy@harddisk-recovery.nl

On Aug 06, 2003  18:20 +0200, Rogier Wolff wrote:
> Question: If it is reading all datablocks, I'm guessing that it is
> looking for the magics that build up the filesystem. We're a
> datarecovery company. We probably don't have any current
> datarecoveries of people with Reiserfs on their disk. But if we had a
> disk-image with a valid (or not) Reiserfs on it, would it link that
> into our filesytem?

Correct.  I think that is mentioned somewhere with the resierfsck docs
not to try this with an image of a reiserfsck disk in the filesystem.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

