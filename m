From: =?ISO-8859-2?Q?Martin_MOKREJ=A9?= <mmokrejs@ribosome.natur.cuni.cz>
Subject: Re: Unsupported mkreiserfs and mount options
Date: Fri, 22 Oct 2004 10:38:37 +0200
Message-ID: <4178C70D.7060204@ribosome.natur.cuni.cz>
References: <41750674.3060505@ribosome.natur.cuni.cz> <41754525.3070305@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22125-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41754525.3070305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "E.Gryaznova" <grev@namesys.com>
Cc: reiserfs-list@namesys.com

Hi,
  after few days my tests are finished. On linux-2.4.28-pre3 the only command
which doesn't work as expected is:

# mkreiserfs -f -h tea /dev/sdb2
mkreiserfs 3.6.17 (2003 www.namesys.com)

A pair of credits:
Chris Mason wrote the journaling code for V3,  which was enormously more useful
to users than just waiting until  we could create a wandering log filesystem as
Hans would have unwisely done without him.
Jeff Mahoney optimized the bitmap  scanning code for V3,  and performed the big
endian cleanups. 

Yury Umanets  (aka Umka)  developed  libreiser4,  userspace  plugins,  and  all
userspace tools (reiser4progs) except of fsck.


Guessing about desired format.. Kernel 2.4.28-pre3 is running.
Format 3.6 with standard journal
Count of blocks on the device: 319068960
Number of blocks consumed by mkreiserfs formatting process: 17949
Blocksize: 4096
Hash function used to sort names: "tea"
Journal Size 8193 blocks (first block 18)
Journal Max transaction length 1024
inode generation number: 0
UUID: 102ff819-e449-4d2b-bce9-29b127d52f18
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..ok

Tell your friends to use a kernel based on 2.4.18 or later, and especially not a
kernel based on 2.4.9, when you use reiserFS. Have fun.

ReiserFS is successfully created on /dev/sdb2.
# mount -t reiserfs -o hash=tea /dev/sdb2 /scratch
mount: wrong fs type, bad option, bad superblock on /dev/sdb2,
       or too many mounted file systems
       (aren't you trying to mount an extended partition,
       instead of some logical partition inside?)
#


It logs the following ... :(
reiserfs: found format "3.6" with standard journal
scsi2:0:0:0: Attempting to queue an ABORT message
CDB: 0x28 0x0 0xe 0x31 0xe4 0xb4 0x0 0x0 0x8 0x0
scsi2:0:0:0: Command not found
aic7xxx_abort returns 0x2002
scsi2:0:0:0: Attempting to queue an ABORT message
CDB: 0x28 0x0 0xe 0x21 0xe4 0xb4 0x0 0x0 0x8 0x0
scsi2:0:0:0: Command not found
aic7xxx_abort returns 0x2002
scsi2:0:0:0: Attempting to queue an ABORT message
CDB: 0x28 0x0 0xe 0x1d 0xe4 0xb4 0x0 0x0 0x8 0x0
scsi2:0:0:0: Command not found
aic7xxx_abort returns 0x2002
scsi2:0:0:0: Attempting to queue an ABORT message
CDB: 0x28 0x0 0xe 0x15 0xe4 0xb4 0x0 0x0 0x8 0x0
scsi2:0:0:0: Command not found
aic7xxx_abort returns 0x2002
scsi2:0:0:0: Attempting to queue an ABORT message
CDB: 0x28 0x0 0xe 0x11 0xe4 0xb4 0x0 0x0 0x8 0x0
scsi2:0:0:0: Command not found
aic7xxx_abort returns 0x2002
scsi2:0:0:0: Attempting to queue an ABORT message
CDB: 0x28 0x0 0xe 0x2d 0xe4 0xb4 0x0 0x0 0x8 0x0
scsi2:0:0:0: Command not found
aic7xxx_abort returns 0x2002
scsi2:0:0:0: Attempting to queue an ABORT message
CDB: 0x28 0x0 0xe 0x29 0xe4 0xb4 0x0 0x0 0x8 0x0
scsi2:0:0:0: Command not found
aic7xxx_abort returns 0x2002
scsi2:0:0:0: Attempting to queue an ABORT message
CDB: 0x28 0x0 0xe 0x25 0xe4 0xb4 0x0 0x0 0x8 0x0
scsi2:0:0:0: Command not found
aic7xxx_abort returns 0x2002
reiserfs: checking transaction log (device sd(8,18)) ...
for (sd(8,18))
sd(8,18):reiserfs: FS seems to be empty, autodetect is using the default hash
REISERFS: Error, r5 hash detected, unable to force tea hash


Another attempt caused fortunately just:
reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device sd(8,18)) ...
for (sd(8,18))
sd(8,18):reiserfs: FS seems to be empty, autodetect is using the default hash
REISERFS: Error, r5 hash detected, unable to force tea hash


I retried once more with debug:
# mkreiserfs -d -f -h tea /dev/sdb2
mkreiserfs 3.6.17 (2003 www.namesys.com)

A pair of credits:
BigStorage  (www.bigstorage.com)  contributes to our general fund  every month,
and has done so for quite a long time.

Alexander Zarochentcev  (zam)  wrote the high low priority locking code, online
resizer for V3 and V4, online repacker for V4, block allocation code, and major
parts of  the flush code,  and maintains the transaction manager code.  We give
him the stuff  that we know will be hard to debug,  or needs to be very cleanly
structured.


Guessing about desired format.. Kernel 2.4.28-pre3 is running.
Block 16 (0x812) contains super block. Format 3.6 with standard journal
Count of blocks on the device: 319068960
Number of blocks consumed by mkreiserfs formatting process: 17949
Free blocks: 319051011
Blocksize: 4096
Hash function used to sort names: "tea"
Number of bitmaps: 9738
Root block: 8211
Tree height: 2
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x7deb8698]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Filesystem state 0x0
sb_version 2
inode generation number: 0
UUID: 92f5af9f-6511-4bad-838a-ba55b7776f79
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..ok
# mount -t reiserfs -o hash=tea /dev/sdb2 /scratch
mount: wrong fs type, bad option, bad superblock on /dev/sdb2,
       or too many mounted file systems
       (aren't you trying to mount an extended partition,
       instead of some logical partition inside?)


and again same result:

reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device sd(8,18)) ...
for (sd(8,18))
sd(8,18):reiserfs: FS seems to be empty, autodetect is using the default hash
REISERFS: Error, r5 hash detected, unable to force tea hash

I think tea hash isn't supported well under 2.4.28-pre3.
Martin
