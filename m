From: Avinesh Kumar <avinesh_kumar@persistent.co.in>
Subject: problem in mounting reiserfs
Date: Thu, 05 Aug 2004 15:38:19 +0530
Message-ID: <41120713.7040706@persistent.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20018-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

hi,
   i got error while mounting a partition of reiserfs. i am using linux 
kernel-2.6.7 ..here is what i did as root ....


~ $ /usr/local/sbin/mkreiserfs -b 8192 /dev/hda6
mkreiserfs 3.6.17 (2003 www.namesys.com)

A pair of credits:
Joshua Macdonald wrote the first draft of the transaction manager. Yuri 
Rupasov
did testing  and benchmarking,  plus he invented the r5 hash  (also used 
by the
dcache  code).  Yura  Rupasov,  Anatoly Pinchuk,  Igor Krasheninnikov,  
Grigory
Zaigralin,  Mikhail  Gilula,   Igor  Zagorovsky,  Roman  Pozlevich,  
Konstantin
Shvachko, and Joshua MacDonald are former contributors to the project.

Chris Mason wrote the journaling code for V3,  which was enormously more 
useful
to users than just waiting until  we could create a wandering log 
filesystem as
Hans would have unwisely done without him.
Jeff Mahoney optimized the bitmap  scanning code for V3,  and performed 
the big
endian cleanups.


Guessing about desired format.. Kernel 2.6.7-at1 is running.
Format 3.6 with standard journal
Count of blocks on the device: 525120
Number of blocks consumed by mkreiserfs formatting process: 8212
Blocksize: 8192
Hash function used to sort names: "r5"
Journal Size 8193 blocks (first block 10)
Journal Max transaction length 1024
inode generation number: 0
UUID: a7d5aa87-9471-432b-ad8f-ef6a426d626d
ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
    ALL DATA WILL BE LOST ON '/dev/hda6'!
Continue (y/n):y
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..ok

Tell your friends to use a kernel based on 2.4.18 or later, and 
especially not a
kernel based on 2.4.9, when you use reiserFS. Have fun.

ReiserFS is successfully created on /dev/hda6.
~ $ mount -t reiserfs /dev/hda6 /rfs
mount: wrong fs type, bad option, bad superblock on /dev/hda6,
       or too many mounted file systems
~ $

           but the same steps worked when i chose block size of 4096 
bytes. please, help me out.


-- 
regards
avinesh

====================================
EVEN IMPOSSIBLE SAYS -- I M POSSIBLE
====================================

