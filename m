From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Fri, 16 Aug 2002 21:34:16 +0400
Message-ID: <200208162134.16057.vitaly@namesys.com>
References: <200208152007.42370.degerrit@web.de> <20020815194425.GA21232@shuttle.mothership.home.dhs.org> <m3y9b7w0dx.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11212-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3y9b7w0dx.fsf@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>, reiserfs-list@namesys.com

On Friday 16 August 2002 14:42, Matthias Andree wrote:
> Stefan Fleiter <stefan.fleiter@gmx.de> writes:
> > Hi Vitaly!
> >
> > On Thu, 15 Aug 2002 Vitaly Fertman wrote:
> >> Ah, I guess I know what happened. I think you have some fatal
> >> corruptions and rebuild-tree is required. In this case check and
> >> fix-fixable do not perform semantic check.
> >
> > Then reiserfsck should not start in fix-fixable mode when rebuild-tree is
> > required.
> > People think that fix-fiable is less dangerous. You have shown in some
> > situations it is the other way round...
> >
> > I propos a new reiserfsck version with only this fix included!
>
> Hum, if reiserfsck can tell if fix-fixable or rebuild-tree is the right
> one, then it should also be able to abort the fix-fixable run and tell
> the user to run rebuild-tree. Maybe such "needs-fix-fixable" and
> "needs-rebuild-tree" flags should be stored into the super block, much
> like ext2 stores the "file system with errors" condition.

The problem is that between check and fix-fixable/rebuild-tree a user can 
do some actions which can lead to changing the state of the fs. One wants 
to mount it as he cannot afford to run rebuild-tree at the time, this may  
lead to fatal corruptions on the fs. Even if we won't allow a such fs to be 
mountable, old kernels will continue doing it, so SB flags do not help a lot. 

The last decision after some discussion was to leave ulinks recovering in 
the rebuild-tree only.

-- 

Thanks,
Vitaly Fertman


