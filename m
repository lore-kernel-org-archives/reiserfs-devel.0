From: Laurynas Biveinis <Laurynas.Biveinis@mif.vu.lt>
Subject: Partial data loss with reiserfs3
Date: Sun, 13 Feb 2005 19:29:16 +0200
Message-ID: <1108315756.420f8e6ce67b0@webmail.vu.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

I was trying to move data from my NTFS partition to Linux (Fedora Core
3).   I had 2GB ext3 partition for /home. After copying some files from
NTFS partition to /home and successfully shrinking NTFS partition by
4GB I wanted to enlarge my /home. Ext3 does not support partition
resize and move there, so I have decided to switch /home to ReiserFS
v3 (That's the version available for FC3)

I've created 4GB Reiser partition (/dev/hda6) and moved data there from
old /home (/dev/hda7):
umount /home
mkdir /home.old
mount /dev/hda7 /home.old
mount /dev/hda6 /home
cd /home.old
find . -depth -print0 | cpio --null -pvd /home

It worked OK (as in "cpio did not fail and I could see my directories
and files")

Then I deleted my old /dev/hda7, and tried to enlarge /dev/hda6 to take
its space - by resizing partition, then by resizefs.reiserfs. Resizefs
complained about "Error: Can't resize filesystem outside the device."
no matter what I size I would try to expand it, and with '-f' option
too.  It occured to me that perhaps reboot might be required there, so
I rebooted. Bingo, after reboot resizefs enlarged partition to the size
I wanted. Reboot once again and try to login with ordinary user (whose
home is on that partition).

Login got to the point of KDE "Restoring session state" and then PC
hanged. Hmm. Reboot and retry login with non-root user. The same.
Reboot and log-in as root.

[root@laurynas-pc ~]# umount /home
[root@laurynas-pc ~]# reiserfsck /dev/hda6

[See Output 1 below]

OK, so it says --rebuild-tree...

[root@laurynas-pc ~]# reiserfsck --rebuild-tree /dev/hda6

[See Output 2 below]

At this point I remounted partition read-only and looked around. And
that's it, part of my data is at lost+found, and part is gone. 
Here was a typical mount /dev/hda6 output to syslog:
-----------------
Feb 13 18:04:58 laurynas-pc kernel: ReiserFS: hda6: found reiserfs
format "3.6" with standard journal
Feb 13 18:04:58 laurynas-pc kernel: ReiserFS: hda6: using ordered data
mode
Feb 13 18:04:58 laurynas-pc kernel: ReiserFS: hda6: journal params:
device hda6, size 8192, journal first block 18, max trans len 1024, max
batch 900, max commit age 30, max trans age 30
Feb 13 18:04:58 laurynas-pc kernel: ReiserFS: hda6: checking transaction
log (hda6)
Feb 13 18:04:58 laurynas-pc kernel: ReiserFS: hda6: replayed 17
transactions in 0 seconds
Feb 13 18:04:58 laurynas-pc kernel: ReiserFS: hda6: Using r5 hash to
sort names
---------------

And one more line looks particularly interesting:
---------------
Feb 13 18:08:05 laurynas-pc kernel: ReiserFS: hda6: warning: vs-4080:
reiserfs_free_block: free_block (hda6:32998)[dev:blocknr]: bit already
cleared
---------------

Is there anything I can do to look for my other missing data?

TIA,
Laurynas

------------------------------------------
Output 1:
------------------------------------------
reiserfsck 3.6.18 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will read-only check consistency of the filesystem on /dev/hda6
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
###########
reiserfsck --check started at Sun Feb 13 18:13:57 2005
###########
Replaying journal..
Reiserfs journal '/dev/hda6' in blocks [18..8211]: 0 transactions
replayed
Zero bit found in on-disk bitmap after the last valid bit.
Checking internal tree../  1 (of   7)/  2 (of 163)bad_leaf: block 32978,
items 0 and 1: The wrong order of items: [2 6 0x1 DRCT (2)], [2 12 0x1
IND (1)]
bad_leaf: block 32978, items 1 and 2: The wrong order of items: [2 12
0x1 IND (1)], [2 112 0x1 IND (1)]
bad_path: The right delimiting key [2 18 0x0 SD (0)] of the node (32978)
must be greater than the last (2) element's key [2 112 0x1 IND (1)]
within the node.
/ 14 (of 163)bad_path: The left delimiting key [2 112 0x1 IND (1)] of
the node (32769) must be equal to the first element's key [2 1681
0xa1d001 IND (1)] within the node.
/106 (of 163)bad_indirect_item: block 32872: The item (2 818 0x1 IND
(1), len 8, location 3364 entry count 0, fsck need 0, format new) has
the bad pointer (0) to the block (34816), which is in tree already
bad_indirect_item: block 32872: The item (2 818 0x1 IND (1), len 8,
location 3364 entry count 0, fsck need 0, format new) has the bad
pointer (1) to the block (34817), which is in tree already
/  2 (of   7)/ 65 (of 163)bad_node: vpf-10350: The block (32769) is used
more than once in the tree.
 the problem in the internal node occured (32769), whole subtree is
skipped
finished
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps
differs.
Bad nodes were found, Semantic pass skipped
5 found corruptions can be fixed only when running with --rebuild-tree
###########
reiserfsck finished at Sun Feb 13 18:14:03 2005
###########


--------------------------------------------------
Output 2:
--------------------------------------------------

[root@laurynas-pc ~]# reiserfsck --rebuild-tree /dev/hda6
reiserfsck 3.6.18 (2003 www.namesys.com)

*************************************************************
** Do not  run  the  program  with  --rebuild-tree  unless **
** something is broken and MAKE A BACKUP  before using it. **
** If you have bad sectors on a drive  it is usually a bad **
** idea to continue using it. Then you probably should get **
** a working hard drive, copy the file system from the bad **
** drive  to the good one -- dd_rescue is  a good tool for **
** that -- and only then run this program.                 **
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will rebuild the filesystem (/dev/hda6) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
Replaying journal..
Reiserfs journal '/dev/hda6' in blocks [18..8211]: 0 transactions
replayed
Zero bit found in on-disk bitmap after the last valid bit. Fixed.
###########
reiserfsck --rebuild-tree started at Sun Feb 13 18:14:45 2005
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 275702 blocks marked used
init_source_bitmap: Bitmap 38 (of 32768 bits) is wrong - mark all blocks
[1245184 - 1277952] as used
init_source_bitmap: Bitmap 39 (of 32768 bits) is wrong - mark all blocks
[1277952 - 1310720] as used
init_source_bitmap: Bitmap 45 (of 32768 bits) is wrong - mark all blocks
[1474560 - 1507328] as used
init_source_bitmap: Bitmap 46 (of 32768 bits) is wrong - mark all blocks
[1507328 - 1540096] as used
init_source_bitmap: Bitmap 48 (of 32768 bits) is wrong - mark all blocks
[1572864 - 1605632] as used
init_source_bitmap: Bitmap 51 (of 32768 bits) is wrong - mark all blocks
[1671168 - 1703936] as used
init_source_bitmap: Bitmap 52 (of 32768 bits) is wrong - mark all blocks
[1703936 - 1736704] as used
init_source_bitmap: Bitmap 53 (of 4332 bits) is wrong - mark all blocks
[1736704 - 1741036] as used
Skipping 8264 blocks (super block, journal, bitmaps) 442629 blocks will
be read
0%....20%....40%.block 1410673: The number of items (2560) is incorrect,
shouldbe (1) - corrected
block 1410673: The free space (2) is incorrect, should be (2512) -
corrected
pass0: vpf-10110: block 1410673, item (0): Unknown item type found
[201331327 167772161 0x2 ??? (15)] - deleted
...60%....80%....100%                        left 0, 3184 /sec
464 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 442629
                Leaves among those 95
                        - leaves all contents of which could not be
saved and deleted 1
                Objectids found 620

Pass 1 (will try to insert 94 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....100%                          left 0,
94 /sec
Flushing..finished
        94 leaves read
                94 inserted
####### Pass 2 #######
Flushing..finished
Pass 3 (semantic):
####### Pass 3 #########
/lauras/.mc/inivpf-10680: The file [2 6] has the wrong block count in
the StatData (8) - corrected to (0)
rebuild_semantic_pass: The entry [2 7] ("Tree") in directory [2 5]
points to nowhere - is removed
rebuild_semantic_pass: The entry [2 8] ("cedit") in directory [2 5]
points to nowhere - is removed
rebuild_semantic_pass: The entry [2 9] ("filepos") in directory [2 5]
points tonowhere - is removed
rebuild_semantic_pass: The entry [2 10] ("history") in directory [2 5]
points to nowhere - is removed
vpf-10650: The directory [2 5] has the wrong size in the StatData (168)
- corrected to (72)
rebuild_semantic_pass: The entry [2 11] (".qt") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [2 16] ("TeX") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [2 18] ("bin") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [2 32] ("doc") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [2 34] (".kde") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [2 296] (".ssh") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [2 307] ("bash_completion_svn") in
directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [2 308] (".amsn") in directory [2 4]
points tonowhere - is removed
rebuild_semantic_pass: The entry [2 322] (".dmrc") in directory [2 4]
points tonowhere - is removed
rebuild_semantic_pass: The entry [2 323] (".gaim") in directory [2 4]
points tonowhere - is removed
rebuild_semantic_pass: The entry [2 638] (".java") in directory [2 4]
points tonowhere - is removed
rebuild_semantic_pass: The entry [2 656] (".mcop") in directory [2 4]
points tonowhere - is removed
rebuild_semantic_pass: The entry [2 804] (".wine") in directory [2 4]
points tonowhere - is removed
rebuild_semantic_pass: The entry [2 1018] (".xine") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [2 1023] (".xmms") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [2 1029] (".tuxracer") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [2 1031] (".bashrc") in directory [2 4]
pointsto nowhere - is removed
rebuild_semantic_pass: The entry [2 1032] (".gnome2_private") in
directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [2 1033] ("olimp") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [2 1428] (".openoffice-install-log") in
directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [2 1429] (".freeciv") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [2 1434] (".mozilla") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1741] (".gconfd") in directory [2 4]
pointsto nowhere - is removed
rebuild_semantic_pass: The entry [4 1743] (".gnochm") in directory [2 4]
pointsto nowhere - is removed
rebuild_semantic_pass: The entry [4 1747] (".gnome2") in directory [2 4]
pointsto nowhere - is removed
rebuild_semantic_pass: The entry [4 1768] (".civserver_history") in
directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1769] (".gstreamer-0.8") in
directory [2 4]points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1772] ("TeX-LT") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1795] ("TeX-VU") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1814] ("todo ispell-lt.txt") in
directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1815] (".acrobat") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1817] (".mcoprc") in directory [2 4]
pointsto nowhere - is removed
rebuild_semantic_pass: The entry [4 1818] (".gnucash") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1822] (".bash_logout") in directory
[2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1823] (".gtk-bookmarks") in
directory [2 4]points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1824] (".AbiSuite") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1827] (".viminfo") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1828] ("Desktop") in directory [2 4]
pointsto nowhere - is removed
rebuild_semantic_pass: The entry [4 1836] (".vmware") in directory [2 4]
pointsto nowhere - is removed
rebuild_semantic_pass: The entry [4 1840] (".amyedit") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1841] (".xemacs") in directory [2 4]
pointsto nowhere - is removed
rebuild_semantic_pass: The entry [4 1843] (".esd_auth") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1844] (".ispell_lietuviu") in
directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1845] ("uosis.mif.vu.lt") in
directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1938] ("latex-lt.doc") in directory
[2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1939] ("latex-lt.sxw") in directory
[2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1940] (".rhn-applet") in directory
[2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1943] (".bash_history") in directory
[2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1944] (".rhn-applet.conf") in
directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 1945] (".thunderbird") in directory
[2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 2370] (".civclientrc") in directory
[2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [2 283] (".DCOPserver_laurynas-pc__0")
in directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 2371] ("fps-linux") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3645] (".hxplayerrc") in directory
[2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3646] (".openoffice-lock") in
directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3647] (".thumbnails") in directory
[2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3651] (".mime.types") in directory
[2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3652] (".gnome_private") in
directory [2 4]points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3653] (".sversionrc") in directory
[2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3654] (".recently-used") in
directory [2 4]points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3655] ("old-src") in directory [2 4]
pointsto nowhere - is removed
rebuild_semantic_pass: The entry [4 3723] ("Finance") in directory [2 4]
pointsto nowhere - is removed
rebuild_semantic_pass: The entry [4 3725] (".adobe") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3727] (".emacs") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3728] (".gconf") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3767] (".fonts") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3777] (".gnome") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3810] (".gtkrc") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3811] ("ims.mii.lt") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3885] (".subversion") in directory
[2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3893] (".zshrc") in directory [2 4]
points to nowhere - is removed
rebuild_semantic_pass: The entry [4 3894] (".rhopenoffice1.1") in
directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4001] ("AceMoney sn.txt") in
directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4002] (".bash_profile") in directory
[2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4003] (".saves-17574-laurynas-pc")
in directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4004] ("torrents") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4006] ("mirc-logs") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4229] (".cvspass") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4230] ("Windows XP Professional") in
directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4238] (".Maelstrom-data") in
directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4239] ("projektai.txt") in directory
[2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4240] (".eggcups") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4241] (".xsession-errors") in
directory [2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4242] (".fonts.conf") in directory
[2 4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4243] (".emacs.d") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4245] ("lazybones") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4325] (".mailcap") in directory [2
4] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4327] ("texbytopic-a4.pdf") in
directory [24] points to nowhere - is removed
rebuild_semantic_pass: The entry [4 4328] ("installs") in directory [2
4] points to nowhere - is removed
vpf-10680: The directory [2 4] has the wrong block count in the StatData
(6) - corrected to (1)
vpf-10650: The directory [2 4] has the wrong size in the StatData (2768)
- corrected to (216)
Flushing..finished
        Files found: 4
        Directories found: 5
        Symlinks found: 1
        Names pointing to nowhere (removed): 93
Pass 3a (looking for lost dir/files):
####### Pass 3a (lost+found pass) #########
Looking for lost directories:
/1438_1689get_next_directory_item: The entry ".." of the directory [1438
1689] pointes to [2 1438], instead of [2 4335] - corrected
rebuild_semantic_pass: The entry [1438 1691] ("overlayinfo") in
directory [14381689] points to nowhere - is removed
vpf-10650: The directory [1438 1689] has the wrong size in the StatData
(112) -corrected to (80)
/1949_2319get_next_directory_item: The entry ".." of the directory [1949
2319] pointes to [4 1949], instead of [2 4335] - corrected
/1949_2333get_next_directory_item: The entry ".." of the directory [1949
2333] pointes to [4 1949], instead of [2 4335] - corrected
/1949_2363get_next_directory_item: The entry ".." of the directory [1949
2363] pointes to [4 1949], instead of [2 4335] - corrected
/1953_2063get_next_directory_item: The entry ".." of the directory [1953
2063] pointes to [4 1953], instead of [2 4335] - corrected
/Inbox.sbdrebuild_semantic_pass: The entry [2069 2070] ("MII") in
directory [2063 2069] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2071] ("Alna") in directory [2063
2069] points to nowhere - is removed
/Mailing Listai.sbd/Durdomai.sbd/group4infvpf-10680: The file [2069
2137] has the wrong block count in the StatData (42816) - corrected to
(2320)
rebuild_semantic_pass: The entry [2069 2138] ("MIFFUX2001.msf") in
directory [2069 2101] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2139] ("MIFFUX2001.sbd") in
directory [2069 2101] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2140] ("Kino Akademija.msf") in
directory [2069 2101] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2141] ("Kino Akademija.sbd") in
directory [2069 2101] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2142] ("asm.msf") in directory
[2069 2101] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2143] ("asm.sbd") in directory
[2069 2101] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2144] ("Amazon.msf") in directory
[2069 2101] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2145] ("Amazon.sbd") in directory
[2069 2101] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2146] ("JPM.msf") in directory
[2069 2101] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2147] ("JPM.sbd") in directory
[2069 2101] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2148] ("Licejus.msf") in
directory [20692101] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2149] ("Licejus.sbd") in
directory [20692101] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2159] ("MIFFUX2001") in directory
[2069 2101] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2160] ("VU mail.msf") in
directory [20692101] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2161] ("VU mail.sbd") in
directory [20692101] points to nowhere - is removed
vpf-10680: The directory [2069 2101] has the wrong block count in the
StatData (4) - corrected to (3)
vpf-10650: The directory [2069 2101] has the wrong size in the StatData
(1576) - corrected to (1112)
rebuild_semantic_pass: The entry [2069 2162] ("Wholenote") in directory
[2069 2092] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2163] ("FPS.msf") in directory
[2069 2092] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2164] ("FPS.sbd") in directory
[2069 2092] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2165] ("AceMoney.msf") in
directory [2069 2092] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2166] ("AceMoney.sbd") in
directory [2069 2092] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2167] ("ALP.msf") in directory
[2069 2092] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2168] ("ALP.sbd") in directory
[2069 2092] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2169] ("Development.msf") in
directory [2069 2092] points to nowhere - is removed
rebuild_semantic_pass: The entry [2069 2170] ("Development.sbd") in
directory [2069 2092] points to nowhere - is removed
rebuild_semantic_pass: The entry [2092 2210] ("Bass.msf") in directory
[2069 2092] points to nowhere - is removed
rebuild_semantic_pass: The entry [2092 2211] ("Bass.sbd") in directory
[2069 2092] points to nowhere - is removed
rebuild_semantic_pass: The entry [2092 2212] ("Durdomai") in directory
[2069 2092] points to nowhere - is removed
vpf-10680: The directory [2069 2092] has the wrong block count in the
StatData (2) - corrected to (1)
vpf-10650: The directory [2069 2092] has the wrong size in the StatData
(632) -corrected to (304)
rebuild_semantic_pass: The entry [2069 2213] ("Mailing Listai") in
directory [2063 2069] points to nowhere - is removed
vpf-10650: The directory [2063 2069] has the wrong size in the StatData
(392) -corrected to (312)
/Inboxvpf-10680: The file [2063 2215] has the wrong block count in the
StatData(215672) - corrected to (7120)
rebuild_semantic_pass: The entry [2063 2216] ("Trash") in directory
[1953 2063]points to nowhere - is removed
rebuild_semantic_pass: The entry [2063 2217] ("filterlog.html") in
directory [1953 2063] points to nowhere - is removed
rebuild_semantic_pass: The entry [2063 2218] ("Junk.msf") in directory
[1953 2063] points to nowhere - is removed
rebuild_semantic_pass: The entry [2063 2219] ("Junk.sbd") in directory
[1953 2063] points to nowhere - is removed
rebuild_semantic_pass: The entry [2063 2220] ("Templates.msf") in
directory [1953 2063] points to nowhere - is removed
rebuild_semantic_pass: The entry [2063 2221] ("Templates.sbd") in
directory [1953 2063] points to nowhere - is removed
rebuild_semantic_pass: The entry [2063 2222] ("Sent.msf") in directory
[1953 2063] points to nowhere - is removed
rebuild_semantic_pass: The entry [2063 2223] ("Sent.sbd") in directory
[1953 2063] points to nowhere - is removed
rebuild_semantic_pass: The entry [2063 2224] ("msgFilterRules.dat") in
directory [1953 2063] points to nowhere - is removed
rebuild_semantic_pass: The entry [2063 2225] ("Unsent Messages") in
directory [1953 2063] points to nowhere - is removed
rebuild_semantic_pass: The entry [2063 2226] ("Templates") in directory
[1953 2063] points to nowhere - is removed
rebuild_semantic_pass: The entry [2063 2227] ("Drafts.msf") in directory
[1953 2063] points to nowhere - is removed
rebuild_semantic_pass: The entry [2063 2228] ("Drafts.sbd") in directory
[1953 2063] points to nowhere - is removed
rebuild_semantic_pass: The entry [2063 2229] ("Trash.msf") in directory
[1953 2063] points to nowhere - is removed
rebuild_semantic_pass: The entry [2063 2230] ("junklog.html") in
directory [1953 2063] points to nowhere - is removed
vpf-10680: The directory [1953 2063] has the wrong block count in the
StatData (2) - corrected to (1)
vpf-10650: The directory [1953 2063] has the wrong size in the StatData
(736) -corrected to (288)
/1953_2231get_next_directory_item: The entry ".." of the directory [1953
2231] pointes to [4 1953], instead of [2 4335] - corrected
rebuild_semantic_pass: The entry [2231 2237] ("Microsoft.sbd") in
directory [1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2259] ("OpenTTD") in directory
[1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2260] ("Sysinternals.msf") in
directory [1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2261] ("Sysinternals.sbd") in
directory [1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2262] ("News.msf") in directory
[1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2263] ("News.sbd") in directory
[1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2273] ("feeditems.rdf") in
directory [1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2274] ("Microsoft") in directory
[1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2275] ("msgFilterRules.dat") in
directory [1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2276] ("feeds.rdf") in directory
[1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2277] ("Blogs.msf") in directory
[1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2278] ("Blogs.sbd") in directory
[1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2288] ("Trash.msf") in directory
[1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2289] ("Trash.sbd") in directory
[1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2290] ("OpenTTD.msf") in
directory [19532231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2291] ("OpenTTD.sbd") in
directory [19532231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2292] ("Mozilla") in directory
[1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2293] ("Fun.msf") in directory
[1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2294] ("Fun.sbd") in directory
[1953 2231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2304] ("Mozilla.msf") in
directory [19532231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2305] ("Mozilla.sbd") in
directory [19532231] points to nowhere - is removed
rebuild_semantic_pass: The entry [2231 2315] ("Sysinternals") in
directory [1953 2231] points to nowhere - is removed
vpf-10680: The directory [1953 2231] has the wrong block count in the
StatData (2) - corrected to (1)
vpf-10650: The directory [1953 2231] has the wrong size in the StatData
(840) -corrected to (176)
/2170_2189get_next_directory_item: The entry ".." of the directory [2170
2189] pointes to [2069 2170], instead of [2 4335] - corrected
/2170_2201get_next_directory_item: The entry ".." of the directory [2170
2201] pointes to [2069 2170], instead of [2 4335] - corrected
/3728_3729get_next_directory_item: The entry ".." of the directory [3728
3729] pointes to [4 3728], instead of [2 4335] - corrected
/3777_3778get_next_directory_item: The entry ".." of the directory [3777
3778] pointes to [4 3777], instead of [2 4335] - corrected
/3777_3807get_next_directory_item: The entry ".." of the directory [3777
3807] pointes to [4 3777], instead of [2 4335] - corrected
/3811_3812get_next_directory_item: The entry ".." of the directory [3811
3812] pointes to [4 3811], instead of [2 4335] - corrected
/text-baserebuild_semantic_pass: The entry [3811 3826]
("index.php.svn-base") in directory [3811 3824] points to nowhere - is
removed
vpf-10650: The directory [3811 3824] has the wrong size in the StatData
(120) -corrected to (80)
rebuild_semantic_pass: The entry [3811 3827] ("README.txt") in directory
[3811 3812] points to nowhere - is removed
rebuild_semantic_pass: The entry [3811 3828] ("prop-base") in directory
[3811 3812] points to nowhere - is removed
rebuild_semantic_pass: The entry [3811 3831] ("wcprops") in directory
[3811 3812] points to nowhere - is removed
vpf-10650: The directory [3811 3812] has the wrong size in the StatData
(296) -corrected to (208)
/3894_3895get_next_directory_item: The entry ".." of the directory [3894
3895] pointes to [4 3894], instead of [2 4335] - corrected
rebuild_semantic_pass: The entry [3895 3896] ("temp") in directory [3894
3895] points to nowhere - is removed
rebuild_semantic_pass: The entry [3895 3897] ("database") in directory
[3894 3895] points to nowhere - is removed
rebuild_semantic_pass: The entry [3895 3900] ("basic") in directory
[3894 3895]points to nowhere - is removed
rebuild_semantic_pass: The entry [3895 3907] ("store") in directory
[3894 3895]points to nowhere - is removed
rebuild_semantic_pass: The entry [3895 3908] ("autocorr") in directory
[3894 3895] points to nowhere - is removed
rebuild_semantic_pass: The entry [3895 3909] ("autotext") in directory
[3894 3895] points to nowhere - is removed
rebuild_semantic_pass: The entry [3895 3911] ("template") in directory
[3894 3895] points to nowhere - is removed
rebuild_semantic_pass: The entry [3895 3912] ("uno_packages") in
directory [3894 3895] points to nowhere - is removed
rebuild_semantic_pass: The entry [3895 3913] ("backup") in directory
[3894 3895] points to nowhere - is removed
rebuild_semantic_pass: The entry [3895 3914] ("gallery") in directory
[3894 3895] points to nowhere - is removed
rebuild_semantic_pass: The entry [3895 3919] ("config") in directory
[3894 3895] points to nowhere - is removed
rebuild_semantic_pass: The entry [3895 3939] ("wordbook") in directory
[3894 3895] points to nowhere - is removed
rebuild_semantic_pass: The entry [3895 3941] ("plugin") in directory
[3894 3895] points to nowhere - is removed
rebuild_semantic_pass: The entry [3895 3942] ("registry") in directory
[3894 3895] points to nowhere - is removed
rebuild_semantic_pass: The entry [3895 3978] ("psprint") in directory
[3894 3895] points to nowhere - is removed
vpf-10650: The directory [3894 3895] has the wrong size in the StatData
(416) -corrected to (48)
/3894_3984get_next_directory_item: The entry ".." of the directory [3894
3984] pointes to [4 3894], instead of [2 4335] - corrected
/3942_3943get_next_directory_item: The entry ".." of the directory [3942
3943] pointes to [3895 3942], instead of [2 4335] - corrected
/3942_3954get_next_directory_item: The entry ".." of the directory [3942
3954] pointes to [3895 3942], instead of [2 4335] - corrected
/4246_4247get_next_directory_item: The entry ".." of the directory [4246
4247] pointes to [4245 4246], instead of [2 4335] - corrected
/propsvpf-10680: The directory [4246 4255] has the wrong block count in
the StatData (2) - corrected to (1)
vpf-10650: The directory [4246 4255] has the wrong size in the StatData
(560) -corrected to (48)
rebuild_semantic_pass: The entry [4246 4267] ("empty-file") in directory
[4246 4247] points to nowhere - is removed
rebuild_semantic_pass: The entry [4246 4268] ("entries") in directory
[4246 4247] points to nowhere - is removed
vpf-10650: The directory [4246 4247] has the wrong size in the StatData
(360) -corrected to (304)
/4307_4308get_next_directory_item: The entry ".." of the directory [4307
4308] pointes to [4245 4307], instead of [2 4335] - corrected
/4307_4313get_next_directory_item: The entry ".." of the directory [4307
4313] pointes to [4245 4307], instead of [2 4335] - corrected
/4307_4318get_next_directory_item: The entry ".." of the directory [4307
4318] pointes to [4245 4307], instead of [2 4335] - corrected
/4307_4321get_next_directory_item: The entry ".." of the directory [4307
4321] pointes to [4245 4307], instead of [2 4335] - corrected
Looking for lost files:
vpf-10680: The file [4328 4329] has the wrong block count in the
StatData (13208) - corrected to (2544)
Flushing..finished
        Objects without names 123
        Empty lost dirs removed 32
        Dirs linked to /lost+found: 21
        Files linked to /lost+found 102
Pass 4 - finished       done 0, 0 /sec
        Deleted unreachable items 40
Flushing..finished
Syncing..finished
###########
reiserfsck finished at Sun Feb 13 18:17:09 2005
###########
[root@laurynas-pc ~]# reiserfsck /dev/hda6
reiserfsck 3.6.18 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will read-only check consistency of the filesystem on /dev/hda6
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
###########
reiserfsck --check started at Sun Feb 13 18:17:36 2005
###########
Replaying journal..
Reiserfs journal '/dev/hda6' in blocks [18..8211]: 0 transactions
replayed
Checking internal tree..finished
Comparing bitmaps..finished
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem:
        Leaves 93
        Internal nodes 1
        Directories 115
        Other files 291
        Data block pointers 36145 (0 of them are zero)
        Safe links 0
###########
reiserfsck finished at Sun Feb 13 18:17:39 2005
###########


