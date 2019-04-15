From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] fs/reiserfs/journal.c: Make remove_journal_hash static
Date: Mon, 15 Apr 2019 11:47:39 +0200
Message-ID: <20190415094739.GA13684@quack2.suse.cz>
References: <20190414112438.GA23266@bharath12345-Inspiron-5559>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190414112438.GA23266@bharath12345-Inspiron-5559>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bharath Vedartham <linux.bhar@gmail.com>
Cc: keescook@chromium.org, jack@suse.cz, arnd@arndb.de, akpm@linux-foundation.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun 14-04-19 16:54:38, Bharath Vedartham wrote:
> This fixes the -WDecl sparse warning in journal.c. Function was declared
> as static void but the definition was void.
> 
> Signed-off-by: Bharath Vedartham <linux.bhar@gmail.com>

Thanks! I've added your patch into my tree.

								Honza

> ---
>  fs/reiserfs/journal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> index 8a76f9d..36346dc 100644
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -1844,7 +1844,7 @@ static int flush_used_journal_lists(struct super_block *s,
>   * removes any nodes in table with name block and dev as bh.
>   * only touchs the hnext and hprev pointers.
>   */
> -void remove_journal_hash(struct super_block *sb,
> +static void remove_journal_hash(struct super_block *sb,
>  			 struct reiserfs_journal_cnode **table,
>  			 struct reiserfs_journal_list *jl,
>  			 unsigned long block, int remove_freed)
> -- 
> 2.7.4
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
