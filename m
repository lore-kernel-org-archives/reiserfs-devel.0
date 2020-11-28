From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4progs 2.0.4 SFRN5 warnings during Debian Buster AMD64
 builds
Date: Sat, 28 Nov 2020 13:21:28 +0100
Message-ID: <58236ce8-d824-4d59-6fdd-1d14a393dda5@gmail.com>
References: <20201128073904.28F7E71BAB5B@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=KVhhWQype0NBKYxoEjuYHRsU1J5QRlkGsbFrqhs2oTc=;
        b=MtpWM3I1Ng38YqQ5ke7JQDGUGdBITPYMoj0vufmy0CYvLhRbTEuzEGKo93H1gGo06A
         7hCgnSdJl3hv3KGmaen9Faq2EmuQY58BShG2AFi1ZLEPxXxD2GXMR1BrU/nevASF4rHp
         8njHtOcb/zCEJsrHe+qYJb60zYTGaaXKeChxxX80Z/f0+2Z0Z+mRGjpsWjAIXWGKxUfw
         Ls/B+cwUjmr49GxUeiUDf1uVgpfvKynWoWVIGb+mVzT0Ink9yltMGUoR+QhIFOAGiRQV
         a/7oCBHjoxERiIBxh2PiPFSvHVeWK3m1IdGa39lRKFlP0WopYqHTP3wH8IIY6hZDgqqv
         53hA==
In-Reply-To: <20201128073904.28F7E71BAB5B@huitzilopochtli.metztli-it.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Metztli Information Technology <jose.r.r@metztli.com>, reiserfs-devel@vger.kernel.org

On 11/28/2020 08:39 AM, Metztli Information Technology wrote:
> Niltze [Hello] Ed-

Hello.

> 
> This afternoon/evening I built reiser4progs 2.0.4 SFRN 5.1.3 DEB/UDEB packages for Debian Buster backports AMD64.
> 
> I was somewhat concerned about the copious warnings -- which can be located using grep on the log attached below.

It's all cosmetic.
Some fixups should be ported from the master branch.

> 
> And simply wanted to confirm with you those will not introduce unintended results in the utilities built:
> 
> mkfs.reiser4
> fsck.reiser4
> volume.reiser4
> measurefs.reiser4
> debugfs.reiser4 >
> Best Professional Regards.
> 
> P.S. There is a typo in
> 
> 
> ---
>   doc/volume.reiser4.8 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/doc/volume.reiser4.8 b/doc/volume.reiser4.8
> index f2a3485..874b7c5 100644
> --- a/doc/volume.reiser4.8
> +++ b/doc/volume.reiser4.8
> @@ -63,7 +63,7 @@ Print information about a brick of serial number N in the volume mounted at MNT.
>   Run a balancing procedure on a volume mounted at MNT.
>   .TP
>   .B -z, --resize DEV
> -Change data capacity of a brick accociated with device DEV in the
> +Change data capacity of a brick associated with device DEV in the

Thanks,
Edward.
