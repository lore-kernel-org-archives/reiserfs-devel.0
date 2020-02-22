From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 patch for 5.5.1 and fs/fs-writeback.c
Date: Sat, 22 Feb 2020 12:56:16 +0100
Message-ID: <6e90d853-593c-223a-c529-1f8724907bbe@gmail.com>
References: <20200222045124.740D350BE086@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=8gItbl0BmsMbkpCCr7qxktK9zEPjbUusLMVAYrKVXZc=;
        b=gtd24RcCI7Y4eWjwbKgdSmRNHJJHsNQeA/89/Svj02Q9i1I9CmcUxA2xeBtMEv7ZBP
         Y7x/yd7+NZdJo1CYFE/slofaI6APGNN+WVoLr2QJr7qKUOsIhcRG6hGlKUBYsr1+t1mr
         a6alVC6UczsGc5W8msMneA5NOmDGJ2SdnOCqCPkudMWuTxg2ANLCPWxPgHP6A9rOJTFY
         HaQT0UC1snmYUb23stXb0aLfZSOWNFEiWd3AdFhHEB8zprMDVkrPk9Y3cvIA67od/gse
         fxDajWFhiEbIBL+LfZQG2fDYpdtEEhlGshvZS6IJj2vX4iqe6rNbNBdtMPzjPlTb6fiQ
         mgCQ==
In-Reply-To: <20200222045124.740D350BE086@huitzilopochtli.metztli-it.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Metztli Information Technology <jose.r.r@metztli.com>, reiserfs-devel@vger.kernel.org

On 02/22/2020 05:51 AM, Metztli Information Technology wrote:
> Niltze, Ed-
>
> Starting with kernel 5.4.19, linux/fs/fs-writeback.c , at line 2066, changes
> from
> set_worker_desc("flush-%s", dev_name(wb->bdi->dev));
>
> to
> set_worker_desc("flush-%s", bdi_dev_name(wb->bdi));
>
> I realized that when I was hacking 5.4.19 and, subsequently, my currently running kernel --as there was no RC3:
>
> uname -a
> Linux huitzilopochtli 5.4.0-4+reiser4.0.2-amd64 #1 SMP Debian 5.4.20-1+reiser4.0.2 (2020-02-14) x86_64 GNU/Linux
>
> < https://sourceforge.net/projects/metztli-reiser4/files/Reiser4-SFRN-4.0.2_Linux-5.4.20-1-RC2_for-Debian_Buster/ >
>
>
> I have just built 5.5.5-1 and realized, upon applying reiser4-for-5.5.1.patch.gz, that your patch should be modified
>   accordingly; else, the patch will fail and will necessitate manual intervention, i.e., similar to 5.4.18 vs 5.4.19:
>
> < https://metztli.it/readOnlyEphemeral/fs-writeback_c.png >

so, everything works fine after that "manual intervention"?
