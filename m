From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 2/3] reiser4: fix reiser4_init_csum_tfm() error path;
 return real (negative) error code.
Date: Mon, 14 Sep 2015 09:52:14 +0200
Message-ID: <55F67CAE.8030504@gmail.com>
References: <1442185720-25185-1-git-send-email-intelfx100@gmail.com>
 <1442185720-25185-2-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-type:content-transfer-encoding;
        bh=rbHlP1ofvKMh/Ct8ocaXYX3/hGaKqeki55py/biIufs=;
        b=IhP3A7UJAto6KfMPJkueIwrp9xj2bwVse9m0EMytVk1y1FfKS3fCAV0LGMPN0uaOQZ
         K8Qr4JhTia+8YHhqjgez1w14DNEhvZJ0ZHiCgO2fsJRRUPn0TsMcadokkw4VMkT/g8Ig
         mp5oDktmDk+lWta1PgdDMRfd9t8IgtUXliqaYg7nqMDAoq04gxgrZDzhCdGHPwDdatd8
         OBjhWAhyiLHGSjCV4/zEdJUznPW1YGHlMOQETTE6xWUqXTuSkuCVGVk+x6AXynHXYOT4
         IS2MiS3Lk2Y2TSuBepdeUZCChSNxmbsOGuQXUygieL1rrX5vdG5400Bm3fq74rBHG9gg
         xk7Q==
In-Reply-To: <1442185720-25185-2-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

OK.
Thanks!

On 09/14/2015 01:08 AM, Ivan Shapovalov wrote:
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>
> This is responsible for the oops on mount reported by Jose (also experienced
> by me). The problem is that IS_ERR() works only for negative error codes,
> so somewhere in the VFS an error path is incorrectly not taken.
>
>   fs/reiser4/checksum.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/fs/reiser4/checksum.c b/fs/reiser4/checksum.c
> index a5052b0..73d40f0 100644
> --- a/fs/reiser4/checksum.c
> +++ b/fs/reiser4/checksum.c
> @@ -4,11 +4,13 @@
>   
>   int reiser4_init_csum_tfm(struct crypto_shash **tfm)
>   {
> -	*tfm = crypto_alloc_shash("crc32c", 0, 0);
> -	if (IS_ERR(*tfm)) {
> -		*tfm = NULL;
> -		return 1;
> -	}
> +	struct crypto_shash *new_tfm;
> +
> +	new_tfm = crypto_alloc_shash("crc32c", 0, 0);
> +	if (IS_ERR(new_tfm))
> +		return PTR_ERR(new_tfm);
> +
> +	*tfm = new_tfm;
>   	return 0;
>   }
>   

