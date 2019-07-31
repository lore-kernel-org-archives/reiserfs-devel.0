From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] fs: reiserfs: Remove unnecessary check of bh in
 remove_from_transaction()
Date: Wed, 31 Jul 2019 11:48:19 +0200
Message-ID: <20190731094819.GB15806@quack2.suse.cz>
References: <20190727084019.11307-1-baijiaju1990@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190727084019.11307-1-baijiaju1990@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Cc: jack@suse.cz, akpm@linux-foundation.org, arnd@arndb.de, hariprasad.kelam@gmail.com, linux.bhar@gmail.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat 27-07-19 16:40:19, Jia-Ju Bai wrote:
> On lines 3430-3434, bh has been assured to be non-null:
>     cn = get_journal_hash_dev(sb, journal->j_hash_table, blocknr);
>     if (!cn || !cn->bh) {
>         return ret;
>     }
>     bh = cn->bh;
> 
> Thus, the check of bh on line 3447 is unnecessary and can be removed.
> Thank Andrew Morton for good advice.
> 
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/reiserfs/journal.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> index 4517a1394c6f..11155b8513db 100644
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -3444,9 +3444,8 @@ static int remove_from_transaction(struct super_block *sb,
>  	if (cn == journal->j_last) {
>  		journal->j_last = cn->prev;
>  	}
> -	if (bh)
> -		remove_journal_hash(sb, journal->j_hash_table, NULL,
> -				    bh->b_blocknr, 0);
> +	remove_journal_hash(sb, journal->j_hash_table, NULL,
> +			    bh->b_blocknr, 0);
>  	clear_buffer_journaled(bh);	/* don't log this one */
>  
>  	if (!already_cleaned) {
> -- 
> 2.17.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
