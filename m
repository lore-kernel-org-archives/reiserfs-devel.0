From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: report an error on checksum engine load
 failure.
Date: Mon, 14 Sep 2015 09:53:41 +0200
Message-ID: <55F67D05.1040500@gmail.com>
References: <1442185720-25185-1-git-send-email-intelfx100@gmail.com>
 <1442185720-25185-3-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-type:content-transfer-encoding;
        bh=K3zASpJFiMoY2n+Iw5NYvVNhh/V94+6oKAXszW2zHjM=;
        b=FhRnZopChV6L662CcgcWXwibqOAIDCnrHIwKfi6HOfq2WEejJI4rIbUpsCsxmpuirw
         nMdQr4POOr2nsSDkCvwtWgLL8E9yhh6ilE8FWuwEm/yiOvNOU62h5RyP1ktoNz05w9RC
         ihE3sUCiGr+mp9fonULSNxmuqwdJEU2tl2YbUCmSjjU2c1ApxwaWc37m1cK5U0NZRnFd
         oW1ML4H5IEk5zbAHjgzq+3TxqmcnPoNILjA7p0rnOKOS16Tv8nSoJ2tWm7AkjX4mdSUC
         IVXrEM4BJtUghSf9XQloMiv2mT/d2teoOwlAw8Iwd/IXPuorNlDKruLnrZ09sbiNiYvQ
         i8Zg==
In-Reply-To: <1442185720-25185-3-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

OK

On 09/14/2015 01:08 AM, Ivan Shapovalov wrote:
> It is apparently not possible to specify explicit module dependencies.
> For well-formed setups this is not a problem because
> crypto_alloc_shash() uses request_module() internally, but if one needs
> reiser4, say, in initramfs, then the checksum module must be added
> manually.
>
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>   fs/reiser4/checksum.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/reiser4/checksum.c b/fs/reiser4/checksum.c
> index 73d40f0..2a35f42 100644
> --- a/fs/reiser4/checksum.c
> +++ b/fs/reiser4/checksum.c
> @@ -7,8 +7,10 @@ int reiser4_init_csum_tfm(struct crypto_shash **tfm)
>   	struct crypto_shash *new_tfm;
>   
>   	new_tfm = crypto_alloc_shash("crc32c", 0, 0);
> -	if (IS_ERR(new_tfm))
> +	if (IS_ERR(new_tfm)) {
> +		warning("intelfx-81", "Could not load crc32c driver");
>   		return PTR_ERR(new_tfm);
> +	}
>   
>   	*tfm = new_tfm;
>   	return 0;

