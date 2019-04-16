From: Mukesh Ojha <mojha@codeaurora.org>
Subject: Re: [PATCH] reiserfs: fix spelling mistake "enrty" -> "entry"
Date: Tue, 16 Apr 2019 18:47:36 +0530
Message-ID: <240c2888-01a9-184f-7f29-eb603bdd36c4@codeaurora.org>
References: <20190416112549.25175-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1555420660;
        bh=z3ndeu30m7fA4kT+0k5LNWnkWoyl3MPtE622MvKZJZE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=cH/4NAbMjnhImtksVWztciKFaioLgGD/ct+VKwWRYGWa8/53V6GFENjC9urHtjFzE
         rtgsp27JKefY6wvZ6p6Ohlre1xI6wabdslsWn0AEJJnuLIg2KTWOZirqA9spwtMx7y
         VZqyh5seBL1BX6QeV6IL0TFzNScR3Ins1bHmtnds=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1555420660;
        bh=z3ndeu30m7fA4kT+0k5LNWnkWoyl3MPtE622MvKZJZE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=cH/4NAbMjnhImtksVWztciKFaioLgGD/ct+VKwWRYGWa8/53V6GFENjC9urHtjFzE
         rtgsp27JKefY6wvZ6p6Ohlre1xI6wabdslsWn0AEJJnuLIg2KTWOZirqA9spwtMx7y
         VZqyh5seBL1BX6QeV6IL0TFzNScR3Ins1bHmtnds=
In-Reply-To: <20190416112549.25175-1-colin.king@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Colin King <colin.king@canonical.com>, reiserfs-devel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/16/2019 4:55 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There are a couple of spelling mistakes, fix these.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>


Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   fs/reiserfs/lbalance.c | 2 +-
>   fs/reiserfs/namei.c    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/reiserfs/lbalance.c b/fs/reiserfs/lbalance.c
> index f5cebd70d903..e7cebd05a882 100644
> --- a/fs/reiserfs/lbalance.c
> +++ b/fs/reiserfs/lbalance.c
> @@ -1164,7 +1164,7 @@ void leaf_cut_from_buffer(struct buffer_info *bi, int cut_item_num,
>   		if (pos_in_item == 0) {
>   			/* change key */
>   			RFALSE(cut_item_num,
> -			       "when 0-th enrty of item is cut, that item must be first in the node, not %d-th",
> +			       "when 0-th entry of item is cut, that item must be first in the node, not %d-th",
>   			       cut_item_num);
>   			/* change item key by key of first entry in the item */
>   			set_le_ih_k_offset(ih, deh_offset(B_I_DEH(bh, ih)));
> diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
> index 97f3fc4fdd79..c97c36b4a31c 100644
> --- a/fs/reiserfs/namei.c
> +++ b/fs/reiserfs/namei.c
> @@ -536,7 +536,7 @@ static int reiserfs_add_entry(struct reiserfs_transaction_handle *th,
>   		pathrelse(&path);
>   		return -EBUSY;
>   	}
> -	/* adjust offset of directory enrty */
> +	/* adjust offset of directory entry */
>   	put_deh_offset(deh, SET_GENERATION_NUMBER(deh_offset(deh), gen_number));
>   	set_cpu_key_k_offset(&entry_key, deh_offset(deh));
>   
