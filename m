From: Oleg Drokin <green@linuxhacker.ru>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty before marking them writeback.
Date: Fri, 9 Oct 2015 11:29:37 -0400
Message-ID: <88C5BFE1-64F7-4C7F-98EC-C5E313517F4B@linuxhacker.ru>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com> <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, edward.shishkin@gmail.com

Hello!

On Oct 9, 2015, at 7:16 AM, Ivan Shapovalov wrote:

> Ref.: https://www.mail-archive.com/linux-f2fs-devel%40lists.sourceforge.net/msg02745.html
> 
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
> 
> Lustre seemed to encounter the same oops and fixed it in a different way, removing
> set_page_writeback() altogether:
> https://lkml.org/lkml/2015/7/30/806
> 
> We cannot just remove the call to set_page_writeback() at least because later
> we wait on PG_Writeback flag of that page (in jwait_io())... What is meant by
> "synchronous write" in that Lustre patch? Is our write "synchronous" in the
> same sense? I don't know VFS well. Cc'ing Oleg.

In case of Lustre synchronous write is a special kind of write where the
client sends the RPC to server right away from the write syscall
(as opposed to using wrteback cache) because it lacks server credits
or quote to cache the write.
The bug in Lustre case was that set_page_writeback was called on a page
that was not dirtied previously, that's why getting rid of set_page_writeback
made sense (since the page was not making the cache, no point in accounting for
it).

If you do cache the dirty page, you cannot get rid of this page_dirty setting,
and instead you just need to ensure the page was marked dirty beforehand,
most likely at some place that really set the page dirty, but forgot to tell VFS.

Probably look at who added the page into this list that you are iterating in this function?

> 
> fs/reiser4/wander.c | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/fs/reiser4/wander.c b/fs/reiser4/wander.c
> index ce20d50..0e2c105 100644
> --- a/fs/reiser4/wander.c
> +++ b/fs/reiser4/wander.c
> @@ -782,7 +782,9 @@ static int write_jnodes_to_disk_extent(
> 					node_plugin_by_node(JZNODE(cur))->csum(JZNODE(cur), 0);
> 				zrelse(JZNODE(cur));
> 			}
> +
> 			ClearPageError(pg);
> +			set_page_dirty_notag(pg);
> 			set_page_writeback(pg);
> 
> 			if (get_current_context()->entd) {
> -- 
> 2.6.0

