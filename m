From: Marc Schmitt <mschmitt@inf.ethz.ch>
Subject: Bad root block 0. (--rebuild-tree did not complete)
Date: Tue, 02 Dec 2003 20:28:10 +0100
Message-ID: <3FCCE7CA.7090306@inf.ethz.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16202-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS-List <reiserfs-list@namesys.com>

Hi list,

Attached to a Dell PE8450 (8 CPUs, 4GB RAM) we have a PowerVault 210 
Storage with 12 70GB SCSI disks in a RAID5 container w/ spare disk 
managed by a

scsi2 : Found a MegaRAID controller at 0xf8853000, IRQ: 24
scsi2 : Enabling 64 bit support
megaraid: [1.73:3.27] detected 1 logical drives

The machine is primarily running as NFS server under kernel 2.4.21 and 
now under 2.4.23, reiserfsprogs 3.6.11. Twice already I had to run 
`reiserfsck --rebuild-tree` this year due to weird corruption issues. 
Since a couple of weeks (when the server was running under 2.4.21), 
we've seen strange console output and users were claiming files had been 
lost or they would get "permission denied" errors.

Example console output:
Dec  1 05:28:37 sim0 kernel: vs-5150: search_by_key: invalid format 
found in block 175880844. Fsck?
Dec  1 05:28:37 sim0 kernel: vs-13070: reiserfs_read_inode2: i/o failure 
occurred trying to find stat data of [562045 562059 0x0 SD]
Dec  1 05:28:37 sim0 kernel: is_tree_node: node level 22058 does not 
match to the expected one 1
Dec  1 05:28:37 sim0 kernel: vs-5150: search_by_key: invalid format 
found in block 175880844. Fsck?
Dec  1 05:28:37 sim0 kernel: vs-13070: reiserfs_read_inode2: i/o failure 
occurred trying to find stat data of [562045 562056 0x0 SD]
Dec  1 05:28:37 sim0 kernel: is_tree_node: node level 22058 does not 
match to the expected one 1
Dec  1 05:28:37 sim0 kernel: vs-5150: search_by_key: invalid format 
found in block 175880844. Fsck?
Dec  1 05:28:37 sim0 kernel: vs-13070: reiserfs_read_inode2: i/o failure 
occurred trying to find stat data of [562045 562079 0x0 SD]
Dec  1 05:28:37 sim0 kernel: is_tree_node: node level 22058 does not 
match to the expected one 1
Dec  1 05:28:37 sim0 kernel: vs-5150: search_by_key: invalid format 
found in block 175880844. Fsck?
Dec  1 05:28:37 sim0 kernel: vs-13070: reiserfs_read_inode2: i/o failure 
occurred trying to find stat data of [562045 564468 0x0 SD]
Dec  1 05:28:37 sim0 kernel: is_tree_node: node level 22058 does not 
match to the expected one 1
Dec  1 05:28:37 sim0 kernel: vs-5150: search_by_key: invalid format 
found in block 175880844. Fsck?
Dec  1 05:28:37 sim0 kernel: vs-13070: reiserfs_read_inode2: i/o failure 
occurred trying to find stat data of [562057 562089 0x0 SD]
Dec  1 16:15:33 sim0 kernel: vs-7000: search_by_entry_key: search_by_key 
returned item position == 0<4>zam-7001: io error in reiserfs_find_entry
Dec  1 16:15:36 sim0 kernel: vs-7000: search_by_entry_key: search_by_key 
returned item position == 0<4>vs-7000: search_by_entry_key: 
search_by_key returned item position == 0<4>zam-7001: io error in 
reiserfs_find_entry

As the output suggested, I ran reiserfsck. I don't have the log of that 
check, but it ended suggesting to run `reiserfsck --rebuild-tree`. As I 
said, I've done --rebuild-tree twice already over one year and there 
were no problems so far. This time, the fsck bombed out with a 
Segmentation Fault after running for about 10 hours. I started it again, 
sorry, I have no log, it stopped after 10 hours of running again with a 
Segementation Fault.

When I try to mount it, the dmesg output is:
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device sd(8,38)) ...
for (sd(8,38))
is_tree_node: node level 0 does not match to the expected one 65534
sd(8,38):vs-5150: search_by_key: invalid format found in block 0. Fsck?
sd(8,38):vs-13070: reiserfs_read_inode2: i/o failure occurred trying to 
find stat data of [1 2 0x0 SD]
sd(8,38):Using r5 hash to sort names
is_tree_node: node level 0 does not match to the expected one 65534
sd(8,38):vs-5150: search_by_key: invalid format found in block 0. Fsck?
sd(8,38):vs-2140: finish_unfinished: search_by_key returned -2

When I run a simple `reiserfsck` it says:
Replaying journal..
0 transactions replayed
Checking internal tree..

Bad root block 0. (--rebuild-tree did not complete)

Aborted



Should I start restoring from tape?

Greetz
    Marc

