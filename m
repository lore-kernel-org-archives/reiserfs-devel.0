From: Will Stowe <will.stowe@intec-telecom-systems.com>
Subject: RE: Bad Sectors during log replay, help?
Date: Fri, 3 May 2002 00:34:40 -0400
Message-ID: <8287102CFE5C31418556A13A4E5BEE91E957D0@sphynx.git.compgen.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10214-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dax Kelson' <dax@gurulabs.com>, reiserfs-list@namesys.com

Try turning off dma using hdparm -d 0 /dev/had, then try remounting


Will Stowe
Systems Administrator
Intec Telecom Systems
5775 Peachtree-Dunwoody Road
Atlanta, GA 30342
Work:(404) 705-2867
Email: Will.Stowe@intec-telecom-systems.com 
 
 

-----Original Message-----
From: Dax Kelson [mailto:dax@gurulabs.com] 
Sent: Friday, May 03, 2002 12:33 AM
To: reiserfs-list@namesys.com
Subject: [reiserfs-list] Bad Sectors during log replay, help?


I have a kernel 2.4.18 trying to mount a reiserfs filesytem with 
important data on it.

I NEED to get some data off this filesystem, what can I do?

# mount -o ro -t reiserfs /dev/hda3 /mnt/tmp

reiserfs: checking transaction log (device 03:03) ...
Warning, log replay starting on readonly filesystem
hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=613153, 
sector=26408
end_request: I/O error, dev 03:03 (hda), sector 26408
hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=613153, 
sector=26416
end_request: I/O error, dev 03:03 (hda), sector 26416
hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=613153, 
sector=26424
end_request: I/O error, dev 03:03 (hda), sector 26424
hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=613153, 
sector=26432
end_request: I/O error, dev 03:03 (hda), sector 26432
hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=613153, 
sector=26440
end_request: I/O error, dev 03:03 (hda), sector 26440
hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=613153, 
sector=26448
end_request: I/O error, dev 03:03 (hda), sector 26448
hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=613153, 
sector=26456
end_request: I/O error, dev 03:03 (hda), sector 26456
hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=613153, 
sector=26464
end_request: I/O error, dev 03:03 (hda), sector 26464
hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=613153, 
sector=26472
end_request: I/O error, dev 03:03 (hda), sector 26472
hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=613153, 
sector=26480
end_request: I/O error, dev 03:03 (hda), sector 26480
hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=613153, 
sector=26488
end_request: I/O error, dev 03:03 (hda), sector 26488
hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=613153, 
sector=26496
end_request: I/O error, dev 03:03 (hda), sector 26496
is_tree_node: node level 1 does not match to the expected one 4
vs-5150: search_by_key: invalid format found in block 14806. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat 
data of [1 2 0x0 SD]
Using r5 hash to sort names
ReiserFS version 3.6.25

(and the mount fails)
