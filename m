From: Oleg Drokin <green@namesys.com>
Subject: Re: "no space left" but df -k shows plenty of free space
Date: Mon, 19 May 2003 20:02:08 +0400
Message-ID: <20030519160208.GA14048@namesys.com>
References: <3EC65671.DA1CB780@gmx.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14163-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EC65671.DA1CB780@gmx.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: D_i_F_i@gmx.de
Cc: reiserfs-list@namesys.com, mason@namesys.com

Hello!

On Sat, May 17, 2003 at 05:34:09PM +0200, D_i_F_i@gmx.de wrote:
> while copying some data into a logical volume with reiserfs as
> filesystem, I've got an error message, that there isn't enough
> space left on the device. Even just creating a new empty file
> isn't possible anymore:
> sammy:/opt/kgm/data/log # touch abc
> touch: creating `abc': No space left on device
> But the df-command has still reported quite a lot of free capacity:
> sammy:/opt/kgm/data/log # df -k /opt/kgm/data
> Filesystem        1k-blocks     Used Available Use% Mounted on
> /dev/kgmvg/datalv  10485436  7987364   2498072  77% /opt/kgm/data

Hm, this is pretty strange.

> Only after moving some of the files into another filesystem, I was
> able to store further files into this filesystem. So I guessed,
> that it should work if I extend the reiserfs by 2G (lvextend and
> resize_reiserfs). And as a matter of fact this enlargement worked.
> Now, df -k /opt/kfm/data shows:
> Filesystem        1k-blocks     Used Available Use% Mounted on
> /dev/kgmvg/datalv  12582524  7987360   4595164  64% /opt/kgm/data
> Now we can use the filesystem without problems but I fear that we
> will run into problems when the filesystem reaches 77% usage again.

Hm, it will be interesting if you try.
May be it will stop working when there is 2498072 blocks left again.

> The directory with the biggest number of files currently contains
> about 70.000 files. I don't think that this is a real challange for

This is unlikely to be a problem indeed.

> I'm using reiserfs version 3.6.25 [built into kernel] of a
> SLES7-Distribution (SuSE) on IBM zSeries (z900, z/VM) in
> 64-Bit-Mode (s390x). The filesystem has been resized

Hm, what kernel version do they ship?

> 3 times on the fly (in mounted state). Could it be, that this
> caused the filesystem to get damaged somehow? Or is there a bug

No, this is unlikely.

> in the df-command, that may cause it to report wrong values for
> free capacities? Can it be, that the last enlargement of
> the filesystem didn't do its full job so that the problem maybe
> disapeared with the next enlargement? Or is it necessary to delete
> and recreate the whole filesystem (which would cause us a lot of
> trouble)? Or what do you suggest?

My current idea that it might have the "blocks reserved for use by fsck"
checked incorrectly.

Chris: Where can I look at the patches that came with
SLES7-Distribution's kernel?

Bye,
    Oleg
