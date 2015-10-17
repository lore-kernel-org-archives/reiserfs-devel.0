From: <doiggl@velocitynet.com.au>
Subject: I need help to repair and mount command be done to use a reiser4 volume ? [located /dev/sdb]
Date: Sat, 17 Oct 2015 11:03:24 +1100
Message-ID: <b493fcd92638c7e48c70f67f29ab57fa@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Need help to repair and mount command be done to use a reiser4 volume ?
[located /dev/sdb]
# mount /dev/sdb /media/disk

- mount command [for sdb]
  see http://www.spinics.net/lists/reiserfs-devel/msg04810.html
  
- These commands were run using opensuse 64 bit x86_64
- Steps run so far in this order:
# fsck.reiser4 --build-sb --force  /dev/sdb
# fsck.reiser4 --build-fs --force  /dev/sdb
# fsck.reiser4  --check /dev/sdb

Entire output see [1]


message sequence from commands:
-------------------------------

# fsck.reiser4 --build-sb --force  /dev/sdb
2 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.

# fsck.reiser4 --build-fs --force  /dev/sdb
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

# fsck.reiser4  --check /dev/sdb
2 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them

my observations:
It seems to go loop around these commands.
No way to complete repair sequence to allow mount on volume.
So stuck in a loop of commands.
I know files and data are on disk but just cannot get to it.

Questions:
- Is this because of a bug in fsck: 'it jumps to wrong branch' ?
  see http://www.spinics.net/lists/reiserfs-devel/msg04206.html
- How can repair be done to allow ?

Thanks
--Glenn


[1]
# fsck.reiser4 --build-sb --force  /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
                          
Will build the Reiser4 SuperBlock.                                        
                                                                          
                          
Will check the consistency of the Reiser4 FileSystem.                     
                                                                          
                          
***** fsck.reiser4 started at Thu Oct 15 20:54:23 2015
FSCK: backup.c: 505: repair_backup_open: Found backup does not match to
the on-disk filesystem metadata.                                           
                             
FSCK: format40_repair.c: 129: format40_check_struct: Minor format version
number (1) in superblock doesn't match the one in backup (0). Fixed.       
                           
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
                                                                          
                    
        Time interval: Thu Oct 15 20:56:20 2015 - Fri Oct 16 04:40:12 2015
                                                                          
                    
CHECKING EXTENT REGIONS.                                                  
                                                                          
                    
        Read twigs 2217790                                                
                                                                          
                    
        Time interval: Fri Oct 16 04:40:12 2015 - Fri Oct 16 06:49:48 2015
                                                                          
                    
CHECKING THE SEMANTIC TREE                                                
                                                                          
                    
FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize the
plugin for the directory [29:0:2a].                                        
                      
FSCK: semantic.c: 651: repair_semantic_root_prepare: No root directory
opened.                                                                    
                        
        Time interval: Fri Oct 16 06:49:48 2015 - Fri Oct 16 06:49:48 2015
                                                                          
                    
FSCK: repair.c: 547: repair_sem_fini: On-disk used block bitmap and really
used block bitmap differ.                                                  
                    
***** fsck.reiser4 finished at Fri Oct 16 06:49:49 2015                   
                                                                          
                    
Closing fs...done                                                         
                                                                          

                                                                          
                                                                          

2 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.                                                        
     
                                                                          
                                                                          

You have new mail in /var/spool/mail/root                                 
                                                                          


# fsck.reiser4 --build-fs --force  /dev/sdb                               
                                                                    
*******************************************************************       
                                                                          

This is an EXPERIMENTAL version of fsck.reiser4. Read README first.       
                                                                          

*******************************************************************       
                                                                          

                                                                          
                                                                          

Fscking the /dev/sdb block device.                                        
                                                                          

Will check the consistency of the Reiser4 SuperBlock.                     
                                                                          

Will build the Reiser4 FileSystem.                                        
                                                                          

***** fsck.reiser4 started at Fri Oct 16 10:43:34 2015                    
                                                                          

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
        Time interval: Fri Oct 16 10:45:30 2015 - Fri Oct 16 18:31:21 2015

CHECKING EXTENT REGIONS.                                                  
                                                                         
        Read twigs 2217790                                                
                                                                         
        Time interval: Fri Oct 16 18:31:21 2015 - Fri Oct 16 20:41:09 2015

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
        Time interval: Fri Oct 16 20:41:24 2015 - Fri Oct 16 20:45:01 2015

***** fsck.reiser4 finished at Fri Oct 16 20:45:01 2015
Closing fs...done

FS is consistent.

# 
# fsck.reiser4 --check /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                         
Will check the consistency of the Reiser4 SuperBlock.                     
                                                                         
Will check the consistency of the Reiser4 FileSystem.                     
                                                                         
Continue?                                                                 
                                                                         
(Yes/No): yes
***** fsck.reiser4 started at Fri Oct 16 22:14:19 2015
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
        Time interval: Fri Oct 16 22:16:51 2015 - Sat Oct 17 07:11:51 2015

CHECKING EXTENT REGIONS.                                                  
                                                                         
        Read twigs 2217790                                                
                                                                         
        Time interval: Sat Oct 17 07:11:51 2015 - Sat Oct 17 09:37:22 2015

CHECKING THE SEMANTIC TREE                                                
                                                                         
FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize the
plugin for the directory [29:0:2a].                                        

FSCK: semantic.c: 651: repair_semantic_root_prepare: No root directory
opened. 
        Time interval: Sat Oct 17 09:37:22 2015 - Sat Oct 17 09:37:22 2015
                                                                         
FSCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and really
used block bitmap differ.                                                 
***** fsck.reiser4 finished at Sat Oct 17 09:37:23 2015
Closing fs...done

2 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.


