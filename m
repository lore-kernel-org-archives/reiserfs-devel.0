From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: reiserfs on removable media
Date: Wed, 2 Jul 2003 12:45:44 -0600
Message-ID: <20030702124544.Z7414@schatzie.adilger.int>
References: <pan.2003.07.02.14.23.09.812119.20132@umail.hungrycats.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14806-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <pan.2003.07.02.14.23.09.812119.20132@umail.hungrycats.org>; from eazgwmir@umail.furryterror.org on Wed, Jul 02, 2003 at 02:23:13PM -0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com

On Jul 02, 2003  14:23 -0400, Zygo Blaxell wrote:
> Two reiserfs improvements come to mind:
> 
> - There is a tendency for files that were being grown at crash time to
> contain invalid data.  It seems that the inodes are being updated before
> the data blocks they refer to are written.  It would be nice if the inode
> writes were deferred (or at least made invisible) until after the data
> blocks were written.  I'd rather lose my data than possibly have random
> garbage masquerading as my data.

This is called ordered data mode, and exists on ext3 and also reiserfs with
Chris Mason's patches.  Under normal usage it shouldn't change performance
compared to writeback data mode (which is what reiserfs does by default).

> - If the device is detached while a filesystem is mounted, reiserfs gets a
> whole lot of I/O errors (or worse) and immediately oopses.  It would be
> nice if reiserfs would handle this a bit more gracefully--it should at
> least let me kill processes with open files and umount the filesystem.
> OTOH many other things also oops with with current USB/firewire/scsi device
> driver stack too.  :-P

Well, if something oopses you are pretty much stuck w.r.t. killing the
process and unmounting the fs.  So fix the oopses and the rest should
come around as a result.  Of course, the reiserfs folks can do a lot
more with a specific oops report than just "it immediately oopses".  ;-)

Not much you can do about the IO errors (i.e. working as designed).
That's going to happen if you remove your device while writing to it.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

