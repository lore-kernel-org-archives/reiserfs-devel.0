From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: mkreiserfs and big RAID-Systems
Date: Mon, 15 Jul 2002 12:46:48 -0400
Message-ID: <200207151246.48372.kuba@mareimbrium.org>
References: <1026741573.30600.25.camel@pallas.IZS.FhG.de> <200207152008.51657.vitaly@namesys.com> <1026757533.32136.26.camel@pallas.IZS.FhG.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11016-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1026757533.32136.26.camel@pallas.IZS.FhG.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Abele <aba@IZS.FhG.de>
Cc: reiserfs-list@namesys.com

> > > Jul 16 01:26:39 saturn6 kernel:  I/O error: dev 08:51, sector 1680768424

> > This is likely to be a bad block. Run
> >     /sbin/badblock -b 4096 /dev/sdf1 210096053 210096053
> > or with some range.

> i tried the command

You couldn't. It should be badblocks, not badblock (or did you catch that?)

> but if i am right, i have to declare 120 G-Blocks
> as bad

You are not right. Read 
man badblocks
first, so that you have idea of what you're doing. The numbers (210096053) 
specify a range of 4096 byte long blocks to test.

He advised you to *test* reading from the supposedly bad block first, and 
that's why you should call badblocks on that block.

The thing is that the kernel has problems reading a block from your raid 
array:
> > > Jul 16 01:26:39 saturn6 kernel:  I/O error: dev 08:51, sector 1680768424
Fix that first. This has nothing to do with reiserfs -- reiserfs won't help if 
kernel cannot read a block from the device.

Cheers, Kuba Ober
