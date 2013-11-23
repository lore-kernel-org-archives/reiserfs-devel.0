From: <doiggl@velocitynet.com.au>
Subject: Re: reiser4 kernel compilation problem.
Date: Sat, 23 Nov 2013 19:55:04 +1100
Message-ID: <3ff712c55494331e10c9f7fc0b7b8d25@mail.velocitynet.com.au>
References: <35ffb317ffa4ed9987117759f51ebd1f@mail.velocitynet.com.au> <20131123161309.1b321a45@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20131123161309.1b321a45@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Sat, 23 Nov 2013 16:13:09 +0400, dimas <dimas000@ya.ru> wrote:
> firstly, why are you using unpartitioned disk, creating fs on a disk,
not
> partition? if there is r4, and drive is 2 TB, i think, it's not camera
> memory
> or smth like that)) just create mbr/gpt partition table to avoid some
> potential
> problems.
> secondly, check that reiser4 module is loaded, if occasionly not - try
> insmod.
> also, you can check if r4 is listed in /proc/filesystems
> 
Hello,
Here are the details:

# insmod
Usage: insmod filename [args]

# ll /proc/filesystems
-r--r--r-- 1 root root 0 Nov 25 12:18 /proc/filesystems

# rpm -qa| grep -i reiser4 | sort
kernel-reiser4-3.11.9-2.1.ga012288.x86_64
libreiser4-1_0-8-1.0.8-3.1.2.x86_64
reiser4progs-1.0.8-8.1.x86_64

Back to the Question:
What reiser4 kernel build paramerers I need in the kernel build so I can
use this partition ?
I have set:
CONFIG_REISER4_DEBUG=n
CONFIG_REISER4_FS=m

-Thanks Glenn

I know its a reiser4 formatted disk, checked as follows:
# time fsck.reiser4 --build-fs  /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
                
Will check the consistency of the Reiser4 SuperBlock.                     
                                                                          
                
Will build the Reiser4 FileSystem.                                        
                                                                          
                
Continue?                                                                 
                                                                          
                
(Yes/No): yes
***** fsck.reiser4 started at Sun Nov 24 17:31:49 2013
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
        Time interval: Sun Nov 24 17:33:46 2013 - Mon Nov 25 01:10:23 2013

CHECKING EXTENT REGIONS.                                                  
                                                                          
                
        Read twigs 2217790                                                
                                                                          
                
        Time interval: Mon Nov 25 01:10:23 2013 - Mon Nov 25 03:20:04 2013

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
        Time interval: Mon Nov 25 03:20:19 2013 - Mon Nov 25 03:23:50 2013

***** fsck.reiser4 finished at Mon Nov 25 03:23:50 2013
Closing fs...done

FS is consistent.


real    592m8.770s
user    48m29.548s
sys     40m54.200s

