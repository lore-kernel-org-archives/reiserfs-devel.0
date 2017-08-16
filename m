From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: fix spelling mistake: "tranasction" ->
 "transaction"
Date: Wed, 16 Aug 2017 16:00:36 +0200
Message-ID: <20170816140036.GE4898@quack2.suse.cz>
References: <20170816080620.8440-1-colin.king@canonical.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170816080620.8440-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@kernel.org>, Jens Axboe <axboe@fb.com>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed 16-08-17 09:06:20, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in reiserfs_warning message
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks. Added to my tree. BTW, why did you CC Ingo and Jens?

								Honza

> ---
>  fs/reiserfs/journal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> index a11d773e5ff3..0c882a0e2a6e 100644
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -1481,7 +1481,7 @@ static int flush_journal_list(struct super_block *s,
>  		if ((!was_jwait) && !buffer_locked(saved_bh)) {
>  			reiserfs_warning(s, "journal-813",
>  					 "BAD! buffer %llu %cdirty %cjwait, "
> -					 "not in a newer tranasction",
> +					 "not in a newer transaction",
>  					 (unsigned long long)saved_bh->
>  					 b_blocknr, was_dirty ? ' ' : '!',
>  					 was_jwait ? ' ' : '!');
> -- 
> 2.11.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
