From: Nick Vahalik <nick@nsanity.com>
Subject: Reiserfs Data Recovery
Date: Mon, 08 Mar 2004 08:22:49 -0600
Message-ID: <404C81B9.4050504@nsanity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17119-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

System: Slackware 9.1
Dual P3 1Ghz/133Mhz FSB
1 GB Ram PC133 Ram
Running Hardware Raid1 on top of a highpoint 37x2 raid controller
2x80 GB Drives

My system crashed yesterday (xscreensaver... bah!) and when I rebooted 
my /raid partition wouldn't mount. So I ran reiserfsck /dev/sda1 and it 
said I needed to rebuild my superblock because my Root Super Block 0 was 
corrupt. So I ran reiserfsck --rebuild-sb /dev/sda1 and after that it 
was saying that it failed and I needed to run reiserfsck --rebuild-tree. 
Well, I did and about an hour later I get something like this (the log 
is about 80k):
1537 directory entries were hashed with not set hash.
112120 directory entries were hashed with "r5" hash.
Selected hash ("r5") does not match to the hash set in the super block 
(not set).
"r5" hash is selected
Flushing..finished
Read blocks (but not data blocks) 38667615
Leaves among those 56626
- corrected leaves 2478
- leaves all contents of which could not be saved and deleted 19
pointers in indirect items to wrong area 5167 (zeroed)
Objectids found 116706

Pass 1 (will try to insert 56607 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%pass1: block 65604, item 16, entry 4: The entry "P313"?" of the [50706 
50722 0x1 DIR (3)] is hashed with not set whereas proper hash is "r5" - 
deleted
pass1: block 65604, item 16, entry 9: The entry "P313"?" of the [50706 
50722 0x1 DIR (3)] is hashed with not set whereas proper hash is "r5" - 
deleted
pass1.c 408 pass1_correct_leaf
pass1_correct_leaf: block 65636, item 0, pointer 7: The wrong pointer 
(2224053807) in the file [50872 50891]. Must be fixed on pass0.
Aborted

So, I figured I'd run it once more and just hope and pray that it would 
kinda fix itself, and well, I got the same thing again:

1200 directory entries were hashed with not set hash.
110404 directory entries were hashed with "r5" hash.
"r5" hash is selected
Flushing..finished
Read blocks (but not data blocks) 38667391
Leaves among those 56589
- corrected leaves 2484
- leaves all contents of which could not be saved and deleted 28
pointers in indirect items to wrong area 4947 (zeroed)
Objectids found 116691

Pass 1 (will try to insert 56561 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%pass1: block 65540, item 19, entry 0: The entry "" of the [50257 50323 
0x1 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 65540, item 19, entry 0: The entry ".." of the [50257 50323 
0x2 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1.c 408 pass1_correct_leaf left 56393, 0 /sec
pass1_correct_leaf: block 65604, item 2, pointer 1: The wrong pointer 
(1) in the file [50696 50698]. Must be fixed on pass0.
Aborted

It looks like the numbers are getting smaller, but all I know is that it 
still won't mount... and I have everything on this partition... this was 
my backup (I just reformatted) and without this data I am seriously 
screwed. Will normal data recovery methods work (like, Encase or 
Ontrack?) or is there a better way?

Nick Vahalik
