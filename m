From: Hans Reiser <reiser@namesys.com>
Subject: Re: Filesystem errors
Date: Mon, 15 Jul 2002 10:20:44 +0400
Message-ID: <3D3269BC.8040906@namesys.com>
References: <200207160146.01440.cabernet@internode.on.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11000-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brian Marr <cabernet@internode.on.net>
Cc: Reiserfs list <reiserfs-list@namesys.com>

Brian Marr wrote:

>Can anyone help interpret these logs ? They have just started appearing on my 
>Suse 8.0 system. I have made some tentative exploration with reiserfsck 
>--check. The results were
>reiserfsck......check started on Mon
>Replaying journal
>0 transactions replayed
>checking S+tree..../1(of 2 ) / 1(of 164)/ 51(of 166)
>pass_through_tree: Unable to read block 52842 block on device 0x3
>
>The system is working but something is obviously wrong. Also the xserver is 
>taking ages to start.
>
>Brian Marr
>
>(snip)==========
>VFS: Disk change detected on device sr(11,0)
>hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
>hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=487003, 
>sector=422736
>end_request: I/O error, dev 03:02 (hda), sector 422736
>hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
>hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=487003, 
>sector=422736
>end_request: I/O error, dev 03:02 (hda), sec
>
>
>(snip)======
>hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
>hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=474244, 
>sector=409984
>end_request: I/O error, dev 03:02 (hda), sector 409984
>vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data 
>of [96126 168017 0x0 SD]
>
>
>  
>
did you fdisk without a reboot before mkreiserfsing?   If yes, see FAQ.

-- 
Hans



