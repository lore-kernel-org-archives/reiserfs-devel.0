From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: Corruption: --fix-fixable results in all nlink
 values = 0
Date: Fri, 16 Aug 2002 12:42:18 +0200
Message-ID: <m3y9b7w0dx.fsf@merlin.emma.line.org>
References: <200208152007.42370.degerrit@web.de>
	<200208152227.21766.vitaly@namesys.com>
	<200208152036.35333.degerrit@web.de>
	<200208152253.40413.vitaly@namesys.com>
	<20020815194425.GA21232@shuttle.mothership.home.dhs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11208-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020815194425.GA21232@shuttle.mothership.home.dhs.org> (Stefan
 Fleiter's message of "Thu, 15 Aug 2002 21:44:25 +0200")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Stefan Fleiter <stefan.fleiter@gmx.de> writes:

> Hi Vitaly!
>
> On Thu, 15 Aug 2002 Vitaly Fertman wrote:
>
>> Ah, I guess I know what happened. I think you have some fatal corruptions and 
>> rebuild-tree is required. In this case check and fix-fixable do not perform 
>> semantic check.
>
> Then reiserfsck should not start in fix-fixable mode when rebuild-tree is
> required.
> People think that fix-fiable is less dangerous. You have shown in some
> situations it is the other way round...
>
> I propos a new reiserfsck version with only this fix included!

Hum, if reiserfsck can tell if fix-fixable or rebuild-tree is the right
one, then it should also be able to abort the fix-fixable run and tell
the user to run rebuild-tree. Maybe such "needs-fix-fixable" and
"needs-rebuild-tree" flags should be stored into the super block, much
like ext2 stores the "file system with errors" condition.

-- 
Matthias Andree

