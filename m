From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: vs-5150 errors after resize
Date: Wed, 14 May 2003 07:32:13 +0200
Message-ID: <3EC1D4DD.40308@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080900010309020905010608"
Return-path: <reiserfs-list-return-14102-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------080900010309020905010608
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

I'm using SuSE 8.2 with kernel 2.4.20-39 (based on 2.4.21-pre4) and I'm
encountering errors when doing heavy concurrent write and truncate
activity on my data partition.
reiserfsprogs version is 3.6.4-12 from SuSE 8.2.

The affected filesystem is v3.6 on loopback on a file on v3.6 partition,
both using ordered data mode.

mount -t reiserfs -o noatime,notail /dev/hda7 /data
losetup /dev/loop0 /data/testfile.dat
mount -t reiserfs -o noatime /dev/loop0 /testdir

<fill the fs up until only ~1MB is free>
umount /testdir
losetup -d /dev/loop0
dd if=/dev/zero bs=1M count=512 >>/data/testfile.dat
losetup /dev/loop0 /data/testfile.dat
resize_reiserfs /dev/loop0
reiserfsck /dev/loop0
mount -t reiserfs -o noatime /dev/loop0 /testdir

repeat above block 3 times, initial fs size 600MB.

reiserfsck showed no errors. /data/testfile.dat is perfectly readable,
so there is no harddisk access problem. memtest86 shows no errors
either. So I'm quite sure the hardware is OK.

The errors occur while mirroring a http server with 4 parallel instances
of curl. Suddenly, two of the curl instances can't write anything anymore.

Either the in-kernel reiserfs or resize_reiserfs corrupted the fs.
However, if resize_reiserfs caused the corruption, reiserfsck failed to
find and correct it. Either way, it is a bug and I would like to know
how to avoid it in the future.

A bzip2'ed metadata dump (~2MB) is available, just tell me where to
upload/mail it. In case you want to study it live on the system, I can
give you ssh access to it. Attached is the dmesg from shortly before the
errors began until the fs was unmounted.

Any help is appreciated.

Thanks,
Carl-Daniel

--------------080900010309020905010608
Content-Type: text/plain;
 name="reiserfsbug.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfsbug.txt"

Adding Swap: 265032k swap-space (priority 42)
reiserfs: found format "3.6" with standard journal
reiserfs: enabling write barrier flush mode
reiserfs: using ordered data mode
reiserfs: checking transaction log (ide0(3,7)) for (ide0(3,7))
Using r5 hash to sort names
reiserfs: found format "3.6" with standard journal
reiserfs: enabling write barrier flush mode
reiserfs: using ordered data mode
reiserfs: checking transaction log (loop(7,0)) for (loop(7,0))
Using r5 hash to sort names
reiserfs: found format "3.6" with standard journal
reiserfs: enabling write barrier flush mode
reiserfs: using ordered data mode
reiserfs: checking transaction log (loop(7,0)) for (loop(7,0))
Using r5 hash to sort names
reiserfs: found format "3.6" with standard journal
reiserfs: enabling write barrier flush mode
reiserfs: using ordered data mode
reiserfs: checking transaction log (loop(7,0)) for (loop(7,0))
Using r5 hash to sort names
reiserfs: found format "3.6" with standard journal
reiserfs: enabling write barrier flush mode
reiserfs: using ordered data mode
reiserfs: checking transaction log (loop(7,0)) for (loop(7,0))
Using r5 hash to sort names
reiserfs: found format "3.6" with standard journal
reiserfs: enabling write barrier flush mode
reiserfs: using ordered data mode
reiserfs: checking transaction log (loop(7,0)) for (loop(7,0))
Using r5 hash to sort names
reiserfs: found format "3.6" with standard journal
reiserfs: enabling write barrier flush mode
reiserfs: using ordered data mode
reiserfs: checking transaction log (loop(7,0)) for (loop(7,0))
Using r5 hash to sort names
reiserfs_getopt: unknown option "-o"
reiserfs_getopt: unknown option "-o"
reiserfs: found format "3.6" with standard journal
reiserfs: enabling write barrier flush mode
reiserfs: using ordered data mode
reiserfs: checking transaction log (loop(7,0)) for (loop(7,0))
Using r5 hash to sort names
reiserfs: found format "3.6" with standard journal
reiserfs: enabling write barrier flush mode
reiserfs: using ordered data mode
reiserfs: checking transaction log (loop(7,0)) for (loop(7,0))
Using r5 hash to sort names
reiserfs: found format "3.6" with standard journal
reiserfs: enabling write barrier flush mode
reiserfs: using ordered data mode
reiserfs: checking transaction log (loop(7,0)) for (loop(7,0))
Using r5 hash to sort names
reiserfs: found format "3.6" with standard journal
reiserfs: enabling write barrier flush mode
reiserfs: using ordered data mode
reiserfs: checking transaction log (loop(7,0)) for (loop(7,0))
Using r5 hash to sort names
reiserfs: found format "3.6" with standard journal
reiserfs: enabling write barrier flush mode
reiserfs: using ordered data mode
reiserfs: checking transaction log (loop(7,0)) for (loop(7,0))
Using r5 hash to sort names
reiserfs: found format "3.6" with standard journal
reiserfs: enabling write barrier flush mode
reiserfs: using ordered data mode
reiserfs: checking transaction log (loop(7,0)) for (loop(7,0))
Using r5 hash to sort names
reiserfs: found format "3.6" with standard journal
reiserfs: enabling write barrier flush mode
reiserfs: using ordered data mode
reiserfs: checking transaction log (loop(7,0)) for (loop(7,0))
Using r5 hash to sort names
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
vs-13050: reiserfs_update_sd: i/o failure occurred trying to update [21751 30551 0x0 SD] stat datais_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
vs-13050: reiserfs_update_sd: i/o failure occurred trying to update [21751 30551 0x0 SD] stat datais_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
vs-5657: reiserfs_do_truncate: i/o failure occurred trying to truncate [21751 30551 0xfffffffffffffff DIRECT]
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
vs-13050: reiserfs_update_sd: i/o failure occurred trying to update [21637 30547 0x0 SD] stat datais_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
vs-13050: reiserfs_update_sd: i/o failure occurred trying to update [21637 30547 0x0 SD] stat datais_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
vs-5657: reiserfs_do_truncate: i/o failure occurred trying to truncate [21637 30547 0xfffffffffffffff DIRECT]
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 133040. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?
is_tree_node: node level 65 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 232491. Fsck?

--------------080900010309020905010608--

