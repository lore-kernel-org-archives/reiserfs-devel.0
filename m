From: Gerrit Hannaert <degerrit@web.de>
Subject: Re: Corruption: --fix-fixable results in all nlink
 values = 0
Date: Fri, 16 Aug 2002 15:11:39 +0200
Message-ID: <3D5CFA0B.3030107@web.de>
References: <200208152007.42370.degerrit@web.de>	<200208152253.40413.vitaly@namesys.com>	<200208152329.40707.degerrit@web.de>	<200208161205.00550.vitaly@namesys.com> <3D5CBF08.4010308@web.de> <m3ptwjw00q.fsf@merlin.emma.line.org>
Reply-To: degerrit@web.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11206-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Cc: reiserfs-list@namesys.com

Hi Matthias,

>No way fsck caused these. The problems were there, you just did not see
>them, because you did not read the defective blocks before. Unless the
>drive has suffered inadequate treatment, (dropped, computer kicked or
>bumped into, overheat) better return it for warranty repair or
>replacement pretty soon; assuming it was bought in Germany, after 6
>months after purchase, YOU may have to prove the drive was defective on
>delivery, before that, the dealer will have to prove it was intact if he
>is to refuse warranty repair.
>
Is there a difference in the way reiserfs formats as opposed to ext2/3? 
Your mentioning the defective blocks were never read before reminds me 
of the fact that a Reiserfs format is much quicker than any other 
filesystem's format - does it mean anything? Perhaps it is good practice 
to run 'badblocks' before any initial format... if there is no option to 
format/scan or something.

>next time the block is written again. What drive type is this? (to find
>that out, use: cat /proc/ide/hda/model)
>  
>
This one is a MAXTOR 6L080J4. But I've seen these 'dma' issues with 
*all* my other drives as well (IBM-DTLA-307045, FUJITSU MPE3136AH) on 
different PCs with Intel and Via motherboards.
But honestly, I treat my drives very nicely... I swear :-)

- Gerrit


