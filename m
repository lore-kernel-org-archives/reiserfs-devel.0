From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: Corruption: --fix-fixable results in all nlink
 values = 0
Date: Fri, 16 Aug 2002 12:50:13 +0200
Message-ID: <m3ptwjw00q.fsf@merlin.emma.line.org>
References: <200208152007.42370.degerrit@web.de>
	<200208152253.40413.vitaly@namesys.com>
	<200208152329.40707.degerrit@web.de>
	<200208161205.00550.vitaly@namesys.com> <3D5CBF08.4010308@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11205-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D5CBF08.4010308@web.de> (Gerrit Hannaert's message of "Fri,
 16 Aug 2002 10:59:52 +0200")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Gerrit Hannaert <degerrit@web.de> writes:

> I ran reiserfsck a second time, and this time it stopped later.
> The strange thing is this disk and installation are relatively new
> (March 2002), and digging back through syslogs shows occurances
> (kernel)(.*)(hda) only on:
> 4 May 20 (2 sectors)
> 370 Aug 15 (>100 different sectors involved)
> 34 Aug 16 (17 sectors)
>
> ...which means the problems only really started by all this fsck
> stuff.

No way fsck caused these. The problems were there, you just did not see
them, because you did not read the defective blocks before. Unless the
drive has suffered inadequate treatment, (dropped, computer kicked or
bumped into, overheat) better return it for warranty repair or
replacement pretty soon; assuming it was bought in Germany, after 6
months after purchase, YOU may have to prove the drive was defective on
delivery, before that, the dealer will have to prove it was intact if he
is to refuse warranty repair.

>> Aug 15 23:16:31 luna kernel: hda: dma_intr: status=0x51 { DriveReady
>> SeekComplete Error }
>> Aug 15 23:16:31 luna kernel: hda: dma_intr: error=0x40 {
>> UncorrectableError }, LBAsect=9641711

Your drive is broken. Such things can happen for a block or two after
power failure in the mid of a write process and will then go away the
next time the block is written again. What drive type is this? (to find
that out, use: cat /proc/ide/hda/model)

-- 
Matthias Andree

