From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: hdd problem - reiserfs or hardware?
Date: Mon, 7 Jun 2004 11:26:19 +0300
Message-ID: <200406071126.19442.rmeijer@internet.gr>
References: <Pine.LNX.4.44.0406071125210.10569-100000@mail.sao.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19056-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0406071125210.10569-100000@mail.sao.ru>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Mon 7 June 2004 10:47, Stas Baldin wrote:

> Jun  5 20:00:24 helios kernel: hdd: dma_intr: status=0x00 { }
> Jun  5 20:00:24 helios kernel:
> Jun  5 20:00:24 helios kernel: hdd: status error: status=0x00 { }
> Jun  5 20:00:24 helios kernel:
> Jun  5 20:00:24 helios kernel: hdd: drive not ready for command
> Jun  5 20:00:24 helios kernel: hdd: status error: status=0x00 { }
> Jun  5 20:00:24 helios kernel:
> Jun  5 20:00:24 helios kernel: hdd: drive not ready for command
> Jun  5 20:00:24 helios kernel: hdd: status error: status=0x00 { }
> Jun  5 20:00:24 helios kernel:
> Jun  5 20:00:24 helios kernel: hdc: DMA disabled
> Jun  5 20:00:24 helios kernel: hdd: DMA disabled
> Jun  5 20:00:24 helios kernel: hdd: drive not ready for command
> Jun  5 20:00:28 helios kernel: ide1: reset: success
> Jun  5 20:04:24 helios kernel: hdd: status error: status=0x58 { DriveReady
> SeekComplete DataRequest } Jun  5 20:04:24 helios kernel:
> Jun  5 20:04:24 helios kernel: hdd: drive not ready for command
> Jun  5 20:04:24 helios kernel: hdd: status error: status=0x58 { DriveReady
> SeekComplete DataRequest } Jun  5 20:04:24 helios kernel:
> Jun  5 20:04:24 helios kernel: hdd: drive not ready for command
> Jun  5 20:04:24 helios kernel: hdd: status error: status=0x58 { DriveReady
> SeekComplete DataRequest } Jun  5 20:04:24 helios kernel:
> Jun  5 20:04:24 helios kernel: hdd: drive not ready for command
> Jun  5 20:04:24 helios kernel: hdd: status error: status=0x58 { DriveReady
> SeekComplete DataRequest } Jun  5 20:04:24 helios kernel:
> Jun  5 20:04:24 helios kernel: hdd: drive not ready for command
> Jun  5 20:04:27 helios kernel: ide1: reset: success
> Jun  5 20:04:28 helios kernel: hdd: read_intr: status=0x5d { DriveReady
> SeekComplete DataRequest CorrectedError Error }
> Jun  5 20:04:32 helios kernel: hdd: read_intr: error=0x5d {
> DriveStatusError UncorrectableError SectorIdNotFound AddrMarkNotFound },
> LBAsect=102655579741533, high=6118749, low=6118749, sector=5767320 Jun  5
> 20:04:32 helios kernel: end_request: I/O error, dev hdd, sector 5767320 Jun
>  5 20:04:32 helios kernel: zam-7001: io error in reiserfs_find_entry Jun  5
> 20:04:32 helios kernel: hdd: status error: status=0x50 { DriveReady
> SeekComplete } Jun  5 20:04:32 helios kernel:
> Jun  5 20:04:32 helios kernel: hdd: no DRQ after issuing WRITE
> Jun  5 20:04:32 helios kernel: hdd: status error: status=0x00 { }
> Jun  5 20:04:32 helios kernel:
> Jun  5 20:04:32 helios kernel: hdd: drive not ready for command
> Jun  5 20:04:32 helios kernel: hdd: status error: status=0x00 { }
> Jun  5 20:04:33 helios kernel:
> Jun  5 20:04:33 helios kernel: hdd: drive not ready for command
> Jun  5 20:04:33 helios kernel: hdd: status error: status=0x50 { DriveReady
> SeekComplete } Jun  5 20:04:33 helios kernel:
> Jun  5 20:04:33 helios kernel: hdd: no DRQ after issuing WRITE
> Jun  5 20:04:33 helios kernel: ide1: reset: success

> I don't understand - what is the reason of my problem?

This indicates a hardware error...please check all cables; make sure they're 
inserted properly. If that doesn't solve the problem it's time to backup the 
data and get a new disk...


Cheers,

Ray
