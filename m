From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: can't ls, then rebuild-tree fails, no hardware error (kow)
Date: Mon, 7 Jun 2004 13:32:55 +0400
Message-ID: <200406071332.55981.vitaly@namesys.com>
References: <40C3FC52.2050404@columbia.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19060-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40C3FC52.2050404@columbia.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Casey Callendrello <cdc2107@columbia.edu>, reiserfs-list@namesys.com

On Monday 07 June 2004 09:25, Casey Callendrello wrote:
> Hello all,
>
>     I'd been using Reiserfs on a 180 GiB partition.  One day my computer
> hung while I was out.  I came home and had to hard-reboot it.  Fine.
> (Unfortunately, this is not the / partition but /home!  egad!)
> Unfortunately, when I rebooted I could not ls in the /home directory,
> which is mount --bind 'ed to /mnt/big/home (big? get it!)  sensing a
> major problem, I had to hard-reboot to kill the ls which was hung on
> waiting for IO (with no errors in /var/log/messages or the error console).
>
> I ran fsck and it found some errors, so I ran fsck --fix-fixable.  The
> whole directory structure was there, I saw it flash by during the fsck
> (well, as far as I could tell.  There certainly wasn't anything obvious
> missing).  So, I remount it and try to cat a file I know is in there,
> and it shows up fine.  I feel better.
>
> But, I still can't ls.  I can't log in with a non-root user since it
> hangs waiting for IO.  I figure it's a problem with the tree (I
> shouldn't jump to conclusions).  So I run rebuild-tree and it fails.
> Now i'm up *** creek.
> I don't have a hard drive large enough to copy this to.  I also don't
> believe it is a hardware issue.  I started copying with dd_rescue,
> telling it to halt on all errors, and managed to copy 2.5 gigs before I
> was convinced there weren't any critical hardware issues.  i have about
> 50 gigs I can scrap together for recovery on multiple disks... but the
> partition was 180(ish) GiB.  Only 38 GiB was used though.  Here's what
> happens:
>
>
> Will rebuild the filesystem (/dev/hdb1) tree
>
> No reiserfs metadata found.  If you are sure that you had the reiserfs
> on this partition...

Is this /dev/hdb1 the original /home ?
So you had it mountable and you could cat some files there but could
not ls the root of the /home, getting no error into the syslog (?) and
then you run reiserfsck --rebuild-tree and it found no metadata?

It looks like before rebuilding the partition table was altered. Did 
you use some partition editor or another program that could change 
the partition table? To tell for sure I need to look at the partition itself.

-- 
Thanks,
Vitaly Fertman

