From: <doiggl@velocitynet.com.au>
Subject: Re: What can I do next to use R4 partition  sdb
Date: Wed, 27 Aug 2014 17:33:09 +1000
Message-ID: <458361e3164a300c930420b3dd9e5b43@mail.velocitynet.com.au>
References: <114fff4391af47417e806586fb761345@mail.velocitynet.com.au> <24322648.R9GnluWRk3@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <24322648.R9GnluWRk3@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


> Looks like the filesystem is damaged. Make sure that reiser4progs are
> installed
> and run
> 
> # fsck.reiser4 --build-fs /dev/sdb
> 
> (You may need to use --force because apparently you have R4 on a whole
> disk,
> not on a partition.)
> 
> Hope that helps,
#

Hello,
Thanks for the details.

I did the fpllowing steps:
# fsck.reiser4 --build-fs --force  /dev/sdb 
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
                                                                          
           
Will check the consistency of the Reiser4 SuperBlock.                     
                                             
Will build the Reiser4 FileSystem.                                        
                                             
***** fsck.reiser4 started at Tue Aug 26 17:22:24 2014
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
                                             
        Time interval: Tue Aug 26 17:24:21 2014 - Wed Aug 27 01:25:31 2014
                                             
CHECKING EXTENT REGIONS.                                                  
                                             
        Read twigs 2217790                                                
                                             
        Time interval: Wed Aug 27 01:25:31 2014 - Wed Aug 27 03:35:39 2014
                                             
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
        Time interval: Wed Aug 27 03:35:57 2014 - Wed Aug 27 03:39:46 2014

***** fsck.reiser4 finished at Wed Aug 27 03:39:46 2014
Closing fs...done

FS is consistent.

#
# mount /dev/sdb  /media/disk
mount: mount(2) failed: No such file or directory

# dmesg - {last few lines}

[ 2058.194138]  sdb: unknown partition table
[ 2058.206276] sd 4:0:0:0: [sdb] Attached SCSI disk
[ 2109.541114] SFW2-INext-DROP-DEFLT IN=enp3s0f5 OUT= MAC=
SRC=fe80:0000:0000:0000:22cf:30ff:fe28:fda2
DST=ff02:0000:0000:0000:0000:0000:0000:00fb LEN=84 TC=0 HOPLIMIT=255
FLOWLBL=0 PROTO=UDP SPT=5353 DPT=5353 LEN=44 
[ 2208.241136] Loading Reiser4. See www.namesys.com for a description of
Reiser4.
[ 2208.246484] reiser4: sdb: found disk format 4.0.0.
[ 2319.185875] reiser4[mount(2113)]: traverse_tree
(/home/abuild/rpmbuild/BUILD/kernel-reiser4-3.15.0/linux-3.15/fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[ 2319.185893] reiser4[mount(2113)]: key_warning
(/home/abuild/rpmbuild/BUILD/kernel-reiser4-3.15.0/linux-3.15/fs/reiser4/plugin/file_plugin_common.c:512)[nikita-717]:
WARNING: Error for inode 42 (-2)


Question Do I run following command again ?.

# fsck.reiser4 --build-fs --force  /dev/sdb 

Thanks Glenn
