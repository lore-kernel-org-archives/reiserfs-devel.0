From: Sebastiaan <S.Breedveld@ewi.tudelft.nl>
Subject: Re: very messed up reiserfs with bad blocks
Date: Tue, 15 Jun 2004 20:51:17 +0200 (METDST)
Message-ID: <Pine.GHP.4.44.0406152042570.27727-100000@elektron.its.tudelft.nl>
References: <200406141111.25161.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19201-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406141111.25161.henning-04@die.informatik.uni-siegen.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

High,

On Mon, 14 Jun 2004, Henning Westerholt wrote:

> Am Samstag, 12. Juni 2004 22:16 schrieb Sebastiaan:
> > Hi,
> >
> > I have a problem with a reiserfs partition. Some days ago the drive
> > reported bad blocks, so I ran the badblocks program tried to fix the
> > filesystem with the badblocksoutput.
> >
> > Assuming I fixed the badblock list with 'reiserfsck --badblocks' I tried
> > to access some (reported broken) files on that partition. This gave some
> > I/O errors, so I thought I had to rebuild the tree (reiserfsck --badblocks
> > --rebuild-tree). This failed, and the filesystem became unmountable (mount
> > fails with 'mount: Not a directory').
>
> Hello,
>
> have you followed the instruction from
> http://namesys.com/bad-block-handling.html ?
>
> Probably you have bad blocks in a system area, this is not supported by
> reiserfs. Backup the partition with dd_rescue, and use fsck.reiserfs on the
> backup.
>
thanks, I read it, but without succes.

Making an image of the drive and running the reiserfsck --rebuild-tree on
that seems to have succes. Thanks for the hint.

However, with current huge sizes of harddisks it is not always possible or
hard to make an image on another harddisk. Now I am not an expert, but
isn't it possible to add an option to fsck.reiserfs that can handle drives
with bad blocks, i.e. when it encounters a bad block, treat it as zeros,
sort of an emergency solution?

Greetz,
Sebastiaan




--

English written by Dutch people is easily recognized by the improper use of 'In principle ...'

The software box said 'Requires Windows 95 or better', so I installed Linux.

Als Pacman in de jaren '80 de kinderen zo had be?nvloed zouden nu veel jongeren rondrennen
in donkere zalen terwijl ze pillen eten en luisteren naar monotone electronische muziek.
(Kristian Wilson, Nintendo, 1989)



