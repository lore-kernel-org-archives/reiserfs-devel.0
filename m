From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiaserfsck core dumps
Date: Tue, 13 Jan 2004 00:59:28 +0300
Message-ID: <200401130059.28689.vitaly@namesys.com>
References: <4001D0BA.5020604@wisc.edu> <200401121315.09707.vitaly@namesys.com> <4002E765.3070201@wisc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16466-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4002E765.3070201@wisc.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "B. J. Zolp" <bjzolp@wisc.edu>
Cc: reiserfs-list@namesys.com

> Jan 12 11:07:45 orion kernel: hdb: dma_intr: status=0x51 { DriveReady
> SeekComplete Error }
> Jan 12 11:07:45 orion kernel: hdb: dma_intr: error=0x40 {
> UncorrectableError }, LBAsect=10158456, high=0, low=10158456,
> sector=10158456
> Jan 12 11:07:45 orion kernel: end_request: I/O error, dev 03:40 (hdb),
> sector 10158456

So your harddrive has bad blocks, have a look at 
	http://www.namesys.com/bad-block-handling.html
to get the info how to handle them. 
If you need our further assistance visit please our support 
page in terms of which we deal with hardware problems:
	http://www.namesys.com/support.html

-- 
Thanks,
Vitaly Fertman
