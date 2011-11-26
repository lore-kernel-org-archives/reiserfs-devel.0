From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: R4: setting a swap file
Date: Sat, 26 Nov 2011 20:20:39 +0100
Message-ID: <4ED13C07.103@gmail.com>
References: <CAMjNLwobU+ENtHCn5+84+mOCrL=qcdcgBRTp8LOh41XgSNfbLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=pt3t7rZg9xr3eAAgaVD0KibfIUiF6Y/cy32dU6GjKf4=;
        b=P80VvGwQpJJTPAvE3SHRztGWCIaIJYMaXGVbqubL2/cBaX353CslyM4Jjf74gRkwq1
         8X6hlhsfPAQrg5lJe8UfoFkCjJ2pjS7baz2QQhRp3ziK0yyVdFGQwWmhmcdTHJlpPOh7
         rRhKrbQ3MRQHRPbaIEwranEGQ3zpvEmG+lD/s=
In-Reply-To: <CAMjNLwobU+ENtHCn5+84+mOCrL=qcdcgBRTp8LOh41XgSNfbLQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matias Seco <matias.jose.seco@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 11/26/2011 05:31 PM, Matias Seco wrote:
> if we would like to set a swap file through:
>
> dd if=/dev/zero of=/swapfile1 bs=<int number (kb)>  count=<bs*int number>
>

Why do you create a swap file via dd from /dev/zero?
Wouldn't be better to create a "hole file" via truncate(2)?
Holes don't occupy any space in a file managed by reiser4
cryptcompress plugin.

>
> we should consider bs (block size) equal to cluster size's plugin
> value? (4k, 8k, 16k, 32k or 64k)
>


Not necessarily.
Clusters are logical blocks in a file which are compressed
independently. If file size is not a multiple of cluster size,
then file's tail will be compressed unless it is not smaller
than cplug->min_size_deflate().

Edward.


>
> PS: sorry, if this thread could be off topic from mailinglist scope,
> if it is, please notify me :)
>
> Regards,
> Matias
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

