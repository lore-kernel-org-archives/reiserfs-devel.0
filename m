From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Reiserfsck 3.6.4 --rebuild-tree statistics
Date: Sat, 26 Oct 2002 21:42:18 +0200
Message-ID: <20021026214218.0aebf86a.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11802-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs <reiserfs-list@namesys.com>


Hi,

I just wanted to give these figures for those who might wonder how much time can
take a --rebuild-tree. Of course these figures should be taken with precaution and
may not reflect you particular environment.

Setup : ~500Go Raid volume ( DELL PowerVault 210S RAID5 (2x5 spanned disks + 2 hot spares)
filled with 170Go of quite deeply nested data & directories
Controller DELL 2450: PIII 1GHz SMP 1Go RAM

Time it took to make the --rebuild-tree: 8 hours 30 minutes.

Philippe.

0 transactions replayed
###########
reiserfsck --rebuild-tree started at Fri Oct 25 15:22:56 2002
###########

Pass 0:
Loading on-disk bitmap .. ok, 42809069 blocks marked used
Skipping 12578 blocks (super block, journal, bitmaps) 42796491 blocks will be read
0%....20%....40%....60%....80%....100%
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 42796491
                Leaves among those 620311
                        - corrected leaves 1
                        - leaves all contents of which could not be saved and deleted 621
                pointers in indirect items to wrong area 46 (zeroed)
                Objectids found 3261439

Pass 1 (will try to insert 619690 leaves):
Looking for allocable blocks .. fininshed
0%....20%....40%....60%....80%....100%
Flushing..finished
        619690 leaves read
                616003 inserted
                        - pointers in indirect items pointing to metadata 9 (zeroed)
                3687 not inserted
        non-unique pointers in indirect items (zeroed) 1035

Pass 2:
0%....20%....40%....60%....80%....100%
Flushing..finished
        Leaves inserted item by item 3687
Pass 3 (semantic):
Flushing..finished
        Files found: 2410869
        Directories found: 535225
        Symlinks found: 12
        Others: 157
        Files with fixed size: 3
        Names pointing to nowhere (removed): 22
Pass 3a (looking for lost dir/files):
Looking for lost directories:
Looking for lost files:
Flushing..finished
        Objects without names 83728
        Empty lost dirs removed 292596
        Dirs linked to /lost+found: 8146
                Dirs without stat data found 1
        Files linked to /lost+found 56884
        Objects having used objectids: 45
                files fixed 5
Pass 4 - finished
        Deleted unreachable items 870
Flushing..finished
Syncing..finished
###########
reiserfsck finished at Fri Oct 25 23:49:35 2002
###########
