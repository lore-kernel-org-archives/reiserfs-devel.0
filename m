From: Rikard Johnels <rikjoh@norweb.se>
Subject: Re: Failed ReiserFS
Date: Mon, 14 Feb 2005 21:33:34 +0100
Message-ID: <200502142133.35062.rikjoh@norweb.se>
References: <200502100535.01814.rikjoh@norweb.se> <200502141224.33293.rikjoh@norweb.se> <200502141506.43506.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502141506.43506.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 14 February 2005 13.06, Vitaly Fertman wrote:
> On Monday 14 February 2005 14:24, Rikard Johnels wrote:
> > On Friday 11 February 2005 08.57, Rikard Johnels wrote:
> > > On Thursday 10 February 2005 22.03, Vitaly Fertman wrote:
> > > > > > > reiserfsck 3.6.13
> > > > > > > I used -S to scan the whole partition, as per man page
> > > > > > > A bug heh.. :(
> > > > > > > So is there any fix for it?
> > > > > >
> > > > > > Please try latest reiserfsck.
> > > > > > ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.19.tar.
> > > > > >gz
> > > > >
> > > > > Same problem:
> > > > >
> > > > >  lost+found.c 348 pass_3a_look_for_lost
> > > > > look_for_lost: The entry 'lost+found' could not be found in the
> > > > > root directory Aborted
> > > > >
> > > > > This is getting more than frustrating...
> > > >
> > > > would you pack the metadata with
> > > > 	debugreiserfs -p <device> | bzip2 -c > <device>-meta.bz2
> > > > and provide them for downloading?
> > >
> > > the metadata and reiserfsck log are both available for download.
> > >
> > > ftp://ftp.rikjoh.com/reisercheck.logfile.bz2
> > > ftp://ftp.rikjoh.com/hdc1-meta.bz2
> >
> > Moved the disks to another computer with a clean install of Linux.
> > Reran the --rebuild-tree on that one. And i still get the same error
> > "look_for_lost: The entry 'lost+found' could not be found in the root"
> > And its the "reiserfs-3.6.13" package.
> > Still no luck :(
> >
> > Why cant it find the /lost+found ?
>
> no problem with your metadata.
> Are you sure you run reiserfsck 3.6.19?
> Did you obtain reiserfsprogs-3.6.19 from our ftp site?
> Would you check the memory on the computer you run reiserfsck
> on and would you check the harddrive for bad blocks?

Just ran 3.6.19 on the fresh installed computer
Same error.

---<screen dump>---

Will rebuild the filesystem (/dev/hdc1) tree
Will put log info to '/root/reisercheck.logfile'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
Reiserfs journal '/dev/hdc1' in blocks [18..8211]: 0 transactions replayed
###########
reiserfsck --rebuild-tree started at Mon Feb 14 21:05:44 2005
###########

Pass 0:
The whole partition (7504544 blocks) is to be scanned
Skipping 8440 blocks (super block, journal, bitmaps) 7496104 blocks will be 
read
0%....20%....40%....60%....80%....100%                        left 0, 
4848 /sec
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 7496104
                Leaves among those 15551
                        - leaves all contents of which could not be saved and 
deleted 7
                Objectids found 8831

Pass 1 (will try to insert 15544 leaves):
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....100%                         left 0, 
420 /sec
Flushing..finished
        15544 leaves read
                13485 inserted
                2059 not inserted
        non-unique pointers in indirect items (zeroed) 25597

Pass 2:
0%....20%....40%....60%....80%....100%                        left 0, 
2059 /sec
Flushing..finished
        Leaves inserted item by item 2059
Pass 3 (semantic):
Flushing..finished
        Files found: 4302
        Directories found: 356
        Broken (of files/symlinks/others): 3
        Files with fixed size: 1
        Names pointing to nowhere (removed): 111
Pass 3a (looking for lost dir/files):
Looking for lost directories:
Looking for lost files:
lost+found.c 348 pass_3a_look_for_lost
look_for_lost: The entry 'lost+found' could not be found in the root 
directory.
Aborted

---<end screendump>---



-- 

         /Rikard

---------------------------------------------------------------
Rikard Johnels          email   : rikjoh@norweb.se
                        Web     : http://www.rikjoh.com/users/rikjoh
                        Mob     : +46 735 05 51 01
                        PGP     : 0x461CEE56
---------------------------------------------------------------
