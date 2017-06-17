From: Jose R R <jose.r.r@metztli.com>
Subject: Re: Debian Reiser4
Date: Sat, 17 Jun 2017 06:20:34 -0700
Message-ID: <CAM12Q5SsUU6Tgd=n818dBHWTkRNxjf1naOVB8jogJoQst95TPg@mail.gmail.com>
References: <CAM12Q5RpO04Zy7ZTEO85QCmohox0+UqzBDihCjEszZ2VckRSSA@mail.gmail.com>
 <4103581495868794@web31g.yandex.ru>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=F09KSEhELx0Z0F8Qrwf9BD7bfbguFgoUOEIz2hMMjQg=;
        b=kiyhlfE+oAFKJH4tbJGnsFYHio5dFQwZtekD0EnTcQPHIyLdBci6ATg2mnbLv3837h
         e7ZecZ0zxZ7Cqwca/e179H0X4d2cqkQI75ARUteL8wrLsyDWdZDvb48r1y0ZsEfcAZzo
         bWrXa7Toxp7XGw4RCmZOOVLcJi+8LSkLt+YGVprVi2Fw2GKXQSPfNQQTnf8vaTXaBxrn
         1YGZf7aNd4utYr5HoUn5Q1tSmEl8kIZ6g8vi+u5cLLR6pY244wujlHtl0DwvsOvWZHKM
         Y/CQ7y2AQlzltVAvZ37cdIDxytYszGhRwo1Y0KbshA78x33d0ucPVur1oacacJnxawqo
         ZF2g==
In-Reply-To: <4103581495868794@web31g.yandex.ru>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ladislav Bodnar <ladislav@distrowatch.com>
Cc: debian-boot@lists.debian.org, debian-devel@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Good day, Ladislav-



On Sat, May 27, 2017 at 12:06 AM, Ladislav Bodnar
<ladislav@distrowatch.com> wrote:
> 27.05.2017, 15:03, "Jose R R" <jose.r.r@metztli.com>:
>> It has as base the official Debian Jessie AMD64 distribution:
>> < https://sf.net/projects/debian-reiser4/ >
>
> The word "Debian" is registered trademark. Please find another name for your
> distribution.
>
> Ladislav

Taking heed of your advice, and on the occasion of June 17, 2017, the
official Debian Stretch release date, I hereby let you know that I
have created alternate Stretch web name for referenced project:
Metztli Reiser4 < https://sf.net/projects/metztli-reiser4/ > so as not
to infringe on Debian's trademark.

In this new debian-installer I began experimenting with Reiser4
-patched experimental kernel 'trunk' -- made available by DD Ben --
advancing gradually until I achieved Linux kernel
4.11.4-1+reiser4.0.1. Which is the kernel that I uploaded and released
on @sourceforge today. Thus, I believe is the only reiser4 -enabled
Stretch released with Linux kernel 4.11 (please note some of the
images reference 'trunk' from my prior experiments).

I have stripped nano editor from the installer and replaced it with
excellent xvi editor < https://github.com/martinwguy/xvi >; and as a
backup there remains elvis-tiny wrapped by vi. Although my testing has
been on limited hardware and cloud environments, I think those
referenced vi-clones will be dormant and awakened to 'save the day'
during unanticipated situations.

Even for a non-expert installation, Metztli-Reiser4 for AMD64 makes
sure to install the reiser4 -enabled kernel at the end of the routine.


Best Professional Regards.


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli-Reiser4: Debian Stretch with Linux 4.11
---------------------------------------------------------------------------------------------
for AMD64 https://sf.net/projects/metztli-reiser4/
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
