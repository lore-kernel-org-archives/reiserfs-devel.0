From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: --rebuild-tree always finds errors --check is ok
Date: Fri, 7 Jan 2005 23:43:08 +0300
Message-ID: <200501072343.08374.vitaly@namesys.com>
References: <41D71C4E.6000209@hanaden.com> <1104849038.32178.54.camel@tribesman.namesys.com> <41DAD195.1080306@hanaden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23075-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41DAD195.1080306@hanaden.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hanasaki <hanasaki@hanaden.com>, Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Tuesday 04 January 2005 20:25, hanasaki wrote:
> Version of reiserfsk
> ======================
> == From debian sarge
> /sbin/reiserfsck -V
> reiserfsck 3.6.19 (2003 www.namesys.com)
> == also used the version in knoppix 3.7 with similar results
>
> the output of two consecutive runs of --rebuild-tree on the same
> unmounted partition are attached.  Below is the diff

rebuild-tree finds some blocks that looks like reiserfs formatted 
blocks for the first sight whereas they are not and just belongs to 
some file bodies. The consistency check reveals no valid metadata 
in them, so they are considered as not valid reiserfs formatted blocks
and left not modified on disk. This is why the second run of rebuild-tree
finds them again and tries to do all the stuff again.

-- 
Thanks,
Vitaly Fertman


> diff data00-run1 data00-run0
> 14c14
> < 172168 directory entries were hashed with "r5" hash.
> ---
>
>  > 172167 directory entries were hashed with "r5" hash.
>
> Vladimir Saveliev wrote:
> > Hello
> >
> > On Sun, 2005-01-02 at 00:55, hanasaki wrote:
> >>Running reiser3 on kernel 2.6.10 and 2.6.9 with Debian sarge and
> >> unstable.
> >>
> >>the --rebuild-tree always finds errors and corrects them.  even when run
> >>more than once consecutively without mounting the partition in between.
> >
> > Please provide reiserfsck --rebuild-tree output.
> > What is version of your reiserfsck? (reiserfsck -V)
> >
> >>--check says all is good.


