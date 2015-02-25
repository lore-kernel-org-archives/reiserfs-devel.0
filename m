From: <doiggl@velocitynet.com.au>
Subject: Re: This is the sequence of --checks and --build-fs times of Reiser4 volume on disk /dev/sdb
Date: Wed, 25 Feb 2015 13:34:38 +1100
Message-ID: <2ec268707bb2e9fe2f94b549e6087fa1@mail.velocitynet.com.au>
References: <1f5fbbb35f95abcfdef3d985be537e9b@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1f5fbbb35f95abcfdef3d985be537e9b@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

# fsck.reiser4 --check /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
  
Will check the consistency of the Reiser4 SuperBlock.                     
                                                                          
  
Will check the consistency of the Reiser4 FileSystem.                     
                                                                          
  
Continue?                                                                 
                                                                          
  
(Yes/No): yes
***** fsck.reiser4 started at Tue Feb 24 17:03:22 2015
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
                       
        Time interval: Tue Feb 24 17:05:18 2015 - Wed Feb 25 01:04:40 2015
                              
CHECKING EXTENT REGIONS.                                                  
                                                                          
  
        Read twigs 2217790                                                
                                                                          
  
        Time interval: Wed Feb 25 01:04:40 2015 - Wed Feb 25 03:14:59 2015
                                          
CHECKING THE SEMANTIC TREE                                                
                                                                          
  
FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize the
plugin for the directory [29:0:2a].                                        
    
FSCK: semantic.c: 651: repair_semantic_root_prepare: No root directory
opened.                                                      
        Time interval: Wed Feb 25 03:14:59 2015 - Wed Feb 25 03:14:59 2015
                                                                          
  
FSCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and really
used block bitmap differ.                                                  
  
***** fsck.reiser4 finished at Wed Feb 25 03:14:59 2015                   
                                                                      
Closing fs...done                                                         
                                                                         
                                                                          
                                                                          
  
2 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.

