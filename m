From: Steven Cole <elenstev@mesatop.com>
Subject: Re: Results of "bk clone" tests with 2.6.2,  reiser4, reiserfs,=?iso-8859-1?q?	ext3?=, xfs and jfs
Date: Thu, 12 Feb 2004 05:54:53 -0700
Message-ID: <200402120554.53381.elenstev@mesatop.com>
References: <1076456354.1585.36.camel@spc.esa.lanl.gov> <402AB632.9080006@namesys.com> <402B2761.20500@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16775-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <402B2761.20500@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, nikita@namesys.com

On Thursday 12 February 2004 12:12 am, Hans Reiser wrote:
> Hans Reiser wrote:
> > Hmmm, we need to look into that.  Thanks Steven.  Zam, please analyze
> > just what fs operations this benchmark performs, report it, and then
> > analyze why we are slow.
>
> Zam, ignore this, I forgot that we already figured out that it was due
> to it being an sync intensive workload, and that bk would need to use
> sys_reiser4 instead of fsync if it wants to go fast with reiser4.

Thanks Hans.  When you get to where sys_reiser4 is usable, it might be
a good idea to add some notes regarding when it would be preferable
to the fs/Kconfig help section, or a pointer to file in Documentation.  Also,
on the -mm vs linus tree issue, the value of sys_reiser4 would be currently
about 277 in the -mm tree (vs 274 in linus), so that would be an additional
complication to folks trying to test in both.

Other bk-related loads to look at are:

bk -r co						# recursive bk checkout
bk export -tplain ../plain_text_tree	# export to a plain text tree

Steven
