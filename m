From: Casey Callendrello <cdc2107@columbia.edu>
Subject: can't ls, then rebuild-tree fails, no hardware error (kow)
Date: Mon, 07 Jun 2004 01:25:38 -0400
Message-ID: <40C3FC52.2050404@columbia.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19050-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello all,

    I'd been using Reiserfs on a 180 GiB partition.  One day my computer 
hung while I was out.  I came home and had to hard-reboot it.  Fine.  
(Unfortunately, this is not the / partition but /home!  egad!)  
Unfortunately, when I rebooted I could not ls in the /home directory, 
which is mount --bind 'ed to /mnt/big/home (big? get it!)  sensing a 
major problem, I had to hard-reboot to kill the ls which was hung on 
waiting for IO (with no errors in /var/log/messages or the error console). 

I ran fsck and it found some errors, so I ran fsck --fix-fixable.  The 
whole directory structure was there, I saw it flash by during the fsck 
(well, as far as I could tell.  There certainly wasn't anything obvious 
missing).  So, I remount it and try to cat a file I know is in there, 
and it shows up fine.  I feel better.

But, I still can't ls.  I can't log in with a non-root user since it 
hangs waiting for IO.  I figure it's a problem with the tree (I 
shouldn't jump to conclusions).  So I run rebuild-tree and it fails.  
Now i'm up *** creek. 
I don't have a hard drive large enough to copy this to.  I also don't 
believe it is a hardware issue.  I started copying with dd_rescue, 
telling it to halt on all errors, and managed to copy 2.5 gigs before I 
was convinced there weren't any critical hardware issues.  i have about 
50 gigs I can scrap together for recovery on multiple disks... but the 
partition was 180(ish) GiB.  Only 38 GiB was used though.  Here's what 
happens:


####### Pass 0 #######
Could not find a hash in use. Using "r5"
####### Pass 1 #######
####### Pass 2 #######
Will rebuild the filesystem (/dev/hdb1) tree
Will put log info to 'stdout'
Replaying journal..
Reiserfs journal '/dev/hdb1' in blocks [18..8211]: 0 transactions replayed
###########
reiserfsck --rebuild-tree started at Mon Jun  7 01:15:31 2004
###########
Pass 0:
Loading on-disk bitmap .. ok, 27189 blocks marked used
Skipping 9701 blocks (super block, journal, bitmaps) 17488 blocks will 
be read

**does the reading here**
"r5" hash is selected
Flushing..finished
    Read blocks (but not data blocks) 17488
        Leaves among those 0
        Objectids found 2


Pass 1 (will try to insert 0 leaves):
Looking for allocable blocks .. finished

Flushing..finished
    0 leaves read
        0 inserted

Flushing..finished

No reiserfs metadata found.  If you are sure that you had the reiserfs
on this partition...



Will running with -S get it back?  Like I said, I'm almost certain 
there's no hardware issue, and I'd really like to get this data back.


Thanks a lot,
    Casey Callendrello
