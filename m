From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 1/2] reiser4: sanitize deallocations throughout the code.
Date: Sun, 31 Aug 2014 13:24:35 +0200
Message-ID: <540305F3.5040204@gmail.com>
References: <1408361471-1488-1-git-send-email-intelfx100@gmail.com> <1408361471-1488-2-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=xD8QqO7lG7RQBr28HBtX8j44S3NckaYqcJTrpGCInLs=;
        b=t+bmn0zPA07mY0n1VcfKwJ9o94U/0gCERCih9Fg5aFTr1JuPiwY5qB9qFKJxlN6Y5e
         +q24LetBijmSEkWutCzSKhANMyISgkPqlB+tUJa870Y/K2xiOJyOpi7Odbakgf/8p+ak
         2qUDbG1wLdFfqNoqQvoXDMyK4V2ly3MlbQga1MfuPgNTLf5/02fDo40GKuq7q6sLfnUY
         065XMHXQ9b6iM5tjIBr5lKI7qR995WIVn953HY/T6TwNm9z9w99P6WZUAPAyQu2PQ4mU
         Ky7irJNSn/HDfUAGheM4z3+TKKnR60OVa9YN2DwpwoMiZk11XOyqDbIPBBclOOwJwugf
         8XSw==
In-Reply-To: <1408361471-1488-2-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 08/18/2014 01:31 PM, Ivan Shapovalov wrote:
> - Deferred (BA_DEFER) deallocations do not make use of target stage and
>    other flags, so remove them to avoid confusion.
> - mark final deallocations in wandering log code as deferred.
>
> With the last point, there is a clear semantic distinction between
> deferred and immediate deallocations.
> Deferred mode is used to deallocate blocks that were previously written,
> immediate mode is used to deallocate "just allocated" blocks in error
> paths or if some previously allocated blocks turn out to be unneeded.
>
> This way, we may get rid of discard-related hack in the deallocation routine,
> i. e. treating immediate deallocations as deferred (which messes up
> block accounting). This is done in the next commit.
>
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>   fs/reiser4/plugin/txmod.c | 18 ++++++------------
>   fs/reiser4/tree.c         |  3 +--
>   fs/reiser4/wander.c       |  5 ++---
>   3 files changed, 9 insertions(+), 17 deletions(-)
>
> diff --git a/fs/reiser4/plugin/txmod.c b/fs/reiser4/plugin/txmod.c
> index 63d461f..d8a99b7 100644
> --- a/fs/reiser4/plugin/txmod.c
> +++ b/fs/reiser4/plugin/txmod.c
> @@ -287,8 +287,7 @@ static int forward_relocate_unformatted(flush_pos_t *flush_pos,
>   		 * on relocating - free nodes which are going to be
>   		 * relocated
>   		 */
> -		reiser4_dealloc_blocks(&start, &allocated,
> -				       BLOCK_ALLOCATED, BA_DEFER);
> +		reiser4_dealloc_blocks(&start, &allocated, 0, BA_DEFER);
>   
>   	/* assign new block numbers to protected nodes */
>   	assign_real_blocknrs(flush_pos, oid, index, allocated, first_allocated);
> @@ -386,16 +385,13 @@ static squeeze_result squeeze_relocate_unformatted(znode *left,
>   	result = put_unit_to_end(left, key, &copy_extent);
>   
>   	if (result == -E_NODE_FULL) {
> -		int target_block_stage;
>   		/*
>   		 * free blocks which were just allocated
>   		 */
> -		target_block_stage =
> -			(state ==
> -			 ALLOCATED_EXTENT) ? BLOCK_FLUSH_RESERVED :
> -			BLOCK_UNALLOCATED;
>   		reiser4_dealloc_blocks(&first_allocated, &allocated,
> -				       target_block_stage,
> +				       (state == ALLOCATED_EXTENT)
> +				       ? BLOCK_FLUSH_RESERVED
> +				       : BLOCK_UNALLOCATED,
>   				       BA_PERMANENT);
>   		/*
>   		 * rewind the preceder
> @@ -408,8 +404,7 @@ static squeeze_result squeeze_relocate_unformatted(znode *left,
>   		/*
>   		 * free nodes which were relocated
>   		 */
> -		reiser4_dealloc_blocks(&start, &allocated,
> -				       BLOCK_ALLOCATED, BA_DEFER);
> +		reiser4_dealloc_blocks(&start, &allocated, 0, BA_DEFER);
>   	}
>   	/*
>   	 * assign new block numbers to protected nodes
> @@ -689,8 +684,7 @@ static int forward_try_defragment_locality(znode * node,
>   		goto exit;
>   
>   	if (!ZF_ISSET(node, JNODE_CREATED) &&
> -	    (ret = reiser4_dealloc_block(znode_get_block(node), 0,
> -					 BA_DEFER | BA_FORMATTED)))
> +	    (ret = reiser4_dealloc_block(znode_get_block(node), 0, BA_DEFER)))


Here you drop BA_FORMATTED flag for the node, which is really formatted.
It makes a mess. Do you have more neat solution?


>   		goto exit;
>   
>   	if (likely(!znode_is_root(node))) {
> diff --git a/fs/reiser4/tree.c b/fs/reiser4/tree.c
> index 27d8dc3..46072d9 100644
> --- a/fs/reiser4/tree.c
> +++ b/fs/reiser4/tree.c
> @@ -679,8 +679,7 @@ static void uncapture_znode(znode * node)
>   
>   		/* An already allocated block goes right to the atom's delete set. */
>   		ret =
> -		    reiser4_dealloc_block(znode_get_block(node), 0,
> -					  BA_DEFER | BA_FORMATTED);
> +		    reiser4_dealloc_block(znode_get_block(node), 0, BA_DEFER);


ditto


>   		if (ret)
>   			warning("zam-942",
>   				"can\'t add a block (%llu) number to atom's delete set\n",
> diff --git a/fs/reiser4/wander.c b/fs/reiser4/wander.c
> index 04ddec6..fc35a7c 100644
> --- a/fs/reiser4/wander.c
> +++ b/fs/reiser4/wander.c
> @@ -482,8 +482,7 @@ static void dealloc_tx_list(struct commit_handle *ch)
>   		jnode *cur = list_entry(ch->tx_list.next, jnode, capture_link);
>   		list_del(&cur->capture_link);
>   		ON_DEBUG(INIT_LIST_HEAD(&cur->capture_link));
> -		reiser4_dealloc_block(jnode_get_block(cur), BLOCK_NOT_COUNTED,
> -				      BA_FORMATTED);
> +		reiser4_dealloc_block(jnode_get_block(cur), 0, BA_DEFER);
>   
>   		unpin_jnode_data(cur);
>   		reiser4_drop_io_head(cur);
> @@ -502,7 +501,7 @@ dealloc_wmap_actor(txn_atom * atom UNUSED_ARG,
>   	assert("zam-500", *b != 0);
>   	assert("zam-501", !reiser4_blocknr_is_fake(b));
>   
> -	reiser4_dealloc_block(b, BLOCK_NOT_COUNTED, BA_FORMATTED);
> +	reiser4_dealloc_block(b, 0, BA_DEFER);


ditto

Thanks,
Edward.
