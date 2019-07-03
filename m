From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] fs: reiserfs: journal: Change return type of
 dirty_one_transaction
Date: Wed, 3 Jul 2019 15:33:13 +0200
Message-ID: <20190703133313.GA16008@quack2.suse.cz>
References: <20190702175430.GA5882@hari-Inspiron-1545>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190702175430.GA5882@hari-Inspiron-1545>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Cc: Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Bharath Vedartham <linux.bhar@gmail.com>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue 02-07-19 23:24:30, Hariprasad Kelam wrote:
> Change return type of dirty_one_transaction from int to void. As this
> function always return success.
> 
> Fixes below issue reported by coccicheck
> fs/reiserfs/journal.c:1690:5-8: Unneeded variable: "ret". Return "0" on
> line 1719
> 
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>

I can see Andrew already picked up the cleanup. The patch looks good to me.
Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza


> ---
>  fs/reiserfs/journal.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> index 36346dc..4517a13 100644
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -94,7 +94,7 @@ static int journal_join(struct reiserfs_transaction_handle *th,
>  			struct super_block *sb);
>  static void release_journal_dev(struct super_block *super,
>  			       struct reiserfs_journal *journal);
> -static int dirty_one_transaction(struct super_block *s,
> +static void dirty_one_transaction(struct super_block *s,
>  				 struct reiserfs_journal_list *jl);
>  static void flush_async_commits(struct work_struct *work);
>  static void queue_log_writer(struct super_block *s);
> @@ -1682,12 +1682,11 @@ static int write_one_transaction(struct super_block *s,
>  }
>  
>  /* used by flush_commit_list */
> -static int dirty_one_transaction(struct super_block *s,
> +static void dirty_one_transaction(struct super_block *s,
>  				 struct reiserfs_journal_list *jl)
>  {
>  	struct reiserfs_journal_cnode *cn;
>  	struct reiserfs_journal_list *pjl;
> -	int ret = 0;
>  
>  	jl->j_state |= LIST_DIRTY;
>  	cn = jl->j_realblock;
> @@ -1716,7 +1715,6 @@ static int dirty_one_transaction(struct super_block *s,
>  		}
>  		cn = cn->next;
>  	}
> -	return ret;
>  }
>  
>  static int kupdate_transactions(struct super_block *s,
> -- 
> 2.7.4
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
