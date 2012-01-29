From: <doiggl@velocitynet.com.au>
Subject: command 'mount /dev/sdc /media/disk2' failed after fsck.reiser4 --build-fs  /dev/sdc
Date: Sun, 29 Jan 2012 15:15:48 +1100
Message-ID: <eb15abdb129343708952e5616ec0e8df@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
I did a repair on a reiser4 partition as follows:
# fsck.reiser4 --build-fs  /dev/sdc 

The  disk report is listed at [1]
Is the report ok ?
See[1]

I then tried to use the disk and the command mount failed  /dev/sdc
/media/disk2
See[2]

Questions:
Do I rerun the command again ?   fsck.reiser4 --build-fs  /dev/sdc
What else do I need to do to use the disk ?
I checked for reiser4.ko too
# ll /lib/modules/`uname -r`/kernel/fs/reiser4
total 645
-rw-r--r-- 1 root root 658032 Jan 28 19:54 reiser4.ko

Thanks Glenn

[1]
# fsck.reiser4 --build-fs  /dev/sdc
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdc block device.                                        
                                               
Will check the consistency of the Reiser4 SuperBlock.                     
                                               
Will build the Reiser4 FileSystem.                                        
                                               
Continue?                                                                 
                                               
(Yes/No): yes
***** fsck.reiser4 started at Sun Jan 29 02:37:21 2012
Reiser4 fs was detected on /dev/sdc.                                      
                                               
Master super block (16): 
magic:          ReIsEr4 
blksize:        4096 
format:         0x0 (format40) 
uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede 
label:          <none> 
 
Format super block (17): 
plugin:         format40 
description:    Disk-format plugin. 
version:        0 
magic:          ReIsEr40FoRmAt 
mkfs id:        0x1ddaf754 
flushes:        0 
blocks:         488378640 
free blocks:    217146980 
root block:     37017218 
tail policy:    0x2 (smart) 
next oid:       0xedade 
file count:     188313 
tree height:    6 
key policy:     LARGE 
 
 
CHECKING THE STORAGE TREE                                                 
                                               
        Read nodes 197008413                                              
                                               
        Nodes left in the tree 197008413 
                Leaves of them 194764277, Twigs of them 2217790 
        Time interval: Sun Jan 29 02:39:18 2012 - Sun Jan 29 11:20:38 2012

CHECKING EXTENT REGIONS.                                                  
                                               
        Read twigs 2217790                                                
                                               
        Time interval: Sun Jan 29 11:20:38 2012 - Sun Jan 29 13:30:57 2012

LOOKING FOR UNCONNECTED NODES                                             
                                               
FSCK: node.c: 108: repair_node_items_check: Node (43828275), items (0) and
(1): Wrong order of keys.                       
FSCK: node.c: 108: repair_node_items_check: Node (52697435), items (79)
and (80): Wrong order of keys.                     
FSCK: node.c: 108: repair_node_items_check: Node (63227569), items (24)
and (25): Wrong order of keys.                     
FSCK: node.c: 108: repair_node_items_check: Node (63227571), items (73)
and (74): Wrong order of keys.                     
FSCK: node.c: 108: repair_node_items_check: Node (116595727), items (20)
and (21): Wrong order of keys.                    
FSCK: node.c: 108: repair_node_items_check: Node (227923161), items (22)
and (23): Wrong order of keys.                    
FSCK: node.c: 108: repair_node_items_check: Node (284305753), items (61)
and (62): Wrong order of keys.                    
        Read nodes 1481038                                                
                                               
        Good nodes 471512 
                Leaves of them 466164, Twigs of them 5348 
        Time interval: Sun Jan 29 13:31:14 2012 - Sun Jan 29 13:35:04 2012

***** fsck.reiser4 finished at Sun Jan 29 13:35:04 2012
Closing fs...done

FS is consistent.



[2]
# mount /dev/sdc  /media/disk2
mount: No such file or directory

This did not work either
mount -t reiser4  /dev/sdc  /media/disk2
mount: No such file or directory

Other details
-------------
# cd /media
# md disk2
# ll
total 3
drwxr-xr-x 79 root root 2520 Jan 24 01:20 disk
drwxr-xr-x  2 root root   40 Jan 29 14:01 disk2

# fdisk -l

Disk /dev/sda: 64.0 GB, 64023257088 bytes
255 heads, 63 sectors/track, 7783 cylinders, total 125045424 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0xcc791374

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1              63    41046074    20523006    7  HPFS/NTFS/exFAT
/dev/sda2   *    41048064    61528063    10240000   83  Linux
/dev/sda3        61528950   120937319    29704185   83  Linux
/dev/sda4       120937320   125033894     2048287+  82  Linux swap /
Solaris

Disk /dev/sdb: 500.1 GB, 500107862016 bytes
255 heads, 63 sectors/track, 60801 cylinders, total 976773168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0xe0c5913d

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1              63    40965749    20482843+  1c  Hidden W95 FAT32
(LBA)
/dev/sdb2   *    40965750    84430847    21732549    7  HPFS/NTFS/exFAT
/dev/sdb3       285153280   976771071   345808896    f  W95 Ext'd (LBA)
/dev/sdb4        84430848   285153279   100361216   83  Linux
/dev/sdb5       285155328   305903615    10374144    7  HPFS/NTFS/exFAT
/dev/sdb6       305905664   976771071   335432704   83  Linux

Partition table entries are not in disk order

Disk /dev/sdc: 2000.4 GB, 2000398934016 bytes
255 heads, 63 sectors/track, 243201 cylinders, total 3907029168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

Disk /dev/sdc doesn't contain a valid partition table


