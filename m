From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 wrong size error (?)
Date: Fri, 13 Aug 2004 00:31:13 +0400
Message-ID: <200408130031.13061.vitaly@namesys.com>
References: <cd32a06204080910256de4cc0e@mail.gmail.com> <200408102009.39695.frbiscani@jumpy.it> <200408122138.46787.frbiscani@jumpy.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20243-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408122138.46787.frbiscani@jumpy.it>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Francesco Biscani <frbiscani@jumpy.it>, reiserfs-list@namesys.com

On Thursday 12 August 2004 23:38, Francesco Biscani wrote:
> On Tuesday 10 August 2004 20:09, Francesco Biscani wrote:
> > Hi,
> >
> > > are messages about 'wrong size' or about 'wrong bytes' or both?
> >
> > I'm _almost_ sure it's about "wrong bytes". I'll confirm ASAP. Are they
> > potentially harmful?
> >
> > Oh, BTW, "debugfs -C" worked ok here.
> >
> > Regards,
> >
> >   Francesco
>
> An update for those interested:
>
> - it was a "wrong bytes" message. All the bytes of affected objects were
> doubled. Corrected with --fix and using now auto-snapshot for
> 2.6.8-rc4-mm1. Let's see if it happens again.

this was fixed recently.

> - debugfs -C worked ok also on my / partition.
>
> BTW, debugfs -p showed also that the default plugin for fibration was
> changed, from dot-o to ext-1. But if I create a dir it is still
> dot-o-fibrated. Am I missing something here? Should I mount with some
> special options to have ext-1 fibration as default?

default plugins in progs play role for mkfs only, and they have nothing to
do with already created fs. You have created it with dot-o default, so the 
current fibration fs default is dot-o, and you can change it for some partitcular 
directory only, an empty one, with :
	echo -e "ext-1\0" > dir/metas/plugin/fibration
Then all children will be created with with ext-1 also.

-- 
Thanks,
Vitaly Fertman

