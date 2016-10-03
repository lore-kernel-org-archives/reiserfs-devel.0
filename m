From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] Adjust reiser4 for 3.15: replace truncate_inode_pages(...,
 0) with truncate_inode_pages_final(...).
Date: Mon, 03 Oct 2016 16:08:11 +0200
Message-ID: <57F2664B.3010805@gmail.com>
References: <20160930063629.13794-1-intelfx@intelfx.name> <20160930064332.19365-1-intelfx@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=El3Du+DPZgfFjCE37JWrhNu3ZD6LtBBg8EK4V7Q6JWo=;
        b=khgQuJ7OcAFZWHU4g11Tbqvld7Hp1S7WaHhYGkpKVS9yKkQx6dE8baPxQKpmSljfpa
         PzwAS1ACTOtWV17cDoYHPaEgcmtXkqXjo+/6uIhaQSsj4fYR4fJZIq3RitJ/yrY199B3
         RC7p0hq+2vd4NbYBZzvBTZeqVwEhAPIrp6oJTifD3R+pfPyAMCCAsx5n4V2kdLLe7QHr
         pd+mPHHI4OFwjjmpPC7l+A+4i/APGt9LpfdVsNgRMj9Uq7UsqesryyFdCLtjS75QjPe0
         WbA5o+jOvo2MtZhvu16QQFGC+ap57WWWz42iDUfpHI/Ln1CT1nD7ivbonzDyQ2cAFJ2m
         wEBg==
In-Reply-To: <20160930064332.19365-1-intelfx@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx@intelfx.name>, reiserfs-devel@vger.kernel.org

OK

On 09/30/2016 08:43 AM, Ivan Shapovalov wrote:
> Upstream commit 91b0abe36a7b2b3b02d7500925a5f8455334f0e5
> "mm + fs: store shadow entries in page cache".
>
> Moreover, the truncate_inode_pages(..., 0) in delete_object_cryptcompress()
> is not needed at all.
>
> Signed-off-by: Ivan Shapovalov <intelfx@intelfx.name>
> ---
>   plugin/file/cryptcompress.c | 2 --
>   super_ops.c                 | 2 +-
>   2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/plugin/file/cryptcompress.c b/plugin/file/cryptcompress.c
> index 59d8df8..5433de9 100644
> --- a/plugin/file/cryptcompress.c
> +++ b/plugin/file/cryptcompress.c
> @@ -3595,8 +3595,6 @@ int delete_object_cryptcompress(struct inode *inode)
>   			(unsigned long long)get_inode_oid(inode),
>   			result);
>   	}
> -	truncate_inode_pages(inode->i_mapping, 0);
> -	assert("edward-1487", pages_truncate_ok(inode, 0));
>   	/* and remove stat data */
>   	return reiser4_delete_object_common(inode);
>   }
> diff --git a/super_ops.c b/super_ops.c
> index 73c18f2..697580c 100644
> --- a/super_ops.c
> +++ b/super_ops.c
> @@ -215,7 +215,7 @@ static void reiser4_evict_inode(struct inode *inode)
>   			fplug->delete_object(inode);
>   	}
>   
> -	truncate_inode_pages(&inode->i_data, 0);
> +	truncate_inode_pages_final(&inode->i_data);
>   	inode->i_blocks = 0;
>   	clear_inode(inode);
>   	reiser4_exit_context(ctx);

