From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Having trouble, "Bad root block" with my reiserfs filesystem
Date: Fri, 2 Apr 2004 19:07:37 +0400
Message-ID: <200404021906.43162.vitaly@namesys.com>
References: <3AE0C397BE18AC44B262A25922EDEDDE095D89E7@mstaex1i.usi.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17666-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3AE0C397BE18AC44B262A25922EDEDDE095D89E7@mstaex1i.usi.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Hayes, Greg" <Greg.Hayes@usi.net>, reiserfs-list@namesys.com

On Friday 02 April 2004 18:57, Hayes, Greg wrote:
> I was having a normal day when I noticed I could no longer
> see the root of my mounted filesystem. ls -al /data gave me
> nothing. I could still see most of the filesystem outside of
> root of the filesystem ( which is /data ).
>
> I first tried to umount the filesystem with no luck. Then
> I rebooted (mistake) now I could not mount the filesystem.
>
> I the tried the reiserfsck that came with RH73 and it segfaulted.
> I then installed the latest reiserfsprogs, and this is the result.
>
> Any help is appreciated,
>
> Thank you
>
> Greg
>
> PS: would it be worth a try to dd the filesystem to another disk
> and run reiserfsck again ?
>
> --------------------------
>
> [root@soda sbin] ./reiserfsck --check --logfile fsck.log /dev/hdb2
> reiserfsck 3.6.14 (2003 www.namesys.com)
>
> Will read-only check consistency of the filesystem on /dev/hdb2
> Will put log info to 'fsck.log'
>
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes ###########
> reiserfsck --check started at Thu Apr  1 16:29:54 2004
> ###########
>
> reiserfs_open_journal: journal parameters from the superblock does not
> match to the journal headers ones. It looks like that you created your fs
> with old reiserfsprogs. Journal header is fixed.
>
> Replaying journal..
> Reiserfs journal '/dev/hdb2' in blocks [18..8211]: 0 transactions replayed
> Checking internal tree..finished
> Comparing bitmaps..Bad nodes were found, Semantic pass skipped
> 1 found corruptions can be fixed only when running with --rebuild-tree
> ###########
> reiserfsck finished at Thu Apr  1 16:31:43 2004
> ###########
> [root@soda sbin] ./reiserfsck --check --rebuild-tree --logfile fsck2.log
> /dev/hdb2 reiserfsck 3.6.14 (2003 www.namesys.com)
>
> Will rebuild the filesystem (/dev/hdb2) tree
> Will put log info to 'fsck2.log'
>
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes Replaying journal..
> Reiserfs journal '/dev/hdb2' in blocks [18..8211]: 0 transactions replayed
> ###########
> reiserfsck --rebuild-tree started at Thu Apr  1 17:14:17 2004
> ###########
>
> Pass 0:
> Loading on-disk bitmap .. ok, 37676155 blocks marked used
> Skipping 9402 blocks (super block, journal, bitmaps) 37683119 blocks will
> be read 0%....20%....40%....60%....80%....100%                       left
> 0, 12144 /sec "r5" hash is selected
> Flushing..finished
>         Read blocks (but not data blocks) 37683119
>                 Leaves among those 193606
>                         - leaves all contents of which could not be saved
> and deleted 6 Objectids found 493400
>
> Pass 1 (will try to insert 193600 leaves):
> Looking for allocable blocks .. finished
> 0%....20%....40%....60%....80%....100%                        left 0, 1119
> /sec Flushing..finished
>         193600 leaves read
>                 138856 inserted
>                         - pointers in indirect items pointing to metadata
> 348 (zeroed) 54744 not inserted
>         non-unique pointers in indirect items (zeroed) 7851054
>
> Pass 2:
> 0%....20%....40%....60%....80%....100%                         left 0, 771
> /sec Flushing..finished
>         Leaves inserted item by item 54744
> Pass 3 (semantic):
> Flushing..finished
>         Files found: 0
>         Directories found: 2
> Pass 3a (looking for lost dir/files):
> Looking for lost directories:
> /17986_24074/ii/dbSegmentation fault

could you run
	debugreiserfs -p /dev/hdb2 | bzip2 -c > hdb2.bz2
and provide it for downloading? We would test reiserfsck 
locally then on the metadata of your fs.

-- 
Thanks,
Vitaly Fertman
