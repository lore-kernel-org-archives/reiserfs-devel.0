From: Jose R R <jose.r.r@metztli.com>
Subject: Re: [PATCH] reiser4: fixed bug in reiser4_kill_root()
Date: Thu, 9 Nov 2017 05:14:36 -0800
Message-ID: <CAM12Q5R=pJNgnOGBq3SRrsUJZksXGSNN6UAaXjX5cisN2fGaLA@mail.gmail.com>
References: <f5afe7c5-fd0f-d9d1-5f44-7041858f495f@gmail.com> <CAM12Q5RvGnb6_NdddYzykpG6j=uL0qPyJXoTkDTwk9oT6Boneg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=NdfrfQ/kPuY6aP2BRIugHNs1iwYefvUjqEp20q3RDuk=;
        b=Bw0Dq1lxHICIpye2JLc/SM1Vcl87hMPxQD0+adXAo5Rsqi1VQmnTal0pt7LlKbdyVy
         s9wGQCFvnqZDh6M4c6pBNUDi/0AwGxvaRIWvkhTOi8lT/1+B4yIXWjjAa//j8kc6o7r1
         z7dNfbGmFXZSgtGPVg+ceiHha3w0AMqrRsdBs/8BCh2EgKs9BKiI6WI+JfA4gLmL0kJA
         1kdTyt51YlUaoojfujoNtnZ6uF1LPnI7bL8LQuOKSxhJ4Wuy1sGTcFxvJfiocEJA56zU
         RrbqztoFh1J83BKZqVlgcE0MuZG01JQjxeUN4UYFDKb5GpFChdJpTocbE5JkOb5rpB48
         uhcQ==
In-Reply-To: <CAM12Q5RvGnb6_NdddYzykpG6j=uL0qPyJXoTkDTwk9oT6Boneg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

On Wed, Nov 8, 2017 at 7:31 PM, Jose R R <jose.r.r@metztli.com> wrote:
> On Wed, Nov 8, 2017 at 12:50 PM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>> Hi all,
>>
>> Probably, this is the most essential "old sleeping" bug
>> found for the latest 3 years. It could lead to data corruption
>> (not proven). Details are in the changeset.
>> It will go to reiser4-for-4.13.1 and higher. For other
>> stuff please, apply (backport, etc) by yourself.
>>
>
> Much appreciated, Edward.
>
> I will apply patch during my build of Linux 4.13.12 for Debian --
> later in the evening/night -- to give it a spin.

Done: wrapped upstream Linux 4.13.12 into (latest) Debian packaging
for Linux 4.13.11-1 and modified version accordingly for
stretch-backports:
< https://sourceforge.net/projects/metztli-reiser4/files/Reiser4-Linux-4.13.12-1_for-Stretch/
>
>
> uname -a
> Linux huitzilopochtli 4.13.0-1+reiser4.0.1-amd64 #1 SMP Debian
> 4.13.11-1+reiser4.0.1 (2017-11-03) x86_64 GNU/Linux
>
Giving a spin to latest bugfix in transparent-compression environment:
uname -a
Linux huitzilopochtli 4.13.0-1+reiser4.0.1-amd64 #1 SMP Debian
4.13.12-1+reiser4.0.1 (2017-11-04) x86_64 GNU/Linux

Thanks again, Ed.


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch with Linux 4.12
---------------------------------------------------------------------------------------------
for AMD64 https://sf.net/projects/metztli-reiser4/
