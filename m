From: =?us-ascii?Q?Mr=2E=20Tao?= <tao@post.cz>
Subject: (unknown)
Date: Wed, 20 May 2009 17:48:26 +0200 (CEST)
Message-ID: <325.1470-551-82817687-1242834506@post.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Subject: 
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

I have reiser4 partition which seems to be in unfixable state. When I discovered corruption symptoms (I couldn't delete empty directory with something like "cannot unlink" in messages log) I ran fsck which suggested runing with --build-fs.
I did and it crashed at cca 96 % with segmentation fault. I got same results with fscking shen booted from latest system rescue cd.

Contains of fsck.log (without --build-fs option):

FSCK: tree.c: 186: repair_tree_dknode_check: Node (30687): The last key 
[d4a5a:4(FB):73776966747765:d4a88:405a0d] in the node is greater then the right
delimiting key [d4a5a:4(FB):73776966747765:d4a88:382997]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 30802, lev 3) 
points (item 87, unit 0) to the node [30687] with wrong delimiting keys. The 
whole subtree is skipped. 
FSCK: tree.c: 186: repair_tree_dknode_check: Node (29633): The last key 
[d4b7c:4(FB):75726c636c6173:d4bf0:1a0797e] in the node is greater then the right
delimiting key [d4b7c:4(FB):75726c636c6173:d4bf0:10b02c3]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 865480, lev 4) 
points (item 27, unit 0) to the nFSCK: tree.c: 186: repair_tree_dknode_check: Node (30687): The last key 
[d4a5a:4(FB):73776966747765:d4a88:405a0d] in the node is greater then the right
delimiting key [d4a5a:4(FB):73776966747765:d4a88:382997]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 30802, lev 3) 
points (item 87, unit 0) to the node [30687] with wrong delimiting keys. The 
whole subtree is skipped. 
FSCK: tree.c: 186: repair_tree_dknode_check: Node (29633): The last key 
[d4b7c:4(FB):75726c636c6173:d4bf0:1a0797e] in the node is greater then the right
delimiting key [d4b7c:4(FB):75726c636c6173:d4bf0:10b02c3]. 
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 865480, lev 4) 
points (item 27, unit 0) to the node [29633] with wrong delimiting keys. The 
whole subtree is skipped. 
FSCK: tree.c: 230: repair_tree_dknode_check: Node (blk 34369, lev 3): first key
[d4b7c:4(FB):75726c636c6173:d4bf0:1aa35df] does not match left delimiting key 
[d4b7c:4(FB):75726c636c6173:d4bf0:10b02c3] found in parent node (blk 865480, lev
4, pos 28).  
FSCK: filter.c: 415: repair_filter_update_traverse: Node (blk 865480, lev 4) 
points (item 28, unit 0) to the node [34369] with wrong delimiting keys. The 
whole subtree is skipped.
