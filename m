From: <doiggl@velocitynet.com.au>
Subject: Operational error occurred while fscking. [on /dev/sdb]
Date: Mon, 13 Jun 2016 19:51:56 +1000
Message-ID: <0a1c819a19d9e7143a631f7d6117b43b@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Operational error occurred while fscking.

see [1]

How can it be fixed ?
Thanks.
--Glenn

a copy of meta-data see:
http://www.4shared.com/file/-RA17cXlba/metadata-sdb.html

metadata-sdb.bz2
2,049,018 KB | 2016-05-30

Using:
# rpm -qa |grep -i reiser4progs  |sort
reiser4progs-1.1.0-35.1.x86_64

[1]
--commands used -

# fsck.reiser4 --build-fs -y /dev/sdb -L
/tmp/fsck.reiser4--build-fs--sdb.log
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
              
Will check the consistency of the Reiser4 SuperBlock.                     
                                                                          
              
Will build the Reiser4 FileSystem.                                        
                                                                          
              
***** fsck.reiser4 started at Sat Jun 11 14:59:55 2016
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
free blocks:    216127617 
root block:     37017218 
tail policy:    0x2 (smart) 
next oid:       0xedade 
file count:     188313 
tree height:    6 
key policy:     LARGE 
 
CHECKING THE STORAGE TREE                                                 
                                                                          
              
        Read nodes 86277775                                               
                                                                          
              
        Nodes left in the tree 86277761 
                Leaves of them 85295523, Twigs of them 970749 
        Nodes with wrong delimiting keys 14 
                Leaves of them 0, Twigs of them 9 
        Time interval: Sat Jun 11 15:01:52 2016 - Sat Jun 11 18:17:45 2016

CHECKING EXTENT REGIONS.                                                  
                                                                          
              
        Read twigs 970749                                                 
                                                                          
              
        Time interval: Sat Jun 11 18:17:45 2016 - Sat Jun 11 19:03:15 2016

LOOKING FOR UNCONNECTED NODES                                             
                                                                          
              
        Read nodes 171172065                                              
                                                                          
              
        Good nodes 110202165 
                Leaves of them 108880262, Twigs of them 1321903 
        Time interval: Sat Jun 11 19:03:27 2016 - Sun Jun 12 01:38:35 2016

CHECKING EXTENT REGIONS.                                                  
                                                                          
              
        Read twigs 1321903                                                
                                                                          
              
        Time interval: Sun Jun 12 01:38:35 2016 - Sun Jun 12 02:04:53 2016

INSERTING UNCONNECTED NODES                                               
                                                                          
              
1. Twigs: done                                                            
                                                                          
              
2. Twigs by item: done                                                    
                                                                          
              
3. Leaves: done                                                           
                                                                          
              
4. Leaves by item: done                                                   
                                                                          
              
        Twigs: read 1321903, inserted 3856, by item 0, empty 1318047      
                                                                          
              
        Leaves: read 108880262, inserted 108879176, by item 1086 
        Time interval: Sun Jun 12 02:05:04 2016 - Sun Jun 12 06:43:48 2016

CHECKING THE SEMANTIC TREE                                                
                                                                          
              
Error: Entry "lost_name_2a:73746200000000:3f1ed" already exists.          
                                                                          
              
Error: Can't add entry lost_name_2a:73746200000000:3f1ed to 29:0:2a. 
        Found 48162 objects.                                              
                                                                          
              
        Removed names pointing to nowhere 18525 
        Time interval: Sun Jun 12 06:43:49 2016 - Sun Jun 12 06:46:28 2016

***** fsck.reiser4 finished at Sun Jun 12 06:46:28 2016
Closing fs...done

Operational error occurred while fscking.
# 

# date
Sun Jun 12 08:58:13 EST 2016
#
 
# /usr/sbin/fsck.reiser4 --build-fs -y /dev/sdb


# fsck.reiser4 --check /dev/sdb -y
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
                     
Will check the consistency of the Reiser4 SuperBlock.                     
                                                                          
                     
Will check the consistency of the Reiser4 FileSystem.                     
                                                                          
                     
***** fsck.reiser4 started at Fri Jun 10 14:26:02 2016
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
free blocks:    216127614 
root block:     37017218 
tail policy:    0x2 (smart) 
next oid:       0xedade 
file count:     188313 
tree height:    6 
key policy:     LARGE 
 
 
CHECKING THE STORAGE TREE                                                 
                                                                          
                     
FSCK: tree.c: 209: repair_tree_dknode_check: Node (41273715): The first
key [29:1(SD):0:2a:0] is not equal to the left delimiting key              
                        
[1a897:4(FB):14665646f72612d:234e8:5a3cd448]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 37017218,
lev 6) points (item 0, unit 0) to the node [41273715] with wrong delimiting
keys. The whole subtree is 
skipped.                                                                  
                                                                          
                       
FSCK: tree.c: 183: repair_tree_dknode_check: Node (207296288): The last
key [1c43f:4(FB):14b44452d466f75:1c440:20bfbdbd] in the node is greater
then the right delimiting key  
[1a897:4(FB):16f70656e535553:46aa2:0].                                    
                                                                          
                       
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 37017218,
lev 6) points (item 9, unit 0) to the node [207296288] with wrong
delimiting keys. The whole subtree is
skipped. 
FSCK: tree.c: 227: repair_tree_dknode_check: Node (blk 233049140, lev 5):
first key [1c43f:4(FB):14b44452d466f75:1c440:21f24eb1] does not match left
delimiting key 
[1a897:4(FB):16f70656e535553:46aa2:0] found in parent node (blk 37017218,
lev 6, pos 10).  
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 37017218,
lev 6) points (item 10, unit 0) to the node [233049140] with wrong
delimiting keys. The whole subtree 
is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (142396194): The first
key [2e02e:4(FB):16d616e2d706167:b48d3:fbd] is not equal to the left
delimiting key 
[59e6a:4(FB):16f70656e636c69:5a1a4:f073dc]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 37017218,
lev 6) points (item 11, unit 0) to the node [142396194] with wrong
delimiting keys. The whole subtree 
is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (138623605): The first
key [50c0d:4(FB):16f70656e535553:50c0e:6910fa8a] is not equal to the left
delimiting key 
[59e6a:4(FB):16f70656e636c69:5a1a4:2cc2f6b]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 37017218,
lev 6) points (item 12, unit 0) to the node [138623605] with wrong
delimiting keys. The whole subtree 
is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (139108838): The first
key [50c0d:4(FB):16f70656e535553:50c0e:ee83b7ff] is not equal to the left
delimiting key 
[59e6a:4(FB):16f787967656e2d:5b7f7:778787]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 37017218,
lev 6) points (item 13, unit 0) to the node [139108838] with wrong
delimiting keys. The whole subtree 
is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6263): The first key
[1d6be:4(FB):16b696f5f69736f:9c601:2f37] is not equal to the left
delimiting key [e8e41:4(FB):162756e646c652d:e9257:e6126].                  
                       
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6200, lev 3)
points (item 30, unit 0) to the node [6263] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6294): The first key
[1c43f:4(FB):14b44452d466f75:1c440:180e4c8c] is not equal to the left
delimiting key [e8e41:4(FB):162756e646c652d:e9260:165d6d].                 
                   
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6200, lev 3)
points (item 62, unit 0) to the node [6294] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6295): The first key
[e8e41:4(FB):162756e646c652d:e9260:1bb5e5] is not equal to the left
delimiting key [e8e41:4(FB):162756e646c652d:e9260:1bc5a2]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6200, lev 3)
points (item 63, unit 0) to the node [6295] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6297): The first key
[1c43f:4(FB):14b44452d466f75:1c440:181e8504] is not equal to the left
delimiting key [e8e41:4(FB):1636163612d7574:e9285:bc72].                   
                   
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6200, lev 3)
points (item 65, unit 0) to the node [6297] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6318): The first key
[1c43f:4(FB):14b44452d466f75:1c440:18900ffe] is not equal to the left
delimiting key [e8e41:4(FB):1636c6973702d32:e92ef:70d2b6].                 
                   
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6296, lev 3)
points (item 3, unit 0) to the node [6318] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6319): The first key
[e8e41:4(FB):1636c6973702d32:e92ef:71de1c] is not equal to the left
delimiting key [e8e41:4(FB):1636c6973702d32:e92ef:763ac4]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6296, lev 3)
points (item 4, unit 0) to the node [6319] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6327): The first key
[1c43f:4(FB):14b44452d466f75:1c440:18bb5131] is not equal to the left
delimiting key [e8e41:4(FB):163736d6173682d:e9397:1b96b1].                 
                   
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6296, lev 3)
points (item 18, unit 0) to the node [6327] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6328): The first key
[e8e41:4(FB):163736d6173682d:e9397:20420a] is not equal to the left
delimiting key [e8e41:4(FB):163736d6173682d:e9397:20fee6]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6296, lev 3)
points (item 19, unit 0) to the node [6328] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6332): The first key
[1c43f:4(FB):14b44452d466f75:1c440:18d659ec] is not equal to the left
delimiting key [e8e41:4(FB):1646275732d312d:e93e1:18756d].                 
                   
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6296, lev 3)
points (item 28, unit 0) to the node [6332] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6333): The first key
[e8e41:4(FB):1646275732d312d:e93e1:1acb2d] is not equal to the left
delimiting key [e8e41:4(FB):1646275732d312d:e93e1:1ddda2]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6296, lev 3)
points (item 29, unit 0) to the node [6333] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6335): The first key
[1c43f:4(FB):14b44452d466f75:1c440:18e69264] is not equal to the left
delimiting key [e8e41:4(FB):1646f6d346a2d6d:e945f:7b2b3].                  
                   
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6296, lev 3)
points (item 37, unit 0) to the node [6335] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6336): The first key
[e8e41:4(FB):1646f6d346a2d6d:e945f:a95f1] is not equal to the left
delimiting key [e8e41:4(FB):1646f6d346a2d6d:e945f:d1ac1]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6296, lev 3)
points (item 38, unit 0) to the node [6336] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6352): The first key
[1c43f:4(FB):14b44452d466f75:1c440:1942766d] is not equal to the left
delimiting key [e8e41:4(FB):1656d7061746879:e94b5:986fb].                  
                   
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6296, lev 3)
points (item 61, unit 0) to the node [6352] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6353): The first key
[e8e41:4(FB):1656d7061746879:e94b5:9e569] is not equal to the left
delimiting key [e8e41:4(FB):1656d7061746879:e94b5:eef30]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6296, lev 3)
points (item 62, unit 0) to the node [6353] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6417): The first key
[1c43f:4(FB):14b44452d466f75:1c440:1a9c794c] is not equal to the left
delimiting key [e8e41:4(FB):165766f6c757469:e94ea:fc34a7].                 
                   
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6370, lev 3)
points (item 39, unit 0) to the node [6417] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6418): The first key
[e8e41:4(FB):165766f6c757469:e94ea:fe8a67] is not equal to the left
delimiting key [e8e41:4(FB):165766f6c757469:e94ea:1019cdc]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6370, lev 3)
points (item 40, unit 0) to the node [6418] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6818): The first key
[1c43f:4(FB):14b44452d466f75:1c440:22fec7bc] is not equal to the left
delimiting key [e8e41:4(FB):166696c6c657473:e9597:842fed6].                
                   
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6729, lev 3)
points (item 87, unit 0) to the node [6818] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6819): The first key
[e8e41:4(FB):166696c6c657473:e9597:843bb8b] is not equal to the left
delimiting key [e8e41:4(FB):166696c6c657473:e9597:84866e4]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 3457, lev 4)
points (item 9, unit 0) to the node [6819] with wrong delimiting keys. The
whole subtree is skipped. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6463): The first key
[1c43f:4(FB):14b44452d466f75:1c440:1b952b9a] is not equal to the left
delimiting key [e8e41:4(FB):166696e6765722d:e95a2:1a63]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 3457, lev 4)
points (item 10, unit 0) to the node [6463] with wrong delimiting keys. The
whole subtree is skipped. 
        Read nodes 89212123                                               
                                                                          
                                                                          
          
        Nodes left in the tree 89212098 
                Leaves of them 88197442, Twigs of them 1002836 
        Nodes with wrong delimiting keys 25 
                Leaves of them 0, Twigs of them 17 
        Time interval: Fri Jun 10 14:27:59 2016 - Fri Jun 10 17:48:15 2016

CHECKING EXTENT REGIONS.                                                  
                                                                          
                                                                          
          
        Read twigs 1002836                                                
                                                                          
                                                                          
          
        Time interval: Fri Jun 10 17:48:15 2016 - Fri Jun 10 18:46:24 2016

Warn : Fatal corruptions were found. Semantic pass is skipped.            
                                                                          
                                                                          
          
***** fsck.reiser4 finished at Fri Jun 10 18:46:24 2016
Closing fs...done

25 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.


# fsck.reiser4 --build-fs /dev/sdb -y
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
                                                                          
Will check the consistency of the Reiser4 SuperBlock.                     
                                                                          
                                                                          
Will build the Reiser4 FileSystem.                                        
                                                                          
                                                                          
***** fsck.reiser4 started at Fri Jun 10 21:22:06 2016
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
free blocks:    216127614 
root block:     37017218 
tail policy:    0x2 (smart) 
next oid:       0xedade 
file count:     188313 
tree height:    6 
key policy:     LARGE 
 
 
CHECKING THE STORAGE TREE   
.
.

FSCK: tree.c: 209: repair_tree_dknode_check: Node (6818): The first key
[1c43f:4(FB):14b44452d466f75:1c440:22fec7bc] is not equal to the left
delimiting key [e8e41:4(FB):166696c6c657473:e9597:842fed6].                
     
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 6729, lev 3)
points (item 87, unit 0) to the node [6818] with wrong delimiting keys.
Removed, content will be inserted later item-by-item. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6819): The first key
[e8e41:4(FB):166696c6c657473:e9597:843bb8b] is not equal to the left
delimiting key [e8e41:4(FB):166696c6c657473:e9597:84866e4]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 3457, lev 4)
points (item 9, unit 0) to the node [6819] with wrong delimiting keys.
Removed, content will be inserted later item-by-item. 
FSCK: tree.c: 209: repair_tree_dknode_check: Node (6463): The first key
[1c43f:4(FB):14b44452d466f75:1c440:1b952b9a] is not equal to the left
delimiting key [e8e41:4(FB):166696e6765722d:e95a2:1a63]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 3457, lev 4)
points (item 9, unit 0) to the node [6463] with wrong delimiting keys.
Removed, content will be inserted later item-by-item. 
        Read nodes 89288529                                               
                                                                          
                                                                        
        Nodes left in the tree 89287587 
                Leaves of them 88271758, Twigs of them 1003861 
        Emptied of them 74 
                Leaves of them 0, Twigs of them 0 
        Nodes with wrong delimiting keys 855 
                Leaves of them 0, Twigs of them 849 
        Zeroed node pointers 11 
        Time interval: Fri Jun 10 21:24:02 2016 - Sat Jun 11 00:44:36 2016

CHECKING EXTENT REGIONS.                                                  
                                                                          
                                                                        
        Read twigs 1003861                                                
                                                                          
                                                                        
        Time interval: Sat Jun 11 00:44:36 2016 - Sat Jun 11 01:50:09 2016

LOOKING FOR UNCONNECTED NODES                                             
                                                                          
                                                                        
FSCK: node.c: 108: repair_node_items_check: Node (10201), items (6) and
(7): Wrong order of keys.                                                  
                                                                          

FSCK: node.c: 108: repair_node_items_check: Node (1862082), items (19) and
(20): Wrong order of keys.                                                 
                                                                        
FSCK: node.c: 108: repair_node_items_check: Node (1862116), items (18) and
(19): Wrong order of keys.                                                 
                                                                        
FSCK: node.c: 108: repair_node_items_check: Node (1862122), items (55) and
(56): Wrong order of keys.                                                 
                                                                        
FSCK: node.c: 108: repair_node_items_check: Node (1862411), items (71) and
(72): Wrong order of keys.                                                 
                                                                        
FSCK: node.c: 108: repair_node_items_check: Node (1862449), items (43) and
(44): Wrong order of keys.                                                 
                                                                        
FSCK: node.c: 108: repair_node_items_check: Node (1863295), items (18) and
(19): Wrong order of keys.                                                 
                                                                        
FSCK: node.c: 108: repair_node_items_check: Node (1863331), items (3) and
(4): Wrong order of keys.                                                  
                                                                         
FSCK: node.c: 108: repair_node_items_check: Node (1863370), items (2) and
(3): Wrong order of keys.                                                  
                                                                         
FSCK: node.c: 108: repair_node_items_check: Node (1863446), items (3) and
(4): Wrong order of keys.                                                  
                                                                         
FSCK: node.c: 108: repair_node_items_check: Node (1863589), items (42) and
(43): Wrong order of keys.                                                 
                                                                        
FSCK: node.c: 108: repair_node_items_check: Node (1863625), items (21) and
(22): Wrong order of keys.                                                 
                                                                        
FSCK: node.c: 108: repair_node_items_check: Node (1863636), items (75) and
(76): Wrong order of keys.                                                 
                                                                        
FSCK: node.c: 108: repair_node_items_check: Node (1863806), items (62) and
(63): Wrong order of keys.                                                 
                                                                        
FSCK: node.c: 108: repair_node_items_check: Node (1863816), items (0) and
(1): Wrong order of keys.                                                  
                                                                         
FSCK: node.c: 108: repair_node_items_check: Node (1864093), items (53) and
(54): Wrong order of keys.                                                 
                                                                        
FSCK: node.c: 108: repair_node_items_check: Node (1864094), items (53) and
(54): Wrong order of keys.                                                 
                                                                        
FSCK: node.c: 108: repair_node_items_check: Node (1864095), items (53) and
(54): Wrong order of keys.                                                 
                                                                        
FSCK: node.c: 108: repair_node_items_check: Node (1864096), items (53) and
(54): Wrong order of keys.                                                 
                                                                        
FSCK: node.c: 108: repair_node_items_check: Node (1864097), items (0) and
(1): Wrong order of keys.                                                  
                                                                         
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
                                                                          
FSCK: node.c: 108: repair_node_items_check: Node (284305753), items (61)
and (62): Wrong order of keys.                                             
                                                                          
        Read nodes 174215651                                              
                                                                          
                                                                        
        Good nodes 107071131 
                Leaves of them 105904631, Twigs of them 1166500 
        Time interval: Sat Jun 11 01:50:21 2016 - Sat Jun 11 08:29:53 2016

CHECKING EXTENT REGIONS.                                                  
                                                                          
                                                                        
FSCK: extent40_repair.c: 96: extent40_check_layout: Node (233049310), item
(0), unit (0), [4b372:4(FB):14f5331312e324d:4b373:0]: points to the already
used blocks,  region [232765811..232765844]. Zeroed.                     
FSCK: extent40_repair.c: 96: extent40_check_layout: Node (233049310), item
(1), unit (0), [4b372:4(FB):14f5331312e324d:4b377:0]: points to the already
used blocks,  region [232765845..232765875]. Zeroed. 
FSCK: extent40_repair.c: 96: extent40_check_layout: Node (233049310), item
(2), unit (0), [4b372:4(FB):14f5331312e324d:4b379:0]: points to the already
used blocks,  region [232765876..232765940]. Zeroed. 
FSCK: extent40_repair.c: 96: extent40_check_layout: Node (233049310), item
(3), unit (0), [4b372:4(FB):14f5331312e324d:4b37a:0]: points to the already
used blocks,  region [232765941..232766060]. Zeroed. 
FSCK: extent40_repair.c: 96: extent40_check_layout: Node (233049310), item
(4), unit (0), [4b372:4(FB):14f5331312e324d:4b37d:0]: points to the already
used blocks,  region [232766061..232766232]. Zeroed. 
FSCK: extent40_repair.c: 96: extent40_check_layout: Node (233055613), item
(0), unit (0), [4b372:4(FB):14f5331312e324d:4b373:0]: points to the already
used blocks,  region [232765811..232765844]. Zeroed.                     
FSCK: extent40_repair.c: 96: extent40_check_layout: Node (233055613), item
(1), unit (0), [4b372:4(FB):14f5331312e324d:4b377:0]: points to the already
used blocks,  region [232765845..232765875]. Zeroed. 
FSCK: extent40_repair.c: 96: extent40_check_layout: Node (233055613), item
(2), unit (0), [4b372:4(FB):14f5331312e324d:4b379:0]: points to the already
used blocks,  region [232765876..232765940]. Zeroed. 
FSCK: extent40_repair.c: 96: extent40_check_layout: Node (233055613), item
(3), unit (0), [4b372:4(FB):14f5331312e324d:4b37a:0]: points to the already
used blocks,  region [232765941..232766060]. Zeroed. 
FSCK: extent40_repair.c: 96: extent40_check_layout: Node (233055613), item
(4), unit (0), [4b372:4(FB):14f5331312e324d:4b37d:0]: points to the already
used blocks,  region [232766061..232766232]. Zeroed. 
        Read twigs 1166500                                                
                                                                          
                                                                        
        Corrected nodes 2 
        Fixed invalid extent pointers 10 
        Time interval: Sat Jun 11 08:29:53 2016 - Sat Jun 11 08:42:57 2016

INSERTING UNCONNECTED NODES                                               
                                                                          
                                                                        
1. Twigs: done                                                            
                                                                          
                                                                        
2. Twigs by item: done
3. Leaves: done                                                           
                                                                          
                                                                        
4. Leaves by item: Segmentation fault


#
Background history
==================
 http://www.spinics.net/lists/reiserfs-devel/msg04206.html
 http://www.spinics.net/lists/reiserfs-devel/msg04682.html

[from url]

This is a bug in fsck: it jumps to wrong branch for some reasons.
Not yet fixed.

Edward.


