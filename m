From: Philipp Morger <philipp.morger@dolphins.ch>
Subject: ReiserFSchk "Should not happen."
Date: Mon, 23 Jun 2003 20:05:47 +0200
Message-ID: <20030623180547.GA25393@atlantis.dolphins.ch>
Reply-To: Philipp Morger <philipp.morger@dolphins.ch>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14675-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

dear list,

I have a Notebook, P3 700MHz, 10GB IBM Travelstar Disk that was running perfectly (Gentoo Linux)

When I lately started it, it started as usual, but wasn't able to shutdown later... I was a little bit in a hurry so (my fault) I shut it off.
Later I checked the notebook, but this time at the boot process it said it couldn't find the command "ln", gdm didn't start and console login failed to (username was asked, but no password and skiped back to username)
So I shut it once again.... started it and then it said straight away "Grub Error 16"... so as longer as it were running the more harm was done. Finally I unplugged the harddrive from the notebook and connected it to my PC. A badblock scan was negative, so I started a reiserfsck (unfortunately no log) which said that a whole subtree was skipped and that I should run --rebuild-tree, now here it get's interessting.

<--------reiserfsck 3.6.4, 2002-------->
 
  *************************************************************
  ** Do not run rebuild-tree unless something is broken  and **
  ** MAKE A BACKUP before using it.  If you have bad sectors **
  ** on a drive  it is usually a bad idea  to continue using **
  ** it.  Then you probably should get a working hard drive, **
  ** copy the file system from the bad drive to the good one **
  ** -- dd_rescue is  a good tool for  that -- and only then **
  ** run this program.                                       **
  ** If you are using the latest reiserfsprogs and  it fails **
  ** please  email bug reports to reiserfs-list@namesys.com, **
  ** providing  as  much  information  as  possible --  your **
  ** hardware,  kernel,  patches,  settings,  all reiserfsck **
  ** messages  (including version),  the reiserfsck logfile, **
  ** check  the  syslog file  for  any  related information. **
  ** If you would like advice on using this program, support **
  ** is available  for $25 at  www.namesys.com/support.html. **
  *************************************************************
 
Will rebuild the filesystem (/devfs/ide/host0/bus1/target0/lun0/part3) tree
Will put log info to 'stdout'
 
Do you want to run this program?[N/Yes] (note need to type Yes if you do):Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Mon Jun 23 19:16:11 2003
###########
 
Pass 0:
Loading on-disk bitmap .. ok, 1787463 blocks marked used
Skipping 8277 blocks (super block, journal, bitmaps) 1779186 blocks will be read
0%....20%....40%....60%....80%....100%
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 1779186
                Leaves among those 57804
                        - corrected leaves 5
                Objectids found 313896
 
Pass 1 (will try to insert 57804 leaves):
Looking for allocable blocks .. fininshed
0%....20%....40%....60%....80%....100%
Flushing..finished
        57804 leaves read
                57530 inserted
                274 not inserted
        non-unique pointers in indirect items (zeroed) 55
 
Pass 2:
0%....20%....40%..####### Pass 0 #######
pass0: vpf-10170: block 29795: item 5: Wrong order of items - the item
        3645297 3645302 0x1c1 DRCT (2), len 1568, location 496 entry count 65535, fsck need 1, format new fixed to
        3645297 3645302 0x1 DRCT (2), len 1568, location 496 entry count 65535, fsck need 1, format new
pass0: vpf-10450: block 81802, item 8: Wrong order of items - change the dir_id of the key [528615 54797 0x0 SD (0)] to 528630
pass0: vpf-10560: block 81802, item 9: Wrong order of items - change the object_id of the key [528630 2354260 0x1 DRCT (2)] to 54797
pass0: vpf-10170: block 577174: item 13: Wrong order of items - the item
        2859200 2857721 0x4a1 DRCT (2), len 760, location 364 entry count 65535, fsck need 1, format new fixed to
        2859200 2857721 0x1 DRCT (2), len 760, location 364 entry count 65535, fsck need 1, format new
pass0: vpf-10170: block 577210: item 17: Wrong order of items - the item
        2859218 2859234 0x821 DRCT (2), len 584, location 1728 entry count 65535, fsck need 1, format new fixed to
        2859218 2859234 0x1 DRCT (2), len 584, location 1728 entry count 65535, fsck need 1, format new
pass0: vpf-10160: block 1298857: item 3: No "." entry found in the first item of a directory
305403 directory entries were hashed with "r5" hash.
####### Pass 1 #######
####### Pass 2 #######
do_pass_2: The block (2184831) is in the tree already. Should not happen.
do_pass_2: The block (2184831) is in the tree already. Should not happen.
do_pass_2: The block (2184831) is in the tree already. Should not happen.
do_pass_2: The block (2184831) is in the tree already. Should not happen.
--- 2,6GB of log truncated -- 

I would deliver a dmesg, but right now I have no working disk to put into the notebook... but it's a "HP OmniBook 6000 EA", Running Kernel was a gentoo-2.4.19, which was running a long time on this system and on another system without a problem (which doesn't mean it's innocent ;) )

As I got very good expirience with ReiserFS, but it's software... I don't want to belive this was a error in reiserfs.... but the badblockscan was negative, of course there can be a lot of other hardware causing an error (defective ide controller, cache... )

Any comments and wild guesses are welcome (especially about the "Should not happen."

I'm writing here because reiserfschk said I should... but if this is a mailing-list, please note that I'm not a member of it and ask you to include me into the cc on any reply on this message.

on a sidenote: It happened once, that I didn't start (mount) because there was no superblock, so I had to do a "reiserfsck --rebuild-sb", after that all was fine....(>4 Months ago)

Thanks and regards
Philipp Morger
