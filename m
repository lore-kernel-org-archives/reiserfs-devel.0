From: David Bernick <bernz@bernztech.org>
Subject: incomplete fsck
Date: Wed, 14 Jan 2004 14:28:28 -0500
Message-ID: <4005985C.5080509@bernztech.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16502-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I'm using kernel 2.4.23 and reiserfsck 3.6.11.

I'm doing a --rebuild-tree. After pass0 i get this error. Why could this be?

2 directory entries were hashed with not set hash.
6449077 directory entries were hashed with "r5" hash.
         "r5" hash is selected
Flushing..finished
         Read blocks (but not data blocks) 122328324
                 Leaves among those 344205
                         - corrected leaves 249
                         - leaves all contents of which could not be saved and 
deleted 5
                 pointers in indirect items to wrong area 1536 (zeroed)
                 Objectids found 6449102

Pass 1 (will try to insert 344200 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%pass1.c 408 pass1_correct_leaf                         left 342029, 1085 /sec
pass1_correct_leaf: block 1733582, item 36, pointer 0: The wrong pointer 
(1395601712) in the file [7068 52052]. Must be fixed on pass0.
Aborted


Thanks for any help!

