From: "Svetoslav Slavtchev" <svetljo@gmx.de>
Subject: Re: reiser4 as module (reiser4-2004.06.01-17.16-linux-2.6.7-rc1-mm1 )
Date: Thu, 3 Jun 2004 13:06:53 +0200 (MEST)
Message-ID: <27095.1086260813@www24.gmx.net>
References: <20040603102531.GL8091@backtop.namesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18989-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

> On Wed, Jun 02, 2004 at 01:46:09PM +0200, Svetoslav Slavtchev wrote:
> > Hi all,
> > 
> > i'm having problem with unresolved symbols,
> > when compiling the above auto bk-snapshot
> > with reiser4 as module, and i really need 
> > to compile it as module
> > 
> 
> try this fix:
> ========================================
> # This is a BitKeeper generated diff -Nru style patch.
> #
> # ChangeSet
> #   2004/06/03 14:07:30+04:00 zam@crimson.namesys.com 
> #   reiser4_clear_page_dirty: use page->mapping instead of the wrapper.
> # 
> # as_ops.c
> #   2004/06/03 14:07:26+04:00 zam@crimson.namesys.com +1 -1
> #   reiser4_clear_page_dirty: use page->mapping instead of the wrapper.
> # 
> diff -Nru a/as_ops.c b/as_ops.c
> --- a/as_ops.c	Thu Jun  3 14:20:25 2004
> +++ b/as_ops.c	Thu Jun  3 14:20:25 2004
> @@ -72,7 +72,7 @@
>  	struct address_space *mapping;
>  	unsigned long flags;
>  
> -	mapping = page_mapping(page);
> +	mapping = page->mapping;
>  	BUG_ON(mapping == NULL);
>  
>  	read_lock_irqsave(&mapping->tree_lock, flags);
> ========================================

thanks this fixes compile,

noe i gues is time to make clean recompile,
and see what happens :-)

-- 
"Sie haben neue Mails!" - Die GMX Toolbar informiert Sie beim Surfen!
Jetzt aktivieren unter http://www.gmx.net/info

