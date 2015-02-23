From: <doiggl@velocitynet.com.au>
Subject: Re: What can I do next to use R4 partition  sdb
Date: Tue, 24 Feb 2015 00:41:38 +1100
Message-ID: <423b30bd605b0d88aa19a88a74ca2940@mail.velocitynet.com.au>
References: <114fff4391af47417e806586fb761345@mail.velocitynet.com.au> <24322648.R9GnluWRk3@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <24322648.R9GnluWRk3@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, Vladimir Shebordaev <vladimir.shebordaev@gmail.com>

Hello.

Regarding:
Are you sure /media/disk mountpoint exists? If it does, what shows up
from /proc/partitions? Is sdb a removable disk? Do you have udev
running?..

- Are you sure /media/disk mount point exists ? yes

# ll /media/disk
total 0

- what shows up from /proc/partitions ?

# ll  /proc/partitions
-r--r--r-- 1 root root 0 Feb 23 07:40 /proc/partitions

# cat   /proc/partitions
major minor  #blocks  name

   8        0   62522712 sda
   8        1   18217678 sda1
   8        2   12546765 sda2
   8        3   29295173 sda3
   8        4    2462720 sda4
  11        0    1048575 sr0
   8       16 1953514584 sdb

- Do you have udev running ?
# ps -ef | grep -i udev
root       281     1  0 Feb22 ?        00:00:00
/usr/lib/systemd/systemd-udevd

- By the way, did you try to run fsck on this disk ever since 08/26 last
year?

yes with --check option then used # fsck.reiser4 --build-fs --force 
/dev/sdb

# fsck.reiser4 --check /dev/sdb 
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                  
Will check the consistency of the Reiser4 SuperBlock.                     
                                                                  
Will check the consistency of the Reiser4 FileSystem.                     
                                                                  
Continue?                                                                 
                                                                  
(Yes/No): yes
***** fsck.reiser4 started at Mon Feb 23 01:34:22 2015
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
        Time interval: Mon Feb 23 01:36:17 2015 - Mon Feb 23 09:24:11 2015

CHECKING EXTENT REGIONS.                                                  
                                                                  
                                               ] 5%CHECKING THE STORAGE
TREE                                                                       
                                            
        Read nodes 197008413                                              
                                                                  
        Nodes left in the tree 197008413 
                Leaves of them 194764277, Twigs of them 2217790 
        Time interval: Mon Feb 23 01:36:17 2015 - Mon Feb 23 09:24:11 2015

        Read twigs 2217790                                                
                                                                  
        Time interval: Mon Feb 23 09:24:11 2015 - Mon Feb 23 11:34:13 2015

CHECKING THE SEMANTIC TREE                                                
                                                                  
FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize the
plugin for the directory [29:0:2a].                                  
FSCK: semantic.c: 651: repair_semantic_root_prepare: No root directory
opened. 
        Time interval: Mon Feb 23 11:34:13 2015 - Mon Feb 23 11:34:13 2015
                                                                  
FSCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and really
used block bitmap differ.                                          
***** fsck.reiser4 finished at Mon Feb 23 11:34:13 2015
Closing fs...done

2 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.
#

Next:
=====

run the following command and result is:

# fsck.reiser4 --build-fs --force  /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                              
Will check the consistency of the Reiser4 SuperBlock.                     
                                              
Will build the Reiser4 FileSystem.                                        
                                              
***** fsck.reiser4 started at Mon Feb 23 13:09:25 2015
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
    
        Time interval: Mon Feb 23 13:11:21 2015 - Mon Feb 23 21:10:47 2015
    
CHECKING EXTENT REGIONS.                                                  
                                            
        Read twigs 2217790                                                
                                            
        Time interval: Mon Feb 23 21:10:47 2015 - Mon Feb 23 23:20:58 2015
    
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
    
        Time interval: Mon Feb 23 23:21:14 2015 - Mon Feb 23 23:24:57 2015
    
***** fsck.reiser4 finished at Mon Feb 23 23:24:57 2015                   
    
Closing fs...done                                                         
    
                                                                          
    
FS is consistent. 


# mount /dev/sdb  /media/disk
mount: mount(2) failed: No such file or directory

Some questions:
===============
- What is the next step so I can access this disk/volume ?
- Is this related to a bug in fsck: it jumps to wrong branch ?
- Is there any patches so it jumps to correct branch I could use ?

Thanks four help and assistance.
--Glenn

References:
http://www.spinics.net/lists/reiserfs-devel/msg04662.html
http://www.spinics.net/lists/reiserfs-devel/msg04206.html
