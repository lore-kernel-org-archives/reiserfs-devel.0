From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: reiserfsprogs 3.6.5 release.
Date: Thu, 20 Mar 2003 16:45:03 +0100
Message-ID: <20030320164503.42807723.philippe.gramoulle@mmania.com>
References: <200302251650.22469.vitaly@namesys.com>
	<200303201631.19750.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13304-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303201631.19750.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi vitaly,

i don't know if this version has notable changes from the "improved" one you sent me, but i
had just started a --rebuild-tree -z on a yet never rebuilt fs,  before i saw this mail:

So it took about 2 hours to rebuild a 570Go partition filled up to 225Go ( 40% used ).

This is a really good improvement if we compare to previous 6 or 8 hours from previous runs
on similar setups.

Thanks,

Philippe

# ./reiserfsck-improved-speed-version --rebuild-tree -z -l /home/test/fsck-sdb1.log /dev/sdb1

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.5-pre2
[snip]

Will rebuild the filesystem (/dev/sdb1) tree
        Will set file sizes in their metadata to real file sizes actually found by fsck.
Will put log info to '/home/toor/fsck-sdb1.log'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Thu Mar 20 10:51:54 2003
###########

Pass 0:
Loading on-disk bitmap .. ok, 56296546 blocks marked used
Skipping 12578 blocks (super block, journal, bitmaps) 56283968 blocks will be read
0%....20%....40%....60%....                                                    left 0, 23412 /secseccccc
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 56283968
                Leaves among those 920479
                        - leaves all contents of which could not be saved and deleted 2
                Objectids found 4722462

Pass 1 (will try to insert 920477 leaves):
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....100%                        left 0, 1051 /sec
Flushing..finished
        920477 leaves read
                918896 inserted
                1581 not inserted

Pass 2:
0%....20%....40%....60%....80%....100%                          left 0, 53 /sec
Flushing..finished
        Leaves inserted item by item 1581
Pass 3 (semantic):
Flushing..finished
        Files found: 3884342
        Directories found: 838111
        Others: 8
        Files with fixed size: 283
Pass 3a (looking for lost dir/files):
Looking for lost directories:
Flushing..finished7, 258 /sec
Pass 4 - finisheddone 918666, 228 /sec
Flushing..finished
Syncing..finished
###########
reiserfsck finished at Thu Mar 20 12:56:43 2003
###########



On Thu, 20 Mar 2003 16:31:19 +0300
Vitaly Fertman <vitaly@namesys.com> wrote:

  | 
  | Hi all, 
  | 
  | The new 3.6.5 release includes:
  | 
  | - Improved fs/journal/bitmap initialising. 
  | - Improved journal replaying - check transactions content before replaying, 
  | sware on invalid content instead of replaying attempts, print about results 
  | and problems.
  | - A few small bug were fixed.
  | 
  | - all stuff 3.6.5-pre2 pre-release included:
  | > - a critical bug on pass0 of rebuild-tree with overflowing while checking
  | > unformatted item offsets was fixed.
  | > - a bug in relocation of shared object id - entry key sometimes does not
  | > get updated correctly with the new key - was fixed.
  | > - a bug in bitops operations for be mashins was fixed.
  | > - a bug with the superblock overwriting during replaying was fixed.
  | >
  | > - while openning the journal check that journal parameters in the
  | > superblock and in the journal header mathches; advice to run rebuild-sb if
  | > not. While rebuilding the superblock, do the same check and ask the user if
  | > he wants to rebuild the journal header or continue w/out the journal or he
  | > wants to change the start of the partition before using reiserfsck.
  | > - check that all not valid bits of the bitmap are set to 1, set it
  | > correctly.
  | >
  | > - fix-fixable does not relocate shared object ids anymore, as it is too
  | > complex for fix-fixable and only rebuild-tree does.
  | >
  | > - reiserfsck -a (started at boot) replays journal, checks error flags in
  | > the superblock, bitmaps, fs size, 2 levels of internal tree and switches
  | > to fixble mode if any problem is detected. For root fs fixable cannot be
  | > performed (as fs is mounted) and just --check will be done.
  | >
  | > - Journal replay was improved a) check blocks if they could be journable
  | > before replaying; b) replay only transactions which has trans_id == last
  | > replayed transaction trans_id + 1.
  | >
  | > - warning messages were improved.
  | 
  | - all stuff 3.6.5-pre1 included:
  | > It includes speedup for pass0, which becomes quite important for hignly 
  | > fragmented object id maps, and a few fixed bugs:
  | > - bug in balancing code led to abort when a leaf could be viewed as a block 
  | > of another type;
  | > - bug in checking statdata size for symlinks allowed to have symlinks with 
  | > holes at the end.
  | > - bug in direct-indirect item convertion let symlinks to be created of wrong 
  | > format.
  | 
