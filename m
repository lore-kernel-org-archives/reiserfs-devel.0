From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: fsck.reiser4 wrong size error (?)
Date: Fri, 13 Aug 2004 13:16:12 +0400
Message-ID: <20040813091612.GF13834@backtop.namesys.com>
References: <cd32a06204080910256de4cc0e@mail.gmail.com> <200408122138.46787.frbiscani@jumpy.it> <200408130031.13061.vitaly@namesys.com> <200408122308.06962.frbiscani@jumpy.it>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20253-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408122308.06962.frbiscani@jumpy.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francesco Biscani <frbiscani@jumpy.it>
Cc: reiserfs-list@namesys.com

On Thu, Aug 12, 2004 at 11:08:06PM +0200, Francesco Biscani wrote:
> Hi,
> 
> On Thursday 12 August 2004 22:08, Alex Zarochentsev wrote:
> > a. mkfs.reiser4 has options to set default fibration plugin.
> > b. you can change fibration plugin for empty dir through metas/ interface.
> 
> and
> 
> On Thursday 12 August 2004 22:31, Vitaly Fertman wrote:
> > default plugins in progs play role for mkfs only, and they have nothing to
> > do with already created fs. You have created it with dot-o default, so the
> > current fibration fs default is dot-o, and you can change it for some
> > partitcular directory only, an empty one, with :
> > 	echo -e "ext-1\0" > dir/metas/plugin/fibration
> > Then all children will be created with with ext-1 also.
> 
> Thanks for the quick response Alex and Vitaly.
> 
> I know about the metas interface. What I would like to know, though, is:
> 
> 1) is there a way to have all newly created dirs default to ext-1 fibrate, 
> without re-creating the fs with mkfs?

Changing fs root dir fibration plugin would do that if the root dir was empty.
Current code does not allow it.  

So, the problen cannot be fully solved.  However, you can re-create all second
level sub-directories and assign another fibration plugins to them.

> 2) is there a place where a detailed description of mount options for reiser4 
> is available? I've googled around without much luck.

fs/reiser4/vfs_opts.c:reiser4_parse_options contains opts[] -- an array of 
all reiser4 mount option descriptions.

...
	opt_desc_t opts[] = {
		/* trace_flags=N

                   set trace flags to be N for this mount. N can be C numeric
		   literal recognized by %i scanf specifier.  It is treated as
		   bitfield filled by values of debug.h:reiser4_trace_flags
		   enum
		*/
		SB_FIELD_OPT(trace_flags, "%i"),
		/* log_flags=N
... 

> Thanks again,
>   Francesco

-- 
Alex.
