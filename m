From: Francesco Biscani <frbiscani@jumpy.it>
Subject: Re: fsck.reiser4 wrong size error (?)
Date: Thu, 12 Aug 2004 23:08:06 +0200
Message-ID: <200408122308.06962.frbiscani@jumpy.it>
References: <cd32a06204080910256de4cc0e@mail.gmail.com> <200408122138.46787.frbiscani@jumpy.it> <200408130031.13061.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20245-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408130031.13061.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Vitaly Fertman <vitaly@namesys.com>, Alex Zarochentsev <zam@namesys.com>

Hi,

On Thursday 12 August 2004 22:08, Alex Zarochentsev wrote:
> a. mkfs.reiser4 has options to set default fibration plugin.
> b. you can change fibration plugin for empty dir through metas/ interface.

and

On Thursday 12 August 2004 22:31, Vitaly Fertman wrote:
> default plugins in progs play role for mkfs only, and they have nothing to
> do with already created fs. You have created it with dot-o default, so the
> current fibration fs default is dot-o, and you can change it for some
> partitcular directory only, an empty one, with :
> 	echo -e "ext-1\0" > dir/metas/plugin/fibration
> Then all children will be created with with ext-1 also.

Thanks for the quick response Alex and Vitaly.

I know about the metas interface. What I would like to know, though, is:

1) is there a way to have all newly created dirs default to ext-1 fibrate, 
without re-creating the fs with mkfs?
2) is there a place where a detailed description of mount options for reiser4 
is available? I've googled around without much luck.

Thanks again,

  Francesco
