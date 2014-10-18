From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 1/3] reiser4: block_alloc: improve error handling in reiser4_grab_reserved().
Date: Sat, 18 Oct 2014 19:43:47 +0200
Message-ID: <5442A6D3.4000508@gmail.com>
References: <1408371283-1319-1-git-send-email-intelfx100@gmail.com> <1408371283-1319-2-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=FYljpRkyt6CZH5a9PE/uYjKo7Nj2xqb0RIaf8ZlCcT0=;
        b=kC31gQns+SjMbrGwuMFe2ISD/jPPBAYGgg1Q7N3p2AgNNcHFWNElKGeSuLfqMyG97h
         tG4A4SpH7zBPXnJ60nWpiqGqpq902pH9Ahj6Z0yb2PVRoYalWT9WDeAld65J0TmX6BtJ
         AOwuD8XoTwiqw2Vedj7MAYfMW0J0cUb0J0Zj9fxGqVsGo01Z9lLJiZBflJYL+GnbE194
         mKXpI7Ybl2D/dBvjwbhI9Qx56L3lfvX/Pyw2Oolug/LdSMuHzh1T1SON1dXUAmkhv1+g
         0k9GgW7/sGtIC6iINNSjijnCpfn6EPa+YgaFUV/uGd90t8lYVn4oZvtbqsxTQrWv5FQ9
         4z5g==
In-Reply-To: <1408371283-1319-2-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 08/18/2014 04:14 PM, Ivan Shapovalov wrote:
> In case of error in reiser4_grab_space(), return the original error code,
> not -ENOSPC unconditionally.
>
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>   fs/reiser4/block_alloc.c | 35 +++++++++++++++++++----------------
>   1 file changed, 19 insertions(+), 16 deletions(-)
>
> diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
> index 324b11c..7f9f910 100644
> --- a/fs/reiser4/block_alloc.c
> +++ b/fs/reiser4/block_alloc.c
> @@ -360,37 +360,40 @@ int reiser4_grab_reserved(struct super_block *super,
>   			  __u64 count, reiser4_ba_flags_t flags)
>   {
>   	reiser4_super_info_data *sbinfo = get_super_private(super);
> +	int ret;
>   
>   	assert("nikita-3175", flags & BA_CAN_COMMIT);
>   
>   	/* Check the delete mutex already taken by us, we assume that
>   	 * reading of machine word is atomic. */
>   	if (sbinfo->delete_mutex_owner == current) {
> -		if (reiser4_grab_space
> -		    (count, (flags | BA_RESERVED) & ~BA_CAN_COMMIT)) {
> +		ret = reiser4_grab_space (count, (flags | BA_RESERVED) & ~BA_CAN_COMMIT);
> +
> +		if (ret != 0) {
>   			warning("zam-1003",
>   				"nested call of grab_reserved fails count=(%llu)",
>   				(unsigned long long)count);
>   			reiser4_release_reserved(super);
> -			return RETERR(-ENOSPC);
>   		}
> -		return 0;
> -	}
> +	} else {
> +		ret = reiser4_grab_space(count, flags);
>   
> -	if (reiser4_grab_space(count, flags)) {
> -		mutex_lock(&sbinfo->delete_mutex);
> -		assert("nikita-2929", sbinfo->delete_mutex_owner == NULL);
> -		sbinfo->delete_mutex_owner = current;
> +		if (ret != 0) {
> +			mutex_lock(&sbinfo->delete_mutex);
> +			assert("nikita-2929", sbinfo->delete_mutex_owner == NULL);
> +			sbinfo->delete_mutex_owner = current;
> +			ret = reiser4_grab_space(count, flags | BA_RESERVED);
>   
> -		if (reiser4_grab_space(count, flags | BA_RESERVED)) {
> -			warning("zam-833",
> -				"reserved space is not enough (%llu)",
> -				(unsigned long long)count);
> -			reiser4_release_reserved(super);
> -			return RETERR(-ENOSPC);
> +			if (ret != 0) {
> +				warning("zam-833",
> +					"reserved space is not enough (%llu)",
> +					(unsigned long long)count);
> +				reiser4_release_reserved(super);
> +			}
>   		}
>   	}
> -	return 0;
> +
> +	return ret;
>   }
>   
>   void reiser4_release_reserved(struct super_block *super)

OK
