From: Robert Brockway <robert@timetraveller.org>
Subject: Re: Filesystem errors
Date: Mon, 15 Jul 2002 16:04:57 +1000 (EST)
Message-ID: <Pine.LNX.4.44.0207151603290.21646-100000@avon.timetraveller.org>
References: <200207160146.01440.cabernet@internode.on.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10998-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200207160146.01440.cabernet@internode.on.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Marr <cabernet@internode.on.net>
Cc: Reiserfs list <reiserfs-list@namesys.com>

On Tue, 16 Jul 2002, Brian Marr wrote:

> Can anyone help interpret these logs ? They have just started appearing on my 
> Suse 8.0 system. I have made some tentative exploration with reiserfsck 
> --check. The results were
> reiserfsck......check started on Mon
> Replaying journal
> 0 transactions replayed
> checking S+tree..../1(of 2 ) / 1(of 164)/ 51(of 166)
> pass_through_tree: Unable to read block 52842 block on device 0x3
> 
> The system is working but something is obviously wrong. Also the xserver is 
> taking ages to start.

Hi Brian.  I'd look at backing up the data on that drive _now_.  Not
wanting to scare you but I'd be suspecting a hardware fault which will get
worse.  How old is the drive?

Cheers,
	-Rob
 
> Brian Marr
> 
> (snip)==========
> VFS: Disk change detected on device sr(11,0)
> hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=487003, 
> sector=422736
> end_request: I/O error, dev 03:02 (hda), sector 422736
> hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=487003, 
> sector=422736
> end_request: I/O error, dev 03:02 (hda), sec
> 
> 
> (snip)======
> hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=474244, 
> sector=409984
> end_request: I/O error, dev 03:02 (hda), sector 409984
> vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data 
> of [96126 168017 0x0 SD]
> 

-- 
-- Robert Brockway B.Sc. email: robert@timetraveller.org  ICQ: 104781119
   Linux counter project ID #16440 (http://counter.li.org)
   avon: up 4 days, 13:52,  2 users,  load average: 0.00, 0.00, 0.00
   "The earth is but one country and mankind its citizens" -Baha'u'llah

