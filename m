From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] reiserfs: fix printk format warning
Date: Thu, 9 Apr 2009 13:58:03 -0700
Message-ID: <20090409135803.2c011dee.akpm@linux-foundation.org>
References: <20090403013437.GA29003@orion>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090403013437.GA29003@orion>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: jeffm@suse.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 3 Apr 2009 05:34:37 +0400
Alexander Beregalov <a.beregalov@gmail.com> wrote:

> Fix following warning message
> fs/reiserfs/procfs.c:393: warning: format '%u' expects type 'unsigned int', but argument 22 has type 'long unsigned int'
> introduced in 600ed4167
> (reiserfs: audit transaction ids to always be unsigned ints)
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> ---
> 
>  include/linux/reiserfs_fs_sb.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/include/linux/reiserfs_fs_sb.h b/include/linux/reiserfs_fs_sb.h
> index 5621d87..1d1594a 100644
> --- a/include/linux/reiserfs_fs_sb.h
> +++ b/include/linux/reiserfs_fs_sb.h
> @@ -193,7 +193,7 @@ struct reiserfs_journal {
>  	atomic_t j_wcount;	/* count of writers for current commit */
>  	unsigned long j_bcount;	/* batch count. allows turning X transactions into 1 */
>  	unsigned long j_first_unflushed_offset;	/* first unflushed transactions offset */
> -	unsigned long j_last_flush_trans_id;	/* last fully flushed journal timestamp */
> +	unsigned int j_last_flush_trans_id;	/* last fully flushed journal timestamp */
>  	struct buffer_head *j_header_bh;
>  
>  	time_t j_trans_start_time;	/* time this transaction started */

Yes, looking at the code I think it does want to be a u32.


