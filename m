From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: remove unused sched_count variable
Date: Mon, 27 Mar 2023 10:57:49 +0200
Message-ID: <20230327085749.feyfegzdjxqhymdu@quack3>
References: <20230326204459.1358553-1-trix@redhat.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1679907470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VsjdwQC1SQNlX4Ss19all/21eWMCxSr72u89IWVV3N8=;
        b=3NB+KVfA63hYNzd6cCOT0J91ZMysy4InCEVvnVWRQEVecqVkoF/PZK4nAw4K4GR2gCDtiN
        7Q5Rc95I4tErGOm+y7rXNbmD8J4HUjKGusyhe16EI5pcHsf/3xxzQSf9YcW1CX22M1ZqfT
        NiqcarGBdO3kOvdKbJ1Xbp5zx4PIyDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1679907470;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VsjdwQC1SQNlX4Ss19all/21eWMCxSr72u89IWVV3N8=;
        b=O/zS+lKt9iROId/HQmgAGxFMCy5PCQ62LGW6KPGAuidre1hh0+hViOJBt2Bk0rCYQDWdTH
        yUw4i7s+0KlhnCAw==
Content-Disposition: inline
In-Reply-To: <20230326204459.1358553-1-trix@redhat.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Rix <trix@redhat.com>
Cc: nathan@kernel.org, ndesaulniers@google.com, willy@infradead.org, akpm@linux-foundation.org, jack@suse.cz, jlayton@kernel.org, song@kernel.org, yi.zhang@huawei.com, bvanassche@acm.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev

On Sun 26-03-23 16:44:59, Tom Rix wrote:
> clang with W=1 reports
> fs/reiserfs/journal.c:3034:6: error: variable
>   'sched_count' set but not used [-Werror,-Wunused-but-set-variable]
>         int sched_count = 0;
>             ^
> This variable is not used so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks. I've added the fix to my tree.

								Honza

> ---
>  fs/reiserfs/journal.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> index 9ce4ec296b74..4d11d60f493c 100644
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -3031,7 +3031,6 @@ static int do_journal_begin_r(struct reiserfs_transaction_handle *th,
>  	unsigned int old_trans_id;
>  	struct reiserfs_journal *journal = SB_JOURNAL(sb);
>  	struct reiserfs_transaction_handle myth;
> -	int sched_count = 0;
>  	int retval;
>  	int depth;
>  
> @@ -3088,7 +3087,6 @@ static int do_journal_begin_r(struct reiserfs_transaction_handle *th,
>  		    ((journal->j_len + nblocks + 2) * 100) <
>  		    (journal->j_len_alloc * 75)) {
>  			if (atomic_read(&journal->j_wcount) > 10) {
> -				sched_count++;
>  				queue_log_writer(sb);
>  				goto relock;
>  			}
> -- 
> 2.27.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
