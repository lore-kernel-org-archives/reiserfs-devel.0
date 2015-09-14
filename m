From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4: fix supported flags check in
 reiser4_rename2_common().
Date: Mon, 14 Sep 2015 09:55:00 +0200
Message-ID: <55F67D54.3070009@gmail.com>
References: <1442197280-31580-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-type:content-transfer-encoding;
        bh=Qy6iY8o/sXuNIwlKw5FdgJ5umejcM3Oz9mixOerJHRA=;
        b=bgudLp2c5K+Y9CaBytMjmir6XbRsVqqB73wnwZBpo1mMS74x/ePcVnWjykFaEyM53e
         cPpGZvhKQt/KbUFMUarQcZJIi/2X4ll0UMDc6pAcWMXT0nLyRWN2t4hf6I/clVn1gAHt
         n3noJBdUs72EB0C1HVXkj7RcH9hIFntBMPL/ueoCe1mbfXeo1tWZPa6J6pBStB61venj
         ZdWYx84OG5BJnHCxrkikrf9be30R1FbQcWwwexcZJu/PQuqctKq3TlDNoHgTU6jH8oMj
         /eFJi/Tupvvqeo4Of2gTgPNdicOgxvTR018RS2CWJa7jteD83IoS0gJ+mFvzYY5tzYO9
         nwxw==
In-Reply-To: <1442197280-31580-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

OK

On 09/14/2015 04:21 AM, Ivan Shapovalov wrote:
> ---
>
> This was left behind some time ago. I've just spotted a relevant warning.
>
>   fs/reiser4/plugin/inode_ops_rename.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/reiser4/plugin/inode_ops_rename.c b/fs/reiser4/plugin/inode_ops_rename.c
> index 6744e14..ddb7bf5 100644
> --- a/fs/reiser4/plugin/inode_ops_rename.c
> +++ b/fs/reiser4/plugin/inode_ops_rename.c
> @@ -435,7 +435,7 @@ int reiser4_rename2_common(struct inode *old_dir /* directory where @old
>   	 * We support:
>   	 * - RENAME_NOREPLACE (no-op)
>   	 */
> -	if (flags & supported_flags != flags)
> +	if ((flags & supported_flags) != flags)
>   		return RETERR(-EINVAL);
>   
>   	old_entry = kzalloc(3 * sizeof(*old_entry) + 2 * sizeof(*new_lh) +

