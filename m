From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: Re: [PATCH 1/8 v2]reiserfs:stree.c Fix variable set but not used.
Date: Mon, 14 Jun 2010 16:41:45 -0700
Message-ID: <4C16BE39.2080303@gmail.com>
References: <1276555568-31550-1-git-send-email-justinmattock@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=msDb03PBoXNDSovjO3xZr6BJ3e7jLNGZt4E3Z52n7zs=;
        b=ncv6A/khfqVZ+Qx89tanYmct3c09KitLLa6R2X6HqszQJuM0t/UP2TsybkD92pUSFY
         fQhU422Px8wFeI9HtvuxglXk0bJN/TX/lAFTVRP+hbGIH7838kID6oLXJiSbTLu7j39h
         OyAf7ZxZ1p0/APVrcNQFZKTFTQsLcrvgXXn5I=
In-Reply-To: <1276555568-31550-1-git-send-email-justinmattock@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Justin P. Mattock" <justinmattock@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, edward.shishkin@gmail.com, linux-kernel@vger.kernel.org

On 06/14/2010 03:46 PM, Justin P. Mattock wrote:
> Resend of this patch due to previous whitespace issues.
> The below fixes this warning:
> fs/reiserfs/stree.c: In function 'search_by_key':
> fs/reiserfs/stree.c:602:6: warning: variable 'right_neighbor_of_leaf_node' set but not used
>
>   Signed-off-by: Justin P. Mattock<justinmattock@gmail.com>
>   Acked-by: Edward Shishkin<edward.shishkin@gmail.com>
>
> ---
>   fs/reiserfs/stree.c |    3 ---
>   1 files changed, 0 insertions(+), 3 deletions(-)
>
> diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
> index 313d39d..f268067 100644
> --- a/fs/reiserfs/stree.c
> +++ b/fs/reiserfs/stree.c
> @@ -599,7 +599,6 @@ int search_by_key(struct super_block *sb, const struct cpu_key *key,	/* Key to s
>   	struct buffer_head *bh;
>   	struct path_element *last_element;
>   	int node_level, retval;
> -	int right_neighbor_of_leaf_node;
>   	int fs_gen;
>   	struct buffer_head *reada_bh[SEARCH_BY_KEY_READA];
>   	b_blocknr_t reada_blocks[SEARCH_BY_KEY_READA];
> @@ -617,8 +616,6 @@ int search_by_key(struct super_block *sb, const struct cpu_key *key,	/* Key to s
>
>   	pathrelse(search_path);
>
> -	right_neighbor_of_leaf_node = 0;
> -
>   	/* With each iteration of this loop we search through the items in the
>   	   current node, and calculate the next current node(next path element)
>   	   for the next iteration of this loop.. */



shit I messed up.. forgot the last bit for this.
sorry about that I'll resend.

Justin P. Mattock
