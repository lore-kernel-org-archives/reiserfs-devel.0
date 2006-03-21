From: Sergey Ivanov <seriv@parkheights.dyndns.org>
Subject: reiser4 problems
Date: Tue, 21 Mar 2006 13:07:59 -0500
Message-ID: <442040FF.4040800@parkheights.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28304-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,
I am sorry to report problems I had this night at my e-mail server.
Grepped reiser4 messages from /var/log/messages are at
http://parkheights.dyndns.org/r4log.bz2
I have 2 processor system (athlon) with raid5 software array with 5x62.1
GB, giving me 248.4GB for use. I have created lvm2 volumes for imap
folders there, and also have /usr, /var, /home and other resides on the
same raid5, everything formatted reiser4.
Yesterday the server stops working, but answer pings. I've rebooted it
with magic SysRQ key combinations after forced unmounting and syncing
all partitions. But in the night the problems reappear on some of
virtual volumes. In the morning I did remount -o ro and fsck.reiser4,
all but one volume was O.K, but one required rebuild-fs. Excuse me, I
have not saved the first fsck.reiser4 output. After rebuilding fs and
then rebooting the system, I've got immediately problems, the filesystem
was not accessible, all attempts to get ls of it finished with i/o error
messagees. (I have errors in /etc/fstab, the reiser4 volumes has lines
ending with 1 1, not 1 2 as it should be. I'm not sure it attributed to
the these  problems).
The second fsck.reiser4 once more founded some problems, it's the log:
---
[root@parkheights ~]# fsck.reiser4 -y --build-fs /dev/evms/imap-seriv
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/evms/imap-seriv block device.
Will check the consistency of the Reiser4 SuperBlock.
Will build the Reiser4 FileSystem.
***** fsck.reiser4 started at Tue Mar 21 08:34:40 2006
Reiser4 fs was detected on /dev/evms/imap-seriv.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           c2bc9aae-fc5c-43b4-b527-9ff6fcde5b55
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4.
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0xbd3e802
blocks:         1834992
free blocks:    1059587
root block:     740782
tail policy:    0x2 (smart)
next oid:       0x77c5f
file count:     395956
tree height:    4
key policy:     LARGE

CHECKING STORAGE TREE
FSCK: Node (740803): The left delimiting key [29:1(SD):0:2a:0] in the
parent node (740782), pos (0/4294967295) does not match the first key
[0:0(NAME):0:0:
0] in the node. Fixed.
FSCK: The tree height 4 found in the format is wrong. Fixed to 5.
        Read nodes 440830
        Nodes left in the tree 440830
                Leaves of them 435415, Twigs of them 5323
        Time interval: Tue Mar 21 08:34:41 2006 - Tue Mar 21 08:44:54 2006
CHECKING EXTENT REGIONS.
        Read twigs 5323
        Time interval: Tue Mar 21 08:44:54 2006 - Tue Mar 21 08:46:14 2006
LOOKING FOR UNCONNECTED NODES
        Read nodes 0
        Good nodes 0
                Leaves of them 0, Twigs of them 0
        Time interval: Tue Mar 21 08:46:14 2006 - Tue Mar 21 08:46:14 2006
CHECKING EXTENT REGIONS.
        Read twigs 0
        Time interval: Tue Mar 21 08:46:14 2006 - Tue Mar 21 08:46:14 2006
INSERTING UNCONNECTED NODES
1. Twigs: done
2. Twigs by item: done
3. Leaves: done
4. Leaves by item: done
        Twigs: read 0, inserted 0, by item 0, empty 0
        Leaves: read 0, inserted 0, by item 0
        Time interval: Tue Mar 21 08:46:14 2006 - Tue Mar 21 08:46:14 2006
CHECKING SEMANTIC TREE
FSCK: Node (762207), item (5), [6f6e9:6e657700000000:6f6eb] (stat40):
wrong size (20), Fixed to (21).
FSCK: Node (762207), item (5), [6f6e9:6e657700000000:6f6eb] (stat40):
wrong bytes (2473), Fixed to (2605).
FSCK: Node (773635), item (5), [6f62a:6e657700000000:6f62c] (stat40):
wrong size (6), Fixed to (7).
FSCK: Node (773635), item (5), [6f62a:6e657700000000:6f62c] (stat40):
wrong bytes (628), Fixed to (760).
FSCK: Node (773635), item (6), [6f62a:746d7000000000:6f62b] (stat40):
wrong size (4), Fixed to (3).
FSCK: Node (773635), item (6), [6f62a:746d7000000000:6f62b] (stat40):
wrong bytes (312), Fixed to (206).
        Found 395956 objects.
        Time interval: Tue Mar 21 08:46:14 2006 - Tue Mar 21 09:28:41 2006
CLEANUPING STORAGE TREE
...
--- (once more, excuse me, I have copied it from xterm while it was
'cleanuping storage tree', so it's not the full log).

After second fsck, I have unmounted and mounted it read only to save
data on ext3 partition and to wait answers and suggestions before using
reiser4 once more.
-- 
	With best regards,
		Sergey Ivanov.
