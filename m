From: "Alistair McDonald" <alistair@inrevo.com>
Subject: core dump on reiserfsck --rebuildtree
Date: Fri, 19 Sep 2003 20:35:51 +0100 (BST)
Message-ID: <65047.80.5.156.133.1064000151.squirrel@blanark.dyndns.org>
Reply-To: alistair@inrevo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-15711-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Howdy.

My Reiser filesystem became corrupt (probably after a power interuption -
I could find no other reason why the machine had restarted.

reiserfsck reported that I had to use the rebuild-tree option, I tried
that it ran for some time (~24 hours) and seg faulted. I tried again for
good measure, and got the same results. After reading this list, I
upgraded my reisertools from 3.6.8 to 3.6.11, the latest available in
gentoo, the linux distro I am running. I tried a third time and got a
similar seg fault.
Other sytem details:
uname -a reports: Linux altair 2.4.20-gentoo-r2 #1 Sun Apr 13 21:43:43 BST
2003 i686 AMD Duron(tm) Processor AuthenticAMD GNU/Linux
RAM: 512 MB
The filesystem is on a 240 Gb lvm partition, across two 120 GB drives.
SMART status for both drives is good.

the backtrace from the core is
(gdb) bt
#0  0x40050f81 in kill () from /lib/libc.so.6
#1  0x40050d15 in raise () from /lib/libc.so.6
#2  0x4005226b in abort () from /lib/libc.so.6
#3  0x080519d0 in __fxstat64 ()
#4  0x08052185 in __fxstat64 ()
#5  0x080525c6 in __fxstat64 ()
#6  0x0804a748 in __fxstat64 ()
#7  0x0804b9b8 in __fxstat64 ()
#8  0x4003d7a6 in __libc_start_main () from /lib/libc.so.6

debugreiserfs reports:

altair root # debugreiserfs /dev/lvm1/data
debugreiserfs 3.6.11 (2003 www.namesys.com)


Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x3a01 of format 3.6 with standard
journal
Count of blocks on the device: 60293120
Number of bitmaps: 1840
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 60293120
Root block: 0
Filesystem is cleanly umounted
Tree height: 65535
Hash function used to sort names: "r5"
Objectid map size 972, max 972
Journal parameters:
        Device [0x0]
        Magic [0x59b5dad]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0xfa02:
        FATAL corruptions exist.
sb_version: 2
inode generation number: 496254
UUID: ed83eafd-9bff-45d4-8c19-929198afae75
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN

Oh, for good measure, the end of the output from reiserfsck is:
pass0: block 30988321, item 11: The file [166915 167172] has the wrong
mode (?---------), corrected to (----------)
pass0: block 30988321, item 13: The file [166915 167173] has the wrong
mode (?---------), corrected to (----------)
pass0: block 30988321, item 15: The file [166915 167174] has the wrong
mode (?---------), corrected to (----------)
pass0: block 30988321, item 17: The file [166915 167175] has the wrong
mode (?---------), corrected to (----------)
pass0: block 30988321, item 19: The file [166915 167176] has the wrong
mode (?---------), corrected to (----------)
pass0: block 30988321, item 21: The file [166915 167177] has the wrong
mode (?---------), corrected to (----------)
.pass0: vpf-10430: block 32105269, item 2: Wrong order of items - change
the dir_id of the key [236732 236746 0xb1 DRCT
(2)] to 236731
pass0: vpf-10590: block 32105269, item 2: Wrong order of items - change
the object_id of the key [236731 236746 0xb1 DRC
T (2)] to 244605
pass0: vpf-10170: block 32105269: item 2: Wrong order of items - the item
        236731 244605 0xb1 DRCT (2), len 1376, location 100 entry count
65535, fsck need 1, format new fixed to
        236731 244605 0x1 DRCT (2), len 1376, location 100 entry count
65535, fsck need 1, format new
pass0: block 32111040, item 1: The file [240396 245879] has the wrong mode
(?---------), corrected to (----------)
.100%                         left 0, 377 /sec
183 directory entries were hashed with not set hash.
221188 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 32635611
                Leaves among those 69326
                        - corrected leaves 82
                        - leaves all contents of which could not be saved
and deleted 15
                pointers in indirect items to wrong area 13525 (zeroed)
                Objectids found 224036

Pass 1 (will try to insert 69311 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%pass1.c 408 pass1_correct_leaf                           left 68900, 205
/sec
pass1_correct_leaf: block 31831, item 0, pointer 389: The wrong pointer
(3225092104) in the file [133625 133627]. Must b
e fixed on pass0.
Aborted (core dumped)


Is there anything I can do, or is my data (literally) fscked?

Have a happy weekend,

Alistair
-- 
Alistair McDonald       (+44)(0)7017-467386
http://www.inrevo.com
