From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: no space left, rebuild-tree not finished, partition not mountable
Date: Tue, 4 May 2004 14:04:32 +0400
Message-ID: <200405041404.32072.vitaly@namesys.com>
References: <200405011338.i41Dcc515982@p15097155.pureserver.info> <20040501191834.GA2743@hello-penguin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18427-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040501191834.GA2743@hello-penguin.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefan Traby <stefan@hello-penguin.com>, hkj@dmkuhlen.de
Cc: reiserfs-list@namesys.com

On Saturday 01 May 2004 23:18, Stefan Traby wrote:
> On Sat, May 01, 2004 at 03:38:38PM +0200, hkj@dmkuhlen.de wrote:
> > Hi List!
> >
> > I want to mount a partition to delete some files, because there isn't
> > any space on the partition anymore. I cannot mount it, because
> > --rebuild-tree didn't finish. It didn't finish, because there isn't
> > enought space on the partition anymore. So what should I do?
> >
> > It's a ~110G Partition. I did dd_rescue to another device and
> > --rebuild-tree but still having the same problems.
> >
> > Any hints?
>
> It would be against logic if dd_rescure would solve your problem.
>
> You could try (but I really don't know if it works) the following:
>
> "dd" your partition to a larger one and try to run "resize_reiserfs"
> on the copy to enlarge it. Run --rebuild-tree afterwards.

resize_reiserfs will not work on this fs because rebuild-tree was not 
finished. you should run 'reiserfsck --rebuild-sb' after copying to set 
the fs size to the partition size and then as was mentioned 'reiserfsck 
--rebuild-tree'.
It would be better also to zero the end of the targer partition to not 
get the mix with metadata of a previous reiserfs, if you ever had a 
reiserfs there.

> If resize_reiserfs fails (I don't know if it checks filesystem
> consistency before extending) patch the correspondending check simply out
> of resize_reiserfs.
>
> This is very experimental but in worst case you loose some time because
> you working on a copy of your partition.
>
> Good luck, but I guess that other people may offer you better
> solutions...

-- 
Thanks,
Vitaly Fertman

