From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: fsck.reiser4 wrong size error (?)
Date: Fri, 13 Aug 2004 00:08:15 +0400
Message-ID: <20040812200815.GB13834@backtop.namesys.com>
References: <cd32a06204080910256de4cc0e@mail.gmail.com> <200408102156.00690.vitaly@namesys.com> <200408102009.39695.frbiscani@jumpy.it> <200408122138.46787.frbiscani@jumpy.it>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20241-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408122138.46787.frbiscani@jumpy.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francesco Biscani <frbiscani@jumpy.it>
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

On Thu, Aug 12, 2004 at 09:38:46PM +0200, Francesco Biscani wrote:
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
> doubled. Corrected with --fix and using now auto-snapshot for 2.6.8-rc4-mm1. 
> Let's see if it happens again.
> - debugfs -C worked ok also on my / partition.
> 
> BTW, debugfs -p showed also that the default plugin for fibration was changed, 
> from dot-o to ext-1. But if I create a dir it is still dot-o-fibrated. Am I 
> missing something here? Should I mount with some special options to have 
> ext-1 fibration as default?

a. mkfs.reiser4 has options to set default fibration plugin.
b. you can change fibration plugin for empty dir through metas/ interface.

darkstar:/mnt/testfs # mkdir foo
darkstar:/mnt/testfs # cat foo/metas/plugin/fibration ; echo
2 ext-1 fibrate file by single character extension
darkstar:/mnt/testfs # echo -e "dot-o\0" > foo/metas/plugin/fibration
darkstar:/mnt/testfs # cat foo/metas/plugin/fibration ; echo
1 dot-o fibrate .o files separately

darkstar:/mnt/testfs # mkdir foo/bar
darkstar:/mnt/testfs # cat foo/bar/metas/plugin/fibration
1 dot-o fibrate .o files separately

> Thanks,
> 
>   Francesco

-- 
Alex.
