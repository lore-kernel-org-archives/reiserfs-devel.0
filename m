From: Radim Kolar <hsn@cybermail.net>
Subject: filesystem overhead on large files
Date: Sun, 11 Aug 2002 12:33:28 +0200
Message-ID: <20020811103327.GA8189@home>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11174-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>

tests on 100 mb file on ide disk
hdd: 6306048 sectors (3229 MB) w/81KiB Cache, CHS=6256/16/63, (U)DMA

dt was using async io in this test
 ./dt of=/dev/hdd1 limit=100m bs=16k dispose=keep passes=10 errors=50
 enable=aio

kernel 2.4.19
=============

Raw disk IO:  /dev/hdd1 
       read  2260674 bytes/sec
       write 3542486 bytes/sec

reiserfs:
       read  2265559 bytes/sec
       write 3524625 bytes/sec
ext2:  
       read  2226276 bytes/sec
       write 3214847 bytes/sec
ext3:      
       read  2189094 bytes/sec
       write 3201759 bytes/sec
minix:
       read  2208303 bytes/sec
       write 3046710 bytes/sec
vfat:
       read  2159045 bytes/sec
       write 2573193 bytes/sec

i do not have XFS there XFS claims to be filesystem with highest possible
transfer rate on large files, but this test shows that reiserfs has
almost zero overhead on large files, so it can be also multimedia fs.

We are considering to use Oracle in raw disk mode (without filesystem)
and this test shows that you will not get any benefit from that - and
backup/restore procedure is more complicated.
