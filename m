From: Locke <locke@oceanfree.net>
Subject: Filesystem corruption
Date: Thu, 14 Aug 2003 00:05:28 +0800
Message-ID: <3F3A61C8.4060504@oceanfree.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------070108010801020502040705"
Return-path: <reiserfs-list-return-15303-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------070108010801020502040705
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

  Hi,

    I've got a problem with reiserfs today while I was trying to access 
my network files. I tried browsing my network drive and found out that 
some of my directories were empty. So I unmounted the partition and ran 
reiserfsck(3.6.8), it said I had 4 corruptions and told me to run 
--rebuild-tree. And so I did and it recovered only 7.8GB of 47.8GB of 
the files. I'm guessing the reason why it recovered so little was 
because that because I was running a 7.8GB+40GB LVM and the 40GB 
pyhsical volume wasn't working and left it with only 7.8GB.

Here's the specs of my system:   linux-2.4.21, reisfs-3.6.8, LVM-1.0.7 
(7.8GB + 40GB)
Partitions:
    /dev/hda (ext2)    /   3.2GB
    /dev/hdb+/dev/hdg => /dev/main_vg/storage_lv(reiserfs)   
/mnt/storage   47.8GB

Here's some output of dmesg at the point where I discovered the problem:

is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 8838461. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 8838461. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 11534730. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 8838461. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 8838461. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 3412777. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 11534730. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 11604101. Fsck?
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 11534730. Fsck?

reiserfs: checking transaction log (device 3a:00) ...
is_tree_node: node level 32769 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 5505049. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat 
data of [1 2 0x0 SD]
Using r5 hash to sort names
is_tree_node: node level 0 does not match to the expected one 2
vs-5150: search_by_key: invalid format found in block 2412772. Fsck?
vs-2140: finish_unfinished: search_by_key returned -2
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 3a:00) ...
is_leaf: free space seems wrong: level=1, nr_items=1, free_space=778 rdkey
vs-5150: search_by_key: invalid format found in block 5505049. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat 
data of [1 2 0x0 SD]
Using r5 hash to sort names
is_tree_node: node level 0 does not match to the expected one 2
vs-5150: search_by_key: invalid format found in block 2412772. Fsck?
vs-2140: finish_unfinished: search_by_key returned -2
ReiserFS version 3.6.25
VFS: Can't find ext3 filesystem on dev lvm(58,0).
reiserfs: checking transaction log (device 3a:00) ...
is_leaf: free space seems wrong: level=1, nr_items=1, free_space=778 rdkey
vs-5150: search_by_key: invalid format found in block 5505049. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat 
data of [1 2 0x0 SD]
Using r5 hash to sort names
is_tree_node: node level 0 does not match to the expected one 2
vs-5150: search_by_key: invalid format found in block 2412772. Fsck?
vs-2140: finish_unfinished: search_by_key returned -2
ReiserFS version 3.6.25

And also when rebooting after the corruption I saw several error 
messages for all drives, hda, hdb and hdg
**

hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x84 { DriveStatusError BadCRC }
hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x84 { DriveStatusError BadCRC }

**The messages are copied from the FAQ in namesys.com because they 
looked similar so I'm not sure if they're the exactly same.

I tried loading a previous kernel(2.4.20) and the error messages were 
gone, this was probably because of some errors I made when configuring 
the 2.4.21 kernel. It was the first time I've compiled the kernel 
without thoroughly checking the configurations and now I suffer the 
consequences.

Is there anything I can try to recover more data?

Regards,
Kent

--------------070108010801020502040705--

