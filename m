From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: reiserfsck not fixing vs-5150/vs-13070
Date: Wed, 28 Aug 2002 22:37:54 +0200
Message-ID: <20020828203754.GA11894@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11335-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list <reiserfs-list@namesys.com>

Hello,

I have some difficulties with a file system here. SuSE 2.4.19-4GB #1
kernel, file system in reiserfs 3.6 format with r5 hash:

| is_leaf: wrong item type for item *3.5*[13010 13029 0x1 IND], item_len 4, item_location 4060, free_space(entry_count) 0
| vs-5150: search_by_key: invalid format found in block 33160. Fsck?
| vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of [13010 13032 0x0 SD]

I should note that I mounted that file system with "-o conv" recently to
upgrade it to 3.6. Nothing was in the logs that called for my attention.

Running reiserfsck --check (3.6.3) now, I get:

| Filesystem seems mounted read-only. Skipping journal replay..
| Checking S+tree..ok                                     
| Comparing bitmaps..ok
| Checking Semantic tree...
| ok                                                                             
| There were found 465 corruptions which can be fixed with --fix-fixable
| check_and_free_buffer_mem: dirty buffer (4 16) found

and the log file has tons of "file X Y has wrong sd_blocks 2, has to be
1" in it, but grepping for 13010, 13029 and 33160 in 


I tried reiserfsck 3.6.3 with --fix-fixable (what was recommended by
reiserfsck --check) and also with --rebuild-tree, at no avail, the error
keeps coming back.

I can provide a full meta data dump if necessary.

Is this something reiserfsck should fix?



debugreiserfs -p -1 33160 says:

===================================================================
LEAF NODE (33160) contains level=1, nr_items=14, free_space=839 rdkey (real items 14)
-------------------------------------------------------------------------------
|###|type|ilen|f/sp| loc|fmt|fsck|                   key                      |
|   |    |    |e/cn|    |   |need|                                            |
-------------------------------------------------------------------------------
|  0|13010 13029 0x0 SD (0), len 32, location 4064 entry count 65535, fsck need 0, format old|
(OLD SD), mode -rwxr-xr-x, size 5272, nlink 1, uid 0, FDB 4097, mtime 02/27/2002 19:55:54 blocks 16
-------------------------------------------------------------------------------
|  1|13010 13029 0x1 IND (1), len 4, location 4060 entry count 0, fsck need 4, format old|
1 pointer
[ 367969]
-------------------------------------------------------------------------------
|  2|13010 13029 0x1001 DRCT (2), len 1176, location 2884 entry count 0, fsck need 0, format old|
-------------------------------------------------------------------------------
|  3|13010 13031 0x0 SD (0), len 32, location 2852 entry count 65535, fsck need 0, format old|
(OLD SD), mode -rwxr-xr-x, size 12414, nlink 1, uid 0, FDB 12289, mtime 02/27/2002 19:55:54 blocks 32
-------------------------------------------------------------------------------
|  4|13010 13031 0x1 IND (1), len 12, location 2840 entry count 0, fsck need 4, format old|
3 pointers
[ 367977(2) 367980]
-------------------------------------------------------------------------------
|  5|13010 13031 0x3001 DRCT (2), len 126, location 2714 entry count 0, fsck need 0, format old|
-------------------------------------------------------------------------------
|  6|13010 13032 0x0 SD (0), len 32, location 2682 entry count 65535, fsck need 0, format old|
(OLD SD), mode -rwxr-xr-x, size 5363, nlink 1, uid 0, FDB 4097, mtime 02/27/2002 19:55:54 blocks 16
-------------------------------------------------------------------------------
|  7|13010 13032 0x1 IND (1), len 4, location 2678 entry count 0, fsck need 4, format old|
1 pointer
[ 368013]
-------------------------------------------------------------------------------
|  8|13010 13032 0x1001 DRCT (2), len 1267, location 1411 entry count 0, fsck need 0, format old|
-------------------------------------------------------------------------------
|  9|13010 13033 0x0 SD (0), len 32, location 1379 entry count 65535, fsck need 0, format old|
(OLD SD), mode -rwxr-xr-x, size 7115, nlink 1, uid 0, FDB 4294967295, mtime 02/27/2002 19:55:54 blocks 16
-------------------------------------------------------------------------------
| 10|13010 13033 0x1 IND (1), len 8, location 1371 entry count 0, fsck need 0, format old|
2 pointers
[ 368030(2)]
-------------------------------------------------------------------------------
| 11|13010 13034 0x0 SD (0), len 32, location 1339 entry count 65535, fsck need 0, format old|
(OLD SD), mode -rwxr-xr-x, size 6536, nlink 1, uid 0, FDB 4097, mtime 02/27/2002 19:55:54 blocks 16
-------------------------------------------------------------------------------
| 12|13010 13034 0x1 IND (1), len 4, location 1335 entry count 0, fsck need 0, format old|
1 pointer
[ 368032]
-------------------------------------------------------------------------------
| 13|13010 13034 0x1001 DRCT (2), len 136, location 1199 entry count 65535, fsck need 0, format old|
===================================================================

-- 
Matthias Andree
