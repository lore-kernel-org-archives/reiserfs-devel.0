From: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Subject: Re: very messed up reiserfs with bad blocks
Date: Tue, 15 Jun 2004 22:52:00 +0200
Message-ID: <200406152252.00958.henning-04@die.informatik.uni-siegen.de>
References: <Pine.GHP.4.44.0406152042570.27727-100000@elektron.its.tudelft.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19203-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.GHP.4.44.0406152042570.27727-100000@elektron.its.tudelft.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Sebastiaan <S.Breedveld@ewi.tudelft.nl>

Am Dienstag, 15. Juni 2004 20:51 schrieb Sebastiaan:
> High,

Hello,

just returning from the football match on tv, 1:1 - not so bad.. ;-)

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

Good to hear that.

> However, with current huge sizes of harddisks it is not always possible or
> hard to make an image on another harddisk. Now I am not an expert, but
> isn't it possible to add an option to fsck.reiserfs that can handle drives
> with bad blocks, i.e. when it encounters a bad block, treat it as zeros,
> sort of an emergency solution?
>
> Greetz,
> Sebastiaan

Reiser4 have badblock support build in, hopefully it is ready soon. I don't 
know if its possible to modify the fsck, perhaps someone from namesys could 
answer this?

But i think they would like to concentrate on the new code.


Best regards,

Henning
