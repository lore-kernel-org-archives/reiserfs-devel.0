From: <doiggl@velocitynet.com.au>
Subject: Some reiser4 meta-data questions: [/dev/sdb]
Date: Sat, 20 Feb 2016 20:52:41 +1100
Message-ID: <9d06152a82237e50fec1de511b50aefc@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Hello Edward,
Some reiser4 meta-data questions: [/dev/sdb]

- I packed r4 meta-data with command

# debugfs.reiser4 -P /dev/sdb  | gzip -9 > r4meta-sdb.gz


- I Unpacked r4 metadata with command as follows, metadata unpacked ok.
# gunzip r4meta-sdb.gz

# ll
 24,742,135,567 Feb 20 20:10 r4meta-sdb


Question:
What commands would you run against unpacked meta-data to help diagnose
problems and fix meta-data ?
So mount command completes.

Cant see any utilities to shrink existing Reiser4 partition.
Thanks for assistance.

--Glenn


# fsck.reiser4 --build-fs /dev/sdb
# 
CHECKING THE STORAGE TREE                                                 
                                                                          
 
        Read nodes 197008413                                              
                                                                          
 
        Nodes left in the tree 197008413 
                Leaves of them 194764277, Twigs of them 2217790 
        Time interval: Sun Jan 17 18:22:12 2016 - Mon Jan 18 02:10:12 2016

CHECKING EXTENT REGIONS.                                                  
                                                                          
 
        Read twigs 2217790                                                
                                                                          
 
        Time interval: Mon Jan 18 02:10:12 2016 - Mon Jan 18 04:19:49 2016

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
        Time interval: Mon Jan 18 04:20:04 2016 - Mon Jan 18 04:23:48 2016

***** fsck.reiser4 finished at Mon Jan 18 04:23:48 2016

