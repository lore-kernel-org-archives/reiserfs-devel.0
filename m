From: Dax Kelson <dax@gurulabs.com>
Subject: RE: Bad Sectors during log replay, help?
Date: Thu, 2 May 2002 22:39:02 -0600 (MDT)
Message-ID: <Pine.LNX.4.44.0205022236450.22979-100000@mooru.gurulabs.com>
References: <8287102CFE5C31418556A13A4E5BEE91E957D0@sphynx.git.compgen.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10216-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <8287102CFE5C31418556A13A4E5BEE91E957D0@sphynx.git.compgen.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Stowe <will.stowe@intec-telecom-systems.com>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

On Fri, 3 May 2002, Will Stowe wrote:

> Try turning off dma using hdparm -d 0 /dev/had, then try remounting

Thanks for replying (I really *love* ezmlm mailing lists, the latency is 
great!).

I wouldn't think that this would do anything as the drive has been in
production for the last 12 months.

hda: DMA disabled
reiserfs: checking transaction log (device 03:03) ...
Warning, log replay starting on readonly filesystem
hda: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
hda: read_intr: error=0x40 { UncorrectableError }, LBAsect=613128, 
sector=26472
end_request: I/O error, dev 03:03 (hda), sector 26472
hda: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
hda: read_intr: error=0x40 { UncorrectableError }, LBAsect=613136, 
sector=26480
end_request: I/O error, dev 03:03 (hda), sector 26480
hda: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
hda: read_intr: error=0x40 { UncorrectableError }, LBAsect=613144, 
sector=26488
end_request: I/O error, dev 03:03 (hda), sector 26488
hda: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
hda: read_intr: error=0x40 { UncorrectableError }, LBAsect=613152, 
sector=26496
end_request: I/O error, dev 03:03 (hda), sector 26496
is_tree_node: node level 1 does not match to the expected one 4
vs-5150: search_by_key: invalid format found in block 14806. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat 
data of [1 2 0x0 SD]
Using r5 hash to sort names
ReiserFS version 3.6.25


