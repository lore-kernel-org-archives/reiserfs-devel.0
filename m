From: jose@tridentemonigotes.com
Subject: Desaster Reiser
Date: Thu, 05 Sep 2002 10:53:35 -0400
Sender: jose@erazer.ows.es
Message-ID: <3D776FEF.F34E655B@tridentemonigotes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11371-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiser <reiserfs-list@namesys.com>

Hello:

        -I have a server 2.4.3 and something HD reiserfs. Yesterday one
of this
HD started to give me problems this is the message.

kernel: vs-4080:reiserfs-free-block:free-block (0342:137252)
(dev:blocknr); bit already cleared.
kernel: vs-13042: reiserfs_read_inode 2: (190310 190324 0x0 SD) not
found
kernel:vs-13048: reiserfs_iget: bad inode stat data of (190310 190324)
not found

After this with reiserfs --check /dev/hdb2 this is the message that gave
me

bad_leaf: block 8391 has invalid item 11: 2 42 0x1 DIR, len 452, entry
count 17, fsck need 0,
format old
block 198889 is not marked as used in the disk bitmap
block 442285 is not marked as used in the disk bitmap
block 442286 is not marked as used in the disk bitmap
block 442287 is not marked as used in the disk bitmap
block 442317 is not marked as used in the disk bitmap
block 442318 is not marked as used in the disk bitmap
block 442319 is not marked as used in the disk bitmap
grow_id_map: objectid map expanded: used 5120, 5 blocks
grow_id_map: objectid map expanded: used 5120, 5 blocks
grow_id_map: objectid map expanded: used 5120, 5 blocks
grow_id_map: objectid map expanded: used 5120, 5 blocks
grow_id_map: objectid map expanded: used 5120, 5 blocks
bad_leaf: block 394534 has invalid item 0: 197285 203828 0x73b8ad80 DIR,
len 112, entry count
4, fsck need 0, format old
free block count 413799 mismatches with a correct one 413826. 
on-disk bitmap does not match to the correct one. 22 bytes differ
check_semantic_tree: hash mismatch detected (FactEmit.MYD)
check_semantic_tree: name "FactEmit.MYD" in directory 2 42 points to
nowhere
check_semantic_tree: hash mismatch detected (FactEmit.frm)
check_semantic_tree: name "FactEmit.frm" in directory 2 42 points to
nowhere


I intented debugreiserfs /dev/hdb2 and this is the out file

Super block of format 3.5 found on the 0x3 in block 16
Block count 4650656
Blocksize 4096
Free blocks 413799
Busy blocks (skipped 16, bitmaps - 142, journal blocks - 8193
1 super blocks, 4228505 data blocks
Root block 8403
Journal block (first) 18
Journal dev 0
Journal orig size 8192
Filesystem state ERROR
Tree height 4
Hash function used to sort names: "r5"
Objectid map size 250, max 1004


I probed with badblocks and reiserfsck --rebuild -sd but was not
anithing problem and my fear is I wrote that somebody have lose their HD
with reiserfsck --rebuild -tree because after can't mount their units.I
think that this is the last option if I have another
Have another options before my HD is totally crash and all information
is missing?

Thank Your for all and I don't hesitate.
Best Regards
