From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Problem with the latest auto snapshot
Date: Mon, 14 Jun 2004 22:22:16 +0400
Message-ID: <20040614182215.GT8091@backtop.namesys.com>
References: <200406122131.25974.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19180-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200406122131.25974.henning-04@die.informatik.uni-siegen.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Cc: reiserfs-list@namesys.com

On Sat, Jun 12, 2004 at 09:31:25PM +0200, Henning Westerholt wrote:
> Hello,
> 
> i have some problems with the latest auto snapshot against 2.6.7-rc3-mm1 
> (2004.06.11-19.36).

Thanks for the report.

do you use SMP, RAID, LVM ?

> After some few disk operation a process try to access some data on the 
> partition, and hung forever. I got the following log entries:

Were there reiser4 messages in the log before "[nikita-2219]... Failed to
initialize dir for..."?
 
> Jun 12 20:51:40 sonne kernel:reiser4[emerge(6603)]: create_child_common 
> (fs/reiser4/plugin/dir/dir.c:519)[nikita-2219]:
> Jun 12 20:51:40 sonne kernel: WARNING: Failed to initialize dir for 88794: -17
> Jun 12 20:51:40 sonne kernel: reiser4[emerge(6603)]: rem_entry_cde 
> (fs/reiser4/plugin/item/cde.c:1038)[nikita-2628]:
> Jun 12 20:51:40 sonne kernel: WARNING: Dir is broke: 88794: 0
> Jun 12 20:51:40 sonne kernel: reiser4[emerge(6603)]: done_hashed 
> (fs/reiser4/plugin/dir/hashed_dir.c:173)[nikita-2252]:
> Jun 12 20:51:40 sonne kernel: WARNING: Cannot remove dot of 88794: -5
> Jun 12 20:52:27 sonne kernel: reiser4[emerge(6625)]: create_child_common 
> (fs/reiser4/plugin/dir/dir.c:519)[nikita-2219]:
> Jun 12 20:52:27 sonne kernel: WARNING: Failed to initialize dir for 88795: -17
> Jun 12 20:52:27 sonne kernel: reiser4[emerge(6625)]: rem_entry_cde 
> (fs/reiser4/plugin/item/cde.c:1038)[nikita-2628]:
> Jun 12 20:52:27 sonne kernel: WARNING: Dir is broke: 88795: 0
> Jun 12 20:52:27 sonne kernel: reiser4[emerge(6625)]: done_hashed 
> (fs/reiser4/plugin/dir/hashed_dir.c:173)[nikita-2252]:
> Jun 12 20:52:27 sonne kernel: WARNING: Cannot remove dot of 88795: -5
> Jun 12 20:52:53 sonne kernel: reiser4[sync(6634)]: kill_hook_internal 
> (fs/reiser4/plugin/item/internal.c:343)[nikita-1223]:
> Jun 12 20:52:53 sonne kernel: WARNING: Cowardly refuse to remove link to 
> non-empty node
> Jun 12 20:53:03 sonne kernel: reiser4[rm(6725)]: cbk_level_lookup 
> (fs/reiser4/search.c:1025)[vs-3533]
> Jun 12 20:53:03 sonne kernel: WARNING: Keys are inconsistent. Fsck?
> Jun 12 20:53:05 sonne kernel: reiser4[ebuild.sh(6775)]: traverse_tree 
> (fs/reiser4/search.c:747)[nikita-1481]:
> Jun 12 20:53:05 sonne kernel: WARNING: Too many iterations: 128
> Jun 12 20:53:05 sonne kernel: reiser4[ebuild.sh(6775)]: traverse_tree 
> (fs/reiser4/search.c:747)[nikita-1481]:
> Jun 12 20:53:05 sonne kernel: WARNING: Too many iterations: 256
> Jun 12 20:53:05 sonne kernel: reiser4[ebuild.sh(6775)]: traverse_tree 
> (fs/reiser4/search.c:747)[nikita-1481]:
> ...
> Jun 12 20:56:57 sonne kernel: WARNING: Too many iterations: 33554432
> *****************
> 
> I could not kill the process, a reboot was needed.
> 
> After the  fsck run with build-fs i got new errors:

The latest officially released reiser4 utils are not aware of recent stat data
extensions.  That can explain "item has wrong length" errors.  However, that
does not explain "points to the already used block" errors :(.

> reiser4[install(7105)]: cbk_level_lookup (fs/reiser4/search.c:1025)[vs-3533]:
> WARNING: Keys are inconsistent. Fsck?
> reiser4[install(7105)]: done_hashed (fs/reiser4/plugin/dir/hashed_dir.c:173)
> [nikita-2252]:WARNING: Cannot remove dot of 88837: -5
> ....
> 
> Any operation on the fs fail with a input/ output error. I try to fix this 
> with fsck, but it found no errors. I attached the output from the first fsck 
> runs.
> I'll rebuild the partition tomorow, and give it another try..
> 
> Best regards,
> 
> Henning
> 
> 
> 

> fsck.reiser4 /dev/hdd8
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
> 
> Fscking the /dev/hdd8 block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will check the consistency of the Reiser4 FileSystem.
> Continue?
> (Yes/No): yes
> ***** Opening the fs.
> Reiser4 journal (journal40) on /dev/hdd8: 0 transactions replayed of the total 0 blocks.
> Reiser4 fs was detected on /dev/hdd8.
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           f28037a6-c1d8-4326-9fb1-f1917bb03a47
> label:          <none>
> 
> Format super block (17):
> plugin:         format40
> description:    Disk-format for reiser4, ver. 0.5.4
> magic:          ReIsEr40FoRmAt
> flushes:        0
> mkfs id:        0x13263be0
> blocks:         2441872
> free blocks:    2354055
> root block:     87497
> tail policy:    0x4 (smart)
> next oid:       0x15adc
> file count:     21519
> tree height:    4
> key policy:     LARGE
> 
> ***** Tree Traverse Pass: scanning the reiser4 internal tree.
> Error: Node (27), item (0): item has the wrong length (78). Should be (44).
> Error: Node (27), item (0): broken item found.
> Error: Node (27): the node is broken. Pointed from the node (22), item (0), unit (0). The whole
> subtree is skipped.
> Error: Node (67387), item (11), unit (0): Points to the block (26902) which is in the tree already.
> The whole subtree is skipped.
> Error: Level (2) of the node (67388) doesn't match the expected one (1). The whole subtree is
> skipped.
> Error: Node (67991): The left delimiting key [1307e:0(NAME):0:0:0] in the parent node (67388), pos
> (0/4294967295) does not match the first key [1307d:0(NAME):0:0:0] in the node.
> Error: Node (67388), item (64), unit (0): Points to the node [67991] with wrong delimiting keys. Th
> whole subtree is skipped.
>         Read nodes 10341
>         Nodes left in the tree 10338
>                 Leaves of them 10192, Twigs of them 143
>         Broken of them 1
>                 Leaves of them 1, Twigs of them 0
>         Nodes with wrong delimiting keys 1
>                 Leaves of them 1, Twigs of them 0
>         Invalid node pointers 2
>         Time interval: Sat Jun 12 21:17:25 2004 - Sat Jun 12 21:17:30 2004
> ***** TwigScan Pass: checking extent pointers of all twigs.
>         Read twigs 143
>         Time interval: Sat Jun 12 21:17:30 2004 - Sat Jun 12 21:17:30 2004
> 
> Fatal corruptions were found. Semantic pass is skipped.
> Free block count 2354054 found in the format is wrong. Sould be 2354059.
> ***** fsck.reiser4 finished at Sat Jun 12 21:17:30 2004
> Closing fs...done
> 
> 4 fatal corruptions were detected in FileSystem. Run with --build-fs option to fix them.
> sonne var # fsck.reiser4 /dev/hdd8 --build-fs
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
> 
> Fscking the /dev/hdd8 block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will build the Reiser4 FileSystem.
> Continue?
> (Yes/No): yes
> ***** Opening the fs.
> Reiser4 journal (journal40) on /dev/hdd8: 0 transactions replayed of the total 0 blocks.
> Reiser4 fs was detected on /dev/hdd8.
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           f28037a6-c1d8-4326-9fb1-f1917bb03a47
> label:          <none>
> 
> Format super block (17):
> plugin:         format40
> description:    Disk-format for reiser4, ver. 0.5.4
> magic:          ReIsEr40FoRmAt
> flushes:        0
> mkfs id:        0x13263be0
> blocks:         2441872
> free blocks:    2354055
> root block:     87497
> tail policy:    0x4 (smart)
> next oid:       0x15adc
> file count:     21519
> tree height:    4
> key policy:     LARGE
> 
> ***** Tree Traverse Pass: scanning the reiser4 internal tree.
> Error: Node (27), item (0): item has the wrong length (78). Should be (44). Fixed.
> Error: Node (27), item (0): item has the wrong extention mask (19). Should be (3). Fixed.
> Error: Node (67387), item (11), unit (0): Points to the block (26902) which is in the tree already.
> Removed.
> Error: Level (2) of the node (67388) doesn't match the expected one (1). Removed.
> Error: Node (67991): The left delimiting key [1307e:0(NAME):0:0:0] in the parent node (67388), pos
> (0/4294967295) does not match the first key [1307d:0(NAME):0:0:0] in the node. Fixed.
>         Read nodes 10341
>         Nodes left in the tree 10340
>                 Leaves of them 10194, Twigs of them 143
>         Corrected nodes 1
>                 Leaves of them 1, Twigs of them 0
>         Zeroed node pointers 2
>         Time interval: Sat Jun 12 21:18:24 2004 - Sat Jun 12 21:18:25 2004
> ***** TwigScan Pass: checking extent pointers of all twigs.
>         Read twigs 143
>         Time interval: Sat Jun 12 21:18:25 2004 - Sat Jun 12 21:18:25 2004
> ***** DiskScan Pass: scanning the partition for unconnected nodes.
> Error: Node (87761), item (0): item has the wrong length (78). Should be (44). Fixed.
> Error: Node (87761), item (0): item has the wrong extention mask (19). Should be (3). Fixed.
>         Read nodes 10480
>         Good nodes 11
>                 Leaves of them 9, Twigs of them 2
>         Time interval: Sat Jun 12 21:18:25 2004 - Sat Jun 12 21:18:27 2004
> ***** TwigScan Pass: checking extent pointers of all twigs.
> Error: Node (87754), item (0), unit (0): points to the already used blocks,  region [35723..35805].
> Zeroed.
> Error: Node (87754), item (1), unit (0): points to the already used blocks,  region [67356..67385].
> Zeroed.
> Error: Node (87754), item (2), unit (0): points to the already used blocks,  region [26820..26874].
> Zeroed.
> Error: Node (87754), item (3), unit (0): points to the already used blocks,  region [67301..67355].
> Zeroed.
> Error: Node (87754), item (4), unit (0): points to the already used blocks,  region [39386..39392].
> Zeroed.
> Error: Node (87754), item (5), unit (0): points to the already used blocks,  region [39393..39399].
> Zeroed.
> Error: Node (87754), item (6), unit (0): points to the already used blocks,  region [26875..26901].
> Zeroed.
> Error: Node (87754), item (7), unit (0): points to the already used blocks,  region [38774..38986].
> Zeroed.
> Error: Node (87754), item (8), unit (0): points to the already used blocks,  region [38987..39147].
> Zeroed.
> Error: Node (87754), item (9), unit (0): points to the already used blocks,  region [39148..39385].
> Zeroed.
> Error: Node (87754), item (9), unit (1): points to the already used blocks,  region [66115..66657].
> Zeroed.
> Error: Node (87754), item (9): 1 mergable units were found in the extent40 unit. Fixed.
> Error: Node (87754), item (14), unit (0): points to the already used blocks,  region [67390..67408]
> Zeroed.
> Error: Node (87754), item (16), unit (0): points to the already used blocks,  region [67410..67424]
> Zeroed.
> Error: Node (87754), item (18), unit (0): points to the already used blocks,  region [67426..67441]

[...]

-- 
Alex.
