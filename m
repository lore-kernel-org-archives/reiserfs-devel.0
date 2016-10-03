From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4: return -ENOTTY from unsupported ioctls.
Date: Mon, 03 Oct 2016 16:30:00 +0200
Message-ID: <57F26B68.6090100@gmail.com>
References: <20160930064905.20896-1-intelfx@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=PXeesuq7zw3v31LOAPkI2Ql/6rCMjrsUALF4ivMgkNY=;
        b=cbtapF1XXYbkXrWKg/IXqMRsSaIvFWAaczVbBoDmYcXUHOaLoNdOaPtJZ0LhiphFza
         6khLk7k0drxuTCpH3Zr5PvMYa1dh9Ept9aCSyQulyDm1D4HqnWwNv/vGljk2SwUH6kfh
         9LqDYoBUWJ4TCjfGX/W3aVpPrVVpWUkTgVe6zDnqm3wSf26KazH/ssXP0CY7JFjMx/o6
         K/ScltVeGFlOzikmNfHVsuEqUTLiXIdVjc3n0D1257WtZB1spq2iRFHE7pkO2EoB90Lh
         8LXqce+IuPqLBALPl28JYw6YYkCJtL3x6R/Zeeb+h+spF7UyYb/1QCCddt7lYkCQFNc8
         JBFg==
In-Reply-To: <20160930064905.20896-1-intelfx@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx@intelfx.name>, reiserfs-devel@vger.kernel.org

OK

On 09/30/2016 08:49 AM, Ivan Shapovalov wrote:
> Signed-off-by: Ivan Shapovalov <intelfx@intelfx.name>
> ---
>   plugin/file/cryptcompress.c | 2 +-
>   plugin/file/file.c          | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/plugin/file/cryptcompress.c b/plugin/file/cryptcompress.c
> index 59d8df8..67c48d7 100644
> --- a/plugin/file/cryptcompress.c
> +++ b/plugin/file/cryptcompress.c
> @@ -3544,7 +3544,7 @@ int writepages_cryptcompress(struct address_space *mapping,
>   int ioctl_cryptcompress(struct file *filp, unsigned int cmd,
>   			unsigned long arg)
>   {
> -	return RETERR(-ENOSYS);
> +	return RETERR(-ENOTTY);
>   }
>   
>   /* plugin->mmap */
> diff --git a/plugin/file/file.c b/plugin/file/file.c
> index 064f26e..9d08481 100644
> --- a/plugin/file/file.c
> +++ b/plugin/file/file.c
> @@ -2446,7 +2446,7 @@ int ioctl_unix_file(struct file *filp, unsigned int cmd,
>   		break;
>   
>   	default:
> -		result = RETERR(-ENOSYS);
> +		result = RETERR(-ENOTTY);
>   		break;
>   	}
>   	reiser4_exit_context(ctx);

