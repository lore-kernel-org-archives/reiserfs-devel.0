From: Stefan Fleiter <stefan.fleiter@gmx.de>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Thu, 15 Aug 2002 21:44:25 +0200
Message-ID: <20020815194425.GA21232@shuttle.mothership.home.dhs.org>
References: <200208152007.42370.degerrit@web.de> <200208152227.21766.vitaly@namesys.com> <200208152036.35333.degerrit@web.de> <200208152253.40413.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11199-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200208152253.40413.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi Vitaly!

On Thu, 15 Aug 2002 Vitaly Fertman wrote:

> Ah, I guess I know what happened. I think you have some fatal corruptions and 
> rebuild-tree is required. In this case check and fix-fixable do not perform 
> semantic check.

Then reiserfsck should not start in fix-fixable mode when rebuild-tree is
required.
People think that fix-fiable is less dangerous. You have shown in some
situations it is the other way round...

I propos a new reiserfsck version with only this fix included!

Greets,
Stefan
