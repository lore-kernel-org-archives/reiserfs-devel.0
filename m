From: Andreas Abele <aba@IZS.FhG.de>
Subject: Re: mkreiserfs and big RAID-Systems
Date: 15 Jul 2002 20:25:33 +0200
Message-ID: <1026757533.32136.26.camel@pallas.IZS.FhG.de>
References: <1026741573.30600.25.camel@pallas.IZS.FhG.de>
	<200207151824.47086.vitaly@namesys.com>
	<1026751348.32136.14.camel@pallas.IZS.FhG.de> 
	<200207152008.51657.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11014-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200207152008.51657.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Hi Vitaly,

Am Mon, 2002-07-15 um 18.08 schrieb Vitaly Fertman:
> > Here is the result
> > [root@saturn6 mkreiserfs]# ./mkreiserfs /dev/sdf1
> > Count of blocks on the device: 210096054
> 
> As you can see block number is correct - 840384216 blocks.
> 
> > bread: Cannot read a block # 210096053.
it looks like every block on these devices that is aboth about
Block-Number 18000000 is declared as a bad block in reiserfs, in ext2fs
that doesnt happen. (Thats why i hve tried 'mkreiserfs /dev/sdf1
190000000) and i got ' bread: Cannot read a block # 189999999.'

> This is likely to be a bad block. Run 
>     /sbin/badblock -b 4096 /dev/sdf1 210096053 210096053 
> or with some range.
> 
i tried the command, but if i am right, i have to declare 120 G-Blocks
as bad, and i dont believe that in every of my 5 RAID-Systems there is
exactly 1 defect Harddisk.

thanks
Andreas Abele


