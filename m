From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: mkreiserfs and big RAID-Systems
Date: Mon, 15 Jul 2002 12:53:45 -0400
Message-ID: <200207151253.45018.kuba@mareimbrium.org>
References: <1026741573.30600.25.camel@pallas.IZS.FhG.de> <200207152008.51657.vitaly@namesys.com> <1026757533.32136.26.camel@pallas.IZS.FhG.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11017-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1026757533.32136.26.camel@pallas.IZS.FhG.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Abele <aba@IZS.FhG.de>
Cc: reiserfs-list@namesys.com

> > > [root@saturn6 mkreiserfs]# ./mkreiserfs /dev/sdf1
> > > Count of blocks on the device: 210096054
> >
> > As you can see block number is correct - 840384216 blocks.
> >
> > > bread: Cannot read a block # 210096053.
>
> it looks like every block on these devices that is aboth about
> Block-Number 18000000 is declared as a bad block in reiserfs,

It's not declared as a bad block. It's just that reiserfs cannot read that, 
because your kernel cannot read it as well, and that's because the raid 
driver reports an error.

So *please* first make sure that the whole raid array is readable. Try 
something like 
dd if=/dev/sdf1 of=/dev/null
and see if it succeeds (i.e. it doesn't report an error before end of the raid 
device).

> in ext2fs
> that doesnt happen.
Try mke2fs -c /dev/sdf1
I'm quite sure it'll complain loudly (-c enables checking the device for read 
errors).

So it didn't happen in mke2fs probably because it just didn't try 
writing/reading from the bad blocks. 

AFAICT, you're definitely having some device access problem -- either your 
kernel is bad, or the raid driver in the kernel, or your raid controller is 
failing, or your motherboard, or your raid array is dying. Whatever it is, as 
long as kernel cannot read blocks from the device, you cannot use it, and it 
doesn't depend on reiserfs at all.

This thread is off-topic. You're having bad hardware. This has nothing to do 
with reiserfs.

Cheers, Kuba Ober
