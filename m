From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: very messed up reiserfs with bad blocks
Date: Mon, 14 Jun 2004 14:33:47 +0400
Message-ID: <200406141433.47772.vitaly@namesys.com>
References: <Pine.GHP.4.44.0406122215500.13459-100000@elektron.its.tudelft.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19175-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.GHP.4.44.0406122215500.13459-100000@elektron.its.tudelft.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sebastiaan <S.Breedveld@ewi.tudelft.nl>, reiserfs-list@namesys.com

On Sunday 13 June 2004 00:16, Sebastiaan wrote:
> Hi,

Hello, 

> I have a problem with a reiserfs partition. Some days ago the drive
> reported bad blocks, so I ran the badblocks program tried to fix the
> filesystem with the badblocksoutput.
>
> Assuming I fixed the badblock list with 'reiserfsck --badblocks' I tried
> to access some (reported broken) files on that partition. This gave some
> I/O errors, so I thought I had to rebuild the tree (reiserfsck --badblocks
> --rebuild-tree). This failed, and the filesystem became unmountable (mount
> fails with 'mount: Not a directory').
>
> I ran another badblock scan, and the number of badblocks grew
> substantially (from 11 in the first run to 177 in the second).
> --rebuild-tree failed again and again.
>
> Now the weird thing occured: running a third badblock scan didn't increase
> the amount of badblocks (as I should expect, since the badblock program
> runs on a lower level than the filesystem). It gave me 56 badblocks.

it seems rebuild-tree fails because new not expected badblocks appears.

> Now the following questions raised:
> - what causes the amount of bad blocks to fluctuate?
> - how can I access the filesystem again?

reiserfs badblock support is useful when you have permanent list of bad 
blocks. now your hardware is unrelable, probably the harddrive is dying, 
probably smth else. you should fix it before dealing with filesystem. if 
needed, make a copy of the partition (with dd_rescue) to another harddrive 
and fsck the copy.

> I know the drive is bad, so I am only into copying the contents off it as
> soon as possible. I have the idea the file allocation table is corrupted.
> Now --rebuild-tree won't help me, so I was hoping there is a backup of
> this FAT on the drive somewhere. I couldn't find it, so how does one deal
> with this thing under reiser?

> Thanks a lot in advance!
> Sebastiaan
>
>
> --
>
> English written by Dutch people is easily recognized by the improper use of
> 'In principle ...'
>
> The software box said 'Requires Windows 95 or better', so I installed
> Linux.
>
> Als Pacman in de jaren '80 de kinderen zo had be?nvloed zouden nu veel
> jongeren rondrennen in donkere zalen terwijl ze pillen eten en luisteren
> naar monotone electronische muziek. (Kristian Wilson, Nintendo, 1989)

-- 
Thanks,
Vitaly Fertman

