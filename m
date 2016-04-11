From: <doiggl@velocitynet.com.au>
Subject: How is following problem fixed ? broken item [found on sdb] process is at 0% [version of fsck.reiser4 1.0.5]
Date: Mon, 11 Apr 2016 17:23:46 +1000
Message-ID: <7de0b3323d0883dceaad20bc2287f1df@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
How is following problem fixed ? broken item [found on sdb] process is at
0% [version of fsck.reiser4 1.0.5]

--Thanks Glenn

# fsck.reiser4 -V
fsck.reiser4 1.0.5
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 

# fsck.reiser4 --build-sb --force /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
               
Will build the Reiser4 SuperBlock.                                        
                                                                          
               
Will check the consistency of the Reiser4 FileSystem.                     
                                                                          
               
***** fsck.reiser4 started at Mon Apr 11 15:42:49 2016
Reiser4 fs was detected on /dev/sdb.                                      
                                                                          
               
Master super block (16): 
magic:          ReIsEr4 
blksize:        4096 
format:         0x0 (format40) 
uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede 
label:          <none> 
 
Format super block (17): 
plugin:         format40 
description:    Disk-format for reiser4.  
magic:          ReIsEr40FoRmAt 
flushes:        0 
mkfs id:        0x1ddaf754 
blocks:         488378640 
free blocks:    217146980 
root block:     37017218 
tail policy:    0x2 (smart) 
next oid:       0xedade 
file count:     188313 
tree height:    6 
key policy:     LARGE 
 
 
CHECKING STORAGE TREE                                                     
                                                                          
               
FSCK: Node (42), item (2), [10005:1(SD):6170702e6a7300:10013:0]: the slot
(0) contains the invalid opset member (object), id (4).                    
                
FSCK: Node (42), item (2), [10005:1(SD):6170702e6a7300:10013:0]: the slot
(1) contains the invalid opset member (compress mode), id (1). 
FSCK: Node (42), item (2), [10005:1(SD):6170702e6a7300:10013:0]: does not
look like a valid stat data. 
FSCK: Node (42), item (2), [10005:1(SD):6170702e6a7300:10013:0]: broken
item found. 
FSCK: Node (42), item (3), [10005:1(SD):6174746163686d:10016:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (42), item (3), [10005:1(SD):6174746163686d:10016:0]: does not
look like a valid stat data. 
FSCK: Node (42), item (3), [10005:1(SD):6174746163686d:10016:0]: broken
item found. 
FSCK: Node (42), item (4), [10005:1(SD):626c616e6b2e67:10007:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (42), item (4), [10005:1(SD):626c616e6b2e67:10007:0]: does not
look like a valid stat data. 
FSCK: Node (42), item (4), [10005:1(SD):626c616e6b2e67:10007:0]: broken
item found. 
FSCK: Node (42), item (5), [10005:1(SD):636f6d6d6f6e2e:1000a:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (42), item (5), [10005:1(SD):636f6d6d6f6e2e:1000a:0]: does not
look like a valid stat data. 
FSCK: Node (42), item (5), [10005:1(SD):636f6d6d6f6e2e:1000a:0]: broken
item found. 
FSCK: Node (42), item (6), [10005:1(SD):636f6d6d6f6e2e:10018:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (42), item (6), [10005:1(SD):636f6d6d6f6e2e:10018:0]: does not
look like a valid stat data. 
FSCK: Node (42), item (6), [10005:1(SD):636f6d6d6f6e2e:10018:0]: broken
item found. 
FSCK: Node (42), item (7), [10005:1(SD):646f742e706e67:1000b:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (42), item (7), [10005:1(SD):646f742e706e67:1000b:0]: does not
look like a valid stat data. 
FSCK: Node (42), item (7), [10005:1(SD):646f742e706e67:1000b:0]: broken
item found. 
FSCK: Node (42), item (8), [10005:1(SD):66756e6374696f:10009:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (42), item (8), [10005:1(SD):66756e6374696f:10009:0]: does not
look like a valid stat data. 
FSCK: Node (42), item (8), [10005:1(SD):66756e6374696f:10009:0]: broken
item found. 
FSCK: Node (42), item (9), [10005:1(SD):676c6173735f72:10008:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (42), item (9), [10005:1(SD):676c6173735f72:10008:0]: does not
look like a valid stat data. 
FSCK: Node (42), item (9), [10005:1(SD):676c6173735f72:10008:0]: broken
item found. 
FSCK: Node (42), item (10), [10005:1(SD):6a71756572792d:1000d:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (42), item (10), [10005:1(SD):6a71756572792d:1000d:0]: the slot
(1) contains the invalid opset member (compress mode), id (1). 
FSCK: Node (42), item (10), [10005:1(SD):6a71756572792d:1000d:0]: does not
look like a valid stat data. 
FSCK: Node (42), item (10), [10005:1(SD):6a71756572792d:1000d:0]: broken
item found. 
FSCK: Node (42), item (11), [10005:1(SD):6c6973742e6a73:1000c:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (42), item (11), [10005:1(SD):6c6973742e6a73:1000c:0]: does not
look like a valid stat data. 
FSCK: Node (42), item (11), [10005:1(SD):6c6973742e6a73:1000c:0]: broken
item found. 
FSCK: Node (42), item (12), [10005:1(SD):6d61696c2e6373:1000f:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (42), item (12), [10005:1(SD):6d61696c2e6373:1000f:0]: does not
look like a valid stat data. 
FSCK: Node (42), item (12), [10005:1(SD):6d61696c2e6373:1000f:0]: broken
item found. 
FSCK: Node (42), item (13), [10005:1(SD):72657365742e67:10014:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (42), item (13), [10005:1(SD):72657365742e67:10014:0]: does not
look like a valid stat data. 
FSCK: Node (42), item (13), [10005:1(SD):72657365742e67:10014:0]: broken
item found. 
FSCK: Node (42): the node is broken. Pointed from the node (146395376),
item (1), unit (0). The whole subtree is skipped. 
FSCK: Node (43), item (0), [10005:1(SD):726f756e646375:10017:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (43), item (0), [10005:1(SD):726f756e646375:10017:0]: does not
look like a valid stat data. 
FSCK: Node (43), item (0), [10005:1(SD):726f756e646375:10017:0]: broken
item found. 
FSCK: Node (43), item (1), [10005:1(SD):73706c69747465:10006:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (43), item (1), [10005:1(SD):73706c69747465:10006:0]: does not
look like a valid stat data. 
FSCK: Node (43), item (1), [10005:1(SD):73706c69747465:10006:0]: broken
item found. 
FSCK: Node (43), item (2), [10005:1(SD):756e726561642e:10015:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (43), item (2), [10005:1(SD):756e726561642e:10015:0]: does not
look like a valid stat data. 
FSCK: Node (43), item (2), [10005:1(SD):756e726561642e:10015:0]: broken
item found. 
FSCK: Node (43), item (3), [10005:1(SD):77617465726d61:1000e:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (43), item (3), [10005:1(SD):77617465726d61:1000e:0]: does not
look like a valid stat data. 
FSCK: Node (43), item (3), [10005:1(SD):77617465726d61:1000e:0]: broken
item found. 
FSCK: Node (43): the node is broken. Pointed from the node (146395376),
item (2), unit (0). The whole subtree is skipped. 
FSCK: Node (75), item (0), [10010:1(SD):65787477696e2e:10011:0]: the slot
(0) contains the invalid opset member (object), id (4).                    
                
FSCK: Node (75), item (0), [10010:1(SD):65787477696e2e:10011:0]: does not
look like a valid stat data. 
FSCK: Node (75), item (0), [10010:1(SD):65787477696e2e:10011:0]: broken
item found. 
FSCK: Node (75), item (1), [10010:1(SD):73696c686f7565:10012:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (75), item (1), [10010:1(SD):73696c686f7565:10012:0]: does not
look like a valid stat data. 
FSCK: Node (75), item (1), [10010:1(SD):73696c686f7565:10012:0]: broken
item found. 
FSCK: Node (75), item (6), [1001a:1(SD):16c696271646961:1002d:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (75), item (6), [1001a:1(SD):16c696271646961:1002d:0]: does not
look like a valid stat data. 
FSCK: Node (75), item (6), [1001a:1(SD):16c696271646961:1002d:0]: broken
item found. 
FSCK: Node (75), item (9), [1001a:1(SD):16c69627a797070:10028:0]: the slot
(0) contains the invalid opset member (object), id (4). 
FSCK: Node (75), item (9), [1001a:1(SD):16c69627a797070:10028:0]: the slot
(1) contains the invalid opset member (compress mode), id (1). 
FSCK: Node (75), item (9), [1001a:1(SD):16c69627a797070:10028:0]: does not
look like a valid stat data. 
FSCK: Node (75), item (9), [1001a:1(SD):16c69627a797070:10028:0]: broken
item found. 
FSCK: Node (75): the node is broken. Pointed from the node (146395377),
item (26), unit (0). The whole subtree is skipped. 
FSCK: Node (2639), item (1), [1001d:1(SD):66696c656c6973:1001e:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                   
FSCK: Node (2639), item (1), [1001d:1(SD):66696c656c6973:1001e:0]: does
not look like a valid stat data. 
FSCK: Node (2639), item (1), [1001d:1(SD):66696c656c6973:1001e:0]: broken
item found. 
FSCK: Node (2639), item (3), [1001d:1(SD):7072696d617279:10021:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (2639), item (3), [1001d:1(SD):7072696d617279:10021:0]: does
not look like a valid stat data. 
FSCK: Node (2639), item (3), [1001d:1(SD):7072696d617279:10021:0]: broken
item found. 
FSCK: Node (2639), item (4), [1001d:1(SD):7265706f6d642e:1001f:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (2639), item (4), [1001d:1(SD):7265706f6d642e:1001f:0]: does
not look like a valid stat data. 
FSCK: Node (2639), item (4), [1001d:1(SD):7265706f6d642e:1001f:0]: broken
item found. 
FSCK: Node (2639): the node is broken. Pointed from the node (2676), item
(42), unit (0). The whole subtree is skipped. 
FSCK: Node (2675), item (2), [10035:1(SD):666565642d6963:10036:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                   
FSCK: Node (2675), item (2), [10035:1(SD):666565642d6963:10036:0]: does
not look like a valid stat data. 
FSCK: Node (2675), item (2), [10035:1(SD):666565642d6963:10036:0]: broken
item found. 
FSCK: Node (2675), item (3), [10035:1(SD):7374796c652e63:10037:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (2675), item (3), [10035:1(SD):7374796c652e63:10037:0]: does
not look like a valid stat data. 
FSCK: Node (2675), item (3), [10035:1(SD):7374796c652e63:10037:0]: broken
item found. 
FSCK: Node (2675): the node is broken. Pointed from the node (2676), item
(46), unit (0). The whole subtree is skipped. 
FSCK: Node (1728424), item (1), [1003b:1(SD):4765656b6f5f68:10046:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (1728424), item (1), [1003b:1(SD):4765656b6f5f68:10046:0]: does
not look like a valid stat data. 
FSCK: Node (1728424), item (1), [1003b:1(SD):4765656b6f5f68:10046:0]:
broken item found. 
FSCK: Node (1728424), item (2), [1003b:1(SD):5064662e706e67:1003c:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (1728424), item (2), [1003b:1(SD):5064662e706e67:1003c:0]: does
not look like a valid stat data. 
FSCK: Node (1728424), item (2), [1003b:1(SD):5064662e706e67:1003c:0]:
broken item found. 
FSCK: Node (1728424), item (3), [1003b:1(SD):537573656d696e:10043:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (1728424), item (3), [1003b:1(SD):537573656d696e:10043:0]: does
not look like a valid stat data. 
FSCK: Node (1728424), item (3), [1003b:1(SD):537573656d696e:10043:0]:
broken item found. 
FSCK: Node (1728424), item (4), [1003b:1(SD):646973636f7665:1003d:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (1728424), item (4), [1003b:1(SD):646973636f7665:1003d:0]: does
not look like a valid stat data. 
FSCK: Node (1728424), item (4), [1003b:1(SD):646973636f7665:1003d:0]:
broken item found. 
FSCK: Node (1728424), item (5), [1003b:1(SD):666f756e646564:1003f:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (1728424), item (5), [1003b:1(SD):666f756e646564:1003f:0]: does
not look like a valid stat data. 
FSCK: Node (1728424), item (5), [1003b:1(SD):666f756e646564:1003f:0]:
broken item found. 
FSCK: Node (1728424), item (6), [1003b:1(SD):6765656b6f2e6a:1003e:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (1728424), item (6), [1003b:1(SD):6765656b6f2e6a:1003e:0]: does
not look like a valid stat data. 
FSCK: Node (1728424), item (6), [1003b:1(SD):6765656b6f2e6a:1003e:0]:
broken item found. 
FSCK: Node (1728424), item (7), [1003b:1(SD):676f2e706e6700:10040:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (1728424), item (7), [1003b:1(SD):676f2e706e6700:10040:0]: does
not look like a valid stat data. 
FSCK: Node (1728424), item (7), [1003b:1(SD):676f2e706e6700:10040:0]:
broken item found. 
FSCK: Node (1728424), item (8), [1003b:1(SD):696e6465782e70:10041:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (1728424), item (8), [1003b:1(SD):696e6465782e70:10041:0]: does
not look like a valid stat data. 
FSCK: Node (1728424), item (8), [1003b:1(SD):696e6465782e70:10041:0]:
broken item found. 
FSCK: Node (1728424), item (9), [1003b:1(SD):6c616e6773656c:10049:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (1728424), item (9), [1003b:1(SD):6c616e6773656c:10049:0]: does
not look like a valid stat data. 
FSCK: Node (1728424), item (9), [1003b:1(SD):6c616e6773656c:10049:0]:
broken item found. 
FSCK: Node (1728424), item (10), [1003b:1(SD):7365617263682e:10045:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (1728424), item (10), [1003b:1(SD):7365617263682e:10045:0]:
does not look like a valid stat data. 
FSCK: Node (1728424), item (10), [1003b:1(SD):7365617263682e:10045:0]:
broken item found. 
FSCK: Node (1728424): the node is broken. Pointed from the node (2676),
item (47), unit (0). The whole subtree is skipped. 
FSCK: Node (2677), item (0), [1003b:1(SD):73757065727374:10044:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (2677), item (0), [1003b:1(SD):73757065727374:10044:0]: does
not look like a valid stat data. 
FSCK: Node (2677), item (0), [1003b:1(SD):73757065727374:10044:0]: broken
item found. 
FSCK: Node (2677), item (1), [1003b:1(SD):77696b692e6373:10042:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (2677), item (1), [1003b:1(SD):77696b692e6373:10042:0]: does
not look like a valid stat data. 
FSCK: Node (2677), item (1), [1003b:1(SD):77696b692e6373:10042:0]: broken
item found. 
FSCK: Node (2677), item (2), [1003b:1(SD):77696b695f7072:10047:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (2677), item (2), [1003b:1(SD):77696b695f7072:10047:0]: does
not look like a valid stat data. 
FSCK: Node (2677), item (2), [1003b:1(SD):77696b695f7072:10047:0]: broken
item found. 
FSCK: Node (2677), item (3), [1003b:1(SD):77696b69626974:10048:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (2677), item (3), [1003b:1(SD):77696b69626974:10048:0]: does
not look like a valid stat data. 
FSCK: Node (2677), item (3), [1003b:1(SD):77696b69626974:10048:0]: broken
item found. 
FSCK: Node (2677): the node is broken. Pointed from the node (2676), item
(48), unit (0). The whole subtree is skipped. 
FSCK: Node (3409), item (0), [18972:1(SD):696e7374616c6c:18a59:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                   
FSCK: Node (3409), item (0), [18972:1(SD):696e7374616c6c:18a59:0]: does
not look like a valid stat data. 
FSCK: Node (3409), item (0), [18972:1(SD):696e7374616c6c:18a59:0]: broken
item found. 
FSCK: Node (3409), item (1), [18972:1(SD):696e7374616c6c:18a5a:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (3409), item (1), [18972:1(SD):696e7374616c6c:18a5a:0]: does
not look like a valid stat data. 
FSCK: Node (3409), item (1), [18972:1(SD):696e7374616c6c:18a5a:0]: broken
item found. 
FSCK: Node (3409), item (2), [18972:1(SD):696e7374616c6c:18b6d:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (3409), item (2), [18972:1(SD):696e7374616c6c:18b6d:0]: does
not look like a valid stat data. 
FSCK: Node (3409), item (2), [18972:1(SD):696e7374616c6c:18b6d:0]: broken
item found. 
FSCK: Node (3409), item (3), [18972:1(SD):6d616e75616c2e:18997:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (3409), item (3), [18972:1(SD):6d616e75616c2e:18997:0]: the
slot (1) contains the invalid opset member (compress mode), id (1). 
FSCK: Node (3409), item (3), [18972:1(SD):6d616e75616c2e:18997:0]: does
not look like a valid stat data. 
FSCK: Node (3409), item (3), [18972:1(SD):6d616e75616c2e:18997:0]: broken
item found. 
FSCK: Node (3409), item (4), [18972:1(SD):120486f7720546f:18ba0:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (3409), item (4), [18972:1(SD):120486f7720546f:18ba0:0]: the
slot (1) contains the invalid opset member (compress mode), id (1). 
FSCK: Node (3409), item (4), [18972:1(SD):120486f7720546f:18ba0:0]: does
not look like a valid stat data. 
FSCK: Node (3409), item (4), [18972:1(SD):120486f7720546f:18ba0:0]: broken
item found. 
FSCK: Node (3409), item (5), [18972:1(SD):1302e382e376320:18d69:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (3409), item (5), [18972:1(SD):1302e382e376320:18d69:0]: does
not look like a valid stat data. 
FSCK: Node (3409), item (5), [18972:1(SD):1302e382e376320:18d69:0]: broken
item found. 
FSCK: Node (3409), item (6), [18972:1(SD):143616374692d6f:18996:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (3409), item (6), [18972:1(SD):143616374692d6f:18996:0]: does
not look like a valid stat data. 
FSCK: Node (3409), item (6), [18972:1(SD):143616374692d6f:18996:0]: broken
item found. 
FSCK: Node (3409), item (7), [18972:1(SD):143616374695f6f:18c65:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (3409), item (7), [18972:1(SD):143616374695f6f:18c65:0]: does
not look like a valid stat data. 
FSCK: Node (3409), item (7), [18972:1(SD):143616374695f6f:18c65:0]: broken
item found. 
FSCK: Node (3409), item (8), [18972:1(SD):1486f7720546f20:18ae8:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (3409), item (8), [18972:1(SD):1486f7720546f20:18ae8:0]: the
slot (1) contains the invalid opset member (compress mode), id (1). 
FSCK: Node (3409), item (8), [18972:1(SD):1486f7720546f20:18ae8:0]: does
not look like a valid stat data. 
FSCK: Node (3409), item (8), [18972:1(SD):1486f7720546f20:18ae8:0]: broken
item found. 
FSCK: Node (3409), item (9), [18972:1(SD):1486f7720546f20:18d4a:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (3409), item (9), [18972:1(SD):1486f7720546f20:18d4a:0]: the
slot (1) contains the invalid opset member (compress mode), id (1). 
FSCK: Node (3409), item (9), [18972:1(SD):1486f7720546f20:18d4a:0]: does
not look like a valid stat data. 
FSCK: Node (3409), item (9), [18972:1(SD):1486f7720546f20:18d4a:0]: broken
item found. 
FSCK: Node (3409), item (10), [18972:1(SD):1486f7720746f20:18b6e:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (3409), item (10), [18972:1(SD):1486f7720746f20:18b6e:0]: the
slot (1) contains the invalid opset member (compress mode), id (1). 
FSCK: Node (3409), item (10), [18972:1(SD):1486f7720746f20:18b6e:0]: does
not look like a valid stat data. 
FSCK: Node (3409), item (10), [18972:1(SD):1486f7720746f20:18b6e:0]:
broken item found. 
FSCK: Node (3409), item (11), [18972:1(SD):15248454c20352e:18a1e:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (3409), item (11), [18972:1(SD):15248454c20352e:18a1e:0]: does
not look like a valid stat data. 
FSCK: Node (3409), item (11), [18972:1(SD):15248454c20352e:18a1e:0]:
broken item found. 
FSCK: Node (3409), item (12), [18972:1(SD):152656468617420:18998:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (3409), item (12), [18972:1(SD):152656468617420:18998:0]: does
not look like a valid stat data. 
FSCK: Node (3409), item (12), [18972:1(SD):152656468617420:18998:0]:
broken item found. 
FSCK: Node (3409), item (13), [18972:1(SD):163616374695f30:18bc1:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (3409), item (13), [18972:1(SD):163616374695f30:18bc1:0]: the
slot (1) contains the invalid opset member (compress mode), id (1). 
FSCK: Node (3409), item (13), [18972:1(SD):163616374695f30:18bc1:0]: does
not look like a valid stat data. 
FSCK: Node (3409), item (13), [18972:1(SD):163616374695f30:18bc1:0]:
broken item found. 
FSCK: Node (3409), item (14), [18972:1(SD):1686f772d746f2d:18d6a:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (3409), item (14), [18972:1(SD):1686f772d746f2d:18d6a:0]: the
slot (1) contains the invalid opset member (compress mode), id (1). 
FSCK: Node (3409), item (14), [18972:1(SD):1686f772d746f2d:18d6a:0]: does
not look like a valid stat data. 
FSCK: Node (3409), item (14), [18972:1(SD):1686f772d746f2d:18d6a:0]:
broken item found. 
FSCK: Node (3409): the node is broken. Pointed from the node (3397), item
(0), unit (0). The whole subtree is skipped. 
FSCK: Node (7616620), item (3), [18973:1(SD):696e666f2d312d:18993:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                
FSCK: Node (7616620), item (3), [18973:1(SD):696e666f2d312d:18993:0]: does
not look like a valid stat data. 
FSCK: Node (7616620), item (3), [18973:1(SD):696e666f2d312d:18993:0]:
broken item found. 
FSCK: Node (7616620): the node is broken. Pointed from the node
(42986087), item (4), unit (0). The whole subtree is skipped. 
FSCK: Node (7616719), item (2), [18974:1(SD):6164732e68746d:1898c:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                
FSCK: Node (7616719), item (2), [18974:1(SD):6164732e68746d:1898c:0]: does
not look like a valid stat data. 
FSCK: Node (7616719), item (2), [18974:1(SD):6164732e68746d:1898c:0]:
broken item found. 
FSCK: Node (7616719), item (3), [18974:1(SD):6164735f303032:18991:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616719), item (3), [18974:1(SD):6164735f303032:18991:0]: does
not look like a valid stat data. 
FSCK: Node (7616719), item (3), [18974:1(SD):6164735f303032:18991:0]:
broken item found. 
FSCK: Node (7616719), item (5), [18974:1(SD):63616374692e70:18985:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616719), item (5), [18974:1(SD):63616374692e70:18985:0]: does
not look like a valid stat data. 
FSCK: Node (7616719), item (5), [18974:1(SD):63616374692e70:18985:0]:
broken item found. 
FSCK: Node (7616719), item (6), [18974:1(SD):657870616e7369:18989:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616719), item (6), [18974:1(SD):657870616e7369:18989:0]: does
not look like a valid stat data. 
FSCK: Node (7616719), item (6), [18974:1(SD):657870616e7369:18989:0]:
broken item found. 
FSCK: Node (7616719): the node is broken. Pointed from the node
(42986087), item (8), unit (0). The whole subtree is skipped. 
FSCK: Node (7616720), item (0), [18974:1(SD):666f72756d735f:1898a:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (0), [18974:1(SD):666f72756d735f:1898a:0]: does
not look like a valid stat data. 
FSCK: Node (7616720), item (0), [18974:1(SD):666f72756d735f:1898a:0]:
broken item found. 
FSCK: Node (7616720), item (1), [18974:1(SD):69636f6e5f6d69:18975:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (1), [18974:1(SD):69636f6e5f6d69:18975:0]: does
not look like a valid stat data. 
FSCK: Node (7616720), item (1), [18974:1(SD):69636f6e5f6d69:18975:0]:
broken item found. 
FSCK: Node (7616720), item (2), [18974:1(SD):69636f6e5f6d69:18977:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (2), [18974:1(SD):69636f6e5f6d69:18977:0]: does
not look like a valid stat data. 
FSCK: Node (7616720), item (2), [18974:1(SD):69636f6e5f6d69:18977:0]:
broken item found. 
FSCK: Node (7616720), item (3), [18974:1(SD):69636f6e5f6d69:18978:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (3), [18974:1(SD):69636f6e5f6d69:18978:0]: does
not look like a valid stat data. 
FSCK: Node (7616720), item (3), [18974:1(SD):69636f6e5f6d69:18978:0]:
broken item found. 
FSCK: Node (7616720), item (4), [18974:1(SD):69636f6e5f6d69:1897a:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (4), [18974:1(SD):69636f6e5f6d69:1897a:0]: does
not look like a valid stat data. 
FSCK: Node (7616720), item (4), [18974:1(SD):69636f6e5f6d69:1897a:0]:
broken item found. 
FSCK: Node (7616720), item (5), [18974:1(SD):69636f6e5f6d69:1897b:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (5), [18974:1(SD):69636f6e5f6d69:1897b:0]: does
not look like a valid stat data. 
FSCK: Node (7616720), item (5), [18974:1(SD):69636f6e5f6d69:1897b:0]:
broken item found. 
FSCK: Node (7616720), item (6), [18974:1(SD):69636f6e5f6d69:18987:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (6), [18974:1(SD):69636f6e5f6d69:18987:0]: does
not look like a valid stat data. 
FSCK: Node (7616720), item (6), [18974:1(SD):69636f6e5f6d69:18987:0]:
broken item found. 
FSCK: Node (7616720), item (7), [18974:1(SD):69636f6e5f6d69:1898b:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (7), [18974:1(SD):69636f6e5f6d69:1898b:0]: does
not look like a valid stat data. 
FSCK: Node (7616720), item (7), [18974:1(SD):69636f6e5f6d69:1898b:0]:
broken item found. 
FSCK: Node (7616720), item (8), [18974:1(SD):69636f6e5f6d69:1898f:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (8), [18974:1(SD):69636f6e5f6d69:1898f:0]: does
not look like a valid stat data. 
FSCK: Node (7616720), item (8), [18974:1(SD):69636f6e5f6d69:1898f:0]:
broken item found. 
FSCK: Node (7616720), item (9), [18974:1(SD):69636f6e5f7175:18988:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (9), [18974:1(SD):69636f6e5f7175:18988:0]: does
not look like a valid stat data. 
FSCK: Node (7616720), item (9), [18974:1(SD):69636f6e5f7175:18988:0]:
broken item found. 
FSCK: Node (7616720), item (10), [18974:1(SD):706f73742e6769:18983:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (10), [18974:1(SD):706f73742e6769:18983:0]:
does not look like a valid stat data. 
FSCK: Node (7616720), item (10), [18974:1(SD):706f73742e6769:18983:0]:
broken item found. 
FSCK: Node (7616720), item (11), [18974:1(SD):7265706c792e67:1897c:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (11), [18974:1(SD):7265706c792e67:1897c:0]:
does not look like a valid stat data. 
FSCK: Node (7616720), item (11), [18974:1(SD):7265706c792e67:1897c:0]:
broken item found. 
FSCK: Node (7616720), item (12), [18974:1(SD):73686f775f6164:1898e:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (12), [18974:1(SD):73686f775f6164:1898e:0]:
does not look like a valid stat data. 
FSCK: Node (7616720), item (12), [18974:1(SD):73686f775f6164:1898e:0]:
broken item found. 
FSCK: Node (7616720), item (13), [18974:1(SD):7370616365722e:18990:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (13), [18974:1(SD):7370616365722e:18990:0]:
does not look like a valid stat data. 
FSCK: Node (7616720), item (13), [18974:1(SD):7370616365722e:18990:0]:
broken item found. 
FSCK: Node (7616720), item (14), [18974:1(SD):7461625f636163:1898d:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (14), [18974:1(SD):7461625f636163:1898d:0]:
does not look like a valid stat data. 
FSCK: Node (7616720), item (14), [18974:1(SD):7461625f636163:1898d:0]:
broken item found. 
FSCK: Node (7616720), item (15), [18974:1(SD):7461625f646f63:18976:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (15), [18974:1(SD):7461625f646f63:18976:0]:
does not look like a valid stat data. 
FSCK: Node (7616720), item (15), [18974:1(SD):7461625f646f63:18976:0]:
broken item found. 
FSCK: Node (7616720), item (16), [18974:1(SD):7461625f666f72:18979:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (16), [18974:1(SD):7461625f666f72:18979:0]:
does not look like a valid stat data. 
FSCK: Node (7616720), item (16), [18974:1(SD):7461625f666f72:18979:0]:
broken item found. 
FSCK: Node (7616720), item (17), [18974:1(SD):7461625f726570:18984:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (17), [18974:1(SD):7461625f726570:18984:0]:
does not look like a valid stat data. 
FSCK: Node (7616720), item (17), [18974:1(SD):7461625f726570:18984:0]:
broken item found. 
FSCK: Node (7616720), item (18), [18974:1(SD):746573745f646f:18986:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616720), item (18), [18974:1(SD):746573745f646f:18986:0]:
does not look like a valid stat data. 
FSCK: Node (7616720), item (18), [18974:1(SD):746573745f646f:18986:0]:
broken item found. 
FSCK: Node (7616720): the node is broken. Pointed from the node
(42986087), item (9), unit (0). The whole subtree is skipped. 
FSCK: Node (7616738), item (3), [1897d:1(SD):6162672d656e2d:18981:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                
FSCK: Node (7616738), item (3), [1897d:1(SD):6162672d656e2d:18981:0]: does
not look like a valid stat data. 
FSCK: Node (7616738), item (3), [1897d:1(SD):6162672d656e2d:18981:0]:
broken item found. 
FSCK: Node (7616738), item (4), [1897d:1(SD):6162672e6a7300:18980:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616738), item (4), [1897d:1(SD):6162672e6a7300:18980:0]: does
not look like a valid stat data. 
FSCK: Node (7616738), item (4), [1897d:1(SD):6162672e6a7300:18980:0]:
broken item found. 
FSCK: Node (7616738), item (5), [1897d:1(SD):67726170686963:18982:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616738), item (5), [1897d:1(SD):67726170686963:18982:0]: does
not look like a valid stat data. 
FSCK: Node (7616738), item (5), [1897d:1(SD):67726170686963:18982:0]:
broken item found. 
FSCK: Node (7616738), item (6), [1897d:1(SD):692e706e670000:1897e:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616738), item (6), [1897d:1(SD):692e706e670000:1897e:0]: does
not look like a valid stat data. 
FSCK: Node (7616738), item (6), [1897d:1(SD):692e706e670000:1897e:0]:
broken item found. 
FSCK: Node (7616738), item (7), [1897d:1(SD):696d6761642e67:1897f:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616738), item (7), [1897d:1(SD):696d6761642e67:1897f:0]: does
not look like a valid stat data. 
FSCK: Node (7616738), item (7), [1897d:1(SD):696d6761642e67:1897f:0]:
broken item found. 
FSCK: Node (7616738): the node is broken. Pointed from the node
(42986087), item (27), unit (0). The whole subtree is skipped. 
FSCK: Node (7616749), item (1), [18994:1(SD):6d616e75616c2e:18995:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                
FSCK: Node (7616749), item (1), [18994:1(SD):6d616e75616c2e:18995:0]: does
not look like a valid stat data. 
FSCK: Node (7616749), item (1), [18994:1(SD):6d616e75616c2e:18995:0]:
broken item found. 
FSCK: Node (7616749), item (4), [189fd:1(SD):16e6f742d72756e:18a1d:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616749), item (4), [189fd:1(SD):16e6f742d72756e:18a1d:0]:
does not look like a valid stat data. 
FSCK: Node (7616749), item (4), [189fd:1(SD):16e6f742d72756e:18a1d:0]:
broken item found. 
FSCK: Node (7616749): the node is broken. Pointed from the node
(42986087), item (38), unit (0). The whole subtree is skipped. 
FSCK: Node (7616883), item (2), [189fe:1(SD):6164732e68746d:18a14:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                
FSCK: Node (7616883), item (2), [189fe:1(SD):6164732e68746d:18a14:0]: does
not look like a valid stat data. 
FSCK: Node (7616883), item (2), [189fe:1(SD):6164732e68746d:18a14:0]:
broken item found. 
FSCK: Node (7616883), item (3), [189fe:1(SD):6164735f303032:18a1c:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616883), item (3), [189fe:1(SD):6164735f303032:18a1c:0]: does
not look like a valid stat data. 
FSCK: Node (7616883), item (3), [189fe:1(SD):6164735f303032:18a1c:0]:
broken item found. 
FSCK: Node (7616883): the node is broken. Pointed from the node
(42993961), item (0), unit (0). The whole subtree is skipped. 
FSCK: Node (7616884), item (0), [189fe:1(SD):63616374692e70:18a0d:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (0), [189fe:1(SD):63616374692e70:18a0d:0]: does
not look like a valid stat data. 
FSCK: Node (7616884), item (0), [189fe:1(SD):63616374692e70:18a0d:0]:
broken item found. 
FSCK: Node (7616884), item (1), [189fe:1(SD):657870616e7369:18a11:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (1), [189fe:1(SD):657870616e7369:18a11:0]: does
not look like a valid stat data. 
FSCK: Node (7616884), item (1), [189fe:1(SD):657870616e7369:18a11:0]:
broken item found. 
FSCK: Node (7616884), item (2), [189fe:1(SD):666f72756d735f:18a12:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (2), [189fe:1(SD):666f72756d735f:18a12:0]: does
not look like a valid stat data. 
FSCK: Node (7616884), item (2), [189fe:1(SD):666f72756d735f:18a12:0]:
broken item found. 
FSCK: Node (7616884), item (3), [189fe:1(SD):69636f6e5f6d69:189ff:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (3), [189fe:1(SD):69636f6e5f6d69:189ff:0]: does
not look like a valid stat data. 
FSCK: Node (7616884), item (3), [189fe:1(SD):69636f6e5f6d69:189ff:0]:
broken item found. 
FSCK: Node (7616884), item (4), [189fe:1(SD):69636f6e5f6d69:18a01:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (4), [189fe:1(SD):69636f6e5f6d69:18a01:0]: does
not look like a valid stat data. 
FSCK: Node (7616884), item (4), [189fe:1(SD):69636f6e5f6d69:18a01:0]:
broken item found. 
FSCK: Node (7616884), item (5), [189fe:1(SD):69636f6e5f6d69:18a02:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (5), [189fe:1(SD):69636f6e5f6d69:18a02:0]: does
not look like a valid stat data. 
FSCK: Node (7616884), item (5), [189fe:1(SD):69636f6e5f6d69:18a02:0]:
broken item found. 
FSCK: Node (7616884), item (6), [189fe:1(SD):69636f6e5f6d69:18a04:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (6), [189fe:1(SD):69636f6e5f6d69:18a04:0]: does
not look like a valid stat data. 
FSCK: Node (7616884), item (6), [189fe:1(SD):69636f6e5f6d69:18a04:0]:
broken item found. 
FSCK: Node (7616884), item (7), [189fe:1(SD):69636f6e5f6d69:18a05:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (7), [189fe:1(SD):69636f6e5f6d69:18a05:0]: does
not look like a valid stat data. 
FSCK: Node (7616884), item (7), [189fe:1(SD):69636f6e5f6d69:18a05:0]:
broken item found. 
FSCK: Node (7616884), item (8), [189fe:1(SD):69636f6e5f6d69:18a0f:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (8), [189fe:1(SD):69636f6e5f6d69:18a0f:0]: does
not look like a valid stat data. 
FSCK: Node (7616884), item (8), [189fe:1(SD):69636f6e5f6d69:18a0f:0]:
broken item found. 
FSCK: Node (7616884), item (9), [189fe:1(SD):69636f6e5f6d69:18a13:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (9), [189fe:1(SD):69636f6e5f6d69:18a13:0]: does
not look like a valid stat data. 
FSCK: Node (7616884), item (9), [189fe:1(SD):69636f6e5f6d69:18a13:0]:
broken item found. 
FSCK: Node (7616884), item (10), [189fe:1(SD):69636f6e5f6d69:18a1a:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (10), [189fe:1(SD):69636f6e5f6d69:18a1a:0]:
does not look like a valid stat data. 
FSCK: Node (7616884), item (10), [189fe:1(SD):69636f6e5f6d69:18a1a:0]:
broken item found. 
FSCK: Node (7616884), item (11), [189fe:1(SD):69636f6e5f7175:18a10:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (11), [189fe:1(SD):69636f6e5f7175:18a10:0]:
does not look like a valid stat data. 
FSCK: Node (7616884), item (11), [189fe:1(SD):69636f6e5f7175:18a10:0]:
broken item found. 
FSCK: Node (7616884), item (12), [189fe:1(SD):706f73742e6769:18a0b:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (12), [189fe:1(SD):706f73742e6769:18a0b:0]:
does not look like a valid stat data. 
FSCK: Node (7616884), item (12), [189fe:1(SD):706f73742e6769:18a0b:0]:
broken item found. 
FSCK: Node (7616884), item (13), [189fe:1(SD):7265706c792e67:18a06:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (13), [189fe:1(SD):7265706c792e67:18a06:0]:
does not look like a valid stat data. 
FSCK: Node (7616884), item (13), [189fe:1(SD):7265706c792e67:18a06:0]:
broken item found. 
FSCK: Node (7616884), item (14), [189fe:1(SD):73686f775f6164:18a19:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (14), [189fe:1(SD):73686f775f6164:18a19:0]:
does not look like a valid stat data. 
FSCK: Node (7616884), item (14), [189fe:1(SD):73686f775f6164:18a19:0]:
broken item found. 
FSCK: Node (7616884), item (15), [189fe:1(SD):7370616365722e:18a1b:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (15), [189fe:1(SD):7370616365722e:18a1b:0]:
does not look like a valid stat data. 
FSCK: Node (7616884), item (15), [189fe:1(SD):7370616365722e:18a1b:0]:
broken item found. 
FSCK: Node (7616884), item (16), [189fe:1(SD):7461625f636163:18a18:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (16), [189fe:1(SD):7461625f636163:18a18:0]:
does not look like a valid stat data. 
FSCK: Node (7616884), item (16), [189fe:1(SD):7461625f636163:18a18:0]:
broken item found. 
FSCK: Node (7616884), item (17), [189fe:1(SD):7461625f646f63:18a00:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (17), [189fe:1(SD):7461625f646f63:18a00:0]:
does not look like a valid stat data. 
FSCK: Node (7616884), item (17), [189fe:1(SD):7461625f646f63:18a00:0]:
broken item found. 
FSCK: Node (7616884), item (18), [189fe:1(SD):7461625f666f72:18a03:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (18), [189fe:1(SD):7461625f666f72:18a03:0]:
does not look like a valid stat data. 
FSCK: Node (7616884), item (18), [189fe:1(SD):7461625f666f72:18a03:0]:
broken item found. 
FSCK: Node (7616884), item (19), [189fe:1(SD):7461625f726570:18a0c:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (19), [189fe:1(SD):7461625f726570:18a0c:0]:
does not look like a valid stat data. 
FSCK: Node (7616884), item (19), [189fe:1(SD):7461625f726570:18a0c:0]:
broken item found. 
FSCK: Node (7616884), item (20), [189fe:1(SD):746573745f646f:18a0e:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616884), item (20), [189fe:1(SD):746573745f646f:18a0e:0]:
does not look like a valid stat data. 
FSCK: Node (7616884), item (20), [189fe:1(SD):746573745f646f:18a0e:0]:
broken item found. 
FSCK: Node (7616884): the node is broken. Pointed from the node
(42993961), item (1), unit (0). The whole subtree is skipped. 
FSCK: Node (7616904), item (4), [18a07:1(SD):6162672e6a7300:18a0a:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                
FSCK: Node (7616904), item (4), [18a07:1(SD):6162672e6a7300:18a0a:0]: does
not look like a valid stat data. 
FSCK: Node (7616904), item (4), [18a07:1(SD):6162672e6a7300:18a0a:0]:
broken item found. 
FSCK: Node (7616904), item (5), [18a07:1(SD):692e706e670000:18a08:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616904), item (5), [18a07:1(SD):692e706e670000:18a08:0]: does
not look like a valid stat data. 
FSCK: Node (7616904), item (5), [18a07:1(SD):692e706e670000:18a08:0]:
broken item found. 
FSCK: Node (7616904), item (6), [18a07:1(SD):696d6761642e67:18a09:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616904), item (6), [18a07:1(SD):696d6761642e67:18a09:0]: does
not look like a valid stat data. 
FSCK: Node (7616904), item (6), [18a07:1(SD):696d6761642e67:18a09:0]:
broken item found. 
FSCK: Node (7616904): the node is broken. Pointed from the node
(42993996), item (14), unit (0). The whole subtree is skipped. 
FSCK: Node (7616911), item (2), [18a15:1(SD):6162672d656e2d:18a16:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                
FSCK: Node (7616911), item (2), [18a15:1(SD):6162672d656e2d:18a16:0]: does
not look like a valid stat data. 
FSCK: Node (7616911), item (2), [18a15:1(SD):6162672d656e2d:18a16:0]:
broken item found. 
FSCK: Node (7616911), item (3), [18a15:1(SD):67726170686963:18a17:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7616911), item (3), [18a15:1(SD):67726170686963:18a17:0]: does
not look like a valid stat data. 
FSCK: Node (7616911), item (3), [18a15:1(SD):67726170686963:18a17:0]:
broken item found. 
FSCK: Node (7616911): the node is broken. Pointed from the node
(42993996), item (21), unit (0). The whole subtree is skipped. 
FSCK: Node (7617944), item (2), [18c91:1(SD):43616374694172:18cd5:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                
FSCK: Node (7617944), item (2), [18c91:1(SD):43616374694172:18cd5:0]: does
not look like a valid stat data. 
FSCK: Node (7617944), item (2), [18c91:1(SD):43616374694172:18cd5:0]:
broken item found. 
FSCK: Node (7617944), item (3), [18c91:1(SD):43616374694172:18cd6:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7617944), item (3), [18c91:1(SD):43616374694172:18cd6:0]: does
not look like a valid stat data. 
FSCK: Node (7617944), item (3), [18c91:1(SD):43616374694172:18cd6:0]:
broken item found. 
FSCK: Node (7617944): the node is broken. Pointed from the node (7617820),
item (0), unit (0). The whole subtree is skipped. 
FSCK: Node (7618814), item (0), [18c92:1(SD):6164732e68746d:18ca7:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                
FSCK: Node (7618814), item (0), [18c92:1(SD):6164732e68746d:18ca7:0]: does
not look like a valid stat data. 
FSCK: Node (7618814), item (0), [18c92:1(SD):6164732e68746d:18ca7:0]:
broken item found. 
FSCK: Node (7618814), item (1), [18c92:1(SD):6164735f303032:18cb3:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (1), [18c92:1(SD):6164735f303032:18cb3:0]: does
not look like a valid stat data. 
FSCK: Node (7618814), item (1), [18c92:1(SD):6164735f303032:18cb3:0]:
broken item found. 
FSCK: Node (7618814), item (4), [18c92:1(SD):63616374692e70:18ca0:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (4), [18c92:1(SD):63616374692e70:18ca0:0]: does
not look like a valid stat data. 
FSCK: Node (7618814), item (4), [18c92:1(SD):63616374692e70:18ca0:0]:
broken item found. 
FSCK: Node (7618814), item (5), [18c92:1(SD):657870616e7369:18ca4:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (5), [18c92:1(SD):657870616e7369:18ca4:0]: does
not look like a valid stat data. 
FSCK: Node (7618814), item (5), [18c92:1(SD):657870616e7369:18ca4:0]:
broken item found. 
FSCK: Node (7618814), item (6), [18c92:1(SD):666f72756d735f:18ca5:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (6), [18c92:1(SD):666f72756d735f:18ca5:0]: does
not look like a valid stat data. 
FSCK: Node (7618814), item (6), [18c92:1(SD):666f72756d735f:18ca5:0]:
broken item found. 
FSCK: Node (7618814), item (7), [18c92:1(SD):69636f6e5f6269:18c93:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (7), [18c92:1(SD):69636f6e5f6269:18c93:0]: does
not look like a valid stat data. 
FSCK: Node (7618814), item (7), [18c92:1(SD):69636f6e5f6269:18c93:0]:
broken item found. 
FSCK: Node (7618814), item (8), [18c92:1(SD):69636f6e5f6d69:18c94:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (8), [18c92:1(SD):69636f6e5f6d69:18c94:0]: does
not look like a valid stat data. 
FSCK: Node (7618814), item (8), [18c92:1(SD):69636f6e5f6d69:18c94:0]:
broken item found. 
FSCK: Node (7618814), item (9), [18c92:1(SD):69636f6e5f6d69:18c96:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (9), [18c92:1(SD):69636f6e5f6d69:18c96:0]: does
not look like a valid stat data. 
FSCK: Node (7618814), item (9), [18c92:1(SD):69636f6e5f6d69:18c96:0]:
broken item found. 
FSCK: Node (7618814), item (10), [18c92:1(SD):69636f6e5f6d69:18c97:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (10), [18c92:1(SD):69636f6e5f6d69:18c97:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (10), [18c92:1(SD):69636f6e5f6d69:18c97:0]:
broken item found. 
FSCK: Node (7618814), item (11), [18c92:1(SD):69636f6e5f6d69:18c99:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (11), [18c92:1(SD):69636f6e5f6d69:18c99:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (11), [18c92:1(SD):69636f6e5f6d69:18c99:0]:
broken item found. 
FSCK: Node (7618814), item (12), [18c92:1(SD):69636f6e5f6d69:18c9a:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (12), [18c92:1(SD):69636f6e5f6d69:18c9a:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (12), [18c92:1(SD):69636f6e5f6d69:18c9a:0]:
broken item found. 
FSCK: Node (7618814), item (13), [18c92:1(SD):69636f6e5f6d69:18ca2:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (13), [18c92:1(SD):69636f6e5f6d69:18ca2:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (13), [18c92:1(SD):69636f6e5f6d69:18ca2:0]:
broken item found. 
FSCK: Node (7618814), item (14), [18c92:1(SD):69636f6e5f6d69:18ca6:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (14), [18c92:1(SD):69636f6e5f6d69:18ca6:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (14), [18c92:1(SD):69636f6e5f6d69:18ca6:0]:
broken item found. 
FSCK: Node (7618814), item (15), [18c92:1(SD):69636f6e5f6d69:18cb1:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (15), [18c92:1(SD):69636f6e5f6d69:18cb1:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (15), [18c92:1(SD):69636f6e5f6d69:18cb1:0]:
broken item found. 
FSCK: Node (7618814), item (16), [18c92:1(SD):69636f6e5f7175:18ca3:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (16), [18c92:1(SD):69636f6e5f7175:18ca3:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (16), [18c92:1(SD):69636f6e5f7175:18ca3:0]:
broken item found. 
FSCK: Node (7618814), item (17), [18c92:1(SD):69636f6e5f736d:18caf:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (17), [18c92:1(SD):69636f6e5f736d:18caf:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (17), [18c92:1(SD):69636f6e5f736d:18caf:0]:
broken item found. 
FSCK: Node (7618814), item (18), [18c92:1(SD):706f73742e6769:18c9e:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (18), [18c92:1(SD):706f73742e6769:18c9e:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (18), [18c92:1(SD):706f73742e6769:18c9e:0]:
broken item found. 
FSCK: Node (7618814), item (19), [18c92:1(SD):7265706c792e67:18c9b:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (19), [18c92:1(SD):7265706c792e67:18c9b:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (19), [18c92:1(SD):7265706c792e67:18c9b:0]:
broken item found. 
FSCK: Node (7618814), item (20), [18c92:1(SD):73686f775f6164:18cb0:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (20), [18c92:1(SD):73686f775f6164:18cb0:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (20), [18c92:1(SD):73686f775f6164:18cb0:0]:
broken item found. 
FSCK: Node (7618814), item (21), [18c92:1(SD):7370616365722e:18cb2:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (21), [18c92:1(SD):7370616365722e:18cb2:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (21), [18c92:1(SD):7370616365722e:18cb2:0]:
broken item found. 
FSCK: Node (7618814), item (22), [18c92:1(SD):7461625f636163:18cae:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (22), [18c92:1(SD):7461625f636163:18cae:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (22), [18c92:1(SD):7461625f636163:18cae:0]:
broken item found. 
FSCK: Node (7618814), item (23), [18c92:1(SD):7461625f646f63:18c95:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (23), [18c92:1(SD):7461625f646f63:18c95:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (23), [18c92:1(SD):7461625f646f63:18c95:0]:
broken item found. 
FSCK: Node (7618814), item (24), [18c92:1(SD):7461625f666f72:18c98:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (24), [18c92:1(SD):7461625f666f72:18c98:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (24), [18c92:1(SD):7461625f666f72:18c98:0]:
broken item found. 
FSCK: Node (7618814), item (25), [18c92:1(SD):7461625f726570:18c9f:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (25), [18c92:1(SD):7461625f726570:18c9f:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (25), [18c92:1(SD):7461625f726570:18c9f:0]:
broken item found. 
FSCK: Node (7618814), item (26), [18c92:1(SD):746573745f646f:18ca1:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618814), item (26), [18c92:1(SD):746573745f646f:18ca1:0]:
does not look like a valid stat data. 
FSCK: Node (7618814), item (26), [18c92:1(SD):746573745f646f:18ca1:0]:
broken item found. 
FSCK: Node (7618814): the node is broken. Pointed from the node (7617820),
item (7), unit (0). The whole subtree is skipped. 
FSCK: Node (7618832), item (8), [18c9c:1(SD):696d6761642e67:18c9d:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                
FSCK: Node (7618832), item (8), [18c9c:1(SD):696d6761642e67:18c9d:0]: does
not look like a valid stat data. 
FSCK: Node (7618832), item (8), [18c9c:1(SD):696d6761642e67:18c9d:0]:
broken item found. 
FSCK: Node (7618832): the node is broken. Pointed from the node (7617820),
item (25), unit (0). The whole subtree is skipped. 
FSCK: Node (7618840), item (2), [18ca8:1(SD):6162672d656e2d:18cac:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                
FSCK: Node (7618840), item (2), [18ca8:1(SD):6162672d656e2d:18cac:0]: does
not look like a valid stat data. 
FSCK: Node (7618840), item (2), [18ca8:1(SD):6162672d656e2d:18cac:0]:
broken item found. 
FSCK: Node (7618840), item (3), [18ca8:1(SD):6162672e6a7300:18cab:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618840), item (3), [18ca8:1(SD):6162672e6a7300:18cab:0]: does
not look like a valid stat data. 
FSCK: Node (7618840), item (3), [18ca8:1(SD):6162672e6a7300:18cab:0]:
broken item found. 
FSCK: Node (7618840), item (4), [18ca8:1(SD):67726170686963:18cad:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618840), item (4), [18ca8:1(SD):67726170686963:18cad:0]: does
not look like a valid stat data. 
FSCK: Node (7618840), item (4), [18ca8:1(SD):67726170686963:18cad:0]:
broken item found. 
FSCK: Node (7618840), item (5), [18ca8:1(SD):692e706e670000:18ca9:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618840), item (5), [18ca8:1(SD):692e706e670000:18ca9:0]: does
not look like a valid stat data. 
FSCK: Node (7618840), item (5), [18ca8:1(SD):692e706e670000:18ca9:0]:
broken item found. 
FSCK: Node (7618840), item (6), [18ca8:1(SD):696d6761642e67:18caa:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618840), item (6), [18ca8:1(SD):696d6761642e67:18caa:0]: does
not look like a valid stat data. 
FSCK: Node (7618840), item (6), [18ca8:1(SD):696d6761642e67:18caa:0]:
broken item found. 
FSCK: Node (7618840): the node is broken. Pointed from the node (7617820),
item (33), unit (0). The whole subtree is skipped. 
FSCK: Node (7618846), item (1), [18cb4:1(SD):6164732e68746d:18cc8:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                
FSCK: Node (7618846), item (1), [18cb4:1(SD):6164732e68746d:18cc8:0]: does
not look like a valid stat data. 
FSCK: Node (7618846), item (1), [18cb4:1(SD):6164732e68746d:18cc8:0]:
broken item found. 
FSCK: Node (7618846), item (2), [18cb4:1(SD):6164735f303032:18cd4:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (2), [18cb4:1(SD):6164735f303032:18cd4:0]: does
not look like a valid stat data. 
FSCK: Node (7618846), item (2), [18cb4:1(SD):6164735f303032:18cd4:0]:
broken item found. 
FSCK: Node (7618846), item (5), [18cb4:1(SD):63616374692e70:18cc1:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (5), [18cb4:1(SD):63616374692e70:18cc1:0]: does
not look like a valid stat data. 
FSCK: Node (7618846), item (5), [18cb4:1(SD):63616374692e70:18cc1:0]:
broken item found. 
FSCK: Node (7618846), item (6), [18cb4:1(SD):657870616e7369:18cc5:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (6), [18cb4:1(SD):657870616e7369:18cc5:0]: does
not look like a valid stat data. 
FSCK: Node (7618846), item (6), [18cb4:1(SD):657870616e7369:18cc5:0]:
broken item found. 
FSCK: Node (7618846), item (7), [18cb4:1(SD):666f72756d735f:18cc6:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (7), [18cb4:1(SD):666f72756d735f:18cc6:0]: does
not look like a valid stat data. 
FSCK: Node (7618846), item (7), [18cb4:1(SD):666f72756d735f:18cc6:0]:
broken item found. 
FSCK: Node (7618846), item (8), [18cb4:1(SD):69636f6e5f6d69:18cb5:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (8), [18cb4:1(SD):69636f6e5f6d69:18cb5:0]: does
not look like a valid stat data. 
FSCK: Node (7618846), item (8), [18cb4:1(SD):69636f6e5f6d69:18cb5:0]:
broken item found. 
FSCK: Node (7618846), item (9), [18cb4:1(SD):69636f6e5f6d69:18cb7:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (9), [18cb4:1(SD):69636f6e5f6d69:18cb7:0]: does
not look like a valid stat data. 
FSCK: Node (7618846), item (9), [18cb4:1(SD):69636f6e5f6d69:18cb7:0]:
broken item found. 
FSCK: Node (7618846), item (10), [18cb4:1(SD):69636f6e5f6d69:18cb8:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (10), [18cb4:1(SD):69636f6e5f6d69:18cb8:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (10), [18cb4:1(SD):69636f6e5f6d69:18cb8:0]:
broken item found. 
FSCK: Node (7618846), item (11), [18cb4:1(SD):69636f6e5f6d69:18cba:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (11), [18cb4:1(SD):69636f6e5f6d69:18cba:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (11), [18cb4:1(SD):69636f6e5f6d69:18cba:0]:
broken item found. 
FSCK: Node (7618846), item (12), [18cb4:1(SD):69636f6e5f6d69:18cbb:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (12), [18cb4:1(SD):69636f6e5f6d69:18cbb:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (12), [18cb4:1(SD):69636f6e5f6d69:18cbb:0]:
broken item found. 
FSCK: Node (7618846), item (13), [18cb4:1(SD):69636f6e5f6d69:18cc3:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (13), [18cb4:1(SD):69636f6e5f6d69:18cc3:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (13), [18cb4:1(SD):69636f6e5f6d69:18cc3:0]:
broken item found. 
FSCK: Node (7618846), item (14), [18cb4:1(SD):69636f6e5f6d69:18cc7:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (14), [18cb4:1(SD):69636f6e5f6d69:18cc7:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (14), [18cb4:1(SD):69636f6e5f6d69:18cc7:0]:
broken item found. 
FSCK: Node (7618846), item (15), [18cb4:1(SD):69636f6e5f6d69:18cd2:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (15), [18cb4:1(SD):69636f6e5f6d69:18cd2:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (15), [18cb4:1(SD):69636f6e5f6d69:18cd2:0]:
broken item found. 
FSCK: Node (7618846), item (16), [18cb4:1(SD):69636f6e5f7175:18cc4:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (16), [18cb4:1(SD):69636f6e5f7175:18cc4:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (16), [18cb4:1(SD):69636f6e5f7175:18cc4:0]:
broken item found. 
FSCK: Node (7618846), item (17), [18cb4:1(SD):69636f6e5f736d:18cd0:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (17), [18cb4:1(SD):69636f6e5f736d:18cd0:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (17), [18cb4:1(SD):69636f6e5f736d:18cd0:0]:
broken item found. 
FSCK: Node (7618846), item (18), [18cb4:1(SD):706f73742e6769:18cbf:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (18), [18cb4:1(SD):706f73742e6769:18cbf:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (18), [18cb4:1(SD):706f73742e6769:18cbf:0]:
broken item found. 
FSCK: Node (7618846), item (19), [18cb4:1(SD):7265706c792e67:18cbc:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (19), [18cb4:1(SD):7265706c792e67:18cbc:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (19), [18cb4:1(SD):7265706c792e67:18cbc:0]:
broken item found. 
FSCK: Node (7618846), item (20), [18cb4:1(SD):73686f775f6164:18cd1:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (20), [18cb4:1(SD):73686f775f6164:18cd1:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (20), [18cb4:1(SD):73686f775f6164:18cd1:0]:
broken item found. 
FSCK: Node (7618846), item (21), [18cb4:1(SD):7370616365722e:18cd3:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (21), [18cb4:1(SD):7370616365722e:18cd3:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (21), [18cb4:1(SD):7370616365722e:18cd3:0]:
broken item found. 
FSCK: Node (7618846), item (22), [18cb4:1(SD):7461625f636163:18ccf:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (22), [18cb4:1(SD):7461625f636163:18ccf:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (22), [18cb4:1(SD):7461625f636163:18ccf:0]:
broken item found. 
FSCK: Node (7618846), item (23), [18cb4:1(SD):7461625f646f63:18cb6:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (23), [18cb4:1(SD):7461625f646f63:18cb6:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (23), [18cb4:1(SD):7461625f646f63:18cb6:0]:
broken item found. 
FSCK: Node (7618846), item (24), [18cb4:1(SD):7461625f666f72:18cb9:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (24), [18cb4:1(SD):7461625f666f72:18cb9:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (24), [18cb4:1(SD):7461625f666f72:18cb9:0]:
broken item found. 
FSCK: Node (7618846), item (25), [18cb4:1(SD):7461625f726570:18cc0:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (25), [18cb4:1(SD):7461625f726570:18cc0:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (25), [18cb4:1(SD):7461625f726570:18cc0:0]:
broken item found. 
FSCK: Node (7618846), item (26), [18cb4:1(SD):746573745f646f:18cc2:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618846), item (26), [18cb4:1(SD):746573745f646f:18cc2:0]:
does not look like a valid stat data. 
FSCK: Node (7618846), item (26), [18cb4:1(SD):746573745f646f:18cc2:0]:
broken item found. 
FSCK: Node (7618846): the node is broken. Pointed from the node (7617820),
item (39), unit (0). The whole subtree is skipped. 
FSCK: Node (7618864), item (6), [18cbd:1(SD):696d6761642e6a:18cbe:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                
FSCK: Node (7618864), item (6), [18cbd:1(SD):696d6761642e6a:18cbe:0]: does
not look like a valid stat data. 
FSCK: Node (7618864), item (6), [18cbd:1(SD):696d6761642e6a:18cbe:0]:
broken item found. 
FSCK: Node (7618864): the node is broken. Pointed from the node (7617820),
item (57), unit (0). The whole subtree is skipped. 
FSCK: Node (7618870), item (1), [18cc9:1(SD):6162672d656e2d:18ccd:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                
FSCK: Node (7618870), item (1), [18cc9:1(SD):6162672d656e2d:18ccd:0]: does
not look like a valid stat data. 
FSCK: Node (7618870), item (1), [18cc9:1(SD):6162672d656e2d:18ccd:0]:
broken item found. 
FSCK: Node (7618870), item (2), [18cc9:1(SD):6162672e6a7300:18ccc:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618870), item (2), [18cc9:1(SD):6162672e6a7300:18ccc:0]: does
not look like a valid stat data. 
FSCK: Node (7618870), item (2), [18cc9:1(SD):6162672e6a7300:18ccc:0]:
broken item found. 
FSCK: Node (7618870), item (3), [18cc9:1(SD):67726170686963:18cce:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618870), item (3), [18cc9:1(SD):67726170686963:18cce:0]: does
not look like a valid stat data. 
FSCK: Node (7618870), item (3), [18cc9:1(SD):67726170686963:18cce:0]:
broken item found. 
FSCK: Node (7618870), item (4), [18cc9:1(SD):692e706e670000:18cca:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618870), item (4), [18cc9:1(SD):692e706e670000:18cca:0]: does
not look like a valid stat data. 
FSCK: Node (7618870), item (4), [18cc9:1(SD):692e706e670000:18cca:0]:
broken item found. 
FSCK: Node (7618870), item (5), [18cc9:1(SD):696d6761642e67:18ccb:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7618870), item (5), [18cc9:1(SD):696d6761642e67:18ccb:0]: does
not look like a valid stat data. 
FSCK: Node (7618870), item (5), [18cc9:1(SD):696d6761642e67:18ccb:0]:
broken item found. 
FSCK: Node (7618870): the node is broken. Pointed from the node (7617821),
item (3), unit (0). The whole subtree is skipped. 
FSCK: Node (7788894), item (1), [19af4:1(SD):2e646972656374:19ce2:0]: the
slot (0) contains the invalid opset member (object), id (4).               
                
FSCK: Node (7788894), item (1), [19af4:1(SD):2e646972656374:19ce2:0]: does
not look like a valid stat data. 
FSCK: Node (7788894), item (1), [19af4:1(SD):2e646972656374:19ce2:0]:
broken item found. 
FSCK: Node (7788894), item (2), [19af4:1(SD):414d4420426f78:19cc7:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7788894), item (2), [19af4:1(SD):414d4420426f78:19cc7:0]: does
not look like a valid stat data. 
FSCK: Node (7788894), item (2), [19af4:1(SD):414d4420426f78:19cc7:0]:
broken item found. 
FSCK: Node (7788894), item (5), [19af4:1(SD):637134302d6865:19cc5:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7788894), item (5), [19af4:1(SD):637134302d6865:19cc5:0]: does
not look like a valid stat data. 
FSCK: Node (7788894), item (5), [19af4:1(SD):637134302d6865:19cc5:0]:
broken item found. 
FSCK: Node (7788894), item (7), [19af4:1(SD):637134302d6865:19ce3:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7788894), item (7), [19af4:1(SD):637134302d6865:19ce3:0]: does
not look like a valid stat data. 
FSCK: Node (7788894), item (7), [19af4:1(SD):637134302d6865:19ce3:0]:
broken item found. 
FSCK: Node (7788894), item (10), [19af4:1(SD):6c696e75782d63:19d3e:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7788894), item (10), [19af4:1(SD):6c696e75782d63:19d3e:0]:
does not look like a valid stat data. 
FSCK: Node (7788894), item (10), [19af4:1(SD):6c696e75782d63:19d3e:0]:
broken item found. 
FSCK: Node (7788894), item (12), [19af4:1(SD):75672d77696e37:19cde:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7788894), item (12), [19af4:1(SD):75672d77696e37:19cde:0]:
does not look like a valid stat data. 
FSCK: Node (7788894), item (12), [19af4:1(SD):75672d77696e37:19cde:0]:
broken item found. 
FSCK: Node (7788894), item (13), [19af4:1(SD):75672d77696e37:19d60:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7788894), item (13), [19af4:1(SD):75672d77696e37:19d60:0]:
does not look like a valid stat data. 
FSCK: Node (7788894), item (13), [19af4:1(SD):75672d77696e37:19d60:0]:
broken item found. 
FSCK: Node (7788894), item (15), [19af4:1(SD):77696e3775672d:19d3f:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (7788894), item (15), [19af4:1(SD):77696e3775672d:19d3f:0]:
does not look like a valid stat data. 
FSCK: Node (7788894), item (15), [19af4:1(SD):77696e3775672d:19d3f:0]:
broken item found. 
FSCK: Node (7788894): the node is broken. Pointed from the node (7775473),
item (6), unit (0). The whole subtree is skipped. 
FSCK: Node (33278719), item (2), [19af5:1(SD):435134302d3531:19cbf:0]: the
slot (0) contains the invalid opset member (object), id (4).               
               
FSCK: Node (33278719), item (2), [19af5:1(SD):435134302d3531:19cbf:0]:
does not look like a valid stat data. 
FSCK: Node (33278719), item (2), [19af5:1(SD):435134302d3531:19cbf:0]:
broken item found. 
FSCK: Node (33278719), item (3), [19af5:1(SD):6163636573732d:19b49:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (33278719), item (3), [19af5:1(SD):6163636573732d:19b49:0]:
does not look like a valid stat data. 
FSCK: Node (33278719), item (3), [19af5:1(SD):6163636573732d:19b49:0]:
broken item found. 
FSCK: Node (33278719), item (5), [19af5:1(SD):62696f73206163:19cc4:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (33278719), item (5), [19af5:1(SD):62696f73206163:19cc4:0]:
does not look like a valid stat data. 
FSCK: Node (33278719), item (5), [19af5:1(SD):62696f73206163:19cc4:0]:
broken item found. 
FSCK: Node (33278719), item (6), [19af5:1(SD):636f6d7061712d:19af6:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (33278719), item (6), [19af5:1(SD):636f6d7061712d:19af6:0]: the
slot (1) contains the invalid opset member (compress mode), id (1). 
FSCK: Node (33278719), item (6), [19af5:1(SD):636f6d7061712d:19af6:0]:
does not look like a valid stat data. 
FSCK: Node (33278719), item (6), [19af5:1(SD):636f6d7061712d:19af6:0]:
broken item found. 
FSCK: Node (33278719), item (9), [19af5:1(SD):6877696e666f2e:19c0a:0]: the
slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (33278719), item (9), [19af5:1(SD):6877696e666f2e:19c0a:0]: the
slot (1) contains the invalid opset member (compress mode), id (1). 
FSCK: Node (33278719), item (9), [19af5:1(SD):6877696e666f2e:19c0a:0]:
does not look like a valid stat data. 
FSCK: Node (33278719), item (9), [19af5:1(SD):6877696e666f2e:19c0a:0]:
broken item found. 
FSCK: Node (33278719), item (12), [19af5:1(SD):6d656d6f72792d:19c0b:0]:
the slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (33278719), item (12), [19af5:1(SD):6d656d6f72792d:19c0b:0]:
does not look like a valid stat data. 
FSCK: Node (33278719), item (12), [19af5:1(SD):6d656d6f72792d:19c0b:0]:
broken item found. 
FSCK: Node (33278719), item (13), [19af5:1(SD):6d656d6f72792d:19c0c:0]:
the slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (33278719), item (13), [19af5:1(SD):6d656d6f72792d:19c0c:0]:
does not look like a valid stat data. 
FSCK: Node (33278719), item (13), [19af5:1(SD):6d656d6f72792d:19c0c:0]:
broken item found. 
FSCK: Node (33278719), item (14), [19af5:1(SD):7365617263682e:19c6e:0]:
the slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (33278719), item (14), [19af5:1(SD):7365617263682e:19c6e:0]:
the slot (1) contains the invalid opset member (compress mode), id (1). 
FSCK: Node (33278719), item (14), [19af5:1(SD):7365617263682e:19c6e:0]:
does not look like a valid stat data. 
FSCK: Node (33278719), item (14), [19af5:1(SD):7365617263682e:19c6e:0]:
broken item found. 
FSCK: Node (33278719), item (16), [19af5:1(SD):737570706f7274:19cc3:0]:
the slot (0) contains the invalid opset member (object), id (4). 
FSCK: Node (33278719), item (16), [19af5:1(SD):737570706f7274:19cc3:0]:
does not look like a valid stat data. 
FSCK: Node (33278719), item (16), [19af5:1(SD):737570706f7274:19cc3:0]:
broken item found. 
FSCK: Node (33278719): the node is broken. Pointed from the node
(7775474), item (2), unit (0). The whole subtree is skipped. 

#Other detail
# fdisk -l

Disk /dev/sdb: 2000.4 GB, 2000398934016 bytes, 3907029168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


