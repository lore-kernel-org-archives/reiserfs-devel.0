From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: Corruption: --fix-fixable results in all nlink
 values = 0
Date: Fri, 16 Aug 2002 16:12:43 +0200
Message-ID: <m3wuqqq4dg.fsf@merlin.emma.line.org>
References: <200208152007.42370.degerrit@web.de>
	<200208152253.40413.vitaly@namesys.com>
	<200208152329.40707.degerrit@web.de>
	<200208161205.00550.vitaly@namesys.com> <3D5CBF08.4010308@web.de>
	<m3ptwjw00q.fsf@merlin.emma.line.org> <3D5CFA0B.3030107@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11207-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D5CFA0B.3030107@web.de> (Gerrit Hannaert's message of "Fri,
 16 Aug 2002 15:11:39 +0200")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Gerrit Hannaert <degerrit@web.de> writes:

> Is there a difference in the way reiserfs formats as opposed to ext2/3?
> Your mentioning the defective blocks were never read before reminds me

Well, the long explanation is, that the blocks may not have been used
for some time, or that they have gone bad recently, such things happen,
although you'd expect that from DTLA-3070xx drives earlier than from
others.

> of the fact that a Reiserfs format is much quicker than any other
> filesystem's format - does it mean anything?

The on-disk layout is different, but I'm not aware of the internals, and
I don't believe that the allocation pattern changes anything about the
facts.

> Perhaps it is good practice to run 'badblocks' before any initial
> format... if there is no option to format/scan or something.

Neither mke2fs nor mkreiserfs read or write all blocks when formatting,
they instead write some meta data, and that's it. Of course, running
badblocks prior to formatting is an option to find these earlier.

> This one is a MAXTOR 6L080J4. But I've seen these 'dma' issues with
> *all* my other drives as well (IBM-DTLA-307045, FUJITSU MPE3136AH) on
> different PCs with Intel and Via motherboards.

It's not "dma" but the "unrecoverable error" part that matters. The DMA
trips over as consequence of this defective block (there is no data that
could be transferred), the DMA is *not* the cause for the bad block.

-- 
Matthias Andree
