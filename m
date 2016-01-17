From: <doiggl@velocitynet.com.au>
Subject: Can a utility program be written to swap 2 nodes over, given the Node number and 2 'Wrong order of keys' ? [sdb]
Date: Mon, 18 Jan 2016 10:56:55 +1100
Message-ID: <079eaef736526339ee273fb091166b28@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,

Question:
Can a utility program be written to swap 2 nodes over given the  Node
number and 2 'Wrong order of keys' ?
Thank you
--Glenn

Examples:

# repair_node_item 43828275 0 1
# repair_node_item 52697435  79  80                                       
          
# repair_node_item 63227569  24  25                                       
          
# repair_node_item 63227571  73  74                                       
          
# repair_node_item 116595727  20  21                                      
          
# repair_node_item 227923161  22  23                                      
          
# repair_node_item 284305753  61  62


Syntax:
repair_node_items <Node number>  <item-key number>  <item-key number>


Output taken from:

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


