From: yurick@oblik.dp.ua
Subject: reiserfsck --rebuild-tree fails
Date: Mon, 08 Jul 2002 14:23:16 +0300
Message-ID: <E17RWbs-0003yZ-00@oblik.dp.ua>
Return-path: <reiserfs-list-return-10922-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

        Hi!                                                          
   I have a 3.5 reiser partition, which I tried to fix by
reiserfsck ( --check, --fix-fixable, --rebuild-tree). I used
latest stable (3.x.1b) and also latest "pre" (3.x.1c-pre7) versions.
   They are fails to complete, so I can't mount my broken partitions
now :(.
	Output (last part) from reiserfsck 3.x.1c-pre7 is placed below.
Output from 3.x.1b is similar. Sorry for messed formatting - I grabbed
it by hand.
--------------------------------------------------------------------
reiserfsck --rebuild-tree /dev/hda8
--------------------------------------------------------------------
reiserfsck --rebuild-tree started at Mon Jul  8 16:58:19 2002
###########

   Pass 0:
   ####### Pass 0 #######
   Loading on-disk bitmap .. ok, 442177 blocks marked used
   Skipping 8246 blocks (super block, journal, bitmaps) 433931 blocks will be re
ad 0%....20%....40%....60%....80%....100%                        left 0, 6111 /s
ec "r5" got 83718 hits
           "r5" hash is selected
   Flushing..done
           Read blocks (but not data blocks) 433931
                   Leaves among those 21882
                   Objectids found 83159

   Pass 1 (will try to insert 21882 leaves):
   ####### Pass 1 #######
   Looking for allocable blocks ..
   find_allocable_blocks: bad and good unformatted

	
   Aborted

   bash# cat /dev/vcsa0 > fix.log
--------------------------------------------------------------------


--------------------------------------------------------------------
reiserfsck --rebuild-tree -q /dev/hda8
--------------------------------------------------------------------
   Pass 0:                                                                      
   ####### Pass 0 #######                                                       
   Loading on-disk bitmap .. ok, 442177 blocks marked used                      
   Skipping 8246 blocks (super block, journal, bitmaps) 433931 blocks will be re
ad 0%....20%....40%....60%....80%....100%                                       
   "r5" got 83718 hits                                                          
           "r5" hash is selected                                                
   Flushing..done                                                               
           Read blocks (but not data blocks) 433931                             
                   Leaves among those 21881                                     
                   Objectids found 83133                                        

   Pass 1 (will try to insert 21881 leaves):                                    
   ####### Pass 1 #######                                                       
   Looking for allocable blocks .. ok                                           
   0%.build_the_tree: nothing but leaves are expected. Block 9938 - ??          
   ...20%....40%....                                                            
   mark_block_used: (448579) used already                                       

	
   Aborted                                                                      

   bash# cat /dev/vcsa0 > fixq.log                                              
--------------------------------------------------------------------

p.s. This box is running under 2.4.19pre9aa2 kernel, but I tried
2.2.19 kernel too - without success.

