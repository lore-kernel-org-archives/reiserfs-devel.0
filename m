From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH V2] fs/reiserfs/stree.c: remove obsolete __constant
Date: Thu, 15 May 2014 00:01:44 +0200
Message-ID: <20140514220143.GA20841@quack.suse.cz>
References: <20140503223324.4357f591dc8994b74f456440@skynet.be>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140503223324.4357f591dc8994b74f456440@skynet.be>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabian Frederick <fabf@skynet.be>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, akpm <akpm@linux-foundation.org>

On Sat 03-05-14 22:33:24, Fabian Frederick wrote:
> __constant_cpu_to_le32 converted to cpu_to_le32
> 
> Cc: reiserfs-devel@vger.kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Fabian Frederick <fabf@skynet.be>
  Just for my education, where have you learned that __constant_...
functions are obsolete?

								Honza
> ---
> V2: Cc email fixed
> 
>  fs/reiserfs/stree.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
> index b14706a..615cd9a 100644
> --- a/fs/reiserfs/stree.c
> +++ b/fs/reiserfs/stree.c
> @@ -228,10 +228,10 @@ const struct reiserfs_key MIN_KEY = { 0, 0, {{0, 0},} };
>  
>  /* Maximal possible key. It is never in the tree. */
>  static const struct reiserfs_key MAX_KEY = {
> -	__constant_cpu_to_le32(0xffffffff),
> -	__constant_cpu_to_le32(0xffffffff),
> -	{{__constant_cpu_to_le32(0xffffffff),
> -	  __constant_cpu_to_le32(0xffffffff)},}
> +	cpu_to_le32(0xffffffff),
> +	cpu_to_le32(0xffffffff),
> +	{{cpu_to_le32(0xffffffff),
> +	  cpu_to_le32(0xffffffff)},}
>  };
>  
>  /* Get delimiting key of the buffer by looking for it in the buffers in the path, starting from the bottom
> -- 
> 1.8.4.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
