From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Problems with journal size option on mkfs
Date: Wed, 15 May 2002 15:12:40 -0500
Message-ID: <OFE8E86981.F03B17DE-ON85256BBA.006A1833@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10314-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


I am in the process of writing a File System Interface Module (FSIM) for
EVMS that will interface with ReiserFS and am having a problem with the -s
(journal size) option on mkfs.reiserfs.  The problem is that if I specify
any journal size the mkfs fails.  By fails, what I mean is that the device
is not mountable, I don't actually get any error message from mkfs.  This
happens even when I give it the default size of 8193 blocks.  I didn't see
anything in the faq about this option not working, but I tried it on 2
different machines with the same results.  I am running tools level 3.x.1b
and stock 2.4.17 kernel + EVMS + JFS + kgdb + vfslock.

Here is a sample of the output, the only line that changes is the reference
to non-standard journal


[root@slpratt root]$ mkfs.reiserfs -f -d -s 8193 /dev/evms/test2
mkfs.reiserfs 3.x.1b (2002)
mkfs.reiserfs: Guessing about desired format..
mkfs.reiserfs: Kernel 2.4.17 is running.
Block 16 (0x3ffe) contains super block. Format 3.6 with non-standard
journal
Count of blocks on the device: 32121
Number of blocks consumed by mkreiserfs formatting process: 8212
Free blocks: 23909
Blocksize: 4096
Hash function used to sort names: "r5"
Number of bitmaps: 1
Root block: 8211
Tree height: 2
Objectid map size 2, max 972
Journal parameters:
      Device [0x0]
      Magic [0x6aaeccf4]
      Size 8193 blocks (including 1 for journal header) (first block 18)
      Max transaction length 1024 blocks
      Max batch size 900 blocks
      Max commit age 30
Filesystem state 0x0
sb_version 2
inode generation number: 0
UUID: a7ee44d1-8af3-43f7-af4b-5a979684eff4
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..ok
[root@slpratt root]$
[root@slpratt root]$ mount -t reiserfs /dev/evms/test2 /mnt/tmp
mount: wrong fs type, bad option, bad superblock on /dev/evms/test2,
       or too many mounted file systems
[root@slpratt root]$


and ....


[root@slpratt root]$ fsck.reiserfs /dev/evms/test2
reiserfsck 3.x.1b (2002)
Will read-only check consistency of the filesystem on /dev/evms/test2
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
reiserfsck: either make journal device available or use
--no-journal-available
            if you have the standard journal or if your device is available
            and you specified it correctly, you have to run rebuild-sb
[root@slpratt root]$


Let me know if you need more information.

Steve

EVMS Development - http://www.sf.net/projects/evms
Linux Technology Center - IBM Corporation
(512) 838-9763  EMAIL: SLPratt@US.IBM.COM


