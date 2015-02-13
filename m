From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 2/3] reiser4: discard: avoid checking same blocks multiple
 times.
Date: Fri, 13 Feb 2015 10:04:39 +0100
Message-ID: <54DDBE27.4090500@gmail.com>
References: <1423803778-19698-1-git-send-email-intelfx100@gmail.com> <1423803778-19698-3-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=+GRZSH8qMWQFpmqU7hLhhAqYi7r1YHy//6avmOHGQxs=;
        b=x2E+wq/vXyOez12tbUs59N2c9outuGuugg0zrLqMcC/K+T4DeReXXUafXkj2C6x9DE
         9v7OYTAeFR+TlYkOLrSALFplafxjMxPByEhqeTK+dxmVToxaDaRQt5RaOd/fgU5L6hoY
         +tHLKUtny9h8WT6zTis5hVEgVODWtO4j6KBIprG/XaMUuNweJaD1bi33DaZcYpc9NWEr
         ZC9aKHauFwM3g8oNyLZajKVCHwZcAAqpsaiRxe2FLU8ahrX0W0vFk6gVgjZZqiFkTf8W
         V5Ref6/RX33eDgCErTc92T4dDgEtIi6ki4YTnb83Vp3B9yLWKKKI0c7npRzR7Nd7e0WC
         I8EA==
In-Reply-To: <1423803778-19698-3-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

OK, thanks,
I'll take a look at leisure.
The function is extremely complicated, and
every time it takes me a lot of time to recall
what is going on here...

Thanks,
Edward.


On 02/13/2015 06:02 AM, Ivan Shapovalov wrote:
> It was previously possible for an extent's tail padding and next extent's head
> padding to overlap in terms of occupied disk blocks.
>
> In this case the head padding check would yield a false negative because blocks
> would appear already allocated, while in fact they would have been previously
> allocated by us.
>
> Solve this by saving last checked tail padding and a bit of case analysis.
>
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>   fs/reiser4/discard.c | 182 +++++++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 156 insertions(+), 26 deletions(-)
>
> diff --git a/fs/reiser4/discard.c b/fs/reiser4/discard.c
> index a615b7d..10c1707 100644
> --- a/fs/reiser4/discard.c
> +++ b/fs/reiser4/discard.c
> @@ -272,9 +272,57 @@ static int discard_precise_extents(struct list_head *head)
>   	int d_off;
>   	struct list_head *pos;
>   	struct super_block *sb = reiser4_get_current_sb();
> -	int headp_is_known_dirty = 0;
>   	int blkbits = sb->s_blocksize_bits;
>   
> +	/* This is a "cache" which holds the last block range checked during
> +	 * processing of an extent. This information is used to avoid allocating
> +	 * the same blocks multiple times, if two successive extents become
> +	 * overlapped (in terms of disk blocks) after padding.
> +	 *
> +	 * The problem with allocating the same blocks multiple times:
> +	 * our function try_allocate_blocks() is not idempotent. More precisely,
> +	 * after a positive result has been returned for a given range [A;B), we
> +	 * must not call try_allocate_blocks() on any range which overlaps [A;B),
> +	 * or we will get a false negative result.
> +	 * (Also, we must not call try_allocate_blocks() on any range which
> +	 * overlaps extents in the discard set.)
> +	 *
> +	 * Let's show that we can avoid false-negatives with this cache.
> +	 *
> +	 * 1. All blocks between the stored tail padding and the beginning of
> +	 *    the current extent are safe to allocate.
> +	 *
> +	 * 2. Let's analyze all combinations of the previous tail padding's check
> +	 *    result and the current head padding's disposition relative to the
> +	 *    previous tail padding. Note that we are speaking in terms of
> +	 *    occupied disk blocks.
> +	 *
> +	 * 2.0. The head padding does not overlap the tail padding.
> +	 *      In this case head padding is safe to allocate.
> +	 *
> +	 * 2.1. The tail padding is dirty. The head padding partially overlaps it.
> +	 *      In this case both parts of the head padding are safe to allocate.
> +	 *
> +	 * 2.2. The tail padding is dirty. The head padding completely covers it
> +	 *      (maybe extending back beyond).
> +	 *      In this case the head padding is transitively dirty.
> +	 *
> +	 * 2.3. The tail padding is clean. The head padding overlaps or covers it
> +	 *      (not extending back beyond).
> +	 *      In this case:
> +	 *      - the overlapping part of the head padding can be skipped
> +	 *      - the rest is safe to allocate
> +	 *
> +	 * 2.4. The tail padding is clean. The head padding extends beyond it.
> +	 *      This is not possible. It would mean that our head padding
> +	 *      shares an erase unit with the previous tail padding.
> +	 *      Such extent combinations are handled by the gluing code.
> +	 */
> +
> +	reiser4_block_nr last_padding_start = 0;
> +	reiser4_block_nr last_padding_end = 0;
> +	int last_padding_clean = 0;
> +
>   	d_off = get_super_private(sb)->discard.offset;
>   	d_uni = get_super_private(sb)->discard.unit;
>   
> @@ -316,34 +364,89 @@ static int discard_precise_extents(struct list_head *head)
>   		p_headp = precise_extent_headp(p_start, d_off, d_uni);
>   		headp = size_in_blocks(p_headp, blkbits);
>   
> +		/*
> +		 * Our head padding can't extend back beyond the saved tail
> +		 * padding, if the latter is clean.
> +		 * (cf. situation 2.4 from the above description)
> +		 */
> +		assert("intelfx-80", ergo(last_padding_clean,
> +					  last_padding_start <= start - headp));
> +
>   		if (headp == 0) {
>   			/*
>   			 * empty head padding
>   			 */
> -			assert("edward-1635", headp_is_known_dirty == 0);
>   			a_start = p_start;
>   			a_len = p_len;
> -		}
> -		else if (p_start >= p_headp /* discard unit is complete */ &&
> -			 !headp_is_known_dirty &&
> -			 try_allocate_blocks(start - headp, headp)) {
> -			/*
> -			 * pad the head
> -			 */
> -			a_start = p_start - p_headp;
> -			a_len = p_len + p_headp;
> -			estart -= headp;
>   		} else {
> +			int headp_is_clean;
> +
>   			/*
> -			 * head padding is dirty,
> -			 * or discard unit is incomplete (can not
> -			 * check blocks outside of the partition),
> -			 * cut the head
> +			 * If our discard unit is incomplete, don't pad.
>   			 */
> -			headp_is_known_dirty = 0;
> -			a_start = p_start + (d_uni - p_headp);
> -			a_len = p_len - (d_uni - p_headp);
> +			if (p_start < p_headp)
> +				headp_is_clean = 0;
> +
> +			/*
> +			 * Maybe last checked extent is dirty and completely
> +			 * embedded in ours? Then our one is dirty too.
> +			 * (cf. situation 2.2 from the above description)
> +			 */
> +			else if (!last_padding_clean &&
> +				 last_padding_start >= start - headp &&
> +				 last_padding_end <= start)
> +				headp_is_clean = 0;
> +
> +			/*
> +			 * Maybe last checked extent is clean and completely
> +			 * covers ours? Then our one is clean too.
> +			 * (cf. situation 2.3 from the above description)
> +			 */
> +			else if (last_padding_clean &&
> +				 last_padding_end >= start)
> +				headp_is_clean = 1;
> +
> +			/*
> +			 * Maybe last checked extent is clean and partially
> +			 * overlaps ours? Then we must check the remaining part.
> +			 * (cf. situation 2.3 from the above description)
> +			 */
> +			else if (last_padding_clean &&
> +				 last_padding_end > start - headp) {
> +				headp_is_clean = try_allocate_blocks(last_padding_end, start - last_padding_end);
> +				if (headp_is_clean)
> +					estart = last_padding_end;
> +			}
> +
> +			/*
> +			 * Otherwise check the whole padding.
> +			 * (cf. situations 2.0, 2.1 from the above description)
> +			 */
> +			else {
> +				headp_is_clean = try_allocate_blocks(start - headp, headp);
> +				if (headp_is_clean)
> +					estart -= headp;
> +			}
> +
> +			if (headp_is_clean) {
> +				/*
> +				 * head padding is clean,
> +				 * pad the head
> +				 */
> +				a_start = p_start - p_headp;
> +				a_len = p_len + p_headp;
> +			} else {
> +				/*
> +				 * head padding is dirty,
> +				 * or discard unit is incomplete (can not
> +				 * check blocks outside of the partition),
> +				 * cut the head
> +				 */
> +				a_start = p_start + (d_uni - p_headp);
> +				a_len = p_len - (d_uni - p_headp);
> +			}
>   		}
> +
>   		/*
>   		 * Step II. Try to glue all nearby extents to the tail
>   		 *          Cut or pad the tail of the last extent.
> @@ -410,10 +513,14 @@ static int discard_precise_extents(struct list_head *head)
>   					/*
>   					 * gluing failed, cut the tail
>   					 */
> -					if (p_end + p_tailp > p_next_start)
> -						headp_is_known_dirty = 1;
> -
>   					a_len -= (d_uni - p_tailp);
> +
> +					/*
> +					 * save the tail padding
> +					 */
> +					last_padding_start = end;
> +					last_padding_end = next_start;
> +					last_padding_clean = 0;
>   					break;
>   				}
>   
> @@ -425,21 +532,44 @@ static int discard_precise_extents(struct list_head *head)
>   				 * rest of tail padding and finish with
>   				 * the extent
>   				 */
> -				if (tailp == 0)
> -					break;
> -				else if (try_allocate_blocks(end, tailp)) {
> +				if (tailp == 0) {
> +					/*
> +					 * empty tail padding.
> +					 *
> +					 * save a fake tail padding to aid debugging
> +					 */
> +					last_padding_start = end;
> +					last_padding_end = end;
> +					last_padding_clean = 1;
> +
> +				} else if (try_allocate_blocks(end, tailp)) {
>   					/*
>   					 * tail padding is clean,
>   					 * pad the tail
>   					 */
>   					a_len += p_tailp;
>   					eend += tailp;
> -				} else
> +
> +					/*
> +					 * save the tail padding
> +					 */
> +					last_padding_start = end;
> +					last_padding_end = end + tailp;
> +					last_padding_clean = 1;
> +				} else {
>   					/*
>   					 * tail padding is dirty,
>   					 * cut the tail
>   					 */
>   					a_len -= (d_uni - p_tailp);
> +
> +					/*
> +					 * save the tail padding
> +					 */
> +					last_padding_start = end;
> +					last_padding_end = end + tailp;
> +					last_padding_clean = 0;
> +				}
>   				break;
>   			}
>   		}

