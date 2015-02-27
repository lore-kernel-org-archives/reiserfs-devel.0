From: <doiggl@velocitynet.com.au>
Subject: Re: using debugfs.reiser4 options to access R4 on /dev/sdb
Date: Fri, 27 Feb 2015 13:22:26 +1100
Message-ID: <c71d17f29802979ee8ea1b8dfc3fa72d@mail.velocitynet.com.au>
References: <2a39c4776614cb7a675f299083a3627a@mail.velocitynet.com.au> <1424809332.12259.67.camel@home.ted.local> <4e67fef614d6e56cca9bdb540d592c78@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4e67fef614d6e56cca9bdb540d592c78@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

# fsck.reiser4 --build-fs --force  /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
                                                    
Will check the consistency of the Reiser4 SuperBlock.                     
                                                                          
                                                    
Will build the Reiser4 FileSystem.                                        
                                                                          
                                                    
***** fsck.reiser4 started at Thu Feb 26 15:03:06 2015
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
        Time interval: Thu Feb 26 15:05:01 2015 - Thu Feb 26 23:11:57 2015

CHECKING EXTENT REGIONS.                                                  
                                                                          
                                                    
        Read twigs 2217790                                                
                                                                          
                                                    
        Time interval: Thu Feb 26 23:11:57 2015 - Fri Feb 27 01:22:19 2015

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
        Time interval: Fri Feb 27 01:22:38 2015 - Fri Feb 27 01:26:23 2015

***** fsck.reiser4 finished at Fri Feb 27 01:26:23 2015
Closing fs...done

FS is consistent.

# fsck.reiser4 --check /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
                                                    
Will check the consistency of the Reiser4 SuperBlock.                     
                                                                          
                                           
Will check the consistency of the Reiser4 FileSystem.                     
                                                                          
                                           
Continue?                                                                 
                                                                          
                                           
(Yes/No): yes
***** fsck.reiser4 started at Fri Feb 27 02:58:06 2015
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
        Time interval: Fri Feb 27 03:00:05 2015 - Fri Feb 27 11:07:45 2015

CHECKING EXTENT REGIONS.                                                  
                                                                          
                                         
        Read twigs 2217790                                                
                                                                          
                                         
        Time interval: Fri Feb 27 11:07:45 2015 - Fri Feb 27 13:18:06 2015

CHECKING THE SEMANTIC TREE                                                
                                                                          
                                         
FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize the
plugin for the directory [29:0:2a].                                        
                                           
FSCK: semantic.c: 651: repair_semantic_root_prepare: No root directory
opened. 
        Time interval: Fri Feb 27 13:18:06 2015 - Fri Feb 27 13:18:06 2015
                                                                          
                                         
FSCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and really
used block bitmap differ.                                                  
                                         
***** fsck.reiser4 finished at Fri Feb 27 13:18:07 2015
Closing fs...done

2 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.
#

