From: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Subject: Re: very messed up reiserfs with bad blocks
Date: Mon, 14 Jun 2004 11:11:25 +0200
Message-ID: <200406141111.25161.henning-04@die.informatik.uni-siegen.de>
References: <Pine.GHP.4.44.0406122215500.13459-100000@elektron.its.tudelft.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19172-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.GHP.4.44.0406122215500.13459-100000@elektron.its.tudelft.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Sebastiaan <S.Breedveld@ewi.tudelft.nl>

Am Samstag, 12. Juni 2004 22:16 schrieb Sebastiaan:
> Hi,
>
> I have a problem with a reiserfs partition. Some days ago the drive
> reported bad blocks, so I ran the badblocks program tried to fix the
> filesystem with the badblocksoutput.
>
> Assuming I fixed the badblock list with 'reiserfsck --badblocks' I tried
> to access some (reported broken) files on that partition. This gave some
> I/O errors, so I thought I had to rebuild the tree (reiserfsck --badblocks
> --rebuild-tree). This failed, and the filesystem became unmountable (mount
> fails with 'mount: Not a directory').

Hello,

have you followed the instruction from
http://namesys.com/bad-block-handling.html ?

Probably you have bad blocks in a system area, this is not supported by 
reiserfs. Backup the partition with dd_rescue, and use fsck.reiserfs on the 
backup. 

> I ran another badblock scan, and the number of badblocks grew
> substantially (from 11 in the first run to 177 in the second).
> --rebuild-tree failed again and again.
>
> Now the weird thing occured: running a third badblock scan didn't increase
> the amount of badblocks (as I should expect, since the badblock program
> runs on a lower level than the filesystem). It gave me 56 badblocks.
>
>
> Now the following questions raised:
> - what causes the amount of bad blocks to fluctuate?

Decent drives maps bad blocks away. They managed some spare blocks to cover 
effects with them. If your drive shows significant bad block counts, it is 
likely near the total failure. 
This remap process could cause the number of bad blocks to fluctuate.

> - how can I access the filesystem again?

You can try the dd_rescue mentioned above.

> I know the drive is bad, so I am only into copying the contents off it as
> soon as possible. I have the idea the file allocation table is corrupted.
> Now --rebuild-tree won't help me, so I was hoping there is a backup of
> this FAT on the drive somewhere. I couldn't find it, so how does one deal
> with this thing under reiser?
>
> Thanks a lot in advance!
> Sebastiaan

Good luck!

Henning
