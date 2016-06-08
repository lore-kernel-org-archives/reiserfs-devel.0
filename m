From: <doiggl@velocitynet.com.au>
Subject: Segmentation fault on #fsck.reiser4 --fix /dev/sdb
Date: Wed, 08 Jun 2016 14:09:44 +1000
Message-ID: <3c262e32710f6c83f10c03cc5f9abd95@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Segmentation fault on #fsck.reiser4 --fix /dev/sdb
Anyone know about this ?
--Glenn

# rpm -qa | grep -i libreiser4
libreiser4-1_1-0-1.1.0-13.1.x86_64

# rpm -qa | grep -i reiser4progs
reiser4progs-1.1.0-35.1.x86_64

command used:

# fsck.reiser4 --fix /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
                         
Will fix minor corruptions of the Reiser4 SuperBlock.                     
                                                                          
                         
Will fix minor corruptions of the Reiser4 FileSystem.                     
                                                                          
                         
Continue?                                                                 
                                                                          
                         
(Yes/No): yes
***** fsck.reiser4 started at Tue Jun  7 19:20:59 2016
FSCK: backup.c: 505: repair_backup_open: Found backup does not match to
the on-disk filesystem metadata.                                           
                            
Backup update is needed. Done.                                            
                                                                          
                         
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
                                                                          
                         
        Read nodes 197007773                                              
                                                                          
                         
        Nodes left in the tree 197007773                                  
                             
                Leaves of them 194763637, Twigs of them 2217790           
                             
        Time interval: Tue Jun  7 19:22:57 2016 - Sat Jun 11 05:38:42 2016
                             
CHECKING EXTENT REGIONS.                                                  
                             
        Read twigs 2217790                                                
                             
        Time interval: Sat Jun 11 05:38:42 2016 - Wed Jun  8 11:48:02 2016
                             
CHECKING THE SEMANTIC TREE                                                
                             
FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize the
plugin for the directory      
[29:0:2a]. 
FSCK: semantic.c: 651: repair_semantic_root_prepare: No root directory
opened. 
        Time interval: Wed Jun  8 11:48:02 2016 - Wed Jun  8 11:48:02 2016
                           
FSCK: repair.c: 547: repair_sem_fini: On-disk used block bitmap and really
used block bitmap differ.   
Segmentation fault


