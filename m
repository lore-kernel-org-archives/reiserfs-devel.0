From: "David Dabbs" <david@dabbs.net>
Subject: mongo problem
Date: Sat, 24 Jul 2004 06:54:02 -0500
Message-ID: <20040724115436.5C3CA15C4D@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19782-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi, 

I'm trying to get some mongo benchmarks running, but I can't seem to get a
RUN to finish without failing. The most recent error I encountered was

Use of uninitialized value in concatenation (.) or string at ./mongo.pl line
562.

Any ideas? Will investigate some more on this end. Thanks,

David




INFO date      : Sat 24 Jul 2004 08:27:52 AM CDT
INFO kernel    : 2.6.7-mm7 #2 Thu Jul 22 08:00:05 CDT 2004
INFO machine   : linux
INFO mem total : 320888
INFO .config   : PLEASE take care to make .config file available when you
publish benchmark results. At namesys, .config should be stored somewhere in
the internal benchmark directory (intbenchmarks/mongo/), and link to it is
added to the resulting html document.
TEST NPROC=3
TEST DIR=/mnt/testfs
TEST SYNC=off
TEST PHASE_COPY=cp
TEST PHASE_OVERWRITE=on
TEST GAMMA=0.2
TEST REP_COUNTER=3
TEST BYTES=130000000
TEST FILE_SIZE=4000
TEST PHASE_APPEND=off
TEST PHASE_READ=find
TEST DEV=/dev/hdb1
TEST DD_MBCOUNT=768
TEST WRITE_BUFFER=131072
TEST PHASE_DELETE=rm
TEST FSTYPE=ext3
TEST PHASE_MODIFY=off
SER
umount: /mnt/testfs: not mounted
mke2fs 1.34 (25-Jul-2003)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
395200 inodes, 790130 blocks
39506 blocks (5.00%) reserved for the super user
First data block=0
25 block groups
32768 blocks per group, 32768 fragments per group
15808 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912

Writing inode tables: done
Creating journal (8192 blocks): done
Writing superblocks and filesystem accounting information: done

This filesystem will be automatically checked every 20 mounts or
180 days, whichever comes first.  Use tune2fs -c or -i to override.
PHASE CREATE
STAT REAL_TIME 111.29
STAT CPU_TIME 77.78
STAT DF 504612
PHASE COPY
STAT REAL_TIME 344.2
STAT CPU_TIME 96.08
STAT DF 1009224
Use of uninitialized value in concatenation (.) or string at ./mongo.pl line
562.
PHASE OVERWRITE


