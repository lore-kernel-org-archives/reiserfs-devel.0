From: <doiggl@velocitynet.com.au>
Subject: Re: This is the sequence of --checks and --build-fs times of Reiser4 volume on disk /dev/sdb
Date: Mon, 06 Jun 2016 11:01:14 +1000
Message-ID: <68529b048dce04b8257dc0893ea597e1@mail.velocitynet.com.au>
References: <1f5fbbb35f95abcfdef3d985be537e9b@mail.velocitynet.com.au> <c7efa28422624a790132333f4cb24a4f@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <c7efa28422624a790132333f4cb24a4f@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


# rpm -qf /usr/sbin/fsck.reiser4
reiser4progs-1.1.0-35.1.x86_64

# rpm -qf /sbin/fsck
util-linux-2.25-7.2.x86_64

# fsck.reiser4 --check /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
               
Will check the consistency of the Reiser4 SuperBlock.                     
                                                                          
               
Will check the consistency of the Reiser4 FileSystem.                     
                                                                          
               
Continue?                                                                 
                                                                          
               
(Yes/No): yes
***** fsck.reiser4 started at Sun Jun  5 16:59:53 2016
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
                                                 
        Read nodes 197007773                                              
                                                 
        Nodes left in the tree 197007773                                  
                                                 
                Leaves of them 194763637, Twigs of them 2217790           
                                                 
        Time interval: Sun Jun  5 17:01:50 2016 - Mon Jun  6 00:27:47 2016
                                                 
CHECKING EXTENT REGIONS.                                                  
                                                 
        Read twigs 2217790                                                
                                               
        Time interval: Mon Jun  6 00:27:47 2016 - Mon Jun  6 02:37:21 2016

CHECKING THE SEMANTIC TREE                                                
                                               
FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize the
plugin for the directory [29:0:2a].               
FSCK: semantic.c: 651: repair_semantic_root_prepare: No root directory
opened. 
        Time interval: Mon Jun  6 02:37:21 2016 - Mon Jun  6 02:37:21 2016
                                               
FSCK: repair.c: 547: repair_sem_fini: On-disk used block bitmap and really
used block bitmap differ.                       
***** fsck.reiser4 finished at Mon Jun  6 02:37:21 2016
Closing fs...done

1 fixable corruptions were detected in the SuperBlock. Run with --fix
option to fix them.
2 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.

--Glenn
