From: Stas Baldin <sts@sao.ru>
Subject: hdd problem - reiserfs or hardware?
Date: Mon, 7 Jun 2004 11:47:02 +0400 (MSD)
Message-ID: <Pine.LNX.4.44.0406071125210.10569-100000@mail.sao.ru>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19055-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi all!

I have some problem with reiserfs (or maybe hardware?). See log listed
below.

--8<---------------------------------------------------------------------
Jun  5 19:24:43 helios kernel: hdd: max request size: 1024KiB
Jun  5 19:24:43 helios kernel: hdd: 156301488 sectors (80026 MB) w/2048KiB Cache,
                                    CHS=16383/255/63, UDMA(33)
Jun  5 19:24:43 helios kernel:  hdd: hdd1
...
Jun  5 19:24:44 helios kernel: found reiserfs format "3.6" with standard journal
Jun  5 19:24:44 helios kernel: reiserfs: using ordered data mode
Jun  5 19:24:44 helios kernel: Reiserfs journal params: device hdd1, size 8192,
                               journal first block 18, max trans len 1024, max batch 900,
                               max commit age 30, max trans age 30
Jun  5 19:24:44 helios kernel: reiserfs: checking transaction log (hdd1) for (hdd1)
Jun  5 19:24:44 helios kernel: Using r5 hash to sort names
...

Jun  5 20:00:24 helios kernel: hdd: dma_intr: status=0x00 { }
Jun  5 20:00:24 helios kernel:
Jun  5 20:00:24 helios kernel: hdd: status error: status=0x00 { }
Jun  5 20:00:24 helios kernel:
Jun  5 20:00:24 helios kernel: hdd: drive not ready for command
Jun  5 20:00:24 helios kernel: hdd: status error: status=0x00 { }
Jun  5 20:00:24 helios kernel:
Jun  5 20:00:24 helios kernel: hdd: drive not ready for command
Jun  5 20:00:24 helios kernel: hdd: status error: status=0x00 { }
Jun  5 20:00:24 helios kernel:
Jun  5 20:00:24 helios kernel: hdc: DMA disabled
Jun  5 20:00:24 helios kernel: hdd: DMA disabled
Jun  5 20:00:24 helios kernel: hdd: drive not ready for command
Jun  5 20:00:28 helios kernel: ide1: reset: success
Jun  5 20:04:24 helios kernel: hdd: status error: status=0x58 { DriveReady SeekComplete DataRequest }
Jun  5 20:04:24 helios kernel:
Jun  5 20:04:24 helios kernel: hdd: drive not ready for command
Jun  5 20:04:24 helios kernel: hdd: status error: status=0x58 { DriveReady SeekComplete DataRequest }
Jun  5 20:04:24 helios kernel:
Jun  5 20:04:24 helios kernel: hdd: drive not ready for command
Jun  5 20:04:24 helios kernel: hdd: status error: status=0x58 { DriveReady SeekComplete DataRequest }
Jun  5 20:04:24 helios kernel:
Jun  5 20:04:24 helios kernel: hdd: drive not ready for command
Jun  5 20:04:24 helios kernel: hdd: status error: status=0x58 { DriveReady SeekComplete DataRequest }
Jun  5 20:04:24 helios kernel:
Jun  5 20:04:24 helios kernel: hdd: drive not ready for command
Jun  5 20:04:27 helios kernel: ide1: reset: success
Jun  5 20:04:28 helios kernel: hdd: read_intr: status=0x5d { DriveReady SeekComplete DataRequest
                               CorrectedError Error }
Jun  5 20:04:32 helios kernel: hdd: read_intr: error=0x5d { DriveStatusError UncorrectableError
                               SectorIdNotFound AddrMarkNotFound }, 
                               LBAsect=102655579741533, high=6118749, low=6118749, sector=5767320
Jun  5 20:04:32 helios kernel: end_request: I/O error, dev hdd, sector 5767320
Jun  5 20:04:32 helios kernel: zam-7001: io error in reiserfs_find_entry
Jun  5 20:04:32 helios kernel: hdd: status error: status=0x50 { DriveReady SeekComplete }
Jun  5 20:04:32 helios kernel:
Jun  5 20:04:32 helios kernel: hdd: no DRQ after issuing WRITE
Jun  5 20:04:32 helios kernel: hdd: status error: status=0x00 { }
Jun  5 20:04:32 helios kernel:
Jun  5 20:04:32 helios kernel: hdd: drive not ready for command
Jun  5 20:04:32 helios kernel: hdd: status error: status=0x00 { }
Jun  5 20:04:33 helios kernel:
Jun  5 20:04:33 helios kernel: hdd: drive not ready for command
Jun  5 20:04:33 helios kernel: hdd: status error: status=0x50 { DriveReady SeekComplete }
Jun  5 20:04:33 helios kernel:
Jun  5 20:04:33 helios kernel: hdd: no DRQ after issuing WRITE
Jun  5 20:04:33 helios kernel: ide1: reset: success
Jun  5 20:07:52 helios kernel: is_tree_node: node level 0 does not match to the expected one 1
Jun  5 20:07:52 helios kernel: vs-5150: search_by_key: invalid format found in block 720907. Fsck?
Jun  5 20:07:52 helios kernel: vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying
                               to find stat data of [724659 269318 0x0 SD]

--8<---------------------------------------------------------------------

I don't understand - what is the reason of my problem?

wbr,
Stas


