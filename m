From: <doiggl@velocitynet.com.au>
Subject: How can the  reiser4 filesystem be repaired accessed as read-only mode ? [/dev/sdb]
Date: Fri, 04 Sep 2015 23:02:30 +1000
Message-ID: <5b5dc4a149d58ac54e97db81054e2f1b@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Hello 
How can the  reiser4 filesystem be repaired ? /dev/sdb 
I tried these steps so far.
Thanks Glenn
#
# fsck.reiser4  --build-fs --force  /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
                   
Will check the consistency of the Reiser4 SuperBlock.                     
                                                                          
                   
Will build the Reiser4 FileSystem.                                        
                                                                          
                   
***** fsck.reiser4 started at Fri Sep  4 11:18:23 2015
FSCK: backup.c: 505: repair_backup_open: Found backup does not match to
the on-disk filesystem metadata.                                           
                      
Backup update is needed.                                                  
                                                                          
                   
Reiser4 fs was detected on /dev/sdb.                                      
                                                                          
                   
Master super block (16): 
magic:          ReIsEr4 
blksize:        4096 
format:         0x0 (format40) 
uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede 
label:          <none> 
 
Format super block (17): 
plugin:         format40 
description:    Disk-format plugin. 
version:        1 
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
        Time interval: Fri Sep  4 11:20:20 2015 - Fri Sep  4 19:06:41 2015

CHECKING THE STORAGE TREE                                                 
                                                                          
                   
        Read nodes 197008413                                              
                                                                          
                   
        Nodes left in the tree 197008413 
                Leaves of them 194764277, Twigs of them 2217790 
        Time interval: Fri Sep  4 11:20:20 2015 - Fri Sep  4 19:06:41 2015

CHECKING EXTENT REGIONS.                                                  
                                          
        Read twigs 2217790                                                
                                          
        Time interval: Fri Sep  4 19:06:41 2015 - Fri Sep  4 21:17:03 2015

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
        Time interval: Fri Sep  4 21:17:17 2015 - Fri Sep  4 21:20:53 2015

***** fsck.reiser4 finished at Fri Sep  4 21:20:53 2015
Closing fs...done

1 fixable corruptions were detected in the SuperBlock. Run with --fix
option to fix them.

# 


#dmesg shows:
 3595.948312] scsi 4:0:0:0: Direct-Access     ST320005 42AS               
 PQ: 0 ANSI: 2
[ 3595.948948] sd 4:0:0:0: Attached scsi generic sg2 type 0
[ 3595.950400] sd 4:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
TB/1.81 TiB)
[ 3595.953903] sd 4:0:0:0: [sdb] Write Protect is off
[ 3595.953915] sd 4:0:0:0: [sdb] Mode Sense: 38 00 00 00
[ 3595.956559] sd 4:0:0:0: [sdb] No Caching mode page found
[ 3595.956574] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[ 3595.994852] sd 4:0:0:0: [sdb] Attached SCSI disk
[ 4148.266685] SFW2-INext-DROP-DEFLT IN=enp3s0f5 OUT= MAC=
SRC=fe80:0000:0000:0000:22cf:30ff:fe28:fda2
DST=ff02:0000:0000:0000:0000:0000:0000:00fb LEN=84 TC=0 HOPLIMIT=255
FLOWLBL=0 PROTO=UDP SPT=5353 DPT=5353 LEN=44 
[ 5011.804493] Loading Reiser4 (format release: 4.0.1) See www.namesys.com
for a description of Reiser4.
[ 5011.863214] reiser4: sdb: found disk format 4.0.1.
[ 5011.863386] reiser4: sdb: use 'fsck.reiser4 --fix' to complete disk
format upgrade.
[ 5121.839656] reiser4[mount(3888)]: traverse_tree
(../fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[ 5121.839674] reiser4[mount(3888)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 42 (-2)
[ 5277.264415] reiser4: sdb: found disk format 4.0.1.
[ 5277.264574] reiser4: sdb: use 'fsck.reiser4 --fix' to complete disk
format upgrade.
[ 5387.169509] reiser4[mount(4041)]: traverse_tree
(../fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[ 5387.169527] reiser4[mount(4041)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 42 (-2)
#
Next I tried to access filesystem in read-only mode.
# mount -r  /dev/sdb /media/disk 
mount: mount(2) failed: No such file or directory

#dmesg shows
[51611.964313] reiser4: sdb: found disk format 4.0.1.
[51611.964468] reiser4: sdb: use 'fsck.reiser4 --fix' to complete disk
format upgrade.
[51721.972633] reiser4[mount(21726)]: traverse_tree
(../fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[51721.972651] reiser4[mount(21726)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 42 (-2)

Questions:

- What other things can I use to access the files on this disk ?
- Would 'dont_load_bitmap' assist in the mount 'mount -r  /dev/sdb
/media/disk' command ? 
Thanks Glenn
