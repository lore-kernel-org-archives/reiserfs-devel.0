From: Baldur Norddahl <bbn@clansoft.dk>
Subject: reiserfsck --rebuild-tree bug (loops forever)
Date: 21 Mar 2003 10:31:24 +0100
Message-ID: <1048239084.9237.9.camel@dawn.clansoft.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13312-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I got a filesystem on a 75 GB disk that is damaged. Reiserfsck asked me
to run --rebuild-tree on it, and so I did. However it never finishes.

Unfortunately I don't have the log for the original --rebuild-tree run.
This is the log for the third run:

####### Pass 0 #######
pass0: vpf-10170: block 70127: item 4: Wrong order of items - the item 
	1109346 1109220 0x21 DRCT (2), len 1352, location 2568 entry count
65535, fsck need 1, format new fixed to 
	1109346 1109220 0x1 DRCT (2), len 1352, location 2568 entry count
65535, fsck need 1, format new
pass0: vpf-10170: block 810276: item 3: Wrong order of items - the item 
	1351778 1774183 0x401 DRCT (2), len 1320, location 720 entry count
65535, fsck need 1, format new fixed to 
	1351778 1774183 0x1 DRCT (2), len 1320, location 720 entry count 65535,
fsck need 1, format new
pass0: vpf-10170: block 1581992: item 30: Wrong order of items - the
item 
	322991 1592495 0x81 DRCT (2), len 8, location 1224 entry count 65535,
fsck need 1, format new fixed to 
	322991 1592495 0x1 DRCT (2), len 8, location 1224 entry count 65535,
fsck need 1, format new
pass0: vpf-10170: block 1582012: item 1: Wrong order of items - the item
	348331 348342 0x3a9 DRCT (2), len 424, location 3628 entry count 65535,
fsck need 1, format new fixed to 
	348331 348342 0x1 DRCT (2), len 424, location 3628 entry count 65535,
fsck need 1, format new
pass0: vpf-10170: block 1600587: item 2: Wrong order of items - the item
	4081 509323 0x189 DRCT (2), len 280, location 3728 entry count 65535,
fsck need 1, format new fixed to 
	4081 509323 0x1 DRCT (2), len 280, location 3728 entry count 65535,
fsck need 1, format new
pass0: vpf-10170: block 1633224: item 1: Wrong order of items - the item
	77103 1029558 0x669 DRCT (2), len 1888, location 2164 entry count
65535, fsck need 1, format new fixed to 
	77103 1029558 0x1 DRCT (2), len 1888, location 2164 entry count 65535,
fsck need 1, format new
pass0: vpf-10160: block 1759233: item 8: No "." entry found in the first
item of a directory
pass0: vpf-10170: block 1876180: item 1: Wrong order of items - the item
	960509 1130326 0x441 DRCT (2), len 1560, location 2492 entry count
65535, fsck need 1, format new fixed to 
	960509 1130326 0x1 DRCT (2), len 1560, location 2492 entry count 65535,
fsck need 1, format new
pass0: vpf-10160: block 4090916: item 5: No "." entry found in the first
item of a directory
pass0: vpf-10170: block 14327865: item 1: Wrong order of items - the
item 
	960509 1338428 0x111 DRCT (2), len 2976, location 1076 entry count
65535, fsck need 1, format new fixed to 
	960509 1338428 0x1 DRCT (2), len 2976, location 1076 entry count 65535,
fsck need 1, format new
pass0: vpf-10170: block 14847200: item 5: Wrong order of items - the
item 
	1084523 1084578 0x659 DRCT (2), len 552, location 1148 entry count
65535, fsck need 1, format new fixed to 
	1084523 1084578 0x1 DRCT (2), len 552, location 1148 entry count 65535,
fsck need 1, format new
1068939 directory entries were hashed with "r5" hash.
####### Pass 1 #######
####### Pass 2 #######
do_pass_2: The block (18767039) is in the tree already. Should not
happen.
do_pass_2: The block (18767039) is in the tree already. Should not
happen.
do_pass_2: The block (18767039) is in the tree already. Should not
happen.

It loops forever at this point, using up 100% cpu time.

dawn:~# reiserfsck -V
<--------reiserfsck 3.6.4, 2002-------->
 
I got a full backup of the original filesystem made with 'dd'. It is not
in a worse state that I can access most of it. It seems however that
reiserfsck is unable to fix the errors in it?

-- 
Baldur Norddahl <bbn@clansoft.dk>

