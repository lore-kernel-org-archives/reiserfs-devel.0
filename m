From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: mkreiserfs and big RAID-Systems
Date: Mon, 15 Jul 2002 20:41:52 +0400
Message-ID: <200207152041.52038.vitaly@namesys.com>
References: <1026741573.30600.25.camel@pallas.IZS.FhG.de> <200207152008.51657.vitaly@namesys.com> <1026757533.32136.26.camel@pallas.IZS.FhG.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11015-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1026757533.32136.26.camel@pallas.IZS.FhG.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Abele <aba@IZS.FhG.de>
Cc: reiserfs-list@namesys.com

> Hi Vitaly,
>
> Am Mon, 2002-07-15 um 18.08 schrieb Vitaly Fertman:
> > > Here is the result
> > > [root@saturn6 mkreiserfs]# ./mkreiserfs /dev/sdf1
> > > Count of blocks on the device: 210096054
> >
> > As you can see block number is correct - 840384216 blocks.
> >
> > > bread: Cannot read a block # 210096053.
>
> it looks like every block on these devices that is aboth about
> Block-Number 18000000 is declared as a bad block in reiserfs, in ext2fs
> that doesnt happen. (Thats why i hve tried 'mkreiserfs /dev/sdf1
> 190000000) and i got ' bread: Cannot read a block # 189999999.'

Badblocks list is still disabled in reiserfs. And mkreiserfs just want
to read that block and the kernel (not reiserfs part of it) prints I/O 
error into syslog.

> > This is likely to be a bad block. Run
> >     /sbin/badblock -b 4096 /dev/sdf1 210096053 210096053
> > or with some range.
>
> i tried the command, but if i am right, i have to declare 120 G-Blocks
> as bad, and i dont believe that in every of my 5 RAID-Systems there is
> exactly 1 defect Harddisk.

badblock tests disk blocks, not reiserfs. And as you can see you cannot 
access some blocks on your device. This is not reiserfs problem. Test with
badblock that harddisk separately, test your RAID configuration, etc.

-- 

Thanks,
Vitaly Fertman
