From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 22:01:15 +0400
Message-ID: <200308062201.15385.vitaly@namesys.com>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com> <20030806192227.B31496@bitwizard.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15187-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030806192227.B31496@bitwizard.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, Oleg Drokin <green@namesys.com>
Cc: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

Hi Rogier,

> Well, I forgot to say this in my last Email: but it's a big mistake
> for "--rebuild-tree" to START by writing to the filesystem. As for a
> large (and full) filesystem it is going to take HOURS to read the
> whole thing, the first write to the filesystem should happen AFTER
> reading all the datablocks.

Pass0 does not just read blocks and gather information, it fixes leaves 
of the internal reiserfs tree (storage tree), although it does not change
the internal tree itself and upper nodes. As it is run after --check which
has reported that there are fatal corruptions on the fs and rebuild-tree 
is needed, it is supposed that mounting of that fs may lead to other 
corruptions. So fs becomes notmountable and rebuild-tree must run 
to complition.

-- 
Thanks,
Vitaly Fertman
