From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: + reiser4-generic_sync_sb_inodes-doesnt-exist-anymore.patch added
 to -mm tree
Date: Wed, 02 Dec 2009 09:47:44 +0100
Message-ID: <4B1629B0.6070804@gmail.com>
References: <200912012354.nB1Ns6Va032376@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200912012354.nB1Ns6Va032376@imap1.linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: buchner.johannes@gmx.at, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

I am not sure if it works correctly (still don't have
a time to adjust reiser4 for the per-bdi stuff).

Well, let it be, I'll ack or make corrections later..

Thanks,
Edward.

akpm@linux-foundation.org wrote:
> The patch titled
>      reiser4: generic_sync_sb_inodes doesn't exist anymore
> has been added to the -mm tree.  Its filename is
>      reiser4-generic_sync_sb_inodes-doesnt-exist-anymore.patch
>
> Before you just go and hit "reply", please:
>    a) Consider who else should be cc'ed
>    b) Prefer to cc a suitable mailing list as well
>    c) Ideally: find the original patch on the mailing list and do a
>       reply-to-all to that, adding suitable additional cc's
>
> *** Remember to use Documentation/SubmitChecklist when testing your code ***
>
> See http://userweb.kernel.org/~akpm/stuff/added-to-mm.txt to find
> out what to do about this
>
> The current -mm tree may be found at http://userweb.kernel.org/~akpm/mmotm/
>
> ------------------------------------------------------
> Subject: reiser4: generic_sync_sb_inodes doesn't exist anymore
> From: Johannes Buchner <buchner.johannes@gmx.at>
>
>   
>> generic_sync_sb_inodes was removed in d8a8559cd7a9cc,
>> writeback_inodes_sb and sync_inodes_sb should replace them.
>>     
> Second version, now also fixes the last comments relating to
> generic_sync_sb_inodes.
>
> Cc: Edward Shishkin <edward.shishkin@gmail.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>
>  fs/reiser4/context.h   |    2 +-
>  fs/reiser4/entd.c      |    4 +++-
>  fs/reiser4/super_ops.c |    6 ++++--
>  3 files changed, 8 insertions(+), 4 deletions(-)
>
> diff -puN fs/reiser4/context.h~reiser4-generic_sync_sb_inodes-doesnt-exist-anymore fs/reiser4/context.h
> --- a/fs/reiser4/context.h~reiser4-generic_sync_sb_inodes-doesnt-exist-anymore
> +++ a/fs/reiser4/context.h
> @@ -66,7 +66,7 @@ struct reiser4_context {
>  	/* count non-trivial jnode_set_dirty() calls */
>  	unsigned long nr_marked_dirty;
>  
> -	/* reiser4_sync_inodes calls (via generic_sync_sb_inodes)
> +	/* reiser4_sync_inodes calls (via writeback/sync_inodes_sb)
>  	 * reiser4_writepages for each of dirty inodes. Reiser4_writepages
>  	 * captures pages. When number of pages captured in one
>  	 * reiser4_sync_inodes reaches some threshold - some atoms get
> diff -puN fs/reiser4/entd.c~reiser4-generic_sync_sb_inodes-doesnt-exist-anymore fs/reiser4/entd.c
> --- a/fs/reiser4/entd.c~reiser4-generic_sync_sb_inodes-doesnt-exist-anymore
> +++ a/fs/reiser4/entd.c
> @@ -241,7 +241,9 @@ static void entd_flush(struct super_bloc
>  	if (rq->wbc->nr_to_write > 0) {
>  		rq->wbc->range_start = 0;
>  		rq->wbc->range_end = LLONG_MAX;
> -		generic_sync_sb_inodes(rq->wbc);
> +		writeback_inodes_sb(super);
> +		if (rq->wbc->sync_mode == WB_SYNC_ALL)
> +			sync_inodes_sb(super);
>  	}
>  	rq->wbc->nr_to_write = ENTD_CAPTURE_APAGE_BURST;
>  	reiser4_writeout(super, rq->wbc);
> diff -puN fs/reiser4/super_ops.c~reiser4-generic_sync_sb_inodes-doesnt-exist-anymore fs/reiser4/super_ops.c
> --- a/fs/reiser4/super_ops.c~reiser4-generic_sync_sb_inodes-doesnt-exist-anymore
> +++ a/fs/reiser4/super_ops.c
> @@ -384,7 +384,7 @@ static void reiser4_clear_inode(struct i
>   * @wbc:
>   *
>   * This method is called by background and non-backgound writeback. Reiser4's
> - * implementation uses generic_sync_sb_inodes to call reiser4_writepages for
> + * implementation uses writeback/sync_inodes_sb to call reiser4_writepages for
>   * each of dirty inodes. Reiser4_writepages handles pages dirtied via shared
>   * mapping - dirty pages get into atoms. Writeout is called to flush some
>   * atoms.
> @@ -412,7 +412,9 @@ static void reiser4_sync_inodes(struct s
>  	 * call reiser4_writepages for each of dirty inodes to turn dirty pages
>  	 * into transactions if they were not yet.
>  	 */
> -	generic_sync_sb_inodes(wbc);
> +	writeback_inodes_sb(super);
> +	if (wbc->sync_mode == WB_SYNC_ALL)
> +		sync_inodes_sb(super);
>  
>  	/* flush goes here */
>  	wbc->nr_to_write = to_write;
> _
>
> Patches currently in -mm which might be from buchner.johannes@gmx.at are
>
> reiser4-some-changes-from-reiser4-2631-patch.patch
> reiser4-some-comments-were-still-mentioning-pdflush.patch
> reiser4-generic_sync_sb_inodes-doesnt-exist-anymore.patch
> reiser4-fixed-null-pointer-dereference.patch
>
>
>   

