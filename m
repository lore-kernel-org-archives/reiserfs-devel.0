From: Oleg Drokin <green@namesys.com>
Subject: Re: RE : some troubles with mounting reiserfs
Date: Tue, 29 Apr 2003 09:40:44 +0400
Message-ID: <20030429054044.GI1231@namesys.com>
References: <20030428053807.GB22902@namesys.com> <001e01c30dbd$09f495f0$0732a8c0@dell8100>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13890-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <001e01c30dbd$09f495f0$0732a8c0@dell8100>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Serge Rodrigues <serge@onpoi.net>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Apr 28, 2003 at 09:33:20PM +0200, Serge Rodrigues wrote:

> ReiserFS version 3.6.25
> hdb: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdb: dma_intr: error=0x40 { UncorrectableError }, LBAsect=142082111,
> sector=142082048
> end_request: I/O error, dev 03:41 (hdb), sector 142082048
> hdb: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdb: dma_intr: error=0x40 { UncorrectableError }, LBAsect=147587135,
> sector=147587072
> end_request: I/O error, dev 03:41 (hdb), sector 147587072
> sh-2029: reiserfs read_bitmaps: bitmap block (#17760256) reading failed
> reiserfs_read_super: unable to read bitmap

These are sure sign of something cannot be read from your disk.
Though I am not sure why badblocks outputs no info.
How about running badblocks without specifying start offset and device size?

Bye,
    Oleg
