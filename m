From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: very messed up reiserfs with bad blocks
Date: Thu, 17 Jun 2004 15:32:43 +0400
Message-ID: <200406171532.43810.vitaly@namesys.com>
References: <Pine.GHP.4.44.0406152042570.27727-100000@elektron.its.tudelft.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19230-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.GHP.4.44.0406152042570.27727-100000@elektron.its.tudelft.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sebastiaan <S.Breedveld@ewi.tudelft.nl>, reiserfs-list@namesys.com

On Tuesday 15 June 2004 22:51, Sebastiaan wrote:
> High,
>
> On Mon, 14 Jun 2004, Henning Westerholt wrote:
> > Am Samstag, 12. Juni 2004 22:16 schrieb Sebastiaan:
> > > Hi,
> > >
> > > I have a problem with a reiserfs partition. Some days ago the drive
> > > reported bad blocks, so I ran the badblocks program tried to fix the
> > > filesystem with the badblocksoutput.
> > >
> > > Assuming I fixed the badblock list with 'reiserfsck --badblocks' I
> > > tried to access some (reported broken) files on that partition. This
> > > gave some I/O errors, so I thought I had to rebuild the tree
> > > (reiserfsck --badblocks --rebuild-tree). This failed, and the
> > > filesystem became unmountable (mount fails with 'mount: Not a
> > > directory').
> >
> > Hello,
> >
> > have you followed the instruction from
> > http://namesys.com/bad-block-handling.html ?
> >
> > Probably you have bad blocks in a system area, this is not supported by
> > reiserfs. Backup the partition with dd_rescue, and use fsck.reiserfs on
> > the backup.
>
> thanks, I read it, but without succes.
>
> Making an image of the drive and running the reiserfsck --rebuild-tree on
> that seems to have succes. Thanks for the hint.
>
> However, with current huge sizes of harddisks it is not always possible or
> hard to make an image on another harddisk. Now I am not an expert, but
> isn't it possible to add an option to fsck.reiserfs that can handle drives
> with bad blocks, i.e. when it encounters a bad block, treat it as zeros,
> sort of an emergency solution?

the problem is an attempt to read some blocks on your drive sometimes 
succeeds and sometimes fails. and even if reiserfsck finishes successfully 
the kernel may fail sometimes on IO operations. The approach you suggest 
is useful when included into both the progs and the kernel. But this would 
be excessive for the kernel. In other words, if you want to continue using 
this drive you have to find all such problem blocks before recovering. 
Some badblock detection algorithm could be included into reiserfsprogs 
also, but anyway it would be used before recovering by reiserfsck, for 
now you have to use /sbin/badblock and give the list of bad blocks to 
reiserfsck.

-- 
Thanks,
Vitaly Fertman

