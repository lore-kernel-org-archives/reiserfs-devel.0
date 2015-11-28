From: <doiggl@velocitynet.com.au>
Subject: Has anyone ever fixed/repaired 'Wrong order of keys' problem ?
Date: Sat, 28 Nov 2015 16:22:12 +1100
Message-ID: <5c28f294e02fcbb7838423fb49673bbe@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,

A Question:

Has anyone ever fixed/repaired 'Wrong order of keys' problem ?

If so, how was repair done ?

--
Thanks Glenn

An example of 'Wrong order of keys' problem
===========================================

http://www.spinics.net/lists/reiserfs-devel/msg04871.html

#fsck.reiser4  --build-fs --force  /dev/sdb
.
.
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
        Time interval: Thu Sep  3 07:11:22 2015 - Thu Sep  3 07:14:56 2015

