From: Gerrit Hannaert <degerrit@web.de>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Thu, 15 Aug 2002 22:02:08 +0200
Message-ID: <200208152202.08611.degerrit@web.de>
References: <200208152007.42370.degerrit@web.de> <200208152253.40413.vitaly@namesys.com> <20020815194425.GA21232@shuttle.mothership.home.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11200-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020815194425.GA21232@shuttle.mothership.home.dhs.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 15 August 2002 21:44, Stefan Fleiter wrote:
> Hi Vitaly!
>
> On Thu, 15 Aug 2002 Vitaly Fertman wrote:
> > Ah, I guess I know what happened. I think you have some fatal corruptio=
ns
> > and rebuild-tree is required. In this case check and fix-fixable do not
> > perform semantic check.
>
> Then reiserfsck should not start in fix-fixable mode when rebuild-tree is
> required.
> People think that fix-fiable is less dangerous. You have shown in some
> situations it is the other way round...
>
> I propos a new reiserfsck version with only this fix included!
>
> Greets,
> Stefan


I admit the warning in the man page wasn't scary enough to me and led me to=
=20
believe it was less dangerous, and thus worth a try first. It also seems
better to me to not allow fix-fixable to run in situations where it will no=
t run=20
properly (ie where a rebuild-tree is required)

Ciao,
=2D Gerrit

"--fix-fixable
This option recovers certain kinds of corruption that do not require  rebui=
lding  the  entire  file  system  tree
(--rebuild-tree).  Normally you only need this option if the --check option=
 reports "corruption that can be fixed
with --fix-fixable". This includes: zeroing invalid data-block pointers, co=
rrecting  st_size  and  st_blocks  for
directories, and deleting invalid directory entries."

