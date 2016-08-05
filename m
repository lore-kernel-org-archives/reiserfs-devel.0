From: <doiggl@velocitynet.com.au>
Subject: list file-names and used-blocks from Reiser 4 meta data
Date: Fri, 05 Aug 2016 13:41:04 +1000
Message-ID: <21ff1fa694fe608753fe70fb52b2a447@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,

From Reiser 4 meta-data -
- Is it possible to list out file-names and used data blocks for each
file-name ?
- can file-name and used data blocks be copied to another partition and
saved. ?
- If so, has anyone got some code to do that ?

[dir location and file-name]
[used data block numbers for file-name]
example:

dirx/filename-a 
19577
195778
1959

dirx/filename-b
9571
957782
9593
9

dirx/filename-c
8
5
3
4
20

I could load that into database and check there are no same 'used block
number' for two different file-names.
Thanks
--Glenn

# measurefs.reiser4 -p -l  -f /dev/sdb                                    
                                                                          
 
measurefs.reiser4 1.1.0                                                   
                                                                          
      
Format release: 4.0.1                                                     
                                                                          
      
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING.                                                      
                    
                                                                          
                                                                          
        
Default profile:                                                          
                                                                          
         
create:          "ccreg40"         (id:0x4 type:0x0)    [Regular file
plugin for creat(2)]                                                       
              
key:             "key_large"       (id:0x1 type:0xb)    [Key plugin]      
                                                                          
          
node:            "node40"          (id:0x0 type:0x2)    [Node plugin]     
                                                                          
          
compress:        "lzo1"            (id:0x0 type:0xc)    [Compression
plugin]                                                                    
                 
compressMode:    "conv"            (id:0x4 type:0xd)    [Compression Mode
plugin]                                                                    
             
cluster:         "64K"             (id:0x0 type:0x10)   [Cluster plugin]  
                                                                          
            
hash:            "r5_hash"         (id:0x1 type:0x3)    [Directory entry
hash plugin]                                                               
                
fibration:       "ext_1_fibre"     (id:0x2 type:0x4)    [Key fibration
plugin]                                                                    
                  
formatting:      "smart"           (id:0x2 type:0x5)    [File body
formatting plugin]                                                         
                        
.
.
Tree statistics ... done                                                  
                                                                          
      
Packing statistics:                                                       
                                                                          
    
  Formatted nodes:    4094.45b (99.96%)
  Branch nodes:       3991.65b (97.45%)
  Twig nodes:         4069.33b (99.35%)
  Leaf nodes:         4094.60b (99.97%)

Node statistics:
  Total nodes:      195776841
  Formatted nodes:  169084618
  Unformatted nodes: 26692223
  Branch nodes:         22346
  Twig nodes:         1903127
  Leaf nodes:       193851368

Item statistics:
  Total items:      350921825
  Nodeptr items:    169084617
  Statdata items:      41164
  Direntry items:        3723
  Tail items:               0
  Extent items:         25724

