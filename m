From: Edward Shishkin <edward@namesys.com>
Subject: Re: reiserfsck - "out of disk space" - Aborted. Help needed
Date: Fri, 23 Jun 2006 01:38:40 +0400
Message-ID: <449B0DE0.10409@namesys.com>
References: <200606222041.09454.jens@spamfreemail.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28841-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200606222041.09454.jens@spamfreemail.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jens Benecke <jens@spamfreemail.de>
Cc: reiserfs-list@namesys.com

Jens Benecke wrote:
> Hello,
> 
> I have a reiserfs partition on a SuSE 10.0 machine (kernel 
> 2.6.13-15.10-default, by SuSE) that  was suddenly out of disk space. One 
> file on the disk was inaccessible  and syslog showed me
> 
> md2: warning: vs-13060: reiserfs_update_sd: stat data of object [420 48207
> 0x0 SD] (nlink == 1)
>  not found (pos 1)
> 
> hundreds of times.
> 
> reiserfsck (3.6.18, by SuSE) --fix-fixable wanted to run --rebuild-tree, so 
> I did. Rebuild-tree worked for over four hours (the partition is ~130GB) 
> and then exited with "out of disk space".
> 
> I searched the list archives for a bit more info and the only solution I 
> found so far was to copy the disk to a bigger harddisk, enlarge the 
> filesystem and do another reiserfsck there.
> 
> Another hint was to use reiserfsprogs-3.6.20. Will these be able to repair 
> a full file system?


I believe that this problem is resolved in 3.6.20, but it would
be better to dd your /dev/md2 to a larger partition first. Dont
forget to zero a rest at the end of this spare partition.


> 
> Or is there a way to delete a file off this file system (perhaps using 
> debugreiserfs) before fixing it?

No, debugreiserfs is to dump, pack, etc.. metadata

Thanks,
Edward.


> 
> Thank you!
> 
> 
> 
> server:/ # reiserfsck --rebuild-tree /dev/md2
> reiserfsck 3.6.18 (2003 www.namesys.com)
> 
> *************************************************************
> ** Do not  run  the  program  with  --rebuild-tree  unless **
> ** something is broken and MAKE A BACKUP  before using it. **
> ** If you have bad sectors on a drive  it is usually a bad **
> ** idea to continue using it. Then you probably should get **
> ** a working hard drive, copy the file system from the bad **
> ** drive  to the good one -- dd_rescue is  a good tool for **
> ** that -- and only then run this program.                 **
> ** If you are using the latest reiserfsprogs and  it fails **
> ** please  email bug reports to reiserfs-list@namesys.com, **
> ** providing  as  much  information  as  possible --  your **
> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> ** messages  (including version),  the reiserfsck logfile, **
> ** check  the  syslog file  for  any  related information. **
> ** If you would like advice on using this program, support **
> ** is available  for $25 at  www.namesys.com/support.html. **
> *************************************************************
> 
> Will rebuild the filesystem (/dev/md2) tree
> Will put log info to 'stdout'
> 
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes
> Replaying journal..
> Reiserfs journal '/dev/md2' in blocks [18..8211]: 0 transactions replayed
> ###########
> reiserfsck --rebuild-tree started at Thu Jun 22 13:54:27 2006
> ###########
> 
> Pass 0:
> ####### Pass 0 #######
> Loading on-disk bitmap .. ok, 36186383 blocks marked used
> Skipping 9315 blocks (super block, journal, bitmaps) 36177068 blocks will
> be read
> 0%block 95806: The number of items (1) is incorrect, should be (0) -
> correctedc
> block 95806: The free space (0) is incorrect, should be (4072) - corrected
> .block 1650335: The number of items (36356) is incorrect, should be (1) -
> corrected
> block 1650335: The free space (8703) is incorrect, should be (720) -
> corrected
> pass0: vpf-10110: block 1650335, item (0): Unknown item type found
> [4287497216 4278190343 0x20006ff ??? (15)] - deleted
> block 1723316: The number of items (1) is incorrect, should be (0) -
> corrected
> block 1723316: The free space (45449) is incorrect, should be (4072) -
> corrected
> block 1922007: The free space (0) is incorrect, should be (4072) -
> corrected
> block 2014406: The number of items (2) is incorrect, should be (0) -
> corrected
> block 2014406: The free space (12) is incorrect, should be (4072) -
> corrected
> .block 3130029: The number of items (7) is incorrect, should be (1) -
> corrected
> block 3130029: The free space (0) is incorrect, should be (4048) -
> corrected
> pass0: vpf-10150: block 3130029: item 0: Wrong key [0 0 0x0 SD (0)],
> deleted
> block 3227071: The number of items (1) is incorrect, should be (0) -
> corrected
> block 3227071: The free space (0) is incorrect, should be (4072) -
> corrected
> block 3292302: The number of items (1) is incorrect, should be (0) -
> corrected
> block 3292302: The free space (0) is incorrect, should be (4072) -
> corrected
> block 3697765: The number of items (7) is incorrect, should be (1) -
> corrected
> block 3697765: The free space (0) is incorrect, should be (4048) -
> corrected
> pass0: vpf-10150: block 3697765: item 0: Wrong key [0 0 0x0 SD (0)],
> deleted
> .block 4856597: The number of items (2) is incorrect, should be (0) -
> corrected
> block 4856597: The free space (12) is incorrect, should be (4072) -
> corrected
> block 5036311: The free space (0) is incorrect, should be (4072) -
> corrected
> block 5628348: The number of items (770) is incorrect, should be (1) -
> corrected
> block 5628348: The free space (1797) is incorrect, should be (2002) -
> corrected
> pass0: vpf-10110: block 5628348, item (0): Unknown item type found
> [117900805 33752070 0x1ff00f3 ??? (15)] - deleted
> .20%block 8612252: The number of items (2) is incorrect, should be (0) -
> corrected
> block 8612252: The free space (0) is incorrect, should be (4072) -
> corrected
> .block 8725700: The number of items (1) is incorrect, should be (0) -
> corrected
> block 8725700: The free space (0) is incorrect, should be (4072) -
> corrected
> block 9013913: The free space (0) is incorrect, should be (4072) -
> corrected
> block 9023270: The number of items (1) is incorrect, should be (0) -
> corrected
> block 9023270: The free space (0) is incorrect, should be (4072) -
> corrected
> block 9238461: The free space (256) is incorrect, should be (4072) -
> corrected
> block 10069319: The free space (0) is incorrect, should be (4072) -
> corrected
> .block 10158013: The free space (0) is incorrect, should be (4072) -
> corrected
> block 10819605: The free space (0) is incorrect, should be (4072) -
> corrected
> block 11399322: The number of items (256) is incorrect, should be (1) -
> corrected
> block 11399322: The free space (48896) is incorrect, should be (2512) -
> corrected
> pass0: vpf-10110: block 11399322, item (0): Unknown item type found
> [4026532864 100681215 0x81000000 ??? (15)] - deleted
> .block 11786043: The number of items (14) is incorrect, should be (1) -
> corrected
> block 11786043: The free space (32) is incorrect, should be (4048) -
> corrected
> pass0: vpf-10110: block 11786043, item (0): Unknown item type found
> [67109376 6728704 0x0 ??? (15)] - deleted
> .40%..block 18728889: The number of items (1) is incorrect, should be (0)
>  - corrected
> block 18728889: The free space (0) is incorrect, should be (4072) -
> corrected
> .block 18954644: The number of items (1) is incorrect, should be (0) -
> corrected
> block 18954644: The free space (0) is incorrect, should be (4072) -
> corrected
> block 19180732: The number of items (1) is incorrect, should be (0) -
> corrected
> block 19180732: The free space (0) is incorrect, should be (4072) -
> corrected
> block 19563541: The number of items (1) is incorrect, should be (0) -
> corrected
> block 19563541: The free space (0) is incorrect, should be (4072) -
> corrected
> block 19648244: The number of items (1) is incorrect, should be (0) -
> corrected
> block 19648244: The free space (0) is incorrect, should be (4072) -
> corrected
> block 20031440: The number of items (1) is incorrect, should be (0) -
> corrected
> block 20031440: The free space (0) is incorrect, should be (4072) -
> corrected
> block 20072796: The number of items (1) is incorrect, should be (0) -
> corrected
> block 20072796: The free space (0) is incorrect, should be (4072) -
> corrected
> .block 20279844: The number of items (1) is incorrect, should be (0) -
> corrected
> block 20279844: The free space (0) is incorrect, should be (4072) -
> corrected
> block 20550022: The number of items (1) is incorrect, should be (0) -
> corrected
> block 20550022: The free space (0) is incorrect, should be (4072) -
> corrected
> block 20679212: The number of items (1) is incorrect, should be (0) -
> corrected
> block 20679212: The free space (0) is incorrect, should be (4072) -
> corrected
> block 21032820: The number of items (1) is incorrect, should be (0) -
> corrected
> block 21032820: The free space (0) is incorrect, should be (4072) -
> corrected
> block 21160479: The number of items (1) is incorrect, should be (0) -
> corrected
> block 21160479: The free space (0) is incorrect, should be (4072) -
> corrected
> block 21333774: The number of items (1) is incorrect, should be (0) -
> corrected
> block 21333774: The free space (0) is incorrect, should be (4072) -
> corrected
> 60%block 21718392: The number of items (1) is incorrect, should be (0) -
> corrected
> block 21718392: The free space (0) is incorrect, should be (4072) -
> corrected
> block 22029473: The number of items (1) is incorrect, should be (0) -
> corrected
> block 22029473: The free space (0) is incorrect, should be (4072) -
> corrected
> block 22338448: The number of items (1) is incorrect, should be (0) -
> corrected
> block 22338448: The free space (0) is incorrect, should be (4072) -
> corrected
> ....80%....100%                       left 0, 14436 /sec
> 49178 directory entries were hashed with "r5" hash.
>         "r5" hash is selected
> Flushing..finished
>         Read blocks (but not data blocks) 36177068
>                 Leaves among those 13294330
>                         - leaves all contents of which could not be saved
> and deleted 38
>                 Objectids found 49180
> 
> Pass 1 (will try to insert 13294292 leaves):
> ####### Pass 1 #######
> Looking for allocable blocks .. finished
> 0%....20%....40%....60%....80%....Not enough allocable blocks, checking
> bitmap...there are 1 allocable blocks, btw
> 
> out of disk space
> Abort
> 
> 
> Now the partition is unmountable and unuseable:
> 
> 
> un 22 17:29:42 server kernel: ReiserFS: md2: found reiserfs format "3.6"
> with standard journal
> Jun 22 17:29:46 server kernel: ReiserFS: md2: using ordered data mode
> Jun 22 17:29:46 server kernel: ReiserFS: md2: journal params: device md2,
> size 8192, journal first block 18, max trans len 1024, max bat
> ch 900, max commit age 30, max trans age 30
> Jun 22 17:29:46 server kernel: ReiserFS: md2: checking transaction log
> (md2)
> Jun 22 17:29:46 server syslog-ng[3242]: Changing permissions on special
> file /dev/xconsole
> Jun 22 17:29:46 server syslog-ng[3242]: Changing permissions on special
> file /dev/tty10
> Jun 22 17:29:46 server kernel: ReiserFS: warning: is_tree_node: node level
> 0 does not match to the expected one 65534
> Jun 22 17:29:46 server kernel: ReiserFS: md2: warning: vs-5150:
> search_by_key: invalid format found in block 0. Fsck?
> Jun 22 17:29:46 server kernel: ReiserFS: md2: warning: vs-13070:
> reiserfs_read_locked_inode: i/o failure occurred trying to find stat da
> ta of [1 2 0x0 SD]
> Jun 22 17:29:46 server kernel: ReiserFS: md2: Using r5 hash to sort names
> Jun 22 17:29:46 server kernel: ReiserFS: md2: warning: xattrs/ACLs enabled
> and couldn't find/create .reiserfs_priv. Failing mount.
> Jun 22 17:29:46 server udevd[2482]: get_netlink_msg: no ACTION in payload
> found, skip event 'umount'
> Jun 22 17:30:18 server named[5599]: client 127.0.0.1#1183: query:
> www.novell.com IN A +
> Jun 22 17:30:18 server named[5599]: client 127.0.0.1#1183: query:
> 25.5.57.130.in-addr.arpa IN PTR +
> Jun 22 17:31:38 server kernel: ReiserFS: md2: found reiserfs format "3.6"
> with standard journal
> Jun 22 17:31:42 server kernel: ReiserFS: md2: using ordered data mode
> Jun 22 17:31:42 server kernel: ReiserFS: md2: journal params: device md2,
> size 8192, journal first block 18, max trans len 1024, max bat
> ch 900, max commit age 30, max trans age 30
> Jun 22 17:31:42 server kernel: ReiserFS: md2: checking transaction log
> (md2)
> Jun 22 17:31:42 server kernel: ReiserFS: warning: is_tree_node: node level
> 0 does not match to the expected one 65534
> Jun 22 17:31:42 server kernel: ReiserFS: md2: warning: vs-5150:
> search_by_key: invalid format found in block 0. Fsck?
> Jun 22 17:31:42 server kernel: ReiserFS: md2: warning: vs-13070:
> reiserfs_read_locked_inode: i/o failure occurred trying to find stat da
> ta of [1 2 0x0 SD]
> Jun 22 17:31:42 server kernel: ReiserFS: md2: Using r5 hash to sort names
> Jun 22 17:31:42 server kernel: ReiserFS: md2: warning: xattrs/ACLs enabled
> and couldn't find/create .reiserfs_priv. Failing mount.
> Jun 22 17:31:42 server udevd[2482]: get_netlink_msg: no ACTION in payload
> found, skip event 'umount'
> 
> 

