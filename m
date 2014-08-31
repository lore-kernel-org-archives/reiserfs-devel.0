From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 2/2] reiser4: block_alloc: get rid of discard-related
 hack in reiser4_dealloc_blocks().
Date: Sun, 31 Aug 2014 23:19:10 +0200
Message-ID: <5403914E.2050605@gmail.com>
References: <1408361471-1488-1-git-send-email-intelfx100@gmail.com> <1408361471-1488-3-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=63QL8IbTmbdDjAr3NXYdavOezkTCWB9sSZ1WuUKW+Dk=;
        b=cJnrxIsNovOy3vbdg6Ss/q/bMo1xynNixRDKPgq1AEZY1pzoNM9M8qlVwEP4GJ3CXS
         L1FgEiLsjDLOD11ru0W8DKcj6wHAE2N0VKKXaEcY2fxxcJ2r3r8C3laZt9ZIs8C+lho5
         wrDRaoW504L80tbbPbtaQT+WKkzSL6ery9SGXMtRfI77tCS9wEK5lUauE7dD+k3SlqAk
         AOmfFiremCOkzVJqG4XIIdVfJmGVgHK+yKSlUBEZmCR44tRymLx2VtflMVQVPBfIjHe0
         R92eVZxp2yOXEAVnvesESz987+sew6hAF5cwSh2pFwk3bLJpNr0FADUYBD6ttL4f2sRQ
         89Qw==
In-Reply-To: <1408361471-1488-3-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 08/18/2014 01:31 PM, Ivan Shapovalov wrote:
> When discard was enabled, immediate deallocations were made deferred in order
> to record these extents in the atom's delete set and, consequently, allow
> their discarding.
>
> However, this is wrong in the following way. Immediate deallocations make use
> of target allocation stage and ancillary flags like BA_PERMANENT and BA_FORMATTED.
> By converting immediate deallocations to deferred, these flags are essentially
> dropped, and application of deferred deallocations in reiser4_post_write_back_hook()
> uses an equivalent of BLOCK_NOT_COUNTED stage and BA_FORMATTED flag.
>
> Dropping this hack does not hinder efficiency of the discard procedure, because
> immediate deallocations are now used only to deallocate "just allocated" and not
> yet written blocks, which actually do not need to be discarded.


The idea to defer every "successful" deallocation regardless of discard
support status looks OK, but I don't like the first patch (1/2), so 
let's try
to improve it..

So, we want to defer also deallocations in the following 2 places:
1) in  dealloc_tx_list();
2) in dealloc_wmap_actor().

Here we should take care about block stages.
Let's take a look where and how they were allocated. There are exactly
2 places:

a) in get_more_wandered_blocks() with block_stage = BLOCK_GRABBED;
b) in alloc_tx() with block_stage = BLOCK_GRABBED.

Note, that alloc_blocks() with the stage BLOCK_GRABBED calls
grabbed2used(). This is exactly what we want in apply_dset() called by
post_write_back_hook.

That is, just adding BA_DEFER to (1) and (2) with the patch 2/2 should work.
Please, make sure..

P.S. In (1)-(2) we allocate with stage BLOCK_GRABBED, but in (a)-(b) we
deallocate with stage BLOCK_NOT_COUNTED. It can confuse. Let's allocate
with stage BLOCK_NOT_COUNTED: from the standpoint of alloc_blocks() it
doesn't matter.

Thanks.

> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>   fs/reiser4/block_alloc.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
> index 324b11c..33ca86c 100644
> --- a/fs/reiser4/block_alloc.c
> +++ b/fs/reiser4/block_alloc.c
> @@ -1008,8 +1008,7 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
>   		spin_unlock_reiser4_super(sbinfo);
>   	}
>   
> -	if ((flags & BA_DEFER) ||
> -	    reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
> +	if (flags & BA_DEFER) {
>   		/* store deleted block numbers in the atom's deferred delete set
>   		   for further actual deletion */
>   		do {

