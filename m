From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: v3 experimental data=ordered and logging speedups for 2.6.1
Date: Mon, 19 Jan 2004 14:54:14 -0800
Sender: Mike Fedyk <mfedyk@srv-lnx2600.matchmail.com>
Message-ID: <20040119225414.GV1748@srv-lnx2600.matchmail.com>
References: <1074530725.29546.178.camel@tiny.suse.com> <200401192353.03670.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16577-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200401192353.03670.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com, green@linuxhacker.ru, Gerd Knorr <kraxel@suse.de>, Jeff Mahoney <jeffm@suse.com>

On Mon, Jan 19, 2004 at 11:53:03PM +0100, Dieter N?tzel wrote:
> An EXPORT was missing in linux/fs/buffer.c to compile ReiserFS 3.x.x as modul 
> (inode.c, unresolved symbol):
> 
> [-]
> int try_to_release_page(struct page *page, int gfp_mask)
> {
>         struct address_space * const mapping = page->mapping;
> 
>         if (!PageLocked(page))
>                 BUG();
>         if (PageWriteback(page))
>                 return 0;
> 
>         if (mapping && mapping->a_ops->releasepage)
>                 return mapping->a_ops->releasepage(page, gfp_mask);
>         return try_to_free_buffers(page);
> }
> EXPORT_SYMBOL(try_to_release_page);
> [-]
> 
> Up and running.

Uh, oh, I think several people won't like exporting that function...
